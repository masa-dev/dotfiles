-- ファイルごとのインデント幅を調整
local filetype_tabstop = { lua = 2, markdown = 2, javascript = 2, csharp = 4 }
local usrftcfg = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = usrftcfg,
  callback = function(args)
    local ftts = filetype_tabstop[args.match]
    if ftts then
      vim.bo.tabstop = ftts
      vim.bo.shiftwidth = ftts
    end
  end,
})
