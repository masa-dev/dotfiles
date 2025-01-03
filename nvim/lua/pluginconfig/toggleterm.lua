require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

function LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tg",
  "<cmd>lua LazygitToggle()<CR>",
  { desc = "[T]oggle [G]it Terminal (lazygit)", noremap = true, silent = true }
)

-- ターミナル
local floatTerm = Terminal:new({
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

function FloatTermToggle()
  floatTerm:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  "<cmd>lua FloatTermToggle()<CR>",
  { desc = "[T]oggle [T]erminal", noremap = true, silent = true }
)
