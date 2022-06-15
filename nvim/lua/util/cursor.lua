require('util.string')

local fn = vim.fn

local get_col = function()
  return fn.getcurpos()[3]
end

_G.cursor = {
  get_char = function(offset)
    offset = offset or 0

    local col = get_col() + offset
    if (col < 0) then
      return nil
    end

    local line = fn.getline('.')
    if (col > #line) then
      return nil
    end

    return string.char_at(line, col)
  end
}
