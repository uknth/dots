require("pckr").add({
	{ "JavaHello/spring-boot.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "mfussenegger/nvim-dap" },
	{
		"ibhagwan/fzf-lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("fzf-lua").setup({ "fzf-native" })
		end,
	},
	{
		"nvim-java/nvim-java",
		requires = {
			{ "JavaHello/spring-boot.nvim" },
			{ "MunifTanjim/nui.nvim" },
			{ "mfussenegger/nvim-dap" },
		},
		config = function()
			require("java").setup({
				lombok = {
					enable = true,
				},
				java_debug_adapter = {
					enable = false,
					version = "0.58.1",
				},
				spring_boot_tools = {
					enable = false,
				},
				jdk = {
					auto_install = false,
					version = "21",
				},
			})
		end,
	},
})

vim.keymap.set(
	"n",
	"<leader>sy",
	"<cmd>FzfLua lsp_live_workspace_symbols<cr>",
	{ desc = "[S]earch Workspace S[Y]mbols" }
)
