-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- If file's base directory is different, CD to it.
-- Prefer git root if available
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local file_dir = vim.fn.expand("%:p:h")
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(file_dir) .. " rev-parse --show-toplevel")[1]
    local pwd = vim.fn.getcwd()

    local new_cwd = vim.fn.isdirectory(git_root) == 1 and git_root
      or (vim.fn.isdirectory(file_dir) == 1 and file_dir or nil)

    if new_cwd and pwd ~= new_cwd then
      vim.cmd("lcd" .. new_cwd)
      vim.api.nvim_notify("Changed cwd to " .. new_cwd, vim.log.levels.INFO, { title = "Auto CD" })
    end
  end,
})
