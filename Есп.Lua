local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")

-- Имя папки или модели, в которой лежат монеты в MM2
-- Обычно они называются "CoinContainer" или имеют тег "Coin"
local COIN_TAG = "Coin" 

local function addESP(coin)
    if coin:FindFirstChild("ESPTag") then return end
    
    local billboard = Instance.new("BillboardGui", coin)
    billboard.Name = "ESPTag"
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "COIN"
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.BackgroundTransparency = 1
    label.TextScaled = true
end

-- Сканируем рабочую область (Workspace)
RunService.RenderStepped:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем объекты, которые называются или выглядят как монеты
        if v.Name == "Coin" or v.Name == "Coin_Server" then
            addESP(v)
        end
    end
end)
