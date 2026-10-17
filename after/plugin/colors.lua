function ColorMyPencils(color)
    color = color or "solarized-osaka"
    vim.cmd.colorscheme(color)

    -- Transparent background (remove these two lines if you don't want it)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

-- Keymaps to switch themes
vim.keymap.set("n", "<leader>cr", function()
    ColorMyPencils("rose-pine")
end, { desc = "Switch to rose-pine" })

vim.keymap.set("n", "<leader>cs", function()
    ColorMyPencils("solarized-osaka")
end, { desc = "Switch to solarized-osaka" })

