return {
    "catppuccin/nvim",
    lazy=false,
    name="catppuccin",
    priority=1000,
    flavour="mocha",
    transparent_background = true,
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end
}
