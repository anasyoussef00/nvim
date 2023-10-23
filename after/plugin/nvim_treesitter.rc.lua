local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify('Could not load NVIM_TREESITTER', vim.log.levels.ERROR, { title = 'NVIM_TREESITTER' })
end

configs.setup {
  ensure_installed = {
    'css',
    'gitignore',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'jsonc',
    'lua',
    'luap',
    'rust',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'vue',
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
