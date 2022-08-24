-------------------- HELPERS -------------------------------
local cmd = vim.cmd                  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn   	             -- to call Vim functions e.g. fn.bufnr()
local g = vim.g     	             -- a table to access global variables
local map = vim.keymap               -- to set keyboard mappings
local opt = vim.opt 	             -- to set options

-------------------- OPTIONS -------------------------------
--vim.wo.number = true
--vim.opt.title = true
opt.completeopt = "menuone,noselect"    -- enable autocompletion
opt.expandtab = true                    -- convert tabs to spaces
opt.ignorecase = true                   -- ignore case in search patterns
opt.laststatus = 1                      -- show status if two windows
opt.mouse = "a"                         -- allow the mouse in neovim
opt.pumheight = 10                      -- pop up menu height
opt.smartcase = true                    -- uppercase
opt.smartindent = true                  -- 
opt.undofile = true                     -- saves undo history to file 
--g.vscode_style = "dark"   		-- dark variant
--cmd 'colorscheme vscode'     		-- vscode colorscheme
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = false
opt.backspace = 'start,eol,indent'
--opt.termguicolors = true                -- set term gui colors
--opt.cursorline = true

-------------------- MAPPINGS ------------------------------
options = { noremap = true }
map.set('i', 'jk', '<Esc>', options)
