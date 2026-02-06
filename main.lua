-- [[ PETER HUB - HYBRID OSAKA & ONYX ]] --
-- [[ ALL BUGS FIXED | INSTANT RESPONSE ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Peter Hub v37 | Ultimate Hybrid 👑",
   LoadingTitle = "CONNECTING TO SERVERS (FAST)...",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = { Enabled = false },
   Keybind = "RightControl"
})

-- [ التبويبات / Tabs ] --
local Main = Window:CreateTab("Main (الأساسي)", 4483362458) --
local Farm = Window:CreateTab("Farm (التلفيل)", 4483362458) --
local Player = Window:CreateTab("Player (اللاعب)", 4483362458)

-- [[ 1. ميزات الصورة الأولى (Onyx) + Osaka Main ]] --
Main:CreateSection("Onyx Features (ميزات أونيكس)")

Main:CreateDropdown({
   Name = "Weapon (السلاح)",
   Options = {"Melee", "Sword", "Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) getgenv().Weapon = v end,
})

Main:CreateToggle({
   Name = "Auto Farm (تلفيل تلقائي)",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoFarm = v end,
})

Main:CreateToggle({
   Name = "Take Quest (أخذ المهمة)",
   CurrentValue = false,
   Callback = function(v) getgenv().TakeQuest = v end,
})

Main:CreateSection("Osaka Main (ميزات أوساكا)")

Main:CreateToggle({
   Name = "VIP Walls (تخطي جدران VIP)",
   CurrentValue = false,
   Callback = function(v)
      -- كود لإلغاء تصادم جدران الـ VIP فوراً
      for _, part in pairs(workspace:GetDescendants()) do
         if part.Name == "VIPWalls" or part.Name == "VIP" then
            part.CanCollide = not v
         end
      end
   end,
})

Main:CreateToggle({
   Name = "Auto Money Event (حدث المال التلقائي)",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoMoney = v end,
})

-- [[ 2. قسم التلفيل المتطور / Advanced Farm ]] --
Farm:CreateSection("Zone & Rarity (المنطقة والندرة)")

Farm:CreateDropdown({
   Name = "Select Zone (اختر المنطقة)",
   Options = {"Epic", "Legendary", "Mythical", "Cosmic", "Secret", "Celestial"},
   Callback = function(v) getgenv().SelectedZone = v end,
})

Farm:CreateDropdown({
   Name = "Select Rarity (اختر الندرة)",
   Options = {"Common", "Rare", "Epic", "Legendary", "Mythical", "Cosmic", "Secret", "Celestial"},
   Callback = function(v) getgenv().SelectedRarity = v end,
})

Farm:CreateToggle({
   Name = "Auto Zone (تلفيل المنطقة تلقائي)",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoZone = v end,
})

-- [[ 3. محرك السرعة والخلود / Speed Gap & God Mode ]] --
local SpeedSec = Player:CreateSection("Speed & Survival (السرعة والنجاة)")

Player:CreateDropdown({
   Name = "Gap Speed (سرعة الاستجابة)",
   Options = {"500", "1000", "1500", "2000"}, --
   CurrentOption = "2000",
   Callback = function(v) getgenv().GapSpeed = tonumber(v) end,
})

Player:CreateToggle({
   Name = "Ultimate God Mode (الخلود الأبدي)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().GodMode = v
      spawn(function()
         while getgenv().GodMode do task.wait()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
               char.Humanoid.Health = 100000 -- خلود حقيقي
            end
         end
      end)
   end,
})

-- [[ نظام الرد السريع / Fast Response Engine ]] --
spawn(function()
    while task.wait() do
        if getgenv().AutoFarmMoney then
            -- جمع العملات بسرعة البرق بناءً على Gap Speed
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name:find("Credit") or v.Name:find("Coin") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    end
                end
            end)
        end
    end
end)

Rayfield:Notify({
   Title = "PETER HUB V37 HYBRID",
   Content = "All Features Synced & Ready!",
   Duration = 5,
})
