-- [[ نظام الترحيب بالألوان السبعة - PETER HUB ]] --

local function CreateIntro()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local TextLabel = Instance.new("TextLabel", ScreenGui)

    TextLabel.Size = UDim2.new(0, 500, 0, 100)
    TextLabel.Position = UDim2.new(0.5, -250, 0.4, -50) -- منتصف الشاشة
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "PETER HUB IS LOADING..." -- نص الترحيب
    TextLabel.Font = Enum.Font.SpecialElite
    TextLabel.TextSize = 60
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

    -- نظام الألوان السبعة المتغيرة (Rainbow Logic)
    spawn(function()
        local colors = {
            Color3.fromRGB(255, 0, 0),    -- أحمر
            Color3.fromRGB(255, 165, 0),  -- برتقالي
            Color3.fromRGB(255, 255, 0),  -- أصفر
            Color3.fromRGB(0, 255, 0),    -- أخضر
            Color3.fromRGB(0, 255, 255),  -- سماوي
            Color3.fromRGB(0, 0, 255),    -- أزرق
            Color3.fromRGB(238, 130, 238) -- بنفسجي
        }
        
        -- تحريك الألوان لمدة 5 ثواني ثم الاختفاء
        local startTime = tick()
        while tick() - startTime < 5 do
            for i = 1, #colors do
                game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5), {TextColor3 = colors[i]}):Play()
                task.wait(0.5)
            end
        end
        
        -- اختفاء تدريجي
        game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(1), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
        task.wait(1)
        ScreenGui:Destroy()
    end)
end

-- تشغيل الترحيب
CreateIntro()

-- باقي كود السكربت (الحماية والواجهة) يبدأ من هنا...
print("PETER HUB Started Successfully!")
