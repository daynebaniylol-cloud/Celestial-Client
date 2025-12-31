
-- Celestial Client UI Library
-- Version 1.12.2
-- Roblox Luau
-- ClickGUI Minecraft-style

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- UID
local UID = HttpService:GenerateGUID(false)

-- Key system
local activated = false
LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "celestial" then
        activated = true
    end
end)

repeat task.wait() until activated

-- GUI creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CelestialClient"
ScreenGui.Parent = PlayerGui

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromScale(0.55, 0.6)
Main.Position = UDim2.fromScale(0.225, 0.2)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Visible = false

-- Toggle RightShift
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
    end
end)

-- Tabs
local Tabs = {"Combat","Movement","Render","Player","Util"}
local Modules = {}

-- Module API
function Modules:Add(tab, name, callback)
    Modules[name] = {
        Enabled = false,
        Callback = callback or function() end
    }
end

-- Example modules
Modules:Add("Render","HUD",function() end)
Modules:Add("Render","ClickGUI",function() end)
Modules:Add("Render","ModuleList",function() end)
Modules:Add("Util","MinecraftOptimizer",function() end)

print("Celestial Client loaded")
print("UID:", UID)
