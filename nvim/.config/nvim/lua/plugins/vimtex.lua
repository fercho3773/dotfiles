return{
  {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    -- vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".tex_build",
        out_dir = "",
        executable = "latexmk",
        options = {
          '-synctex=1',
          '-interaction=nonstopmode',
        }
      }
  end
 }
}
