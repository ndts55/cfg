-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    local Terminal = require("toggleterm.terminal").Terminal

    vim.keymap.set("n", "<leader>rp", function()
      local file = vim.fn.expand("%:p")

      if not _PYTHON_TERM then
        _PYTHON_TERM = Terminal:new({
          cmd = "python3 " .. file,
          hidden = true,
          direction = "horizontal",
          close_on_exit = false,
          on_exit = function()
            _PYTHON_TERM = nil
          end,
        })
      else
        _PYTHON_TERM:shutdown()
        _PYTHON_TERM = Terminal:new({
          cmd = "python3 " .. file,
          hidden = true,
          direction = "horizontal",
          close_on_exit = false,
        })
      end

      _PYTHON_TERM:toggle()
    end, { buffer = true, desc = "Run Python script" })
  end,
})
