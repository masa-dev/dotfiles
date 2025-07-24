local neotree = require("neo-tree")

neotree.setup({
  window = {
    mappings = {
      -- <leader> がスペースのため、無効化
      ["<space>"] = "",
    },
  },
  -- Show hidden files by default
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      never_show = {
        ".git",
        ".DS_Store",
      },
    },
    -- フォルダの開閉状態を保持
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true, -- 現在のファイルに移動時にディレクトリを開いたままにする
    },
    -- ディレクトリの状態を記憶
    use_libuv_file_watcher = true,
    -- セッション間でツリーの状態を保存
    group_empty_dirs = false,
  },
  -- セッション保存用の設定
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        -- ツリーが開かれた時の処理
        vim.opt_local.relativenumber = true
      end,
    },
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
  },
  -- デフォルトでルートを展開
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      with_expanders = nil,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
})
