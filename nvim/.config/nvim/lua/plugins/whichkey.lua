local config = function()
  local wk = require("which-key")
  wk.add({
    { "<leader>c", group = "Code" },
    { "<leader>b", group = "Buffer" },
    { "<leader>e", group = "Explorer" },
    { "<leader>f", group = "Find" },
    { "<leader>q", group = "Quit" },
    { "<leader>s", group = "Surround" },
    { "<leader>g", group = "Go to" },
    { "<leader>sa", desc = "Add" },
    { "<leader>sd", desc = "Delete" },
    { "<leader>sf", desc = "Find" },
    { "<leader>sF", desc = "Find Left" },
    { "<leader>sh", desc = "Highlight" },
    { "<leader>sr", desc = "Replace" },
    { "<leader>sn", desc = "Update N Lines" },
  })
  wk.setup({
    icons = { mappings = false },
  })
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = config,
}
