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


---------------------------------------
--[[ Functions: Loads/Unloads Anim ]]--
---------------------------------------

local function __loadAnim(animPath, loadType)

    if animPath or (type(animPath) ~= "string") or not loadType or (type(loadType) ~= "string") then return false end

    if loadType == "load" then
        if not loaderCache[animPath] then
            local animationData = vEngine.animation:load(animPath)
            if animationData then
                loaderCache[animPath] = animationData
                return animationData
            end
        end
    elseif loadType == "unload" then
        if loaderCache[animPath] then
            local animationData = loaderCache[animPath]:unload()
            loaderCache[animPath] = nil
            return true
        end
    end
    return false

end

function loadAnim(...) return __loadAnim(...) end
function unloadAnim(...) return __loadAnim(...) end
