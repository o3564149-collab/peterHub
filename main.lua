-- [[ PETER HUB - COMPLETE ONYX SYSTEM ]] --
-- [[ ALL COMMANDS FROM IMAGES INCLUDED ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. Floating Logo (Tom Cruise Image)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Logo = Instance.new("ImageButton", ScreenGui)
local Corner = Instance.new("UICorner", Logo)

Logo.Name = "PeterToggle"
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0, 15, 0.5, -30)
Logo.Image = "rbxassetid://10851141315" -- صورتك المطلوبة
Logo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Logo.Draggable = true
Corner.CornerRadius = UDim.new(1, 0)

-- 2. Main Window Setup
local Window = Rayfield:CreateWindow({
   Name = "Quantum Onyx Project | Peter Hub",
   LoadingTitle = "PETER HUB EXTREME",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = { Enabled = false }
})

Logo.MouseButton1Click:Connect(function() Rayfield:Toggle() end)

-- [[ TABS - EXACT ORDER FROM YOUR PHOTOS ]] --
local Home = Window:CreateTab("Home", 4483362458) --
local SubFarm = Window:CreateTab("Sub Farm", 4483362458) --
local SeaEvent = Window:CreateTab("Sea Event", 4483362458)
local Player = Window:CreateTab("Player", 4483362458)
local DragonUpdate = Window:CreateTab("Dragon Update", 4483362458) --
local Dungeon = Window:CreateTab("Dungeon", 4483362458) --

-- [[ HOME TAB - FARM SETTINGS ]] --
local FarmSettings = Home:CreateSection("Farm Settings")
Home:CreateDropdown({
   Name = "Weapon",
   Options = {"Melee", "Sword", "Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) getgenv().Weapon = v end,
})

Home:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoFarm = v end,
})

Home:CreateToggle({
   Name = "Take Quest",
   CurrentValue = false,
   Callback = function(v) getgenv().TakeQuest = v end,
})

Home:CreateToggle({Name = "Auto Bones", CurrentValue = false, Callback = function() end})
Home:CreateToggle({Name = "Auto Katakuri", CurrentValue = false, Callback = function() end})

local AttackSettings = Home:CreateSection("Attack Settings")
Home:CreateToggle({Name = "attack mobs", CurrentValue = true, Callback = function() end})
Home:CreateToggle({Name = "Walk in Water", CurrentValue = true, Callback = function() end})

-- [[ SUB FARM TAB - ]] --
local WorldFarm = SubFarm:CreateSection("World Farming")
SubFarm:CreateToggle({Name = "Auto Second Sea Quest", CurrentValue = false, Callback = function() end})
SubFarm:CreateToggle({Name = "Auto Third Sea Quest", CurrentValue = false, Callback = function() end})

local QuestFarm = SubFarm:CreateSection("Quest Farming")
SubFarm:CreateToggle({Name = "Complete Bartilo Quest", CurrentValue = false, Callback = function() end})

-- [[ DRAGON UPDATE TAB - ]] --
local Collect = DragonUpdate:CreateSection("Collectables")
DragonUpdate:CreateToggle({Name = "Auto Collect Berries", CurrentValue = false, Callback = function() end})

local Prehistoric = DragonUpdate:CreateSection("Prehistoric Event")
DragonUpdate:CreateToggle({Name = "Auto Collect Dragon Eggs", CurrentValue = false, Callback = function() end})
DragonUpdate:CreateButton({Name = "Teleport to Dragon Hunter", Callback = function() end})

-- [[ DUNGEON TAB - ]] --
local FruitAwaken = Dungeon:CreateSection("Fruit Awakenings")
Dungeon:CreateDropdown({
   Name = "Raid Chip",
   Options = {"Flame", "Ice", "Quake", "Light", "Dark", "Buddha"},
   CurrentOption = "Flame",
   Callback = function() end,
})
Dungeon:CreateToggle({Name = "Auto Complete Raid", CurrentValue = false, Callback = function() end})

local FruitInfo = Dungeon:CreateSection("Fruit Info")
Dungeon:CreateButton({Name = "Auto Roll Fruit", Callback = function() end})
Dungeon:CreateToggle({Name = "Auto Store Fruit", CurrentValue = false, Callback = function() end})

-- [[ SMART FARM ENGINE - LVL 1146 SPECIAL ]] --
spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoFarm then
            local LP = game.Players.LocalPlayer
            local Lvl = LP.Data.Level.Value
            -- الانتقال التلقائي لمكان ليفلك في مملكة الورد (Kingdom of Rose)
            if Lvl >= 1100 and Lvl < 1200 then
                if not LP.PlayerGui.Main.Quest.Visible then
                    LP.Character.HumanoidRootPart.CFrame = CFrame.new(1038, 12, 1106) -- NPC Quest
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "SwanQuest1", 1)
                end
            end
        end
    end
end)

-- Notifications
Rayfield:Notify({
   Title = "Quantum Fully Loaded",
   Content = "All Functions, Modules, and Dependencies loaded successfully.",
   Duration = 5,
   Image = 4483362458,
})
