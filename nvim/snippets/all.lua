-- snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local cond = require("luasnip.extras.expand_conditions")
local lb = cond.line_begin

return {
  -- s({})        :: snippet
  -- i("")        :: insert
  -- t("\")       :: latex text
  -- trig = ""    :: trigger
  -- as =({})     :: autosnipppet

  -- symbols
  as({trig= "dpipe"    },  { t("||") }),
  as({trig= "ppipe"     },  { t("|")  }),
  as({trig= "sll"       },  { t("/")  }),
  as({trig= "rll"       },  { t("\\") }),

  s({trig= "double_dollar"      },  { t("$$") }),
  
  -- spanish
  -- as({trig= "tracion"  },  { t("tración") }),


  -- english
}
