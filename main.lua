-- [[ PETER HUB - AI TSUNAMI DODGER V40 ]] --
-- [[ الأيقونة الأصلية | ذكاء اصطناعي | سرعة 2000 ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. أيقونة النينجا الأصلية (Onyx)
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
   Name = "Quantum Onyx | Peter Hub AI 👑",
   LoadingTitle = "AI BRAIN INITIALIZING...",
   LoadingSubtitle = "by Peter & Oa Features",
   ConfigurationSaving = { Enabled = false }
})

Logo.MouseButton1Click:Connect(function() Rayfield:Toggle() end)

local Main = Window:CreateTab("AI Survival (نجاة ذكية)", 4483362458)
local Farm = Window:CreateTab("Auto Farm (تلفيل)", 4483362458)

-- [[ 1. ميزة الذكاء الاصطناعي لتجنب التسونامي ]] --
Main:CreateSection("AI Smart Dodge (تجنب ذكي)")

Main:CreateToggle({
   Name = "AI Auto-Teleport Escape (تنقل نجاة ذكي)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().AIDodge = Value
      spawn(function()
         while getgenv().AIDodge do task.wait(0.1)
            pcall(function()
               -- كشف التسونامي باستخدام الذكاء الاصطناعي البسيط
               local tsunami = workspace:FindFirstChild("Tsunami") or workspace:FindFirstChild("Wave")
               if tsunami then
                  local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - tsunami.Position).Magnitude
                  if dist < 100 then -- إذا اقترب التسونامي
                     -- حفظ الموقع الحالي قبل الانتقال
                     getgenv().LastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                     -- الانتقال الفوري للمنطقة الآمنة (Safezone)
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
                     Rayfield:Notify({Title = "AI Warning!", Content = "Tsunami Detected! Escaping...", Duration = 2})
                  end
               end
            end)
         end
      end)
   end,
})

Main:CreateToggle({
   Name = "Auto Return (رجوع تلقائي)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().AutoReturn = Value
      spawn(function()
         while getgenv().AutoReturn do task.wait(1)
            pcall(function()
               local tsunami = workspace:FindFirstChild("Tsunami") or workspace:FindFirstChild("Wave")
               -- إذا انتهى التسونامي، ارجع للمكان اللي كنت فيه
               if not tsunami and getgenv().LastPos then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().LastPos
                  getgenv().LastPos = nil
                  Rayfield:Notify({Title = "Safe", Content = "Tsunami Passed! Returning...", Duration = 2})
               end
            end)
         end
      end)
   end,
})

-- [[ 2. إعدادات التلفيل السريع ]] --
Farm:CreateSection("Fast Response (استجابة 2000)")

Farm:CreateSlider({
   Name = "Gap Speed (سرعة الاستجابة)",
   Range = {500, 2000},
   Increment = 500,
   CurrentValue = 2000,
   Callback = function(v) getgenv().Response = v end,
})

Farm:CreateToggle({
   Name = "Auto Collect Money (جمع أموال)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().FarmMoney = v
      spawn(function()
         while getgenv().FarmMoney do task.wait(0.01)
            pcall(function()
               -- نظام مسح العملات المطور
               for _, coin in pairs(workspace:GetDescendants()) do
                  if coin.Name == "Credit" or coin.Name == "Coin" then
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame
                     firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, coin, 0)
                  end
               end
            end)
         end
      end)
   end,
})

Rayfield:Notify({
   Title = "PETER HUB V40 AI",
   Content = "AI Dodge & Auto Return Active!",
   Duration = 5,
})
