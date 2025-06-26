local ESP = {}

local currentColor = Color3.fromRGB(0, 255, 0)
local currentTransparency = 0.3
local enabled = false

local function createAdornment(part)
    if not part:FindFirstChild("BoxHandleAdornment") then
        local adornment = Instance.new("BoxHandleAdornment")
        adornment.Name = "BoxHandleAdornment"
        adornment.Adornee = part
        adornment.AlwaysOnTop = true
        adornment.ZIndex = 1
        adornment.Size = part.Size
        adornment.Color3 = currentColor
        adornment.Transparency = currentTransparency
        adornment.Parent = part
    end
end

local function updateAllAdornments()
    local targets = {}

    for _, v in pairs(game:GetService("ReplicatedStorage"):FindFirstChild("Player"):GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            table.insert(targets, v)
        end
    end

    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:FindFirstChild("Head") then
            for _, part in pairs(v:GetChildren()) do
                if part:IsA("Part") or part:IsA("MeshPart") then
                    table.insert(targets, part)
                end
            end
        end
    end

    for _, part in pairs(targets) do
        if enabled then
            createAdornment(part)
            if part:FindFirstChild("BoxHandleAdornment") then
                part.BoxHandleAdornment.Color3 = currentColor
                part.BoxHandleAdornment.Transparency = currentTransparency
            end
        else
            if part:FindFirstChild("BoxHandleAdornment") then
                part.BoxHandleAdornment.Transparency = 1
            end
        end
    end
end

function ESP:SetEnabled(state)
    enabled = state
    updateAllAdornments()
end

function ESP:Update(color, transparency)
    currentColor = color
    currentTransparency = transparency
    if enabled then
        updateAllAdornments()
    end
end

return ESP
