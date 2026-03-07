-- Faster Neovim API type support for lua_ls (replaces vim.api.nvim_get_runtime_file)
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
