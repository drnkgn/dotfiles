local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    config = function()
      require("oil").setup({
        columns = {
          "permissions",
          "size",
          "mtime"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- credits to folke: https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("configs/lspconfig")
    end
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs/luasnip")
    end
  },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("configs/telescope")
    end,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs/treesitter")
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function()
      require("fidget").setup{
        text = {
          done = ""
        }
      }
    end
  },
  "tpope/vim-fugitive",
  "rktjmp/lush.nvim",
  "drnkgn/poser-nvim",
})

require("options")
require("autocmd")
require("mapping")
