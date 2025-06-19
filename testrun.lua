-- Get PlayerGui for Delta compatibility
local player = game:GetService("Players").LocalPlayer
local guiParent = player:WaitForChild("PlayerGui")

-- Create GUI
local ScreenGui = Instance.new("ScreenGui", guiParent)
ScreenGui.Name = "DeltaFinalGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 340, 0, 240)
Frame.Position = UDim2.new(0.5, -170, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)

-- Popup message function
local function showMessage(text)
    local popup = Instance.new("TextLabel", ScreenGui)
    popup.Size = UDim2.new(0, 300, 0, 30)
    popup.Position = UDim2.new(0.5, -150, 0, 0)
    popup.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    popup.TextColor3 = Color3.fromRGB(255, 255, 255)
    popup.Text = text
    popup.Font = Enum.Font.SourceSansBold
    popup.TextSize = 18
    popup.BackgroundTransparency = 0.1

    task.delay(3, function()
        popup:Destroy()
    end)
end

-- Run script from GitHub
local function runGitHubScript(file)
    local url = "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/" .. file
    showMessage("📡 Loading: " .. file)

    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)

    if success then
        showMessage("✅ Script executed!")
    else
        showMessage("❌ Script failed!")
    end
end

-- Button creator
local function createButton(label, yPos, fileName)
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(0, 300, 0, 40)
    Button.Position = UDim2.new(0, 20, 0, yPos)
    Button.BackgroundColor3 = Color3.fromRGB(60, 120, 180)
    Button.Text = label .. " (" .. fileName .. ")"
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Corner = Instance.new("UICorner", Button)

    Button.MouseButton1Click:Connect(function()
        runGitHubScript(fileName)
    end)
end

-- Add buttons
createButton("🐾 Duplicate Pets", 20, "duplicate_pets.lua")
createButton("🐶 Pet Spawner", 70, "pet_spawner.lua")
createButton("💰 Trade Scam", 120, "trade_scam.lua")
createButton("🧪 Test Script", 170, "test.lua")
