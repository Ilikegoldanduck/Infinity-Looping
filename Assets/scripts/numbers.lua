local numbers = {}

--alpha beta gamma delta epsilon zeta eta theta iota kappa iambda mu nu xi omicron pi rho sigma tau upsilon phi chi psi omega
local numberValues = {}
local values = {"Points", "Skill", "Time", "Research", "Energy", "Profits", "Cash"}

local additiveMultipliers = {}
local multiplicativeMultipliers = {}
local additives = {}
local selfIncrease = {}

local researchCdMulti = 0
local researchCd = 5
local researchOnCd = 0

local autoPointsCd = 0

local upgradeTreeUpdates = {}

local upgradeTreeUnlocks = {
    { -- Points Upgrades
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
    { -- Skill Upgrades
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 3}, --Upgrade Amounts; -1 = inf
            false
        },
        {
            {0, 9},
            false
        }
    },
    { -- Time Upgrades
        {    
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
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
    { -- Research Upgrades
        {
            {0, -1}, --Upgrade Amounts; -1 = inf
            false
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
    { -- Energy Upgrades : None
    },
    { -- Profit Upgrades
    },
    { -- Cash Upgrades
        { 
            {0, 1},
            false
        },
        { 
            {0, 1},
            false
        }
    }
}

local upgradeTreeInfo = {
    { -- Points Upgrades
        { --Upgrade 1
            {
                {
                    10, --Starting cost 
                    {
                        {"AA", 10}
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
            {{0, 2}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 3
            {
                {
                    10, --Starting cost 
                    {
                        {"M", 10}, {"AA", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    1 -- Value
                }
            }, --Costs
            {{0, 0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Skill Upgrades
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
            {2, 3, 4} --Unlocks
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
                        {"M", 10}, {"AA", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    2
                }
            }, --Costs
            {{}, {}, {0, 10}}, --Increasors
            {} --Unlocks
        },
        { --Upgrade 4
            {
                
                {
                    100, --Starting cost
                    {
                        {"M", 100}, {"AA", 20}
                    },
                    1
                },
                {
                    1, --Starting cost 
                    {
                        {"M", 10}, {"AA", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    2
                }
            }, --Costs
            {}, --Increasors
            {} --Unlocks
        }
    },
    { -- Time Upgrades
        { --Upgrade 1
            {
                {
                        1, --Starting cost 
                        {
                            {"AA", 10}
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
                        {"M", 10}, {"AA", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    3
                }
            }, --Costs
            {{0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Research Upgrades
        { --Upgrade 1
            {
                {
                    1, --Starting cost 
                    {
                        {"AA", 10}
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
                        {"M", 10}, {"AA", 20}
                    }, --A = Addition, M = Multiplication, L = Logarithms, P = Exponents, S = Starting Cost
                    4
                }
            }, --Costs
            {{0, 2}}, --Increasors
            {} --Unlocks
        }
    },
    { -- Energy Upgrades : None
    },
    { -- Profit Upgrades
    },
    { -- Cash Upgrades
        { --Upgrade 1
            {
                {
                    100, --Starting cost 
                    {},
                    7
                }
            }, --Costs
            {}, --Increasors
            {2} --Unlocks
        },
        { --Upgrade 2
            {
                {
                    10000, --Starting cost 
                    {},
                    7
                }
            }, --Costs
            {}, --Increasors
            {} --Unlocks
        }
    }
}

local function calculateExtra(time)
    if (numberValues[2] or 0) > 0 then
        numberValues[3] = (numberValues[3] or 0) + numbers.getMulti(3) * (os.time() - time)
    end
    if (numberValues[4] or 0) > 0 then
        numberValues[5] = numberValues[5] + numbers.getMulti(5) * (os.time() - time)
    end
    if (numberValues[6] or 0) > 0 then
        numberValues[7] = numberValues[7]  + numbers.getMulti(7) * (os.time() - time)
    end
end

function numbers.pointAuto()
    timer.delay(1, true, function(self, handle)
        if upgradeTreeUnlocks[2][4][1][1] > 0 then
            autoPointsCd = autoPointsCd - 1
            if autoPointsCd <= 0 then
                autoPointsCd = 10 - upgradeTreeUnlocks[2][4][1][1]
                numbers.increasePoints()
            end
        end
    end)
end

function numbers.loadFile()
    local path = sys.get_save_file("test1", "savefile")

    local err, save = pcall(sys.load, path)
    numberValues = save.values or numberValues
    additives = save.additives or {}
    additiveMultipliers = save.additiveMultipliers or {}
    multiplicativeMultipliers = save.multiplicativeMultipliers or {}
    calculateExtra(save.time or os.time())
    for tree, treeNode in ipairs(save.upgrades or {}) do
        for i, v in ipairs(treeNode) do
            upgradeTreeUnlocks[tree][i][1][1] = v[1][1]
            if (tree == 1 and i == 1) or upgradeTreeUnlocks[tree][i][2] then
                pprint(tree .. "|" .. i)
                upgradeTreeUnlocks[tree][i][2] = true
            else
                upgradeTreeUnlocks[tree][i][2] = v[2]
                if upgradeTreeUnlocks[tree][i][1][1] > 0 then
                    local unlocks = upgradeTreeInfo[tree][i][3]
                    for j, k in ipairs(unlocks) do
                        pprint(tree .. "|" .. k)
                        upgradeTreeUnlocks[tree][k][2] = true
                        table.insert(upgradeTreeUpdates, {tree, k, hash("unlocked")})
                    end
                end
            end
            if upgradeTreeUnlocks[tree][i][1][1] == upgradeTreeUnlocks[tree][i][1][2] then
                table.insert(upgradeTreeUpdates, {tree, i, hash("complete")})
            elseif upgradeTreeUnlocks[tree][i][2] then
                table.insert(upgradeTreeUpdates, {tree, i, hash("unlocked")})
            else
                table.insert(upgradeTreeUpdates, {tree, i, hash("refresh")})
            end
        end
    end
    numbers.pointAuto()
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
        return ((multiplicativeMultipliers[1] or 1) * (1 + (numberValues[5] or 0) + (additiveMultipliers[1] or 0)) * (1 + (additives[1] or 0)) * (1 + math.log(((numberValues[2] or 0) + 1), 10)))
    elseif num == 2 then
        return ((multiplicativeMultipliers[2] or 1) * (1 + (additiveMultipliers[2] or 0))) * (math.log(math.pow((numberValues[1] or 0), 2 * (1 + math.log((numberValues[7] or 0) + 1, 10))), 10) - 5) * math.pow(2, - (numberValues[3] or 0)) + (additives[2] or 0)
    elseif num == 3 then
        return ((multiplicativeMultipliers[3] or 1) * (1 + (numberValues[5] or 0) + (additiveMultipliers[3] or 0))) * (1 + (additives[3] or 0))
    elseif num == 4 then
        return ((multiplicativeMultipliers[4] or 1) * (1 + (additiveMultipliers[4] or 0))) * (1 + (additives[4] or 0))  * math.pow(math.log(((numberValues[4] or 0) + 1) * ((numberValues[7] or 0) + 1), 10), (selfIncrease[4] or 0))
    elseif num == 5 then
        return 1 + math.log((numberValues[4] + 1) * (numberValues[7] + 1), 10)
    elseif num == 6 then
        return ((numberValues[2] or 0) * (2 - math.pow(2, - (numberValues[5] or 0))) * (1 + math.log((numberValues[4] or 0) + 1, 10)))
    elseif num == 7 then
        return (numberValues[6] or 0)
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

function numbers.getUpgradesTotal(tree, upgrade)
    return upgradeTreeUnlocks[tree][upgrade][1][2] or 0
end

function numbers.getUpgradesUnlocked(tree, upgrade)
    return upgradeTreeUnlocks[tree][upgrade][1][1] or 0
end

function numbers.increasePoints()
    numberValues[1] = (numberValues[1] or 0) + numbers.getMulti(1)
end

function numbers.increaseSkill()
    numberValues[2] = (numberValues[2] or 0) + numbers.getMulti(2)
    numberValues[1] = 0
    if not ((upgradeTreeUnlocks[7][1][1][1] or 0) == 1) then
        print("done")
        if not upgradeTreeUnlocks[2][1][2] then
            upgradeTreeUnlocks[2][1][2] = true
            table.insert(upgradeTreeUpdates, {2, 1, hash("unlocked")})
            upgradeTreeUnlocks[3][1][2] = true
            table.insert(upgradeTreeUpdates, {3, 1, hash("unlocked")})
        end
        additives[1] = 0 
        additiveMultipliers[1] = 0
        multiplicativeMultipliers[1] = 1
        for i, v in ipairs(upgradeTreeUnlocks[1]) do 
            v[1][1] = 0
            if i ~= 1 then
                v[2] = false
                table.insert(upgradeTreeUpdates, {1, i, hash("locked")})
            else
                table.insert(upgradeTreeUpdates, {1, i, hash("refresh")})
            end
        end
    end
end

function numbers.increaseTime()
    numberValues[3] = (numberValues[3] or 0) + numbers.getMulti(3)
end

function numbers.increaseResearch()
    if researchOnCd == 0 and numberValues[3] >= 100 then
        researchOnCd = researchCd
        if not upgradeTreeUnlocks[4][1][2] then
            upgradeTreeUnlocks[4][1][2] = true
            table.insert(upgradeTreeUpdates, {4, 1, hash("unlocked")})
        end
        numberValues[4] = (numberValues[4] or 0) + numbers.getMulti(4)
        numberValues[3] = numberValues[3] - 100
        timer.delay(1, true, function(self, handle)
            researchOnCd = researchOnCd - 1
            if researchOnCd == 0 then
                timer.cancel(handle)
            end
        end)
    end
end

function numbers.increaseEnergy()
    numberValues[5] = (numberValues[5] or 0) + 1
end

function numbers.increaseProfits()
    numberValues[6] = numbers.getMulti(6)
    numberValues[5] = 0
    if not upgradeTreeUnlocks[7][1][2] then
        upgradeTreeUnlocks[7][1][2] = true
        table.insert(upgradeTreeUpdates, {7, 1, hash("unlocked")})
    end
    for j = 1, 4, 1 do
        additives[j] = 0
        additiveMultipliers[j] = 0
        multiplicativeMultipliers[j] = 1
        numberValues[j] = 0
        for i, v in ipairs(upgradeTreeUnlocks[j]) do 
            v[1][1] = 0
            if j ~= 1 and i ~= 1 then
                v[2] = false
                table.insert(upgradeTreeUpdates, {j, i, hash("locked")})
            else
                table.insert(upgradeTreeUpdates, {1, i, hash("refresh")})
            end
        end
    end
end

function numbers.increaseCash()
    numberValues[7] = (numberValues[7] or 0) + numbers.getMulti(7)
end

function numbers.checkSkillIncreaseable()
    if numberValues[1] >= 1000 then
        return true
    end
    return false
end

function numbers.getResearchOnCd()
    return researchOnCd
end

function numbers.getPointsOnCd()
    return autoPointsCd
end

function numbers.changeAdditives(add, value)
    additives[value] = (additives[value] or 0) + add
end

function numbers.changeAdditiveMultipliers(mult, value)
    additiveMultipliers[value] = (additiveMultipliers[value] or 0) + mult
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
                
            elseif v[1] == "AA" then -- Augmented Addition
                upgradeCost = upgradeCost + (upgrade * v[2])
            elseif v[1] == "RA" then -- Raw Addition
                upgradeCost = upgradeCost + v[2]
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

        if upgradeCost > (numberValues[v[3]] or 0) then
            return false
        end
    end
    return true
end

local function convertValue(num)
	num = math.floor(num * 100) / 100
	if num >= 1000 then	
		num = math.floor(num * 100) / 100
		return tostring(math.floor(num / math.pow(10, math.floor(math.log(num, 10))) * 100) / 100) .. "e" .. tostring(math.floor(math.log(num, 10)))
	end
	return tostring(num)
end

function numbers.sendCosts(tree, upgradeNum)
    local upgrade = upgradeTreeUnlocks[tree][upgradeNum][1][1]
    local calculators = upgradeTreeInfo[tree][upgradeNum][1]

    local text = ""

    for i, v in ipairs(calculators) do
        local upgradeCost = v[1]

        for i, v in ipairs(v[2]) do
            if upgrade == 0 and i == 1 then
                
            elseif v[1] == "AA" then -- Augmented Addition
                upgradeCost = upgradeCost + (upgrade * v[2])
            elseif v[1] == "RA" then -- Raw Addition
                upgradeCost = upgradeCost + v[2]
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

        text = text .. values[v[3]] .. ": " .. convertValue(upgradeCost) .. "\n"
    end

    return text
end

function numbers.payCosts(tree, upgradeNum)
    local upgrade = upgradeTreeUnlocks[tree][upgradeNum][1][1]
    local calculators = upgradeTreeInfo[tree][upgradeNum][1]
    
    for i, v in ipairs(calculators) do
        local upgradeCost = v[1]

        for i, v in ipairs(v[2]) do
            if upgrade == 0 and i == 1 then
                
            elseif v[1] == "AA" then -- Augmented Addition
                upgradeCost = upgradeCost + (upgrade * v[2])
            elseif v[1] == "RA" then -- Raw Addition
                upgradeCost = upgradeCost + v[2]
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
                table.insert(upgradeTreeUpdates, {tree, v, hash("unlocked")})
            end
        end
        numbers.increaseUpgrade(tree, upgrade)
        for i, v in ipairs(upgradeTreeInfo[tree][upgrade][2]) do
            numbers.changeAdditives(v[1] or 0, i)
            numbers.changeAdditiveMultipliers(v[2] or 0, i)
            numbers.changeMultiplicativeMultipliers(v[3] or 1, i)
        end
        if upgradeTreeUnlocks[tree][upgrade][1][1] == upgradeTreeUnlocks[tree][upgrade][1][2] then
            table.insert(upgradeTreeUpdates, {tree, upgrade, hash("complete")})
        else
            table.insert(upgradeTreeUpdates, {tree, upgrade, hash("refresh")})
        end
    end
end

function numbers.getUpdates()
    local temp = upgradeTreeUpdates
    upgradeTreeUpdates = {}
    return temp
end

return numbers