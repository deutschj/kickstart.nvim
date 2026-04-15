return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    keys = {
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '<F1>', function() require('dap').continue() end, desc = 'Continue' },
      { '<F2>', function() require('dap').step_into() end, desc = 'Step Into' },
      { '<F3>', function() require('dap').step_over() end, desc = 'Step Over' },
      { '<F10>', function() require('dap').restart() end, desc = 'Restart' },
      { '<leader>gb', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor' },
      { '<leader>dT', function() require('dap').terminate() end, desc = 'Terminate' },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    keys = {
      {
        '<leader>du',
        function() require('dapui').toggle() end,
        desc = 'Dap UI',
      },
    },
    config = function()
      require('dapui').setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }
    end,
    dependencies = {
      -- (the rest is fine)
      {
        'jay-babu/mason-nvim-dap.nvim',
        opts = {
          handlers = {},
          automatic_installation = false,
          ensure_installed = { 'bash', 'codelldb', 'python', 'debugpy' },
        },
        dependencies = {
          'mfussenegger/nvim-dap',
          'williamboman/mason.nvim',
        },
      },
      {
        'mfussenegger/nvim-dap-python',
        lazy = true,
        config = function()
          local python = vim.fn.expand('/usr/local/bin/python3')
          require('dap-python').setup(python)
        end,
        dependencies = {
          'mfussenegger/nvim-dap',
        },
      },
      { 'nvim-neotest/nvim-nio' },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = true,
        dependencies = {
          'mfussenegger/nvim-dap',
        },
      },
    },
  },
}

