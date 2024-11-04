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
  },
})
