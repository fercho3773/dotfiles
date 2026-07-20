-- .tex snippets
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

  -- other 
  --as({ trig = "tex"    },      { t("\\Tex") }),
  --as({ trig = "latex"    },      { t("\\LaTeX") }),
  
  -- greek letters
  s({ trig = "alp"    },      { t("\\alpha") }),
  s({ trig = "beta"   },      { t("\\beta") }),
  s({ trig = "gamma"  },      { t("\\gamma") }),
  s({ trig = "delta"  },      { t("\\delta") }),
  s({ trig = "eps"    },      { t("\\epsilon") }),
  s({ trig = "veps"   },      { t("\\varepsilon") }),
  s({ trig = "zeta"   },      { t("\\zeta") }),
  s({ trig = "eta"    },      { t("\\eta") }),
  s({ trig = "theta"  },      { t("\\theta") }),
  s({ trig = "vtheta" },      { t("\\vartheta") }),
  s({ trig = "iota"   },      { t("\\iota") }),
  s({ trig = "kappa"  },      { t("\\kappa") }),
  s({ trig = "lambda" },      { t("\\lambda") }),
  s({ trig = "mu"     },      { t("\\mu") }),
  s({ trig = "nu"     },      { t("\\nu") }),
  s({ trig = "xi"     },      { t("\\xi") }),
  s({ trig = "pi"     },      { t("\\pi") }),
  s({ trig = "vpi"    },      { t("\\varpi") }),
  s({ trig = "rho"    },      { t("\\rho") }),
  s({ trig = "vrho"   },      { t("\\varrho") }),
  s({ trig = "sigma"  },      { t("\\sigma") }),
  s({ trig = "vsigma" },      { t("\\varsigma") }),
  s({ trig = "tau"    },      { t("\\tau") }),
  s({ trig = "ups"    },      { t("\\upsilon") }),
  s({ trig = "phi"    },      { t("\\phi") }),
  s({ trig = "vphi"   },      { t("\\varphi") }),
  s({ trig = "chi"    },      { t("\\chi") }),
  s({ trig = "psi"    },      { t("\\psi") }),
  s({ trig = "omega"  },      { t("\\omega") }),

  -- greek letters capital
  s({ trig = "Gamma"  },      { t("\\Gamma") }),
  s({ trig = "Delta"  },      { t("\\Delta") }),
  s({ trig = "Theta"  },      { t("\\Theta") }),
  s({ trig = "Lambda" },      { t("\\Lambda") }),
  s({ trig = "Xi"     },      { t("\\Xi") }),
  s({ trig = "Pi"     },      { t("\\Pi") }),
  s({ trig = "Sigma"  },      { t("\\Sigma") }),
  s({ trig = "Ups"    },      { t("\\Upsilon") }),
  s({ trig = "Phi"    },      { t("\\Phi") }),
  s({ trig = "Psi"    },      { t("\\Psi") }),
  s({ trig = "Omega"  },      { t("\\Omega") }),

  -- symbols
  as({ trig = "enie"  },      { t("\\~n")    }),
  as({ trig = "pss"   },      { t("\\plus")  }),
  as({ trig = "mss"   },      { t("\\minus")  }),

  s({ trig = "inf"    },      { t("\\infty") }),
  s({ trig = "sum"    },      { t("\\sum") }),
  s({ trig = "prod"   },      { t("\\prod") }),
  
  s({ trig = "oint"   },      { t("\\oint") }),
  s({ trig = "pa"     },      { t("\\partial") }),
  s({ trig = "nab"    },      { t("\\nabla") }),
  s({ trig = "cdot"   },      { t("\\cdot") }),
  s({ trig = "xx"     },      { t("\\times") }),
  s({ trig = "divv"   },      { t("\\div") }),
  s({ trig = "plusminus"  },  { t("\\pm") }),
  s({ trig = "minusplus"  },  { t("\\mp") }),
  s({ trig = "leq" },     { t("\\leq") }),
  s({ trig = "geq" },     { t("\\geq") }),
  s({ trig = "neq" },     { t("\\neq") }),
  s({ trig = "approx" },  { t("\\approx") }),
  s({ trig = "sim" },     { t("\\sim") }),
  s({ trig = "simeq" },   { t("\\simeq") }),
  s({ trig = "cong" },    { t("\\cong") }),
  s({ trig = "equiv" },   { t("\\equiv") }),
  s({ trig = "propto" },  { t("\\propto") }),
  s({ trig = "inn" },     { t("\\in") }),
  s({ trig = "notin" },   { t("\\notin") }),
  s({ trig = "ni" },      { t("\\ni") }),
 
  s({ trig = "subset" },  { t("\\subset") }),
  s({ trig = "subeq" },   { t("\\subseteq") }),
  s({ trig = "supset" },  { t("\\supset") }),
  s({ trig = "supeq" },   { t("\\supseteq") }),
  s({ trig = "setm" },    { t("\\setminus") }),
 
  s({ trig = "neg" },     { t("\\neg") }),
  s({ trig = "wedge" },   { t("\\wedge") }),
  s({ trig = "vee" },     { t("\\vee") }),
  s({ trig = "oplus" },   { t("\\oplus") }),
  s({ trig = "otimes" },  { t("\\otimes") }),
  s({ trig = "perp" },    { t("\\perp") }),
  s({ trig = "para" },    { t("\\parallel") }),
  s({ trig = "angle" },   { t("\\angle") }),
  s({ trig = "tf" },      { t("\\therefore") }),
  s({ trig = "bc" },      { t("\\because") }),
 
  -- dots
  as({ trig = "ldd" },   { t("\\ldots") }),
  as({ trig = "cdd" },   { t("\\cdots") }),
  as({ trig = "vdd" },   { t("\\vdots") }),
  
  s({ trig = "ldots" },   { t("\\ldots") }),
  s({ trig = "cdots" },   { t("\\cdots") }),
  s({ trig = "vdots" },   { t("\\vdots") }),
  s({ trig = "ddots" },   { t("\\ddots") }),

  -- arrows
  s({ trig = "to" },      { t("\\to") }),
  s({ trig = "ra" },      { t("\\rightarrow") }),
  s({ trig = "Ra" },      { t("\\Rightarrow") }),
  s({ trig = "la" },      { t("\\leftarrow") }),
  s({ trig = "La" },      { t("\\Leftarrow") }),
  s({ trig = "lra" },     { t("\\leftrightarrow") }),
  s({ trig = "Lra" },     { t("\\Leftrightarrow") }),
  s({ trig = "mapsto" },  { t("\\mapsto") }),
  s({ trig = "lmapsto" }, { t("\\longmapsto") }),
  --s({ trig = "uarr" },    { t("\\uparrow") }),
  --s({ trig = "darr" },    { t("\\downarrow") }),

  -- trig functions
  as({ trig = "siin" },  { t("\\sin(") , i(1), t(")"), i(0) }),
  as({ trig = "coos" },  { t("\\cos("), i(1), t(")"), i(0) }),
  as({ trig = "taan" },  { t("\\tan("), i(1), t(")"), i(0) }),
  as({ trig = "cssc" },  { t("\\csc("), i(1), t(")"), i(0) }),
  as({ trig = "seec" },  { t("\\sec("), i(1), t(")"), i(0) }),
  as({ trig = "coot" },  { t("\\cot("), i(1), t(")"), i(0) }),
  as({ trig = "nlog" },   { t("\\ln("), i(1), t(")"), i(0) }),
  
  s({ trig = "logg" }, { t("\\log("), i(1), t(")"), i(0) }),
  s({ trig = "expp" }, { t("e^{"), i(1), t("}"), i(0) }),
  s({ trig = "senh" }, { t("\\sinh("), i(1), t(")"), i(0) }),
  s({ trig = "cosh" }, { t("\\cosh("), i(1), t(")"), i(0) }),
  s({ trig = "tanh" }, { t("\\tanh("), i(1), t(")"), i(0) }),
  s({ trig = "ln"   },   { t("\\ln("), i(1), t(")"), i(0) }),

  -- numbers sets
  -- real, naturals, integers, ...
  as({ trig = "rr5" }, { t("\\mathbb{R}^{5}") }),
  as({ trig = "rr4" }, { t("\\mathbb{R}^{4}") }),
  as({ trig = "rr3" }, { t("\\mathbb{R}^{3}") }),
  as({ trig = "rr2" }, { t("\\mathbb{R}^{2}") }),
  as({ trig = "rrm" }, { t("\\mathbb{R}^{m}") }),
  as({ trig = "rrn" }, { t("\\mathbb{R}^{n}") }),
  as({ trig = "rrr" }, { t("\\mathbb{R}") }),
  as({ trig = "nn" }, { t("\\mathbb{N}") }),
  as({ trig = "zz" }, { t("\\mathbb{Z}") }),
  as({ trig = "qq" }, { t("\\mathbb{Q}") }),
  as({ trig = "cc" }, { t("\\mathbb{C}") }), 

  s({ trig = "RR" },  { t("\\mathbb{R}") }),
  s({ trig = "NN" },  { t("\\mathbb{N}") }),
  s({ trig = "ZZ" },  { t("\\mathbb{Z}") }),
  s({ trig = "QQ" },  { t("\\mathbb{Q}") }),
  s({ trig = "CC" },  { t("\\mathbb{C}") }),

  -- logic and sets
  as({ trig = "exx"     },    { t("\\exists") }),
  as({ trig = "faa"     },    { t("\\forall") }),
  as({ trig = "land"    },    { t("\\land")   }),
  as({ trig = "lor"     },    { t("\\lor")            }),
  as({ trig = "elor"    },    { t("\\veebar")         }),
  as({ trig = "iimp"    },    { t("\\Longrightarrow") }),
  as({ trig = "iff"     },    { t("\\iff")          }),
  as({ trig = "tfore"   },    { t("\\therefore")    }),
  as({ trig = "qed"     },    { t("\\blacksquare")  }),
  as({ trig = "empp"    },    { t("\\emptyset") }),

  s({ trig = "emptyset" },    { t("\\emptyset") }),
  s({ trig = "exists" },      { t("\\exists") }),
  s({ trig = "forall" },      { t("\\forall") }),
  s({ trig = "subset" },      { t("\\subset") }),

  -- sets
  as({ trig = "setm" },      { t("\\setminus") }),
  as({ trig = "ccap" },      { t("\\cap")      }),
  as({ trig = "ccup" },      { t("\\cup")      }),
  as({ trig = "notin"},     { t("\\notin")    }),
  as({ trig = "setin"},     { t("\\setin")    }),

  s({ trig = "aleph" },     { t("\\aleph") }),
  s({ trig = "setminus" },  { t("\\setminus") }),
  
  -- order
  as({ trig = "eqq"  },     { t("=")}),
  as({ trig = "ltt"  },     { t("<")}),
  as({ trig = "gtt"  },     { t(">")}),
  as({ trig = "leq"  },     { t("\\leq")}),
  as({ trig = "geq"  },     { t("\\geq")}),
  
  as({ trig = "neq"  },      { t("\\neq")}),
  as({ trig = "defq" },      { t(":=")}),

  -- geometry
  as({ trig = "angg"  },     { t("\\angle")}),
  as({ trig = "trabc" },     { t("\\triangle{A B C}")}),
  as({ trig = "perp"  },     { t("\\perp")}),
  as({ trig = "noperp"},     { t("\\noperp")}),

  s({ trig = "triag"  },     { t("\\triangle") }),
  s({ trig = "box"    },     { t("\\box") }),

  -- functions
  as({ trig = "fxx" },       { t("f(x)")}),
  as({ trig = "gxx" },       { t("g(x)")}),
  as({ trig = "hxx" },       { t("h(x)")}),

  as({ trig = "fyy" },       { t("f(y)")}),
  as({ trig = "gyy" },       { t("g(y)")}),
  as({ trig = "hyy" },       { t("h(y)")}),

  as({ trig = "fzz" },       { t("f(z)")}),
  as({ trig = "gzz" },       { t("g(z)")}),
  as({ trig = "hzz" },       { t("h(z)")}),

  s({ trig = "comp" },       { t("\\circ")}),

  -- calculus
  as({ trig = "intab" },     { t("\\int_{a}^{b}")  }),
  as({ trig = "intt"  },     { t("\\integral")     }),
  as({ trig = "inff"  },     { t("\\infty")        }), 

  as({ trig = "difx"  },     { t("\\diff{x}"  )    }), 
  as({ trig = "dify"  },     { t("\\diff{y}"  )    }), 
  as({ trig = "difz"  },     { t("\\diff{z}"  )    }), 

  s({ trig = "double_integral"  },      { t("\\iint") }),
  s({ trig = "triple_integral"  },      { t("\\iiint")}),
  
  -- inverses
  as({ trig = "xinv"  },     { t("\\x^{-1}")       }), 
  as({ trig = "yinv"  },     { t("\\y^{-1}")       }), 
  as({ trig = "zinv"  },     { t("\\z^{-1}")       }), 
  
  as({ trig = ".inv" }, { t("^{-1}") }),
  s({ trig = "inv" }, { t("^{-1}") }),

  -- algebra
  -- fraction
  as({ trig = ".frac" }, {
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0),
  }),

  -- squareroot
  as({ trig = "sqq2"  },     { t("\\sqrt^{2}")       }), 
  as({ trig = "sqq3"  },     { t("\\sqrt^{3}")       }), 
  as({ trig = "sqq5"  },     { t("\\sqrt^{5}")       }), 
  as({ trig = "sqq7"  },     { t("\\sqrt^{7}")       }), 
  
  as({ trig = "sqrt" }, {
    t("\\sqrt{"), i(1), t("}"), i(0),
  }),

  as({ trig = "nroot" }, {
    t("\\sqrt["), i(1, "n"), t("]{"), i(2), t("}"), i(0),
  }),

  -- binom
  s({ trig = "binom" }, {
    t("\\binom{"), i(1), t("}{"), i(2), t("}"), 
    i(0),
  }),

  s({ trig = "sq" }, { t("^2") }),
  s({ trig = "cb" }, { t("^3") }),

  -- subscript and superscr
  s({ trig = "^^" }, { t("^{"), i(1), t("}"), i(0) }),
  s({ trig = "__" }, { t("_{"), i(1), t("}"), i(0) }),

  -- absolute value
  s({ trig = "vabs" }, {
    t("\\left|"), i(1), t("\\right|"), i(0),
  }),

  -- norm
  s({ trig = "norm" }, {
    t("\\left\\|"), i(1), t("\\right\\|"), i(0),
  }),

  -- Conjunto: setb -> \{ \}
  s({ trig = "setb" }, {
    t("\\{"), i(1), t("\\}"), i(0),
  }),


  -- calculus
  -- limit 
  -- lim -> \lim_{x \to a}
  s({ trig = "lim" }, {
    t("\\lim_{"), i(1, "x"), t(" \\to "), i(2, "a"), t("}"), i(0),
  }),

  -- prime
  as({ trig = "xprime" }, { t("\\x^{prime}"), i(0) }),
  as({ trig = "yprime" }, { t("\\y^{prime}"), i(0) }),
  as({ trig = "zprime" }, { t("\\z^{prime}"), i(0) }),
  
  -- vectors
  as({ trig = "ahat"  },  { t("\\hat{a}"), i(0) }),
  as({ trig = "bhat"  },  { t("\\hat{b}"), i(0) }),
  as({ trig = "chat"  },  { t("\\hat{c}"), i(0) }),
  as({ trig = "ihat"  },  { t("\\hat{i}"), i(0) }),
  as({ trig = "jhat"  },  { t("\\hat{j}"), i(0) }),
  as({ trig = "khat"  },  { t("\\hat{k}"), i(0) }),
  as({ trig = "xhat"  },  { t("\\hat{x}"), i(0) }),
  as({ trig = "yhat"  },  { t("\\hat{y}"), i(0) }),
  as({ trig = "zhat"  },  { t("\\hat{z}"), i(0) }),
  
  as({ trig = ".cross"  },  { t("\\times"), i(0) }),

  s({ trig = "times" }, { t("\\times{"), i(1), t("}"), i(0) }),


  s({ trig = "vec" }, { t("\\vec{"), i(1), t("}"), i(0) }),
  s({ trig = "hat" }, { t("\\hat{"), i(1), t("}"), i(0) }),
  s({ trig = "bar" }, { t("\\bar{"), i(1), t("}"), i(0) }),
  s({ trig = "dot" }, { t("\\dot{"), i(1), t("}"), i(0) }),
  s({ trig = "tilde" }, { t("\\tilde{"), i(1), t("}"), i(0) }),
  s({ trig = "widehat" }, { t("\\widehat{"), i(1), t("}"), i(0) }),

  -- ordered pair

  -- matrix 2x2
  s({ trig = "mat22" }, {
    t({ "\\begin{pmatrix}", "" }),
    i(1, "a"), t(" & "), i(2, "b"), t({ " \\\\", "" }),
    i(3, "c"), t(" & "), i(4, "d"), 
    t({ "", "\\end{pmatrix}" }),
    i(0),
  }),

  -- matrix 3x3
  s({ trig = "mat33" }, {
    t({ "\\begin{pmatrix}", "" }),
    i(1, "."), t(" & "), i(2, "."), t(" & "), i(3, "."), t({ " \\\\", "" }),
    i(4, "."), t(" & "), i(5, "."), t(" & "), i(6, "."), t({ " \\\\", "" }),
    i(7, "."), t(" & "), i(8, "."), t(" & "), i(9, "."), 
    t({ "", "\\end{pmatrix}" }),
    i(0),
  }),
  -- matrix 2x3
  s({ trig = "mat23" }, {
    t({ "\\begin{pmatrix}", "" }),
    i(1, "a"), t(" & "), i(2, "b"), t(" & "), i(3, "c"), t({ " \\\\", "" }),
    i(4, "d"), t(" & "), i(5, "e"), t(" & "), i(6, "f"), 
    t({ "", "\\end{pmatrix}" }),
    i(0),
  }),

  -- matrix 3x2
  s({ trig = "mat32" }, {
    t({ "\\begin{pmatrix}", "" }),
    i(1, "a"), t(" & "), i(2, "b"), t({ " \\\\", "" }),
    i(3, "c"), t(" & "), i(4, "d"), t({ " \\\\", "" }),
    i(5, "e"), t(" & "), i(6, "f"), 
    t({ "", "\\end{pmatrix}" }),
    i(0),
  }),

  
  -- bmat
  s({ trig = "bmat" }, {
    t({ "\\begin{bmatrix}", "" }),
    i(1), t(" & "), i(2), t({ " \\\\", "" }),
    i(3), t(" & "), i(4), t({ "", 
    "\\end{bmatrix}" }),
    i(0),
  }),

  -- determinant
  s({ trig = "vmat" }, {
    t({ "\\begin{vmatrix}", "" }),
    i(1), t(" & "), i(2), t({ " \\\\", "" }),
    i(3), t(" & "), i(4), t({ "", "\\end{vmatrix}" }),
    i(0),
  }),

  -- cases
  s({ trig = "cases", condition = lb }, {
    t({ "\\begin{cases}", "" }),
    i(1), t(" & \\text{ si } "), i(2), t({ " \\\\", "" }),
    i(3), t(" & \\text{ si } "), i(4), 
    t({ "", "\\end{cases}" }),
    i(0),
  }),

  -- align
  s({ trig = "align", condition = lb }, {
    t({ "\\begin{align}", "" }),
    i(1), t(" &= "), i(2), 
    t({ "", "\\end{align}" }),
    i(0),
  }),

  -- equation
  as({ trig = ".eq", condition = lb }, {
    t({ "\\begin{equation}", "" }),
    i(1),
    t({ "", "\\end{equation}" }),
    i(0),
    --
  }),
