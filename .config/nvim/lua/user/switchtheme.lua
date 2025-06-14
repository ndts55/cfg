local M = {}

function M.switch_theme(theme)
  local background = (theme == "dark") and "dark" or "light"
  vim.api.nvim_set_option_value("background", background, {})
  if background == "light" then
    vim.cmd("colorscheme catppuccin-latte")
  else
    vim.cmd("colorscheme catppuccin-mocha")
  end
end

function M.setup()
  vim.api.nvim_create_user_command("SwitchTheme", function(opts)
    M.switch_theme(opts.args)
  end, {
    nargs = 1,
    complete = function()
      return { "light", "dark" }
    end,
  })
end

return M
