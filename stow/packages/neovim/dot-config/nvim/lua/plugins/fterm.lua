local terminals = { }
local scratches = { }

--- Loads default terminals with preconfigured tools.
local function load_tool_terminals()
  terminals.lazygit = require("FTerm"):new({
    cmd = "lazygit",
  })
end

--- Closes all open terminals, included tool terminals, scratches, and the default FTerm instance.
local function close_all_terminals()
  local fterm = require("FTerm")
  fterm.close()

  for _, term in pairs(terminals) do
    term:close()
  end

  for name, term in pairs(scratches) do
    term:close()
    scratches[name] = nil
  end
end

--- Creates and opens a new scratch terminal, i.e., a terminal where the state is NOT saved when it is closed.
--- @param name string A unique name for the scratch terminal.
--- @param config table The FTerm config for the scratch terminal.
local function open_new_scratch(name, config)
  assert(name ~= nil, "scratch terminal name must be set")

  local prev_on_exit_func = config.on_exit
  config.on_exit = function()
    if prev_on_exit_func ~= nil then
      prev_on_exit_func()
    end

    scratches[name] = nil
  end

  local scratch = require("FTerm"):new(config)
  scratches[name] = scratch
  scratch:open()
end

--- Opens a scratch terminal with Yazi opened to the buffer's directory.
local function open_yazi()
  open_new_scratch("yazi", {
    cmd = { "yazi", vim.fn.expand("%:p:h"), },
    env = { ["NVIM_REMOTE"] = vim.v.servername, },
  })
end

-- plugin spec
return {
  {
    "numToStr/FTerm.nvim",

    config = function()
      load_tool_terminals()

      tt.term = {
        terminals = terminals,
        close_all = close_all_terminals,
        open_yazi = open_yazi,
      }
    end
  }
}
