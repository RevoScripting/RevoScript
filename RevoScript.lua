-- =============================================
-- Revo Script | Kick a Lucky Block
-- Premium GUI + External Key System
-- =============================================

local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ws = game:GetService("Workspace")

print("Revo Script: Loading...")

-- =================== KEYS LADEN ===================
local keyUrl = "https://raw.githubusercontent.com/RevoScripting/RevoScript/main/RevoKeys.txt"  
-- ↑↑↑ HIER DEINEN GITHUB USERNAME EINFÜGEN ↑↑↑

local validKeys = {}
local success, response = pcall(function()
    return game:HttpGet(keyUrl)
end)

if success then
    for line in response:gmatch("[^\r\n]+") do
        local key = line:match("^%s*(.-)%s*$")
        if key and key ~= "" then
            table.insert(validKeys, key)
        end
    end
    print("✅ " .. #validKeys .. " Keys geladen")
else
    warn("❌ Keys konnten nicht geladen werden!")
    validKeys = {"REVO-2026-PREMIUM"}
end

-- =================== KEY GUI ===================
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

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = Input

local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(0.85, 0, 0, 40)
Submit.Position = UDim2.new(0.075, 0, 0, 130)
Submit.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
Submit.Text = "SUBMIT KEY"
Submit.TextColor3 = Color3.new(1,1,1)
Submit.TextScaled = true
Submit.Font = Enum.Font.GothamBold
Submit.Parent = KeyFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = Submit

Submit.MouseButton1Click:Connect(function()
    local entered = Input.Text
    for _, key in ipairs(validKeys) do
        if entered == key then
            keyGui:Destroy()
            print("✅ Richtiger Key!")
            loadMainGUI()
            return
        end
    end
    Input.Text = "WRONG KEY!"
    wait(1.5)
    Input.Text = ""
end)

function loadMainGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 340, 0, 480)
    MainFrame.Position = UDim2.new(0.78, 0, 0.15, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
    MainFrame.Parent = ScreenGui

    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 12)
    UICorner2.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 55)
    TitleBar.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
    TitleBar.Parent = MainFrame

    local TitleCorner2 = Instance.new("UICorner")
    TitleCorner2.CornerRadius = UDim.new(0, 12)
    TitleCorner2.Parent = TitleBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "REVO SCRIPT"
    TitleLabel.TextColor3 = Color3.new(1,1,1)
    TitleLabel.TextScaled = true
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = TitleBar

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, 0, 0, 20)
    Subtitle.Position = UDim2.new(0, 0, 0, 55)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Kick a Lucky Block • Premium"
    Subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    Subtitle.TextScaled = true
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Parent = MainFrame

    local y = 90
    local function AddToggle(name, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(0.92, 0, 0, 48)
        f.Position = UDim2.new(0.04, 0, 0, y)
        f.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
        f.Parent = MainFrame

        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 10)
        c.Parent = f

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0.65, 0, 1, 0)
        l.Position = UDim2.new(0.05, 0, 0, 0)
        l.BackgroundTransparency = 1
        l.Text = name
        l.TextColor3 = Color3.new(1,1,1)
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextScaled = true
        l.Font = Enum.Font.GothamSemibold
        l.Parent = f

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.25, 0, 0.7, 0)
        b.Position = UDim2.new(0.7, 0, 0.15, 0)
        b.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        b.Text = "OFF"
        b.TextColor3 = Color3.fromRGB(255, 80, 80)
        b.TextScaled = true
        b.Font = Enum.Font.GothamBold
        b.Parent = f

        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0, 8)
        bc.Parent = b

        local on = false
        b.MouseButton1Click:Connect(function()
            on = not on
            if on then
                b.Text = "ON"
                b.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
                b.TextColor3 = Color3.new(1,1,1)
            else
                b.Text = "OFF"
                b.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
                b.TextColor3 = Color3.fromRGB(255, 80, 80)
            end
            callback(on)
        end)
        y = y + 58
    end

    -- === FEATURES ===
    AddToggle("Auto Perfect Kick", function(s) getgenv().AutoKick = s end)
    AddToggle("Auto Collect Everything", function(s) getgenv().AutoCollect = s end)
    AddToggle("Auto Claim Brainrots", function(s) getgenv().AutoBrainrot = s end)
    AddToggle("Auto Train Weights", function(s) getgenv().AutoTrain = s end)
    AddToggle("Auto Upgrade All", function(s) getgenv().AutoUpgrade = s end)
    AddToggle("Auto Rebirth (at 2M)", function(s) getgenv().AutoRebirth = s end)
    AddToggle("Infinite Speed & Jump", function(s) 
        if s then humanoid.WalkSpeed = 120; humanoid.JumpPower = 150
        else humanoid.WalkSpeed = 16; humanoid.JumpPower = 50 end 
    end)
    AddToggle("Godmode", function(s) 
        if s then humanoid.MaxHealth = math.huge; humanoid.Health = math.huge end 
    end)

    print("🎉 Revo Script voll geladen!")
end
