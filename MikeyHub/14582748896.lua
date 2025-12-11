local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local vu7 = game:GetService("Players").LocalPlayer
local vu14 = true
local v23 = "MikeyHub [CRACK]"
local vu26 = vu1:CreateWindow({
	Title = v23,
	SubTitle = "- cracked by rex-rbx",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightShift
})
local vu27 = vu7.UserId
local function v31(p28)
	local v29 = 0
	for v30 = 1, # p28 do
		v29 = (v29 + string.byte(p28, v30) * v30) % 4294967296
	end
	return tostring(v29)
end
local v32 = getgenv().CollectMikeyHubData
if v32 then
	v32 = getgenv().CollectMikeyHubData.Test
end
local v33 = getgenv().LoaderKey
if v33 then
	v33 = v31(getgenv().LoaderKey)
end
local vu36 = game:GetService("UserInputService")
local v37 = vu36
table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, vu36.GetPlatform(v37))
local vu39 = game:GetService("Players").LocalPlayer
local v48 = {
	Main = vu26:AddTab({
		Title = "| Player",
		Icon = "user"
	}),
	Mods = vu26:AddTab({
		Title = "| Mods",
		Icon = "crosshair"
	}),
	Npcs = vu26:AddTab({
		Title = "| NPCs",
		Icon = "users"
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
v48.Main:AddSection("Character")
v48.Main:AddButton({
	Title = "God Mode",
	Description = "You take no damage",
	Callback = function()
		if vu14 then
			local vu49 = nil
			vu49 = hookmetamethod(game, "__namecall", function(p50, ...)
				local v51 = getnamecallmethod()
				if checkcaller() or (p50.Name ~= "PlayerDamage" or v51 ~= "FireServer") then
					return vu49(p50, ...)
				else
					return task.wait(387420489)
				end
			end)
			task.wait(0.1)
			local vu52 = nil
			vu52 = hookmetamethod(game, "__namecall", function(p53, ...)
				local v54 = getnamecallmethod()
				if checkcaller() or (p53.Name ~= "DamageEvent" or v54 ~= "FireServer") then
					return vu52(p53, ...)
				else
					return wait(387420489)
				end
			end)
		else
			vu26:Dialog({
				Title = "Buy MikeyHub.",
				Content = "You must own MikeyHub in order to use this.\nJoin Our Discord To Buy MikeyHub Or Press Copy Link For Gamepass Link.",
				Buttons = {
					{
						Title = "Copy Link",
						Callback = function()
							setclipboard("https://mikeyhub.sellsn.io/product/b1a3ee62-933b-4537-b612-d5525a6d31a8")
							vu1:Notify({
								Title = "Copied Gamepass Url To Clipboard.",
								Content = "Paste the url into your browser.",
								SubContent = "Join Our Discord For Customer Role",
								Duration = 5
							})
						end
					},
					{
						Title = "Ok",
						Callback = function()
						end
					}
				}
			})
		end
	end
})
v48.Main:AddToggle("", {
	Title = "Infinite Dashes",
	Description = "dashes are infinite",
	Default = false,
	Callback = function(p55)
		while p55 and p55 do
			vu39.Character:SetAttribute("Dashes", 3)
			task.wait(0.1)
		end
	end
})
local vu56 = game:GetService("Players")
IYMouse = vu56.LocalPlayer:GetMouse()
function getRoot(p57)
	return p57:FindFirstChild("HumanoidRootPart") or (p57:FindFirstChild("Torso") or p57:FindFirstChild("UpperTorso"))
end
FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function sFLY(pu58)
	repeat
		wait()
	until vu56.LocalPlayer and (vu56.LocalPlayer.Character and getRoot(vu56.LocalPlayer.Character)) and vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat
		wait()
	until IYMouse
	if flyKeyDown or flyKeyUp then
		flyKeyDown:Disconnect()
		flyKeyUp:Disconnect()
	end
	local vu59 = getRoot(vu56.LocalPlayer.Character)
	local vu60 = {
		F = 0,
		B = 0,
		L = 0,
		R = 0,
		Q = 0,
		E = 0
	}
	local vu61 = {
		F = 0,
		B = 0,
		L = 0,
		R = 0,
		Q = 0,
		E = 0
	}
	local vu62 = 0
	local function v65()
		FLYING = true
		local vu63 = Instance.new("BodyGyro")
		local vu64 = Instance.new("BodyVelocity")
		vu63.P = 90000
		vu63.Parent = vu59
		vu64.Parent = vu59
		vu63.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
		vu63.cframe = vu59.CFrame
		vu64.velocity = Vector3.new(0, 0, 0)
		vu64.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
		task.spawn(function()
			while true do
				wait()
				if not pu58 and vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
					vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
				end
				if vu60.L + vu60.R ~= 0 or (vu60.F + vu60.B ~= 0 or vu60.Q + vu60.E ~= 0) then
					vu62 = 50
				elseif vu60.L + vu60.R == 0 and (vu60.F + vu60.B == 0 and (vu60.Q + vu60.E == 0 and vu62 ~= 0)) then
					vu62 = 0
				end
				if vu60.L + vu60.R ~= 0 or (vu60.F + vu60.B ~= 0 or vu60.Q + vu60.E ~= 0) then
					vu64.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (vu60.F + vu60.B) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(vu60.L + vu60.R, (vu60.F + vu60.B + vu60.Q + vu60.E) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * vu62
					vu61 = {
						F = vu60.F,
						B = vu60.B,
						L = vu60.L,
						R = vu60.R
					}
				elseif vu60.L + vu60.R ~= 0 or (vu60.F + vu60.B ~= 0 or (vu60.Q + vu60.E ~= 0 or vu62 == 0)) then
					vu64.velocity = Vector3.new(0, 0, 0)
				else
					vu64.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (vu61.F + vu61.B) + (workspace.CurrentCamera.CoordinateFrame * CFrame.new(vu61.L + vu61.R, (vu61.F + vu61.B + vu60.Q + vu60.E) * 0.2, 0).p - workspace.CurrentCamera.CoordinateFrame.p)) * vu62
				end
				vu63.cframe = workspace.CurrentCamera.CoordinateFrame
				if not FLYING then
					vu60 = {
						F = 0,
						B = 0,
						L = 0,
						R = 0,
						Q = 0,
						E = 0
					}
					vu61 = {
						F = 0,
						B = 0,
						L = 0,
						R = 0,
						Q = 0,
						E = 0
					}
					vu62 = 0
					vu63:Destroy()
					vu64:Destroy()
					if vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
						vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
					end
					return
				end
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(p66)
		if p66:lower() ~= "w" then
			if p66:lower() ~= "s" then
				if p66:lower() ~= "a" then
					if p66:lower() ~= "d" then
						if QEfly and p66:lower() == "e" then
							vu60.Q = (pu58 and vehicleflyspeed or iyflyspeed) * 2
						elseif QEfly and p66:lower() == "q" then
							vu60.E = - (pu58 and vehicleflyspeed or iyflyspeed) * 2
						end
					else
						vu60.R = pu58 and vehicleflyspeed or iyflyspeed
					end
				else
					vu60.L = - (pu58 and vehicleflyspeed or iyflyspeed)
				end
			else
				vu60.B = - (pu58 and vehicleflyspeed or iyflyspeed)
			end
		else
			vu60.F = pu58 and vehicleflyspeed or iyflyspeed
		end
		pcall(function()
			workspace.CurrentCamera.CameraType = Enum.CameraType.Track
		end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(p67)
		if p67:lower() ~= "w" then
			if p67:lower() ~= "s" then
				if p67:lower() ~= "a" then
					if p67:lower() ~= "d" then
						if p67:lower() ~= "e" then
							if p67:lower() == "q" then
								vu60.E = 0
							end
						else
							vu60.Q = 0
						end
					else
						vu60.R = 0
					end
				else
					vu60.L = 0
				end
			else
				vu60.B = 0
			end
		else
			vu60.F = 0
		end
	end)
	v65()
end
function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then
		flyKeyDown:Disconnect()
		flyKeyUp:Disconnect()
	end
	if vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		vu56.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
	end
	pcall(function()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end)
end
v48.Main:AddSlider("Slider", {
	Title = "Fly Speed",
	Description = "",
	Default = 10,
	Min = 1,
	Max = 50,
	Rounding = 0.1,
	Callback = function(p68)
		iyflyspeed = p68
	end
})
v48.Main:AddToggle("", {
	Title = "Fly",
	Description = "u can fly",
	Default = false,
	Callback = function(p69)
		if p69 == true then
			sFLY()
		else
			sFLY()
			wait()
			NOFLY()
		end
	end
})
local vu70 = nil
local function vu79(_)
	if vu70 ~= true then
		vu70 = false
	else
		local v71, v72, v73 = pairs(workspace:GetChildren())
		while true do
			local v74
			v73, v74 = v71(v72, v73)
			if v73 == nil then
				break
			end
			if v74.Name == vu39.Name then
				local v75, v76, v77 = pairs(workspace[vu39.Name]:GetChildren())
				while true do
					local v78
					v77, v78 = v75(v76, v77)
					if v77 == nil then
						break
					end
					if v78:IsA("BasePart") then
						v78.CanCollide = false
					end
				end
			end
		end
	end
end
v48.Main:AddToggle("", {
	Title = "No Clip",
	Description = "boo bitch im a ghost",
	Default = false,
	Callback = function(p80)
		vu70 = p80
		vu79(p80)
	end
})
v48.Npcs:AddSection("Main")
v48.Npcs:AddToggle("", {
	Title = "Kill All Enemies",
	Description = "kills all enemies (only works with PROJECTILES)",
	Default = false,
	Callback = function(p81)
		if vu39.Character:FindFirstChildOfClass("Tool") and vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("Firerate") then
			local v82 = workspace:WaitForChild("Enemies")
			while p81 do
				local v83, v84, v85 = ipairs(v82:GetChildren())
				while true do
					local v86
					v85, v86 = v83(v84, v85)
					if v85 == nil then
						break
					end
					local v87 = v86:FindFirstChild("Humanoid")
					local v88 = v86:FindFirstChild("Head")
					if v87 and v88 then
						local v89 = {
							v87,
							v88.Position,
							v88.Position,
							v88
						}
						vu39.Character:FindFirstChildOfClass("Tool").VerifyHit:FireServer(unpack(v89))
					end
				end
				task.wait(1)
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "You must have a projectile weapon equipped in order to use this.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v48.Mods:AddSection("Sword")
v48.Mods:AddButton({
	Title = "Fast SwingRate",
	Description = "",
	Callback = function()
		if vu39.Character:FindFirstChildOfClass("Tool") and vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("Swingrate") then
			local v90 = vu39.Character:FindFirstChildOfClass("Tool")
			v90:SetAttribute("Swingrate", 0)
			v90:SetAttribute("LungeRate", 0)
			v90:SetAttribute("OffhandSwingRate", 0)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit stats.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v48.Mods:AddSection("Projectile\'s")
v48.Mods:AddButton({
	Title = "Infinite FireRate",
	Description = "",
	Callback = function()
		if vu14 then
			if vu39.Character:FindFirstChildOfClass("Tool") and vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("Firerate") then
				vu39.Character:FindFirstChildOfClass("Tool"):SetAttribute("Firerate", 0)
			else
				vu1:Notify({
					Title = "Error.",
					Content = "Failed to edit stats.",
					SubContent = "",
					Duration = 5
				})
			end
		else
			vu26:Dialog({
				Title = "Buy MikeyHub.",
				Content = "You must own MikeyHub in order to use this.\nJoin Our Discord To Buy MikeyHub Or Press Copy Link For Gamepass Link.",
				Buttons = {
					{
						Title = "Copy Link",
						Callback = function()
							setclipboard("https://mikeyhub.sellsn.io/product/b1a3ee62-933b-4537-b612-d5525a6d31a8")
							vu1:Notify({
								Title = "Copied Gamepass Url To Clipboard.",
								Content = "Paste the url into your browser.",
								SubContent = "Join Our Discord For Customer Role",
								Duration = 5
							})
						end
					},
					{
						Title = "Ok",
						Callback = function()
						end
					}
				}
			})
		end
	end
})
v48.Mods:AddButton({
	Title = "No Spread",
	Description = "",
	Callback = function()
		if vu39.Character:FindFirstChildOfClass("Tool") and vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("Spread") then
			vu39.Character:FindFirstChildOfClass("Tool"):SetAttribute("Spread", 0)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit stats.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v48.Mods:AddButton({
	Title = "Infinite Range",
	Description = "",
	Callback = function()
		if vu39.Character:FindFirstChildOfClass("Tool") and vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("Range") then
			vu39.Character:FindFirstChildOfClass("Tool"):SetAttribute("Range", 99999)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit stats.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v48.Mods:AddButton({
	Title = "Instant ProjectileSpeed",
	Description = "",
	Callback = function()
		if vu39.Character:FindFirstChildOfClass("Tool"):GetAttribute("ProjectileSpeed") then
			vu39.Character:FindFirstChildOfClass("Tool"):SetAttribute("ProjectileSpeed", 999)
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Failed to edit stats.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v48.Misc:AddSection("Main")
v48.Misc:AddButton({
	Title = "Force Reset",
	Description = "If you wanna live, don\'t use this lol",
	Callback = function()
		vu39.Character.Humanoid.Health = 0
	end
})
v48.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "Rejoins the game you\'re currently in.",
	Callback = function()
		local v91 = game:GetService("TeleportService")
		local v92 = game:GetService("Players").LocalPlayer
		v91:Teleport(game.PlaceId, v92)
	end
})
v48.Visuals:AddSection("ESP")
local vu93 = Color3.fromRGB(255, 255, 255)
local vu94 = Color3.fromRGB(255, 255, 255)
local vu95 = true
local vu96 = v48.Visuals:AddColorpicker("Colorpicker", {
	Title = "Fill Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local vu97 = v48.Visuals:AddColorpicker("Colorpicker", {
	Title = "Outline Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local v98 = vu96
vu96.OnChanged(v98, function()
	vu93 = vu96.Value
end)
local v99 = vu97
vu97.OnChanged(v99, function()
	vu94 = vu97.Value
end)
v48.Visuals:AddToggle("", {
	Title = "Use Team Color",
	Description = "Changes the color of esp to team color",
	Default = true,
	Callback = function(p100)
		vu95 = p100
	end
})
v48.Visuals:AddToggle("", {
	Title = "ESP",
	Description = "Highlights every player, allowing you to see them from afar.",
	Default = false,
	Callback = function(p101)
		getgenv().enabled = p101
		getgenv().filluseteamcolor = vu95
		getgenv().outlineuseteamcolor = vu95
		getgenv().fillcolor = vu93
		getgenv().outlinecolor = vu94
		getgenv().filltrans = 0.7
		getgenv().outlinetrans = 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
	end
})
v48.Visuals:AddSection("World")
local vu102 = game:GetService("Lighting")
local vu103 = vu102.Ambient
v48.Visuals:AddToggle("", {
	Title = "Full Bright",
	Description = "light up light up the world",
	Default = false,
	Callback = function(p104)
		if p104 == true then
			vu102.Ambient = Color3.new(1, 1, 1)
			vu102.ColorShift_Bottom = Color3.new(1, 1, 1)
			vu102.ColorShift_Top = Color3.new(1, 1, 1)
		else
			vu102.Ambient = vu103
			vu102.ColorShift_Bottom = Color3.new()
			vu102.ColorShift_Top = Color3.new()
		end
	end
})
