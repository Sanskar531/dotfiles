use clap::Parser;
use serde_derive::Deserialize;
use std::process::Command;
use std::{collections::VecDeque, fs::File, io::Read};

#[derive(Parser, Debug)]
struct Args {
    #[arg(short, long)]
    window_output: String,
}

#[derive(Deserialize, Debug)]
struct WindowInfo {
    id: u16,
    #[serde(alias = "split-child")]
    split_child: String,
    frame: Frame,
}

#[derive(Deserialize, Debug, Copy, Clone)]
struct Frame {
    w: f32,
}

fn main() {
    let args = Args::parse();

    let json_file = File::open(args.window_output);

    if let Ok(mut file) = json_file {
        let mut file_contents = String::new();
        if let Err(_) = file.read_to_string(&mut file_contents) {
            println!("Couldn't read file contents.");
            return;
        }

        let mut order: VecDeque<(u16, Frame)> = VecDeque::new();
        let window_info: Vec<WindowInfo> = serde_json::from_str(file_contents.as_str()).unwrap();
        let mut total_width: f32 = 0.0;

        for info in window_info {
            if info.split_child == "first_child" {
                order.push_front((info.id, info.frame));
                total_width += info.frame.w;
            } else if info.split_child == "second_child" {
                order.push_back((info.id, info.frame));
                total_width += info.frame.w;
            }
        }

        restore_state(order, total_width / 2.0);
    } else {
        println!("Couldn't open file.");
    }
}

fn restore_state(order: VecDeque<(u16, Frame)>, mid_width: f32) {
    for (idx, (window_id, frame)) in order.iter().enumerate() {
        let mut cmd = Command::new("yabai");

        cmd.args([
            "-m",
            "window",
            &window_id.to_string().as_str(),
            "--warp",
            "next"
        ]);

        if idx == 1 {
            let offset = mid_width - frame.w;

            cmd.args(["--resize", format!("left:{}:0", offset).as_str()]);
        }

        cmd.output().unwrap();
    }
}
