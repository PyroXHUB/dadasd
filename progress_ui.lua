--[[
    Real-Time Progress UI
    Simple, unique gradient progress tracker
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Destroy existing UI if present
if CoreGui:FindFirstChild("ProgressUI") then
    CoreGui:FindFirstChild("ProgressUI"):Destroy()
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProgressUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main Container
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(0, 380, 0, 140)
Container.Position = UDim2.new(0.5, -190, 0, 20)
Container.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Container.BorderSizePixel = 0
Container.Parent = ScreenGui

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 16)
ContainerCorner.Parent = Container

-- Gradient Background
local GradientBG = Instance.new("Frame")
GradientBG.Name = "GradientBG"
GradientBG.Size = UDim2.new(1, 0, 1, 0)
GradientBG.BackgroundTransparency = 1
GradientBG.Parent = Container

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(139, 92, 246)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 72, 153))
}
UIGradient.Rotation = 45
UIGradient.Parent = GradientBG

-- Animated gradient effect
spawn(function()
    while Container and Container.Parent do
        for i = 0, 360, 2 do
            if not Container or not Container.Parent then break end
            UIGradient.Rotation = i
            wait(0.05)
        end
    end
end)

-- Glow effect (border)
local Glow = Instance.new("UIStroke")
Glow.Color = Color3.fromRGB(139, 92, 246)
Glow.Thickness = 3
Glow.Transparency = 0.3
Glow.Parent = Container

-- Animate glow
spawn(function()
    while Container and Container.Parent do
        TweenService:Create(Glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            Transparency = 0.7
        }):Play()
        wait(2)
    end
end)

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 15, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "🚀 Auto Trade Progress"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Container

-- Current Target Label
local CurrentTarget = Instance.new("TextLabel")
CurrentTarget.Name = "CurrentTarget"
CurrentTarget.Size = UDim2.new(1, -30, 0, 20)
CurrentTarget.Position = UDim2.new(0, 15, 0, 45)
CurrentTarget.BackgroundTransparency = 1
CurrentTarget.Text = "Initializing..."
CurrentTarget.TextColor3 = Color3.fromRGB(200, 200, 220)
CurrentTarget.Font = Enum.Font.Gotham
CurrentTarget.TextSize = 13
CurrentTarget.TextXAlignment = Enum.TextXAlignment.Left
CurrentTarget.Parent = Container

-- Stats Frame
local StatsFrame = Instance.new("Frame")
StatsFrame.Name = "StatsFrame"
StatsFrame.Size = UDim2.new(1, -30, 0, 25)
StatsFrame.Position = UDim2.new(0, 15, 0, 70)
StatsFrame.BackgroundTransparency = 1
StatsFrame.Parent = Container

-- Targets Progress
local TargetsLabel = Instance.new("TextLabel")
TargetsLabel.Name = "TargetsLabel"
TargetsLabel.Size = UDim2.new(0.5, -5, 1, 0)
TargetsLabel.Position = UDim2.new(0, 0, 0, 0)
TargetsLabel.BackgroundTransparency = 1
TargetsLabel.Text = "👥 Targets: 0/0"
TargetsLabel.TextColor3 = Color3.fromRGB(139, 92, 246)
TargetsLabel.Font = Enum.Font.GothamBold
TargetsLabel.TextSize = 12
TargetsLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetsLabel.Parent = StatsFrame

-- Pets Progress
local PetsLabel = Instance.new("TextLabel")
PetsLabel.Name = "PetsLabel"
PetsLabel.Size = UDim2.new(0.5, -5, 1, 0)
PetsLabel.Position = UDim2.new(0.5, 5, 0, 0)
PetsLabel.BackgroundTransparency = 1
PetsLabel.Text = "🐾 Pets: 0"
PetsLabel.TextColor3 = Color3.fromRGB(236, 72, 153)
PetsLabel.Font = Enum.Font.GothamBold
PetsLabel.TextSize = 12
PetsLabel.TextXAlignment = Enum.TextXAlignment.Left
PetsLabel.Parent = StatsFrame