--
--
}

-- s({ trig = "limn" }, {
--    t("\\lim_{"), i(1, "n"), t(" \\to \\infty}"), i(0),
--  }),

-- Derivada: dv -> \frac{d}{dx}
--  s({ trig = "dv" }, {
--    t("\\frac{d"), i(1), t("}{d"), i(2, "x"), t("}"), i(0),
--  }),

-- Segunda derivada: dv2 -> \frac{d^2}{dx^2}
--  s({ trig = "dv2" }, {
--    t("\\frac{d^2"), i(1), t("}{d"), i(2, "x"), t("^2}"), i(0),
--  }),

-- Derivada parcial: pdv -> \frac{\partial}{\partial x}
--  s({ trig = "pdv" }, {
--    t("\\frac{\\partial "), i(1), t("}{\\partial "), i(2, "x"), t("}"), i(0),
--  }),

-- Segunda derivada parcial: pdv2 -> \frac{\partial^2}{\partial x^2}
--  s({ trig = "pdv2" }, {
--    t("\\frac{\\partial^2 "), i(1), t("}{\\partial "), i(2, "x"), t("^2}"), i(0),
--  }),

-- Derivada parcial mixta: pdvm -> \frac{\partial^2 f}{\partial x \partial y}
--  s({ trig = "pdvm" }, {
--    t("\\frac{\\partial^2 "), i(1, "f"), t("}{\\partial "), i(2, "x"),
--    t(" \\partial "), i(3, "y"), t("}"), i(0),
--  }),

-- Sumatoria con límites: sumn -> \sum_{i=1}^{n}
--  s({ trig = "sumn" }, {
--    t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("}"), i(0),
--  }),

-- Productoria con límites: prodn -> \prod_{i=1}^{n}
--  s({ trig = "prodn" }, {
--    t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("}"), i(0),
--  }),

-- Integral definida: intn -> \int_{a}^{b}
--  s({ trig = "intn" }, {
--    t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("}"), i(0),
--  }),

-- Integral definida completa: intf -> \int_{a}^{b} f(x)\,dx
--  s({ trig = "intf" }, {
--    t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("} "),
-- }),
--    i(3, "f(x)"), t("\\,d"), i(4, "x"), i(0),

-- taylorseries
--  s({ trig = "taylor" }, {
--    t("\\sum_{n=0}^{\\infty} \\frac{f^{(n)}("), i(1, "a"),
--    t(")}{n!}(x-"), i(2, "a"), t(")^n"), i(0),
--  }),


