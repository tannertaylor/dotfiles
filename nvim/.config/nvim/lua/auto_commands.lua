local create_augroup = function(name, auto_commands)
    local cmd = vim.cmd
    cmd("augroup " .. name)
    cmd("autocmd!")
    for _, auto_command in ipairs(auto_commands) do
        cmd("autocmd " .. table.concat(auto_command, " "))
    end
    cmd("augroup END")
end

create_augroup("colors", {
    { "ColorScheme", "*", ":highlight Normal ctermbg=None guibg=None" }
})
