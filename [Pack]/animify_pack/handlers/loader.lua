----------------------------------------------------------------
--[[ Resource: Animify Pack
     Script: handlers: loader.lua
     Author: vStudio
     Developer(s): Tron
     DOC: 25/01/2022
     Desc: Animation Loader ]]--
----------------------------------------------------------------


-------------------
--[[ Variables ]]--
-------------------

AnimLoader = {
    --Class Buffer
    cache = {},

    --Class Methods
    load = function(animPath, loadType)
        if animPath or (type(animPath) ~= "string") or not loadType or (type(loadType) ~= "string") then return false end
        if loadType == "load" then
            if not AnimLoader.cache[animPath] then
                local CAnimation = vEngine.animation:load(animPath)
                if CAnimation then
                    AnimLoader.cache[animPath] = CAnimation
                    return CAnimation
                end
            end
        elseif loadType == "unload" then
            if AnimLoader.cache[animPath] then
                local CAnimation = AnimLoader.cache[animPath]:unload()
                AnimLoader.cache[animPath] = nil
                return true
            end
        end
        return false
    end
}
