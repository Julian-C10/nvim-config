require 'custom'

require 'plugins.lazy_setup'()

require('lazy').setup {
  require 'plugins.sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.catppuccin',
  require 'plugins.toggleterm',
  require 'plugins.telescope',
  require 'plugins.treesitter',
}

require 'custom.nerd-font-icons'
