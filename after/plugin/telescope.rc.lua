local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
	return vim.notify('Could not load TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
