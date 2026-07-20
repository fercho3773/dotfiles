-- markdown snippets

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local cond = require("luasnip.extras.expand_conditions")
local lb = cond.line_begin

return {
-- pagebreak
as({ trig = ".pb", condition = lb }, { t("","{{< pagebreak >}}", "", ""), i(0) }),


-- yaml front matter 
s({ trig = "yaml_front", condition = lb }, {
  t({ "---",  "title: " }), i(1, "text"),
  t({ "", "author: "   }), i(2, "text"),
  t({ "", "date: "     }), i(3, "text"),
  t({ "", "format: "   }), i(4, "text"),
  t({ "", "---", ""    }),
  i(0),
}),


-- images
s({ trig = "image_single", condition = lb }, {
    t({ "![" }), i(1, "caption1"), t({ "](" }), i(2, "file1"), t({ ")" }),
    i(0),
}),

s({ trig = "image_double", condition = lb }, {
    t({ "::: {layout-ncol=2}", "", "" }),
    t({ "![" }), i(1, "caption1"), t({ "](" }), i(2, "file1"), t({ ")", "", "" }),
    t({ "![" }), i(3, "caption2"), t({ "](" }), i(4, "file2"), t({ ")", "", "", ":::" }),
    i(0),
}),

s({ trig = "image_triple", condition = lb }, {
    t({ "::: {layout-ncol=3}", "", "" }),
    t({ "![" }), i(1, "caption1"), t({ "](" }), i(2, "file1"), t({ ")", "", "" }),
    t({ "![" }), i(3, "caption2"), t({ "](" }), i(4, "file2"), t({ ")", "", "" }),
    t({ "![" }), i(5, "caption3"), t({ "](" }), i(6, "file3"), t({ ")", "", "", ":::" }),
    i(0),
}),

-- code chunks
s({ trig = "r_chunk" }, {
  t({ "```{r}", "" }), 
  i(0), 
  t({ "", "```" }),
}),

s({ trig = "python_chunk" }, {
  t({ "```{python}", "" }), 
  i(0), 
  t({ "", "```" }),
}),

s({ trig = "julia_chunk" }, {
  t({ "```{julia}", "" }), 
  i(0), 
  t({ "", "```" }),
}),

s({ trig = "typst_chunk" }, {
  t({ "```{=typst}", "" }), 
  i(0), 
  t({ "", "```" }),
}),

} 

