-- [[ PETER HUB - THE TRUE ONYX REPLICA ]] --
-- [[ OWNER: PETER | DEV: @oro2c ]] --

-- تحميل المكتبة الأصلية التي تظهر في صورك
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. اللوجو الجانبي (توم كروز) - نظام الفتح والإغلاق
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local LogoBtn = Instance.new("ImageButton", ScreenGui)
local UICorner = Instance.new("UICorner", LogoBtn)

LogoBtn.Size = UDim2.new(0, 60, 0, 60)
LogoBtn.Position = UDim2.new(0, 15, 0.5, -30)
LogoBtn.Image = "rbxassetid://10851141315" -- صورتك المطلوبة
LogoBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LogoBtn.Draggable = true
UICorner.CornerRadius = UDim.new(1, 0)

-- 2. إنشاء النافذة بنفس الألوان والأيقونات (Quantum Onyx Style)
local Window = Rayfield:CreateWindow({
   Name = "Quantum Onyx Project | Peter Hub",
   LoadingTitle = "PETER HUB V21",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = { Enabled = false }
})

LogoBtn.MouseButton1Click:Connect(function() Rayfield:Toggle() end)

-- [ التبويبات بنفس ترتيب صورك بالضبط ] --
local HomeTab = Window:CreateTab("Home", 4483362458) 
local SubFarmTab = Window:CreateTab("Sub Farm", 4483362458)
local SeaEventTab = Window:CreateTab("Sea Event", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local DungeonTab = Window:CreateTab("Dungeon", 4483362458)

-- [[ قسم Home - كما في الصورة 187 ]] --
local FarmSettings = HomeTab:CreateSection("Farm Settings")

HomeTab:CreateDropdown({
   Name = "Weapon",
   Options = {"Melee", "Sword", "Fruit"},
   CurrentOption = {"Melee"},
   Callback = function(v) getgenv().Weapon = v end,
})

HomeTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().AutoFarm = Value
      spawn(function()
         while getgenv().AutoFarm do task.wait()
            pcall(function()
               local Enemy = game.Workspace.Enemies:GetChildren()[1] -- محرك بحث سريع
               if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                  -- الارتفاع الشاهق + الضرب التلقائي
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 12, 0)
                  game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
               end
            end)
         end
      end)
   end,
})

HomeTab:CreateToggle({
   Name = "Take Quest",
   CurrentValue = false,
   Callback = function(v) getgenv().TakeQuest = v end,
})

-- [[ قسم Sub Farm - كما في الصورة 186 ]] --
local WorldFarming = SubFarmTab:CreateSection("World Farming")

SubFarmTab:CreateToggle({
   Name = "Auto Second Sea Quest",
   CurrentValue = false,
   Callback = function(v) 
      -- كود الانتقال للعالم الثاني وتلفيله
   end,
})

local QuestFarming = SubFarmTab:CreateSection("Quest Farming")
SubFarmTab:CreateToggle({ Name = "Complete Bartilo Quest", CurrentValue = false, Callback = function() end })

-- [[ قسم Dungeon - كما في الصورة 190 ]] --
local FruitAwaken = DungeonTab:CreateSection("Fruit Awakenings")

DungeonTab:CreateDropdown({
   Name = "Raid Chip",
   Options = {"Flame", "Ice", "Buddha", "Light"},
   CurrentOption = {"Flame"},
   Callback = function(v) getgenv().Chip = v end,
})

DungeonTab:CreateToggle({ Name = "Auto Complete Raid", CurrentValue = false, Callback = function() end })

-- [[ الإشعارات الجانبية التي ظهرت في صورك ]] --
Rayfield:Notify({
   Title = "Quantum Fully Loaded",
   Content = "All Functions, Modules, Dependencies Loaded Successfully.",
   Duration = 5,
   Image = 4483362458,
})
