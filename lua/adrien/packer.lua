-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- Colorschemes
  use({
    "rose-pine/neovim",
    as = "rose-pine",
  })

  use("craftzdog/solarized-osaka.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")

  -- Mason and LSP
  use({
    "mason-org/mason-lspconfig.nvim",
    requires = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Mason must be set up before mason-lspconfig
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "cssls",
          "ts_ls",
          "lua_ls",
          "pyright",
        },
      })

      vim.lsp.enable({
        "html",
        "cssls",
        "ts_ls",
        "lua_ls",
        "pyright",
      })
    end,
  })

  use({
    "maarutan/keycalm.nvim",
    config = function()
      require("key-calm").setup({
        message = "Hold it Cowboy! 🤠",
      })
    end,
  })
end)

