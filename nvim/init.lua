-- 0. Run config file
--
--
require("config")
require("keymaps")
vim.opt.termguicolors = true

-- 1. Register/Download Plugins
vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git" }, -- need this for telescope
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/windwp/nvim-autopairs.git" },
  { src = "https://github.com/NvChad/nvim-colorizer.lua.git" },
  { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
  { src = "https://github.com/EdenEast/nightfox.nvim.git" },
  { src = "https://github.com/lewis6991/gitsigns.nvim.git" },
  { src = "https://github.com/kylechui/nvim-surround.git" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim.git" },
})

-- Force Neovim to recognize the plugins added above before requiring them
vim.cmd("packloadall")

-- 2. Setup (Direct requires)

-- Theme
vim.cmd.colorscheme("nightfox")

-- UI & Utilities
require("lualine").setup({ options = { theme = "nightfox" } })
require("colorizer").setup()
require("nvim-autopairs").setup()
require("nvim-surround").setup()
require("gitsigns").setup()
require("ibl").setup()

-- LSP
require("mason").setup()
vim.lsp.enable({ "lua_ls", "basedpyright", "ruff", "vtsls" })
vim.lsp.config("basedpyright", {
  settings = { basedpyright = { analysis = { typeCheckingMode = "basic" }, }, },
})
local keymap = vim.keymap -- for conciseness
