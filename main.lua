-- [[ PETER HUB - VIP ACCESS & GOD MODE V34 ]] --
-- [[ English (العربية) | Anti-Update System ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Peter Hub v34 | VIP & God Mode 👑",
   LoadingTitle = "BYPASSING VIP SYSTEM...",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = { Enabled = false },
   Keybind = "RightControl"
})

-- [ Tabs / التبويبات ] --
local VIP = Window:CreateTab("VIP Area (منطقة الـ VIP)", 4483362458)
local Combat = Window:CreateTab("Combat (القتال)", 4483362458)
local Main = Window:CreateTab("Main (الرئيسية)", 4483362458)

-- [[ 1. ميزة الـ VIP وتجاهل الدفع / VIP & Bypass ]] --
VIP:CreateSection("VIP Access (دخول الـ VIP)")

VIP:CreateButton({
   Name = "Enter VIP Zone (دخول منطقة الـ VIP)",
   Callback = function()
      -- محاكاة الدخول وتخطي البوابة
      pcall(function()
         local player = game.Players.LocalPlayer
         -- البحث عن منطقة الـ VIP في الماب (تلقائياً)
         for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:find("VIP") or v.Name:find("Premium") then
                if v:IsA("BasePart") then
                    player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
                    break
                end
            end
         end
      end)
   end,
})

VIP:CreateToggle({
   Name = "Ignore VIP Pay (تجاهل الدفع)",
   CurrentValue = true,
   Callback = function(Value)
      getgenv().IgnorePay = Value
      spawn(function()
         while getgenv().IgnorePay do task.wait(0.5)
            -- كود لإخفاء نوافذ الدفع المزعجة التي تظهر عند دخول مناطق VIP
            pcall(function()
               local gui = game.Players.LocalPlayer.PlayerGui
               if gui:FindFirstChild("PurchasePrompt") then
                  gui.PurchasePrompt.Enabled = false
               end
            end)
         end
      end)
   end,
})

-- [[ 2. القتال المطور (سرعة 700) / Combat ]] --
Combat:CreateSection("Super Attack (الهجوم الخارق)")

Combat:CreateSlider({
   Name = "Attack Speed (سرعة الضرب)",
   Range = {1, 700},
   Increment = 1,
   CurrentValue = 350,
   Callback = function(v) getgenv().AttackSpeed = v end,
})

Combat:CreateToggle({
   Name = "Kill All & Drop (إسقاط الجميع)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().AutoHit = v
      spawn(function()
         while getgenv().AutoHit do task.wait(1/getgenv().AttackSpeed)
            pcall(function()
               local target = nil
               for _, p in pairs(game.Players:GetPlayers()) do
                  if p ~= game.Players.LocalPlayer and p.Character then
                     target = p.Character.HumanoidRootPart
                     -- ضرب وتثبيت الهدف
                     firetouchinterest(target, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, 0)
                     firetouchinterest(target, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, 1)
                     game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
                  end
               end
            end)
         end
      end)
   end,
})

-- [[ 3. الخلود الأسطوري / Ultimate God Mode ]] --
Main:CreateSection("Ultimate Protection (حماية أسطورية)")

Main:CreateToggle({
   Name = "God Mode V2 (الخلود المطور)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().GodMode = Value
      spawn(function()
         while getgenv().GodMode do task.wait()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
               char.Humanoid.Health = 100
               -- منع القتل المفاجئ بعد التحديث
               if not char:FindFirstChild("ForceField") then
                  Instance.new("ForceField", char).Visible = false
               end
            end
         end
      end)
   end,
})

-- إشعار التحديث
Rayfield:Notify({
   Title = "PETER HUB V34 UPDATED",
   Content = "VIP Bypass & God Mode V2 Ready!",
   Duration = 5,
})
