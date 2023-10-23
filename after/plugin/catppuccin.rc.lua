local ok, catppuccin = pcall(require, 'catppuccin')
if not ok then
  return vim.notify('Could not load CATPPUCCIN', vim.log.levels.ERROR, { title = 'CATPPUCCIN' })
end

catppuccin.setup {
  flavour = 'macchiato',
  transparent_background = true,
  integrations = {
    cmp = true,
    fidget = true,
    mason = true,
    notify = true,
    telescope = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}

local cmd = vim.cmd

cmd.colorscheme 'catppuccin-macchiato'
