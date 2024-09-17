local function create_new_note()
  vim.ui.input({ prompt = "Title" }, function (input)
    if input == nil then
      return
    end

    vim.cmd("ObsidianNew " .. input)
  end)
end

tt.obsidian = {
  create_new_note = create_new_note,
}
