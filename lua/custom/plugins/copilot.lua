return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  display = {
    diff = {
      enabled = false,
    },
  },

  opts = {
    -- NOTE: The log_level is in `opts.opts`
    -- copilot_acp is a built-in ACP adapter since codecompanion v19.5.0
    opts = {
      log_level = 'ERROR',
    },
    strategies = {
      chat = {
        adapter = 'copilot_acp',
      },
      inline = {
        adapter = 'copilot_acp',
      },
      cmd = {
        adapter = 'copilot_acp',
      },
    },
  },
}
