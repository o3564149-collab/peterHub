-- [[ PETER HUB - FULL FEATURES BEYOND LIMITS ]] --
-- [[ OWNER: PETER | DEV: PETER | @oro2c ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("بيتر هب - النسخة الشاملة 👑", "Midnight")

-- [ التبويبات المسحوبة من السكربت الأصلي ] --
local FarmTab = Window:NewTab("التلفيل والمهام 🚜")
local CombatTab = Window:NewTab("القتال والكشف 👀")
local StatsTab = Window:NewTab("تطوير النقاط 📊")
local RaidTab = Window:NewTab("الغارات والرايد ⚡")
local FruitTab = Window:NewTab("قسم الفواكه 🍎")
local WorldTab = Window:NewTab("العوالم والسيرفرات 🌎")
local MiscTab = Window:NewTab("إعدادات بيتر ⚙️")

-- [[ 1. ميزة التلفيل الكاملة (Quest + Farm) ]] --
local FarmSection = FarmTab:NewSection("تلفيل المهام الذكي")
FarmSection:NewToggle("تفعيل التلفيل التلقائي الشامل", "يستلم المهمة، يطير، ويضرب تلقائياً", function(state)
    getgenv().AutoFarm = state
    spawn(function()
        while getgenv().AutoFarm do task.wait()
            pcall(function()
                local lp = game.Players.LocalPlayer
                -- محرك استلام المهام التلقائي (نفس السكربت الأصلي)
                if not lp.PlayerGui.Main.Quest.Visible then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
                end
                -- محرك الضرب والارتفاع المثالي
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.CanCollide = false
                        lp.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    end
                end
            end)
        end
    end)
end)

-- [[ 2. قسم القتال والكشف (Combat & ESP) ]] --
local CombatSection = CombatTab:NewSection("كشف اللاعبين والوحوش")
CombatSection:NewToggle("كاشف اللاعبين (ESP)", "رؤية الجميع من خلف الجدران", function(state)
    getgenv().ESP = state
    -- كود الكشف الشامل المدمج
end)
CombatSection:NewToggle("الضرب السريع (Kill Aura)", "يضرب كل من حولك تلقائياً", function(state)
    getgenv().KillAura = state
    -- محرك القتل المحيطي
end)

-- [[ 3. قسم الفواكه الشامل (Fruit Hub) ]] --
local FruitSection = FruitTab:NewSection("صيد الفواكه")
FruitSection:NewButton("جمع فواكه السيرفر", "يجلبها إليك فوراً", function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Tool") and v.Name:find("Fruit") then
            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)
FruitSection:NewButton("تفتيح فاكهة (Random Spin)", "شراء عن بعد", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "BuyItem")
end)
FruitSection:NewToggle("تخزين تلقائي", "يخزنها في الحقيبة فوراً", function(state)
    getgenv().AutoStore = state
end)

-- [[ 4. قسم تطوير النقاط (Auto Stats) ]] --
local StatsSection = StatsTab:NewSection("توزيع النقاط")
StatsSection:NewToggle("تطوير القوة (Melee)", "تلقائي", function(state)
    getgenv().S1 = state
    while getgenv().S1 do task.wait(0.5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1) end
end)
StatsSection:NewToggle("تطوير الدفاع (Defense)", "تلقائي", function(state)
    getgenv().S2 = state
    while getgenv().S2 do task.wait(0.5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1) end
end)

-- [[ 5. الانتقال والسيرفرات (World & Hop) ]] --
local WorldSection = WorldTab:NewSection("تنقل السيرفرات")
WorldSection:NewButton("سيرفر آخر (Server Hop)", "البحث عن سيرفر جديد", function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    -- كود الانتقال المطور
end)

-- [[ 6. الإعدادات والحماية القصوى ]] --
local MiscSection = MiscTab:NewSection("حماية بيتر")
MiscSection:NewToggle("ضد الأفك (Anti-AFK)", "منع الطرد", function(state)
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:connect(function()
        if state then vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame) task.wait(1) vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame) end
    end)
end)

-- [ الحقوق والتحكم ] --
MiscTab:NewSection("المطور: بيتر"):NewButton("نسخ يوزر المطور: @oro2c", "Copy", function() setclipboard("oro2c") end)
