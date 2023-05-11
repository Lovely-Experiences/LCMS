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
					Type: "Custom" | "UserId" | "UserName" | "Group",
					Value: ((Player: Player) -> boolean | nil)
						| number
						| string
						| { GroupId: number, Validate: (Rank: number, Role: number) -> boolean | nil },
				},
			},
		},
	},
	Style: {
		Background: Color3,
		BackgroundSecondary: Color3,
		TextColor: Color3,
		TextColorPopOut: Color3,
	},
	ChatPrefix: string,
	CommandSeparator: string,
	CommandBarKeycode: Enum.KeyCode,
	CommandBarRequirement: number,
}

--// Main Function //--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

return function(Settings: Settings)
	--// Check if LCMS is already running.
	--// If it is, then we throw an error.
	if _G.LCMS_IsRunning == true then
		error("LCMS is already running!")
	else
		_G.LCMS_IsRunning = true
	end

	--// Creating necessary folders.
	local ReplicatedStorageFolder = Instance.new("Folder")
	ReplicatedStorageFolder.Name = "LCMS_ReplicatedStorage"
	ReplicatedStorageFolder.Parent = ReplicatedStorage

	local ServerStorageFolder = Instance.new("Folder")
	ServerStorageFolder.Name = "LCMS_ServerStorage"
	ServerStorageFolder.Parent = ServerStorage

	--// This is the "container" for all UI elements.
	local UIContainer = Instance.new("ScreenGui")
	UIContainer.ResetOnSpawn = false
	UIContainer.IgnoreGuiInset = true
	UIContainer.ClipToDeviceSafeArea = false
	UIContainer.Name = "LCMS_UIContainer"
	UIContainer.Parent = game:GetService("StarterGui")

	--// Loop over the current players incase anything is missing.
	for _, Player in ipairs(Players:GetPlayers()) do
		if Player.PlayerGui:FindFirstChild(UIContainer.Name) == nil then
			UIContainer:Clone().Parent = Player.PlayerGui
		end
	end
end
