-- [[ PETER HUB - V13.0 FINAL ]] --
-- [[ المطور: بيتر | الحقوق: @oro2c ]] --

-- 1. نظام الدخول الفخم (نفس السكربت المطلوب)
local function StartIntro()
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local f = Instance.new("Frame", sg)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = Color3.new(0, 0, 0)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0, 500, 0, 100)
    l.Position = UDim2.new(0.5, -250, 0.5, -50)
    l.BackgroundTransparency = 1
    l.Text = "PETER HUB"
    l.TextColor3 = Color3.new(1, 1, 1)
    l.TextSize = 80
    l.Font = Enum.Font.GothamBold
    l.TextTransparency = 1
    
    game:GetService("TweenService"):Create(l, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2)
    game:GetService("TweenService"):Create(f, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    game:GetService("TweenService"):Create(l, TweenInfo.new(1), {TextTransparency = 1}):Play()
    task.wait(1)
    sg:Destroy()
end
spawn(StartIntro)

-- 2. حل مشكلة الأوامر (تجهيز المحرك)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("بيتر هب - القائمة الشاملة 👑", "Midnight")

-- [ التبويبات ] --
local MainTab = Window:NewTab("الرئيسية 🏠")
local FarmTab = Window:NewTab("التلفيل التلقائي 🚜")
local FruitTab = Window:NewTab("الفواكه 🍎")
local StatsTab = Window:NewTab("النقاط 📊")
local TeleportTab = Window:NewTab("الانتقال ✈️")
local MiscTab = Window:NewTab("الإعدادات ⚙️")

-- [[ حل مشكلة التلفيل والضرب ]] --
local FarmSection = FarmTab:NewSection("تلفيل بيتر الذكي")
FarmSection:NewToggle("تفعيل التلفيل التلقائي", "سيقوم بالضرب واستلام المهام", function(state)
    getgenv().AutoFarm = state
    spawn(function()
        while getgenv().AutoFarm do task.wait()
            pcall(function()
                local player = game.Players.LocalPlayer
                -- التحقق من وجود السلاح وتجهيزه تلقائياً للضرب
                if not player.Character:FindFirstChildOfClass("Tool") then
                    for _, v in pairs(player.Backpack:GetChildren()) do
                        if v:IsA("Tool") and (v.ToolTip == "Melee" or v.Name:find("Sword")) then
                            player.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                -- محرك البحث عن الوحوش والضرب
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.CanCollide = false
                        player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    end
                end
            end)
        end
    end)
end)

-- [[ ميزة تجميع الفواكه من الأرض ]] --
local FruitSection = FruitTab:NewSection("صيد الفواكه")
FruitSection:NewButton("جمع فواكه الخريطة", "يجلب كل الفواكه المرمية للأرض إليك", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Tool") and v.Name:find("Fruit") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
        end
    end
end)

FruitSection:NewButton("سبين فاكهة عشوائية", "شراء عن بعد", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "BuyItem")
end)

-- [[ ميزة الطيران (Fly) ]] --
local TeleSection = TeleportTab:NewSection("نظام التنقل")
TeleSection:NewToggle("تفعيل الطيران (Fly)", "تحرك بحرية في الخريطة", function(state)
    getgenv().Fly = state
    local lp = game.Players.LocalPlayer
    local mouse = lp:GetMouse()
    if state then
        local bg = Instance.new("BodyGyro", lp.Character.HumanoidRootPart)
        local bv = Instance.new("BodyVelocity", lp.Character.HumanoidRootPart)
        bg.P = 9e4; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9); bg.cframe = lp.Character.HumanoidRootPart.CFrame
        bv.velocity = Vector3.new(0, 0.1, 0); bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        spawn(function()
            while getgenv().Fly do task.wait()
                lp.Character.Humanoid.PlatformStand = true
                bv.velocity = mouse.Hit.lookVector * 100
                bg.cframe = CFrame.new(lp.Character.HumanoidRootPart.Position, mouse.Hit.p)
            end
            bg:Destroy(); bv:Destroy(); lp.Character.Humanoid.PlatformStand = false
        end)
    end
end)

-- [[ قسم الإعدادات ]] --
local MiscSection = MiscTab:NewSection("حماية بيتر")
MiscSection:NewToggle("ضد الأفك (Anti-AFK)", "يمنع الطرد", function(state)
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:connect(function()
        if state then vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame) task.wait(1) vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame) end
    end)
end)

MiscTab:NewSection("المطور: بيتر"):NewButton("قناتي: @oro2c", "نسخ", function() setclipboard("oro2c") end)
