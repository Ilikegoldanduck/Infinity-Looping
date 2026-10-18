local numbers = {}

--alpha beta gamma delta epsilon zeta eta theta iota kappa iambda mu nu xi omicron pi rho sigma tau upsilon phi chi psi omega
local numberValues = {10}
local additiveMultipliers = {}
local multiplicativeMultipliers = {}
local additives = {}

local deltaCdMulti = 0
local deltaCd = 5
local deltaOnCd = 0

local upgradeTreeUnlocks = {
    { -- Alpha Upgrades
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            true
        },
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 3}, --Upgrade Amounts; -1 = inf
            false
        }
    },
    { -- Beta Upgrades
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            true
        },
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 3}, --Upgrade Amounts; -1 = inf
            false
        }
    },
    { -- Gamma Upgrades
        {    
            {0, -1}, --Upgrade Amounts; -1 = inf
            true
        },
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 3}, --Upgrade Amounts; -1 = inf
            false
        }
    },
    { -- Delta Upgrades
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            true
        },
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 3}, --Upgrade Amounts; -1 = inf
            false
        }
    },
    { -- Epsilon Upgrades : None
    },
    { -- Zeta Upgrades
    }
}

local upgradeTreeInfo = {
    { -- Alpha Upgrades
        { --Upgrade 1
            {
                {
                    10, --Starting cost 
                    {
                        {"A", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    1 -- Value
                }
            }, --Costs
            {{1}}, --Increasors
            {2, 3} --Unlocks
        },
        { --Upgrade 2
            {
                {
                    10, --Starting cost 
                    {
                        {"M", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    1 -- Value
                }
            }, --Costs
            {{0, .5}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 3
            {
                {
                    10, --Starting cost 
                    {
                        {"M", 10}, {"A", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    1 -- Value
                }
            }, --Costs
            {{0, 0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Beta Upgrades
        { --Upgrade 1
            {
                {
                    1, --Starting cost 
                    {
                        {"A", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    2
                }    
            }, --Costs
            {{0, 1}}, --Increasors
            {2, 3} --Unlocks
        },
        { --Upgrade 2
            {
                {
                    1, --Starting cost 
                    {
                        {"M", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    2
                }
            }, --Costs
            {{}, {1}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 3
            {
                {
                    100, --Starting cost 
                    {
                        {"M", 10}, {"A", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    2
                }
            }, --Costs
            {{}, {}, {0, 10}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Gamma Upgrades
        { --Upgrade 1
            {
                {
                        1, --Starting cost 
                        {
                            {"A", 10}
                        }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                        3    
                }
            }, --Costs
            {{}, {}, {1}}, --Increasors
            {2, 3} --Unlocks
        },
        { --Upgrade 2
            {
                {
                    1, --Starting cost 
                    {
                        {"M", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    3
                }
            }, --Costs
            {{}, {1}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 3
            {
                {
                    100, --Starting cost 
                    {
                        {"M", 10}, {"A", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    3
                }
            }, --Costs
            {{0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Delta Upgrades
        { --Upgrade 1
            {
                {
                    1, --Starting cost 
                    {
                        {"A", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    4
                }
            }, --Costs
            {{0, 1}}, --Increasors
            {2, 3} --Unlocks
        },
        { --Upgrade 2
            {
                {
                    1, --Starting cost 
                    {
                        {"M", 10}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    4
                }
            }, --Costs
            {{}, {1}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 3
            {
                {
                    100, --Starting cost 
                    {
                        {"M", 10}, {"A", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    4
                }
            }, --Costs
            {{0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Epsilon Upgrades : None
    },
    { -- Zeta Upgrades
    }
}

local function calculateExtra(time)
    if (numberValues[2] or 0) > 0 then
        numberValues[3] = (numberValues[3] or 0) + ((((1 + (multiplicativeMultipliers[3] or 0)) * (1 + (additiveMultipliers[3] or 0))) * (1 + (additives[3] or 0))) * (os.time() - time))
    end
    if (numberValues[4] or 0) > 0 then
        numberValues[5] = numberValues[5] + (os.time() - time)
    end
end

function numbers.loadFile()
    local path = sys.get_save_file("test1", "savefile")

    local err, save = pcall(sys.load, path)
    numberValues = save.values or numberValues
    calculateExtra(save.time or os.time())
    additives = save.additives or {}
    additiveMultipliers = save.additiveMultipliers or {}
    multiplicativeMultipliers = save.multiplicativeMultipliers or {}
    for tree, treeNode in ipairs(save.upgrades or {}) do
        for i, v in ipairs(treeNode) do
            upgradeTreeUnlocks[tree][i][1][1] = v[1][1]
            upgradeTreeUnlocks[tree][i][2] = v[2]
        end
    end
    numberValues[2] = 99999
    numberValues[4] = 99999
    numberValues[5] = 99999
end

function numbers.resetFile()
    local path = sys.get_save_file("test1", "savefile")

    sys.save(path, {})
    msg.post("@system:", "exit", {code = 0})
end

function numbers.saveFile()
    local path = sys.get_save_file("test1", "savefile")

    sys.save(path, {values = numberValues, time = os.time(), upgrades = upgradeTreeUnlocks, additives = additives, additiveMultipliers = additiveMultipliers, multiplicativeMultipliers = multiplicativeMultipliers})
end

function numbers.getMulti(num)
    if num == 1 then
        return ((1 + (multiplicativeMultipliers[1] or 0)) * (1 + (numberValues[5] or 0) + (additiveMultipliers[1] or 0)) * (1 + (additives[1] or 0)) * (1 + math.log((numberValues[2] or 1), 10)))
    elseif num == 2 then
        return (((1 + (multiplicativeMultipliers[2] or 0)) * (1 + (additiveMultipliers[2] or 0))) * math.log(math.pow(numberValues[1], 2), 10) - 5) + (additives[2] or 0)
    elseif num == 3 then
        return (((1 + (multiplicativeMultipliers[3] or 0)) * (1 + (numberValues[5] or 0) + (additiveMultipliers[3] or 0))) * (1 + (additives[3] or 0)))
    elseif num == 4 then
        return (((1 + (multiplicativeMultipliers[4] or 0)) * (1 + (additiveMultipliers[4] or 0))) * (1 + (additives[4] or 0)))
    elseif num == 5 then
        return 1
    elseif num == 6 then
        return (numberValues[2] or 0) * (2 - math.pow(2, - (numberValues[5] or 0))) * (1 + math.log((numberValues[4] or 0) + 1, 10))
    end
end

function numbers.getValues(num)
    return numberValues[num] or 0
end

function numbers.getUpgrade(tree, upgrade)
    if upgradeTreeUnlocks[tree] and upgradeTreeUnlocks[tree][upgrade] then
        return tostring(upgradeTreeUnlocks[tree][upgrade][1][1] or 0) .. "/" .. tostring(upgradeTreeUnlocks[tree][upgrade][1][2] or 0)
    end
    return "0/0"
end

function numbers.increaseAlpha()
    numberValues[1] = (numberValues[1] or 0) + numbers.getMulti(1)
end

function numbers.increaseBeta()
    numberValues[2] = (numberValues[2] or 0) + numbers.getMulti(2)
    numberValues[1] = 0
    additives[1] = 0
    additiveMultipliers[1] = 0
    multiplicativeMultipliers[1] = 0
    for i, v in ipairs(upgradeTreeUnlocks[1]) do 
        v[1][1] = 0
        if i ~= 1 then
            v[2] = false
        end
    end
end

function numbers.increaseGamma()
    numberValues[3] = (numberValues[3] or 0) + numbers.getMulti(3)
end

function numbers.increaseDelta()
    if deltaOnCd == 0 and numberValues[3] >= 100 then
        deltaOnCd = deltaCd
        numberValues[4] = (numberValues[4] or 0) + numbers.getMulti(4)
        numberValues[3] = numberValues[3] - 100
        timer.delay(1, true, function(self, handle)
            deltaOnCd = deltaOnCd - 1
            if deltaOnCd == 0 then
                timer.cancel(handle)
            end
        end)
    end
end

function numbers.increaseEpsilon()
    numberValues[5] = (numberValues[5] or 0) + 1
end

function numbers.increaseZeta()
    numberValues[6] = (numberValues[6] or 0) + numbers.getMulti(6)
    numberValues[5] = 0
    for j = 1, 4, 1 do
        additives[j] = 0
        additiveMultipliers[j] = 0
        multiplicativeMultipliers[j] = 0
        numberValues[j] = 0
        for i, v in ipairs(upgradeTreeUnlocks[j]) do 
            v[1][1] = 0
            if i ~= 1 then
                v[2] = false
            end
        end
    end
end

function numbers.checkBetaIncreaseable()
    if numberValues[1] >= 1000 then
        return true
    end
    return false
end

function numbers.getDeltaOnCd()
    return deltaOnCd
end

function numbers.changeAdditives(add, value)
    additives[value] = (additives[value] or 0) + add
end

function numbers.changeAdditiveMultipliers(mult, value)
    additiveMultipliers[value] = (additives[value] or 0) + mult
end

function numbers.changeMultiplicativeMultipliers(mult, value)
    multiplicativeMultipliers[value] = (multiplicativeMultipliers[value] or 1) * mult
end

function numbers.increaseUpgrade(tree, upgrade)
    upgradeTreeUnlocks[tree][upgrade][1][1] = upgradeTreeUnlocks[tree][upgrade][1][1] + 1
end

function numbers.calculateCosts(tree, upgradeNum)
    local upgrade = upgradeTreeUnlocks[tree][upgradeNum][1][1]
    local calculators = upgradeTreeInfo[tree][upgradeNum][1]

    for i, v in ipairs(calculators) do
        local upgradeCost = v[1]

        for i, v in ipairs(v[2]) do
            if upgrade == 0 and i == 1 then
                
            elseif v[1] == "A" then
                if i == 1 then
                    upgradeCost = upgradeCost + (upgrade * v[2])
                else
                    upgradeCost = upgradeCost + v[2]
                end
            elseif v[1] == "P" then
                upgradeCost = math.pow(upgradeCost, v[2])
            elseif v[1] == "L" then
                upgradeCost = math.log(upgradeCost, v[2])
            elseif v[1] == "M" then
                if i == 1 then
                    upgradeCost = upgradeCost * math.pow(v[2], upgrade)
                else
                    upgradeCost = upgradeCost * v[2]
                end
            end
        end

        if upgradeCost > numberValues[v[3]] then
            return false
        end
    end
    return true
end

function numbers.payCosts(tree, upgradeNum)
    local upgrade = upgradeTreeUnlocks[tree][upgradeNum][1][1]
    local calculators = upgradeTreeInfo[tree][upgradeNum][1]
    
    for i, v in ipairs(calculators) do
        local upgradeCost = v[1]

        for i, v in ipairs(v[2]) do
            if upgrade == 0 and i == 1 then
                
            elseif v[1] == "A" then
                if i == 1 then
                    upgradeCost = upgradeCost + (upgrade * v[2])
                else
                    upgradeCost = upgradeCost + v[2]
                end
            elseif v[1] == "P" then
                upgradeCost = math.pow(upgradeCost, v[2])
            elseif v[1] == "L" then
                upgradeCost = math.log(upgradeCost, v[2])
            elseif v[1] == "M" then
                if i == 1 then
                    upgradeCost = upgradeCost * math.pow(v[2], upgrade)
                else
                    upgradeCost = upgradeCost * v[2]
                end
            end
        end

        numberValues[v[3]] = numberValues[v[3]] - upgradeCost
    end
end

function numbers.upgradeCost(tree, upgrade)
    if not upgradeTreeUnlocks[tree][upgrade][2] or upgradeTreeUnlocks[tree][upgrade][1][2] == upgradeTreeUnlocks[tree][upgrade][1][1] or not numbers.calculateCosts(tree, upgrade) then
        return false
    end
    return true
end

function numbers.buyUpgrade(tree, upgrade)
    if numbers.calculateCosts(tree, upgrade) then
        numbers.payCosts(tree, upgrade)
        if upgradeTreeUnlocks[tree][upgrade][1][1] == 0 then
            for i, v in ipairs(upgradeTreeInfo[tree][upgrade][3]) do
                upgradeTreeUnlocks[tree][v][2] = true
            end
        end
        numbers.increaseUpgrade(tree, upgrade)
        for i, v in ipairs(upgradeTreeInfo[tree][upgrade][2]) do
            numbers.changeAdditives(v[1] or 0, i)
            numbers.changeAdditiveMultipliers(v[2] or 0, i)
            numbers.changeMultiplicativeMultipliers(v[3] or 1, i)
        end
    end
end

return numbers