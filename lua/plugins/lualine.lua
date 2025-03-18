return {
  "nvim-lualine/lualine.nvim",
  -- We do not need time in lualine
  -- It is provided by TMUX
  opts = function(_, opts)
    opts.sections.lualine_z = {}
  end,
}
