-- imports
require('util.string')
require('util.cursor')
require('util.table')

-- aliases
local map = vim.keymap.set

-- general keymaps (e.g., save, undo, redo, etc.)
map({ 'n', 'i' }, '<c-s>', '<cmd>w<cr>')
map('n', '<c-z>', 'u')
map('i', '<c-z>', '<esc>ua')
map('n', '<c-_>', '<cmd>CommentToggle<cr>') -- the underscore maps to forward slash

-- window keymaps
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- keymaps to plugins
map('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
map('n', 'gf', '<cmd>Telescope find_files<cr>')

-- map auto-closing character pairs
local char_pairs = {
  ['\''] = '\'',
  ['\"'] = '\"',
  ['('] = ')',
  ['{'] = '}',
  ['['] = ']'
}

for open_char, close_char in pairs(char_pairs) do
  if (open_char == close_char) then
    map('i', open_char, function()
      local next_char = cursor.get_char()
      if (next_char and next_char == close_char) then
        return '<right>'
      end

      return open_char .. close_char .. '<left>'
    end, { expr = true })
  else
    map('i', open_char, open_char .. close_char .. '<left>', {})
    map('i', close_char, function()
      local next_char = cursor.get_char()
      if (next_char and next_char == close_char) then
        return '<right>'
      end

      return close_char
    end, { expr = true })
  end
end

map('i', '<tab>', function()
  local next_char = cursor.get_char()
  if (next_char and table.has_value(char_pairs, next_char)) then
    return '<right>'
  end

  return '<tab>'
end, { expr = true })
