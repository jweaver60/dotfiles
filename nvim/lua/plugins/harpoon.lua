return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { '<leader>a', function() require('harpoon'):list():append() end },
    { '<leader>1', function() require('harpoon'):list():select(1) end },
    { '<leader>2', function() require('harpoon'):list():select(2) end },
    { '<leader>3', function() require('harpoon'):list():select(3) end },
    { '<leader>4', function() require('harpoon'):list():select(4) end },
    { '<leader>0', function() require('harpoon'):list():clear() end },
  },

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

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

    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end
}
