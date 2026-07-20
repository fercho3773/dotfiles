local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local cond = require("luasnip.extras.expand_conditions")
local lb = cond.line_begin


return {
  s({ trig = "chapter" }, { t("\\chapter{"), i(1), t("}"), i(0),  }),
  s({ trig = "section" }, { t("\\section{"), i(1), t("}"), i(0),  }),
  s({ trig = "subsection" }, { t("\\subsection{"), i(1), t("}"), i(0), }),
  s({ trig = "subsubsection" }, {
    t("\\subsubsection{"), i(1), t("}"), i(0),
  }),

  s({ trig = "par" }, {
    t("\\paragraph{"), i(1), t("}"), i(0),
  }),

  s({ trig = "lbl" }, {
    t("\\label{"), i(1), t("}"), i(0),
  }),

  s({ trig = "ref" }, {
    t("\\ref{"), i(1), t("}"), i(0),
  }),

  -- Requiere el paquete cleveref: \usepackage{cleveref}
  s({ trig = "cref" }, {
    t("\\cref{"), i(1), t("}"), i(0),
  }),

  s({ trig = "eqref" }, {
    t("\\eqref{"), i(1), t("}"), i(0),
  }),

  s({ trig = "foot" }, {
    t("\\footnote{"), i(1), t("}"), i(0),
  }),

  as({ trig = "newpage" }, { t("\\newpage") }),
  as({ trig = "clearpage" }, { t("\\clearpage") }),

  s({ trig = "doc" }, {
    t({
      "\\documentclass{article}",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[spanish]{babel}",
      "\\usepackage{amsmath, amssymb, amsthm}",
      "\\usepackage{graphicx}",
      "\\usepackage{hyperref}",
      "",
      "\\title{", 
    }),
    i(1, "Título"),
    t({ "}", "\\author{" }),
    i(2, "Autor"),
    t({ "}", "\\date{\\today}", "", "\\begin{document}", "", "\\maketitle", "" }),
    i(0),
    t({ "", "", "\\end{document}" }),
  }),

  -- ==========================================================
  -- 2. LISTAS
  -- ==========================================================
  s({ trig = "item" }, {
    t("\\item "), i(0),
  }),

  s({ trig = "itemz" }, {
    t({ "\\begin{itemize}", "  \\item " }),
    i(1),
    t({ "", "\\end{itemize}" }),
    i(0),
  }),

  s({ trig = "enum" }, {
    t({ "\\begin{enumerate}", "  \\item " }),
    i(1),
    t({ "", "\\end{enumerate}" }),
    i(0),
  }),

  s({ trig = "desc" }, {
    t({ "\\begin{description}", "  \\item[" }),
    i(1, "término"), t("] "),
    i(2),
    t({ "", "\\end{description}" }),
    i(0),
  }),

  s({ trig = "thm" }, { t({ "\\begin{theorem}", "" }), i(1), t({ "", "\\end{theorem}" }), i(0),   }),

  s({ trig = "lem" }, {
    t({ "\\begin{lemma}", "" }),
    i(1),
    t({ "", "\\end{lemma}" }),
    i(0),
  }),

  s({ trig = "cor" }, {
    t({ "\\begin{corollary}", "" }),
    i(1),
    t({ "", "\\end{corollary}" }),
    i(0),
  }),

  s({ trig = "defn" }, {
    t({ "\\begin{definition}", "" }),
    i(1),
    t({ "", "\\end{definition}" }),
    i(0),
  }),

  s({ trig = "exmp" }, {
    t({ "\\begin{example}", "" }),
    i(1),
    t({ "", "\\end{example}" }),
    i(0),
  }),

  s({ trig = "rem" }, {
    t({ "\\begin{remark}", "" }),
    i(1),
    t({ "", "\\end{remark}" }),
    i(0),
  }),

  s({ trig = "prf" }, {
    t({ "\\begin{proof}", "" }),
    i(1),
    t({ "", "\\end{proof}" }),
    i(0),
  }),

  -- ==========================================================
  -- 4. FIGURAS Y TABLAS
  -- ==========================================================
  s({ trig = "fig" }, {
    t({
      "\\begin{figure}[htbp]",
      "  \\centering",
      "  \\includegraphics[width=",
    }),
    i(1, "0.8"), t("\\textwidth]{"),
    i(2, "ruta"), t({ "}", "  \\caption{" }),
    i(3, "descripción"), t({ "}", "  \\label{fig:" }),
    i(4, "etiqueta"), t({ "}", "\\end{figure}" }),
    i(0),
  }),

  s({ trig = "tab" }, {
    t({ "\\begin{table}[htbp]", "  \\centering", "  \\begin{tabular}{" }),
    i(1, "c c"), t({ "}", "    " }),
    i(2, "Col 1"), t(" & "), i(3, "Col 2"), t({ " \\\\", "    \\hline", "    " }),
    i(4), t(" & "), i(5), t({ " \\\\", "  \\end{tabular}", "  \\caption{" }),
    i(6, "descripción"), t({ "}", "  \\label{tab:" }),
    i(7, "etiqueta"), t({ "}", "\\end{table}" }),
    i(0),
  }),

  s({ trig = "subfig" }, {
    t({
      "\\begin{figure}[htbp]",
      "  \\centering",
      "  \\begin{subfigure}{0.45\\textwidth}",
      "    \\centering",
      "    \\includegraphics[width=\\textwidth]{",
    }),
    i(1, "ruta1"), t({ "}", "    \\caption{" }),
    i(2, "sub a"), t({ "}", "  \\end{subfigure}", "  \\hfill", "  \\begin{subfigure}{0.45\\textwidth}", "    \\centering", "    \\includegraphics[width=\\textwidth]{" }),
    i(3, "ruta2"), t({ "}", "    \\caption{" }),
    i(4, "sub b"), t({ "}", "  \\end{subfigure}", "  \\caption{" }),
    i(5, "descripción general"), t({ "}", "\\end{figure}" }),
    i(0),
  }),

  s({ trig = "wrapfig" }, {
    t({ "\\begin{wrapfigure}{r}{0.4\\textwidth}", "  \\centering", "  \\includegraphics[width=0.38\\textwidth]{" }),
    i(1, "ruta"), t({ "}", "  \\caption{" }),
    i(2, "descripción"), t({ "}", "\\end{wrapfigure}" }),
    i(0),
  }),

  -- ==========================================================
  -- 5. CITAS Y BIBLIOGRAFÍA
  -- ==========================================================
  s({ trig = "cite" }, {
    t("\\cite{"), i(1), t("}"), i(0),
  }),

  -- Requiere \usepackage{natbib}
  s({ trig = "citep" }, {
    t("\\citep{"), i(1), t("}"), i(0),
  }),

  s({ trig = "citet" }, {
    t("\\citet{"), i(1), t("}"), i(0),
  }),

  s({ trig = "bibinput" }, {
    t("\\bibliographystyle{"), i(1, "plain"), t("}"),
    t({ "", "\\bibliography{" }), i(2, "referencias"), t("}"),
    i(0),
  }),

  -- ==========================================================
  -- 6. FORMATO DE TEXTO
  -- ==========================================================
  s({ trig = "bf" }, {
    t("\\textbf{"), i(1), t("}"), i(0),
  }),

  s({ trig = "itt" }, {
    t("\\textit{"), i(1), t("}"), i(0),
  }),

  s({ trig = "emph" }, {
    t("\\emph{"), i(1), t("}"), i(0),
  }),

  s({ trig = "ttt" }, {
    t("\\texttt{"), i(1), t("}"), i(0),
  }),

  s({ trig = "ul" }, {
    t("\\underline{"), i(1), t("}"), i(0),
  }),

  s({ trig = "sc" }, {
    t("\\textsc{"), i(1), t("}"), i(0),
  }),

  s({ trig = "color" }, {
    t("\\textcolor{"), i(1, "red"), t("}{"), i(2), t("}"), i(0),
  }),

  -- ==========================================================
  -- 10. CÓDIGO Y LISTADOS
  -- ==========================================================
  -- Requiere \usepackage{listings}
  s({ trig = "lst" }, {
    t("\\begin{lstlisting}[language="), i(1, "Python"), t({ "]", "" }),
    i(2),
    t({ "", "\\end{lstlisting}" }),
    i(0),
  }),

  s({ trig = "verb" }, {
    t("\\verb|"), i(1), t("|"), i(0),
  }),

  -- Bloque de código con minted (más lindo, requiere -shell-escape)
  s({ trig = "mint" }, {
    t("\\begin{minted}{"), i(1, "python"), t({ "}", "" }),
    i(2),
    t({ "", "\\end{minted}" }),
    i(0),
  }),

  -- ==========================================================
  -- 11. HYPERREF / ENLACES
  -- ==========================================================
  s({ trig = "href" }, {
    t("\\href{"), i(1, "url"), t("}{"), i(2, "texto"), t("}"), i(0),
  }),

  s({ trig = "url" }, {
    t("\\url{"), i(1), t("}"), i(0),
  }),

}
