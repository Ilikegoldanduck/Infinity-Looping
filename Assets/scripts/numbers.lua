local numbers = {}

--1 - alpha 2 - beta etc etc
local numberValues = {}
local multipliers = {}
local additives = {}

local upgradeTree = {{{0, -1, 10}, 0, 0}}

function numbers.increaseAlpha()
    numberValues[1] = (1 + (multipliers[1] or 0)) * ((numberValues[1] or 0) + 1 + (additives[1] or 0)) * (1 + math.log((numberValues[2] or 1), 10))
end

function numbers.checkBetaIncreaseable()
    if numberValues[1] >= 1000 then
        return true
    end
    return false
end

function numbers.increaseBeta()
    numberValues[2] = math.log(numberValues[1] ^ 2, 10) - 5
end

function numbers.increaseCharlie()
    numberValues[3] = (numberValues[3] or 0) + 1
end

function numbers.changeAdditives(add, value)
    additives[value] = (additives[value] or 0) + add
end

function numbers.changeMultipliers(mult, value)
    multipliers[value] = (additives[value] or 0) + mult
end

function numbers.increaseUpgrade(tree, upgrade)
    upgradeTree[tree][upgrade] = (upgradeTree[tree][upgrade][1] or 0) + 1
end

function numbers.upgradeCost(tree, upgrade)
    if upgradeTree[tree][upgrade][2] == upgradeTree[tree][upgrade][1] or numberValues[tree] < (upgradeTree[tree][upgrade][3][upgrade] or upgradeTree[tree][upgrade][3] * upgradeTree[tree][upgrade][1]) then
        return false
    end
    return true
end

function numbers.getValues(num)
    return numberValues[num]
end


return numbers