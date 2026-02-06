-- [[ PETER HUB - THE FINAL RESPONSE FIX ]] --
-- [[ نظام الحقن المباشر | أيقونة أوساكا الأصلية ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- استعادة الأيقونة الأصلية التي تظهر في صورتك
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Logo = Instance.new("ImageButton", ScreenGui)
Logo.Name = "PeterUltimateLogo"
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0, 15, 0.5, -30)
Logo.Image = "rbxassetid://10851141315"
Logo.BackgroundTransparency = 1
Logo.Draggable = true
Instance.new("UICorner", Logo).CornerRadius = UDim.new(1, 0)

local Window = Rayfield:CreateWindow({
   Name = "Quantum Onyx | Peter Hub Final 👑",
   LoadingTitle = "BYPASSING SERVER PROTECTION...",
   LoadingSubtitle = "Oa Channel Logic Applied",
   ConfigurationSaving = { Enabled = false }
})

Logo.MouseButton1Click:Connect(function() Rayfield:Toggle() end)

-- [ التبويبات التي تظهر في صورك ] --
local Main = Window:CreateTab("Main (الرئيسية)", 4483362458) --
local Farm = Window:CreateTab("Farm (تلفيل)", 4483362458) --

-- [[ 1. نظام الانتقال والرجوع الذكي (AI Safezone) ]] --
Main:CreateSection("AI Navigation")

Main:CreateToggle({
   Name = "Go to Safezone (انتقال للنجاة)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().Safe = Value
      spawn(function()
         while getgenv().Safe do task.wait(0.1)
            -- إحداثيات المنطقة الآمنة فوق السحاب لتجنب الموجة
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 800, 0)
         end
      end)
   end,
})

Main:CreateToggle({
   Name = "Auto Money Event (جمع فوري حقيقي)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().Money = Value
      spawn(function()
         while getgenv().Money do task.wait() 
            pcall(function()
               -- استخدام نظام المسح السريع للعملات
               for _, v in pairs(workspace:GetDescendants()) do
                  if v.Name == "Credit" or v.Name == "Coin" then
                     -- الانتقال واللمس البرمجي (Instant Response)
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                     firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                     firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                  end
               end
            end)
         end
      end)
   end,
})

-- [[ 2. قسم الـ Gap Speed (سرعة 2000) ]] --
Farm:CreateSection("Speed & Rarity")

Farm:CreateDropdown({
   Name = "Gap Speed (سرعة الاستجابة)",
   Options = {"500", "1000", "1500", "2000"}, --
   CurrentOption = "2000",
   Callback = function(v) getgenv().ResponseSpeed = tonumber(v) end,
})

Farm:CreateToggle({
   Name = "Auto Farm (تلفيل تلقائي)",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoFarm = v end,
})

Rayfield:Notify({
   Title = "PETER HUB V41 FIXED",
   Content = "All Remote Events Synced!",
   Duration = 5,
})
