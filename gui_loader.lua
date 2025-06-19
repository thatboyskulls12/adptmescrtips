-- SKULLShub Loading Screen with Progress Bar (30 sec)

-- Remove old screen if exists
if game.CoreGui:FindFirstChild("TsunHubLoadingScreen") then
    game.CoreGui.TsunHubLoadingScreen:Destroy()
end

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "skullsHubLoadingScreen"
ScreenGui.Parent = game.CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Fullscreen black background
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.Parent = ScreenGui
[11:51 AM]tsun: -- Top middle message
local TopText = Instance.new("TextLabel")
TopText.AnchorPoint = Vector2.new(0.5, 0)
TopText.Position = UDim2.new(0.5, 0, 0.05, 0)
TopText.Size = UDim2.new(0.8, 0, 0, 50)
TopText.BackgroundTransparency = 1
TopText.Text = "Subscribe to TsunHub for more scripts"
TopText.TextColor3 = Color3.fromRGB(255, 255, 255)
TopText.TextScaled = true
TopText.Font = Enum.Font.GothamBold
TopText.Parent = Background

-- Progress bar background
local ProgressBarBackground = Instance.new("Frame")
ProgressBarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
ProgressBarBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
ProgressBarBackground.Size = UDim2.new(0.6, 0, 0, 30)
ProgressBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBarBackground.Parent = Background

local PBB_Corner = Instance.new("UICorner")
PBB_Corner.CornerRadius = UDim.new(0, 15)
PBB_Corner.Parent = ProgressBarBackground

-- Progress bar fill
local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Position = UDim2.new(0, 0, 0, 0)
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ProgressBarFill.Parent = ProgressBarBackground
[11:51 AM]tsun: local PBF_Corner = Instance.new("UICorner")
PBF_Corner.CornerRadius = UDim.new(0, 15)
PBF_Corner.Parent = ProgressBarFill

-- Percentage label in middle
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
PercentageLabel.Position = UDim2.new(0.5, 0, 0.6, 40)
PercentageLabel.Size = UDim2.new(0.3, 0, 0, 50)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.TextScaled = true
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.Parent = Background

-- Animate progress over 30 seconds
local duration = 30
local elapsed = 0
local RunService = game:GetService("RunService")

local connection
connection = RunService.RenderStepped:Connect(function(deltaTime)
    elapsed = math.min(elapsed + deltaTime, duration)
    local progress = elapsed / duration
    ProgressBarFill.Size = UDim2.new(progress, 0, 1, 0)
    PercentageLabel.Text = string.format("%d%%", math.floor(progress * 100))
    if elapsed >= duration then
        connection:Disconnect()
        ScreenGui:Destroy()
    end
end)
