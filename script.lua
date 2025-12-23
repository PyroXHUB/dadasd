--[[
    Multi-Target Auto Trade System
    Supports multiple targets with individual pet quantities
    Author: Your Name
    Version: 1.0.0
]]

-- Services
repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name

-- Modules
local Data = require(ReplicatedStorage.ClientModules.Core.ClientData)

-- Configuration (loaded from main script)
local config = getgenv().Config
if not config then
    error("Configuration not found! Please load the config first.")
end

-- Variables
local currentTargetIndex = 1
local pets_unique_ids = {}
local trade_status = false
local completedTrades = {}

print("===========================================")
print("  Multi-Target Auto Trade System v1.0.0")
print("===========================================")

-- Dehash function
local function dehash()
    local function rename(remotename, hashedremote)
        hashedremote.Name = remotename
    end
    local success, err = pcall(function()
        table.foreach(
            getupvalue(require(ReplicatedStorage.ClientModules.Core.RouterClient.RouterClient).init, 7),
            rename
        )
    end)
    if success then
        print("✓ Dehashed remotes successfully")
    else
        warn("✗ Dehash failed:", err)
    end
end
dehash()

-- Webhook function
local function sendWebhook(username, petCount, status)
    if not config.Webhook or config.Webhook == "" then return end
    
    local statusColor = status == "Success" and 65280 or (status:match("Failed") and 16711680 or 16776960)
    
    local embed = {
        ["embeds"] = {{
            ["title"] = "🔄 Auto Trade Log",
            ["description"] = string.format("**Target:** `%s`\n**Pets Traded:** `%d`\n**Status:** `%s`", username, petCount, status),
            ["color"] = statusColor,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S"),
            ["footer"] = {
                ["text"] = string.format("Executor: %s", playerName)
            }
        }}
    }
    
    local success, err = pcall(function()
        local response = request({
            Url = config.Webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(embed)
        })
    end)
    
    if not success then
        warn("Webhook error:", err)
    end
end

-- Trade API functions
local function first_trade_accept()
    ReplicatedStorage:WaitForChild("API"):WaitForChild("TradeAPI/AcceptNegotiation"):FireServer()
end

local function confirm_trade()
    ReplicatedStorage:WaitForChild("API"):WaitForChild("TradeAPI/ConfirmTrade"):FireServer()
end

local function send_trade(username)
    local target = Players:FindFirstChild(username)
    if not target then
        warn(string.format("Player %s not found in server!", username))
        return false
    end
    
    local args = {[1] = target}
    ReplicatedStorage:WaitForChild("API"):WaitForChild("TradeAPI/SendTradeRequest"):FireServer(unpack(args))
    return true
end

local function add_items_in_trade(unique)
    local args = {[1] = unique}
    ReplicatedStorage:WaitForChild("API"):WaitForChild("TradeAPI/AddItemToOffer"):FireServer(unpack(args))
end

-- Get pet unique IDs based on config
local function get_pet_uniques(maxPets)
    local foundPets = {}
    local playerData = Data.get_data()[playerName]
    
    if not playerData or not playerData.inventory or not playerData.inventory.pets then
        warn("No pet data found in inventory")
        return foundPets
    end
    
    for i, v in pairs(playerData.inventory.pets) do
        for _, petKind in pairs(config.pets_to_trade) do
            if v.kind == petKind then
                -- Check if neon filter is enabled
                if not config.Neon or (config.Neon and v.neon) then
                    table.insert(foundPets, v.unique)
                    
                    if #foundPets >= maxPets then
                        return foundPets
                    end
                end
            end
        end
    end
    
    return foundPets
end

