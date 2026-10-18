-- Power Lifting Mechanics for Roblox Game

local Players = game:GetService("Players")
local MoneySystem = require(script.Parent.MoneySystem)

-- Function to handle lifting
local function lift(player, weight)
    -- Calculate points based on weight lifted
    local points = weight * 10
    
    -- Give money to the player based on points
    MoneySystem.giveMoney(player, points)
    
    -- Broadcast message about the lift
    game:GetService("ReplicatedStorage"):WaitForChild("LiftEvent"):FireAllClients(player.Name .. " lifted " .. weight .. " kg and earned " .. points .. " money!")
end

-- Example usage:
-- lift(player, 100) -- Player lifts 100 kg and earns 1000 money

return {
    lift = lift
}