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
          icon = {
            icon = "󰙵 ";
            color = "cyan";
          };
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "diagnostics/quickfix";
          icon = {
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
        # TreeSitter 
        {
          __unkeyed-1 = "<bs>";
          desc = "Decrement Selection";
          mode = [ "x" ];
        }
        {
          __unkeyed-1 = "<C-Space>";
          desc = "Increment Selection";
          mode = [ "x" "n" ];
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
    # Conform 
    {
      key = "<leader>cF";
      mode = [ "n" "v" ];
      action = lib.nixvim.mkRaw ''
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end
      '';
      options.desc = "Format Injected Langs";
    }
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
    # LazyVim Keymaps
    # Better up/down
    {
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
      mode = [ "n" "x" ];
    }
    {
      key = "<Down>";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
      mode = [ "n" "x" ];
    }
    {
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
      mode = [ "n" "x" ];
    }
    {
      key = "<Up>";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
      mode = [ "n" "x" ];
    }
    # Move to window using the <ctrl> hjkl keys
    {
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Go to Left Window";
        remap = true;
      };
      mode = [ "n" ];
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Go to Lower Window";
        remap = true;
      };
      mode = [ "n" ];
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Go to Upper Window";
        remap = true;
      };
      mode = [ "n" ];
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Go to Right Window";
        remap = true;
      };
      mode = [ "n" ];
    }
    # Resize window using <ctrl> arrow keys
    {
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      mode = [ "n" ];
      options.desc = "Increase Window Height";
    }
    {
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      mode = [ "n" ];
      options.desc = "Decrease Window Height";
    }
    {
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      mode = [ "n" ];
      options.desc = "Decrease Window Width";
    }
    {
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      mode = [ "n" ];
      options.desc = "Increase Window Width";
    }
    # Move Lines
    {
      mode = [ "n" ];
      key = "<A-j>";
      action = "<cmd>execute 'move .+' . v:count1<cr>==";
      options = { desc = "Move Down"; };
    }
    {
      mode = [ "n" ];
      key = "<A-k>";
      action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
      options = { desc = "Move Up"; };
    }
    {
      mode = [ "i" ];
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options = { desc = "Move Down"; };
    }
    {
      mode = [ "i" ];
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options = { desc = "Move Up"; };
    }
    {
      mode = [ "v" ];
      key = "<A-j>";
      action = '':<C-u>execute "'<,'>move '>+" . v:count1<cr>gv=gv'';
      options = { desc = "Move Down"; };
    }
    {
      mode = [ "v" ];
      key = "<A-k>";
      action = '':<C-u>execute "'<,'>move '<-" . (v:count1 + 1)<cr>gv=gv'';
      options = { desc = "Move Up"; };
    }
    # -- buffers
    {
      mode = [ "n" ];
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = [ "n" ];
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = [ "n" ];
      key = "<[b>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = [ "n" ];
      key = "<]b>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>`";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bd";
      action = lib.nixvim.mkRaw ''
        function()
          Snacks.bufdelete()
        end '';
      options.desc = "Delete Buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bo";
      action = lib.nixvim.mkRaw ''
        function()
          Snacks.bufdelete.other()
        end '';
      options.desc = "Delete Other Buffers";
    }
    {
      mode = [ "n" ];
      key = "<leaderbD";
      action = "<cmd>:bd<cr>";
      options.desc = "Delete Buffer and Window";
    }
  ];
}

# Keymaps from LazyVim (Remove as added)
#
# -- Clear search and stop snippet on escape
# map({ "i", "n", "s" }, "<esc>", function()
#   vim.cmd("noh")
#   LazyVim.cmp.actions.snippet_stop()
#   return "<esc>"
# end, { expr = true, desc = "Escape and Clear hlsearch" })
#
# -- Clear search, diff update and redraw
# -- taken from runtime/lua/_editor.lua
# map(
#   "n",
#   "<leader>ur",
#   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
#   { desc = "Redraw / Clear hlsearch / Diff Update" }
# )
#
# -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
# map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
# map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
# map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
# map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
# map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
# map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
#
# -- Add undo break-points
# map("i", ",", ",<c-g>u")
# map("i", ".", ".<c-g>u")
# map("i", ";", ";<c-g>u")
#
# -- save file
# map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
#
# --keywordprg
# map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
#
# -- better indenting
# map("v", "<", "<gv")
# map("v", ">", ">gv")
#
# -- commenting
# map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
# map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
#
# -- lazy
# map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
#
# -- new file
# map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
#
# -- location list
# map("n", "<leader>xl", function()
#   local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
#   if not success and err then
#     vim.notify(err, vim.log.levels.ERROR)
#   end
# end, { desc = "Location List" })
#
# -- quickfix list
# map("n", "<leader>xq", function()
#   local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
#   if not success and err then
#     vim.notify(err, vim.log.levels.ERROR)
#   end
# end, { desc = "Quickfix List" })
#
# map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
# map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
#
# -- formatting
# map({ "n", "v" }, "<leader>cf", function()
#   LazyVim.format({ force = true })
# end, { desc = "Format" })
#
# -- diagnostic
# local diagnostic_goto = function(next, severity)
#   local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
#   severity = severity and vim.diagnostic.severity[severity] or nil
#   return function()
#     go({ severity = severity })
#   end
# end
# map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
# map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
# map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
# map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
# map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
# map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
# map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
#
# -- stylua: ignore start
#
# -- toggle options
# LazyVim.format.snacks_toggle():map("<leader>uf")
# LazyVim.format.snacks_toggle(true):map("<leader>uF")
# Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
# Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
# Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
# Snacks.toggle.diagnostics():map("<leader>ud")
# Snacks.toggle.line_number():map("<leader>ul")
# Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
# Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
# Snacks.toggle.treesitter():map("<leader>uT")
# Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
# Snacks.toggle.dim():map("<leader>uD")
# Snacks.toggle.animate():map("<leader>ua")
# Snacks.toggle.indent():map("<leader>ug")
# Snacks.toggle.scroll():map("<leader>uS")
# Snacks.toggle.profiler():map("<leader>dpp")
# Snacks.toggle.profiler_highlights():map("<leader>dph")
#
# if vim.lsp.inlay_hint then
#   Snacks.toggle.inlay_hints():map("<leader>uh")
# end
#
# -- lazygit
# if vim.fn.executable("lazygit") == 1 then
#   map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
#   map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
#   map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
#   map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
#   map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
# end
#
# map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
# map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
# map({"n", "x" }, "<leader>gY", function()
#   Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
# end, { desc = "Git Browse (copy)" })
#
# -- quit
# map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
#
# -- highlights under cursor
# map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
# map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })
#
# -- LazyVim Changelog
# map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
#
# -- floating terminal
# map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
# map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
# map("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
# map("n", "<c-_>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
#
# -- Terminal Mappings
# map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
# map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
#
# -- windows
# map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
# map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
# map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
# Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
# Snacks.toggle.zen():map("<leader>uz")
#
# -- tabs
# map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
# map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
# map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
# map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
# map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
# map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
# map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
#
# -- native snippets. only needed on < 0.11, as 0.11 creates these by default
# if vim.fn.has("nvim-0.11") == 0 then
#   map("s", "<Tab>", function()
#     return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
#   end, { expr = true, desc = "Jump Next" })
#   map({ "i", "s" }, "<S-Tab>", function()
#     return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
#   end, { expr = true, desc = "Jump Previous" })
# end
