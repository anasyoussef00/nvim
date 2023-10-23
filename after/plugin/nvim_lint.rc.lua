local ok, lint = pcall(require, 'lint')
if not ok then
  return vim.notify('Could not load LINT', vim.log.levels.ERROR, { title = 'LINT' })
end

lint.linters_by_ft = {
  json = { 'jsonlint' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  vue = { 'eslint' },
  lua = { 'selene' },
  editorconfig = { 'editorconfig_checker' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
