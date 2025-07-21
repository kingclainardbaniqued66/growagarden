-- Grow a Garden System with Toggle + Teleport GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 💵 Leaderstats
local leaderstats = Instance.new("Folder", player)
leaderstats.Name = "leaderstats"
local money = Instance.new("IntValue", leaderstats)
money.Name = "Money"
money.Value = 0

-- 📍 Garden Plot
local plot = Instance.new("Part", workspace)
plot.Size = Vector3.new(4, 1, 4)
plot.Position = Vector3.new(0, 1, 0)
plot.Anchored = true
plot.BrickColor = BrickColor.new("Earth green")
plot.Name = "GardenPlot"

-- 🧰 GUI
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "GardenUI"
gui.ResetOnSpawn = false

-- 🧲 Toggle Button (left corner)
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 140, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.85, 0)
toggleBtn.Text = "Toggle Garden"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true

-- 🪴 Garden Menu (draggable)
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 180, 0, 60)
menu.Position = UDim2.new(0.5, -90, 0.6, 0)
menu.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
menu.Visible = false
menu.Active = true
menu.Draggable = true

local plantBtn = Instance.new("TextButton", menu)
plantBtn.Size = UDim2.new(1, 0, 1, 0)
plantBtn.Text = "🌱 Plant Seed"
plantBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
plantBtn.TextColor3 = Color3.new(1, 1, 1)
plantBtn.Font = Enum.Font.GothamBold
plantBtn.TextScaled = true

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

-- 📍 Teleport Logic (requires parts named EggShop and GearShop)
eggBtn.MouseButton1Click:Connect(function()
	local part = workspace:FindFirstChild("EggShop")
	if part then player.Character:MoveTo(part.Position) end
end)

gearBtn.MouseButton1Click:Connect(function()
	local part = workspace:FindFirstChild("GearShop")
	if part then player.Character:MoveTo(part.Position) end
end)

-- 🪄 Toggle Menu
toggleBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- 🌱 Planting Logic
plantBtn.MouseButton1Click:Connect(function()
	if workspace:FindFirstChild("Plant") then return end

	local plant = Instance.new("Part", workspace)
	plant.Size = Vector3.new(1, 1, 1)
	plant.Position = plot.Position + Vector3.new(0, 1, 0)
	plant.Anchored = true
	plant.Name = "Plant"
	plant.BrickColor = BrickColor.new("Bright green")

	task.wait(5)
	plant.Size = Vector3.new(2, 3, 2)
	plant.Position = plot.Position + Vector3.new(0, 1.5, 0)
	plant.BrickColor = BrickColor.new("Bright red")

	local click = Instance.new("ClickDetector", plant)
	click.MouseClick:Connect(function()
		money.Value += 20
		plant:Destroy()
	end)
end)
