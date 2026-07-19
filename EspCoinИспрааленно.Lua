local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local MAX_DISTANCE = 150 -- Увеличим радиус видимости
local OFFSET_STEP = 0.5 -- Смещение, чтобы метки не слипались

local function addESP(coin)
    -- Проверка: если монета уже не в игре или невидима, удаляем метку
    if not coin:IsDescendantOf(workspace) or coin.Transparency == 1 then
        local tag = coin:FindFirstChild("ESPTag")
        if tag then tag:Destroy() end
        return
    end

    if coin:FindFirstChild("ESPTag") then return end
    
    local billboard = Instance.new("BillboardGui", coin)
    billboard.Name = "ESPTag"
    billboard.Size = UDim2.new(0, 60, 0, 30)
    -- Делаем небольшое случайное смещение, чтобы не сливались
    billboard.StudsOffset = Vector3.new(math.random(-1,1), 2, math.random(-1,1))
    billboard.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "COIN"
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.TextStrokeTransparency = 0 
end

RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart

    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == "Coin" or v.Name == "Coin_Server" then
            -- Проверяем: если монета собрана или далеко — удаляем тег
            local dist = (hrp.Position - v.Position).Magnitude
            if dist > MAX_DISTANCE or not v:IsDescendantOf(workspace) or v.Transparency == 1 then
                local tag = v:FindFirstChild("ESPTag")
                if tag then tag:Destroy() end
            else
                addESP(v)
            end
        end
    end
end)
