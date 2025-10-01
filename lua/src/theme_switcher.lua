-- Theme switcher utility
local M = {}

-- Available themes with their proper names
M.themes = {
    -- VS Code Ports
    { name = "GitHub Dark", colorscheme = "github_dark" },
    { name = "GitHub Light", colorscheme = "github_light" },
    { name = "Dracula", colorscheme = "dracula" },
    { name = "Material Ocean", colorscheme = "material-ocean" },
    { name = "Material Palenight", colorscheme = "material-palenight" },
    { name = "Material Deep Ocean", colorscheme = "material-deep-ocean" },
    { name = "Nord", colorscheme = "nord" },
    { name = "Tokyo Night", colorscheme = "tokyonight" },
    { name = "Tokyo Night Storm", colorscheme = "tokyonight-storm" },
    { name = "Tokyo Night Moon", colorscheme = "tokyonight-moon" },
    
    -- Existing themes
    { name = "Dark Flat", colorscheme = "dark_flat" },
    { name = "Catppuccin", colorscheme = "catppuccin" },
    { name = "Gruvbox", colorscheme = "gruvbox" },
    { name = "One Dark", colorscheme = "onedark" },
}

-- Current theme index
local current_index = 1

-- Function to set theme
function M.set_theme(colorscheme)
    pcall(function()
        vim.cmd.colorscheme(colorscheme)
        print("Theme changed to: " .. colorscheme)
    end)
end

-- Function to cycle to next theme
function M.next_theme()
    current_index = current_index % #M.themes + 1
    local theme = M.themes[current_index]
    M.set_theme(theme.colorscheme)
end

-- Function to cycle to previous theme
function M.prev_theme()
    current_index = current_index - 2
    if current_index < 1 then
        current_index = #M.themes - 1
    end
    current_index = current_index % #M.themes + 1
    local theme = M.themes[current_index]
    M.set_theme(theme.colorscheme)
end

-- Function to show theme picker
function M.pick_theme()
    local themes = {}
    for i, theme in ipairs(M.themes) do
        table.insert(themes, string.format("%d. %s (%s)", i, theme.name, theme.colorscheme))
    end
    
    vim.ui.select(themes, {
        prompt = "Select a theme:",
    }, function(choice, idx)
        if idx then
            current_index = idx
            M.set_theme(M.themes[idx].colorscheme)
        end
    end)
end

-- Setup function to initialize keymaps
function M.setup()
    -- Keymaps for theme switching
    vim.keymap.set('n', '<leader>tn', M.next_theme, { desc = 'Next theme' })
    vim.keymap.set('n', '<leader>tp', M.prev_theme, { desc = 'Previous theme' })
    vim.keymap.set('n', '<leader>tt', M.pick_theme, { desc = 'Pick theme' })
    
    -- Commands
    vim.api.nvim_create_user_command('ThemeNext', M.next_theme, { desc = 'Switch to next theme' })
    vim.api.nvim_create_user_command('ThemePrev', M.prev_theme, { desc = 'Switch to previous theme' })
    vim.api.nvim_create_user_command('ThemePick', M.pick_theme, { desc = 'Pick a theme from list' })
end

return M
