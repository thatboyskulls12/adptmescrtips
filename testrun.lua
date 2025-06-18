-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "GitHubScriptLoader"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 340, 0, 270)
Frame.Position = UDim2.new(0.5, -170, 0.5, -135)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.Active = true
Frame.Draggable = true

UICorner.Parent = Frame

-- GitHub raw base URL
local githubBase = "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/"

-- In-game message function
local function showMessage(text)
    local msg = Instance.new("Message", game.CoreGui)
    msg.Text = text
    task.delay(3, function() msg:Destroy() end)
end

-- Updated function with in-game messages
local function runGitScript(fileName)
    local url = githubBase .. fileName
    showMessage("📡 Fetching: " .. fileName)

    local ok, response = pcall(function()
        return syn and syn.request({
            Url = url,
            Method = "GET"
        }) or http and http.request and http.request({
            Url = url,
            Method = "GET"
        })
    end)

    if not ok or not response then
        showMessage("❌ Failed to send HTTP request.")
        return
    end

    if response.Success then
        local success, result = pcall(loadstring(response.Body))
        if success then
            showMessage("✅ Executed: " .. fileName)
        else
            showMessage("❌ Script error in: " .. fileName)
        end
    else
        showMessage("❌ Failed to fetch: " .. fileName)
    end
end

-- Button Generator
local function createButton(icon, label, yPos, fileName)
    local Button = Instance.new("TextButton")
    local Icon = Instance.new("ImageLabel")
    local Label = Instance.new("TextLabel")
    local Corner = Instance.new("UICorner")

    Button.Parent = Frame
    Button.Size = UDim2.new(0, 300, 0, 50)
    Button.Position = UDim2.new(0, 20, 0, yPos)
    Button.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    Button.BorderSizePixel = 0
    Button.Text = ""
    
    Corner.Parent = Button

    Icon.Name = "Icon"
    Icon.Parent = Button
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 10, 0, 10)
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Image = icon

    Label.Name = "Label"
    Label.Parent = Button
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 50, 0, 10)
    Label.Size = UDim2.new(1, -60, 0, 30)
    Label.Font = Enum.Font.Gotham
    Label.TextColor3 = Color3.fromRGB(230, 230, 230)
    Label.TextSize = 16
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Text = label .. " (" .. fileName .. ")"

    Button.MouseButton1Click:Connect(function()
        runGitScript(fileName)
    end)
end

-- Create buttons for each script
createButton("rbxassetid://6034328871", "Duplicate Pets", 20, "duplicate_pets.lua")
createButton("rbxassetid://6035067836", "Pet Spawner", 80, "pet_spawner.lua")
createButton("rbxassetid://6031075938", "Trade Scam", 140, "trade_scam.lua")
