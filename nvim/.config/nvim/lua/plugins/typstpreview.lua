return{
  {
    'chomosuke/typst-preview.nvim',
    lazy = true,
    version = '1.*',
    ft = "typst",
    opts = {
      debug = false,
      port = 2000,
      invert_colors = 'always',
      follow_cursor = true,
      open_cmd = "qutebrowser %s",
      dependencies_bin = {
        ['tinymist'] = '/usr/bin/tinymist',
        ['websocat'] = '/usr/bin/websocat'
      },
    },  
  },
} 
