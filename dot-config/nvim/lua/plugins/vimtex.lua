return {

  "lervag/vimtex",
  init = function()
    -- Force the viewer method
    vim.g.vimtex_view_method = "zathura"

    -- Use your NVIM_LISTEN_ADDRESS socket
    local socket = os.getenv("NVIM_LISTEN_ADDRESS") or "~/.nvimsocket"
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_general_options = string.format(
      [[--synctex-forward @line:@col:@tex --synctex-editor-command 'nvim --server %s --remote +%%{line} %%{input}']],
      socket
    )

    -- Compiler setup
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      continuous = 1,
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
  end,
}
