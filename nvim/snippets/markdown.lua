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
-- headers/subsections
-- head1/section 
as({ trig = ".ho", condition = lb }, { t("# "), i(0) }),
as({ trig = "h1", condition = lb },   { t("# "), i(0) }),

-- head2/subsection
as({ trig = ".ht", condition = lb }, { t("## "), i(0) }),
as({ trig = "h2", condition = lb },   { t("## "), i(0) }),

-- head/sub-subsection
as({ trig = ".hs", condition = lb }, { t("### "), i(0) }),
as({ trig = "h3", condition = lb },   { t("### "), i(0) }),

-- head4/head5/head6
as({ trig = "h4", condition = lb }, { t("#### "), i(0) }),
as({ trig = "h5", condition = lb }, { t("##### "), i(0) }),
as({ trig = "h6", condition = lb }, { t("###### "), i(0) }),

-- bold
as({ trig = ".bb" }, { t("**"), i(1, "text"), t("**"), i(0) }),        

-- italic
as({ trig = ".ii" }, { t("*"), i(1, "text"), t("*"), i(0) }),

-- bold and italic
as({ trig = ".bi" }, { t("***"), i(1, "text"), t("***"), i(0) }),

--strikeout
as({ trig = ".sk" }, { t("~~"), i(1, "text"), t("~~"), i(0) }),

-- highlight
as({ trig = ".hl" }, { t("=="), i(1, "text"), t("=="), i(0) }),        
 
-- inline code
as({ trig = ".ic" }, { t("`"), i(1, "code"), t("`"), i(0) }),
as({ trig = ".ci" }, { t("`"), i(1, "code"), t("`"), i(0) }),

-- block code
as({ trig = ".cb" }, {
    t("```"), i(1, "lang"), t({ "", "" }),
    i(0),
    t({ "", "```" }),
  }),

-- inline math
as({ trig = ".im" }, { t("$"), i(1), t("$"), i(0) }),
as({ trig = ".mi" }, { t("$"), i(1), t("$"), i(0) }),

-- display math
as({ trig = ".mm" }, { t({ "$$", "" }), i(1), t({ "", "$$" }), i(0) }),

-- web links
-- example: [Github.com](https://github.com)
s({ trig = "mdweblink" }, {
    t("["), i(1, "webpage"), t("]("), i(2, "url"), t(")"), 
    i(0),
}),


--s({ trig = "reflink" }, {
--    t("["), i(1, "texto"), t("]["), i(2, "ref"), t("]"), i(0),
--}),

--s({ trig = "refdef" }, {
--    t("["), i(1, "ref"), t("]: "), i(2, "url"), t(' "'), i(3, "titulo"), t('"'), i(0),
--}),

--s({ trig = "autolink" }, { t("<"), i(1, "https://"), t(">"), i(0) }),

-- lists
--s({ trig = "??", condition = lb }, { t("- "), i(0) }),
--s({ trig = "ol", condition = lb }, { t("1. "), i(0) }),
--as({ trig = "mtaa", condition = cond.line_begin }, { t("- [ ] "), i(0) }),
--as({ trig = "mtxx", condition = cond.line_begin }, { t("- [x] "), i(0) }),

-- separators
-- horizontal rule
as({ trig = "hrule", condition = lb }, { t("---"), i(0) }),

--s({ trig = "qt", condition = lb }, { t("> "), i(0) }),
--s({ trig = "hr", condition = lb }, { t("---"), i(0) }),
--s({ trig = "br" }, { t("  "), t({ "", "" }), i(0) }),

-- tables
s({ trig = "table2", condition = lb }, {
    t({ "| " }), i(1, "Col 1"), t(" | "), i(2, "Col 2"), t({ " |", "" }),
    t({ "| --- | --- |", "" }),
    t("| "), i(3), t(" | "), i(4), t(" |"), i(0),
}),

s({ trig = "table3", condition = lb }, {
  t({ "| " }), i(1, "col 1"), t(" | "), i(2, "col 2"), t(" | "), i(3, "col 3"), t({ " |"}),
  t({ "| --- | --- | --- |", "" }),
  t("| "), i(4), t(" | "), i(5), t(" | "), i(6), t(" |"), 
  i(0),
})

} 



