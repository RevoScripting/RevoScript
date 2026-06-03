-- Revo Script - Test Version (Clean)

local player = game.Players.LocalPlayer
print("Revo Script: Started")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 500)
MainFrame.Position = UDim2.new(0.75, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Parent = ScreenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = MainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
title.Text = "REVO SCRIPT - TEST"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = MainFrame

local testLabel = Instance.new("TextLabel")
testLabel.Size = UDim2.new(1, 0, 0, 100)
testLabel.Position = UDim2.new(0, 0, 0, 100)
testLabel.BackgroundTransparency = 1
testLabel.Text = "✅ Script loaded successfully!\n\nIf you see this, the script works."
testLabel.TextColor3 = Color3.new(1,1,1)
testLabel.TextScaled = true
testLabel.Parent = MainFrame

print("✅ Test GUI should now be visible!")
