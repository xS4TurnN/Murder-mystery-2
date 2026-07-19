local RunService = game:GetService("RunService")

local function addESP(coin)
    -- Проверяем, есть ли уже метка, чтобы не плодить их
    if coin:FindFirstChild("ESPTag") then return end
    
    local billboard = Instance.new("BillboardGui", coin)
    billboard.Name = "ESPTag"
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "COIN"
    label.TextColor3 = Color3.fromRGB(255, 255, 0) -- Желтый, как был
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.TextStrokeTransparency = 0 -- Добавили обводку для читаемости
end

RunService.RenderStepped:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем именно монетки
        if v.Name == "Coin" or v.Name == "Coin_Server" then
            addESP(v)
        end
    end
end)
