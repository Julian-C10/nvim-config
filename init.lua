require 'custom'

require 'plugins.lazy_setup'()

require('lazy').setup {
  require 'plugins.sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.catppuccin',
  require 'plugins.toggleterm',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.themes',
  require 'plugins.mini',
  require 'plugins.treesitter',
}

require 'custom.nerd-font-icons'
