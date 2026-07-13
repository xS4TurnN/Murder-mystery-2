-- MM2 Красивое Меню By WgRo
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESPAll = false
local ESPGun = false
local ShotMurderer = false
local CrosshairEnabled = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2WgRoMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 230, 0, 290)
MainFrame.Position = UDim2.new(0.5, -115, 0.35, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

-- Заголовок + By WgRo
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "MM2 MENU"
Title.TextColor3 = Color3.fromRGB(0, 255, 180)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(0.4, 0, 1, 0)
Credit.Position = UDim2.new(0.55, 0, 0, 0)
Credit.BackgroundTransparency = 1
Credit.Text = "By WgRo"
Credit.TextColor3 = Color3.fromRGB(120, 220, 255)
Credit.Font = Enum.Font.GothamSemibold
Credit.TextSize = 16
Credit.TextXAlignment = Enum.TextXAlignment.Right
Credit.Parent = TitleBar

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Position = UDim2.new(1, -38, 0, 6)
CloseButton.BackgroundColor3 = Color3.fromRGB(230, 50, 50)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

-- Кнопка "By WgRo" для открытия (появляется после закрытия)
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 140, 0, 40)
OpenButton.Position = UDim2.new(0.5, -70, 0, 10)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 180, 140)
OpenButton.BackgroundTransparency = 0.2
OpenButton.Text = "By WgRo"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextSize = 18
OpenButton.Visible = false
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 10)
OpenCorner.Parent = OpenButton

-- Контейнер кнопок
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -20, 1, -70)
ButtonContainer.Position = UDim2.new(0, 10, 0, 55)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ButtonContainer

local function createStyledButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.BackgroundTransparency = 0.35
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = ButtonContainer
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Кнопки
createStyledButton("ESP All: OFF", function(self)
    ESPAll = not ESPAll
    self.Text = "ESP All: " .. (ESPAll and "ON ✅" or "OFF")
end)

createStyledButton("ESP Gun: OFF", function(self)
    ESPGun = not ESPGun
    self.Text = "ESP Gun: " .. (ESPGun and "ON ✅" or "OFF")
end)

createStyledButton("Shot Murderer: OFF", function(self)
    ShotMurderer = not ShotMurderer
    self.Text = "Shot Murderer: " .. (ShotMurderer and "ON ✅" or "OFF")
end)

createStyledButton("Crosshair: OFF", function(self)
    CrosshairEnabled = not CrosshairEnabled
    self.Text = "Crosshair: " .. (CrosshairEnabled and "ON ✅" or "OFF")
end)

-- Логика открытия/закрытия
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

-- ==================== ЛОГИКА ESP, SHOT И CROSSHAIR ====================
local ESPObjects = {}
local GunESPObjects = {}
local ShotButton = nil

-- (Остальной код с ESP, ShotButton и Crosshair остаётся таким же как в предыдущей версии)

function createShotButton()
    if ShotButton then return end
    -- ... (тот же код создания большой кнопки Shot Murderer)
end

-- Запуск RenderStepped для ESP и Crosshair (вставь сюда предыдущую логику updateESP, updateGunESP и crosshair)

print("✅ Меню By WgRo загружено!")
print("Нажми By WgRo сверху, чтобы открыть меню")
