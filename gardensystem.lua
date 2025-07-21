-- Grow a Garden Cheat GUI by @yourname
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GardenCheatGUI"

-- 🔘 Toggle Button (Left Side)
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 100, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.8, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Text = "Toggle"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true

-- 🌱 Garden Menu (Draggable)
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 200, 0, 120)
menu.Position = UDim2.new(0.5, -100, 0.5, -60)
menu.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
menu.Visible = false
menu.Active = true
menu.Draggable = true

-- 🥚 Egg Shop Button (top)
local eggBtn = Instance.new("TextButton", gui)
eggBtn.Size = UDim2.new(0, 120, 0, 40)
eggBtn.Position = UDim2.new(0.35, 0, 0, 10)
eggBtn.Text = "🥚 Egg Shop"
eggBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
eggBtn.TextColor3 = Color3.new(1, 1, 1)
eggBtn.Font = Enum.Font.GothamBold
eggBtn.TextScaled = true

-- ⚙️ Gear Shop Button (top)
local gearBtn = Instance.new("TextButton", gui)
gearBtn.Size = UDim2.new(0, 120, 0, 40)
gearBtn.Position = UDim2.new(0.52, 0, 0, 10)
gearBtn.Text = "⚙️ Gear Shop"
gearBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
gearBtn.TextColor3 = Color3.new(1, 1, 1)
gearBtn.Font = Enum.Font.GothamBold
gearBtn.TextScaled = true

-- 🌾 Plant Money Button
local plantBtn = Instance.new("TextButton", menu)
plantBtn.Size = UDim2.new(1, 0, 0.5, 0)
plantBtn.Position = UDim2.new(0, 0, 0, 0)
plantBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
plantBtn.Text = "🌱 Plant for $"
plantBtn.TextColor3 = Color3.new(1, 1, 1)
plantBtn.Font = Enum.Font.GothamBold
plantBtn.TextScaled = true

-- 💰 Add Money Fast Button
local moneyBtn = Instance.new("TextButton", menu)
moneyBtn.Size = UDim2.new(1, 0, 0.5, 0)
moneyBtn.Position = UDim2.new(0, 0, 0.5, 0)
moneyBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
moneyBtn.Text = "💸 Add $100"
moneyBtn.TextColor3 = Color3.new(1, 1, 1)
moneyBtn.Font = Enum.Font.GothamBold
moneyBtn.TextScaled = true

-- Toggle GUI
toggleBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- Egg Shop Teleport
eggBtn.MouseButton1Click:Connect(function()
	local part = workspace:FindFirstChild("EggShop")
	if part then player.Character:MoveTo(part.Position) end
end)

-- Gear Shop Teleport
gearBtn.MouseButton1Click:Connect(function()
	local part = workspace:FindFirstChild("GearShop")
	if part then player.Character:MoveTo(part.Position) end
end)

-- Plant & Click Logic
plantBtn.MouseButton1Click:Connect(function()
	if workspace:FindFirstChild("Plant") then return end

	local plant = Instance.new("Part", workspace)
	plant.Size = Vector3.new(1, 1, 1)
	plant.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 1, 0)
	plant.Anchored = true
	plant.Name = "Plant"
	plant.BrickColor = BrickColor.new("Bright green")

	task.wait(1)
	plant.Size = Vector3.new(2, 3, 2)
	plant.Position = plant.Position + Vector3.new(0, 1, 0)
	plant.BrickColor = BrickColor.new("Bright red")

	local click = Instance.new("ClickDetector", plant)
	click.MouseClick:Connect(function()
		local stats = player:FindFirstChild("leaderstats")
		if stats and stats:FindFirstChild("Money") then
			stats.Money.Value += 20
		end
		plant:Destroy()
	end)
end)

-- Add Fake Money Button
moneyBtn.MouseButton1Click:Connect(function()
	local stats = player:FindFirstChild("leaderstats")
	if stats and stats:FindFirstChild("Money") then
		stats.Money.Value += 100
	end
end)-- Grow a Garden System with Toggle + Teleport GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 💵 Leaderstats
local leaderstats = Instance.new("Folder", player)
leaderstats.Name = "leaderstats"
