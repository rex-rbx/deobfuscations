local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local vu14 = true
local v23 = "MikeyHub [ CRACKED ]"
local vu26 = vu1:CreateWindow({
	Title = v23,
	SubTitle = "- cracked by rex-rbx",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightShift
})
local v45 = {
	Main = vu26:AddTab({
		Title = "| Main",
		Icon = "home"
	}),
	Combat = vu26:AddTab({
		Title = "| Combat",
		Icon = "swords"
	}),
	GunMods = vu26:AddTab({
		Title = "| Gun Mods",
		Icon = "crosshair"
	}),
	Visuals = vu26:AddTab({
		Title = "| Visuals",
		Icon = "eye"
	}),
	Misc = vu26:AddTab({
		Title = "| Misc",
		Icon = "circle-ellipsis"
	})
}
local _ = vu1.Options
v45.Main:AddSection("Give/Unlock Items")
local v47 = {}
if vu38.Backpack then
	local v48, v49, v50 = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local v51, v52 = v48(v49, v50)
		if v51 == nil then
			break
		end
		v50 = v51
		if v52.Name ~= "M16A1" and (v52.Name ~= "Fisticuffs" and (v52.Name ~= "Diamond Back" and (v52.Name ~= "Tanto" and (v52.Name ~= "Karambit" and (v52.Name ~= "TT30" and (v52.Name ~= "Mk PM" and (v52.Name ~= "PPK" and (v52.Name ~= "M1911" and (v52.Name ~= "Model 39" and (v52.Name ~= "Python" and (v52.Name ~= "Mauser C96" and (v52.Name ~= "Akimbo G40" and (v52.Name ~= "Akimbo Deagle" and (v52.Name ~= "P08 Luger" and v52.Name ~= "Big Iron")))))))))))))) then
			table.insert(v47, v52.Name)
		end
	end
end
local vu53 = nil
v45.Main:AddDropdown("", {
	Title = "Gun",
	Description = "the gun you want to spawn in with\nONLY FAL IS FREE",
	Values = v47,
	Multi = false,
	Default = 1
}):OnChanged(function(p54)
	vu53 = p54
end)
v45.Main:AddButton({
	Title = "Give Gun",
	Description = "Gives you the gun you selected (deploy to see effects, also saves)\nFAL IS FREE",
	Callback = function()
		if vu14 == true or vu53 == "FAL" then
			game:GetService("Players").LocalPlayer:SetAttribute("Primary", vu53)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		end
	end
})
local v55 = {}
if vu38.Backpack then
	local v56, v57, v58 = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local v59, v60 = v56(v57, v58)
		if v59 == nil then
			break
		end
		v58 = v59
		if v60.Name == "Mk PM" or (v60.Name == "PPK" or (v60.Name == "M1911" or (v60.Name == "Model 39" or (v60.Name == "Python" or (v60.Name == "Mauser C96" or (v60.Name == "Akimbo G40" or (v60.Name == "Akimbo Deagle" or (v60.Name == "P08 Luger" or v60.Name == "Big Iron")))))))) then
			table.insert(v55, v60.Name)
		end
	end
end
local vu61 = nil
v45.Main:AddDropdown("", {
	Title = "Secondary Gun",
	Description = "the gun you want to spawn in with",
	Values = v55,
	Multi = false,
	Default = 1
}):OnChanged(function(p62)
	vu61 = p62
end)
v45.Main:AddButton({
	Title = "Give Secondary Gun",
	Description = "Gives you the gun you selected (deploy to see effects, also saves)\nOnly Python And Mauser Is Premium",
	Callback = function()
		if vu61 ~= "Python" or vu61 ~= "Mauser C96" then
			game:GetService("Players").LocalPlayer:SetAttribute("Secondary", vu61)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This (Other Secondarys Are Free).",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		end
	end
})
local v63 = {}
if vu38.Backpack then
	local v64, v65, v66 = pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren())
	while true do
		local v67, v68 = v64(v65, v66)
		if v67 == nil then
			break
		end
		v66 = v67
		local v69 = v68
		if v68.Name == "Combat Knife" or (v68.Name == "Diamond Back" or (v68.Name == "Tanto" or v68.Name == "Karambit")) then
			table.insert(v63, v69.Name)
		end
	end
