require("rhittum.lazy")

vim.g.mapleader= " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.opt.clipboard="unnamedplus"

vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[hi Normal guibg=NONE]]

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

vim.opt.number=true

vim.opt.relativenumber=true

vim.opt.syntax= "on"
