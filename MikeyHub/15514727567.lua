local FluentLoader = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local GamePlaceId = game.PlaceId
local GameProductInfo = game:GetService("MarketplaceService"):GetProductInfo(GamePlaceId)
local ClientId = game:GetService("RbxAnalyticsService"):GetClientId()
local LocalPlayer = game:GetService("Players").LocalPlayer
local IsMikeyHubOwned = true
local MainWindow = FluentLoader:CreateWindow({
	Title = "MikeyHub [ CRACK ]",
	SubTitle = "cracked by fade lmao",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightShift
})
local function Function1(Param1)
	local InitialValue = 0
	for LoopCounter = 1, # Param1 do
		InitialValue = (InitialValue + string.byte(Param1, LoopCounter) * LoopCounter) % 4294967296
	end
	return tostring(InitialValue)
end
local function Function2()
	local PlayerClone = cloneref(game:GetService("Players"))
	return tostring(PlayerClone.LocalPlayer.UserId)
end
local UserInputService = game:GetService("UserInputService")
local InputService = UserInputService
table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, UserInputService.GetPlatform(InputService))
local ExecutorName = identifyexecutor()
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerUserId = LocalPlayer.UserId
local function Function3()
	local Platform = UserInputService:GetPlatform()
	return Platform ~= Enum.Platform.Android and (Platform ~= Enum.Platform.IOS and "PC" or "IPhone") or "Android"
end
local MainTab = {
	Main = MainWindow:AddTab({
		Title = "| Main",
		Icon = "home"
	}),
	Combat = MainWindow:AddTab({
		Title = "| Combat",
		Icon = "swords"
	}),
	GunMods = MainWindow:AddTab({
		Title = "| Gun Mods",
		Icon = "crosshair"
	}),
	Visuals = MainWindow:AddTab({
		Title = "| Visuals",
		Icon = "eye"
	}),
	Misc = MainWindow:AddTab({
		Title = "| Misc",
		Icon = "circle-ellipsis"
	})
}
local Options = FluentLoader.Options
local BooleanValue = false
spawn(function()
	task.wait(2)
	BooleanValue = true
end)
MainTab.Main:AddSection("Give/Unlock Items")
local EmptyTable = {}
if LocalPlayer.Backpack then
	local WeaponIterator, WeaponState, WeaponValue = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local WeaponKey, WeaponName = WeaponIterator(WeaponState, WeaponValue)
		if WeaponKey == nil then
			break
		end
		WeaponValue = WeaponKey
		if WeaponName.Name ~= "M16A1" and (WeaponName.Name ~= "Fisticuffs" and (WeaponName.Name ~= "Diamond Back" and (WeaponName.Name ~= "Tanto" and (WeaponName.Name ~= "Karambit" and (WeaponName.Name ~= "TT30" and (WeaponName.Name ~= "Mk PM" and (WeaponName.Name ~= "PPK" and (WeaponName.Name ~= "M1911" and (WeaponName.Name ~= "Model 39" and (WeaponName.Name ~= "Python" and (WeaponName.Name ~= "Mauser C96" and (WeaponName.Name ~= "Akimbo G40" and (WeaponName.Name ~= "Akimbo Deagle" and (WeaponName.Name ~= "P08 Luger" and WeaponName.Name ~= "Big Iron")))))))))))))) then
			table.insert(EmptyTable, WeaponName.Name)
		end
	end
end
local NilValue = nil
MainTab.Main:AddDropdown("", {
	Title = "Gun",
	Description = "the gun you want to spawn in with\nONLY FAL IS FREE",
	Values = EmptyTable,
	Multi = false,
	Default = 1
}):OnChanged(function(Param2)
	NilValue = Param2
end)
MainTab.Main:AddButton({
	Title = "Give Gun",
	Description = "Gives you the gun you selected (deploy to see effects, also saves)\nFAL IS FREE",
	Callback = function()
		if IsMikeyHubOwned == true or NilValue == "FAL" then
			game:GetService("Players").LocalPlayer:SetAttribute("Primary", NilValue)
		else
			FluentLoader:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		end
	end
})
local Table1 = {}
if LocalPlayer.Backpack then
	local WeaponIterator1, WeaponState1, WeaponValue1 = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local WeaponKey1, WeaponName1 = WeaponIterator1(WeaponState1, WeaponValue1)
		if WeaponKey1 == nil then
			break
		end
		WeaponValue1 = WeaponKey1
		if WeaponName1.Name == "Mk PM" or (WeaponName1.Name == "PPK" or (WeaponName1.Name == "M1911" or (WeaponName1.Name == "Model 39" or (WeaponName1.Name == "Python" or (WeaponName1.Name == "Mauser C96" or (WeaponName1.Name == "Akimbo G40" or (WeaponName1.Name == "Akimbo Deagle" or (WeaponName1.Name == "P08 Luger" or WeaponName1.Name == "Big Iron")))))))) then
			table.insert(Table1, WeaponName1.Name)
		end
	end
end
local NilValue1 = nil
MainTab.Main:AddDropdown("", {
	Title = "Secondary Gun",
	Description = "the gun you want to spawn in with",
	Values = Table1,
	Multi = false,
	Default = 1
}):OnChanged(function(Param3)
	NilValue1 = Param3
end)
MainTab.Main:AddButton({
	Title = "Give Secondary Gun",
	Description = "Gives you the gun you selected (deploy to see effects, also saves)\nOnly Python And Mauser Is Premium",
	Callback = function()
		if NilValue1 ~= "Python" or NilValue1 ~= "Mauser C96" then
			game:GetService("Players").LocalPlayer:SetAttribute("Secondary", NilValue1)
		else
			FluentLoader:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This (Other Secondarys Are Free).",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		end
	end
})
local Table2 = {}
if LocalPlayer.Backpack then
	local WeaponIterator2, WeaponState2, WeaponValue2 = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local WeaponKey2, WeaponName2 = WeaponIterator2(WeaponState2, WeaponValue2)
		if WeaponKey2 == nil then
			break
		end
		WeaponValue2 = WeaponKey2
		local WeaponInfo = WeaponName2
		if WeaponName2.Name == "Combat Knife" or (WeaponName2.Name == "Diamond Back" or (WeaponName2.Name == "Tanto" or WeaponName2.Name == "Karambit")) then
			table.insert(Table2, WeaponInfo.Name)
		end
	end
