use clap::Parser;
use serde_derive::Deserialize;
use std::process::Command;
use std::{
    collections::VecDeque,
    fs::File,
    io::Read,
};

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

        let mut order: VecDeque<u16> = VecDeque::new();
        let window_info: Vec<WindowInfo> = serde_json::from_str(file_contents.as_str()).unwrap();

        for info in window_info {
            if info.split_child == "first_child" {
                order.push_front(info.id);
            } else if info.split_child == "second_child" {
                order.push_back(info.id);
            }
        }

        for window_id in order {
            warp_into_space(window_id);
        }
    } else {
        println!("Couldn't open file.");
    }
}

fn warp_into_space(id: u16) {
    Command::new("yabai")
        .args(["-m", "window", &id.to_string().as_str(), "--warp", "next"])
        .output()
        .unwrap();
}
