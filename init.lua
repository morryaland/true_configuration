require "paq" {
	"savq/paq-nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "jose-elias-alvarez/typescript.nvim",
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	"slugbyte/lackluster.nvim",
	"nvim-lualine/lualine.nvim",
	{ 'nvim-tree/nvim-web-devicons', opt = true },
  { 'nvim-lua/plenary.nvim', opt = true },
}
require("lackluster").setup({
	tweak_syntax = {
        string = "default",
        -- string = "#a1b2c3", -- custom hexcode
        -- string = color.green, -- lackluster color
        string_escape = "default",
        comment = "default",
        builtin = "default", -- builtin modules and functions
        type = "default",
        keyword = "default",
        keyword_return = "default",
        keyword_exception = "default",
    },
    -- You can overwrite the following background colors by setting them to one of...
    --   1) a hexcode like "#a1b2c3" for a custom color
    --   2) "none" for transparency
    --   3) "default" or nil will just use whatever lackluster's default is.
    tweak_background = {
        normal = 'default',    -- main background
        -- normal = 'none',    -- transparent
        -- normal = '#a1b2c3',    -- hexcode 
        -- normal = color.green,    -- lackluster color
        telescope = 'default', -- telescope
        menu = 'default',      -- nvim_cmp, wildmenu ... (bad idea to transparent)
        popup = 'default',     -- lazy, mason, whichkey ... (bad idea to transparent)
    },
})
vim.cmd.colorscheme("lackluster")
require('lualine').setup({
	options = {
	  theme = "lackluster",
	},
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.ccls.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}
lspconfig.autotools_ls.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}
lspconfig.tsserver.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands 
  debug = false, -- enable debug logging for command 
  go_to_source_definition = { 
    fallback = true, -- fall back to standard LSP definition on failure 
  },
})
local cmp = require('cmp')
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
vim.wo.number = true
vim.opt.expandtab = true        -- Convert tabs to spaces
vim.opt.smarttab = true         -- Insert indentation depending on the context
vim.opt.smartindent = true       -- Enable smart indentation
vim.opt.tabstop = 2             -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 2         -- Number of spaces a <Tab> counts for while editing
vim.opt.shiftwidth = 2          -- Number of spaces to use for each step of (auto)indent
vim.api.nvim_create_augroup('MakefileSettings', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group = 'MakefileSettings',
    pattern = 'makefile',
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.smarttab = true
    end
})

