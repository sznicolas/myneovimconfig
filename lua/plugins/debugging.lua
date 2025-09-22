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
		vim.keymap.set("n", "<Leader>c", dap.continue, {})
		vim.keymap.set("n", "<Leader>s", dap.step_over, {})
		vim.keymap.set("n", "<Leader>S", dap.step_into, {})
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, {})
	end,
}
