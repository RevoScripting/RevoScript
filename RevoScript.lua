-- =============================================
-- Revo Script | Kick a Lucky Block
-- Premium GUI + External Key System
-- =============================================

local player = game.Players.LocalPlayer

print("Revo Script: Loading...")

-- =================== LOAD KEYS FROM FILE ===================
local keyUrl = "https://raw.githubusercontent.com/RevoScripting/RevoScript/main/RevoKeys.txt"

local validKeys = {}
local success, response = pcall(function()
    return game:HttpGet(keyUrl)
end)

if success and response and response ~= "" then
    for line in response:gmatch("[^\r\n]+") do
        local key = line:match("^%s*(.-)%s*$")
        if key and key ~= "" then
            table.insert(validKeys, key)
        end
    end
    print("✅ Successfully loaded " .. #validKeys .. " keys from RevoKeys.txt")
else
    print("❌ Failed to load keys from file - using default")
    validKeys = {"REVO-2026-PREMIUM"}
end

print("Available Keys: " .. table.concat(validKeys, " | "))

-- =================== KEY GUI (English) ===================
local keyGui = Instance.new("ScreenGui")
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 340, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -170, 0.4, 0)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
KeyFrame.Parent = keyGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = KeyFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
Title.Text = "REVO SCRIPT"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = KeyFrame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0.85, 0, 0, 45)
Input.Position = UDim2.new(0.075, 0, 0, 70)
Input.PlaceholderText = "Enter Key..."
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
Input.TextColor3 = Color3.new(1,1,1)
Input.TextScaled = true
Input.Parent = KeyFrame

local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(0.85, 0, 0, 40)
Submit.Position = UDim2.new(0.075, 0, 0, 130)
Submit.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
Submit.Text = "SUBMIT KEY"
Submit.TextColor3 = Color3.new(1,1,1)
Submit.TextScaled = true
Submit.Font = Enum.Font.GothamBold
Submit.Parent = KeyFrame

Submit.MouseButton1Click:Connect(function()
    local entered = Input.Text
    for _, key in ipairs(validKeys) do
        if entered == key then
            keyGui:Destroy()
            print("✅ Correct Key!")
            loadMainGUI()
            return
        end
    end
    Input.Text = "❌ WRONG KEY!"
    wait(1.5)
    Input.Text = ""
end)

function loadMainGUI()
    print("🎉 Revo Script fully loaded!")
end
