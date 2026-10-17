vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.name == "emmet_language_server" then
			-- Enable completion, but don't trigger it automatically.
			vim.lsp.completion.enable(
				true,
				client.id,
				event.buf,
				{ autotrigger = false }
			)

			-- Press Ctrl-Space to request Emmet suggestions.
			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end, { buffer = event.buf, desc = "Trigger Emmet completion" })
		end
	end,
})

require("adrien")
vim.lsp.enable("emmet_language_server")
