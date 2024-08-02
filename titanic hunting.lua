local ScreenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local mainUICorner = Instance.new("UICorner")
local titleLabel = Instance.new("TextLabel")
local textBox = Instance.new("TextBox") -- Replaced dropdown with textBox
local startButton = Instance.new("TextButton")
local startButtonUICorner = Instance.new("UICorner")
local liveLogFrame = Instance.new("Frame")
local liveLogUICorner = Instance.new("UICorner")
local liveLogTitle = Instance.new("TextLabel")
local liveLog = Instance.new("ScrollingFrame")
local liveLogLayout = Instance.new("UIListLayout")
local logo = Instance.new("ImageButton")

-- Adding the ScreenGui to CoreGui
ScreenGui.Parent = game.CoreGui

-- Main frame settings
mainFrame.Name = "MainFrame"
mainFrame.Parent = ScreenGui
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.Size = UDim2.new(0, 300, 0, 400) -- Smaller size for mobile
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200) -- Centered
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BorderSizePixel = 0

mainUICorner.Parent = mainFrame
mainUICorner.CornerRadius = UDim.new(0, 20)

-- Title label settings
titleLabel.Name = "TitleLabel"
titleLabel.Parent = mainFrame
titleLabel.Text = "IceIgnite❄️🔥"
titleLabel.Size = UDim2.new(1, 0, 0, 50) -- Adjusted size
titleLabel.Font = Enum.Font.Cartoon
titleLabel.TextSize = 24 -- Adjusted text size
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1

-- TextBox settings
textBox.Name = "TextBox"
textBox.Parent = mainFrame
textBox.PlaceholderText = "Huge/Enchant Name"
textBox.Size = UDim2.new(1, 0, 0, 50) -- Adjusted size
textBox.Position = UDim2.new(0, 0, 0, 50) -- Adjusted position
textBox.Font = Enum.Font.Cartoon
textBox.TextSize = 24 -- Adjusted text size
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textBox.BorderSizePixel = 0

local textBoxUICorner = Instance.new("UICorner")
textBoxUICorner.Parent = textBox
textBoxUICorner.CornerRadius = UDim.new(0, 20)

-- Start button settings
startButton.Name = "StartButton"
startButton.Parent = mainFrame
startButton.Text = "Start Duping"
startButton.Size = UDim2.new(1, 0, 0, 50) -- Adjusted size
startButton.Position = UDim2.new(0, 0, 0, 150) -- Adjusted position
startButton.Font = Enum.Font.Cartoon
startButton.TextSize = 24 -- Adjusted text size
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.BackgroundColor3 = Color3.new(0, 0, 1)
startButton.BorderSizePixel = 0

startButtonUICorner.Parent = startButton
startButtonUICorner.CornerRadius = UDim.new(0, 20)

local function startDupingFunction()
    print("Start Duping function executed")
    -- Add your custom code here
end

startButton.MouseButton1Click:Connect(function()
    startDupingFunction()
end)

-- Live log settings
liveLogFrame.Name = "LiveLogFrame"
liveLogFrame.Parent = mainFrame
liveLogFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
liveLogFrame.Size = UDim2.new(1, 0, 1, -250) -- Adjusted size
liveLogFrame.Position = UDim2.new(0, 0, 0, 200) -- Adjusted position
liveLogFrame.BorderSizePixel = 0

liveLogUICorner.Parent = liveLogFrame
liveLogUICorner.CornerRadius = UDim.new(0, 20)

liveLogTitle.Name = "LiveLogTitle"
liveLogTitle.Parent = liveLogFrame
liveLogTitle.Text = "Live Log"
liveLogTitle.Size = UDim2.new(1, 0, 0, 50) -- Adjusted size
liveLogTitle.Font = Enum.Font.Cartoon
liveLogTitle.TextSize = 24 -- Adjusted text size
liveLogTitle.TextColor3 = Color3.new(0, 1, 0)
liveLogTitle.BackgroundTransparency = 1

