return {
  --{
  --  "neanias/everforest-nvim",
  --  config = function()
  --    vim.cmd([[colorscheme everforest]])
  --    require("everforest").setup({
  --      background = "hard",
  --    })
  --  end
  --},
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.cmd([[colorscheme nord]])
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "nord",
        }
      })
    end
  }
}
