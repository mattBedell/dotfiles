nvim_lsp.diagnosticls.setup{
  on_attach=custom_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'css',
    'scss',
    'markdown',
    'pandoc'
  },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity' },
        },
        markdownlint = {
          command = 'markdownlint',
          rootPatterns = { '.git' },
          isStderr = true,
          debounce = 100,
          args = { '--stdin' },
          offsetLine = 0,
          offsetColumn = 0,
          sourceName = 'markdownlint',
          securities = {
            undefined = 'hint',
          },
          formatLines = 1,
          formatPattern = {
            '.:(\d+)\s+(.)$',
            {
              line = 1,
              column = -1,
              message = 2,
            },
          },
        },
      },
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
        markdown = 'markdownlint',
        pandoc = 'markdownlint',
      },
      formatters = {
        prettierEslint = {
          command = 'prettier-eslint',
          args = { '--stdin' },
          rootPatterns = { '.git' },
        },
        prettier = {
          command = 'prettier',
          args = {
            '--stdin-filepath', '%filename'
          },
        },
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'prettierEslint',
        javascriptreact = 'prettierEslint',
        json = 'prettier',
        scss = 'prettier',
        typescript = 'prettierEslint',
        typescriptreact = 'prettierEslint'
      },
    },
  }