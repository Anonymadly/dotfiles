return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.on_attach = require("configs.nvimtree").on_attach
      return opts
    end
  },

  {
    "lambdalisue/vim-suda",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>sw", "<cmd> SudaWrite <cr>", { desc = "SudaWrite" })
      vim.keymap.set("n", "<leader>sr", "<cmd> SudaRead <cr>", { desc = "SudaRead" })
    end
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
