local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Vue JSDoc Comment
  s("/**", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue JSDoc with parameters
  s(
    "/*p",
    {
      t("/**"),
      t({ "", " * " }),
      i(1, "Description"),
      t({ "", " * @param " }),
      i(2, "paramName"),
      t(" - "),
      i(3, "Parameter description"),
      t({ "", " */" }),
      i(0),
    }
  ),

  -- Vue JSDoc with return
  s("/*r", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @returns " }),
    i(2, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue JSDoc full
  s("/*f", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @param " }),
    i(2, "paramName"),
    t(" - "),
    i(3, "Parameter description"),
    t({ "", " * @returns " }),
    i(4, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue component prop documentation
  s("/*prop", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Prop description"),
    t({ "", " * @default " }),
    i(2, "defaultValue"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue emit documentation
  s("/*emit", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Event description"),
    t({ "", " * @param " }),
    i(2, "payload"),
    t(" - "),
    i(3, "Event payload description"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue computed documentation
  s("/*comp", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Computed property description"),
    t({ "", " * @returns " }),
    i(2, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- Vue method documentation
  s("/*method", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Method description"),
    t({ "", " * @param " }),
    i(2, "paramName"),
    t(" - "),
    i(3, "Parameter description"),
    t({ "", " * @returns " }),
    i(4, "Return description"),
    t({ "", " */" }),
    i(0),
  }),
}

