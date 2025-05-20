-- Import LSP and Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls","ts_ls", "html", "cssls", "intelephense", },
})

-- Setup LSP for Golang
local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      staticcheck = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
    },
  },
})

-- JavaScript / TypeScript
lspconfig.ts_ls.setup({})

-- HTML
lspconfig.html.setup({})

-- CSS
lspconfig.cssls.setup({})

lspconfig.intelephense.setup({
    settings = {
    intelephense = {
      licenseKey = os.getenv("INTELEPHENSE_LICENSE_KEY"),
      files = {
        maxSize = 500000000, -- 5 MB
      },
      format = {
        enable = false, -- disable formatting if you're using php-cs-fixer
      },
      stubs ={
        "Core", "standard", "date", "json", "spl", "pcre", "ctype", "curl", "mbstring",
        "SimpleXML", "xml", "PDO", "pdo_mysql", "openssl", "zlib", "sockets",
        "filter", "hash", "iconv", "readline", "session", "tokenizer", "dom",
        "libxml", "Reflection", "fileinfo", "SPL", "mysql", "mysqli", "pcntl"
      },
      environment = {
        phpVersion = "8.2",
        includePaths ={}
      }
    }
  }
})
