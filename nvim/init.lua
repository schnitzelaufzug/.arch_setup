vim.g.mapleader = ","
vim.opt.nu = true
vim.opt.relativenumber = true
vim.cmd("set cursorline")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.smartindent = true
--vim.opt.wrap = false
vim.opt.termguicolors = true 
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
-- wraps text at end of screen without new line
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true

vim.keymap.set("i", "jk", "<ESC>")                          -- Escape insert mode
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>")   -- Remove search highlighting
vim.keymap.set("n", "<C-d>", "<C-d>zz")   -- Keeps cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")   -- Keeps cursor in the middle
vim.keymap.set("n", "n", "nzzzv")   -- Keeps cursor in the middle for searches
vim.keymap.set("n", "N", "Nzzzv")   -- Keeps cursor in the middle for searches
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])   -- Copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>Y", [["+Y]])   -- Copy to clipboard
vim.keymap.set({"n"}, "<leader>p", [["+p]])   -- Paste from clipboard
vim.keymap.set({"n"}, "<leader>P", [["+P]])   -- Paste from clipboard

vim.keymap.set("x", "<leader>p", "\"_dP")   -- 
vim.keymap.set("n", "gh", vim.lsp.buf.hover)   -- 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'}, 
    {'github/copilot.vim'},
    {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    }
}
local opts = {}

require("lazy").setup(plugins, opts)

vim.cmd.colorscheme "catppuccin"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })           -- Adds Transparency
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })      -- Adds Transparency

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})        -- Adds Fuzzy-search shorthand
vim.keymap.set('n', '<leader>ps', function()                -- Adds grep shorthand
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


-- Treesitter syntax highlighting
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "php", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

   -- Needed because treesitter highlight turns off autoindent for php files
  indent = {
      enable = true,
  },
}

-- LSP
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').phpactor.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').emmet_language_server.setup({
    filetypes = { "css", "php", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
