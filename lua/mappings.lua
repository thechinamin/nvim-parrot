require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- fullscreen floating terminal (overrides NvChad's default <A-i> size)
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = { row = 0, col = 0, width = 1, height = 1, border = "none" },
  }
end, { desc = "terminal toggle fullscreen floating term" })

-- telescope find dir (requires `fd` on PATH)
map("n", "<leader>fd", function()
  require("telescope.builtin").find_files {
    prompt_title = "Find Directory",
    find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
    attach_mappings = function(prompt_bufnr, map_key)
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"
      local function cd_to_selection()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd("cd " .. vim.fn.fnameescape(entry[1]))
        print("cwd -> " .. entry[1])
      end
      map_key("i", "<CR>", cd_to_selection)
      map_key("n", "<CR>", cd_to_selection)
      return true
    end,
  }
end, { desc = "telescope find dir (cd)" })

-- harpoon
map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "harpoon add file" })
map("n", "<C-e>", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "harpoon toggle quick menu" })

map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "harpoon to file 1" })
map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "harpoon to file 2" })
map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "harpoon to file 3" })
map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "harpoon to file 4" })
