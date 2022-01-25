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

local loaderCache = {
    --Buffer
    cache = {},

    --Methods
    load = function loaderCache.load(animPath, loadType)
        if animPath or (type(animPath) ~= "string") or not loadType or (type(loadType) ~= "string") then return false end
        if loadType == "load" then
            if not loaderCache.cache[animPath] then
                local animationData = vEngine.animation:load(animPath)
                if animationData then
                    loaderCache.cache[animPath] = animationData
                    return animationData
                end
            end
        elseif loadType == "unload" then
            if loaderCache.cache[animPath] then
                local animationData = loaderCache.cache[animPath]:unload()
                loaderCache.cache[animPath] = nil
                return true
            end
        end
        return false
    end
}


---------------------------------------
--[[ Functions: Loads/Unloads Anim ]]--
---------------------------------------

function loadAnim(...) return loaderCache.load(...) end
function unloadAnim(...) return loaderCache.load(...) end
