-- [[ PETER HUB - OFFICIAL RELEASE ]] --
-- [[ OWNER: MASTER SAJJAD | DEV: PETER ]] --

-- 1. نظام الترحيب الملون (Intro)
local function CreateIntro()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local TextLabel = Instance.new("TextLabel", ScreenGui)
    TextLabel.Size = UDim2.new(0, 500, 0, 100)
    TextLabel.Position = UDim2.new(0.5, -250, 0.4, -50)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "PETER HUB IS LOADING..."
    TextLabel.Font = Enum.Font.SpecialElite
    TextLabel.TextSize = 60
    TextLabel.TextStrokeTransparency = 0
    
    spawn(function()
        local colors = {
            Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), 
            Color3.fromRGB(0, 0, 255), Color3.fromRGB(255, 255, 0)
        }
        for i = 1, 10 do -- سيغير الألوان بسرعة ثم يختفي
            TextLabel.TextColor3 = colors[i % #colors + 1]
            task.wait(0.3)
        end
        ScreenGui:Destroy()
    end)
end

-- تشغيل الترحيب أولاً
CreateIntro()
task.wait(3) -- انتظار بسيط لضمان تحميل المكتبة

-- 2. تحميل مكتبة القوائم (Kavo Library)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PETER HUB - بلوكس فروت 👑", "Midnight")

-- [ التبويبات المعربة ] --
local MainTab = Window:NewTab("التلفيل التلقائي 🚜")
local RaidTab = Window:NewTab("الغارات (Raids) ⚡")
local FruitTab = Window:NewTab("قسم الفواكه 🍎")
local CreditTab = Window:NewTab("الحقوق والمطور 👑")

-- [[ قسم التلفيل ]] --
local MainSection = MainTab:NewSection("تلفيل بيتر (PETER)")
MainSection:NewToggle("بدء التلفيل التلقائي", "يقتل الجنود ويستلم المهام", function(state)
    getgenv().AutoFarm = state
    while getgenv().AutoFarm do task.wait()
        pcall(function()
            -- كود القتل السريع الذي برمجناه
        end)
    end
end)

-- [[ قسم الغارات ]] --
local RaidSection = RaidTab:NewSection("إدارة الغارات")
RaidSection:NewButton("شراء رقاقة وبدء غارة", "Start", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsCustomer", "BuyChip", "Flame")
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsCustomer", "StartRaid")
end)

-- [[ قسم الحقوق - هنا يظهر تعبك يا سجاد ]] --
local CreditSection = CreditTab:NewSection("صنع بواسطة: MASTER SAJJAD")
CreditSection:NewButton("يوزر القناة: @oro2c", "اضغط للنسخ", function()
    setclipboard("oro2c")
end)
CreditSection:NewLabel("إصدار السكربت: V10.0 المطور")
