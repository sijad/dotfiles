-- install following commands by npm or yarn
-- npm i -g cspell vscode-langservers-extracted eslint_d rustywind @tailwindcss/language-server  typescript-language-server solidity-language-server solhint

require('impatient')

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'navarasu/onedark.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'unblevable/quick-scope'
  use 'gpanders/editorconfig.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-ts-autotag'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'f-person/git-blame.nvim'
  use {
    'appelgriebsch/surround.nvim',
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "akinsho/bufferline.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "moll/vim-bbye",
    after = "bufferline.nvim",
  }
  use {
    'numToStr/Comment.nvim',
    tag = 'v0.6',
    config = function()
        require('Comment').setup()
    end
  }
  use "elihunter173/dirbuf.nvim"
end)

vim.o.hlsearch = true
vim.o.mouse = ''
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.cc = '80'
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.opt.showbreak = "↪ "
vim.opt.hidden = true
vim.opt.list = true
vim.opt.wrap = true
vim.opt.listchars:append("tab: ›")
vim.opt.listchars:append("nbsp:␣")
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("extends:⟩")
vim.opt.listchars:append("precedes:⟨")
vim.opt.cmdheight = 1
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.gitblame_enabled = 0

vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrwFileHandlers = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrwSettngs = 0
-- vim.g.loaded_matchit = 0
-- vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

vim.cmd [[colorscheme onedark]]
vim.cmd 'set nobackup'
vim.cmd 'set nowb'
vim.cmd 'set noswapfile'
vim.cmd 'set nowritebackup'

require('lualine').setup()

require('gitsigns').setup()

require("bufferline").setup()

require("dirbuf").setup {
    hash_padding = 2,
    show_hidden = true,
    sort_order = "default",
    write_cmd = "DirbufSync",
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<Esc>"] = require('telescope.actions').close,
      },
    },
  },
}
require('telescope').load_extension 'fzf'

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true
  }
}

local lspconfig = require 'lspconfig'
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  client.resolved_capabilities.document_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'tsserver', 'html', 'cssls', 'jsonls', 'tailwindcss', 'solidity_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('colorizer').setup {
  '*';
  css = { css = true; }
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

local null_ls = require('null-ls')
null_ls.setup({
    fallback_severity = vim.diagnostic.severity.INFO,
    sources = {
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.rustywind,
      null_ls.builtins.formatting.prettier.with({
        disabled_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        extra_filetypes = { "solidity" },
      }),

      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.cspell,
      null_ls.builtins.diagnostics.solhint,

      null_ls.builtins.code_actions.eslint_d,
    },
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
      end
    end,
})

local mapOpts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', mapOpts)

vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files{ previewer = false }<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], mapOpts)

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', mapOpts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', mapOpts)

vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>Bdelete<CR>', mapOpts)

vim.api.nvim_set_keymap('c', '<Down>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('c', '<Left>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('c', '<Right>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('c', '<Up>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', { noremap = true })

vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', mapOpts)

vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', mapOpts)
vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', mapOpts)
