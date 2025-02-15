return {
  -- Configure LazyVim to load catppuccin
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to the pane below" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to the pane above" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to the right pane" },
    },
  },
}
