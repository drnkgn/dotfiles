vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("twospace", { clear = true }),
  pattern = {
    "*.html",
    "*.css",
    "*.jsx",
    "*.tsx",
    "*.js",
    "*.ts",
    "*.vb",
    "*.lua"
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end
})
