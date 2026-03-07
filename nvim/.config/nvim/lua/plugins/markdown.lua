-- Markdown rendering in the terminal
-- Repo: https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    opts = {
      preset = "obsidian",
      completions = { lsp = { enabled = true } },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      pipe_table = {
        style = "full",
      },
    },
  },
}
