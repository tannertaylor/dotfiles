--- Opens multiple files for editing.
--- @param filesStr string A tilde (~) delimited string of file paths to open.
local function edit_multiple_files(filesStr)
  local files = vim.split(filesStr, '~', { trimempty = true })
  for _, file in ipairs(files) do
    vim.cmd("edit " .. file)
  end
end

--- Splits the given string into a table of single characters.
--- @param str string The string to split.
local function split_string_to_chars(str)
  local chars = { }
  for i = 1, #str do
    chars[i] = str:sub(i, i)
  end
  return chars
end

tt.utils = {
  edit_multiple_files = edit_multiple_files,
  split_string_to_chars = split_string_to_chars
}