end
local vu70 = nil
v45.Main:AddDropdown("", {
	Title = "Melee",
	Description = "the melee you want to spawn in with",
	Values = v63,
	Multi = false,
	Default = 1
}):OnChanged(function(p71)
	vu70 = p71
end)
v45.Main:AddButton({
	Title = "Give Melee",
	Description = "Gives you the melee you selected (deploy to see effects, also saves)\nAll Melees Are Free",
	Callback = function()
		game:GetService("Players").LocalPlayer:SetAttribute("Melee", vu70)
	end
})
v45.Main:AddSection("Player")
local vu72 = nil
infJumpDebounce = false
v45.Main:AddToggle("", {
	Title = "Infinite Jump",
	Description = "jump jump jump",
	Default = false,
	Callback = function(p73)
		if p73 == true then
			vu72 = vu35.JumpRequest:Connect(function()
				if not infJumpDebounce then
					infJumpDebounce = true
					vu38.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
					wait()
					infJumpDebounce = false
				end
			end)
		else
			if vu72 then
				vu72:Disconnect()
			end
			infJumpDebounce = false
		end
	end
})
local vu74 = game:GetService("RunService")
swimming = false
local vu75 = workspace.Gravity
local vu76 = nil
v45.Main:AddToggle("", {
	Title = "Air Swim",
	Description = "Allows you to swim in the air.",
	Default = false,
	Callback = function(p77)
		if p77 == true then
			if not swimming and (vu38 and vu38.Character) and vu38.Character:FindFirstChildWhichIsA("Humanoid") then
				vu75 = workspace.Gravity
				workspace.Gravity = 0
				local function v78()
					workspace.Gravity = vu75
					swimming = false
				end
				local vu79 = vu38.Character:FindFirstChildWhichIsA("Humanoid")
				gravReset = vu79.Died:Connect(v78)
				local v80 = Enum.HumanoidStateType:GetEnumItems()
				table.remove(v80, table.find(v80, Enum.HumanoidStateType.None))
				local v81, v82, v83 = pairs(v80)
				while true do
					local v84
					v83, v84 = v81(v82, v83)
					if v83 == nil then
						break
					end
					vu79:SetStateEnabled(v84, false)
				end
				vu79:ChangeState(Enum.HumanoidStateType.Swimming)
				vu76 = vu74.Heartbeat:Connect(function()
					pcall(function()
						vu38.Character.HumanoidRootPart.Velocity = (vu79.MoveDirection ~= Vector3.new() or vu35:IsKeyDown(Enum.KeyCode.Space)) and vu38.Character.HumanoidRootPart.Velocity or Vector3.new()
					end)
				end)
				swimming = true
			end
		elseif vu38 and vu38.Character and vu38.Character:FindFirstChildWhichIsA("Humanoid") then
			workspace.Gravity = vu75
			swimming = false
			if gravReset then
				gravReset:Disconnect()
			end
			if vu76 ~= nil then
				vu76:Disconnect()
				vu76 = nil
			end
			local v85 = vu38.Character:FindFirstChildWhichIsA("Humanoid")
			local v86 = Enum.HumanoidStateType:GetEnumItems()
			table.remove(v86, table.find(v86, Enum.HumanoidStateType.None))
			local v87, v88, v89 = pairs(v86)
			while true do
				local v90
				v89, v90 = v87(v88, v89)
				if v89 == nil then
					break
				end
				v85:SetStateEnabled(v90, true)
			end
		end
	end
})
v45.Main:AddSection("Streak Changer")
local v91 = v45.Main:AddDropdown("", {
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
local v92 = v45.Main:AddDropdown("", {
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
local v93 = v45.Main:AddDropdown("", {
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
local v94 = v45.Main:AddDropdown("", {
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
v91:OnChanged(function(p95)
	if vu46 == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak1", p95)
	end
end)
v92:OnChanged(function(p96)
	if vu46 == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak2", p96)
	end
end)
v93:OnChanged(function(p97)
	if vu46 == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak3", p97)
	end
end)
v94:OnChanged(function(p98)
	if vu46 == true then
		game:GetService("Players").LocalPlayer:SetAttribute("Streak4", p98)
	end
end)
v45.GunMods:AddSection("Gun Mods")
v45.GunMods:AddButton({
	Title = "Infinite Ammo",
	Description = "ammo me 99999 (it works but it may be inconsistent).",
	Callback = function()
		local v99 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
		local v100 = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
		local v101 = 2
		local v102 = v99.searchClosure(v100, "Unnamed function", v101, {
			"Parent",
			"Name",
			"MGL",
			"Melee",
			2,
			"Variables"
		})
		local v103 = 999999
		if v102 == "?" then
			return vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit gun stats",
				SubContent = "",
				Duration = 5
			})
		end
		debug.setupvalue(v102, v101, v103)
		task.wait(0.1)
		local v104 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
		local v105 = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
		local v106 = 11
		local v107 = v104.searchClosure(v105, "Unnamed function", v106, {
			[1] = "Parent",
			[2] = "Name",
			[3] = "script",
			[5] = "Modifiers",
			[6] = "Offset",
			[7] = "Value"
		})
		local v108 = 999999
		if v107 == "?" then
			return vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit gun stats",
				SubContent = "",
				Duration = 5
			})
		end
		debug.setupvalue(v107, v106, v108)
	end
})
v45.GunMods:AddSlider("Slider", {
	Title = "FireRate",
	Description = "Change how fast your gun shoots. (might break gun if too high)",
	Default = 700,
	Min = 1,
	Max = 5000,
	Rounding = 0.1,
	Callback = function(p109)
		if vu14 ~= true then
			vu1:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		else
			local v110 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
			local v111 = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
			local v112 = 4
			local v113 = v110.searchClosure(v111, "GatherWeaponData", v112, {
				"Animations",
				"FOV",
				"FindFirstChild",
				"Value",
				"NewSight",
				"NewSightLine"
			})
			if v113 == "?" then
				return vu1:Notify({
					Title = "Error.",
					Content = "Failed to edit gun stats",
					SubContent = "",
					Duration = 5
				})
			end
			debug.setupvalue(v113, v112, p109)
		end
	end
})
local v114 = vu38
vu38.GetAttribute(v114, "Primary")
v45.GunMods:AddSection("Gun Skin")
local v115 = v45.GunMods:AddDropdown("Dropdown", {
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
local function vu124(p116, p117, p118)
	local v119 = workspace:FindFirstChild("ViewModel")
	if v119 and v119:FindFirstChild("Gun") then
		if false then
			vu1:Notify({
				Title = "Error.",
				Content = "You must have any random camo in order to use this due to anticheat detections (recommended blue)",
				SubContent = "",
				Duration = 5
			})
		else
			local v120, v121, v122 = ipairs(v119.Gun:GetChildren())
			while true do
				local v123
				v122, v123 = v120(v121, v122)
				if v122 == nil then
					break
				end
				if v123:FindFirstChild("Camo") then
					v123.MaterialVariant = p116
					if p117 and p117 ~= "" then
						v123.BrickColor = p117
					end
					if p118 and p118 ~= "" then
						v123.Color = p118
					end
				end
			end
		end
	else
		vu1:Notify({
			Title = "Error.",
			Content = "You must be ingame in order to use this.",
			SubContent = "",
			Duration = 5
		})
	end
end
local vu125 = ""
v115:OnChanged(function(p126)
	vu125 = p126
end)
v45.GunMods:AddButton({
	Title = "Change Skin",
	Description = "Changes skin/camo to selected value in dropdown",
	Callback = function()
		if vu125 ~= "" then
			if vu125 ~= "Navy" then
				if vu125 ~= "Wildfire" then
					if vu125 ~= "Ice" then
						if vu125 ~= "Hearts" then
							if vu125 ~= "Miami Tiger" then
								if vu125 ~= "Damascus" then
									if vu125 ~= "Gold" then
										if vu125 ~= "Haptic" then
											if vu125 ~= "Blackout" then
												if vu125 ~= "Blossom" then
													if vu125 ~= "Warrior" then
														if vu125 ~= "Freedom" then
															if vu125 ~= "Dark Matter" then
																if vu125 == "Volcanic (Free)" then
																	vu38:SetAttribute("PrimaryCamo", "Volcanic")
																	vu1:Notify({
																		Title = "Success!",
																		Content = "Reset to see affects (if you have default camo equipped)",
																		SubContent = "",
																		Duration = 5
																	})
																end
															elseif vu14 ~= true then
																vu1:Notify({
																	Title = "Error.",
																	Content = "You Must Own Premium In Order To Use This.",
																	SubContent = "Join Our Discord To Buy MikeyHub.",
																	Duration = 5
																})
															else
																vu38:SetAttribute("PrimaryCamo", "Dark Matter")
																vu1:Notify({
																	Title = "Success!",
																	Content = "Reset to see affects (if you have default camo equipped)",
																	SubContent = "",
																	Duration = 5
																})
															end
														elseif vu14 ~= true then
															vu1:Notify({
																Title = "Error.",
																Content = "You Must Own Premium In Order To Use This.",
																SubContent = "Join Our Discord To Buy MikeyHub.",
																Duration = 5
															})
														else
															local v127 = game:GetService("ReplicatedStorage").Camos.Freedom
															vu124("FreedomCamo", v127.BrickColor, v127.Color)
															vu38:SetAttribute("PrimaryCamo", "Freedom")
															vu1:Notify({
																Title = "Success!",
																Content = "Reset to see affects (if you have default camo equipped)",
																SubContent = "",
																Duration = 5
															})
														end
													elseif vu14 ~= true then
														vu1:Notify({
															Title = "Error.",
															Content = "You Must Own Premium In Order To Use This.",
															SubContent = "Join Our Discord To Buy MikeyHub.",
															Duration = 5
														})
													else
														local v128 = game:GetService("ReplicatedStorage").Camos.Warrior
														vu124("CAMOWarrior", v128.BrickColor, v128.Color)
														vu38:SetAttribute("PrimaryCamo", "Warrior")
														vu1:Notify({
															Title = "Success!",
															Content = "Reset to see affects (if you have default camo equipped)",
															SubContent = "",
															Duration = 5
														})
													end
												elseif vu14 ~= true then
													vu1:Notify({
														Title = "Error.",
														Content = "You Must Own Premium In Order To Use This.",
														SubContent = "Join Our Discord To Buy MikeyHub.",
														Duration = 5
													})
												else
													local v129 = game:GetService("ReplicatedStorage").Camos.Blossom
													vu124("BlossomCamo", v129.BrickColor, v129.Color)
													vu38:SetAttribute("PrimaryCamo", "Blossom")
													vu1:Notify({
														Title = "Success!",
														Content = "Reset to see affects (if you have default camo equipped)",
														SubContent = "",
														Duration = 5
													})
												end
											elseif vu14 ~= true then
												vu1:Notify({
													Title = "Error.",
													Content = "You Must Own Premium In Order To Use This.",
													SubContent = "Join Our Discord To Buy MikeyHub.",
													Duration = 5
												})
											else
												local v130 = game:GetService("MaterialService").BlackoutCamo
												vu124("BlackoutCamo", v130.BrickColor, v130.Color)
												vu38:SetAttribute("PrimaryCamo", "Blackout")
												vu1:Notify({
													Title = "Success!",
													Content = "Reset to see affects (if you have default camo equipped)",
													SubContent = "",
													Duration = 5
												})
											end
										elseif vu14 ~= true then
											vu1:Notify({
												Title = "Error.",
												Content = "You Must Own Premium In Order To Use This.",
												SubContent = "Join Our Discord To Buy MikeyHub.",
												Duration = 5
											})
										else
											local v131 = game:GetService("ReplicatedStorage").Camos.Haptic
											vu124("HapticCamo", v131.BrickColor, v131.Color)
											vu38:SetAttribute("PrimaryCamo", "Haptic")
											vu1:Notify({
												Title = "Success!",
												Content = "Reset to see affects (if you have default camo equipped)",
												SubContent = "",
												Duration = 5
											})
										end
									elseif vu14 ~= true then
										vu1:Notify({
											Title = "Error.",
											Content = "You Must Own Premium In Order To Use This.",
											SubContent = "Join Our Discord To Buy MikeyHub.",
											Duration = 5
										})
									else
										local v132 = game:GetService("ReplicatedStorage").Camos.Gold
										vu124("CAMOGoldMain", v132.BrickColor, v132.Color)
										vu38:SetAttribute("PrimaryCamo", "Gold")
										vu1:Notify({
											Title = "Success!",
											Content = "Reset to see affects (if you have default camo equipped)",
											SubContent = "",
											Duration = 5
										})
									end
								elseif vu14 ~= true then
									vu1:Notify({
										Title = "Error.",
										Content = "You Must Own Premium In Order To Use This.",
										SubContent = "Join Our Discord To Buy MikeyHub.",
										Duration = 5
									})
								else
									local v133 = game:GetService("ReplicatedStorage").Camos.Damascus
									vu124("DamascusCamo", v133.BrickColor, v133.Color)
									vu38:SetAttribute("PrimaryCamo", "Damascus")
									vu1:Notify({
										Title = "Success!",
										Content = "Reset to see affects (if you have default camo equipped)",
										SubContent = "",
										Duration = 5
									})
								end
							elseif vu14 ~= true then
								vu1:Notify({
									Title = "Error.",
									Content = "You Must Own Premium In Order To Use This.",
									SubContent = "Join Our Discord To Buy MikeyHub.",
									Duration = 5
								})
							else
								local v134 = game:GetService("ReplicatedStorage").Camos["Miami Tiger"]
								vu124("MiamiTigerCamo", v134.BrickColor, v134.Color)
								vu38:SetAttribute("PrimaryCamo", "Miami Tiger")
								vu1:Notify({
									Title = "Success!",
									Content = "Reset to see affects (if you have default camo equipped)",
									SubContent = "",
									Duration = 5
								})
							end
						elseif vu14 ~= true then
							vu1:Notify({
								Title = "Error.",
								Content = "You Must Own Premium In Order To Use This.",
								SubContent = "Join Our Discord To Buy MikeyHub.",
								Duration = 5
							})
						else
							local v135 = game:GetService("ReplicatedStorage").Camos.Hearts
							vu124("CAMOHearts", v135.BrickColor, v135.Color)
							vu38:SetAttribute("PrimaryCamo", "Hearts")
							vu1:Notify({
								Title = "Success!",
								Content = "Reset to see affects (if you have default camo equipped)",
								SubContent = "",
								Duration = 5
							})
						end
					else
						local v136 = game:GetService("ReplicatedStorage").Camos.Ice
						vu124("IceCamo", v136.BrickColor, v136.Color)
						vu38:SetAttribute("PrimaryCamo", "Ice")
						vu1:Notify({
							Title = "Success!",
							Content = "Reset to see affects (if you have default camo equipped)",
							SubContent = "",
							Duration = 5
						})
					end
				else
					vu124("WildfireCamo")
					vu38:SetAttribute("PrimaryCamo", "Wildfire")
					vu1:Notify({
						Title = "Success!",
						Content = "Reset to see affects (if you have default camo equipped)",
						SubContent = "",
						Duration = 5
					})
				end
			else
				vu124("NavyCamo")
				vu38:SetAttribute("PrimaryCamo", "Navy")
				vu1:Notify({
					Title = "Success!",
					Content = "Reset to see affects (if you have default camo equipped)",
					SubContent = "",
					Duration = 5
				})
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "You must select a skin in order to use this.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v45.GunMods:AddSection("Hit Sound")
local v137 = v45.GunMods:AddDropdown("Dropdown", {
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
local vu138 = {
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
local v139 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("ArmHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v139 then
	v139 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("ArmHit")
end
vu138.ArmHitCode = v139
local v140 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("HeadHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v140 then
	v140 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("HeadHit")
end
vu138.HeadHitCode = v140
local v141 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("LegHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v141 then
	v141 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("LegHit")
end
vu138.LegHitCode = v141
local v142 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("LowerTorsoHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v142 then
	v142 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("LowerTorsoHit")
end
vu138.LowerCode = v142
local v143 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("UpperTorsoHit")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v143 then
	v143 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("UpperTorsoHit")
end
vu138.UpperCode = v143
v137:OnChanged(function(p144)
	if p144 == "Default" then
		vu138.ArmHit.SoundId = "rbxassetid://6062254646"
		vu138.HeadHit.SoundId = "rbxassetid://6062253602"
		vu138.LegHit.SoundId = "rbxassetid://6062254394"
		vu138.Lower.SoundId = "rbxassetid://6062254394"
		vu138.Upper.SoundId = "rbxassetid://6062253829"
		vu138.ArmHitUi.SoundId = "rbxassetid://6062254646"
		vu138.HeadHitUi.SoundId = "rbxassetid://6062253602"
		vu138.LegHit.SoundId = "rbxassetid://6062254394"
		vu138.LowerUi.SoundId = "rbxassetid://6062254394"
		vu138.UpperUi.SoundId = "rbxassetid://6062253829"
		vu138.ArmHitCode.SoundId = "rbxassetid://6062254646"
		vu138.HeadHitCode.SoundId = "rbxassetid://6062253602"
		vu138.LegHitCode.SoundId = "rbxassetid://6062254394"
		vu138.LowerCode.SoundId = "rbxassetid://6062254394"
		vu138.UpperCode.SoundId = "rbxassetid://6062253829"
	elseif p144 == "Minecraft" then
		local v145, v146, v147 = pairs(vu138)
		while true do
			local v148
			v147, v148 = v145(v146, v147)
			if v147 == nil then
				break
			end
			v148.SoundId = "rbxassetid://8766809464"
		end
	elseif p144 == "Fortnite Shotgun" then
		local v149, v150, v151 = pairs(vu138)
		while true do
			local v152
			v151, v152 = v149(v150, v151)
			if v151 == nil then
				break
			end
			v152.SoundId = "rbxassetid://4804954860"
		end
	end
end)
v45.GunMods:AddInput("", {
	Title = "Custom Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(p153)
		local v154, v155, v156 = pairs(vu138)
		while true do
			local v157
			v156, v157 = v154(v155, v156)
			if v156 == nil then
				break
			end
			v157.SoundId = "rbxassetid://" .. p153
		end
	end
})
v45.GunMods:AddSection("Kill Sound")
local vu158 = {}
local v159 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("Kill")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v159 then
	v159 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("Kill")
end
vu158.KillSound = v159
v45.GunMods:AddDropdown("Dropdown", {
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
}):OnChanged(function(p160)
	if p160 == "Default" then
		vu158.KillSound.SoundId = "rbxassetid://2523782146"
	elseif p160 == "Fortnite Down" then
		local v161, v162, v163 = pairs(vu158)
		while true do
			local v164
			v163, v164 = v161(v162, v163)
			if v163 == nil then
				break
			end
			v164.SoundId = "rbxassetid://17771526755"
		end
	elseif p160 == "Bruh" then
		local v165, v166, v167 = pairs(vu158)
		while true do
			local v168
			v167, v168 = v165(v166, v167)
			if v167 == nil then
				break
			end
			v168.SoundId = "rbxassetid://7616380887"
		end
	elseif p160 == "Dragon ball hit" then
		local v169, v170, v171 = pairs(vu158)
		while true do
			local v172
			v171, v172 = v169(v170, v171)
			if v171 == nil then
				break
			end
			v172.SoundId = "rbxassetid://1058693352"
		end
	elseif p160 == "Among Us" then
		local v173, v174, v175 = pairs(vu158)
		while true do
			local v176
			v175, v176 = v173(v174, v175)
			if v175 == nil then
				break
			end
			v176.SoundId = "rbxassetid://7227567562"
		end
	elseif p160 == "TFS" then
		local v177, v178, v179 = pairs(vu158)
		while true do
			local v180
			v179, v180 = v177(v178, v179)
			if v179 == nil then
				break
			end
			v180.SoundId = "rbxassetid://6909256325"
		end
	elseif p160 == "UwU" then
		local v181, v182, v183 = pairs(vu158)
		while true do
			local v184
			v183, v184 = v181(v182, v183)
			if v183 == nil then
				break
			end
			v184.SoundId = "rbxassetid://8323804973"
		end
	end
end)
v45.GunMods:AddInput("", {
	Title = "Custom Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(p185)
		local v186, v187, v188 = pairs(vu158)
		while true do
			local v189
			v188, v189 = v186(v187, v188)
			if v188 == nil then
				break
			end
			v189.SoundId = "rbxassetid://" .. p185
		end
	end
})
local vu190 = false
if vu190 then
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
local vu191 = game:GetService("Players")
local vu192 = game:GetService("UserInputService")
local v193 = game:GetService("RunService")
local vu194 = game:GetService("TweenService")
local vu195 = {
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
local vu196 = vu191.LocalPlayer
local vu197 = vu196:GetMouse()
local vu198 = nil
local vu199 = vu192.MouseDeltaSensitivity
local vu200 = false
local vu201 = false
local vu202 = nil
local vu203 = nil
local vu204 = nil
local v205 = vu192
vu204 = vu192.GetPropertyChangedSignal(v205, "MouseDeltaSensitivity"):Connect(function()
	if vu198 then
		if not vu200 or not vu190 and (getfenv().mousemoverel and vu195.AimMode == "Mouse" or getfenv().hookmetamethod and (getfenv().newcclosure and (getfenv().checkcaller and (getfenv().getnamecallmethod and vu195.AimMode == "Silent")))) then
			vu199 = vu192.MouseDeltaSensitivity
		end
	else
		vu204:Disconnect()
	end
end)
local v206 = v45.Combat:AddSection("Aimbot")
v206:AddToggle("AimbotToggle", {
	Title = "Aimbot Toggle",
	Description = "Turns aimbot on/off",
	Default = vu195.Aimbot
}):OnChanged(function(p207)
	vu195.Aimbot = p207
end)
local v209 = v206:AddKeybind("AimKeybind", {
	Title = "Aimbot Key",
	Description = "Changes the key for aimbot",
	Default = vu195.AimKey,
	ChangedCallback = function(p208)
		vu195.AimKey = p208
	end
})
if v209.Value ~= "RMB" then
	vu195.AimKey = Enum.KeyCode[v209.Value]
else
	vu195.AimKey = Enum.UserInputType.MouseButton2
end
local vu211 = v206:AddDropdown("AimPartDropdown", {
	Title = "Aimbot Part",
	Description = "Changes the aimbot part",
	Values = vu195.AimPartDropdownValues,
	Default = vu195.AimPart,
	Callback = function(p210)
		vu195.AimPart = p210
	end
})
task.spawn(function()
	while task.wait(1) and vu198 do
		if vu195.RandomAimPart and # vu195.AimPartDropdownValues > 0 then
			vu211:SetValue(vu195.AimPartDropdownValues[Random.new():NextInteger(1, # vu195.AimPartDropdownValues)])
		end
	end
end)
local function vu214(p212, p213)
	vu200 = p212 and vu200 or false
	vu202 = p213 and vu202 or nil
	if vu203 then
		vu203:Cancel()
		vu203 = nil
	end
	vu192.MouseDeltaSensitivity = vu199
end
local vu215 = nil
vu215 = vu192.InputBegan:Connect(function(p216)
	if vu198 then
		if not vu192:GetFocusedTextBox() then
			if vu195.Aimbot and (p216.KeyCode == vu195.AimKey or p216.UserInputType == vu195.AimKey) then
				if vu200 then
					vu214()
				else
					vu200 = true
				end
			elseif vu195.TriggerBot and (p216.KeyCode == vu195.TriggerKey or p216.UserInputType == vu195.TriggerKey) then
				if vu201 then
					vu201 = false
				else
					vu201 = true
				end
			end
		end
	else
		vu215:Disconnect()
	end
end)
local vu217 = nil
vu217 = vu192.InputEnded:Connect(function(p218)
	if vu198 then
		if not vu192:GetFocusedTextBox() then
			if vu200 and (not vu195.OnePressAimingMode and (p218.KeyCode == vu195.AimKey or p218.UserInputType == vu195.AimKey)) then
				vu214()
			elseif vu201 and (not vu195.OnePressTriggeringMode and (p218.KeyCode == vu195.TriggerKey or p218.UserInputType == vu195.TriggerKey)) then
				vu201 = false
			end
		end
	else
		vu217:Disconnect()
	end
end)
local function vu222(p219, p220, p221)
	return typeof(p219) == "Vector3" and typeof(p220) == "Vector3" and (typeof(p221) == "number" and (p220 - p219).Unit * p221) or Vector3.zero
end
local function vu233(p223)
	if not p223 or (not p223:FindFirstChildWhichIsA("Humanoid") or (p223:FindFirstChildWhichIsA("Humanoid").Health <= 0 or (p223:FindFirstChildWhichIsA("ForceField") or not (vu195.AimPart and p223:FindFirstChild(vu195.AimPart))))) or (not (p223:FindFirstChild(vu195.AimPart):IsA("BasePart") and vu196.Character) or (not vu196.Character:FindFirstChildWhichIsA("Humanoid") or (vu196.Character:FindFirstChildWhichIsA("Humanoid").Health <= 0 or not (vu196.Character:FindFirstChild(vu195.AimPart) and vu196.Character:FindFirstChild(vu195.AimPart):IsA("BasePart"))))) then
		return false
	end
	local v224 = vu191:GetPlayerFromCharacter(p223)
	if not v224 or v224 == vu196 then
		return false
	end
	local v225 = p223:FindFirstChild(vu195.AimPart)
	local v226 = vu196.Character:FindFirstChild(vu195.AimPart)
	local v227 = vu196
	if v224:GetAttribute("Team") == v227:GetAttribute("Team") then
		return false
	end
	if vu195.WallCheck then
		local v228 = vu222(v226.Position, v225.Position, (v225.Position - v226.Position).Magnitude)
		local v229 = RaycastParams.new()
		v229.FilterType = Enum.RaycastFilterType.Exclude
		v229.FilterDescendantsInstances = {
			vu196.Character
		}
		v229.IgnoreWater = not vu195.WaterCheck
		local v230 = workspace:Raycast(v226.Position, v228, v229)
		if not (v230 and v230.Instance and v230.Instance:FindFirstAncestor(v224.Name)) then
			return false
		end
	end
	local v231 = vu195.UseOffset and (vu195.AutoOffset and Vector3.new(0, v225.Position.Y * vu195.StaticOffsetIncrement * (v225.Position - v226.Position).Magnitude / 1000 <= vu195.MaxAutoOffset and v225.Position.Y * vu195.StaticOffsetIncrement * (v225.Position - v226.Position).Magnitude / 1000 or vu195.MaxAutoOffset, 0) + p223:FindFirstChildWhichIsA("Humanoid").MoveDirection * vu195.DynamicOffsetIncrement / 10 or vu195.OffsetType == "Static" and Vector3.new(0, v225.Position.Y * vu195.StaticOffsetIncrement / 10, 0) or (vu195.OffsetType == "Dynamic" and p223:FindFirstChildWhichIsA("Humanoid").MoveDirection * vu195.DynamicOffsetIncrement / 10 or Vector3.new(0, v225.Position.Y * vu195.StaticOffsetIncrement / 10, 0) + p223:FindFirstChildWhichIsA("Humanoid").MoveDirection * vu195.DynamicOffsetIncrement / 10)) or Vector3.zero
	local v232 = vu195.UseNoise and Vector3.new(Random.new():NextNumber(0.5, 1), Random.new():NextNumber(0.5, 1), Random.new():NextNumber(0.5, 1)) or Vector3.zero
	return true, p223, {
		workspace.CurrentCamera:WorldToViewportPoint(v225.Position + v231 + v232)
	}, v225.Position + v231 + v232, (v225.Position + v231 + v232 - v226.Position).Magnitude, CFrame.new(v225.Position + v231 + v232) * CFrame.fromEulerAnglesYXZ(math.rad(v225.Orientation.X), math.rad(v225.Orientation.Y), math.rad(v225.Orientation.Z)), v225
end
local vu234 = {}
local vu235 = {}
local function vu237(p236)
	if p236 and vu234[p236] then
		vu234[p236]:Disconnect()
		table.remove(vu234, p236)
	end
end
local function vu243(p238)
	if p238 and vu235[p238] then
		local v239 = next
		local v240 = vu235[p238]
		local v241 = nil
		while true do
			local v242
			v241, v242 = v239(v240, v241)
			if v241 == nil then
				break
			end
			v242:Disconnect()
		end
		table.remove(vu235, p238)
	end
end
local function vu252()
	local v244 = next
	local v245 = vu235
	local v246 = nil
	while true do
		local v247
		v246, v247 = v244(v245, v246)
		if v246 == nil then
			break
		end
		vu243(v246)
	end
	local v248 = next
	local v249 = vu234
	local v250 = nil
	while true do
		local v251
		v250, v251 = v248(v249, v250)
		if v250 == nil then
			break
		end
		vu237(v250)
	end
end
local function vu253()
	vu214()
	vu201 = false
	vu252()
end
local function vu255(p254)
	if typeof(p254) == "Instance" then
		vu191:GetPlayerFromCharacter(p254)
	end
end
local function vu261(p256)
	if typeof(p256) == "Instance" then
		local v257 = next
		local v258 = vu234
		local v259 = nil
		while true do
			local v260
			v259, v260 = v257(v258, v259)
			if v259 == nil then
				break
			end
			if v260.Character == p256 then
				vu237(v259)
			end
		end
	end
end
local function v266()
	if not vu190 and getfenv().Drawing then
		local v262 = next
		local v263, v264 = vu191:GetPlayers()
		while true do
			local v265
			v264, v265 = v262(v263, v264)
			if v264 == nil then
				break
			end
			if v265 ~= vu196 and v265.Character then
				vu255(v265.Character)
				vu235[v265.UserId] = {
					v265.CharacterAdded:Connect(vu255),
					v265.CharacterRemoving:Connect(vu261)
				}
			end
		end
	end
end
task.spawn(v266)
local vu267 = nil
vu267 = vu196.OnTeleport:Connect(function()
	if vu190 or not (vu198 and getfenv().queue_on_teleport) then
		vu267:Disconnect()
	else
		getfenv().queue_on_teleport("getfenv().loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua\", true))()")
		vu267:Disconnect()
	end
end)
local vu268 = nil
vu268 = vu191.PlayerAdded:Connect(function(p269)
	if vu190 or not (vu198 and getfenv().Drawing) then
		vu268:Disconnect()
	elseif p269 ~= vu196 then
		vu235[p269.UserId] = {
			p269.CharacterAdded:Connect(vu255),
			p269.CharacterRemoving:Connect(vu261)
		}
	end
end)
local vu270 = nil
vu270 = vu191.PlayerRemoving:Connect(function(p271)
	if vu198 then
		if p271 ~= vu196 then
			vu243(p271.UserId)
			vu237(p271.UserId)
		else
			vu198:Destroy()
			vu253()
			vu270:Disconnect()
		end
	else
		vu270:Disconnect()
	end
end)
local vu272 = nil
vu272 = v193.RenderStepped:Connect(function()
	if vu198.Unloaded then
		vu198 = nil
		vu253()
		vu272:Disconnect()
	elseif vu195.Aimbot then
		if not vu195.TriggerBot then
			vu201 = false
		end
	else
		vu214()
	end
	if vu200 then
		local v273 = vu202
		local v274 = math.huge
		if not vu233(v273) then
			if v273 and not vu195.OffAfterKill or not v273 then
				local v275 = next
				local v276, v277 = vu191:GetPlayers()
				while true do
					local v278
					v277, v278 = v275(v276, v277)
					if v277 == nil then
						break
					end
					local v279, v280, v281 = vu233(v278.Character)
					if v279 and v281[2] then
						local v282 = (Vector2.new(vu197.X, vu197.Y) - Vector2.new(v281[1].X, v281[1].Y)).Magnitude
						if v282 <= v274 then
							local v283
							if vu195.FoVCheck then
								v283 = vu195.FoVRadius or v274
							else
								v283 = v274
							end
							if v282 <= v283 then
								vu202 = v280
								v274 = v282
							end
						end
					end
				end
			else
				vu214()
			end
		end
		local v284, _, v285, v286 = vu233(vu202)
		if v284 then
			if vu190 or (not getfenv().mousemoverel or vu195.AimMode ~= "Mouse") then
				if vu195.AimMode == "Camera" then
					vu192.MouseDeltaSensitivity = 0
					if vu195.UseSensitivity then
						vu203 = vu194:Create(workspace.CurrentCamera, TweenInfo.new(math.clamp(vu195.Sensitivity, 9, 99) / 100, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v286)
						})
						vu203:Play()
					else
						workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v286)
					end
				end
			elseif v285[2] then
				vu214(true, true)
				local v287 = vu192:GetMouseLocation()
				local v288 = vu195.UseSensitivity and vu195.Sensitivity / 10 or 10
				getfenv().mousemoverel((v285[1].X - v287.X) / v288, (v285[1].Y - v287.Y) / v288)
			else
				vu214(true)
			end
		else
			vu214(true)
		end
	end
end)
v45.Combat:AddSection("Hitbox Expander")
local vu289 = 5
local vu290 = 5
local vu291 = 1
local vu292 = nil
local vu293 = true
local vu294 = "HumanoidRootPart"
v45.Combat:AddSlider("", {
	Title = "HumanoidRootPart Hitbox Size",
	Description = "This is only if you have hitbox expander part on \nhumanoidrootpart",
	Default = 5,
	Min = 1,
	Max = 20,
	Rounding = 0.1,
	Callback = function(p295)
		vu289 = p295
	end
})
v45.Combat:AddSlider("", {
	Title = "Head Hitbox Size",
	Description = "This is only if you have hitbox expander part on \nhead",
	Default = 6,
	Min = 1,
	Max = 6,
	Rounding = 0.1,
	Callback = function(p296)
		vu290 = p296
	end
})
v45.Combat:AddToggle("", {
	Title = "Hitbox Visualizer",
	Description = "",
	Default = true,
	Callback = function(p297)
		vu293 = p297
	end
})
v45.Combat:AddDropdown("HExpDrop", {
	Title = "Hitbox Expander Part",
	Description = "Changes the hitbox expander part.",
	Values = {
		"HumanoidRootPart",
		"Head"
	},
	Default = "HumanoidRootPart",
	Callback = function(p298)
		vu294 = p298
	end
})
v45.Combat:AddToggle("", {
	Title = "Hitbox Expander",
	Description = "Reach but for guns?",
	Default = false,
	Callback = function(p299)
		vu292 = p299
		local vu300 = game:GetService("Players").LocalPlayer
		local function v311(p301, p302)
			local v303, v304, v305 = ipairs(game:GetService("Workspace"):GetDescendants())
			while true do
				local v306
				v305, v306 = v303(v304, v305)
				if v305 == nil then
					break
				end
				if v306:FindFirstChild("HumanoidRootPart") and v306.Name ~= vu300.Name then
					local v307 = game.Players:FindFirstChild(v306.Name)
					if v307 then
						local v308 = vu300
						if v307:GetAttribute("Team") ~= v308:GetAttribute("Team") then
							if vu294 ~= "HumanoidRootPart" then
								if vu294 == "Head" then
									local v309 = v306:FindFirstChild("Head")
									if v309 then
										if vu292 then
											if v309.Size ~= Vector3.new(vu290, vu290, vu290) then
												v309.Size = Vector3.new(vu290, vu290, vu290)
												v309.Transparency = p302 and 0.5 or 1
												v309.CanCollide = false
											end
										else
											v309.Size = Vector3.new(1, 2, 1)
											v309.CanCollide = false
											v309.Transparency = 0
										end
									end
								end
							else
								local v310 = v306.HumanoidRootPart
								if v310 then
									if vu292 then
										if v310.Size ~= Vector3.new(p301, p301, p301) then
											v310.Size = Vector3.new(p301, p301, p301)
											v310.BrickColor = BrickColor.new("Really black")
											v310.Transparency = p302 and 0.5 or 1
											v310.Material = "Neon"
										end
									else
										v310.Size = Vector3.new(1, 2, 1)
										v310.BrickColor = BrickColor.new("Really black")
										v310.Transparency = p302 and 0.5 or vu291
										v310.Material = "Neon"
									end
								end
							end
						end
					end
				end
			end
		end
		while vu292 do
			while vu292 do
				v311(vu289, vu293)
				task.wait(0.1)
			end
			v311(2, false)
			v311(vu289, vu293)
			task.wait(0.1)
		end
	end
})
v45.Visuals:AddSection("ESP")
local vu312 = Color3.fromRGB(255, 255, 255)
local vu313 = Color3.fromRGB(255, 255, 255)
local vu314 = 0.5
local vu315 = 0.5
local _ = game:GetService("Players").LocalPlayer
local vu316 = v45.Visuals:AddColorpicker("Colorpicker", {
	Title = "Fill Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local vu317 = v45.Visuals:AddColorpicker("Colorpicker", {
	Title = "Outline Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local v318 = vu316
vu316.OnChanged(v318, function()
	vu312 = vu316.Value
end)
local v319 = vu317
vu317.OnChanged(v319, function()
	vu313 = vu317.Value
end)
v45.Visuals:AddSlider("", {
	Title = "Outline Transparency",
	Description = "",
	Default = 0.5,
	Min = 0,
	Max = 0.9,
	Rounding = 1,
	Callback = function(p320)
		vu314 = p320
	end
})
v45.Visuals:AddSlider("", {
	Title = "Fill Transparency",
	Description = "",
	Default = 0.5,
	Min = 0,
	Max = 0.9,
	Rounding = 1,
	Callback = function(p321)
		vu315 = p321
	end
})
v45.Visuals:AddToggle("", {
	Title = "ESP",
	Description = "Highlights every player, allowing you to see them from afar.",
	Default = false,
	Callback = function(p322)
		getgenv().enabled = p322
		getgenv().filluseteamcolor = true
		getgenv().outlineuseteamcolor = true
		getgenv().fillcolor = vu312
		getgenv().outlinecolor = vu313
		getgenv().filltrans = vu315
		getgenv().outlinetrans = vu314
		local v323 = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
		if enabled == false then
			v323:Destroy()
		end
		if v323.Name == "Folder" then
			v323.Name = "ESPHolder"
			v323.Parent = game.CoreGui
		end
		if uselocalplayer == false and v323:FindFirstChild(game.Players.LocalPlayer.Name) then
			v323:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
		end
		if getgenv().enabled == true then
			getgenv().enabled = false
			getgenv().enabled = true
		end
		while getgenv().enabled do
			task.wait(0.5)
			local v324, v325, v326 = ipairs(game:GetService("Workspace"):GetDescendants())
			while true do
				local v327
				v326, v327 = v324(v325, v326)
				if v326 == nil then
					break
				end
				if v327:FindFirstChild("HumanoidRootPart") and v327.Name ~= vu38.Name then
					local v328 = game.Players:FindFirstChild(v327.Name)
					if v328 then
						local v329 = v323:FindFirstChild(v328.Name) or Instance.new("Highlight")
						v329.Name = v328.Name
						if uselocalplayer ~= false or v329.Name ~= game.Players.LocalPlayer.Name then
							v329.Parent = v323
							local v330 = v328:GetAttribute("Team") == game.Players.LocalPlayer:GetAttribute("Team")
							if filluseteamcolor then
								v329.FillColor = v330 and fillcolor or BrickColor.Red().Color
							else
								v329.FillColor = fillcolor
							end
							if outlineuseteamcolor then
								v329.OutlineColor = v330 and outlinecolor or BrickColor.Red().Color
							else
								v329.OutlineColor = outlinecolor
							end
							v329.FillTransparency = filltrans
							v329.OutlineTransparency = outlinetrans
							v329.Adornee = v327
							v329.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						end
					end
				end
			end
		end
	end
})
v45.Visuals:AddSection("World")
local vu331 = game:GetService("Lighting")
local vu332 = vu331.Ambient
v45.Visuals:AddToggle("", {
	Title = "Full Bright",
	Description = "light up light up the world",
	Default = false,
	Callback = function(p333)
		if p333 == true then
			vu331.Ambient = Color3.new(1, 1, 1)
			vu331.ColorShift_Bottom = Color3.new(1, 1, 1)
			vu331.ColorShift_Top = Color3.new(1, 1, 1)
		else
			vu331.Ambient = vu332
			vu331.ColorShift_Bottom = Color3.new()
			vu331.ColorShift_Top = Color3.new()
		end
	end
})
v45.Visuals:AddToggle("", {
	Title = "Night / Day",
	Description = "Changes the time to night.",
	Default = false,
	Callback = function(p334)
		if p334 == true then
			vu331.ClockTime = 0
		else
			vu331.ClockTime = 14
		end
	end
})
v45.Misc:AddSection("Main")
v45.Misc:AddButton({
	Title = "Force Reset",
	Description = "If you wanna live, don\'t use this lol",
	Callback = function()
		vu38.Character.Humanoid.Health = 0
	end
})
v45.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "Rejoins the game you\'re currently in.",
	Callback = function()
		local v335 = game:GetService("TeleportService")
		local v336 = game:GetService("Players").LocalPlayer
		v335:Teleport(game.PlaceId, v336)
	end
})
local v337 = vu38
local v338 = vu38.GetAttribute(v337, "Primary")
v45.Misc:AddSlider("Slider", {
	Title = "Gun AimIn FOV",
	Description = "Change your gun aimin/zoomin fov, could be useful for aiming\nReset to see affects.",
	Default = game:GetService("ReplicatedStorage").Weapons[v338].FOV.Value or 50,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(p339)
		local v340 = vu38:GetAttribute("Primary")
		if game:GetService("ReplicatedStorage").Weapons:FindFirstChild(v340) then
			local _ = game:GetService("ReplicatedStorage").Weapons[v340]
			if game:GetService("ReplicatedStorage").Weapons[v340]:FindFirstChild("FOV") then
				game:GetService("ReplicatedStorage").Weapons[v340]:FindFirstChild("FOV").Value = p339
			else
				vu198:Notify({
					Title = "Error.",
					Content = "Couldn\'t find your gun, please try again.",
					SubContent = "",
					Duration = 5
				})
			end
		end
	end
})
v45.Misc:AddSection("Misc Sound Changers")
local vu341 = {}
local v342 = "NukeSound"
local v343 = not (game:GetService("ReplicatedFirst"):FindFirstChild("HUD") and game:GetService("ReplicatedFirst").HUD.Code:FindFirstChild("NukeIncoming")) and (game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HUD"))
if v343 then
	v343 = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Code:FindFirstChild("NukeIncoming")
end
vu341[v342] = v343
v45.Misc:AddInput("", {
	Title = "Nuke Sound",
	Description = "Get it from the marketplace\n(paste the numbers in url into here)",
	Default = "",
	Placeholder = "",
	Numeric = true,
	Finished = false,
	Callback = function(p344)
		local v345, v346, v347 = pairs(vu341)
		while true do
			local v348
			v347, v348 = v345(v346, v347)
			if v347 == nil then
				break
			end
			v348.SoundId = "rbxassetid://" .. p344
		end
	end
})
vu26:SelectTab(1)
