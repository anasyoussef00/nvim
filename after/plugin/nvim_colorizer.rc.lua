local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return vim.notify('could not load COLORIZER', vim.log.levels.error, { title = 'COLORIZER' })
end

colorizer.setup {
  '*',
}
