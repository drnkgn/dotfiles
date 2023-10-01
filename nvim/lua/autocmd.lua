vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("twospace", { clear = true }),
  pattern = {
    "*.html",
    "*.css",
    "*.jsx",
    "*.tsx",
    "*.vb",
    "*.lua",
    "*.tex",
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("termnu", { clear = true }),
  pattern = "*",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
})

local latex = vim.api.nvim_create_augroup("latex", { clear = true})
vim.api.nvim_create_user_command("TexOnSaveToggle", function()
  if vim.b.tex_onsave_state then
    print "OnSave disabled..."
    vim.b.tex_onsave_state = false
    vim.api.nvim_del_autocmd(vim.b.tex_onsave_auid)
  else
    print "OnSave enabled..."
    vim.b.tex_onsave_state = true
    vim.b.tex_onsave_auid = vim.api.nvim_create_autocmd("BufWritePost", {
      group = latex,
      pattern = "*.tex",
      callback = function()
        vim.cmd(":TexlabBuild")
      end
    })
  end
end, {})

vim.api.nvim_create_autocmd("FileType", {
  group = latex,
  pattern = { "tex" },
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.b.tex_onsave_state = false
    vim.api.nvim_buf_set_keymap(0,
                                "n",
                                "<leader>lb",
                                ":TexlabBuild<cr>:echo 'Building...'<cr>",
                                opts)
    vim.api.nvim_buf_set_keymap(0,
                                "n",
                                "<leader>ll",
                                ":TexOnSaveToggle<cr>",
                                opts)
  end
})
