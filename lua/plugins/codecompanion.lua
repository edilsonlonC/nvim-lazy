return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "ANTHROPIC_API_KEY",
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "anthropic", -- Usa Claude por defecto
        },
        inline = {
          adapter = "anthropic",
        },
        agent = {
          adapter = "anthropic",
        },
      },
    })
  end,
}
