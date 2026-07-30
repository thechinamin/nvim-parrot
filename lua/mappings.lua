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
