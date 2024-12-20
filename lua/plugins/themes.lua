return {
  -- { 'rose-pine/neovim', name = 'rose-pine' },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   opts = {
  --     style = 'storm',
  --     styles = {
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --       functions = { italic = false },
  --       variables = { italic = false },
  --     },
  --   },
  --   init = function()
  --     vim.cmd.colorscheme 'tokyonight-storm'
  --
  --     -- You can configure highlights by doing something like:
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
}
