-- [[ PETER HUB - LOGO EDITION V17.0 ]] --
-- [[ OWNER: PETER | DEV: @oro2c ]] --

-- 1. إنشاء الأيقونة العائمة (اللوجو الجانبي)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local LogoButton = Instance.new("ImageButton", ScreenGui)
local UICorner = Instance.new("UICorner", LogoButton)

LogoButton.Name = "PeterHubLogo"
LogoButton.Size = UDim2.new(0, 60, 0, 60)
LogoButton.Position = UDim2.new(0, 10, 0.5, -30) -- يسار الشاشة
LogoButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LogoButton.Image = "rbxassetid://10851141315" -- معرف الصورة (توم كروز) كما طلبت
LogoButton.BorderSizePixel = 2
LogoButton.Draggable = true -- يمكنك تحريك اللوجو بيدك في أي مكان
UICorner.CornerRadius = UDim.new(1, 0) -- جعل الصورة دائرية احترافية

-- 2. تحميل المكتبة والقوائم
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("بيتر هب - النسخة الشاملة 👑", "Midnight")

-- نظام فتح وإغلاق القائمة عند الضغط على اللوجو
LogoButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)

-- [ التبويبات ] --
local FarmTab = Window:NewTab("التلفيل الذكي 🚜")
local MiscTab = Window:NewTab("الإعدادات ⚙️")

-- [[ محرك التلفيل بالارتفاع الشاهق ]] --
local FarmSection = FarmTab:NewSection("تلفيل المهام")
FarmSection:NewToggle("بدء التلفيل التلقائي", "ارتفاع شاهق + استلام مهام", function(state)
    getgenv().AutoFarm = state
    spawn(function()
        while getgenv().AutoFarm do task.wait()
            pcall(function()
                local player = game.Players.LocalPlayer
                -- محرك استلام المهمة حسب لفل الشخصية
                if not player.PlayerGui.Main.Quest.Visible then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
                end
                
                -- البحث والضرب بارتفاع عالي (12 قدم)
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        -- تجهيز السلاح تلقائياً
                        if not player.Character:FindFirstChildOfClass("Tool") then
                            for _, t in pairs(player.Backpack:GetChildren()) do
                                if t:IsA("Tool") then player.Character.Humanoid:EquipTool(t) end
                            end
                        end
                        -- الطيران فوق الوحش وتوجيه الضربات
                        player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 12, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    end
                end
            end)
        end
    end)
end)

-- [[ ميزات إضافية ]] --
MiscTab:NewSection("المطور: بيتر")
MiscTab:NewButton("نسخ التليجرام: @oro2c", "Copy", function() setclipboard("oro2c") end)
