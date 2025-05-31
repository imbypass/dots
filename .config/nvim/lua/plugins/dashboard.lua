return {
    "folke/snacks.nvim",
    opts = function(_, opts)
        local logo = [[
  ███╗   ██╗██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██║   ██║██║████╗ ████║
  ██╔██╗ ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

        -- Split the logo into lines and assign it to the dashboard header
        opts.dashboard.header = vim.split(logo, "\n", { trimempty = true })

        return opts
    end,
}