end
local NilValue2 = nil
MainTab.Main:AddDropdown("", {
	Title = "Melee",
	Description = "the melee you want to spawn in with",
	Values = Table2,
	Multi = false,
	Default = 1
}):OnChanged(function(Param4)
	NilValue2 = Param4
end)
MainTab.Main:AddButton({
	Title = "Give Melee",
	Description = "Gives you the melee you selected (deploy to see effects, also saves)\nAll Melees Are Free",
	Callback = function()
		game:GetService("Players").LocalPlayer:SetAttribute("Melee", NilValue2)
	end
})
MainTab.Main:AddSection("Player")
local NilValue3 = nil
infJumpDebounce = false
MainTab.Main:AddToggle("", {
	Title = "Infinite Jump",
	Description = "jump jump jump",
	Default = false,
	Callback = function(Param5)
		if Param5 == true then
			NilValue3 = UserInputService.JumpRequest:Connect(function()
				if not infJumpDebounce then
					infJumpDebounce = true
					LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
					wait()
					infJumpDebounce = false
				end
			end)
		else
			if NilValue3 then
				NilValue3:Disconnect()
			end
			infJumpDebounce = false
		end
	end
})
local RunService = game:GetService("RunService")
swimming = false
local Gravity = workspace.Gravity
local NilValue4 = nil
MainTab.Main:AddToggle("", {
	Title = "Air Swim",
	Description = "Allows you to swim in the air.",
	Default = false,
	Callback = function(Param6)
		if Param6 == true then
			if not swimming and (LocalPlayer and LocalPlayer.Character) and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
				Gravity = workspace.Gravity
				workspace.Gravity = 0
				local function Function4()
					workspace.Gravity = Gravity
					swimming = false
				end
				local Humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
				gravReset = Humanoid.Died:Connect(Function4)
				local HumanoidStates = Enum.HumanoidStateType:GetEnumItems()
				table.remove(HumanoidStates, table.find(HumanoidStates, Enum.HumanoidStateType.None))
				local HumanoidStateIterator, HumanoidStateState, HumanoidStateValue = pairs(HumanoidStates)
				while true do
					local UnusedVariable
					HumanoidStateValue, UnusedVariable = HumanoidStateIterator(HumanoidStateState, HumanoidStateValue)
					if HumanoidStateValue == nil then
						break
					end
					Humanoid:SetStateEnabled(UnusedVariable, false)
				end
				Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
				NilValue4 = RunService.Heartbeat:Connect(function()
					pcall(function()
						LocalPlayer.Character.HumanoidRootPart.Velocity = (Humanoid.MoveDirection ~= Vector3.new() or UserInputService:IsKeyDown(Enum.KeyCode.Space)) and LocalPlayer.Character.HumanoidRootPart.Velocity or Vector3.new()
					end)
				end)
				swimming = true
			end
		elseif LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
			workspace.Gravity = Gravity
			swimming = false
			if gravReset then
				gravReset:Disconnect()
			end
			if NilValue4 ~= nil then
				NilValue4:Disconnect()
				NilValue4 = nil
			end
			local Humanoid1 = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			local HumanoidStates1 = Enum.HumanoidStateType:GetEnumItems()
			table.remove(HumanoidStates1, table.find(HumanoidStates1, Enum.HumanoidStateType.None))
			local HumanoidStateIterator1, HumanoidStateState1, HumanoidStateValue1 = pairs(HumanoidStates1)
			while true do
				local UnusedVariable1
				HumanoidStateValue1, UnusedVariable1 = HumanoidStateIterator1(HumanoidStateState1, HumanoidStateValue1)
				if HumanoidStateValue1 == nil then
					break
				end
				Humanoid1:SetStateEnabled(UnusedVariable1, true)
			end
		end
	end
})
MainTab.Main:AddSection("Streak Changer")
local Streak1 = MainTab.Main:AddDropdown("", {
	Title = "Streak1",
	Description = "Basically unlock all for streaks\nyou can give yourself streaks that you don\'t own\nReset after deploying to see effects",
	Values = {
		"Orbital Laser",
		"Radar",
		"Minigun",
		"Akimbo AA12s",
		"Hunter Drone",
		"Forcefield",
		"Sentry",
		"Launcher",
		"Nuke"
	},
	Multi = false,
	Default = 1
})
local Streak2 = MainTab.Main:AddDropdown("", {
	Title = "Streak2",
	Description = "Basically unlock all for streaks\nyou can give yourself streaks that you don\'t own\nReset after deploying to see effects",
	Values = {
		"Orbital Laser",
		"Radar",
		"Minigun",
		"Akimbo AA12s",
		"Hunter Drone",
		"Forcefield",
		"Sentry",
		"Launcher",
		"Nuke"
	},
	Multi = false,
	Default = 1
})
local Streak3 = MainTab.Main:AddDropdown("", {
	Title = "Streak3",
	Description = "Basically unlock all for streaks\nyou can give yourself streaks that you don\'t own\nReset after deploying to see effects",
	Values = {
		"Orbital Laser",
		"Radar",
		"Minigun",
		"Akimbo AA12s",
		"Hunter Drone",
		"Forcefield",
		"Sentry",
		"Launcher",
		"Nuke"
	},
	Multi = false,
	Default = 1
})
local Streak4 = MainTab.Main:AddDropdown("", {
	Title = "Streak4",
	Description = "Basically unlock all for streaks\nyou can give yourself streaks that you don\'t own\nReset after deploying to see effects",
	Values = {
		"Orbital Laser",
		"Radar",
		"Minigun",
		"Akimbo AA12s",
		"Hunter Drone",
		"Forcefield",
		"Sentry",
		"Launcher",
		"Nuke"
	},
	Multi = false,
	Default = 1
})
Streak1:OnChanged(function(Param7)
	if BooleanValue == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak1", Param7)
	end
end)
Streak2:OnChanged(function(Param8)
	if BooleanValue == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak2", Param8)
	end
end)
Streak3:OnChanged(function(Param9)
	if BooleanValue == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak3", Param9)
	end
end)
Streak4:OnChanged(function(Param10)
	if BooleanValue == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak4", Param10)
	end
end)
MainTab.GunMods:AddSection("Gun Mods")
MainTab.GunMods:AddButton({
	Title = "Infinite Ammo",
	Description = "ammo me 99999 (it works but it may be inconsistent).",
	Callback = function()
		local ScriptLoader = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
		local LocalPlayerScript = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
		local SearchCount = 2
		local SearchResult = ScriptLoader.searchClosure(LocalPlayerScript, "Unnamed function", SearchCount, {
			"Parent",
			"Name",
			"MGL",
			"Melee",
			2,
			"Variables"
		})
		local MaxResults = 999999
		if SearchResult == "?" then
			return FluentLoader:Notify({
				Title = "Error.",
				Content = "Failed to edit gun stats",
				SubContent = "",
				Duration = 5
			})
		end
		debug.setupvalue(SearchResult, SearchCount, MaxResults)
		task.wait(0.1)
		local ScriptLoader1 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
		local LocalPlayerScript1 = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
		local SearchLimit = 11
		local SearchResult1 = ScriptLoader1.searchClosure(LocalPlayerScript1, "Unnamed function", SearchLimit, {
			[1] = "Parent",
			[2] = "Name",
			[3] = "script",
			[5] = "Modifiers",
			[6] = "Offset",
			[7] = "Value"
		})
		local MaxResults1 = 999999
		if SearchResult1 == "?" then
			return FluentLoader:Notify({
				Title = "Error.",
				Content = "Failed to edit gun stats",
				SubContent = "",
				Duration = 5
			})
		end
		debug.setupvalue(SearchResult1, SearchLimit, MaxResults1)
	end
})
MainTab.GunMods:AddSlider("Slider", {
	Title = "FireRate",
	Description = "Change how fast your gun shoots. (might break gun if too high)",
	Default = 700,
	Min = 1,
	Max = 5000,
	Rounding = 0.1,
	Callback = function(Parameter)
		if IsMikeyHubOwned ~= true then
			FluentLoader:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		else
			local ScriptLoader2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
			local LocalPlayerScript2 = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
			local DataCount = 4
			local DataResult = ScriptLoader2.searchClosure(LocalPlayerScript2, "GatherWeaponData", DataCount, {
				"Animations",
				"FOV",
				"FindFirstChild",
				"Value",
				"NewSight",
				"NewSightLine"
			})
			if DataResult == "?" then
				return FluentLoader:Notify({
					Title = "Error.",
					Content = "Failed to edit gun stats",
					SubContent = "",
					Duration = 5
				})
			end
			debug.setupvalue(DataResult, DataCount, Parameter)
		end
	end
})
local PreviousValue = LocalPlayer
LocalPlayer.GetAttribute(PreviousValue, "Primary")
MainTab.GunMods:AddSection("Gun Skin")
local DropdownItem = MainTab.GunMods:AddDropdown("Dropdown", {
	Title = "Skin",
	Description = "",
	Values = {
		"Navy",
		"Wildfire",
		"Volcanic (Free)",
		"Ice",
		"Hearts",
		"Miami Tiger",
		"Damascus",
		"Gold",
		"Haptic",
		"Blackout",
		"Warrior",
		"Blossom",
		"Freedom",
		"Dark Matter"
	},
	Multi = false,
	Default = 1
})
local function Function1(Param1, Param2, Param3)
	local ViewModel = workspace:FindFirstChild("ViewModel")
	if ViewModel and ViewModel:FindFirstChild("Gun") then
		if false then
			FluentLoader:Notify({
				Title = "Error.",
				Content = "You must have any random camo in order to use this due to anticheat detections (recommended blue)",
				SubContent = "",
				Duration = 5
			})
		else
			local Child1, Child2, Child3 = ipairs(ViewModel.Gun:GetChildren())
			while true do
				local UnknownValue
				Child3, UnknownValue = Child1(Child2, Child3)
				if Child3 == nil then
					break
				end
				if UnknownValue:FindFirstChild("Camo") then
					UnknownValue.MaterialVariant = Param1
					if Param2 and Param2 ~= "" then
						UnknownValue.BrickColor = Param2
					end
					if Param3 and Param3 ~= "" then
						UnknownValue.Color = Param3
					end
				end
			end
		end
	else
		FluentLoader:Notify({
			Title = "Error.",
			Content = "You must be ingame in order to use this.",
			SubContent = "",
			Duration = 5
		})
	end
