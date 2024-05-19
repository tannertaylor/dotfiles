-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local transparentGroups = { "Comment" }
for i, v in ipairs(transparentGroups) do
  local current = vim.api.nvim_get_hl(0, { name = v })
  local new = vim.tbl_deep_extend("force", current, { ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, v, new)
end
