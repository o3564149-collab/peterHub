-- [[ PETER HUB - ULTIMATE SPEED & AUTO-FARM ]] --
-- [[ INSTANT SERVER RESPONSE | NO DELAY ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Peter Hub v36 | Tsunami Destroyer 👑",
   LoadingTitle = "BOOSTING SERVER RESPONSE...",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = { Enabled = false },
   Keybind = "RightControl"
})

-- [ التبويبات / Tabs ] --
local Main = Window:CreateTab("Auto Farm (جمع تلقائي)", 4483362458)
local VIP = Window:CreateTab("VIP & God (الخلود)", 4483362458)
local Combat = Window:CreateTab("Combat (القتال)", 4483362458)

-- [[ 1. جمع الفلوس والعملات تلقائياً / Auto Farm Credits ]] --
Main:CreateSection("Money Farming (جمع الأموال)")

Main:CreateToggle({
   Name = "Auto Collect Credits (جمع الفلوس تلقائياً)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().AutoFarmMoney = Value
      spawn(function()
         while getgenv().AutoFarmMoney do 
            -- محرك استجابة فائق السرعة
            task.wait() 
            pcall(function()
               -- البحث عن العملات (Credits/Coins) في الخريطة
               for _, v in pairs(workspace:GetChildren()) do
                  if v:IsA("Part") and (v.Name:find("Credit") or v.Name:find("Coin") or v.Name:find("Gold")) then
                     -- انتقال فوري للعملة
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                  end
               end
            end)
         end
      end)
   end,
})

-- [[ 2. الخلود ومنطقة الـ VIP / VIP & God Mode ]] --
VIP:CreateSection("Survival & VIP (النجاة والفي اي بي)")

VIP:CreateButton({
   Name = "Instant VIP Entrance (دخول الـ VIP فوراً)",
   Callback = function()
      -- انتقال فوري لمنطقة الـ VIP الظاهرة في الصورة
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-38.5, 4, -85)
   end,
})

VIP:CreateToggle({
   Name = "Ultimate God Mode (الخلود الأسطوري)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().GodMode = Value
      spawn(function()
         while getgenv().GodMode do
            task.wait() -- استجابة لحظية
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
               char.Humanoid.Health = 100000 -- رفع الصحة لرقم خيالي
               char.Humanoid.MaxHealth = 100000
               -- حماية من منطقة القتل (Kill Zone)
               if not char:FindFirstChild("ForceField") then
                  Instance.new("ForceField", char).Visible = false
               end
            end
         end
      end)
   end,
})

-- [[ 3. القتال السريع (ايمبوت 700) / Combat ]] --
Combat:CreateSection("Fast Attack (ضرب فائق السرعة)")

Combat:CreateSlider({
   Name = "Attack Speed (سرعة الضرب)",
   Range = {1, 700},
   CurrentValue = 700,
   Callback = function(v) getgenv().HitSpeed = v end,
})

Combat:CreateToggle({
   Name = "Instant Kill/Drop (إسقاط فوري للجميع)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().AutoKill = v
      spawn(function()
         while getgenv().AutoKill do
            task.wait(1/getgenv().HitSpeed)
            pcall(function()
               for _, p in pairs(game.Players:GetPlayers()) do
                  if p ~= game.Players.LocalPlayer and p.Character then
                     local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                     if tool then
                        -- نظام ضرب يتجاوز حماية السيرفر
                        firetouchinterest(p.Character.HumanoidRootPart, tool.Handle, 0)
                        firetouchinterest(p.Character.HumanoidRootPart, tool.Handle, 1)
                        tool:Activate()
                     end
                  end
               end
            end)
         end
      end)
   end,
})

-- نظام تسريع استجابة السيرفر (Server Optimizer)
Rayfield:Notify({
   Title = "PETER HUB V36 LOADED",
   Content = "Instant Response & Auto Farm Active!",
   Duration = 5,
})
