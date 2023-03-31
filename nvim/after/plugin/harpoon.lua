local mark = require('harpoon.mark')
local harpoonUi = require('harpoon.ui')

vim.keymap.set('n', "<leader>a", function()
  print("what is this")
  mark.add_file()
end)
vim.keymap.set('n', "<leader>m", harpoonUi.toggle_quick_menu)
vim.keymap.set('n', "<C-n>", harpoonUi.nav_next)
vim.keymap.set('n', "<C-p>", harpoonUi.nav_prev)
