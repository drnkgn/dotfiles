local lspconfig = require('lspconfig')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format(),
  }
})

local custom_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  local opts = { buffer=bufnr }
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>fm', function()
    vim.lsp.buf.format({ async=true })
  end, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  client.server_capabilities.semanticTokensProvider = nil
end

local texlabBuildConfig = {}
if _G.TeXMagicBuildConfig ~= nil then
  texlabBuildConfig = _G.TeXMagicBuildConfig
else
  texlabBuildConfig = {
    args = {"-pdf", "-interaction=nonstopmode", "-synctex=0", "%f"}
  }
end

local servers = {
  -- tsserver = true,
  cssls = true,
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostic = {
          enable = false
        }
      }
    }
  },
  texlab = {
    settings = {
      texlab = {
        build = {
          args= { "-pdf", "-interaction=nonstopmode", "-synctex=0", "%f" }
        }
      }
    }
  },
  pyright = true,
}

for server, config in pairs(servers) do
  if type(config) ~= 'table' then
    config = {}
  end
  lspconfig[server].setup(vim.tbl_deep_extend("force", config, {
    on_attach = custom_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }))
end
