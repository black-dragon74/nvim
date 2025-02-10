-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- If file's base directory is different, CD to it.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local file_dir = vim.fn.expand("%:p:h")
    local pwd = vim.fn.getcwd()

    if file_dir ~= pwd and vim.fn.isdirectory(file_dir) == 1 then
      vim.cmd("lcd" .. file_dir)
      vim.api.nvim_notify("Changed cwd to " .. file_dir, vim.log.levels.INFO, { title = "Auto CD" })
    end
  end,
})
