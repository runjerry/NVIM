-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.g.maplocalleader = ";"

local opt = {
  noremap = true,
  silent = true,
}

-- local var
local map = vim.api.nvim_set_keymap

-- $jump to end of line without space (switch $ and g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- command mode Ctrl+j/k  choose up and down
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- map("n", "<leader>w", ":w!<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- alternative way to save
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<C-w>", ":q!<CR>", opt)
-- map("n", "<C-c>", "<Esc>", opt)

-- hide highlight
map("n", "cc", ":let @/ = ''<CR>", opt)

-- better navigation
map("n", "<space>j", "10j", opt)
map("n", "<space>k", "10k", opt)
map("v", "<space>j", "10j", opt)
map("v", "<space>k", "10k", opt)

-- map("n", "<C-l>", "<C-e>", opt)
map("n", "<C-u>", "<C-d>", opt)
map("n", "<C-e>", "<C-u>", opt)
map("n", "<C-d>", "<C-y>", opt)
map("n", "<C-y>", "<C-f>", opt)
map("n", "<C-f>", "<C-e>", opt)
map("v", "<C-d>", "<C-b>", opt)

-- ctrl u / ctrl + d scroll 9 lines instead of half the screen
-- map("n", "<C-u>", "10k", opt)
-- map("n", "<C-d>", "10j", opt)

-- magic search
-- map("n", "/", "/\\v", { noremap = true, silent = false })
-- map("v", "/", "/\\v", { noremap = true, silent = false })
keymap({"n", "v"}, "/", "/", {
    remap = false,
    silent = false,
})

-- better indenting in visual mode
map("v", "<TAB>", ">gv", opt)
map("v", "<S-TAB>", "<gv", opt)
-- map("v", "<", "<gv", opt)
-- map("v", ">", ">gv", opt)

-- move selected lines up and down in visual mode
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- visual mode paste without copy
map("v", "p", '"_dP', opt)

-- normal mode copy and paste between nvim and everything else
map("v", "<C-c>", '"+y', opt)
map("n", "<C-c>", '"+y', opt)
map("n", "<C-v>", '"+p', opt)

-- visual block move_selection
map("n", "<C-g>", "<C-q>", opt)

-- exit
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert mode, jump to begin and end of line
-- for insert pdb
-- map("i", "<F9>", "import pdb; pdb.set_trace()", opt)
map("i", "<F9>", "breakpoint()", opt)
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows splitting shortcuts
------------------------------------------------------------------
-- unmap s default functions
map("n", "s", "", opt)
map("n", "s\\", ":vsp<CR>", opt)
map("n", "s-", ":sp<CR>", opt)
-- close current window
map("n", "sw", "<C-w>c", opt)
-- close others
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  jump between windows
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- <space> + hjkl jump between windows
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- left/right window ratio control
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
-- up/bottom window ratio control
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- equal ratio
map("n", "s=", "<C-w>=", opt)

-- Terminal related
map("n", "t", ":terminal<CR>", opt)
map("n", "t-", ":sp | terminal<CR>", opt)
map("n", "t\\", ":vsp | terminal<CR>", opt)
-- map("n", "t\\", ":vsp | terminal<CR>", "buftype=acwrite")
-- Esc to Normal mode
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
--------------------------------------------------------------------
-- Plugin shortcuts
local pluginKeys = {}

-- treesitter folding
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- nvim-tree
-- map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
-- shortcuts
pluginKeys.nvimTreeList = { -- open file or folder
  { key = { "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<CR>", action = "system_open" },
  -- v split open new file
  { key = "v", action = "vsplit" },
  -- h split open new file
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- file operations
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  -- lower level directory
  { key = { "cd" }, action = "cd" },
  -- upper level directory
  { key = { "u" }, action = "dir_up" },
}
-- bufferline
-- binding buffer
map("n", "<leader>j", ":buffers<CR>", opt)
-- next/back buffer, <A-x> does not work here, <C-S-TAB> does not either
map("n", "<TAB>", ":bnext<CR>", opt)
map("n", "<S-TAB>", ":bprevious<CR>", opt)
map("n", "<C-b>", ":bprevious<CR>", opt)
-- left/right Tab switch
map("n", "<space>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<space>l", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" close current buffer
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
map("n", "<leader>w", ":Bdelete!<CR>", opt)
--map("n", "<leader>w", ":bp<CR>:bd! #<CR>", opt)
-- close left/right page
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- close all other pages
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- close selected page
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

-- Telescope
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>F", ":Telescope git_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)
map("n", "<leader>E", ":Telescope env<CR>", opt)
map("n", "<leader>c", ":Telescope cder<CR>", opt)
-- map("n", "<leader>c", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '-t=f', '-a'}, path_display = {'absolute'}, wrap_results = true })<CR>", opt)
-- map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- shortcuts in insert mode of Telescope
pluginKeys.telescopeList = {
  i = {
    -- move up and down
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- history
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- close window
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- scroll up/down the preview window
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- comment plugin
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal mode
  toggler = {
    line = "gcc", -- line comment
    block = "gbc", -- block comment
  },
  -- Visual mode
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("v", "<C-_>", "gcc", { noremap = false })
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "gcap", "gcip", { noremap = false })
map("n", "gcap", "gcip", { noremap = false })

-- lsp shortcuts
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga instead of rn
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  --[[
  Lspsaga instead of ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  --[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga instead of gh
  --]]
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --[[
  Lspsaga instead of gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --[[
  Lspsaga instead of gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  -- diagnostic
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  -- mapbuf("n", "gp", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- unused
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- typescript shortcuts
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- nvim-dap
pluginKeys.mapDAP = function()
  -- start
  map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
  -- end
  map(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. "<C-w>o<CR>",
    opt
  )
  -- continue
  map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
  -- set breakpoint
  map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
  map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
  map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
  map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
  -- pop out window
  map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

-- vimspector
pluginKeys.mapVimspector = function()
  -- generate debug profile
  map("n", "<leader>dbg", "<cmd>lua require('plugin-config.vimspector').generate_debug_profile()<cr>", opt)
  -- start
  map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
  -- end
  map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
  -- continue
  map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
  -- set breakpoint
  map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
  map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
  map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
  map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end

-- nvim-cmp
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- previous item
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- next item
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- complete
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- cancel
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets jump
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end

-- customize toggleterm cmd window of 3 different types
-- <leader>ta float
-- <leader>tb right
-- <leader>tc below
-- special lazygit window, need lazygit installed
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
  vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
  vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
  vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map("n", "<leader>gj", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })

  map("n", "<leader>gk", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })

  map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
  map("n", "<leader>gS", gs.stage_buffer)
  map("n", "<leader>gu", gs.undo_stage_hunk)
  map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
  map("n", "<leader>gR", gs.reset_buffer)
  map("n", "<leader>gp", gs.preview_hunk)
  map("n", "<leader>gb", function()
    gs.blame_line({ full = true })
  end)
  map("n", "<leader>gd", gs.diffthis)
  map("n", "<leader>gD", function()
    gs.diffthis("~")
  end)
  -- toggle
  map("n", "<leader>gtd", gs.toggle_deleted)
  map("n", "<leader>gtb", gs.toggle_current_line_blame)
  -- Text object
  map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
