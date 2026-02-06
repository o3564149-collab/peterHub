-- [[ PETER HUB - WORLD 2 & TRADES UPDATE ]] --
-- [[ OWNER: PETER | DEV: @oro2c ]] --

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- 1. اللوجو الجانبي (توم كروز) - يفتح ويغلق القائمة
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ImageButton = Instance.new("ImageButton", ScreenGui)
local UICorner = Instance.new("UICorner", ImageButton)

ImageButton.Size = UDim2.new(0, 65, 0, 65)
ImageButton.Position = UDim2.new(0.02, 0, 0.4, 0)
ImageButton.Image = "rbxassetid://10851141315"
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.Draggable = true
UICorner.CornerRadius = UDim.new(1, 0)

-- 2. إعداد واجهة بيتر هب
local Window = Fluent:CreateWindow({
    Title = "بيتر هب - العالم الثاني والتريدات 👑",
    SubTitle = "بواسطة بيتر",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

ImageButton.MouseButton1Click:Connect(function() Window:Toggle() end)

-- [ التبويبات المترجمة بالكامل ] --
local Tabs = {
    Farm = Window:AddTab({ Title = "تلفيل العالم 1-2 🚜", Icon = "map" }),
    Trade = Window:AddTab({ Title = "التريدات والتجارة 🔄", Icon = "refresh-cw" }),
    Fruit = Window:AddTab({ Title = "قسم الفواكه 🍎", Icon = "apple" }),
    Misc = Window:AddTab({ Title = "إعدادات المطور ⚙️", Icon = "settings" })
}

-- [[ محرك تلفيل العالم الثاني - مسحوب من السكربت الأصلي ]] --
Tabs.Farm:AddToggle("AutoFarm", {Title = "بدء التلفيل التلقائي (شامل)", Default = false}):OnChanged(function(Value)
    getgenv().AutoFarm = Value
    spawn(function()
        while getgenv().AutoFarm do task.wait()
            pcall(function()
                local LP = game.Players.LocalPlayer
                local LVL = LP.Data.Level.Value
                local Target, QName, QNPC, CFrameNPC

                -- نظام العالم الأول (تكملة) والعالم الثاني
                if LVL >= 700 and LVL < 775 then -- بداية العالم الثاني
                    Target = "Raider [Lvl. 700]"; QName = "RaiderQuest1"; QNPC = "Quest Giver"; CFrameNPC = CFrame.new(-425, 7, 2743)
                elseif LVL >= 775 and LVL < 800 then
                    Target = "Mercenary [Lvl. 775]"; QName = "RaiderQuest2"; QNPC = "Quest Giver"; CFrameNPC = CFrame.new(-425, 7, 2743)
                elseif LVL >= 800 and LVL < 875 then
                    Target = "Swan Pirate [Lvl. 800]"; QName = "SwanQuest1"; QNPC = "Quest Giver"; CFrameNPC = CFrame.new(1038, 12, 1106)
                -- يمكنك إضافة باقي وحوش العالم الثاني هنا بنفس النمط
                end

                if not LP.PlayerGui.Main.Quest.Visible then
                    LP.Character.HumanoidRootPart.CFrame = CFrameNPC
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QName, 1)
                else
                    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name:find(Target) and v.Humanoid.Health > 0 then
                            LP.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 12, 0)
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                        end
                    end
                end
            end)
        end
    end)
end)

-- [[ قسم التريدات (Trade System) ]] --
local TradeSection = Tabs.Trade:AddSection("إدارة التجارة")

Tabs.Trade:AddButton({
    Title = "قبول التريد تلقائياً (Auto Accept)",
    Callback = function()
        -- سحب ميزة القبول التلقائي للتريدات من السكربت الأصلي
        spawn(function()
            while task.wait(1) do
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Trade_Accept")
            end
        end)
    end
})

Tabs.Trade:AddButton({
    Title = "عرض الفواكه للتريد",
    Callback = function()
        -- أوامر عرض الفواكه في قائمة التبادل
    end
})

-- [[ قسم الفواكه ]] --
Tabs.Fruit:AddButton({
    Title = "جمع فواكه العالم الثاني",
    Callback = function()
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") and v.Name:find("Fruit") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
            end
        end
    end
})

-- [[ الحقوق ]] --
Tabs.Misc:AddButton({ Title = "نسخ تليجرام بيتر", Callback = function() setclipboard("@oro2c") end })
