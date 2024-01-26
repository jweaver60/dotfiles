return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- "suketa/nvim-dap-ruby",
	},

	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<leader>lp",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			{ "n", "v" },
		},
		{
			"<leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			{ "n", "v" },
		},
		{
			"<leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
		},
		{
			"<leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
		},
		{
			"<leader>dc",
			function()
				require("dapui").toggle()
			end,
		},
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.adapters.ruby = function(callback, config)
			vim.defer_fn(function()
				callback({ type = "executable", command = "bundle", args = { "exec", "rdbg", "--attach" } })
			end, config.waiting)
		end

		dap.configurations.ruby = {
			{
				type = "ruby",
				name = "Attach to Rails server",
				request = "attach",
				waiting = 1000,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,

	-- config = function()
	-- 	require("dapui").setup()
	-- 	require("dap-ruby").setup()
	-- end,
}
