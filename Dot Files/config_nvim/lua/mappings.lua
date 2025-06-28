require "nvchad.mappings"

-- Disabled mappings --
local nomap = vim.keymap.del

-- nomap("n", "<leader>la")

-- New mappings --
local map = vim.keymap.set

-- Insert --
-- Go to end of line
map("i", "<C-k>", "<End>", { desc = "Go to end of line" })
-- Movement in editor
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-n>", "<Down>", { desc = "Move down" })
map("i", "<C-e>", "<Up>", { desc = "Move up" })
map("i", "<C-i>", "<Right>", { desc = "Move right" })

-- Normal --
-- Enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })
-- Toggle NvDash
map("n", "<leader>td", "<cmd> Nvdash <cr>", { desc = "Toggle NvChad Dashboard" })
-- Misc
map("n", "<leader>ld", "<cmd> lua vim.diagnostic.open_float() <cr>", { desc = "Floating diagnostic" })
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <cr>", { desc = "Code actions" })
-- Switch between windows
-- map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-n>", "<C-w>j", { desc = "Window down" })
map("n", "<C-e>", "<C-w>k", { desc = "Window up" })
map("n", "<C-i>", "<C-w>l", { desc = "Window right" })
-- map("n", "<C-w>h", "<C-w>h", { desc = "Window left" })
map("n", "<C-w>n", "<C-w>j", { desc = "Window down" })
map("n", "<C-w>e", "<C-w>k", { desc = "Window up" })
map("n", "<C-w>i", "<C-w>l", { desc = "Window right" })
map("n", "<C-q>", "<C-w>q", { desc = "Close window" })
-- Tabufline
map("n", "<A-left>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move buffer left" })
map("n", "<A-right>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move buffer right" })

for i = 1, 9, 1 do
   vim.keymap.set("n", string.format("<A-%s>", i), function()
     vim.api.nvim_set_current_buf(vim.t.bufs[i])
   end)
 end

-- Move lines of code
map("n", "<M-n>", "<cmd> move +1 <cr>", { desc = "Move line down" })
map("n", "<M-e>", "<cmd> move -2 <cr>", { desc = "Move line up" })
map("n", "<M-N>", "<cmd> t . <cr>", { desc = "Duplicate line down" })
map("n", "<M-E>", "<cmd> t -1 <cr>", { desc = "Duplicate line up" })

-- Multiple modes --
-- Save using Control + S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save" })
-- Resize splits using arrow keys
map({ "n", "i", "v" }, "<up>", "<cmd> res +5 <cr>", { desc = "Increase height by 5" })
map({ "n", "i", "v" }, "<down>", "<cmd> res -5 <cr>", { desc = "Decrease height by 5" })
map({ "n", "i", "v" }, "<left>", "<cmd> vertical resize -5 <cr>", { desc = "Decrease width by 5" })
map({ "n", "i", "v" }, "<right>", "<cmd> vertical resize +5 <cr>", { desc = "Increase width by 5" })

-- Colemak --
-- local nvimrc = "$HOME/.config/nvim/"
-- vim.cmd("source " .. nvimrc .. "lua/colemak.vim")
require("colemak")

