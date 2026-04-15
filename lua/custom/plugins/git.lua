return {
  -- Magit-like git UI: staging, commits, branches, log
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim', -- optional but highly recommended
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true,
          telescope = true,
        },
      }
      vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<cr>', { desc = '[G]it [S]tatus (Neogit)' })
      vim.keymap.set('n', '<leader>gc', '<cmd>Neogit commit<cr>', { desc = '[G]it [C]ommit' })
      vim.keymap.set('n', '<leader>gp', '<cmd>Neogit push<cr>', { desc = '[G]it [P]ush' })
    end,
  },

  -- Git diff viewer + file history / git log
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff view' },
      { '<leader>gl', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [L]og (current file)' },
      { '<leader>gL', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [L]og (repo)' },
    },
  },
}
