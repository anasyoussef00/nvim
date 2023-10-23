return {
  'rcarriga/nvim-notify',
  init = function()
    vim.notify = require("notify")
  end,
  opts = {
    background_colour = '#00000'
  }
}
