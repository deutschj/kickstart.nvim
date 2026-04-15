return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    -- Disable mini.statusline so they don't conflict
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = ' '
      else
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      local icons = {
        added = ' ',
        modified = ' ',
        removed = ' ',
        error = ' ',
        warn = ' ',
        info = ' ',
        hint = ' ',
      }

      return {
        options = {
          theme = 'tokyonight',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', icon = '' } },
          lualine_b = {
            {
              'branch',
              icon = '',
              color = { fg = '#7aa2f7', gui = 'bold' },
            },
            {
              'diff',
              symbols = {
                added = icons.added,
                modified = icons.modified,
                removed = icons.removed,
              },
              -- Use gitsigns as source for accurate counts
              source = function()
                local gs = vim.b.gitsigns_status_dict
                if gs then return { added = gs.added, modified = gs.changed, removed = gs.removed } end
              end,
            },
          },
          lualine_c = {
            {
              'filename',
              path = 1, -- show relative path
              symbols = { modified = '  ', readonly = '  ', unnamed = '  ' },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              symbols = {
                error = icons.error,
                warn = icons.warn,
                info = icons.info,
                hint = icons.hint,
              },
            },
            { 'encoding', cond = function() return vim.o.fileencoding ~= 'utf-8' end },
            { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
            'filetype',
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          },
          lualine_z = {
            { 'location', padding = { left = 0, right = 1 } },
          },
        },
        extensions = { 'neo-tree', 'lazy', 'quickfix', 'trouble' },
      }
    end,
  },
}
