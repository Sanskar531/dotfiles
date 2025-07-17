require("plugins");
require("set");
require("remap");
require("lsps");

vim.loader.enable();

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "40"
    })
  end,
  group = highlight_group,
  pattern = '*',
})
