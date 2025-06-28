local nomap = vim.keymap.del
local map = vim.keymap.set

local modes = { "n", "v", "x", "o" }

local colemak = function(buffer)
  local opts = { noremap = true, silent = true }
  if buffer then opts.buffer = true end

  -- Movement
  map(modes, "n", "j", opts)
  map(modes, "e", "k", opts)
  map(modes, "i", "l", opts)
  -- Insert
  map(modes, "u", "i", opts)

  -- MOVEMENT
  map(modes, "N", "J", opts)
  map(modes, "E", "K", opts)
  map(modes, "I", "L", opts)
  -- INSERT
  map(modes, "U", "I", opts)

  -- Remainder
  map(modes, "l", "u", opts)
  map(modes, "j", "e", opts)
  map(modes, "k", "n", opts)

  -- REMAINDER
  map(modes, "L", "U", opts)
  map(modes, "J", "E", opts)
  map(modes, "K", "N", opts)
end

colemak(false)

-- nvim-tree configured in configs/nvimtree.lua
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "NvimTree_1",
--   callback = function()
--     colemak(true)
--   end
-- })

