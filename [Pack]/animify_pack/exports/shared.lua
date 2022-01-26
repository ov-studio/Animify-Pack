----------------------------------------------------------------
--[[ Resource: Animify Pack
     Script: exports: shared.lua
     Author: vStudio
     Developer(s): Tron
     DOC: 25/01/2022
     Desc: Shared Exports ]]--
----------------------------------------------------------------


----------------------------------------------------
--[[ Function: Sets/Retrieves Element Animation ]]--
----------------------------------------------------

if not vEngine.isServer then
    function setAnimation(...)
        return syncAnimation(...)
    end

    function getAnimation(CElement)
        if not CElement then return false end
        return CElement:getAnimation()
    end
else
    function setAnimation(...)
        return vEngine.event.trigger("Animify-Pack:syncAnimation", true, ...)
    end
end