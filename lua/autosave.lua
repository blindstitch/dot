-- Note: you need to have undotree for this to work
--
-- enable autosave, auto reload, disable swap
-- you want undotree also for this to be maximally useful

-- total shit to check if gitted or not. processes the output of git-ls-files
-- (by checking if it said "fatal:" or not) and will return true if it is under
-- version control, false if not, nil if it gets no output (unlikely).
--
-- A better way would be comparing the filenames -- the function should return the
-- filename if it is gitted.
--

function isbufgitted()
   local bufferpath = vim.fn.expand('%')
   local bufferdir = vim.fn.expand('%:p:h')
   local cmd = 'cd '..bufferdir..'; git ls-files --error-unmatch '..bufferpath
   local result,exitcode = vim.fn.system(cmd)
   local words = {}

   for word in result:gmatch("%S+") do
      table.insert(words, word)
   end

   if #words > 0 then
      if words[1] ~= 'fatal:' and words[1] ~= 'error:' then
         return true
      else
         return false
      end
   else
      return nil
   end
end

-- Autosave plugin
require("auto-save").setup({
  enable = true,
    condition = function(buf)
      -- only run for gitted buffers
      if isbufgitted() then
        return true
      end
      return false
    end
})

-- Autocommand
vim.api.nvim_exec([[
    augroup IsGitted
        autocmd!
        autocmd BufRead * lua if isbufgitted() then vim.cmd('setlocal noswapfile') end
    augroup END
]], false)
