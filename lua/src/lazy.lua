local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins from the plugins folder.
require("lazy").setup({
    spec = {
        { import = "src.plugins" },
    },
})

-- Configure plugins after they are loaded
require("src.after.bufferline")
require("src.after.lspzero")
require("src.after.lualine")
require("src.after.mason")
require("src.after.neotree")
require("src.after.telescope")
require("src.after.toggleterm")
require("src.after.treesitter")
