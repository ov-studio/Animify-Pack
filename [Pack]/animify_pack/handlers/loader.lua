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

local animLoader = {
    --Class Buffer
    cache = {},

    --Class Methods
    load = function(animPath, loadType)
        if animPath or (type(animPath) ~= "string") or not loadType or (type(loadType) ~= "string") then return false end
        if loadType == "load" then
            if not animLoader.cache[animPath] then
                local CAnimation = vEngine.animation:load(animPath)
                if CAnimation then
                    animLoader.cache[animPath] = CAnimation
                    return CAnimation
                end
            end
        elseif loadType == "unload" then
            if animLoader.cache[animPath] then
                local CAnimation = animLoader.cache[animPath]:unload()
                animLoader.cache[animPath] = nil
                return true
            end
        end
        return false
    end
}


---------------------------------------
--[[ Functions: Loads/Unloads Anim ]]--
---------------------------------------

function loadAnim(...) return animLoader.load(...) end
function unloadAnim(...) return animLoader.load(...) end
