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
  { src = "https://github.com/lewis6991/gitsigns.nvim.git" },
  { src = "https://github.com/kylechui/nvim-surround.git" },
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range('*')
  },
  -- themes
  { src = "https://github.com/EdenEast/nightfox.nvim.git" },
  { src = "https://github.com/bluz71/vim-nightfly-colors.git" },
  { src = "https://github.com/uloco/bluloco.nvim.git" },
  { src = "https://github.com/rktjmp/lush.nvim.git" },
  { src = "https://github.com/folke/tokyonight.nvim.git" },
  { src = "https://github.com/Tsuzat/NeoSolarized.nvim.git" },
  { src = "https://github.com/craftzdog/solarized-osaka.nvim.git" },
})

-- Force Neovim to recognize the plugins added above before requiring them
vim.cmd("packloadall")

-- 2. Setup (Direct requires)

-- Theme
require("solarized-osaka").setup({ styles = { functions = { bold = true } }, transparent = false })
vim.cmd.colorscheme("solarized-osaka")

-- UI & Utilities
require("lualine").setup({ options = { theme = "horizon" } })
require("colorizer").setup()
require("nvim-autopairs").setup()
require("nvim-surround").setup()
require("gitsigns").setup()

-- LSP
require("mason").setup()
vim.lsp.enable({ "lua_ls", "ty", "ruff", "vtsls", "jsonls", "gopls", "postgres_lsp", "rust_analyzer", "vue_ls" })
vim.lsp.config["rust_analyzer"] = { settings = { ["rust-analyzer"] = { diagnostics = { experimental = { enable = true } } } } }
vim.lsp.config["postgres_lsp"] = {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/postgres-language-server"), "lsp-proxy" },
  workspace_required = false,
  root_markers = { vim.fn.stdpath("config") .. "/postgres-language-server.jsonc" },
}
local vue_plugin_path =
    vim.fn.expand("~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin/")
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
-- Error message next to code
vim.diagnostic.config({ virtual_text = true })

-- Autocomplete and treesitter
require('blink.cmp').setup({ keymap = { preset = 'super-tab' }, })
-- :set filetype? to check filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', "python", "javascript", "typescript", "sql", "toml", "rust", "vue" },
  callback = function() vim.treesitter.start() end,
})
