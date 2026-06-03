-- =============================================
-- Revo Script | Kick a Lucky Block
-- Full Version with Key System
-- =============================================

local player = game.Players.LocalPlayer
print("Revo Script: Loading...")

-- =================== KEY SYSTEM ===================
local keyFile = "RevoKey.dat"
local savedKey = ""
if isfile and isfile(keyFile) then
    savedKey = readfile(keyFile):gsub("%s+", "")
end

local validKey = "REVO-AURORA-TINKI"

if savedKey ~= validKey then
    local keyGui = Instance.new("ScreenGui")
    keyGui.Parent = player:WaitForChild("PlayerGui")

    local kf = Instance.new("Frame")
    kf.Size = UDim2.new(0, 340, 0, 180)
    kf.Position = UDim2.new(0.5, -170, 0.4, 0)
    kf.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
    kf.Parent = keyGui

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 12)
    c.Parent = kf

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 50)
    t.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
    t.Text = "REVO SCRIPT"
    t.TextColor3 = Color3.new(1,1,1)
    t.TextScaled = true
    t.Font = Enum.Font.GothamBold
    t.Parent = kf

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.85, 0, 0, 40)
    input.Position = UDim2.new(0.075, 0, 0, 70)
    input.PlaceholderText = "Enter Key..."
    input.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
    input.TextColor3 = Color3.new(1,1,1)
    input.Parent = kf

    local submit = Instance.new("TextButton")
    submit.Size = UDim2.new(0.85, 0, 0, 40)
    submit.Position = UDim2.new(0.075, 0, 0, 120)
    submit.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
    submit.Text = "SUBMIT"
    submit.TextColor3 = Color3.new(1,1,1)
    submit.Parent = kf

    submit.MouseButton1Click:Connect(function()
        if input.Text == validKey then
            if writefile then writefile(keyFile, validKey) end
            keyGui:Destroy()
            loadMainGUI()
        else
            input.Text = "Wrong Key!"
            wait(1)
            input.Text = ""
        end
    end)
else
    loadMainGUI()
end

-- =================== MAIN GUI ===================
function loadMainGUI()
    local sg = Instance.new("ScreenGui")
    sg.ResetOnSpawn = false
    sg.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 360, 0, 520)
    frame.Position = UDim2.new(0.5, -180, 0.5, -260)
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    frame.Parent = sg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = frame

    -- TitleBar + Drag
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 65)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    titleBar.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -100, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = "REVO SCRIPT"
    title.TextColor3 = Color3.new(1,1,1)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = titleBar

    -- Dragging
    local dragging = false
    titleBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dragStart = i.Position; startPos = frame.Position end end)
    game:GetService("UserInputService").InputChanged:Connect(function(i) if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then local delta = i.Position - dragStart; frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end)
    titleBar.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

    -- Minimize
    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 35, 0, 35)
    minBtn.Position = UDim2.new(1, -45, 0, 15)
    minBtn.BackgroundTransparency = 1
    minBtn.Text = "–"
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.Parent = titleBar

    local minimized = false
    local origSize = frame.Size
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        frame.Size = minimized and UDim2.new(0, 360, 0, 65) or origSize
        minBtn.Text = minimized and "+" or "–"
    end)

    -- Toggles
    local y = 85
    local function AddToggle(name, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(0.9, 0, 0, 55)
        f.Position = UDim2.new(0.05, 0, 0, y)
        f.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        f.Parent = frame

        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 12)
        c.Parent = f

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0.62, 0, 1, 0)
        l.Position = UDim2.new(0.05, 0, 0, 0)
        l.BackgroundTransparency = 1
        l.Text = name
        l.TextColor3 = Color3.new(1,1,1)
        l.TextScaled = true
        l.Parent = f

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.28, 0, 0.75, 0)
        b.Position = UDim2.new(0.67, 0, 0.12, 0)
        b.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        b.Text = "OFF"
        b.TextColor3 = Color3.fromRGB(255, 80, 80)
        b.TextScaled = true
        b.Parent = f

        local enabled = false
        b.MouseButton1Click:Connect(function()
            enabled = not enabled
            b.Text = enabled and "ON" or "OFF"
            b.BackgroundColor3 = enabled and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(60, 60, 65)
            callback(enabled)
        end)
        y = y + 65
    end

    AddToggle("Auto Perfect Kick", function(s) getgenv().AutoKick = s end)
    AddToggle("Auto Collect Everything", function(s) getgenv().AutoCollect = s end)
    AddToggle("Auto Train Weights", function(s) getgenv().AutoTrain = s end)
    AddToggle("Auto Upgrade All", function(s) getgenv().AutoUpgrade = s end)
    AddToggle("Infinite Speed", function(s) 
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = s and 125 or 16
        end
    end)
    AddToggle("Godmode", function(s) 
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local h = player.Character.Humanoid
            h.MaxHealth = s and math.huge or 100
            h.Health = s and math.huge or 100
        end
    end)

    print("✅ Revo Script Full Version loaded!")
end
