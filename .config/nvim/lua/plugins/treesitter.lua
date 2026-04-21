return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({})

      ts.install({
        "lua",
        "vim",
        "vimdoc",
        "bash",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "vim", "help", "sh", "bash", "zsh" },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
