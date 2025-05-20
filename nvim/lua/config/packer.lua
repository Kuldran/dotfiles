-- Bootstrap Packer (if not installed)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", install_path
  })
  vim.cmd("packadd packer.nvim")
end

-- Auto-reload Packer config when modifying this file
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerSync]])

-- Load Packer and Plugins
require("packer").startup(function(use)
  use("wbthomason/packer.nvim")  -- Packer itself

  -- LSP Support
  use("neovim/nvim-lspconfig")   -- Basic LSP support
  use("williamboman/mason.nvim") -- LSP manager
  use("williamboman/mason-lspconfig.nvim") -- Bridge between mason and lspconfig

  -- Autocompletion
  use("hrsh7th/nvim-cmp")        -- Completion engine
  use("hrsh7th/cmp-nvim-lsp")    -- LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") -- Snippets source
  use("L3MON4D3/LuaSnip")        -- Snippets plugin

  -- Treesitter for syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Golang Specific
  use("ray-x/go.nvim")           -- Go plugin
  use("ray-x/guihua.lua")        -- Floating window library (dependency for go.nvim)

  -- Prettier
  -- use("jose-elias-alvarez/null-ls.nvim")

  -- UI Enhancements
  use("nvim-lualine/lualine.nvim") -- Status line
  use{
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",  -- (Optional) Use a stable release
	requires = { "nvim-lua/plenary.nvim" }
  } -- Fuzzy finder
  
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
      "nvimtools/none-ls.nvim"
  }

  use {
  'stephpy/vim-php-cs-fixer',
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  -- Install plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

