-- enable title
vim.opt.title = true

-- show trailing spaces and tabs
vim.opt.list = true
vim.opt.listchars = { trail = "~", tab = "» " }

-- change character and highlight group for git diff view
vim.opt.fillchars = { eob = " ", diff = "⣿" }

-- change character for indent_blankline, to use a 6-dot braille cell
vim.g.indent_blankline_char = "⡇"
-- vim.g.indent_blankline_context_char = "⣿"

