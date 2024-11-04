require("Comment").setup()
vim.keymap.set("n", "<C-_>", require("Comment.api").toggle.linewise.current, { noremap = true, silent = true })
vim.keymap.set("i", "<C-_>", require("Comment.api").toggle.linewise.current, { noremap = true, silent = true })
vim.keymap.set(
  "v",
  "<C-_>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { noremap = true, silent = true }
)
