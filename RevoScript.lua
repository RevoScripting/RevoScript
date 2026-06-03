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
