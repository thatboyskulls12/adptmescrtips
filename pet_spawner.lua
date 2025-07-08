-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "MyExecutorGUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui") -- CoreGui works for most executors

-- Create a frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

-- Function to create buttons
local function createButton(name, posY, scriptCode)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local func, err = loadstring(scriptCode)
        if func then
            func()
        else
            warn("Error in script:", err)
        end
    end)
end

-- Example scripts
local script1 = [[
    game.Players.LocalPlayer:Kick("Script 1 ran!")
]]

local script2 = [[
    print("Script 2 ran - giving you speed")
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
]]

-- Add buttons
createButton("Pet Spawner", 110, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/pet_spawners.lua"))()
]])
createButton("Trade Scam glitch", 110, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/trade_scam.lua"))()
]])
createButton("Auto Grinder", 110, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/Auto_grinder.lua"))()
]])
createButton("House duplicator", 110, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/Auto_grinder.lua"))()
]])



