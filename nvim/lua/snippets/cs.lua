local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- XML Documentation Comment
  s("///", {
    t("/// <summary>"),
    t({ "", "/// " }),
    i(1, "Description"),
    t({ "", "/// </summary>" }),
    i(0),
  }),

  -- XML Documentation with parameters
  s("//p", {
    t("/// <summary>"),
    t({ "", "/// " }),
    i(1, "Description"),
    t({ "", "/// </summary>" }),
    t({ "", '/// <param name="' }),
    i(2, "paramName"),
    t('">'),
    i(3, "Parameter description"),
    t("</param>"),
    i(0),
  }),

  -- XML Documentation with return
  s("//r", {
    t("/// <summary>"),
    t({ "", "/// " }),
    i(1, "Description"),
    t({ "", "/// </summary>" }),
    t({ "", "/// <returns>" }),
    i(2, "Return description"),
    t("</returns>"),
    i(0),
  }),

  -- XML Documentation full
  s("//f", {
    t("/// <summary>"),
    t({ "", "/// " }),
    i(1, "Description"),
    t({ "", "/// </summary>" }),
    t({ "", '/// <param name="' }),
    i(2, "paramName"),
    t('">'),
    i(3, "Parameter description"),
    t("</param>"),
    t({ "", "/// <returns>" }),
    i(4, "Return description"),
    t("</returns>"),
    i(0),
  }),
}

