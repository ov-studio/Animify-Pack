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

local loaderCache = {}


--------------------------------------------
--[[ Functions: Loads/Unloads Animation ]]--
--------------------------------------------

function loadAnimation(animationPath, loadType)

    if animationPath or (type(animationPath) ~= "string") or not loadType or (type(loadType) ~= "string") then return false end

    if loadType == "load" then
        if not loaderCache[animationPath] then
            local animationData = vEngine.animation:load(animationPath)
            if animationData then
                loaderCache[animationPath] = animationData
                return animationData
            end
        end
    elseif loadType == "unload" then
        if loaderCache[animationPath] then
            local animationData = loaderCache[animationPath]:unload()
            loaderCache[animationPath] = nil
            return true
        end
    end
    return false

end

