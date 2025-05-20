require('config')

vim.opt.number = true         -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers

vim.opt.colorcolumn = "140"  -- Set vertical bar at column 80

vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.shiftwidth = 4     -- Indent with 4 spaces
vim.opt.tabstop = 4        -- Show tabs as 4 spaces
vim.opt.softtabstop = 4    -- Make backspace behave correctly


vim.o.exrc = true      -- Allow project-specific config
vim.o.secure = true    -- Prevent unsafe operations in local config



require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false, -- disables setting the background color.
    color_overrides = {
        mocha = {
            base = "#1e1e1e"
        },
    }
})

vim.cmd.colorscheme "catppuccin-mocha"

local project_local_config = vim.fn.getcwd() .. "/.nvim/init.lua"
if vim.fn.filereadable(project_local_config) == 1 then
    dofile(project_local_config)
end
