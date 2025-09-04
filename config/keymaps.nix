{ lib, ... }: {
  globals.mapleader = " ";
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      defaults = { };
      spec = [
        # Group together keymaps 
        # Example:
        # {
        #   __unkeyed-1 = "<leader>g";
        #   group = "Git"; 
        # }
        {
          __unkeyed-1 = "<leader><tab>";
          group = "tabs";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "code";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "debug";
        }
        {
          __unkeyed-1 = "<leader>dp";
          group = "profiler";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "file/find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
        }
        {
          __unkeyed-1 = "<leader>gh";
          group = "hunks";
        }

        {
          __unkeyed-1 = "<leader>q";
          group = "quit/session";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "search";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "ui";
          icons = {
            icon = "󰙵 ";
            color = "cyan";
          };
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "diagnostics/quickfix";
          icons = {
            icon = "󱖫 ";
            color = "green";
          };
        }
        {
          __unkeyed-1 = "[";
          group = "prev";
        }
        {
          __unkeyed-1 = "]";
          group = "next";
        }
        {
          __unkeyed-1 = "g";
          group = "goto";
        }
        {
          __unkeyed-1 = "gs";
          group = "surround";
        }
        {
          __unkeyed-1 = "z";
          group = "fold";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "buffer";
          expand = {
            __raw = ''
              function()
                return require("which-key.extras").expand.buf()
              end
            '';
          };
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "windows";
          proxy = "c-w";
          expand = {
            __raw = ''
              function()
                return require("which-key.extras").expand.win()
              end
            '';
          };
        }
        {
          __unkeyed-1 = "gx";
          desc = "Open with system app";
        }
      ];
    };
  };
  keymaps = [
    # Example
    # {
    #   mode = "i";
    #   key = "jk";
    #   action = "<CMD>noh<CR><ESC>";
    #   options.desc = "Normal mode and clear highlight";
    # }
    # Grug-far 
    {
      mode = [ "n" "v" ];
      key = "<leader>sr";
      action = {
        __raw = ''
          function()
            local grug = require("grug-far")
            local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
            grug.open({
              transient = true,
              prefills = {
                filesFilter = ext and ext ~= "" and "*." .. ext or nil,
              },
            })
          end
        '';
      };
      options.desc = "Search and Replace";
    }
    # Flash
    {
      key = "s";
      mode = [ "n" "x" "o" ];
      action = lib.nixvim.mkRaw ''function() require("flash").jump() end '';
      options.desc = "Flash";
    }
    {
      key = "S";
      mode = [ "n" "x" "o" ];
      action = { __raw = ''function() require("flash").treesitter() end''; };
      options.desc = "Flash Treesitter";
    }
    {
      key = "r";
      mode = [ "o" ];
      action = { __raw = ''function() require("flash").remote() end''; };
      options.desc = "Remote Flash";
    }
    {
      key = "R";
      mode = [ "o" ];
      action = {
        __raw = ''function() require("flash").treesitter_search() end'';
      };
      options.desc = "Treesitter Search";
    }
    {
      key = "<c-s>";
      mode = [ "c" ];
      action = { __raw = ''function() require("flash").toggle() end''; };
      options.desc = "Toggle Flash Search";
    }

    # Trouble
    {
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle<cr>";
      options.desc = "Symbols (Trouble)";
    }
    {
      key = "<leader>cS";
      action = "<cmd>Trouble lsp toggle<cr>";
      options.desc = "LSP references/definitions/... (Trouble)";
    }
    {
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options.desc = "Location List (Trouble)";
    }
    {
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options.desc = "Quickfix List (Trouble)";
    }
    {
      key = "[q";
      action = lib.nixvim.mkRaw ''
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      options.desc = "Previous Trouble/Quickfix Item";
    }
    {
      key = "]q";
      action = lib.nixvim.mkRaw ''
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      options.desc = "Next Troubl/Quickfix Item";
    }

    # todo-comments 
    {
      key = "]t";
      action = lib.nixvim.mkRaw ''
        function() require("todo-comments").jump_next() end
      '';
      options.desc = "Next Todo Comment";
    }
    {
      key = "[t";
      action = lib.nixvim.mkRaw ''
        function() require("todo-comments").jump_prev() end
      '';
      options.desc = "Previous Todo Comment";
    }
    {
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      options.desc = "Todo (Trouble)";
    }
    {
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
      options.desc = "Todo/Fix/Fixme (Trouble)";
    }
    {
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "Todo";
    }
    {
      key = "<leader>sT";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
      options.desc = "Todo/Fix/Fixme";
    }

    # Which-key
    {
      key = "<ledaer>?";
      action = {
        __raw = ''
          function()
            require("which-key").show({ global = false })
          end          
        '';
      };
      options.desc = "Buffer Keymaps (which-key)";
    }
    {
      key = "<c-w><space>";
      action = {
        __raw = ''
          function()
            require("which-key").show({ keys = "<c-w>", loop = true })
          end
        '';
      };
      options.desc = "Window Hydra Mode (which-key)";
    }
  ];
}
