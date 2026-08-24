return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "datsfilipe/vesper.nvim" },

  -- Configure LazyVim to load vesper
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "vesper",
    },
  },
}
