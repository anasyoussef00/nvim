local ok, crates = pcall(require, 'crates')
if not ok then
  return vim.notify('Could not load CRATES', vim.log.levels.ERROR, { title = 'CRATES' })
end

crates.setup {
  src = {
    cmp = {
      enabled = true,
    },
  },
}

local opts = { silent = true }

local keymap = vim.keymap

keymap.set('n', '<leader>ct', crates.toggle, opts)
keymap.set('n', '<leader>cr', crates.reload, opts)

keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

keymap.set('n', '<leader>cu', crates.update_crate, opts)
keymap.set('v', '<leader>cu', crates.update_crates, opts)
keymap.set('n', '<leader>ca', crates.update_all_crates, opts)
keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)

keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table, opts)
keymap.set('n', '<leader>cE', crates.extract_crate_into_table, opts)

keymap.set('n', '<leader>cH', crates.open_homepage, opts)
keymap.set('n', '<leader>cR', crates.open_repository, opts)
keymap.set('n', '<leader>cD', crates.open_documentation, opts)
keymap.set('n', '<leader>cC', crates.open_crates_io, opts)
