require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- typst: tinymist
require("lspconfig")["tinymist"].setup{
    settings = {
        formatterMode = "typststyle",
        exportPdf = "onSave",
        exportTarget = "html",
        semanticTokens = "disable",
        rootPath = "-",
        preview = {
          browsing = {
            args = {
              "--open",
              "--data-plane-host=127.0.0.1:2000"
            }
          }
        }
    }
}
