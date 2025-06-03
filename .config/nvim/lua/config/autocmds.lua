-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function sync_gnome_theme()
  local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
  if not handle then
    return
  end
  local result = handle:read("*a") or ""
  if result:match("default") then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

sync_gnome_theme()

vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
  callback = sync_gnome_theme,
})
