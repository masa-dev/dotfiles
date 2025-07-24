local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- TSDoc Comment
  s("/**", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " */" }),
    i(0),
  }),

  -- TSDoc with parameters
  s("/*p", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @param " }),
    i(2, "paramName"),
    t(" - "),
    i(3, "Parameter description"),
    t({ "", " */" }),
    i(0),
  }),

  -- TSDoc with return
  s("/*r", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @returns " }),
    i(2, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- TSDoc full
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

  -- TSDoc with example
  s("/*e", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @example" }),
    t({ "", " * ```typescript" }),
    t({ "", " * " }),
    i(2, "example code"),
    t({ "", " * ```" }),
    t({ "", " */" }),
    i(0),
  }),

  -- TSDoc with generic type
  s("/*g", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @template " }),
    i(2, "T"),
    t(" - "),
    i(3, "Type parameter description"),
    t({ "", " * @param " }),
    i(4, "paramName"),
    t(" - "),
    i(5, "Parameter description"),
    t({ "", " * @returns " }),
    i(6, "Return description"),
    t({ "", " */" }),
    i(0),
  }),
}

