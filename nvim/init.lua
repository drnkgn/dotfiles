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
    "neovim/nvim-lspconfig",
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
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --c onfig Release && cmake --install build --prefix build"
    },
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
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
  "sjl/badwolf",
  "tpope/vim-fugitive"
})

require("options")
require("autocmd")
require("mapping")
