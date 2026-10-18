-- Money System for Power Lifter Game

local Players = game:GetService("Players")

-- Function to give money to a player
local function giveMoney(player, amount)
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        leaderstats = Instance.new("Folder")
        leaderstats.Name = "leaderstats"
        leaderstats.Parent = player
    
        local money = Instance.new("IntValue")
        money.Name = "Money"
        money.Value = 0
        money.Parent = leaderstats
    end
    
    local money = leaderstats:FindFirstChild("Money")
    if money then
        money.Value = money.Value + amount
    end
end

-- Function to take money from a player
local function takeMoney(player, amount)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Money")
        if money and money.Value >= amount then
            money.Value = money.Value - amount
            return true
        end
    end
    return false
end

-- Function to check player's money
local function checkMoney(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Money")
        if money then
            return money.Value
        end
    end
    return 0
end

-- Example usage:
-- giveMoney(player, 100) -- Gives 100 money to the player
-- takeMoney(player, 50) -- Takes 50 money from the player if available
-- checkMoney(player) -- Returns the player's current money

return {
    giveMoney = giveMoney,
    takeMoney = takeMoney,
    checkMoney = checkMoney
}