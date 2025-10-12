return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-haiku-20241022",
        timeout = 1000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0,
          max_tokens = 8000,
        },
      },
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

-- return {
--   "yetone/avante.nvim",
--   -- if you want to build from source then do make BUILD_FROM_SOURCE=true
--   -- ⚠️ must add this setting! ! !
--   build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
--     or "make",
--   event = "VeryLazy",
--   version = false, -- Never set this value to "*"! Never!
--   ---@module 'avante'
--   ---@type avante.Config
--   opts = {
--     -- Optimizaciones de rendimiento
--     auto_suggestions = false, -- Desactiva sugerencias automáticas para reducir llamadas API
--     auto_set_keymaps = true,
--     auto_set_highlight_group = true,
--     support_paste_from_clipboard = false, -- Reduce procesamiento innecesario
--
--     -- add any opts here
--     -- this file can contain specific instructions for your project
--     instructions_file = "avante.md",
--     -- for example
--     provider = "claude",
--     providers = {
--       claude = {
--         endpoint = "https://api.anthropic.com",
--         model = "claude-3-haiku-20240307", -- Claude 3 Haiku - El modelo más barato
--         timeout = 60000, -- Aumentado para evitar timeouts
--         extra_request_body = {
--           temperature = 0.3, -- Reducido para respuestas más consistentes y rápidas
--           max_tokens = 2048, -- Reducido para respuestas más rápidas
--           stop_sequences = { "</code>", "```" }, -- Para detener generación temprano si es código
--         },
--       },
--       -- Configuración alternativa con Claude 3.5 Haiku (más nuevo y barato)
--       claude_haiku_35 = {
--         endpoint = "https://api.anthropic.com",
--         model = "claude-3-5-haiku-20241022", -- Claude 3.5 Haiku (más reciente)
--         timeout = 60000,
--         extra_request_body = {
--           temperature = 0.3,
--           max_tokens = 2048,
--         },
--       },
--       moonshot = {
--         endpoint = "https://api.moonshot.ai/v1",
--         model = "kimi-k2-0711-preview",
--         timeout = 30000, -- Timeout in milliseconds
--         extra_request_body = {
--           temperature = 0.75,
--           max_tokens = 32768,
--         },
--       },
--     },
--   },
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "nvim-mini/mini.pick",
--     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--     "ibhagwan/fzf-lua", -- for file_selector provider fzf
--     "stevearc/dressing.nvim", -- for input provider dressing
--     "folke/snacks.nvim", -- for input provider snacks
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