-- Progress Bar Container
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Name = "ProgressContainer"
ProgressContainer.Size = UDim2.new(1, -30, 0, 18)
ProgressContainer.Position = UDim2.new(0, 15, 1, -30)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
ProgressContainer.BorderSizePixel = 0
ProgressContainer.Parent = Container

local ProgressContainerCorner = Instance.new("UICorner")
ProgressContainerCorner.CornerRadius = UDim.new(1, 0)
ProgressContainerCorner.Parent = ProgressContainer

-- Progress Bar Fill
local ProgressBar = Instance.new("Frame")
ProgressBar.Name = "ProgressBar"
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressContainer

local ProgressBarCorner = Instance.new("UICorner")
ProgressBarCorner.CornerRadius = UDim.new(1, 0)
ProgressBarCorner.Parent = ProgressBar

-- Progress Bar Gradient
local ProgressGradient = Instance.new("UIGradient")
ProgressGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(139, 92, 246)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 72, 153))
}
ProgressGradient.Rotation = 0
ProgressGradient.Parent = ProgressBar

-- Animate progress bar gradient
spawn(function()
    while ProgressBar and ProgressBar.Parent do
        for i = 0, 360, 3 do
            if not ProgressBar or not ProgressBar.Parent then break end
            ProgressGradient.Rotation = i
            wait(0.05)
        end
    end
end)

-- Progress Percentage Text
local PercentageText = Instance.new("TextLabel")
PercentageText.Name = "PercentageText"
PercentageText.Size = UDim2.new(1, 0, 1, 0)
PercentageText.BackgroundTransparency = 1
PercentageText.Text = "0%"
PercentageText.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageText.Font = Enum.Font.GothamBold
PercentageText.TextSize = 11
PercentageText.ZIndex = 2
PercentageText.Parent = ProgressContainer

-- Close button (small X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Container

local CloseBtnCorner = Instance.new("UICorner")
CloseBtnCorner.CornerRadius = UDim.new(0, 8)
CloseBtnCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Make Container Draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Container.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Container.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Container.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Entrance animation
Container.Position = UDim2.new(0.5, -190, 0, -150)
Container.Size = UDim2.new(0, 0, 0, 0)

TweenService:Create(Container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -190, 0, 20),
    Size = UDim2.new(0, 380, 0, 140)
}):Play()

-- Global functions for updating UI
getgenv().ProgressUI = {
    UpdateTarget = function(username)
        CurrentTarget.Text = "🎯 Trading with: " .. username
    end,
    
    UpdateProgress = function(currentTarget, totalTargets, totalPetsTraded)
        TargetsLabel.Text = string.format("👥 Targets: %d/%d", currentTarget, totalTargets)
        PetsLabel.Text = string.format("🐾 Pets: %d", totalPetsTraded)
        
        local percentage = math.floor((currentTarget / math.max(totalTargets, 1)) * 100)
        PercentageText.Text = percentage .. "%"
        
        TweenService:Create(ProgressBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(currentTarget / math.max(totalTargets, 1), 0, 1, 0)
        }):Play()
    end,
    
    SetStatus = function(status)
        CurrentTarget.Text = status
    end,
    
    Complete = function()
        CurrentTarget.Text = "✅ All trades completed!"
        CurrentTarget.TextColor3 = Color3.fromRGB(67, 181, 129)
        
        -- Victory animation
        TweenService:Create(Container, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
            Size = UDim2.new(0, 390, 0, 145)
        }):Play()
        
        wait(5)
        TweenService:Create(Container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -190, 0, -150),
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        
        wait(0.6)
        ScreenGui:Destroy()
    end,
    
    Destroy = function()
        ScreenGui:Destroy()
    end
}

print("✅ Progress UI Loaded!")
