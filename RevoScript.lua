-- Revo Script - Clean Working Version

print("Revo Script: Loading...")

local player = game.Players.LocalPlayer

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 480)
frame.Position = UDim2.new(0.78, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
frame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "REVO SCRIPT"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = titleBar

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 300)
info.Position = UDim2.new(0, 0, 0, 100)
info.BackgroundTransparency = 1
info.Text = "✅ Script loaded successfully!\n\nKey: REVO-AURORA-TINKI\n\nThis is the new version."
info.TextColor3 = Color3.new(1,1,1)
info.TextScaled = true
info.Parent = frame

print("✅ Revo Script - New Version loaded!")
