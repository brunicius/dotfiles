return {
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = true,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
  },
}
