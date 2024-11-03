local neotree = require("neo-tree")

neotree.setup({
  window = {
    mappings = {
      -- <leader> がスペースのため、無効化
      ["<space>"] = "",
    },
  },
})
