-- Anti-AFK Script (no character movement)
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")

-- Notification
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Anti-AFK",
        Text = "Anti AFK Activated",
        Duration = 5
    })
end)

print("[Anti-AFK] Activated")

-- Bypass idle kick
local player = Players.LocalPlayer

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("[Anti-AFK] Idle detected - activity simulated")
end)
