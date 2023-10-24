local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
  return vim.notify('Could not load TELESCOPE_BUILTIN', vim.log.levels.ERROR, { title = 'TELESCOPE_BUILTIN' })
end

local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return vim.notify('Could not load TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

telescope.setup {
  extensions = {
    file_browser = {
      -- theme = 'catppuccin-macchiato',
      hijack_netrw = true,
    },
  },
}

telescope.load_extension 'file_browser'

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<C-f>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
