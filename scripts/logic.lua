function slap()
    return has("gorillaslap") and has("donkey")
end

function bothkongs()
    return has("diddy") and has("donkey")
end

function finalbossaccess()
    local neededtokens = Tracker:FindObjectForCode("bigbananasrequired").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("bigbanana").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end