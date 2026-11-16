return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				custom = { "^.git$" },
				git_ignored = false,
			},
		})
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Explorer" })
    vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { silent = true, desc = "Find Current File in Tree" })
  end,
}
