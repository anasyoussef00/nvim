local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return vim.notify('Could not load MASON_LSP_CONFIG', vim.log.levels.ERROR, { title = 'MASON_LSP_CONFIG' })
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return vim.notify('Could not load LSP_CONFIG', vim.log.levels.ERROR, { title = 'LSP_CONFIG' })
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
  return vim.notify('Could not load CMP_NVIM_LSP', vim.log.levels.ERROR, { title = 'CMP_NVIM_LSP' })
end

local servers = {
  'cssls',
  'emmet_language_server',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tailwindcss',
  'tsserver',
  'taplo',
  'volar',
}

local ignored_servers = {
  'rust_analyzer',
  'tsserver',
}

mason_lspconfig.setup {
  ensure_installed = servers,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      capabilities = capabilities,
      root_dir = function()
        return vim.fn.getcwd()
      end,
    }

    local server_ok, server = pcall(require, 'xbogayo.lspconfig.servers.' .. server_name)
    if server_ok then
      opts = vim.tbl_deep_extend('force', server, opts)
    end

    for _, iserver in pairs(ignored_servers) do
      if server_name == iserver then
        return
      end
    end

    lspconfig[server_name].setup(opts)
  end,
}

local keymap = vim.keymap

keymap.set('n', '<space>f', vim.diagnostic.open_float)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local api = vim.api

api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }

    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    --[[ vim.keymap.set('n', '<space>fm', function()
      vim.lsp.buf.format { async = true }
    end, opts) ]]

    keymap.set('n', '<space>fm', ':FormatWrite<CR>', opts)
  end,
})
