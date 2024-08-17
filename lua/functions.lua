-- Need function to overwrite text in the buffer at the bounds
-- vselect_text and bounds both 




-- This vselect function works well and just needs to be used somewhere
-- Would like to use with nvim_write_at_buf_pos or wevs but it doesn't work
function vselect()
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")
    
    return {text = table.concat(vim.fn.getline(vstart[2],vend[2])),
            bounds = {vstart = {line = vstart[2], 
                                col = vstart[3]},
                      vend   = {line = vend[2],
                                col = vend[3]}}
            }
end


-- pretty print
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function pprint(o)
   print(dump(o))
end



-- Title case shit I don't even want because I never use title case
--
-- -- Title case
-- function Set (list)
--     local set = {}
--     for _, l in ipairs(list) do set[l] = true end
--     return set
-- end
-- 
-- function firstToUpper(str)
--     return (str:gsub("^%l", string.upper))
-- end

-- function titlecase(str)
--     -- We need to break the string into pieces
--     words = {}
--     for word in string.gmatch(str, '([^%s]+)') do
--         table.insert(words, word)
--     end
-- 
--     -- We need to capitalize anything that is not a:
--     --   - Article
--     --   - Coordinating Conjunction
--     --   - Preposition
--     -- Thus we have a blacklist of such words
--     local blacklist = Set {
--         "at", "but", "by", "down", "for", "from", 
--         "in", "into", "like", "near", "of", "off",
--         "on", "onto", "out", "over", "past", "plus",
--         "to", "up", "upon", "with", "nor", "yet",
--         "so", "the"
--     }
--     for index, word in pairs(words) do
--         if(not (blacklist[word] ~= nil)) then
--             words[index] = firstToUpper(word)
--         end
--     end
-- 
--     -- First and last words are always capitalized
--     words[1] = firstToUpper(words[1])
--     words[#words] = firstToUpper(words[#words])
-- 
--     -- Concat elements in list via space character
--     local result = ""
--     for index, word in pairs(words) do
--         result = result .. word
--         if(index ~= #words) then
--             result = result .. ' '
--         end
--     end
--     return result
-- end
