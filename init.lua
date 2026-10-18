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

vim.opt.termguicolors = true
vim.opt.background = "dark"

local bg = "#1e1e1e"

local groups = {
  -- Core editor
  "Normal",
  "NormalFloat",
  "NormalNC",
  "EndOfBuffer",
  "NonText",
  "SignColumn",
  "FoldColumn",
  "MsgArea",
  "FloatBorder",
  "FloatTitle",
  "FloatFooter",
  -- Telescope
  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "TelescopeResultsNormal",
  "TelescopeResultsBorder",
  "TelescopePreviewNormal",
  "TelescopePreviewBorder",
  "TelescopeTitle",
  "TelescopePromptTitle",
  "TelescopeResultsTitle",
  "TelescopePreviewTitle",
  -- Other common UI backgrounds (statusline intentionally excluded)
  "Pmenu",
  "PmenuSbar",
  "TabLine",
  "TabLineFill",
  "WinBar",
  "WinBarNC",
}

local function apply_bg()
  for _, group in ipairs(groups) do
    -- Force exact hex background (updates only bg, keeps fg/etc.)
    vim.cmd("highlight " .. group .. " guibg=" .. bg)
  end
end

-- Re-apply after any colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_bg,
})

-- Apply now
apply_bg()
