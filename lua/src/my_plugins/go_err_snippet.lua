local M = {}

function M.insert_if_err()
    local filetype = vim.bo.filetype
    if filetype ~= "go" then
        vim.notify("Not a Go file", vim.log.levels.WARN)
        return
    end
    

    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local currentline = vim.api.nvim_get_current_line()

    local indent = currentline:match("^%s*") or ""

    local lines = {
        indent .. "if err != nil {",
        indent .. "   ",
        indent .. "}"
    }

    vim.api.nvim_buf_set_lines(0, row, row, true, lines)
    vim.api.nvim_win_set_cursor(0, {row +1, 4})
end

return M
