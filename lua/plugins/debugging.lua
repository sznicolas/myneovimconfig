return {
	"mfussenegger/nvim-dap",
	dependencies = { "mfussenegger/nvim-dap-python", "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		-- require('dap-python').setup('debugpy-adapter')
		require("dap-python").setup("uv")
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
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>ds", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dS", dap.step_into, {})
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
	end,
}
