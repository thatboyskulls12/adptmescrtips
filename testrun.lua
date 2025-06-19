local Players = game:GetService("Players")
local player = Players.LocalPlayer
repeat task.wait() until player:FindFirstChild("PlayerGui")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
Instance.new("UICorner", frame)

local function createButton(name, y, func)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 260, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, y)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
	Instance.new("UICorner", btn)

	btn.MouseButton1Click:Connect(function()
		task.spawn(function()
			local ok, err = pcall(func)
			if not ok then warn("Failed to run:", err) end
		end)
	end)
end

-- Button Actions
createButton("🐾 Duplicate Pets", 20, function()
	getgenv().RunDuplicatePets()
end)

createButton("🐶 Pet Spawner", 80, function()
	getgenv().RunPetSpawner()
end)

createButton("💰 Trade Scam", 140, function()
	getgenv().RunTradeScam()
end)
