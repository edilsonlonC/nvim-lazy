return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    require("telescope").setup({

      defaults = {
        preview = {
          treesitter = false, -- Deshabilita treesitter en previews
        },
        file_ignore_patterns = { "node_modules/.*", "dist", "%.class$", "target" },
        prompt_prefix = "  ",
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
          },
        },
        mappings = {
          i = { -- Mappings en el modo de inserción
            -- Cambiar las teclas de navegación
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- Mover hacia abajo
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Mover hacia arriba

            -- Cambiar la tecla de selección
            ["<CR>"] = require("telescope.actions").select_default, -- Seleccionar item
            ["<C-x>"] = require("telescope.actions").select_horizontal, -- Selección horizontal
            ["<C-v>"] = require("telescope.actions").select_vertical, -- Selección vertical
            ["<C-c>"] = require("telescope.actions").close, -- Cerrar Telescope
          },
          n = { -- Mappings en el modo normal
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- Mover hacia abajo
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Mover hacia arriba
            ["<CR>"] = require("telescope.actions").select_default, -- Seleccionar item
            ["<C-c>"] = require("telescope.actions").close, -- Cerrar Telescope
          },
        },
      },
    })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    -- Mapear gi para abrir implementaciones en Telescope
    vim.keymap.set("n", "gI", function()
      builtin.lsp_implementations()
    end, { desc = "LSP: Go to implementation (Telescope)" })

    -- Otros keymaps útiles de LSP con Telescope
    vim.keymap.set("n", "gd", function()
      builtin.lsp_definitions()
    end, { desc = "LSP: Go to definition (Telescope)" })

    vim.keymap.set("n", "gr", function()
      builtin.lsp_references()
    end, { desc = "LSP: Go to references (Telescope)" })

    vim.keymap.set("n", "<leader>ds", function()
      builtin.lsp_document_symbols()
    end, { desc = "LSP: Document symbols" })

    vim.keymap.set("n", "<leader>ws", function()
      builtin.lsp_workspace_symbols()
    end, { desc = "LSP: Workspace symbols" })
  end,
}
