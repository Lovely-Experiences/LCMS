--!strict

--[[---------------------------------------------------------------------

    LCMS was created by LoveliestJacob under the Apache License 2.0.
    Repository: https://github.com/Lovely-Experiences/LCMS

-----------------------------------------------------------------------]]

--// Type Definitions //--

type Settings = {
    Version: number,
    Log: (Script: Script, Message: string) -> nil,
    Permissions: {
        [number]: {
            Name: string,
            Level: number,
            Items: {
                [number]: {
                    Type: "Custom"
                    | "UserId"
                    | "UserName"
                    | "Group",
                    Value: ((Player: Player) -> boolean|nil)
                    | number
                    | string
                    | { GroupId: number, Validate: (Rank: number, Role: number) -> boolean|nil }
                }
            }
        }
    },
}

--// Main Function //--

return function (Settings: Settings)

    --// Check if LCMS is already running.
    --// If it is, then we throw an error.
    if _G.LCMS_IsRunning == true then
        error("LCMS is already running!")
    end

end