return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function() 
        ensure_installed = {"lua", "javascript", "typescript"}
        highlight = { enable = true }
        indent = { enable = true }
    end
}
