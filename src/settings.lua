--!strict

--[[---------------------------------------------------------------------

    LCMS was created by LoveliestJacob under the Apache License 2.0.
    Repository: https://github.com/Lovely-Experiences/LCMS

-----------------------------------------------------------------------]]

--// Please read the documentation at https://lcms.lovelyjacob.com before making any changes.

return {

	Version = 1,

	Log = function(Script: Script, Message: string): nil
		print("[" .. Script.Name .. "]: " .. Message)
		return nil
	end,

	Permissions = {
		{
			Name = "Moderator",
			Level = 1,
			Items = {},
		},
		{
			Name = "Admin",
			Level = 2,
			Items = {},
		},
		{
			Name = "Owner",
			Level = 3,
			Items = {
				{
					Type = "Custom",
					Value = function(Player: Player)
						if game.CreatorType == Enum.CreatorType.User then
							return Player.UserId == game.CreatorId
						elseif game.CreatorType == Enum.CreatorType.Group then
							return Player:GetRankInGroup(game.CreatorId) == 255
						end
						return false
					end,
				},
			},
		},
	},

	Style = {
		Background = Color3.fromRGB(42, 42, 42),
		BackgroundSecondary = Color3.fromRGB(47, 47, 47),
		TextColor = Color3.fromRGB(255, 255, 255),
		TextColorPopOut = Color3.fromRGB(255, 101, 101),
	},

	ChatPrefix = ";",
	CommandSeparator = "|",

	CommandBarKeycode = Enum.KeyCode.C,
	CommandBarRequirement = 2,

	DataStoreName = "database-service",
}
