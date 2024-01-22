
function build()
    local buf_path = vim.fn.expand('%:p:h')

    if vim.bo.filetype == "python" then
        vim.api.nvim_command(':w | !python3 %')
    else
       -- Get the directory of the current buffer
   
       -- Build the full path to the build script
       local build_script = buf_path .. "/build.sh"
   
       -- Check if the build script exists
       if vim.fn.filereadable(build_script) == 1 then
           -- Change to the buffer's directory
           vim.cmd("lcd " .. buf_path)
   
           -- Run the build script
           vim.api.nvim_command(':w | !./build.sh')
   
           -- Return to the original directory
           vim.cmd("lcd -")
       else
           print("Build script not found!")
       end
    end
end

