-- Configuración de Harpoon2 con integración de Telescope
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    -- Agregar file
    vim.keymap.set("n", "<leader>fa", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Add file" })

    -- OPCIÓN 1: Usar Telescope para el menú de Harpoon (RECOMENDADO)
    vim.keymap.set("n", "<C-e>", function()
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      toggle_telescope(harpoon:list())
    end, { desc = "Harpoon: Open in Telescope" })

    -- OPCIÓN 2: Mantener el menú original de Harpoon con otro keymap
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>fr", function()
      require("harpoon"):list():remove()
    end)
    -- Selección directa de archivos
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon: Select 1" })

    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon: Select 2" })

    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon: Select 3" })

    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon: Select 4" })

    -- Navegación prev/next
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: Previous" })

    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon: Next" })
  end,
}
