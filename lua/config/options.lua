-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Do not use system registers for nvim
vim.opt.clipboard = ""

-- Enable OSC 52 provider, make sure the option is enabled
-- in the terminal emulator of your choice
--
-- Additionally, it is only enabled if vscode env is not found
-- This helps in cases where user is using the same nvim config
-- for both VSCode and Neovim
if not vim.g.vscode then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
