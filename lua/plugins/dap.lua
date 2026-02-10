local sidebar = nil

local function create_sidebar(widgets)
  return widgets.sidebar(widgets.scopes, nil, "aboveleft 30vsplit")
end

local function sidebar_open(widgets)
  if not sidebar then sidebar = create_sidebar(widgets) end
  sidebar.open()
end

local function sidebar_toggle(widgets)
  if not sidebar then sidebar = create_sidebar(widgets) end
  sidebar.toggle()
end

local function close_view_and_sidebar(dapview)
  if sidebar then sidebar.close() end
  dapview.close(true)
end

return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "Jorenar/nvim-dap-disasm",

    dependencies = {
      "igorlfs/nvim-dap-view",
      opts = {
        winbar = {
          sections = { "watches", "exceptions", "breakpoints", "threads", "disassembly", "repl" }
        },
      },
    },

    config = function()
      require("dap-disasm").setup({
        dapview_register = true,

        dapview = {
          keymap = "D",
          label = "Disassembly",
          short_label = "󰒓",
        },

       -- The sign to use for instruction the exectution is stopped at
        sign = "DapStopped",
        -- Number of instructions to show before the memory reference
        ins_before_memref = 16,
        -- Number of instructions to show after the memory reference
        ins_after_memref = 16,
        -- Columns to display in the disassembly view
        columns = {
          "address",
          "instructionBytes",
          "instruction",
        },
      })
    end
  },

  keys = function()
    local dap = require("dap")
    local dapview = require("dap-view")
    local widgets = require("dap.ui.widgets")

    return {
      { "<F5>",  function() dap.continue() end },
      { "<F10>", function() dap.step_over() end },
      { "<F11>", function() dap.step_into() end },
      { "<F12>", function() dap.step_out() end },
      { "<F9>",  function() dap.toggle_breakpoint() end },
      { "<F8>",  function() dap.clear_breakpoints() end },
      { "<F6>",  function() dap.run_to_cursor() end },
      { "<F4>",  function() dap.terminate({ hierarchy = true }) end },

      { "<leader>bp", function() dap.toggle_breakpoint() end },
      { "<leader>br", function() dap.clear_breakpoints() end },
      { "<leader>bl", function() dap.list_breakpoints(true) end },
      { "<leader>bc", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end },
      { "<leader>bh", function() dap.set_breakpoint(nil, vim.fn.input("Hit condition: ")) end },
      { "<leader>bm", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log message: ")) end },
      { "<leader>bg", function()
        dap.set_breakpoint(
          vim.fn.input("Condition: "),
          vim.fn.input("Hit condition: "),
          vim.fn.input("Log message: "))
      end },

      { "<Leader>df", function() widgets.hover() end, mode = { "n", "v" } },
      { "<leader>dj", function() dapview.toggle(true) end },
      { "<Leader>dh", function() sidebar_toggle(widgets) end },
      { "<Leader>dw", function() dapview.jump_to_view("watches") end },
      { "<Leader>ds", function() dapview.jump_to_view("scopes") end },
      { "<Leader>de", function() dapview.jump_to_view("exceptions") end },
      { "<Leader>db", function() dapview.jump_to_view("breakpoints") end },
      { "<Leader>dt", function() dapview.jump_to_view("threads") end },
      { "<Leader>dd", function() dapview.jump_to_view("disassembly") end },
      { "<Leader>dr", function() dapview.jump_to_view("repl") end },
    }
  end,

  config = function ()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")
    local dapview = require("dap-view")

    dap.adapters.bashdb = {
      type = 'executable',
      command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
      name = 'bashdb',
    }

    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/extension/debugAdapter.js"
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see 
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }

    dap.adapters.codelldb = {
      type = "executable",
      command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
    }

    dap.configurations.sh = {
      {
        type = 'bashdb',
        request = 'launch',
        name = "Launch file",
        showDebugOutput = true,
        pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
        pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
        trace = true,
        file = "${file}",
        program = "${file}",
        cwd = '${workspaceFolder}',
        pathCat = "cat",
        pathBash = "/bin/bash",
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        args = {},
        argsString = '',
        env = {},
        terminalKind = "integrated",
      }
    }

    dap.configurations.lua = {
      {
        name = 'Launch file',
        type = 'local-lua',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = {
          lua = 'luajit',
          file = '${file}',
        },
        args = {},
      },
    }

    --    dap.configurations.c = {
    --      {
    --        name = "Launch executable",
    --        type = "cppdbg",
    --        request = "launch",
    --        MIMode = "gdb",
    --        program = function()
    --          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --        end,
    --        cwd = '${workspaceFolder}',
    --        stopAtEntry = true,
    --      },
    --      {
    --        name = "Launch exe",
    --        type = "codelldb",
    --        request = "launch",
    --        program = function()
    --          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --        end,
    --        cwd = '${workspaceFolder}',
    --        stopOnEntry = false,
    --      },
    --    }
    --    dap.configurations.cpp = dap.configurations.c

    dap.configurations.asm = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
      },
    }

    dap.listeners.before.attach.dap_config = function()
      sidebar_open(widgets)
    end

    dap.listeners.before.launch.dap_config = function()
      sidebar_open(widgets)
    end

    dap.listeners.after.disconnect.dap_config = function()
      close_view_and_sidebar(dapview)
    end

    dap.listeners.after.event_exited.dap_config = function()
      close_view_and_sidebar(dapview)
    end

    dap.listeners.after.event_terminated.dap_config = function()
      close_view_and_sidebar(dapview)
    end
  end
}
