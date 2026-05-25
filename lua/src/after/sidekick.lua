local config = require("config")

-- Portable resolver for the `claude` binary.
--   1. Windows: prefer the bundled Claude Desktop binary (.exe direct,
--      skipping any PATH wrapper that may flake inside nvim's spawned cmd).
--   2. Otherwise (Linux/macOS/WSL): use whatever is on PATH.
local function find_windows_desktop_binary()
    if vim.fn.has("win32") ~= 1 then return nil end
    local base = vim.fn.expand("$APPDATA") .. "/Claude/claude-code"
    if vim.fn.isdirectory(base) ~= 1 then return nil end
    local best, best_mtime = nil, 0
    for _, dir in ipairs(vim.fn.glob(base .. "/*", false, true)) do
        local exe = dir .. "/claude.exe"
        if vim.fn.filereadable(exe) == 1 then
            local mt = vim.fn.getftime(exe)
            if mt > best_mtime then
                best, best_mtime = exe, mt
            end
        end
    end
    return best
end

local function resolve_claude()
    local win = find_windows_desktop_binary()
    if win then return win end

    if vim.fn.executable("claude") == 1 then
        local p = vim.fn.exepath("claude")
        if p ~= "" then return p end
        return "claude"
    end

    return nil
end

local claude_path = resolve_claude()
if not claude_path then
    vim.schedule(function()
        vim.notify(
            "sidekick.nvim: `claude` not found.\n" ..
            "Install with: npm install -g @anthropic-ai/claude-code",
            vim.log.levels.WARN
        )
    end)
end

require("sidekick").setup({
    cli = {
        win = {
            split = {
                width = 0.35,
            },
        },
        tools = {
            claude = claude_path and { cmd = { claude_path } } or nil,
        },
    },
})

local sk = require("sidekick.cli")

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

map({ "n", "v" }, config.claude.toggle, function() sk.toggle({ name = "claude", focus = true }) end, "Claude: toggle window")
map({ "n", "v" }, config.claude.focus,  function() sk.focus({ name = "claude" }) end,                 "Claude: focus window")
map({ "n", "v" }, config.claude.send,   function() sk.send({ name = "claude", msg = "{this}" }) end,  "Claude: send buffer/selection")
map("n",          config.claude.prompt, function() sk.prompt({ name = "claude" }) end,                "Claude: pick prompt template")
map("n",          config.claude.ask,    function() sk.ask({ name = "claude" }) end,                   "Claude: ask (input prompt)")
