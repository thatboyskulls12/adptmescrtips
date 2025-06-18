-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "MultiScriptLoader"

-- Frame settings
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 220)
Frame.Position = UDim2.new(0.5, -150, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Active = true
Frame.Draggable = true

UICorner.Parent = Frame

-- Helper function to create buttons
local function createButton(text, yPos, fileName)
    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(0, 260, 0, 40)
    Button.Position = UDim2.new(0, 20, 0, yPos)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundColor3 = Color3.fromRGB(60, 120, 180)
    Button.TextSize = 16

    Button.MouseButton1Click:Connect(function()
        if isfile(fileName) then
            local content = readfile(fileName)
            local success, result = pcall(loadstring(content))
            if success then
                print("Executed: " .. fileName)
            else
                warn("Execution failed: " .. result)
            end
        else
            warn("File not found: " .. fileName)
        end
    end)
end

-- Create the buttons
createButton("🐾 Duplicate Pets", 20, "duplicate_pets.lua")
createButton("🐶 Pet Spawner", 70, "pet_spawner.lua")
createButton("💰 Trade Scam", 120, "trade_scam.lua")
