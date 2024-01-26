local keymap = vim.keymap.set
local api = vim.api
-- Silent keymap option
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better movement, mostly to make HHKB and laptop typing less painful
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "[", "(h", opts)
keymap("n", "]", ")", opts)
-- Nicer movement between sentences by using clause 
-- doesn't work because hls gets reset on {
 -- keymap("n", "}", "/[.,;]<CR>nl:nohls<CR>", opts)
 -- keymap("n", "{", "/[.,;]<CR>NNl:nohls<CR>", opts)
 
-- Navigation
-- goto file within braces in latex
keymap("n", "<leader>gf", "vi}y:e %:p:h/<c-r>\"<CR>", opts)

-- Insert mode movements and controls
keymap("i", "<c-j>", "<Down>", opts)
keymap("i", "<c-k>", "<Up>", opts)
keymap("i", "<c-h>", "<Left>", opts)
keymap("i", "<c-l>", "<Right>", opts)
keymap("i", "<c-a>", "<Home>", opts)
keymap("i", "<c-e>", "<End>", opts)
keymap("i", "<c-z>", "<c-o>u", opts)
keymap("i", "<c-r>", "<c-o><c-r>", opts)
-- keymap("i", "<c-J>", "<c-o>B", opts)
-- keymap("i", "<c-L>", "<c-o>W", opts)

-- make function to alter the comment character depending on extension, should be easy.
keymap('n', '<C-/>', "mmI# <Esc>`m", opts)

-- NvimTree - not very good nerdtree replacement
keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", opts)

-- Others
-- keymap("n", "<leader>ss", ":ASToggle<CR>", opts) -- toggle autosave
-- keymap("n", "<leader>so", ":w | :so %<CR>", opts) -- source current - redudant with ss
keymap("n", "<leader>rr", ":lua build()<CR>", opts) -- run build command

-- Undo tree
vim.keymap.set('n', '<leader>uu', vim.cmd.UndotreeToggle)


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', ":Telescope heading<CR>", {})
vim.keymap.set('n', '<leader>fz', ":Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set('n', '<leader>fr', ":Telescope registers<CR>", {})


-- "Nice" stuff for writing
vim.keymap.set('n', '<leader>nb', "vipJV:s;\\. ;.\\r;g<CR>", {}) -- break up lines (for easier analysis sentence-by-sentence).
vim.keymap.set('n', '<leader>n1b', "vipJV:s;\\. ;.\\r;g<CR>", {}) -- presumably add a line break.
vim.keymap.set('n', '<leader>n2b', "vipJV:s;\\. ;.\\r\\r;g<CR>", {}) -- presumably add two.
vim.keymap.set('n', '<leader>nh-', "yypVr-o<Esc>", {}) -- add a "nice header" made of hyphens.
vim.keymap.set('n', '<leader>nh=', "yypVr=o<Esc>", {}) -- add a "nice header" made of equal signs.

-- formats the paragraph using latexindent.pl, latexindent still in homefolder
-- i would love to have it only operate on tex but it doesn't work well for a command that is mixing normal mode and ex commands
-- chatgpt recommends something like this:
-- local function run_latexindent()
--     vim.api.nvim_feedkeys('mmvip', 'n', true)
-- 
--     -- Wait for a moment (adjust timing as needed)
--     vim.defer_fn(function()
--         -- Now you can run an ex command
--         -- there is also vim.fn.getreg() to work with the selected text via lua
--         vim.cmd('!perl /home/karl/temp/latexindent/latexindent.pl/latexindent.pl -m -l /home/karl/temp/latexindent/quick-start1.yaml -c /tmp/ - ')
--     end, 50)
--     vim.api.nvim_feedkeys('`m', 'n', true)
-- end

vim.keymap.set('n', '<leader>nf', "mmvip:!perl /home/karl/temp/latexindent/latexindent.pl/latexindent.pl -m -l /home/karl/temp/latexindent/quick-start1.yaml -c /tmp/ - <CR>`m", {})


-- interface
vim.keymap.set('n', '<leader>=', "2<c-w>+", {}) -- would be lovely to have this enter a mode where - and =  continue to act 
                                                -- as window contrls, until another key is pressed.
vim.keymap.set('n', '<leader>-', "2<c-w>-", {})

-- Tex
vim.keymap.set('n', '<leader>tpc', "a (\\cite{})<Esc>hi", {})

-- nohls on double-escape
vim.keymap.set('n', '<Esc><Esc>', ":nohls<CR>", {})

-- nvim development
vim.keymap.set('n', '<leader>ss', ":w | :so %<CR>", {})

-- -- TexLab
-- keymap("n", "<leader>tr", ":TexlabBuild<CR>", opts)


-- -- Unindent
-- -- -- Not sure how this is supposed to behave but it doesn't really work
-- function insert_mode_unindent()
--     local pos = vim.fn.getpos('.')
--     pos = pos[3]
--     local line = vim.api.nvim_get_current_line()
-- 
--     -- If expandtab is false this will also delete \t
--     if string.sub(line, pos - 1, pos - 1) ~= ' ' then
--         local s = vim.api.nvim_replace_termcodes('<BS>', true, false, true)
--         vim.api.nvim_feedkeys(s, 'nt', false)
--         return
--     end
-- 
--     -- Calculate indent offset
--     local width = vim.fn.shiftwidth()
--     local offset = math.fmod(pos - 1, width)
--     if offset == 0 then
--         offset = width
--     end
-- 
--     -- Delete up to offset amount of space characters
--     for i = 1, offset do
--         if string.sub(line, pos - i, pos - i) == ' ' then
--             -- <BS> can delete more than one character depending on various
--             -- tab settings so we use <Del> instead
--             local s = vim.api.nvim_replace_termcodes('<Left><Del>', true, false, true)
--             vim.api.nvim_feedkeys(s, 'nt', false)
--         else
--             break
--         end
--     end
-- end
-- 
-- vim.keymap.set('i', '<S-Tab>', insert_mode_unindent, {noremap = true, silent = true})
-- 
-- local function on_attach(bufnr)
--   local api = require('nvim-tree.api')
-- 
--   local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
-- 
-- 
--   -- Default mappings. Feel free to modify or remove as you wish.
--   --
--   -- BEGIN_DEFAULT_ON_ATTACH
--   vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
--   vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
--   vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
--   vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
--   vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
--   vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
--   vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
--   vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
--   vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
--   vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
--   vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
--   vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
--   vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
--   vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
--   vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
--   vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
--   vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
--   vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
--   vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
--   vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
--   vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
--   vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
--   vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
--   vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
--   vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
--   vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
--   vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
--   vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
--   vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
--   vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
--   vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
--   vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
--   vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
--   vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
--   vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
--   vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
--   vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
--   vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
--   vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
--   vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
--   vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
--   vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
--   vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
--   vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
--   vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
--   vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
--   vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
--   vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
--   vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
--   vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
--   vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
--   vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
--   -- END_DEFAULT_ON_ATTACH
-- 
-- 
--   -- Mappings migrated from view.mappings.list
--   --
--   -- You will need to insert "your code goes here" for any mappings with a custom action_cb
--   vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
-- 
-- end
