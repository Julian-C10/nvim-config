return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require "telescope.builtin"

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files { cwd = vim.fn.stdpath "config" }
      end, { desc = "[F]ind [n]eovim files" })

      vim.keymap.set("n", "<leader>fN", function()
        builtin.live_grep { cwd = vim.fn.stdpath "config" }
      end, { desc = "[F]ind [N]eovim files by grep" })

      vim.keymap.set("n", "<leader>fu", function()
        builtin.find_files { cwd = "C:\\Projects\\Confluence\\Unity" }
      end, { desc = "[F]ind [U]nity files" })

      vim.keymap.set("n", "<leader>fU", function()
        builtin.live_grep { cwd = "C:\\Projects\\Confluence\\Unity" }
      end, { desc = "[F]ind [U]nity files by grep" })

      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files { cwd = "C:\\mine" }
      end, { desc = "[F]ind [P]ersonal files" })

      vim.keymap.set("n", "<leader>fP", function()
        builtin.live_grep { cwd = "C:\\mine" }
      end, { desc = "[F]ind [P]ersonal files by grep" })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      view = {
        number = true,
        relativenumber = true,
      },
    },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
