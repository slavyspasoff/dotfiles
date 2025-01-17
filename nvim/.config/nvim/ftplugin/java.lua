local on_attach = function(client, buffnr)
  local keymap = vim.keymap.set
  local telescope = require("telescope.builtin")

  keymap("n", "<leader>gr", function()
    telescope.lsp_references()
  end, { noremap = true, silent = true, buffer = buffnr, desc = "Reference" })
  keymap("n", "<leader>gd", function()
    telescope.lsp_definitions({ reuse_win = true })
  end, { noremap = true, silent = true, buffer = buffnr, desc = "Definitions" })
  keymap("n", "<leader>gi", function()
    telescope.lsp_implementations({ reuse_win = true })
  end, { noremap = true, silent = true, buffer = buffnr, desc = "Implementations" })
  keymap("n", "<leader>gT", function()
    telescope.lsp_type_definitions({ reuse_win = true })
  end, { noremap = true, silent = true, buffer = buffnr, desc = "Type Definitions" })
  keymap(
    "n",
    "<leader>gD",
    vim.lsp.buf.declaration,
    { noremap = true, silent = true, buffer = buffnr, desc = "Declarations" }
  )
  keymap("n", "<leader>cr", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = buffnr, desc = "Rename" })
  keymap(
    "n",
    "<leader>ca",
    vim.lsp.buf.code_action,
    { noremap = true, silent = true, buffer = buffnr, desc = "Actions" }
  )
  keymap(
    "n",
    "<leader>cd",
    ":lua vim.diagnostic.open_float(nil, { focus = false, scope = 'line' })<CR>",
    { noremap = true, silent = true, buffer = buffnr, desc = "Diagnostic" }
  )
  keymap("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = buffnr })
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, buffer = buffnr })
end

local config = {
  cmd = { "/home/spasoff/.local/share/nvim/mason/packages/jdtls/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  on_attach = on_attach,
}
-- require("jdtls").start_or_attach(config)
