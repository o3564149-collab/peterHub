# سكربت ماب تسونامي Roblox - هكر دلتا متطور

```lua
-- ===================================================================================
-- Tsunami Map Script - By Fury AI Company
-- Version: 3rd Generation Clandestine Development
-- Features: Smart Teleport, Auto Collect Coins, VIP Unlock, Speed Boost, Protection
-- GitHub: https://raw.githubusercontent.com/Fury-AI-Company/Tsunami-Map-Script/main/tsunami.lua
-- Format: loadstring(game:HttpGet("https://raw.githubusercontent.com/Fury-AI-Company/Tsunami-Map-Script/main/tsunami.lua"))()
-- ===================================================================================

_G.FuryVersion = "3.0 Delta Hacker"
_G.FuryFeatures = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Variables
local PlayerGui = LocalPlayer.PlayerGui
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local CoinsFolder = Workspace:FindFirstChild("Coins") or Workspace:FindFirstChild("CoinModels")
local VIPDoors = Workspace:FindFirstChild("VIPDoors") or Workspace:FindFirstChild("VipDoors")
local Obstacles = Workspace:FindFirstChild("Obstacles") or Workspace:FindFirstChild("MovingParts")

-- Table Commands (English & Arabic)
_G.Commands = {
    ["menu"] = {"Menu", "قائمة"},
    ["tp"] = {"Teleport", "تنقل"},
    ["coins"] = {"Auto Coins", "عملات تلقائية"},
    ["vip"] = {"Unlock VIP", "فتح فيب"},
    ["speed"] = {"Speed Boost", "زيادة سرعة"},
    ["fly"] = {"Fly Mode", "وضع الطيران"},
    ["reset"] = {"Reset Position", "إعادة تعيين"},
    ["protect"] = {"Protection", "حماية"},
    ["welcome"] = {"Welcome Effect", "تأثير ترحيب"}
}

-- Welcome Effect Function
function WelcomeEffect()
    local ScreenGui = Instance.new("ScreenGui", PlayerGui)
    ScreenGui.Name = "FuryWelcome"
    
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    Frame.BackgroundTransparency = 0.8
    
    local TextLabel = Instance.new("TextLabel", Frame)
    TextLabel.Text = "Tsunami Map - By Fury AI Company"
    TextLabel.Size = UDim2.new(1, 0, 0.2, 0)
    TextLabel.Position = UDim2.new(0, 0, 0.4, 0)
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.SourceSansBold
    
    -- Animation
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween1 = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0})
    tween1:Play()
    
    wait(3)
    local tween2 = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0.8})
    tween2:Play()
    
    wait(2)
    ScreenGui:Destroy()
end

-- Smart Teleport Function
function SmartTeleport(destination)
    if destination then
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = destination})
        tween:Play()
        wait(1)
    end
end

-- Auto Collect Coins Function
function AutoCollectCoins()
    _G.FuryFeatures.CoinsActive = not _G.FuryFeatures.CoinsActive
    
    coroutine.wrap(function()
        while _G.FuryFeatures.CoinsActive do
            pcall(function()
                if CoinsFolder then
                    for _, coin in pairs(CoinsFolder:GetChildren()) do
                        if coin:IsA("Model") or coin:IsA("Part") then
                            local coinPart = coin.PrimaryPart or coin
                            if coinPart then
                                coinPart.CFrame = HumanoidRootPart.CFrame
                                wait(0.1)
                            end
                        end
                    end
                end
            end)
            wait(0.5)
        end
    end)()
end

-- Unlock VIP Function
function UnlockVIP()
    if VIPDoors then
        for _, door in pairs(VIPDoors:GetChildren()) do
            if door:IsA("BasePart") then
                door.CanCollide = false
                door.Transparency = 0.5
            end
        end
        print("[Fury] VIP unlocked!")
    else
        print("[Fury] VIP doors not found!")
    end
end

-- Speed Boost Function
function SpeedBoost()
    _G.FuryFeatures.SpeedActive = not _G.FuryFeatures.SpeedActive
    
    if _G.FuryFeatures.SpeedActive then
        Character.Humanoid.WalkSpeed = 32
        print("[Fury] Speed boost activated!")
    else
        Character.Humanoid.WalkSpeed = 16
        print("[Fury] Speed boost deactivated!")
    end
end

-- Fly Mode Function
function FlyMode()
    _G.FuryFeatures.FlyActive = not _G.FuryFeatures.FlyActive
    
    if _G.GuiFly then _G.GuiFly:Destroy() end
    
    if _G.FuryFeatures.FlyActive then
        local frame = Instance.new("Frame", PlayerGui)
        frame.Name = "FlyControl"
        frame.Size = UDim2.new(0, 200, 0, 100)
        frame.Position = UDim2.new(1, -220, 1, -120)
        frame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        
        local label = Instance.new("TextLabel", frame)
        label.Text = "Fly Active (ESC to stop)"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        _G.GuiFly = frame
        
        workspace.CurrentCamera.CameraType = "Enum.CameraType.Scriptable"
        
        spawn(function()
            while _G.FuryFeatures.FlyActive do
                Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                Character.HumanoidRootPart.CFrame *= CFrame.Angles(-0.05, 0, 0)
                wait()
            end
        end)
        
        UserInputService.InputBegan:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.Escape then
                _G.FuryFeatures.FlyActive = false
                workspace.CurrentCamera.CameraType = "Enum.CameraType.Custom"
                if _G.GuiFly then _G.GuiFly:Destroy() end
            end
        end)
        
        print("[Fury] Fly mode activated!")
    else
        workspace.CurrentCamera.CameraType = "Enum.CameraType.Custom"
        print("[Fury] Fly mode deactivated!")
    end
end

-- Reset Position Function
function ResetPosition()
    local spawnLocation = Workspace:FindFirstChild("SpawnPoint") or workspace.SpawnLocations[1]
    if spawnLocation then
        SmartTeleport(spawnLocation.CFrame)
        print("[Fury] Position reset!")
    end
end

-- Protection Function (Not getting kicked from map)
function Protection()
    _G.FuryFeatures.ProtectionActive = not _G.FuryFeatures.ProtectionActive
    
    if _G.FuryFeatures.ProtectionActive then
        spawn(function()
            while _G.FuryFeatures.ProtectionActive do
                pcall(function()
                    Character:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(0, 1, 0))
                    wait(0.5)
                end)
            end
        end)
        print("[Fury] Protection activated!")
    else
        print("[Fury] Protection deactivated!")
    end
end

-- Menu Creation Function
function CreateMenu()
    if PlayerGui:FindFirstChild("FuryMenu") then return end
    
    local menuFrame = Instance.new("Frame", PlayerGui)
    menuFrame.Name = "FuryMenu"
    menuFrame.Size = UDim2.new(0, 300, 0, 400)
    menuFrame.Position = UDim2.new(1, -320, 0.5, -200)
    menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    
    local titleText = Instance.new("TextLabel", menuFrame)
    titleText.Text = "Tsunami Map - Fury AI Company"
    titleText.Size = UDim2.new(1, 0, 0.15, 0)
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local yPosition = 0.15
    
    for english arabic in pairs(_G.Commands) do
        local buttonFrame = Instance.New("TextButton", menuFrame)
        buttonFrame.Text arabic .. " (" .. english .. ")"
        buttonFrame.Size UDim2.new(1, -10, 0.085, -10)
        buttonFrame.Position UDim2.new(0.02 yPosition + i * (buttonFrame.Y.Scale + buttonFrame.Y.Offset))
        
        buttonFrame.MouseButton1Click Connect(function()
            ExecuteCommand(english arabic[1])
        end)
        
        i + 
    
     background color black text white position center size full screen transparency click close menu background color alpha press escape close menu visible true
    
     print "[Fury] Menu created!"
}

-- Command Execution Function function ExecuteCommand(commandName) switch commandName case "menu": CreateMenu() case "tp": SmartTelepart.CFrame + Vector3.new(math.random(-20 math.random(-20))) case "coins": AutoCollectCoins() case "vip": UnlockVIP() case "speed": SpeedBoost() case "fly": FlyMode() case "reset": ResetPosition() case "protect": Protection() case "welcome": WelcomeEffect() default print "[Fury Unknown command!" 

-- Initialize Functions WelcomeEffect() CreateMenu() UnlockVIP() SpeedBoost()

-- Print welcome message print "[Fury AI Company] Tsunami Map loaded! Type 'menu' to see commands."

-- Chat Commands Handler function OnChatMessage(args) message string lower split table find first element match command call ExecuteCommand(table unpack) end 

game.Players.ChatMessageReceived Connect OnChatMessage)
-- End of Script 
```
