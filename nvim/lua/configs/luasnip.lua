local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- local f = luasnip.function_node

luasnip.config.set_config {
  updateevents = "TextChanged,TextChangedI",
  store_selection_keys="<tab>",
}

require("luasnip.loaders.from_lua")
  .load({ paths = "~/.config/nvim/lua/snippets/" })
