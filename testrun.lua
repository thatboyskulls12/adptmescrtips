-- Delta-safe GUI with working buttons
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaFinalButtonGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 300)
frame.Position = UDim2.new(0.5, -170, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

-- Show popup
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

-- Button creator
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
		local success, result = pcall(callback)
		if success then
			showMessage("✅ " .. label .. " ran!")
		else
			showMessage("❌ Failed: " .. result)
		end
	end)
end

-- Actual script actions (fake demos you can replace)
local function duplicatePets()
	print("🐾 Simulating pet duplication")
	-- Insert real logic here
end

local function spawnPet()
	print("🐶 Simulating pet spawn")
	-- Insert real logic here
end

local function scamTrade()
	print("💰 Simulating fake trade offer")
	-- Insert real logic here
end

-- Create the buttons
createButton("🐾 Duplicate Pets", 20, duplicatePets)
createButton("🐶 Pet Spawner", 80, spawnPet)
createButton("💰 Trade Scam", 140, scamTrade)
