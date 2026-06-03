print("TEST 1: Script wird ausgeführt!")

local player = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui")
sg.Parent = player:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 300, 0, 200)
f.Position = UDim2.new(0.5, -150, 0.5, -100)
f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
f.Parent = sg

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1,0,1,0)
t.BackgroundTransparency = 1
t.Text = "✅ TEST ERFOLGREICH!\n\nWenn du diesen roten Rahmen siehst,\nfunktioniert Delta Executor."
t.TextColor3 = Color3.new(1,1,1)
t.TextScaled = true
t.Parent = f

print("TEST 2: GUI sollte sichtbar sein!")
