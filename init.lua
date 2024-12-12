require "paq" {
	"savq/paq-nvim",
  'VonHeikemen/lsp-zero.nvim',
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
     'petertriho/cmp-git',
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "jackguo380/vim-lsp-cxx-highlight",
  "ranjithshegde/ccls.nvim",
  'Xuyuanp/scrollbar.nvim',
  'karb94/neoscroll.nvim',
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	"slugbyte/lackluster.nvim",
	"nvim-lualine/lualine.nvim",
  	"pmizio/typescript-tools.nvim",
	"nvim-lua/plenary.nvim",
	{ 'nvim-tree/nvim-web-devicons', opt = true },
  { 'nvim-lua/plenary.nvim', opt = true },
}
vim.opt.mouse=""
require("lackluster").setup({
	tweak_syntax = {
        string = "default",
        string_escape = "default",
        comment = "default",
        builtin = "default",
        type = "default",
        keyword = "default",
        keyword_return = "default",
        keyword_exception = "default",
    },
    tweak_background = {
        normal = 'default',
        -- normal = 'none',
        telescope = 'default',
        menu = 'default',
        popup = 'default',
    },
})
vim.cmd.colorscheme("lackluster")
require('lualine').setup({
	options = {
	  theme = "lackluster"
},
})
local lsp_zero = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end
lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = capabilities,
})
lspconfig.ccls.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache";
    },
    highlight = {
    lsRanges = true;
    }
  }
}
require("ccls").setup({})
lspconfig.ts_ls.setup { capabilities = capabilities }
lspconfig.sqlls.setup{}
require("typescript-tools").setup {}
require("cmp_git").setup()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'git' },
    }),
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp_action.tab_complete(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),
})
require('neoscroll').setup({})
vim.wo.number = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.tabstop = 5
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.api.nvim_create_augroup('MakefileSettings', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group = 'MakefileSettings',
    pattern = 'makefile',
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.smarttab = true
    end
});
vim.cmd([[
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
let g:scrollbar_excluded_filetypes = ['nerdtree']
]])
