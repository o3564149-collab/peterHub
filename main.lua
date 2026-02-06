-- [[ PETER HUB - NO LOGO EDITION ]] --
-- [[ ALL FEATURES INCLUDED | KEYBIND: RightControl ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. إعداد النافذة (بدون زر جانبي)
local Window = Rayfield:CreateWindow({
   Name = "Quantum Onyx Project | Peter Hub v27",
   LoadingTitle = "PETER HUB IS READY",
   LoadingSubtitle = "No Logo Version",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PeterHubConfig",
      FileName = "Main"
   },
   KeySystem = false, -- لا يوجد نظام مفاتيح لسهولة الدخول
   Keybind = "RightControl" -- الزر الذي يفتح ويغلق السكربت من الكيبورد
})

-- [[ القوائم الشاملة المستوحاة من صورك ]] --
local Home = Window:CreateTab("Home 🏠", 4483362458)
local SubFarm = Window:CreateTab("Sub Farm 🚜", 4483362458)
local SeaEvent = Window:CreateTab("Sea Event 🌊", 4483362458)
local Dungeon = Window:CreateTab("Dungeon 🏰", 4483362458)
local Dragon = Window:CreateTab("Dragon Update 🐉", 4483362458)
local Player = Window:CreateTab("Player ⚡", 4483362458)

-- [[ 1. محرك التلفيل (Home) ]] --
local FarmSet = Home:CreateSection("Farm Settings")
Home:CreateDropdown({
   Name = "Select Weapon",
   Options = {"Melee", "Sword", "Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) getgenv().Weapon = v end,
})

Home:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(v) getgenv().AutoFarm = v end,
})

Home:CreateToggle({
   Name = "Take Quest",
   CurrentValue = true,
   Callback = function(v) getgenv().TakeQuest = v end,
})

-- [[ 2. قسم الفواكه (Dungeon) ]] --
local FruitSet = Dungeon:CreateSection("Fruit & Raid")
Dungeon:CreateButton({
   Name = "Auto Roll Fruit (Gacha)",
   Callback = function() 
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "BuyItem")
   end,
})

Dungeon:CreateToggle({
   Name = "Auto Store Fruits",
   CurrentValue = true,
   Callback = function(v) getgenv().AutoStore = v end,
})

-- [[ 3. ميزات اللاعب (Player) ]] --
local PlayerSet = Player:CreateSection("Movement")
Player:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

-- [[ محرك التلفيل الذكي - ينتقل فوراً لمهمة ليفل 1146 ]] --
spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoFarm then
            pcall(function()
                local LP = game.Players.LocalPlayer
                local Lvl = LP.Data.Level.Value
                local QName, MName, NPC_Pos

                -- برمجة العالم الثاني - مملكة الورد (Kingdom of Rose)
                if Lvl >= 1100 and Lvl < 1175 then
                    QName = "SwanQuest1" MName = "Swan Pirate" NPC_Pos = CFrame.new(1038, 12, 1106)
                elseif Lvl >= 1175 and Lvl < 1250 then
                    QName = "SwanQuest2" MName = "Water Pirate" NPC_Pos = CFrame.new(1038, 12, 1106)
                end

                if not LP.PlayerGui.Main.Quest.Visible then
                    LP.Character.HumanoidRootPart.CFrame = NPC_Pos
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QName, 1)
                else
                    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name:find(MName) and v.Humanoid.Health > 0 then
                            -- الارتفاع الشاهق (12 قدم) لمنع الموت
                            LP.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 12, 0)
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)

-- إشعار التشغيل
Rayfield:Notify({
   Title = "PETER HUB LOADED",
   Content = "Press Right-Control to Toggle Menu!",
   Duration = 5,
})
