return {
  {
    -- amongst your other plugins
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = function()
        require('toggleterm').setup {
          shell = 'powershell',
          open_mapping = [[<C-\>]], -- Change this to your preferred key combination
          direction = 'horizontal', -- You can change direction to 'vertical', 'float', etc.
          shade_terminals = true,
          start_in_insert = true, -- Automatically start in insert mode
        }
      end,
    },
  },
}
