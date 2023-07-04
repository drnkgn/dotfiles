require('telescope').load_extension('fzf')
require('telescope').setup {
  defaults = {
    preview = {
      hide_on_startup = true
    },
    layout_config = {
      center = {
        height = 0.5
      }
    },
    mappings = {
      i = {
        ["?"] = require('telescope.actions.layout').toggle_preview
      }
    },
  }
}
