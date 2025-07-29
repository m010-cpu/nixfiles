return {
  "lervag/vimtex",
  ft = "tex",

  config = function()
    vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_complete_close_braces = 1
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_syntax_enabled = 0
  end,
}
