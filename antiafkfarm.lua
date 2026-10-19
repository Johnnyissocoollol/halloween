local function daddy()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/mm2farmfixedhalloween.lua'))()
end

local function omg()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/antiafk.lua'))()
end

task.spawn(daddy)

task.delay(4, function()
    task.spawn(omg)
end)
