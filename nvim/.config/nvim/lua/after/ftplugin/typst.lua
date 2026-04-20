-- Calling the snippet Functions
local snip = require("snip")

--snippets.add("fig", [[ ... ]], { buffer = true })

--- Centered Figure
vim.snippet.add(
  "fig",
  [[#align(center)[
  #scale(x:100%, y:100%, reflow:true)[
    #figure(
      placement:none,
      include "${1:./fig.typ}"
    )
  ]
  "${2:caption}"
]] .. "\n]",
  { buffer = 0 }
)

print("Typt snippets loaded")
