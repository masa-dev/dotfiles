-- 行番号の表示
vim.opt.number = true
-- マウスモードの有効化
vim.opt.mouse = "a"
-- モードの表示をしない。ステータスラインに既に表示されているため
vim.opt.showmode = false
-- クリップボードを同期する
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- インデントの自動折り返し
vim.opt.breakindent = true
-- タブを空白にする、幅をスペース4に設定
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Undo履歴を保存
vim.opt.undofile = true

-- 検索時、大文字が含まれない場合は大文字小文字を区別しない。
--  ただし、\C や大文字が含まれる場合は区別する
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- サインカラム（左のマーク表示領域）をデフォルトで表示する
vim.opt.signcolumn = "yes"

-- 更新間隔を短くする
vim.opt.updatetime = 250

-- キーマッピングのシーケンス待機時間を短くする
-- which-keyプラグインのポップアップが早く表示されるようになる
vim.opt.timeoutlen = 300

-- 新しいスプリットウィンドウを開く場所を設定
vim.opt.splitright = true -- 右に開く
vim.opt.splitbelow = true -- 下に開く

-- Neovimが特定の空白文字をどのように表示するかを設定
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- 置換の結果をリアルタイムでプレビューする
vim.opt.inccommand = "split"

-- カーソルがある行を表示する
vim.opt.cursorline = true

-- カーソルの上下に最低限確保する画面行数を設定
vim.opt.scrolloff = 10

vim.opt.termguicolors = true
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