liveLog.Name = "LiveLog"
liveLog.Parent = liveLogFrame
liveLog.Size = UDim2.new(1, 0, 1, -50) -- Adjusted size
liveLog.Position = UDim2.new(0, 0, 0, 50) -- Adjusted position
liveLog.BackgroundTransparency = 0.1
liveLog.CanvasSize = UDim2.new(0, 0, 5, 0)
liveLog.ScrollBarThickness = 10
liveLog.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
liveLog.BorderSizePixel = 0

liveLogLayout.Parent = liveLog
liveLogLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Adding the logo to the UI
logo.Name = "Logo"
logo.Parent = ScreenGui
logo.Size = UDim2.new(0, 50, 0, 50) -- Adjusted size
logo.Position = UDim2.new(0, 10, 0, 10) -- Adjusted position
logo.Image = "rbxassetid://18751444844"
logo.BackgroundTransparency = 1

-- Make the logo rounded
local logoUICorner = Instance.new("UICorner")
logoUICorner.Parent = logo
logoUICorner.CornerRadius = UDim.new(0, 25)

-- Function to hide/show UI when logo is clicked
local uiVisible = true
logo.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    mainFrame.Visible = uiVisible
end)

-- Loading screen (logo animation)
local loadingScreen = Instance.new("Frame")
loadingScreen.Name = "LoadingScreen"
loadingScreen.Parent = ScreenGui
loadingScreen.BackgroundColor3 = Color3.new(0, 0, 0)
loadingScreen.BackgroundTransparency = 0.7
loadingScreen.Size = UDim2.new(1, 0, 1, 0)

local loadingLogo = Instance.new("ImageLabel")
loadingLogo.Parent = loadingScreen
loadingLogo.Image = "rbxassetid://18751444844"
loadingLogo.Size = UDim2.new(0, 200, 0, 200) -- Adjusted size
loadingLogo.Position = UDim2.new(0.5, -100, 0.5, -100) -- Centered
loadingLogo.BackgroundTransparency = 1

wait(2)
loadingScreen:Destroy()

-- Fake live log
local usernames = {"PixelVortex89", "GalacticNova23", "EpicGamerX7", "NeonShadow27", "TurboBlaze12", "StarryKnight77", "QuantumEcho45", "MysticDruid56", "ThunderPulse91", "FrostyPhoenix34", "UrbanWarrior68", "CosmicBlaze44", "AeroChaser11", "CrystalStorm99", "VortexNinja33", "BlazeStrike22", "LunarSpecter88", "RetroGamerX5", "FierceDragon47", "SonicRider30", "ThunderBolt76", "MysticWave29", "GalacticBlaze91", "ShadowHunter45", "TurboAce66", "DarkPhoenix27", "CyberVortex53", "NeonRider80", "QuantumStorm12", "StarGamer77", "FrostedNinja34", "EchoBlaze19", "LunarKnight45", "RadiantDragon52", "PixelKnight88", "GalacticVortex29", "ThunderBolt77", "ShadowRider44", "TurboBlaze11", "MysticKnight33", "CosmicStorm99", "NeonPhoenix22", "RetroSpecter58", "FierceBlaze17", "ShadowGamer30", "QuantumEcho91", "FrostedStorm27", "GalacticAce43", "BlazeRider12", "CrystalVortex67"}
local huges = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"}
local enchants = {"Boss Chest Mimic", "Chest Mimic", "Boss Lucky Block"}

local function logMessage(username, huge, enchant)
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, 0, 0, 30) -- Adjusted size
    message.Font = Enum.Font.Cartoon
    message.TextSize = 13 -- Adjusted text size
    message.TextColor3 = Color3.new(1, 1, 1)
    message.BackgroundTransparency = 1

    -- Randomly choose between huges and enchants
    if math.random(2) == 1 then
        message.Text = username .. " duped " .. huge .. " Huge Pets!"
    else
        message.Text = username .. " duped " .. enchant .. " Enchant!"
    end

    message.Parent = liveLog
end

while true do
    logMessage(usernames[math.random(#usernames)], huges[math.random(#huges)], enchants[math.random(#enchants)])
    wait(2)
end
