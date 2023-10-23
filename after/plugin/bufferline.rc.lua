local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return vim.notify('Could not load BUFFERLINE', vim.log.levels.ERROR, { title = 'BUFFERLINE' })
end

bufferline.setup {
  options = {
    numbers = 'ordinal',
    diagnostics = 'nvim_lsp',
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
  },
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<A-1>', function()
  return bufferline.go_to(1, true)
end, opts)

keymap.set('n', '<A-2>', function()
  return bufferline.go_to(2, true)
end, opts)

keymap.set('n', '<A-3>', function()
  return bufferline.go_to(3, true)
end, opts)

keymap.set('n', '<A-4>', function()
  return bufferline.go_to(4, true)
end, opts)

keymap.set('n', '<A-5>', function()
  return bufferline.go_to(5, true)
end, opts)

keymap.set('n', '<A-6>', function()
  return bufferline.go_to(6, true)
end, opts)

keymap.set('n', '<A-7>', function()
  return bufferline.go_to(7, true)
end, opts)

keymap.set('n', '<A-8>', function()
  return bufferline.go_to(8, true)
end, opts)

keymap.set('n', '<A-9>', function()
  return bufferline.go_to(9, true)
end, opts)

keymap.set('n', '<A-0>', function()
  return bufferline.go_to(-1, true)
end, opts)

keymap.set('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)

keymap.set('n', '<A-Left>', function()
  return bufferline.move_to(-1)
end, opts)

keymap.set('n', '<A-Right>', function()
  return bufferline.move_to(1)
end, opts)

keymap.set('n', '<A-x>', ':bdelete<CR>', opts)
