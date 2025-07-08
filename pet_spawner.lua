-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "MyExecutorGUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui") -- Use CoreGui for executors

-- Create a frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 240)
frame.Position = UDim2.new(0.5, -110, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- 👈 Makes it draggable (for most executors)
frame.Parent = gui

-- Optional: Add a title bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.BorderSizePixel = 0
title.Text = "Script Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

-- Function to create buttons
local function createButton(name, posY, scriptCode)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local func, err = loadstring(scriptCode)
        if func then
            func()
        else
            warn("Script Error:", err)
        end
    end)
end

-- Example scripts
local script1 = [[
    game.Players.LocalPlayer:Kick("Script 1 ran!")
]]

local script2 = [[
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
]]

local script3 = [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
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



