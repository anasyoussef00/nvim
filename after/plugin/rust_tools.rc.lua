local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
  return vim.notify('Could not load CMP_NVIM_LSP', vim.log.levels.ERROR, { title = 'CMP_NVIM_LSP' })
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return vim.notify('Could not load LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local ok, rt = pcall(require, 'rust-tools')
if not ok then
  return vim.notify('Could not load RUST_TOOLS', vim.log.levels.ERROR, { title = 'RUST_TOOLS' })
end

local capabilities = cmp_nvim_lsp.default_capabilities()

rt.setup {
  tools = {
    inlay_hints = {
      only_current_line = true,
    },
    hover_actions = {
      auto_focus = true,
    },
  },
  server = {
    -- standalone = true,
    -- capabilities = capabilities,
    on_attach = function(_, bufnr)
      local keymap = vim.keymap

      keymap.set('n', '<space>f', rt.hover_actions.hover_actions, { buffer = bufnr })
      keymap.set('n', '<space>ca', rt.code_action_group.code_action_group, { buffer = bufnr })
      keymap.set('n', '<space>rp', rt.parent_module.parent_module, { buffer = bufnr })
      keymap.set('n', '<space>jl', rt.join_lines.join_lines, { buffer = bufnr })
    end,
    -- root_dir = lspconfig.util.root_pattern('Cargo.toml', 'Cargo.lock', 'rust-project.json'),
  },
}