end
local EmptyString = ""
DropdownItem:OnChanged(function(Parameter1)
	EmptyString = Parameter1
end)
MainTab.GunMods:AddButton({
	Title = "Change Skin",
	Description = "Changes skin/camo to selected value in dropdown",
	Callback = function()
		if EmptyString ~= "" then
			if EmptyString ~= "Navy" then
				if EmptyString ~= "Wildfire" then
					if EmptyString ~= "Ice" then
						if EmptyString ~= "Hearts" then
							if EmptyString ~= "Miami Tiger" then
								if EmptyString ~= "Damascus" then
									if EmptyString ~= "Gold" then
										if EmptyString ~= "Haptic" then
											if EmptyString ~= "Blackout" then
												if EmptyString ~= "Blossom" then
													if EmptyString ~= "Warrior" then
														if EmptyString ~= "Freedom" then
															if EmptyString ~= "Dark Matter" then
																if EmptyString == "Volcanic (Free)" then
																	LocalPlayer:SetAttribute("PrimaryCamo", "Volcanic")
																	FluentLoader:Notify({
																		Title = "Success!",
																		Content = "Reset to see affects (if you have default camo equipped)",
																		SubContent = "",
																		Duration = 5
																	})
																end
															elseif IsMikeyHubOwned ~= true then
																FluentLoader:Notify({
																	Title = "Error.",
																	Content = "You Must Own Premium In Order To Use This.",
																	SubContent = "Join Our Discord To Buy MikeyHub.",
																	Duration = 5
																})
															else
																LocalPlayer:SetAttribute("PrimaryCamo", "Dark Matter")
																FluentLoader:Notify({
																	Title = "Success!",
																	Content = "Reset to see affects (if you have default camo equipped)",
																	SubContent = "",
																	Duration = 5
																})
															end
														elseif IsMikeyHubOwned ~= true then
															FluentLoader:Notify({
																Title = "Error.",
																Content = "You Must Own Premium In Order To Use This.",
																SubContent = "Join Our Discord To Buy MikeyHub.",
																Duration = 5
															})
														else
															local Camo1 = game:GetService("ReplicatedStorage").Camos.Freedom
															Function1("FreedomCamo", Camo1.BrickColor, Camo1.Color)
															LocalPlayer:SetAttribute("PrimaryCamo", "Freedom")
															FluentLoader:Notify({
																Title = "Success!",
																Content = "Reset to see affects (if you have default camo equipped)",
																SubContent = "",
																Duration = 5
															})
														end
													elseif IsMikeyHubOwned ~= true then
														FluentLoader:Notify({
															Title = "Error.",
															Content = "You Must Own Premium In Order To Use This.",
															SubContent = "Join Our Discord To Buy MikeyHub.",
															Duration = 5
														})
													else
														local Camo2 = game:GetService("ReplicatedStorage").Camos.Warrior
														Function1("CAMOWarrior", Camo2.BrickColor, Camo2.Color)
														LocalPlayer:SetAttribute("PrimaryCamo", "Warrior")
														FluentLoader:Notify({
															Title = "Success!",
															Content = "Reset to see affects (if you have default camo equipped)",
															SubContent = "",
															Duration = 5
														})
													end
												elseif IsMikeyHubOwned ~= true then
													FluentLoader:Notify({
														Title = "Error.",
														Content = "You Must Own Premium In Order To Use This.",
														SubContent = "Join Our Discord To Buy MikeyHub.",
														Duration = 5
													})
												else
													local Camo3 = game:GetService("ReplicatedStorage").Camos.Blossom
													Function1("BlossomCamo", Camo3.BrickColor, Camo3.Color)
													LocalPlayer:SetAttribute("PrimaryCamo", "Blossom")
													FluentLoader:Notify({
														Title = "Success!",
														Content = "Reset to see affects (if you have default camo equipped)",
														SubContent = "",
														Duration = 5
													})
												end
											elseif IsMikeyHubOwned ~= true then
												FluentLoader:Notify({
													Title = "Error.",
													Content = "You Must Own Premium In Order To Use This.",
													SubContent = "Join Our Discord To Buy MikeyHub.",
													Duration = 5
												})
											else
												local BlackoutCamo = game:GetService("MaterialService").BlackoutCamo
												Function1("BlackoutCamo", BlackoutCamo.BrickColor, BlackoutCamo.Color)
												LocalPlayer:SetAttribute("PrimaryCamo", "Blackout")
												FluentLoader:Notify({
													Title = "Success!",
													Content = "Reset to see affects (if you have default camo equipped)",
													SubContent = "",
													Duration = 5
												})
											end
										elseif IsMikeyHubOwned ~= true then
											FluentLoader:Notify({
												Title = "Error.",
												Content = "You Must Own Premium In Order To Use This.",
												SubContent = "Join Our Discord To Buy MikeyHub.",
												Duration = 5
											})
										else
											local Camo4 = game:GetService("ReplicatedStorage").Camos.Haptic
											Function1("HapticCamo", Camo4.BrickColor, Camo4.Color)
											LocalPlayer:SetAttribute("PrimaryCamo", "Haptic")
											FluentLoader:Notify({
												Title = "Success!",
												Content = "Reset to see affects (if you have default camo equipped)",
												SubContent = "",
												Duration = 5
											})
										end
									elseif IsMikeyHubOwned ~= true then
										FluentLoader:Notify({
											Title = "Error.",
											Content = "You Must Own Premium In Order To Use This.",
											SubContent = "Join Our Discord To Buy MikeyHub.",
											Duration = 5
										})
									else
										local Camo5 = game:GetService("ReplicatedStorage").Camos.Gold
										Function1("CAMOGoldMain", Camo5.BrickColor, Camo5.Color)
										LocalPlayer:SetAttribute("PrimaryCamo", "Gold")
										FluentLoader:Notify({
											Title = "Success!",
											Content = "Reset to see affects (if you have default camo equipped)",
											SubContent = "",
											Duration = 5
										})
									end
								elseif IsMikeyHubOwned ~= true then
									FluentLoader:Notify({
										Title = "Error.",
										Content = "You Must Own Premium In Order To Use This.",
										SubContent = "Join Our Discord To Buy MikeyHub.",
										Duration = 5
									})
								else
									local Camo6 = game:GetService("ReplicatedStorage").Camos.Damascus
									Function1("DamascusCamo", Camo6.BrickColor, Camo6.Color)
									LocalPlayer:SetAttribute("PrimaryCamo", "Damascus")
									FluentLoader:Notify({
										Title = "Success!",
										Content = "Reset to see affects (if you have default camo equipped)",
										SubContent = "",
										Duration = 5
									})
								end
							elseif IsMikeyHubOwned ~= true then
								FluentLoader:Notify({
									Title = "Error.",
									Content = "You Must Own Premium In Order To Use This.",
									SubContent = "Join Our Discord To Buy MikeyHub.",
									Duration = 5
								})
							else
								local Camo7 = game:GetService("ReplicatedStorage").Camos["Miami Tiger"]
								Function1("MiamiTigerCamo", Camo7.BrickColor, Camo7.Color)
								LocalPlayer:SetAttribute("PrimaryCamo", "Miami Tiger")
								FluentLoader:Notify({
									Title = "Success!",
									Content = "Reset to see affects (if you have default camo equipped)",
									SubContent = "",
									Duration = 5
								})
							end
						elseif IsMikeyHubOwned ~= true then
							FluentLoader:Notify({
								Title = "Error.",
								Content = "You Must Own Premium In Order To Use This.",
								SubContent = "Join Our Discord To Buy MikeyHub.",
								Duration = 5
							})
						else
							local Camo8 = game:GetService("ReplicatedStorage").Camos.Hearts
							Function1("CAMOHearts", Camo8.BrickColor, Camo8.Color)
							LocalPlayer:SetAttribute("PrimaryCamo", "Hearts")
							FluentLoader:Notify({
								Title = "Success!",
								Content = "Reset to see affects (if you have default camo equipped)",
								SubContent = "",
								Duration = 5
							})
						end
					else
						local Camo9 = game:GetService("ReplicatedStorage").Camos.Ice
						Function1("IceCamo", Camo9.BrickColor, Camo9.Color)
						LocalPlayer:SetAttribute("PrimaryCamo", "Ice")
						FluentLoader:Notify({
							Title = "Success!",
							Content = "Reset to see affects (if you have default camo equipped)",
							SubContent = "",
							Duration = 5
						})
					end
				else
					Function1("WildfireCamo")
					LocalPlayer:SetAttribute("PrimaryCamo", "Wildfire")
					FluentLoader:Notify({
						Title = "Success!",
						Content = "Reset to see affects (if you have default camo equipped)",
						SubContent = "",
						Duration = 5
					})
				end
			else
				Function1("NavyCamo")
				LocalPlayer:SetAttribute("PrimaryCamo", "Navy")
				FluentLoader:Notify({
					Title = "Success!",
					Content = "Reset to see affects (if you have default camo equipped)",
					SubContent = "",
					Duration = 5
				})
			end
		else
			FluentLoader:Notify({
				Title = "Error.",
				Content = "You must select a skin in order to use this.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
MainTab.GunMods:AddSection("Hit Sound")
local SoundOption = MainTab.GunMods:AddDropdown("Dropdown", {
	Title = "Sound",
	Description = "",
	Values = {
		"Default",
		"Minecraft",
		"Fortnite Shotgun"
	},
	Multi = false,
	Default = 1
})
local AudioSettings = {
	ArmHit = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex.Audio.UI.ArmHit,
	HeadHit = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex.Audio.UI.HeadHit,
	LegHit = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex.Audio.UI.LegHit,
	Lower = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex.Audio.UI.LowerTorsoHit,
	Upper = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex.Audio.UI.UpperTorsoHit,
	ArmHitUi = game:GetService("StarterPlayer").StarterPlayerScripts.Vortex.Audio.UI.ArmHit,
	HeadHitUi = game:GetService("StarterPlayer").StarterPlayerScripts.Vortex.Audio.UI.HeadHit,
	LegHitUi = game:GetService("StarterPlayer").StarterPlayerScripts.Vortex.Audio.UI.LegHit,
	LowerUi = game:GetService("StarterPlayer").StarterPlayerScripts.Vortex.Audio.UI.LowerTorsoHit,
	UpperUi = game:GetService("StarterPlayer").StarterPlayerScripts.Vortex.Audio.UI.UpperTorsoHit
}
local HudCheck = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("ArmHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck then
	HudCheck = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("ArmHit")
end
AudioSettings.ArmHitCode = HudCheck
local HudCheck1 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("HeadHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck1 then
	HudCheck1 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("HeadHit")
end
AudioSettings.HeadHitCode = HudCheck1
local HudCheck2 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("LegHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck2 then
	HudCheck2 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("LegHit")
end
AudioSettings.LegHitCode = HudCheck2
local HudCheck3 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("LowerTorsoHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck3 then
	HudCheck3 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("LowerTorsoHit")
end
AudioSettings.LowerCode = HudCheck3
local HudCheck4 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("UpperTorsoHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck4 then
	HudCheck4 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("UpperTorsoHit")
end
AudioSettings.UpperCode = HudCheck4
SoundOption:OnChanged(function(Param4)
	if Param4 == "Default" then
		AudioSettings.ArmHit.SoundId = "rbxassetid://6062254646"
		AudioSettings.HeadHit.SoundId = "rbxassetid://6062253602"
		AudioSettings.LegHit.SoundId = "rbxassetid://6062254394"
		AudioSettings.Lower.SoundId = "rbxassetid://6062254394"
		AudioSettings.Upper.SoundId = "rbxassetid://6062253829"
		AudioSettings.ArmHitUi.SoundId = "rbxassetid://6062254646"
		AudioSettings.HeadHitUi.SoundId = "rbxassetid://6062253602"
		AudioSettings.LegHit.SoundId = "rbxassetid://6062254394"
		AudioSettings.LowerUi.SoundId = "rbxassetid://6062254394"
		AudioSettings.UpperUi.SoundId = "rbxassetid://6062253829"
		AudioSettings.ArmHitCode.SoundId = "rbxassetid://6062254646"
		AudioSettings.HeadHitCode.SoundId = "rbxassetid://6062253602"
		AudioSettings.LegHitCode.SoundId = "rbxassetid://6062254394"
		AudioSettings.LowerCode.SoundId = "rbxassetid://6062254394"
		AudioSettings.UpperCode.SoundId = "rbxassetid://6062253829"
	elseif Param4 == "Minecraft" then
		local AudioKey, AudioValue, AudioPair = pairs(AudioSettings)
		while true do
			local UnknownValue1
			AudioPair, UnknownValue1 = AudioKey(AudioValue, AudioPair)
			if AudioPair == nil then
				break
			end
			UnknownValue1.SoundId = "rbxassetid://8766809464"
		end
	elseif Param4 == "Fortnite Shotgun" then
		local AudioKey1, AudioValue1, AudioPair1 = pairs(AudioSettings)
		while true do
			local UnknownValue2
			AudioPair1, UnknownValue2 = AudioKey1(AudioValue1, AudioPair1)
			if AudioPair1 == nil then
				break
			end
			UnknownValue2.SoundId = "rbxassetid://4804954860"
		end
	end
end)
MainTab.GunMods:AddInput("", {
	Title = "Custom Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(Param5)
		local AudioKey2, AudioValue2, AudioPair2 = pairs(AudioSettings)
		while true do
			local UnknownValue3
			AudioPair2, UnknownValue3 = AudioKey2(AudioValue2, AudioPair2)
			if AudioPair2 == nil then
				break
			end
			UnknownValue3.SoundId = "rbxassetid://" .. Param5
		end
	end
})
MainTab.GunMods:AddSection("Kill Sound")
local Settings = {}
local HudCheck5 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("Kill")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HudCheck5 then
	HudCheck5 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("Kill")
end
Settings.KillSound = HudCheck5
MainTab.GunMods:AddDropdown("Dropdown", {
	Title = "Sound",
	Description = "",
	Values = {
		"Default",
		"Bruh",
		"Dragon ball hit",
		"Among Us",
		"TFS",
		"UwU"
	},
	Multi = false,
	Default = 1
}):OnChanged(function(Param6)
	if Param6 == "Default" then
		Settings.KillSound.SoundId = "rbxassetid://2523782146"
	elseif Param6 == "Fortnite Down" then
		local SettingKey, SettingValue, SettingPair = pairs(Settings)
		while true do
			local UnknownValue4
			SettingPair, UnknownValue4 = SettingKey(SettingValue, SettingPair)
			if SettingPair == nil then
				break
			end
			UnknownValue4.SoundId = "rbxassetid://17771526755"
		end
	elseif Param6 == "Bruh" then
		local SettingKey1, SettingValue1, SettingPair1 = pairs(Settings)
		while true do
			local UnknownValue5
			SettingPair1, UnknownValue5 = SettingKey1(SettingValue1, SettingPair1)
			if SettingPair1 == nil then
				break
			end
			UnknownValue5.SoundId = "rbxassetid://7616380887"
		end
	elseif Param6 == "Dragon ball hit" then
		local SettingKey2, SettingValue2, SettingPair2 = pairs(Settings)
		while true do
			local UnknownValue6
			SettingPair2, UnknownValue6 = SettingKey2(SettingValue2, SettingPair2)
			if SettingPair2 == nil then
				break
			end
			UnknownValue6.SoundId = "rbxassetid://1058693352"
		end
	elseif Param6 == "Among Us" then
		local SettingKey3, SettingValue3, SettingPair3 = pairs(Settings)
		while true do
			local UnknownValue7
			SettingPair3, UnknownValue7 = SettingKey3(SettingValue3, SettingPair3)
			if SettingPair3 == nil then
				break
			end
			UnknownValue7.SoundId = "rbxassetid://7227567562"
		end
	elseif Param6 == "TFS" then
		local SettingKey4, SettingValue4, SettingPair4 = pairs(Settings)
		while true do
			local UnknownValue8
			SettingPair4, UnknownValue8 = SettingKey4(SettingValue4, SettingPair4)
			if SettingPair4 == nil then
				break
			end
			UnknownValue8.SoundId = "rbxassetid://6909256325"
		end
	elseif Param6 == "UwU" then
		local SettingKey5, SettingValue5, SettingPair5 = pairs(Settings)
		while true do
			local UnknownValue9
			SettingPair5, UnknownValue9 = SettingKey5(SettingValue5, SettingPair5)
			if SettingPair5 == nil then
				break
			end
			UnknownValue9.SoundId = "rbxassetid://8323804973"
		end
	end
end)
MainTab.GunMods:AddInput("", {
	Title = "Custom Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(Param7)
		local SettingKey6, SettingValue6, SettingPair6 = pairs(Settings)
		while true do
			local UnknownValue10
			SettingPair6, UnknownValue10 = SettingKey6(SettingValue6, SettingPair6)
			if SettingPair6 == nil then
				break
			end
			UnknownValue10.SoundId = "rbxassetid://" .. Param7
		end
	end
})
local BooleanValue = false
if BooleanValue then
	getfenv().getfenv = function()
		return setmetatable({}, {
			__index = function()
				return function()
					return true
				end
			end
		})
	end
end
game:GetService("HttpService")
local PlayersService = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameSettings = {
	Aimbot = false,
	OnePressAimingMode = false,
	AimMode = "Camera",
	SilentAimMethod = "Mouse.Hit / Mouse.Target",
	SilentAimChance = 100,
	OffAfterKill = false,
	AimKey = "RMB",
	AimPartDropdownValues = {
		"Head",
		"HumanoidRootPart"
	},
	AimPart = "HumanoidRootPart",
	RandomAimPart = false,
	UseOffset = false,
	OffsetType = "Static",
	StaticOffsetIncrement = 10,
	DynamicOffsetIncrement = 10,
	AutoOffset = false,
	MaxAutoOffset = 50,
	TeamCheck = false,
	FriendCheck = false,
	WallCheck = false,
	WaterCheck = false
}
local LocalPlayer = PlayersService.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local NilValue = nil
local MouseSensitivity = UserInputService.MouseDeltaSensitivity
local FalseValue = false
local FalseValue1 = false
local NilValue = nil
local NilValue1 = nil
local NilValue2 = nil
local CombatSection = UserInputService
NilValue2 = UserInputService.GetPropertyChangedSignal(CombatSection, "MouseDeltaSensitivity"):Connect(function()
	if NilValue then
		if not FalseValue or not BooleanValue and (getfenv().mousemoverel and GameSettings.AimMode == "Mouse" or getfenv().hookmetamethod and (getfenv().newcclosure and (getfenv().checkcaller and (getfenv().getnamecallmethod and GameSettings.AimMode == "Silent")))) then
			MouseSensitivity = UserInputService.MouseDeltaSensitivity
		end
	else
		NilValue2:Disconnect()
	end
end)
local AimbotConfig = MainTab.Combat:AddSection("Aimbot")
AimbotConfig:AddToggle("AimbotToggle", {
	Title = "Aimbot Toggle",
	Description = "Turns aimbot on/off",
	Default = GameSettings.Aimbot
}):OnChanged(function(Parameter1)
	GameSettings.Aimbot = Parameter1
end)
local AimKeybind = AimbotConfig:AddKeybind("AimKeybind", {
	Title = "Aimbot Key",
	Description = "Changes the key for aimbot",
	Default = GameSettings.AimKey,
	ChangedCallback = function(Parameter2)
		GameSettings.AimKey = Parameter2
	end
})
if AimKeybind.Value ~= "RMB" then
	GameSettings.AimKey = Enum.KeyCode[AimKeybind.Value]
else
	GameSettings.AimKey = Enum.UserInputType.MouseButton2
end
local AimPartDropdown = AimbotConfig:AddDropdown("AimPartDropdown", {
	Title = "Aimbot Part",
	Description = "Changes the aimbot part",
	Values = GameSettings.AimPartDropdownValues,
	Default = GameSettings.AimPart,
	Callback = function(Parameter3)
		GameSettings.AimPart = Parameter3
	end
})
task.spawn(function()
	while task.wait(1) and NilValue do
		if GameSettings.RandomAimPart and # GameSettings.AimPartDropdownValues > 0 then
			AimPartDropdown:SetValue(GameSettings.AimPartDropdownValues[Random.new():NextInteger(1, # GameSettings.AimPartDropdownValues)])
		end
	end
end)
local function LocalFunction1(Parameter4, Parameter5)
	FalseValue = Parameter4 and FalseValue or false
	NilValue = Parameter5 and NilValue or nil
	if NilValue1 then
		NilValue1:Cancel()
		NilValue1 = nil
	end
	UserInputService.MouseDeltaSensitivity = MouseSensitivity
end
local NilValue3 = nil
NilValue3 = UserInputService.InputBegan:Connect(function(Parameter6)
	if NilValue then
		if not UserInputService:GetFocusedTextBox() then
			if GameSettings.Aimbot and (Parameter6.KeyCode == GameSettings.AimKey or Parameter6.UserInputType == GameSettings.AimKey) then
				if FalseValue then
					LocalFunction1()
				else
					FalseValue = true
				end
			elseif GameSettings.TriggerBot and (Parameter6.KeyCode == GameSettings.TriggerKey or Parameter6.UserInputType == GameSettings.TriggerKey) then
				if FalseValue1 then
					FalseValue1 = false
				else
					FalseValue1 = true
				end
			end
		end
	else
		NilValue3:Disconnect()
	end
end)
local NilValue4 = nil
NilValue4 = UserInputService.InputEnded:Connect(function(Parameter7)
	if NilValue then
		if not UserInputService:GetFocusedTextBox() then
			if FalseValue and (not GameSettings.OnePressAimingMode and (Parameter7.KeyCode == GameSettings.AimKey or Parameter7.UserInputType == GameSettings.AimKey)) then
				LocalFunction1()
			elseif FalseValue1 and (not GameSettings.OnePressTriggeringMode and (Parameter7.KeyCode == GameSettings.TriggerKey or Parameter7.UserInputType == GameSettings.TriggerKey)) then
				FalseValue1 = false
			end
		end
	else
		NilValue4:Disconnect()
	end
end)
local function LocalFunction2(Parameter8, Parameter9, Parameter10)
	return typeof(Parameter8) == "Vector3" and typeof(Parameter9) == "Vector3" and (typeof(Parameter10) == "number" and (Parameter9 - Parameter8).Unit * Parameter10) or Vector3.zero
end
local function LocalFunction3(PlayerParameter)
	if not PlayerParameter or (not PlayerParameter:FindFirstChildWhichIsA("Humanoid") or (PlayerParameter:FindFirstChildWhichIsA("Humanoid").Health <= 0 or (PlayerParameter:FindFirstChildWhichIsA("ForceField") or not (GameSettings.AimPart and PlayerParameter:FindFirstChild(GameSettings.AimPart))))) or (not (PlayerParameter:FindFirstChild(GameSettings.AimPart):IsA("BasePart") and LocalPlayer.Character) or (not LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") or (LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health <= 0 or not (LocalPlayer.Character:FindFirstChild(GameSettings.AimPart) and LocalPlayer.Character:FindFirstChild(GameSettings.AimPart):IsA("BasePart"))))) then
		return false
	end
	local PlayerObject = PlayersService:GetPlayerFromCharacter(PlayerParameter)
	if not PlayerObject or PlayerObject == LocalPlayer then
		return false
	end
	local AimPart = PlayerParameter:FindFirstChild(GameSettings.AimPart)
	local CharacterPart = LocalPlayer.Character:FindFirstChild(GameSettings.AimPart)
	local PlayerCharacter = LocalPlayer
	if PlayerObject:GetAttribute("Team") == PlayerCharacter:GetAttribute("Team") then
		return false
	end
	if GameSettings.WallCheck then
		local VectorCalculation = LocalFunction2(CharacterPart.Position, AimPart.Position, (AimPart.Position - CharacterPart.Position).Magnitude)
		local RaycastParams = RaycastParams.new()
		RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
		RaycastParams.FilterDescendantsInstances = {
			LocalPlayer.Character
		}
		RaycastParams.IgnoreWater = not GameSettings.WaterCheck
		local RaycastResult = workspace:Raycast(CharacterPart.Position, VectorCalculation, RaycastParams)
		if not (RaycastResult and RaycastResult.Instance and RaycastResult.Instance:FindFirstAncestor(PlayerObject.Name)) then
			return false
		end
	end
	local OffsetVector = GameSettings.UseOffset and (GameSettings.AutoOffset and Vector3.new(0, AimPart.Position.Y * GameSettings.StaticOffsetIncrement * (AimPart.Position - CharacterPart.Position).Magnitude / 1000 <= GameSettings.MaxAutoOffset and AimPart.Position.Y * GameSettings.StaticOffsetIncrement * (AimPart.Position - CharacterPart.Position).Magnitude / 1000 or GameSettings.MaxAutoOffset, 0) + PlayerParameter:FindFirstChildWhichIsA("Humanoid").MoveDirection * GameSettings.DynamicOffsetIncrement / 10 or GameSettings.OffsetType == "Static" and Vector3.new(0, AimPart.Position.Y * GameSettings.StaticOffsetIncrement / 10, 0) or (GameSettings.OffsetType == "Dynamic" and PlayerParameter:FindFirstChildWhichIsA("Humanoid").MoveDirection * GameSettings.DynamicOffsetIncrement / 10 or Vector3.new(0, AimPart.Position.Y * GameSettings.StaticOffsetIncrement / 10, 0) + PlayerParameter:FindFirstChildWhichIsA("Humanoid").MoveDirection * GameSettings.DynamicOffsetIncrement / 10)) or Vector3.zero
	local NoiseVector = GameSettings.UseNoise and Vector3.new(Random.new():NextNumber(0.5, 1), Random.new():NextNumber(0.5, 1), Random.new():NextNumber(0.5, 1)) or Vector3.zero
	return true, PlayerParameter, {
		workspace.CurrentCamera:WorldToViewportPoint(AimPart.Position + OffsetVector + NoiseVector)
	}, AimPart.Position + OffsetVector + NoiseVector, (AimPart.Position + OffsetVector + NoiseVector - CharacterPart.Position).Magnitude, CFrame.new(AimPart.Position + OffsetVector + NoiseVector) * CFrame.fromEulerAnglesYXZ(math.rad(AimPart.Orientation.X), math.rad(AimPart.Orientation.Y), math.rad(AimPart.Orientation.Z)), AimPart
end
local Table1 = {}
local Table2 = {}
local function LocalFunction4(Parameter11)
	if Parameter11 and Table1[Parameter11] then
		Table1[Parameter11]:Disconnect()
		table.remove(Table1, Parameter11)
	end
end
local function LocalFunction5(Parameter12)
	if Parameter12 and Table2[Parameter12] then
		local NextValue = next
		local TableValue = Table2[Parameter12]
		local NilValue5 = nil
		while true do
			local UnusedValue
			NilValue5, UnusedValue = NextValue(TableValue, NilValue5)
			if NilValue5 == nil then
				break
			end
			UnusedValue:Disconnect()
		end
		table.remove(Table2, Parameter12)
	end
end
local function LocalFunction6()
	local NextValue1 = next
	local Table2Value = Table2
	local NilValue6 = nil
	while true do
		local UnusedValue1
		NilValue6, UnusedValue1 = NextValue1(Table2Value, NilValue6)
		if NilValue6 == nil then
			break
		end
		LocalFunction5(NilValue6)
	end
	local NextValue2 = next
	local Table1Value = Table1
	local NilValue7 = nil
	while true do
		local UnusedValue2
		NilValue7, UnusedValue2 = NextValue2(Table1Value, NilValue7)
		if NilValue7 == nil then
			break
		end
		LocalFunction4(NilValue7)
	end
end
local function LocalFunction7()
	LocalFunction1()
	FalseValue1 = false
	LocalFunction6()
end
local function LocalFunction8(Parameter13)
	if typeof(Parameter13) == "Instance" then
		PlayersService:GetPlayerFromCharacter(Parameter13)
	end
end
local function LocalFunction9(Parameter14)
	if typeof(Parameter14) == "Instance" then
		local NextValue3 = next
		local Table1Value1 = Table1
		local NilValue8 = nil
		while true do
			local UnusedValue3
			NilValue8, UnusedValue3 = NextValue3(Table1Value1, NilValue8)
			if NilValue8 == nil then
				break
			end
			if UnusedValue3.Character == Parameter14 then
				LocalFunction4(NilValue8)
			end
		end
	end
end
local function LocalFunction10()
	if not BooleanValue and getfenv().Drawing then
		local NextValue4 = next
		local PlayerList, PlayerList1 = PlayersService:GetPlayers()
		while true do
			local UnusedValue4
			PlayerList1, UnusedValue4 = NextValue4(PlayerList, PlayerList1)
			if PlayerList1 == nil then
				break
			end
			if UnusedValue4 ~= LocalPlayer and UnusedValue4.Character then
				LocalFunction8(UnusedValue4.Character)
				Table2[UnusedValue4.UserId] = {
					UnusedValue4.CharacterAdded:Connect(LocalFunction8),
					UnusedValue4.CharacterRemoving:Connect(LocalFunction9)
				}
			end
		end
	end
end
task.spawn(LocalFunction10)
local NilValue9 = nil
NilValue9 = LocalPlayer.OnTeleport:Connect(function()
	if BooleanValue or not (NilValue and getfenv().queue_on_teleport) then
		NilValue9:Disconnect()
	else
		getfenv().queue_on_teleport("getfenv().loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua\", true))()")
		NilValue9:Disconnect()
	end
end)
local NilValue10 = nil
NilValue10 = PlayersService.PlayerAdded:Connect(function(Parameter15)
	if BooleanValue or not (NilValue and getfenv().Drawing) then
		NilValue10:Disconnect()
	elseif Parameter15 ~= LocalPlayer then
		Table2[Parameter15.UserId] = {
			Parameter15.CharacterAdded:Connect(LocalFunction8),
			Parameter15.CharacterRemoving:Connect(LocalFunction9)
		}
	end
end)
local NilValue11 = nil
NilValue11 = PlayersService.PlayerRemoving:Connect(function(Parameter16)
	if NilValue then
		if Parameter16 ~= LocalPlayer then
			LocalFunction5(Parameter16.UserId)
			LocalFunction4(Parameter16.UserId)
		else
			NilValue:Destroy()
			LocalFunction7()
			NilValue11:Disconnect()
		end
	else
		NilValue11:Disconnect()
	end
end)
local NilValue12 = nil
NilValue12 = RunService.RenderStepped:Connect(function()
	if NilValue.Unloaded then
		NilValue = nil
		LocalFunction7()
		NilValue12:Disconnect()
	elseif GameSettings.Aimbot then
		if not GameSettings.TriggerBot then
			FalseValue1 = false
		end
	else
		LocalFunction1()
	end
	if FalseValue then
		local NilValue13 = NilValue
		local MaxValue = math.huge
		if not LocalFunction3(NilValue13) then
			if NilValue13 and not GameSettings.OffAfterKill or not NilValue13 then
				local NextValue5 = next
				local PlayerList2, PlayerList3 = PlayersService:GetPlayers()
				while true do
					local PlayerObject1
					PlayerList3, PlayerObject1 = NextValue5(PlayerList2, PlayerList3)
					if PlayerList3 == nil then
						break
					end
					local PlayerCharacter1, PlayerCharacter2, PlayerCharacter3 = LocalFunction3(PlayerObject1.Character)
					if PlayerCharacter1 and PlayerCharacter3[2] then
						local VectorMagnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(PlayerCharacter3[1].X, PlayerCharacter3[1].Y)).Magnitude
						if VectorMagnitude <= MaxValue then
							local UnusedValue5
							if GameSettings.FoVCheck then
								UnusedValue5 = GameSettings.FoVRadius or MaxValue
							else
								UnusedValue5 = MaxValue
							end
							if VectorMagnitude <= UnusedValue5 then
								NilValue = PlayerCharacter2
								MaxValue = VectorMagnitude
							end
						end
					end
				end
			else
				LocalFunction1()
			end
		end
		local LocalFunction11, UnusedParam, LocalFunction12, LocalFunction13 = LocalFunction3(NilValue)
		if LocalFunction11 then
			if BooleanValue or (not getfenv().mousemoverel or GameSettings.AimMode ~= "Mouse") then
				if GameSettings.AimMode == "Camera" then
					UserInputService.MouseDeltaSensitivity = 0
					if GameSettings.UseSensitivity then
						NilValue1 = TweenService:Create(workspace.CurrentCamera, TweenInfo.new(math.clamp(GameSettings.Sensitivity, 9, 99) / 100, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, LocalFunction13)
						})
						NilValue1:Play()
					else
						workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, LocalFunction13)
					end
				end
			elseif LocalFunction12[2] then
				LocalFunction1(true, true)
				local MouseLocation = UserInputService:GetMouseLocation()
				local SensitivityValue = GameSettings.UseSensitivity and GameSettings.Sensitivity / 10 or 10
				getfenv().mousemoverel((LocalFunction12[1].X - MouseLocation.X) / SensitivityValue, (LocalFunction12[1].Y - MouseLocation.Y) / SensitivityValue)
			else
				LocalFunction1(true)
			end
		else
			LocalFunction1(true)
		end
	end
end)
MainTab.Combat:AddSection("Hitbox Expander")
local DefaultValue1 = 5
local DefaultValue2 = 5
local DefaultValue3 = 1
local NilValue14 = nil
local TrueValue = true
local PartName = "HumanoidRootPart"
MainTab.Combat:AddSlider("", {
	Title = "HumanoidRootPart Hitbox Size",
	Description = "This is only if you have hitbox expander part on \nhumanoidrootpart",
	Default = 5,
	Min = 1,
	Max = 20,
	Rounding = 0.1,
	Callback = function(Parameter17)
		DefaultValue1 = Parameter17
	end
})
MainTab.Combat:AddSlider("", {
	Title = "Head Hitbox Size",
	Description = "This is only if you have hitbox expander part on \nhead",
	Default = 6,
	Min = 1,
	Max = 6,
	Rounding = 0.1,
	Callback = function(Parameter18)
		DefaultValue2 = Parameter18
	end
})
MainTab.Combat:AddToggle("", {
	Title = "Hitbox Visualizer",
	Description = "",
	Default = true,
	Callback = function(Parameter19)
		TrueValue = Parameter19
	end
})
MainTab.Combat:AddDropdown("HExpDrop", {
	Title = "Hitbox Expander Part",
	Description = "Changes the hitbox expander part.",
	Values = {
		"HumanoidRootPart",
		"Head"
	},
	Default = "HumanoidRootPart",
	Callback = function(Parameter20)
		PartName = Parameter20
	end
})
MainTab.Combat:AddToggle("", {
	Title = "Hitbox Expander",
	Description = "Reach but for guns?",
	Default = false,
	Callback = function(Parameter1)
		NilValue14 = Parameter1
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local function FunctionResult(Parameter2, Parameter3)
			local Descendant1, Descendant2, Descendant3 = ipairs(game:GetService("Workspace"):GetDescendants())
			while true do
				local Orb
				Descendant3, Orb = Descendant1(Descendant2, Descendant3)
				if Descendant3 == nil then
					break
				end
				if Orb:FindFirstChild("HumanoidRootPart") and Orb.Name ~= LocalPlayer.Name then
					local Player = game.Players:FindFirstChild(Orb.Name)
					if Player then
						local LocalPlayerAttribute = LocalPlayer
						if Player:GetAttribute("Team") ~= LocalPlayerAttribute:GetAttribute("Team") then
							if PartName ~= "HumanoidRootPart" then
								if PartName == "Head" then
									local Head = Orb:FindFirstChild("Head")
									if Head then
										if NilValue14 then
											if Head.Size ~= Vector3.new(DefaultValue2, DefaultValue2, DefaultValue2) then
												Head.Size = Vector3.new(DefaultValue2, DefaultValue2, DefaultValue2)
												Head.Transparency = Parameter3 and 0.5 or 1
												Head.CanCollide = false
											end
										else
											Head.Size = Vector3.new(1, 2, 1)
											Head.CanCollide = false
											Head.Transparency = 0
										end
									end
								end
							else
								local HumanoidRootPart = Orb.HumanoidRootPart
								if HumanoidRootPart then
									if NilValue14 then
										if HumanoidRootPart.Size ~= Vector3.new(Parameter2, Parameter2, Parameter2) then
											HumanoidRootPart.Size = Vector3.new(Parameter2, Parameter2, Parameter2)
											HumanoidRootPart.BrickColor = BrickColor.new("Really black")
											HumanoidRootPart.Transparency = Parameter3 and 0.5 or 1
											HumanoidRootPart.Material = "Neon"
										end
									else
										HumanoidRootPart.Size = Vector3.new(1, 2, 1)
										HumanoidRootPart.BrickColor = BrickColor.new("Really black")
										HumanoidRootPart.Transparency = Parameter3 and 0.5 or DefaultValue3
										HumanoidRootPart.Material = "Neon"
									end
								end
							end
						end
					end
				end
			end
		end
		while NilValue14 do
			while NilValue14 do
				FunctionResult(DefaultValue1, TrueValue)
				task.wait(0.1)
			end
			FunctionResult(2, false)
			FunctionResult(DefaultValue1, TrueValue)
			task.wait(0.1)
		end
	end
})
MainTab.Visuals:AddSection("ESP")
local Color1 = Color3.fromRGB(255, 255, 255)
local Color2 = Color3.fromRGB(255, 255, 255)
local Value1 = 0.5
local Value2 = 0.5
local LocalPlayerAttribute1 = game:GetService("Players").LocalPlayer
local ColorPicker1 = MainTab.Visuals:AddColorpicker("Colorpicker", {
	Title = "Fill Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local ColorPicker2 = MainTab.Visuals:AddColorpicker("Colorpicker", {
	Title = "Outline Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local ColorPicker1Value = ColorPicker1
ColorPicker1.OnChanged(ColorPicker1Value, function()
	Color1 = ColorPicker1.Value
end)
local ColorPicker2Value = ColorPicker2
ColorPicker2.OnChanged(ColorPicker2Value, function()
	Color2 = ColorPicker2.Value
end)
MainTab.Visuals:AddSlider("", {
	Title = "Outline Transparency",
	Description = "",
	Default = 0.5,
	Min = 0,
	Max = 0.9,
	Rounding = 1,
	Callback = function(Parameter4)
		Value1 = Parameter4
	end
})
MainTab.Visuals:AddSlider("", {
	Title = "Fill Transparency",
	Description = "",
	Default = 0.5,
	Min = 0,
	Max = 0.9,
	Rounding = 1,
	Callback = function(Parameter5)
		Value2 = Parameter5
	end
})
MainTab.Visuals:AddToggle("", {
	Title = "ESP",
	Description = "Highlights every player, allowing you to see them from afar.",
	Default = false,
	Callback = function(Parameter6)
		getgenv().enabled = Parameter6
		getgenv().filluseteamcolor = true
		getgenv().outlineuseteamcolor = true
		getgenv().fillcolor = Color1
		getgenv().outlinecolor = Color2
		getgenv().filltrans = Value2
		getgenv().outlinetrans = Value1
		local EspHolder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
		if enabled == false then
			EspHolder:Destroy()
		end
		if EspHolder.Name == "Folder" then
			EspHolder.Name = "ESPHolder"
			EspHolder.Parent = game.CoreGui
		end
		if uselocalplayer == false and EspHolder:FindFirstChild(game.Players.LocalPlayer.Name) then
			EspHolder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
		end
		if getgenv().enabled == true then
			getgenv().enabled = false
			getgenv().enabled = true
		end
		while getgenv().enabled do
			task.wait(0.5)
			local Descendant4, Descendant5, Descendant6 = ipairs(game:GetService("Workspace"):GetDescendants())
			while true do
				local Orb1
				Descendant6, Orb1 = Descendant4(Descendant5, Descendant6)
				if Descendant6 == nil then
					break
				end
				if Orb1:FindFirstChild("HumanoidRootPart") and Orb1.Name ~= LocalPlayer.Name then
					local Player1 = game.Players:FindFirstChild(Orb1.Name)
					if Player1 then
						local Highlight = EspHolder:FindFirstChild(Player1.Name) or Instance.new("Highlight")
						Highlight.Name = Player1.Name
						if uselocalplayer ~= false or Highlight.Name ~= game.Players.LocalPlayer.Name then
							Highlight.Parent = EspHolder
							local IsSameTeam = Player1:GetAttribute("Team") == game.Players.LocalPlayer:GetAttribute("Team")
							if filluseteamcolor then
								Highlight.FillColor = IsSameTeam and fillcolor or BrickColor.Red().Color
							else
								Highlight.FillColor = fillcolor
							end
							if outlineuseteamcolor then
								Highlight.OutlineColor = IsSameTeam and outlinecolor or BrickColor.Red().Color
							else
								Highlight.OutlineColor = outlinecolor
							end
							Highlight.FillTransparency = filltrans
							Highlight.OutlineTransparency = outlinetrans
							Highlight.Adornee = Orb1
							Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						end
					end
				end
			end
		end
	end
})
MainTab.Visuals:AddSection("World")
local Lighting = game:GetService("Lighting")
local Ambient = Lighting.Ambient
MainTab.Visuals:AddToggle("", {
	Title = "Full Bright",
	Description = "light up light up the world",
	Default = false,
	Callback = function(Parameter7)
		if Parameter7 == true then
			Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
			Lighting.ColorShift_Top = Color3.new(1, 1, 1)
		else
			Lighting.Ambient = Ambient
			Lighting.ColorShift_Bottom = Color3.new()
			Lighting.ColorShift_Top = Color3.new()
		end
	end
})
MainTab.Visuals:AddToggle("", {
	Title = "Night / Day",
	Description = "Changes the time to night.",
	Default = false,
	Callback = function(Parameter8)
		if Parameter8 == true then
			Lighting.ClockTime = 0
		else
			Lighting.ClockTime = 14
		end
	end
})
MainTab.Misc:AddSection("Main")
MainTab.Misc:AddButton({
	Title = "Force Reset",
	Description = "If you wanna live, don\'t use this lol",
	Callback = function()
		LocalPlayer.Character.Humanoid.Health = 0
	end
})
MainTab.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "Rejoins the game you\'re currently in.",
	Callback = function()
		local TeleportService = game:GetService("TeleportService")
		local LocalPlayer1 = game:GetService("Players").LocalPlayer
		TeleportService:Teleport(game.PlaceId, LocalPlayer1)
	end
})
local Attribute = LocalPlayer
local AttributeValue = LocalPlayer.GetAttribute(Attribute, "Primary")
MainTab.Misc:AddSlider("Slider", {
	Title = "Gun AimIn FOV",
	Description = "Change your gun aimin/zoomin fov, could be useful for aiming\nReset to see affects.",
	Default = game:GetService("ReplicatedStorage").Weapons[AttributeValue].FOV.Value or 50,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(Parameter9)
		local PrimaryAttribute = LocalPlayer:GetAttribute("Primary")
		if game:GetService("ReplicatedStorage").Weapons:FindFirstChild(PrimaryAttribute) then
			local Weapon = game:GetService("ReplicatedStorage").Weapons[PrimaryAttribute]
			if game:GetService("ReplicatedStorage").Weapons[PrimaryAttribute]:FindFirstChild("FOV") then
				game:GetService("ReplicatedStorage").Weapons[PrimaryAttribute]:FindFirstChild("FOV").Value = Parameter9
			else
				NilValue:Notify({
					Title = "Error.",
					Content = "Couldn\'t find your gun, please try again.",
					SubContent = "",
					Duration = 5
				})
			end
		end
	end
})
MainTab.Misc:AddSection("Misc Sound Changers")
local Table1 = {}
local SoundName = "NukeSound"
local HasHud = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("NukeIncoming")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if HasHud then
	HasHud = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("NukeIncoming")
end
Table1[SoundName] = HasHud
MainTab.Misc:AddInput("", {
	Title = "Nuke Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(Parameter10)
		local Key, Value, Pair = pairs(Table1)
		while true do
			local Variable
			Pair, Variable = Key(Value, Pair)
			if Pair == nil then
				break
			end
			Variable.SoundId = "rbxassetid://" .. Parameter10
		end
	end
})
MainWindow:SelectTab(1)
