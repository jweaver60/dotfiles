require("definiv")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- require("lazy").setup({
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false, -- make sure we load this during setup if it is our main colorscheme
-- 		priority = 1000, -- make sure we load this before all other plugins start
-- 		config = function()
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme tokyonight]])
-- 		end,
-- 	},
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 	},
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.5",
-- 		-- or                              , branch = '0.1.x',
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 	},
-- 	{
-- 		"ThePrimeagen/harpoon",
-- 		branch = "harpoon2",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 	},
-- 	"mbbill/undotree",
-- 	"tpope/vim-fugitive",
-- 	{
-- 		"VonHeikemen/lsp-zero.nvim",
-- 		dependencies = {
-- 			"neovim/nvim-lspconfig",
-- 			"williamboman/mason.nvim",
-- 			"williamboman/mason-lspconfig.nvim",
-- 			"hrsh7th/nvim-cmp",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"hrsh7th/cmp-nvim-lua",
-- 			"L3MON4D3/LuaSnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 	},
-- 	{
-- 		"folke/which-key.nvim",
-- 		event = "VeryLazy",
-- 		init = function()
-- 			vim.o.timeout = true
-- 			vim.o.timeoutlen = 300
-- 		end,
-- 		opts = {
-- 			-- your configuration comes here
-- 			-- or leave it empty to use the default settings
-- 			-- refer to the configuration section below
-- 		},
-- 	},
-- 	{
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		branch = "v3.x",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 			"MunifTanjim/nui.nvim",
-- 			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
-- 		},
-- 	},
-- 	{ "echasnovski/mini.surround", version = "*" },
-- 	{ "echasnovski/mini.pairs", version = "*" },
-- 	"mfussenegger/nvim-dap",
-- 	"rcarriga/nvim-dap-ui",
-- 	"suketa/nvim-dap-ruby",
-- 	"tpope/vim-commentary",
-- 	{
-- 		"stevearc/conform.nvim",
-- 		opts = {},
-- 	},
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	},
-- 	{
-- 		"christoomey/vim-tmux-navigator",
-- 		cmd = {
-- 			"TmuxNavigateLeft",
-- 			"TmuxNavigateDown",
-- 			"TmuxNavigateUp",
-- 			"TmuxNavigateRight",
-- 			"TmuxNavigatePrevious",
-- 		},
-- 		keys = {
-- 			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
-- 			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
-- 			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
-- 			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
-- 			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
-- 		},
-- 	},
-- 	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
-- 	"github/copilot.vim",
-- })
