local success, git_signs = pcall(require, "gitsigns")
if not success then
    return
end

git_signs.setup()
