-- =============================================
-- Revo Script | Kick a Lucky Block
-- Full Version - Draggable + Minimize + Toggles
-- =============================================

local player = game.Players.LocalPlayer
print("Revo Script: Loading...")

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 500)
frame.Position = UDim2.new(0.5, -170, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
frame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- TitleBar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "REVO SCRIPT"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = titleBar

-- Minimize Button
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -40, 0, 15)
minBtn.BackgroundTransparency = 1
minBtn.Text = "–"
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = titleBar

-- Drag Function
local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Minimize Logic
local minimized = false
local originalSize = frame.Size
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        frame.Size = UDim2.new(0, 340, 0, 60)
        minBtn.Text = "+"
    else
        frame.Size = originalSize
        minBtn.Text = "–"
    end
end)

-- Toggles Function
local yOffset = 80
local function AddToggle(text, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(0.92, 0, 0, 50)
    toggleFrame.Position = UDim2.new(0.04, 0, 0, yOffset)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
    toggleFrame.Parent = frame

    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 10)
    tc.Parent = toggleFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.TextScaled = true
    label.Font = Enum.Font.GothamSemibold
    label.Parent = toggleFrame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.25, 0, 0.75, 0)
    btn.Position = UDim2.new(0.7, 0, 0.12, 0)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    btn.Text = "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 80, 80)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = toggleFrame

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 8)
    bc.Parent = btn

    local enabled = false
    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            btn.Text = "ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
            btn.TextColor3 = Color3.new(1,1,1)
        else
            btn.Text = "OFF"
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
            btn.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
        callback(enabled)
    end)
    yOffset = yOffset + 60
end

-- Features
AddToggle("Auto Perfect Kick", function(s) getgenv().AutoKick = s end)
AddToggle("Auto Collect Everything", function(s) getgenv().AutoCollect = s end)
AddToggle("Auto Train Weights", function(s) getgenv().AutoTrain = s end)
AddToggle("Auto Upgrade All", function(s) getgenv().AutoUpgrade = s end)
AddToggle("Auto Rebirth", function(s) getgenv().AutoRebirth = s end)
AddToggle("Infinite Speed", function(s) 
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = s and 120 or 16
    end
end)
AddToggle("Godmode", function(s) 
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.MaxHealth = s and math.huge or 100
        player.Character.Humanoid.Health = s and math.huge or 100
    end
end)

print("✅ Revo Script Full Version loaded successfully!")
