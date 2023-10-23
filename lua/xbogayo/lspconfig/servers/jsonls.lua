local schemas = {
  {
    description = 'TypeScript compiler configuration file',
    fileMatch = {
      'tsconfig.json',
      'tsconfig.*.json',
    },
    url = 'https://json.schemastore.org/tsconfig.json',
  },
  {
    description = 'Babel configuration',
    fileMatch = {
      '.babelrc.json',
      '.babelrc',
      'babel.config.json',
    },
    url = 'https://json.schemastore.org/babelrc.json',
  },
  {
    description = 'ESLint config',
    fileMatch = {
      '.eslintrc.json',
      '.eslintrc',
    },
    url = 'https://json.schemastore.org/eslintrc.json',
  },
  {
    description = 'Prettier config',
    fileMatch = {
      '.prettierrc',
      '.prettierrc.json',
      'prettier.config.json',
    },
    url = 'https://json.schemastore.org/prettierrc',
  },
  {
    description = 'golangci-lint configuration file',
    fileMatch = {
      '.golangci.toml',
      '.golangci.json',
    },
    url = 'https://json.schemastore.org/golangci-lint.json',
  },
  {
    description = 'NPM configuration file',
    fileMatch = {
      'package.json',
    },
    url = 'https://json.schemastore.org/package.json',
  },
}

return {
  settings = {
    json = {
      schemas = schemas
    }
  }
}
