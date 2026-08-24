-- Mason configuration
-- Auto-install LSPs, formatters, and linters across machines

return {
  -- Configure mason to ensure tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "python-lsp-server",
        "typescript-language-server",

        -- Formatters
        "biome", -- JavaScript/TypeScript/JSON formatter
        "stylua", -- Lua formatter
        "shfmt", -- Shell formatter
        "ruff", -- Python formatter/linter

        -- Tree-sitter CLI (for grammar development)
        "tree-sitter-cli",
      },
    },
  },

  -- Configure treesitter parsers to auto-install
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
}

