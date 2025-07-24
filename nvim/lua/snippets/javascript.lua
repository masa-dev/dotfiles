local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- JSDoc Comment
  s("/**", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " */" }),
    i(0),
  }),

  -- JSDoc with parameters
  s("/*p", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @param {" }),
    i(2, "type"),
    t("} "),
    i(3, "paramName"),
    t(" - "),
    i(4, "Parameter description"),
    t({ "", " */" }),
    i(0),
  }),

  -- JSDoc with return
  s("/*r", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @returns {" }),
    i(2, "type"),
    t("} "),
    i(3, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- JSDoc full
  s("/*f", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @param {" }),
    i(2, "type"),
    t("} "),
    i(3, "paramName"),
    t(" - "),
    i(4, "Parameter description"),
    t({ "", " * @returns {" }),
    i(5, "type"),
    t("} "),
    i(6, "Return description"),
    t({ "", " */" }),
    i(0),
  }),

  -- JSDoc with example
  s("/*e", {
    t("/**"),
    t({ "", " * " }),
    i(1, "Description"),
    t({ "", " * @example" }),
    t({ "", " * " }),
    i(2, "example code"),
    t({ "", " */" }),
    i(0),
  }),
}

