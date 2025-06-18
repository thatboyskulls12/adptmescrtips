-- Setup
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

-- GitHub base URL
local githubBase = "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/"

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
