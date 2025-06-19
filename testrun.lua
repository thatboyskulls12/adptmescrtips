-- Parent GUI to PlayerGui (not CoreGui) for Delta compatibility
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaGithubLoader"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 240)
frame.Position = UDim2.new(0.5, -170, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

-- Button function
local function createButton(label, yPos, fileURL)
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
        local success, result = pcall(function()
            return loadstring(game:HttpGet(fileURL))()
        end)

        if success then
            print("✅ Executed:", label)
        else
            warn("❌ Error in", label, result)
        end
    end)
end

-- Replace with your real GitHub raw file links
createButton("🐾 Duplicate Pets", 20, "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/duplicate_pets.lua")
createButton("🐶 Pet Spawner", 70, "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/pet_spawner.lua")
createButton("💰 Trade Scam", 120, "https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/trade_scam.lua")
