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

function junglebossaccess()
    local neededtokens = Tracker:FindObjectForCode("kjbossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("kjclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function minesbossaccess()
    local neededtokens = Tracker:FindObjectForCode("mmbossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("mmclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function valleybossaccess()
    local neededtokens = Tracker:FindObjectForCode("vvbossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("vvclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function industriesbossaccess()
    local neededtokens = Tracker:FindObjectForCode("kiibossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("kiiclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function glacierbossaccess()
    local neededtokens = Tracker:FindObjectForCode("ggbossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("ggclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function cavernsbossaccess()
    local neededtokens = Tracker:FindObjectForCode("ccbossaccess").AcquiredCount
    local currenttokens = Tracker:FindObjectForCode("ccclears").AcquiredCount
    if neededtokens > 0 then
        return currenttokens >= neededtokens
    end    
end

function check_clears(section)
	local SectionID = section.FullID
	Code = locationToCode[SectionID]
    if (Code) ~= nil then
        
        local kj1, kj2, kj3, kj4, kj5 = 0, 0, 0, 0, 0
        local mm1, mm2, mm3, mm4, mm5 = 0, 0, 0, 0, 0
        local vv1, vv2, vv3, vv4, vv5, vv6 = 0, 0, 0, 0, 0, 0
        local gg1, gg2, gg3, gg4, gg5, gg6 = 0, 0, 0, 0, 0, 0
        local kii1, kii2, kii3, kii4, kii5, kii6 = 0, 0, 0, 0, 0, 0
        local cc1, cc2, cc3, cc4, cc5 = 0, 0, 0, 0, 0

        local obj1 = Tracker:FindObjectForCode("@Jungle Hijinxs/Jungle Hijinxs - Clear/Clear")
        if obj1 and obj1.AvailableChestCount == 0 then
            kj1 = 1
        end

        local obj2 = Tracker:FindObjectForCode("@Ropey Rampage/Ropey Rampage - Clear/Clear")
        if obj2 and obj2.AvailableChestCount == 0 then
            kj2 = 1
        end

        local obj3 = Tracker:FindObjectForCode("@Coral Capers/Coral Capers - Clear/Clear")
        if obj3 and obj3.AvailableChestCount == 0 then
            kj3 = 1
        end

        local obj4 = Tracker:FindObjectForCode("@Reptile Rumble/Reptile Rumble - Clear/Clear")
        if obj4 and obj4.AvailableChestCount == 0 then
            kj4 = 1
        end

        local obj5 = Tracker:FindObjectForCode("@Barrel Cannon Canyon/Barrel Cannon Canyon - Clear/Clear")
        if obj5 and obj5.AvailableChestCount == 0 then
            kj5 = 1
        end

        local obj6 = Tracker:FindObjectForCode("@Winky's Walkway/Winky's Walkway - Clear/Clear")
        if obj6 and obj6.AvailableChestCount == 0 then
            mm1 = 1
        end        

        local obj7 = Tracker:FindObjectForCode("@Mine Cart Carnage/Mine Cart Carnage - Clear/Clear")
        if obj7 and obj7.AvailableChestCount == 0 then
            mm2 = 1
        end    

        local obj8 = Tracker:FindObjectForCode("@Bouncy Bonanza/Bouncy Bonanza - Clear/Clear")
        if obj8 and obj8.AvailableChestCount == 0 then
            mm3 = 1
        end    

        local obj9 = Tracker:FindObjectForCode("@Stop & Go Station/Stop & Go Station - Clear/Clear")
        if obj9 and obj9.AvailableChestCount == 0 then
            mm4 = 1
        end  

        local obj10 = Tracker:FindObjectForCode("@Millstone Mayhem/Millstone Mayhem - Clear/Clear")
        if obj10 and obj10.AvailableChestCount == 0 then
            mm5 = 1
        end  

        local obj11 = Tracker:FindObjectForCode("@Vulture Culture/Vulture Culture - Clear/Clear")
        if obj11 and obj11.AvailableChestCount == 0 then
            vv1 = 1
        end

        local obj12 = Tracker:FindObjectForCode("@Tree Top Town/Tree Top Town - Clear/Clear")
        if obj12 and obj12.AvailableChestCount == 0 then
            vv2 = 1
        end        

        local obj13 = Tracker:FindObjectForCode("@Forest Frenzy/Forest Frenzy - Clear/Clear")
        if obj13 and obj13.AvailableChestCount == 0 then
            vv3 = 1
        end    

        local obj14 = Tracker:FindObjectForCode("@Temple Tempest/Temple Tempest - Clear/Clear")
        if obj14 and obj14.AvailableChestCount == 0 then
            vv4 = 1
        end    

        local obj15 = Tracker:FindObjectForCode("@Orang-utan Gang/Orang-utan Gang - Clear/Clear")
        if obj15 and obj15.AvailableChestCount == 0 then
            vv5 = 1
        end  

        local obj16 = Tracker:FindObjectForCode("@Clam City/Clam City - Clear/Clear")
        if obj16 and obj16.AvailableChestCount == 0 then
            vv6 = 1
        end  

        local obj17 = Tracker:FindObjectForCode("@Snow Barrel Blast/Snow Barrel Blast - Clear/Clear")
        if obj17 and obj17.AvailableChestCount == 0 then
            gg1 = 1
        end

        local obj18 = Tracker:FindObjectForCode("@Slipslide Ride/Slipslide Ride - Clear/Clear")
        if obj18 and obj18.AvailableChestCount == 0 then
            gg2 = 1
        end        

        local obj19 = Tracker:FindObjectForCode("@Ice Age Alley/Ice Age Alley - Clear/Clear")
        if obj19 and obj19.AvailableChestCount == 0 then
            gg3 = 1
        end    

        local obj20 = Tracker:FindObjectForCode("@Croctopus Chase/Croctopus Chase - Clear/Clear")
        if obj20 and obj20.AvailableChestCount == 0 then
            gg4 = 1
        end    

        local obj21 = Tracker:FindObjectForCode("@Torchlight Trouble/Torchlight Trouble - Clear/Clear")
        if obj21 and obj21.AvailableChestCount == 0 then
            gg5 = 1
        end  

        local obj22 = Tracker:FindObjectForCode("@Rope Bridge Rumble/Rope Bridge Rumble - Clear/Clear")
        if obj22 and obj22.AvailableChestCount == 0 then
            gg6 = 1
        end  

        local obj23 = Tracker:FindObjectForCode("@Oil Drum Alley/Oil Drum Alley - Clear/Clear")
        if obj23 and obj23.AvailableChestCount == 0 then
            kii1 = 1
        end

        local obj24 = Tracker:FindObjectForCode("@Trick Track Trek/Trick Track Trek - Clear/Clear")
        if obj24 and obj24.AvailableChestCount == 0 then
            kii2 = 1
        end        

        local obj25 = Tracker:FindObjectForCode("@Elevator Antics/Elevator Antics - Clear/Clear")
        if obj25 and obj25.AvailableChestCount == 0 then
            kii3 = 1
        end    

        local obj26 = Tracker:FindObjectForCode("@Poison Pond/Poison Pond - Clear/Clear")
        if obj26 and obj26.AvailableChestCount == 0 then
            kii4 = 1
        end    

        local obj27 = Tracker:FindObjectForCode("@Mine Cart Madness/Mine Cart Madness - Clear/Clear")
        if obj27 and obj27.AvailableChestCount == 0 then
            kii5 = 1
        end  

        local obj28 = Tracker:FindObjectForCode("@Blackout Basement/Blackout Basement - Clear/Clear")
        if obj28 and obj28.AvailableChestCount == 0 then
            kii6 = 1
        end  

        local obj29 = Tracker:FindObjectForCode("@Tanked Up Trouble/Tanked Up Trouble - Clear/Clear")
        if obj29 and obj29.AvailableChestCount == 0 then
            cc1 = 1
        end

        local obj30 = Tracker:FindObjectForCode("@Manic Mincers/Manic Mincers - Clear/Clear")
        if obj30 and obj30.AvailableChestCount == 0 then
            cc2 = 1
        end        

        local obj31 = Tracker:FindObjectForCode("@Misty Mine/Misty Mine - Clear/Clear")
        if obj31 and obj31.AvailableChestCount == 0 then
            cc3 = 1
        end    

        local obj32 = Tracker:FindObjectForCode("@Loopy Lights/Loopy Lights - Clear/Clear")
        if obj32 and obj32.AvailableChestCount == 0 then
            cc4 = 1
        end    

        local obj33 = Tracker:FindObjectForCode("@Platform Perils/Platform Perils - Clear/Clear")
        if obj33 and obj33.AvailableChestCount == 0 then
            cc5 = 1
        end  


        local kjtotal = kj1 + kj2 + kj3 + kj4 + kj5
        local mmtotal = mm1 + mm2 + mm3 + mm4 + mm5
        local vvtotal = vv1 + vv2 + vv3 + vv4 + vv5 + vv6
        local ggtotal = gg1 + gg2 + gg3 + gg4 + gg5 + gg6
        local kiitotal = kii1 + kii2 + kii3 + kii4 + kii5 + kii6
        local cctotal = cc1 + cc2 + cc3 + cc4 + cc5

        local kjclears = Tracker:FindObjectForCode("kjclears")
        if kjclears then
            kjclears.AcquiredCount = kjtotal
        else
            print("Warning: 'kjclears' object not found.")
        end
        local mmclears = Tracker:FindObjectForCode("mmclears")
        if mmclears then
            mmclears.AcquiredCount = mmtotal
        else
            print("Warning: 'mmclears' object not found.")
        end
        local vvclears = Tracker:FindObjectForCode("vvclears")
        if vvclears then
            vvclears.AcquiredCount = vvtotal
        else
            print("Warning: 'vvclears' object not found.")
        end
        local ggclears = Tracker:FindObjectForCode("ggclears")
        if ggclears then
            ggclears.AcquiredCount = ggtotal
        else
            print("Warning: 'ggclears' object not found.")
        end
        local kiiclears = Tracker:FindObjectForCode("kiiclears")
        if kiiclears then
            kiiclears.AcquiredCount = kiitotal
        else
            print("Warning: 'kiiclears' object not found.")
        end
                local ccclears = Tracker:FindObjectForCode("ccclears")
        if ccclears then
            ccclears.AcquiredCount = cctotal
        else
            print("Warning: 'ccclears' object not found.")
        end
    end
end


ScriptHost:AddOnLocationSectionChangedHandler("location_check",check_clears)