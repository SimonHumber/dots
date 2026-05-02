-- 0. Run config file
require("config")
require("keymaps")

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
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range('*')
  },
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

-- LSP
require("mason").setup()
vim.lsp.enable({ "lua_ls", "basedpyright", "ruff", "vtsls", "jsonls", "vue_ls", "gopls" })
vim.lsp.config("basedpyright", {
  settings = { basedpyright = { analysis = { typeCheckingMode = "basic" }, }, },
})
vim.lsp.config["vue_ls"] = { init_options = { vue = { hybridMode = true } } }
local vue_plugin_path =
"/Users/simontran/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"
vim.lsp.config["vtsls"] = {
  filetypes = { "javascript", "typescript", "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
          },
        },
      },
    },
  },
}

-- Autocomplete
require('blink.cmp').setup({ keymap = { preset = 'super-tab' }, })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', "python", "javascript", "typescript" },
  callback = function() vim.treesitter.start() end,
})
