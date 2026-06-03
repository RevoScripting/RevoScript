print("=== REVO TEST STARTED ===")

local player = game.Players.LocalPlayer

local sg = Instance.new("ScreenGui")
sg.Parent = player:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 400, 0, 300)
f.Position = UDim2.new(0.5, -200, 0.5, -150)
f.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
f.Parent = sg

local c = Instance.new("UICorner")
c.CornerRadius = UDim.new(0, 15)
c.Parent = f

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1,0,1,0)
t.BackgroundTransparency = 1
t.Text = "✅ REVO SCRIPT\n\nDas Script funktioniert jetzt.\n\nWenn du das siehst, ist alles
