
local ChangeHistoryService = game:GetService("ChangeHistoryService")
--init
--[[
local initPath = { -- to continue another day
    "LuridFramework//Universal//library.lua",
    "LuridFramework//Universal//functions.lua"
}
]]


function init()


    if isfile("LuridFramework//Universal//library.lua") == false then -- ghetto error handler

        rconsoleprint("File path (LuridFramework//Universal//library.lua) does not exist\n")

    elseif isfile("LuridFramework//Universal//functions.lua") == false then

        rconsoleprint("File path (LuridFramework//Universal//functions.lua) does not exist\n")

    end

    if isfile("LuridFramework//Universal//library.lua") and isfile("LuridFramework//Universal//functions.lua") == true then --checks if file exists

        loadfile("LuridFramework//Universal//library.lua")()
        loadfile("LuridFramework//Universal//functions.lua")()

        rconsoleprint("@@BLUE@@")
        rconsoleprint("Found (LuridFramework//Universal//library.lua)\n")
        rconsoleprint("Found (LuridFramework//Universal//functions.lua)\n")

        rconsoleprint("Welcome "..game.Players.LocalPlayer.Name.."\n")
        

        --init finished
        loadfile("LuridFramework//Universal//main.lua")

    end

end
init()
