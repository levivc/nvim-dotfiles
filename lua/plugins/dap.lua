return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },

  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    dap_virtual_text.setup({})

    dap.adapters.bashdb = {
      type = 'executable';
      command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
      name = 'bashdb';
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
      command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
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

    dap.configurations.c = {
      {
        name = "Launch executable",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      --{
      --  name = 'Attach to gdbserver :1234',
      --  type = 'cppdbg',
      --  request = 'launch',
      --  MIMode = 'gdb',
      --  miDebuggerServerAddress = 'localhost:1234',
      --  miDebuggerPath = '/usr/bin/gdb',
      --  cwd = '${workspaceFolder}',
      --  program = function()
      --    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --  end,
      --},
    }
    dap.configurations.cpp = dap.configurations.c

    dapui.setup({
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.57
        }, {
            id = "watches",
            size = 0.15
          }, {
            id = "stacks",
            size = 0.20
          }, {
            id = "breakpoints",
            size = 0.08
          } },
        position = "left",
        size = 40
      }, {
          elements = { {
            id = "repl",
            size = 0.5
          }, {
              id = "console",
              size = 0.5
            } },
          position = "bottom",
          size = 10
        } },
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<F8>", function() dap.clear_breakpoints() end)
    vim.keymap.set("n", "<F6>", function() dap.run_to_cursor() end)


    vim.keymap.set("n", "<leader>bp", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<leader>bd", function() dap.clear_breakpoints() end)
    vim.keymap.set("n", "<leader>bl", function() dap.list_breakpoints(true) end)
    vim.keymap.set("n", "<leader>bc", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end)
    vim.keymap.set("n", "<leader>bh", function() dap.set_breakpoint(nil, vim.fn.input("Hit condition: ")) end)
    vim.keymap.set("n", "<leader>bm", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log message: ")) end)
    vim.keymap.set("n", "<leader>bg", function()
      dap.set_breakpoint(
        vim.fn.input("Condition: "),
        vim.fn.input("Hit condition: "),
        vim.fn.input("Log message: "))
    end)

    vim.keymap.set("n", "<F4>", function()
      dap.terminate()
      require("dapui").close()
    end)

    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)

    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)

    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)

    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)


    vim.keymap.set("n", "<leader>de", function()
      dapui.eval(nil, { enter = true })
    end)
  end
}
