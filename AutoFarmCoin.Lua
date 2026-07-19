local RunService = game:GetService("RunService")

local function addHighlight(coin)
    if coin:FindFirstChild("CoinHighlight") then return end
    
    local highlight = Instance.new("Highlight", coin)
    highlight.Name = "CoinHighlight"
    highlight.FillColor = Color3.fromRGB(0, 150, 255) -- Синий цвет внутри
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белая обводка
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 0
end

RunService.RenderStepped:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем сами объекты монеток
        if v.Name == "Coin" or v.Name == "Coin_Server" then
            addHighlight(v)
        end
    end
end)
