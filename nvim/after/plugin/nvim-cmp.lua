local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(), -- Move down in the menu
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Move up in the menu
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Enabled autocomplete with full select
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
    ["<Esc>"] = cmp.mapping.close(), -- Close completion menu
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})
