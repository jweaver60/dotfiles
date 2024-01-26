return {
	"nvim-neotest/neotest",

	lazy = true,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zidhuss/neotest-minitest",
	},

	keys = {
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run current file",
		},
		{
			"<leader>ta",
			function()
				require("neotest").run.run({ suite = true })
			end,
			desc = "Run entire test suite",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle output panel",
		},
	},

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-minitest")({
					test_cmd = function()
						return vim.tbl_flatten({
							"bin/rails",
							"test",
						})
					end,
				}),
			},
		})
	end,
}
