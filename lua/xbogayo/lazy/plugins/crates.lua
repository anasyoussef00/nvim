return {
  'saecki/crates.nvim',
  event = { "BufRead Cargo.toml", 'LspAttach' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
}
