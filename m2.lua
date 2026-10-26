local function daddy()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/SummerHub_Safe.lua'))()
end

local function omg()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/antiafk.lua'))()
end

task.spawn(daddy)

task.delay(4, function()
    task.spawn(omg)
end)
