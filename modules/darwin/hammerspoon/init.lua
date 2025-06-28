-- Hammerspoon configuration for desktop switching
-- Use Option+N to switch to desktop N (where N is 1-9)

local spaces = require("hs.spaces")
local hotkey = require("hs.hotkey")
local hyper = {"alt"}  -- Option key

-- Function to switch to a specific space
local function switchToSpace(spaceNumber)
    local screen = hs.screen.primaryScreen():getUUID()
    local allSpaces = spaces.allSpaces()[screen]
    
    if allSpaces and allSpaces[spaceNumber] then
        spaces.gotoSpace(allSpaces[spaceNumber])
    else
        -- If space doesn't exist, create it
        hs.alert.show("Creating space " .. spaceNumber)
        spaces.createSpace()
    end
end

-- Bind Option+1 through Option+9 for space switching
for i = 1, 9 do
    hotkey.bind(hyper, tostring(i), function()
        switchToSpace(i)
    end)
end

-- Optional: Add some helpful alerts
hs.alert.show("Hammerspoon loaded - Use Option+1-9 to switch spaces")

-- Reload config when this file changes
hs.hotkey.bind({"cmd", "alt"}, "R", function()
    hs.reload()
end)

