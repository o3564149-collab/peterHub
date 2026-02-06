-- [[ PETER HUB - THE PROFESSIONAL ONYX REPLICA ]] --
-- [[ OWNER: PETER | DEV: @oro2c ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. إنشاء اللوجو الجانبي (توم كروز) لفتح القائمة
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ImageButton = Instance.new("ImageButton", ScreenGui)
local UICorner = Instance.new("UICorner", ImageButton)

ImageButton.Size = UDim2.new(0, 60, 0, 60)
ImageButton.Position = UDim2.new(0, 15, 0.5, -30)
ImageButton.Image = "rbxassetid://10851141315" -- صورتك المطلوبة
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.Draggable = true
UICorner.CornerRadius = UDim.new(1, 0)

-- 2. إعداد النافذة الرئيسية بنفس تصميم الصور
local Window = Rayfield:CreateWindow({
   Name = "Quantum Onyx Project | Peter Hub",
   LoadingTitle = "PETER HUB IS LOADING...",
   LoadingSubtitle = "by Peter",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PeterHubConfig",
      FileName = "Main"
   }
})

-- ربط اللوجو بفتح وإغلاق القائمة
ImageButton.MouseButton1Click:Connect(function()
    Rayfield:Toggle()
end)

-- [[ التبويبات بنفس ترتيب الأيقونات في صورك ]] --
local HomeTab = Window:CreateTab("Home", 4483362458) -- Home Icon
local SubFarmTab = Window:CreateTab("Sub Farm", 4483362458) -- Farm Icon
local PlayerTab = Window:CreateTab("Player", 4483362458) -- Player Icon
local DungeonTab = Window:CreateTab("Dungeon", 4483362458) -- Dungeon Icon

-- [[ قسم Home - نفس محتوى الصورة ]] --
local MainSection = HomeTab:CreateSection("Farm Settings")

HomeTab:CreateDropdown({
   Name = "Weapon",
   Options = {"Melee", "Sword", "Fruit"},
   CurrentOption = {"Melee"},
   Callback = function(Option) end,
})

HomeTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().AutoFarm = Value
      -- محرك التلفيل الذكي بالارتفاع المطلوب
   end,
})

HomeTab:CreateToggle({
   Name = "Take Quest",
   CurrentValue = false,
   Callback = function(Value) end,
})

-- [[ قسم Sub Farm - World Farming كما في الصورة ]] --
local WorldSection = SubFarmTab:CreateSection("World Farming")

SubFarmTab:CreateToggle({
   Name = "Auto Second Sea Quest",
   CurrentValue = false,
   Callback = function(Value) end,
})

SubFarmTab:CreateToggle({
   Name = "Auto Third Sea Quest",
   CurrentValue = false,
   Callback = function(Value) end,
})

-- [[ قسم Dungeon - Fruit Awakenings كما في الصورة ]] --
local RaidSection = DungeonTab:CreateSection("Fruit Awakenings")

DungeonTab:CreateDropdown({
   Name = "Raid Chip",
   Options = {"Flame", "Ice", "Quake", "Light", "Dark", "Buddha"},
   CurrentOption = {"Flame"},
   Callback = function(Option) end,
})

DungeonTab:CreateToggle({
   Name = "Auto Complete Raid",
   CurrentValue = false,
   Callback = function(Value) end,
})

-- [[ قسم الإشعارات الاحترافية (Quantum Info) ]] --
Rayfield:Notify({
   Title = "Peter Hub Loaded",
   Content = "Success Cleanup, Remove unnecessary utilities...",
   Duration = 5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function() end
      },
   },
})
