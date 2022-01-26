----------------------------------------------------------------
--[[ Resource: Animify Pack
     Script: handlers: syncer.lua
     Author: vStudio
     Developer(s): Tron
     DOC: 25/01/2022
     Desc: Animation Syncer ]]--
----------------------------------------------------------------


------------------------------------
--[[ Functions: Syncs Animation ]]--
------------------------------------

function syncAnimation(CElement, animPath)

    if not CElement or not animPath then return false end
    local CAnimation = loadAnim(animPath)
    if not CAnimation then return false end

    return CElement:setAnimation(CAnimation, Settings.frameRate)

end
vEngine.event.add("Animify_Pack:syncAnimation", syncAnimation)