-- Main auto trade function
local function autotrade(username, petCount)
    local tradeGui = LocalPlayer.PlayerGui:WaitForChild("TradeApp").Frame
    
    -- Phase 1: Send trade request
    if #pets_unique_ids > 0 and not tradeGui.Visible then
        trade_status = false
        local success = send_trade(username)
        if not success then
            return false
        end
        print(string.format("📤 Trade request sent to %s", username))
        task.wait(2)
    
    -- Phase 2: Add items to trade
    elseif not trade_status and tradeGui.Visible then
        local counter = 0
        local maxSlots = math.min(#pets_unique_ids, 18) -- Max 18 pets per trade
        
        print(string.format("Adding %d pets to trade...", maxSlots))
        
        while #pets_unique_ids > 0 and counter < maxSlots do
            local petUnique = table.remove(pets_unique_ids, 1)
            add_items_in_trade(petUnique)
            counter = counter + 1
            task.wait(0.5)
        end
        
        print(string.format("✓ Added %d pets | Remaining: %d", counter, #pets_unique_ids))
        trade_status = true
        task.wait(1)
    
    -- Phase 3: Accept and confirm trade
    elseif trade_status and tradeGui.Visible then
        task.wait(1)
        first_trade_accept()
        print("✓ Trade accepted")
        task.wait(1.5)
        confirm_trade()
        print("✓ Trade confirmed")
        
        -- Wait for trade to close
        local timeout = 0
        repeat
            task.wait(0.5)
            timeout = timeout + 0.5
        until not tradeGui.Visible or timeout > 10
        
        if timeout > 10 then
            warn("Trade timeout - moving to next")
            return false
        end
        
        task.wait(2)
        trade_status = false
    end
    
    return true
end

-- Main execution loop
print(string.format("\n📋 Configuration Loaded:"))
print(string.format("   • Targets: %d", #config.usernames))
print(string.format("   • Pet Type: %s", table.concat(config.pets_to_trade, ", ")))
print(string.format("   • Neon Only: %s", config.Neon and "Yes" or "No"))
print(string.format("   • Webhook: %s\n", config.Webhook ~= "" and "Enabled" or "Disabled"))

for index, username in ipairs(config.usernames) do
    local targetPetCount = tonumber(config.How_many_Pets[index]) or 0
    
    if targetPetCount <= 0 then
        warn(string.format("⚠️  Skipping %s: Invalid pet count", username))
        continue
    end
    
    print(string.format("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"))
    print(string.format("📊 Target [%d/%d]: %s", index, #config.usernames, username))
    print(string.format("📦 Required Pets: %d", targetPetCount))
    print(string.format("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"))
    
    -- Check if player is in server
    if not Players:FindFirstChild(username) then
        warn(string.format("❌ %s is not in the server!", username))
        sendWebhook(username, 0, "Failed - Not In Server")
        continue
    end
    
    -- Get pets for this target
    pets_unique_ids = get_pet_uniques(targetPetCount)
    
    if #pets_unique_ids == 0 then
        warn(string.format("❌ No pets found for %s!", username))
        sendWebhook(username, 0, "Failed - No Pets Found")
        continue
    end
    
    print(string.format("✓ Found %d pets", #pets_unique_ids))
    
    -- Execute trades (may take multiple trades if more than 18 pets)
    local totalTraded = #pets_unique_ids
    local tradesNeeded = math.ceil(#pets_unique_ids / 18)
    
    print(string.format("🔄 Executing %d trade(s)...\n", tradesNeeded))
    
    for tradeNum = 1, tradesNeeded do
        print(string.format("Trade %d/%d:", tradeNum, tradesNeeded))
        
        local attempts = 0
        local maxAttempts = 50
        
        repeat
            local success = autotrade(username, targetPetCount)
            if not success and attempts > 10 then
                warn("Trade failed after multiple attempts")
                break
            end
            task.wait(1)
            attempts = attempts + 1
        until #pets_unique_ids == 0 or not Players:FindFirstChild(username) or attempts >= maxAttempts
        
        -- Check if player left
        if not Players:FindFirstChild(username) then
            warn(string.format("⚠️  %s left the game!", username))
            sendWebhook(username, totalTraded - #pets_unique_ids, "Incomplete - Player Left")
            break
        end
        
        if attempts >= maxAttempts then
            warn("Max attempts reached")
            sendWebhook(username, totalTraded - #pets_unique_ids, "Failed - Max Attempts")
            break
        end
        
        task.wait(3) -- Cooldown between trades
    end
    
    -- Log completion
    if #pets_unique_ids == 0 then
        print(string.format("\n✅ Successfully traded %d pets with %s", totalTraded, username))
        sendWebhook(username, totalTraded, "Success")
        table.insert(completedTrades, username)
    end
    
    task.wait(5) -- Cooldown before next target
end

print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🎉 All Trades Completed!")
print(string.format("✓ Success: %d/%d targets", #completedTrades, #config.usernames))
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

-- Final webhook summary
if config.Webhook ~= "" then
    sendWebhook("All Trades", 0, string.format("Completed %d/%d trades", #completedTrades, #config.usernames))
end
