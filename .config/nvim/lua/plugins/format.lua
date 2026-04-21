return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end, { desc = "Format buffer" })
    end,
  },
}
