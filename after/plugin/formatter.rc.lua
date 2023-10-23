local mason_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_ok then
  return vim.notify('Could not load MASON_NULL_LS', vim.log.levels.ERROR, { title = 'MASON_NULL_LS' })
end

--[[ local formatter_util_ok, formatter_util = pcall(require, 'formatter.util')
if not formatter_util_ok then
  return vim.notify('Could not load FORMATTER_UTIL', vim.log.levels.ERROR, { title = 'FORMATTER_UTIL' })
end ]]

local ok, formatter = pcall(require, 'formatter')
if not ok then
  return vim.notify('Could not load FORMATTER', vim.log.levels.ERROR, { title = 'FORMATTER' })
end

local ensure_installed = {
  'editorconfig_checker',
  'eslint',
  'eslint_d',
  'jsonlint',
  'prettier',
  'prettierd',
  'selene',
  'stylua',
  'taplo',
}

formatter.setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    html = {
      function()
        if vim.fn.has 'win32' == 1 then
          return require('formatter.filetypes.html').prettier
        else
          return require('formatter.filetypes.html').prettierd
        end
      end,
    },
    css = {
      function()
        if vim.fn.has 'win32' == 1 then
          return require('formatter.filetypes.css').prettier
        else
          return require('formatter.filetypes.css').prettierd
        end
      end,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettierd,
      function()
        if vim.fn.has 'win32' == 1 then
          return {
            require('formatter.filetypes.javascript').prettier,
            require('formatter.filetypes.javascript').eslint,
          }
        else
          return {
            require('formatter.filetypes.javascript').prettierd,
            require('formatter.filetypes.javascript').eslint_d,
          }
        end
      end,
    },
    json = {
      function()
        if vim.fn.has 'win32' == 1 then
          return require('formatter.filetypes.json').prettier
        else
          return require('formatter.filetypes.json').prettierd
        end
      end,
    },
    toml = {
      require('formatter.filetypes.toml').taplo,
    },
    typescript = {
      function()
        if vim.fn.has 'win32' == 1 then
          return {
            require('formatter.filetypes.typescript').prettier,
            require('formatter.filetypes.typescript').eslint,
          }
        else
          return {
            require('formatter.filetypes.typescript').prettierd,
            require('formatter.filetypes.typescript').eslint_d,
          }
        end
      end,
    },
    vue = {
      require('formatter.filetypes.vue').prettier,
    },
    rust = {
      require('formatter.filetypes.rust').rustfmt,
    },
    ['*'] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}

mason_null_ls.setup {
  ensure_installed = ensure_installed,
}
