return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>sl', function()
        builtin.live_grep {
          cwd = vim.fs.joinpath(vim.fn.stdpath 'data', 'lazy'),
          prompt_title = 'Live Grep in Lazy',
        }
      end, { desc = '[S]earch in [L]azy' })

      -- vim.keymap.set('n', '<leader>sb', function()
      --   local file_path = 'C:\\Projects\\Confluence\\Unity\\build.targets'
      --   require('telescope.builtin').grep_string {
      --     prompt_title = 'Live Grep in build.targets',
      --     search = '',
      --     cwd = vim.fn.expand '%:p:h',
      --     search_dirs = { file_path },
      --     word_match = '-w',
      --   }
      -- end, { desc = '[S]earch in specific [F]ile' })

      -- vim.keymap.set('n', '<leader>st', function()
      --   require('telescope.builtin').grep_string {
      --     search = '',
      --     word_match = '-w',
      --     only_sort_text = true,
      --     search_dirs = { 'C:\\Projects\\Confluence\\Unity' },
      --     prompt_title = 'Grep (Exact Match)',
      --     additional_args = function()
      --       return { '--fixed-strings' }
      --     end,
      --   }
      -- end, { desc = '[S]earch exact [T]ext in directory' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>su', function()
        builtin.find_files { cwd = 'C:\\Projects\\Confluence\\Unity' }
      end, { desc = '[S]earch [U]nity files' })

      vim.keymap.set('n', '<leader>sm', function()
        builtin.find_files { cwd = 'C:/mine' }
      end, { desc = '[S]earch [M]ine files' })

      vim.keymap.set('n', '<leader>sp', function()
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath 'data', 'lazy') }
      end, { desc = '[E]dit [P]lugins' })
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
