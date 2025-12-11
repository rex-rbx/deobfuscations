local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v3 = {
	["Version"] = "v2.5.2",
	["Owner"] = "jakefromjakesfarm",
	["Status"] = "mikeyhub v3 is soon.",
	["TOS"] = "",
	["KeySystemDown"] = false,
	["NonSupportedExes"] = {}
}
local function vu8()
	return true
end
local v17 = "MikeyHub [CRACKED] " .. tostring(v3.Version)
local vu20 = vu1:CreateWindow({
	Title = v17,
	SubTitle = "- cracked by rex-rbx",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightShift
})
local vu30 = game:GetService("UserInputService")
local v31 = vu30
table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, vu30.GetPlatform(v31))
local vu33 = game:GetService("Players").LocalPlayer
local vu34 = vu33.UserId
local v42 = {
	Player = vu20:AddTab({
		Title = "| Player",
		Icon = "user"
	}),
	Autofarm = vu20:AddTab({
		Title = "| AutoFarm",
		Icon = "home"
	}),
	Combat = vu20:AddTab({
		Title = "| Combat",
		Icon = "sword"
	}),
	Visuals = vu20:AddTab({
		Title = "| Visuals",
		Icon = "eye"
	}),
	Misc = vu20:AddTab({
		Title = "| Misc",
		Icon = "circle-ellipsis"
	})
}
local _ = vu1.Options
v42.Player:AddSection("Player")
local vu43 = nil
infJumpDebounce = false
v42.Player:AddToggle("", {
	Title = "Infinite Jump",
	Description = "jump jump jump",
	Default = false,
	Callback = function(p44)
		if p44 == true then
			vu43 = vu30.JumpRequest:Connect(function()
				if not infJumpDebounce then
					infJumpDebounce = true
					vu33.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
					wait()
					infJumpDebounce = false
				end
			end)
		else
			if vu43 then
				vu43:Disconnect()
			end
			infJumpDebounce = false
		end
	end
})
local vu45 = nil
local function vu54(_)
	if vu45 ~= true then
		vu45 = false
	else
		local v46, v47, v48 = pairs(workspace:GetChildren())
		while true do
			local v49
			v48, v49 = v46(v47, v48)
			if v48 == nil then
				break
			end
			if v49.Name == vu33.Name then
				local v50, v51, v52 = pairs(workspace[vu33.Name]:GetChildren())
				while true do
					local v53
					v52, v53 = v50(v51, v52)
					if v52 == nil then
						break
					end
					if v53:IsA("BasePart") then
						v53.CanCollide = false
					end
				end
			end
		end
	end
end
v42.Player:AddToggle("", {
	Title = "No Clip",
	Description = "boo bitch im a ghost.",
	Default = false,
	Callback = function(p55)
		vu45 = p55
		vu54(p55)
	end
})
v42.Player:AddSection("Properties Changers")
local vu56 = 16
local vu57 = 7
v42.Player:AddSlider("", {
	Title = "Speed",
	Description = "How fast can fast be",
	Default = 16,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(p58)
		vu56 = p58
	end
})
v42.Player:AddSlider("", {
	Title = "JumpPower",
	Description = "How high can you really jump",
	Default = 50,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(p59)
		vu57 = p59
	end
})
local vu60 = nil
local vu61 = nil
local function vu62()
	if vu60 ~= true then
		vu33.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
	else
		vu33.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = vu56
	end
end
local function vu63()
	if vu61 ~= true then
		if vu33.Character:FindFirstChildOfClass("Humanoid").UseJumpPower ~= true then
			vu33.Character:FindFirstChildOfClass("Humanoid").JumpHeight = 7
		else
			vu33.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
		end
	elseif vu33.Character:FindFirstChildOfClass("Humanoid").UseJumpPower ~= true then
		vu33.Character:FindFirstChildOfClass("Humanoid").JumpHeight = vu57
	else
		vu33.Character:FindFirstChildOfClass("Humanoid").JumpPower = vu57
	end
end
v42.Player:AddToggle("", {
	Title = "Enable Speed",
	Description = "Enables/disables speed changers",
	Default = false,
	Callback = function(p64)
		vu60 = p64
		repeat
			vu62(p64)
			task.wait(0.1)
		until vu60 == false
	end
})
v42.Player:AddToggle("", {
	Title = "Enable JumpPower",
	Description = "Enables/disables jumppower changers",
	Default = false,
	Callback = function(p65)
		vu61 = p65
		repeat
			vu63()
			task.wait(0.1)
		until vu61 == false
	end
})
v42.Autofarm:AddSection("AutoFarms")
local vu66 = nil
v42.Autofarm:AddToggle("", {
	Title = "Auto Harvest",
	Description = "Auto collects harvest and gives it to george",
	Default = false,
	Callback = function(p67)
		vu66 = p67
		local vu68 = game:GetService("TweenService")
		local v69 = workspace.World.Interactables.NPCs.WheatSeller
		local vu70 = workspace.World.Interactables.Farm
		local vu71 = game.Players.LocalPlayer
		local function v74(p72)
			local v73 = vu68:Create(vu71.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				CFrame = p72.CFrame
			})
			v73:Play()
			v73.Completed:Wait()
		end
		local function v84()
			local v75 = math.huge
			local v76 = vu71.Character:WaitForChild("HumanoidRootPart")
			local v77 = vu70
			local v78, v79, v80 = pairs(v77:GetDescendants())
			local v81 = nil
			while true do
				local v82
				v80, v82 = v78(v79, v80)
				if v80 == nil then
					break
				end
				if v82:IsA("ProximityPrompt") and v82.Parent:IsA("BasePart") then
					local v83 = (v82.Parent.Position - v76.Position).Magnitude
					if v83 < v75 then
						v81 = v82
						v75 = v83
					end
				end
			end
			return v81
		end
		while vu66 do
			local v85 = v84()
			if v85 then
				local v86 = v85.Parent
				if v86 and v86:IsA("BasePart") then
					v74(v86)
					fireproximityprompt(v85)
					task.wait(1)
					local v87 = v69.HumanoidRootPart:FindFirstChild("InteractionPrompt")
					if v87 then
						v74(v69.HumanoidRootPart)
						fireproximityprompt(v87)
						task.wait(1)
					end
				end
			end
			task.wait(1)
		end
	end
})
local vu88 = nil
v42.Autofarm:AddToggle("", {
	Title = "Auto Clean",
	Description = "Auto cleans every dirt.",
	Default = false,
	Callback = function(p89)
		vu88 = p89
		local vu90 = game:GetService("TweenService")
		local v91 = workspace.World.Interactables.Dirt
		local vu92 = workspace.World.Interactables.Stores.ItemStall.Options.Standard
		local vu93 = workspace.World.Interactables.Stores.ItemStall.Options.Standard.Broom.Value
		local vu94 = game.Players.LocalPlayer
		local vu95 = vu94.Backpack
		local vu96 = vu94.Character or vu94.CharacterAdded:Wait()
		local function vu99(p97)
			if vu88 then
				local v98 = vu90:Create(vu94.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					CFrame = p97.CFrame
				})
				v98:Play()
				v98.Completed:Wait()
			end
		end
		local function vu101(p100)
			if vu88 and p100 then
				fireproximityprompt(p100)
			end
		end
		local function vu102()
			return vu95:FindFirstChild("Broom") or vu96:FindFirstChild("Broom")
		end
		local function v104()
			local v103 = vu94:GetAttribute("OldCurrency")
			if v103 and vu93 < v103 then
				while not vu102() and vu88 do
					vu99(vu92)
					vu101(vu92.InteractionPrompt)
					vu1:Notify({
						Title = "AutoFarm : ",
						Content = "Trying to buy, must have a worker in the stall.",
						SubContent = "",
						Duration = 5
					})
					task.wait(1)
				end
			else
				vu1:Notify({
					Title = "Error.",
					Content = "You must have at least " .. vu93 .. " currency to use this.",
					SubContent = "",
					Duration = 5
				})
			end
		end
		local v105 = vu101
		local v106 = vu99
		local v107 = vu102
		while vu88 do
			if not v107() and vu88 then
				v104()
			end
			if vu95:FindFirstChild("Broom") and vu88 then
				vu94.Character.Humanoid:EquipTool(vu95:FindFirstChild("Broom"))
			end
			local v108, v109, v110 = pairs(v91:GetDescendants())
			local v111 = {}
			while true do
				local v112
				v110, v112 = v108(v109, v110)
				if v110 == nil then
					break
				end
				if v112:IsA("ProximityPrompt") then
					table.insert(v111, v112)
				end
			end
			local v113, v114, v115 = ipairs(v111)
			while true do
				local v116
				v115, v116 = v113(v114, v115)
				if v115 == nil or not vu88 then
					break
				end
				local v117 = v116.Parent
				if v117 and v117:IsA("BasePart") then
					v106(v117)
					v105(v116)
					task.wait(1)
				end
			end
			task.wait(1)
		end
	end
})
local vu118 = nil
v42.Autofarm:AddToggle("", {
	Title = "Auto Paint",
	Description = "Auto paints every canvas.",
	Default = false,
	Callback = function(p119)
		vu118 = p119
		local vu120 = game:GetService("TweenService")
		local v121 = workspace.World.Interactables.Jobs
		local v122 = workspace.World.Interactables.NPCs.PaintingSeller
		local vu123 = workspace.World.Interactables.Stores.ItemStall2.Options.Better
		local vu124 = game.Players.LocalPlayer
		local vu125 = vu124.Backpack
		local vu126 = vu124.Character or vu124.CharacterAdded:Wait()
		local function vu129(p127)
			if vu118 then
				local v128 = vu120:Create(vu124.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					CFrame = p127.CFrame
				})
				v128:Play()
				v128.Completed:Wait()
			end
		end
		local function vu131(p130)
			if vu118 and p130 then
				fireproximityprompt(p130)
			end
		end
		local function vu132()
			return vu125:FindFirstChild("Paint Tools") or vu126:FindFirstChild("Paint Tools")
		end
		local function v135()
			local v133 = workspace.World.Interactables.Stores.ItemStall2.Options.Better["Paint Tools"].Value
			local v134 = vu124:GetAttribute("OldCurrency")
			if v134 and v133 < v134 then
				while not vu132() and vu118 do
					vu129(vu123)
					vu131(vu123.InteractionPrompt)
					vu1:Notify({
						Title = "AutoFarm : ",
						Content = "Trying to buy, must have a worker in the stall.",
						SubContent = "",
						Duration = 5
					})
					task.wait(1)
				end
			else
				vu1:Notify({
					Title = "Error.",
					Content = "You must have at least " .. v133 .. " currency to use this.",
					SubContent = "",
					Duration = 5
				})
			end
		end
		local v136 = vu131
		local v137 = vu129
		local v138 = vu132
		while vu118 do
			if not v138() and vu118 then
				v135()
			end
			if vu125:FindFirstChild("Paint Tools") and vu118 then
				vu124.Character.Humanoid:EquipTool(vu125:FindFirstChild("Paint Tools"))
			end
			local v139, v140, v141 = pairs(v121:FindFirstChild("Paint"):GetDescendants())
			local v142 = {}
			while true do
				local v143
				v141, v143 = v139(v140, v141)
				if v141 == nil then
					break
				end
				if v143:IsA("ProximityPrompt") then
					table.insert(v142, v143)
				end
			end
			local v144, v145, v146 = ipairs(v142)
			while true do
				local v147
				v146, v147 = v144(v145, v146)
				if v146 == nil or not vu118 then
					break
				end
				local v148 = v147.Parent
				if v148 and v148:IsA("BasePart") then
					v137(v148.Parent:FindFirstChild("Cube"))
					v136(v147)
					task.wait(1)
					local v149 = v122.HumanoidRootPart:FindFirstChild("InteractionPrompt")
					if v149 and vu118 then
						v137(v122.HumanoidRootPart)
						v136(v149)
						task.wait(1)
					end
					local v150 = vu123:FindFirstChild("InteractionPrompt")
					if v150 and vu118 then
						v137(vu123)
						v136(v150)
						task.wait(1)
					end
				end
			end
			task.wait(1)
		end
	end
})
local vu151 = nil
v42.Autofarm:AddToggle("", {
	Title = "Auto Sew",
	Description = "Auto sews for books.",
	Default = false,
	Callback = function(p152)
		vu151 = p152
		local vu153 = game:GetService("TweenService")
		local v154 = workspace.World.Interactables.Jobs
		local v155 = workspace.World.Interactables.NPCs.ClothingSeller
		local vu156 = game.Players.LocalPlayer
		local vu157 = vu156.Backpack
		local vu158 = vu156.Character or vu156.CharacterAdded:Wait()
		local function vu161(p159)
			if vu151 then
				local v160 = vu153:Create(vu156.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					CFrame = p159.CFrame
				})
				v160:Play()
				v160.Completed:Wait()
			end
		end
		local function vu163(p162)
			if vu151 and p162 then
				fireproximityprompt(p162)
			end
		end
		local function vu164()
			return vu157:FindFirstChild("Scissors") or vu158:FindFirstChild("Scissors")
		end
		local function v168()
			local v165 = workspace.World.Interactables.Stores.ItemStall.Options.Better.Scissors.Value
			local v166 = vu156:GetAttribute("OldCurrency")
			if v166 and v165 < v166 then
				local v167 = workspace.World.Interactables.Stores.ItemStall.Options.Better
				while not vu164() and vu151 do
					vu161(v167)
					vu163(v167.InteractionPrompt)
					vu1:Notify({
						Title = "AutoFarm : ",
						Content = "Trying to buy, must have a worker in the stall.",
						SubContent = "",
						Duration = 5
					})
					task.wait(1)
				end
			else
				vu1:Notify({
					Title = "Error.",
					Content = "You must have at least " .. v165 .. " currency to use this.",
					SubContent = "",
					Duration = 5
				})
			end
		end
		local v169 = vu163
		local v170 = vu161
		local v171 = vu158
		local v172 = vu164
		while vu151 do
			if not v172() and vu151 then
				v168()
			end
			if vu157:FindFirstChild("Scissors") and vu151 then
				vu156.Character.Humanoid:EquipTool(vu157:FindFirstChild("Scissors"))
			end
			if v171:FindFirstChildOfClass("Humanoid").Sit == true and vu151 then
				v171:FindFirstChildOfClass("Humanoid").Sit = false
			end
			local v173, v174, v175 = pairs(v154:FindFirstChild("Sew"):GetDescendants())
			local v176 = {}
			while true do
				local v177
				v175, v177 = v173(v174, v175)
				if v175 == nil then
					break
				end
				if v177:IsA("ProximityPrompt") then
					table.insert(v176, v177)
				end
			end
			local v178, v179, v180 = ipairs(v176)
			while true do
				local v181
				v180, v181 = v178(v179, v180)
				if v180 == nil or not vu151 then
					break
				end
				local v182 = v181.Parent
				if v182 and v182:IsA("BasePart") then
					v170(v182)
					v169(v181)
					task.wait(1)
					local v183 = v155.HumanoidRootPart:FindFirstChild("InteractionPrompt")
					if v183 and vu151 then
						v170(v155.HumanoidRootPart)
						v169(v183)
						task.wait(1)
					end
				end
			end
			task.wait(1)
		end
	end
})
local vu184 = nil
v42.Autofarm:AddToggle("", {
	Title = "Auto Write Letters",
	Description = "Auto write letters for nobles..",
	Default = false,
	Callback = function(p185)
		local _ = vu33.Team.Name == "Noble"
		vu184 = p185
		local vu186 = game:GetService("TweenService")
		local v187 = workspace.World.Interactables.Jobs
		local v188 = workspace.World.Interactables.NPCs.LetterSeller
		local vu189 = game.Players.LocalPlayer
		local v190 = vu189.Backpack
		local v191 = vu189.Character or vu189.CharacterAdded:Wait()
		local function v194(p192)
			if vu184 then
				local v193 = vu186:Create(vu189.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					CFrame = p192.CFrame
				})
				v193:Play()
				v193.Completed:Wait()
			end
		end
		local function v196(p195)
			if vu184 and p195 then
				fireproximityprompt(p195)
			end
		end
		while vu184 do
			if v190:FindFirstChild("Letter") and vu184 then
				vu189.Character.Humanoid:EquipTool(v190:FindFirstChild("Letter"))
			end
			if v191:FindFirstChildOfClass("Humanoid").Sit == true and vu184 then
				v191:FindFirstChildOfClass("Humanoid").Sit = false
			end
			local v197, v198, v199 = pairs(v187:FindFirstChild("Letter"):GetDescendants())
			local v200 = {}
			while true do
				local v201
				v199, v201 = v197(v198, v199)
				if v199 == nil then
					break
				end
				if v201:IsA("ProximityPrompt") then
					table.insert(v200, v201)
				end
			end
			if # v200 ~= 0 then
				local v202, v203, v204 = ipairs(v200)
				while true do
					local v205
					v204, v205 = v202(v203, v204)
					if v204 == nil or not vu184 then
						break
					end
					local v206 = v205.Parent
					if v206 and v206:IsA("BasePart") then
						v194(v206)
						v196(v205)
						task.wait(5)
						if not v188:FindFirstChild("HumanoidRootPart") then
							local v207 = CFrame.new(- 184.793442, 21.8334274, 540.796631, - 0.812103689, - 5.12737657e-8, 0.583513141, - 3.34011148e-8, 1, 4.13848369e-8, - 0.583513141, 1.41187888e-8, - 0.812103689)
							v194(vu189.Character.HumanoidRootPart, v207)
							return
						end
						local v208 = v188.HumanoidRootPart:FindFirstChild("InteractionPrompt")
						if v208 and vu184 then
							v194(v188.HumanoidRootPart)
							v196(v208)
							task.wait(4)
						end
					end
				end
			else
				local v209 = CFrame.new(- 198.780136, 45.0090904, 2033.26782, 0.0000650614238, - 5.73098617e-8, -1, - 1.34844207e-8, 1, - 5.73107393e-8, 1, 1.34881493e-8, 0.0000650614238)
				v194(vu189.Character.HumanoidRootPart, v209)
			end
			task.wait(3)
		end
	end
})
v42.Combat:AddSection("Kill Aura")
local vu210 = false
local vu211 = 50
local vu212 = 0.1
v42.Combat:AddSlider("", {
	Title = "Range",
	Description = "",
	Default = 50,
	Min = 1,
	Max = 50,
	Rounding = 0.1,
	Callback = function(p213)
		vu211 = tonumber(p213) or vu211
	end
})
v42.Combat:AddToggle("", {
	Title = "Kill Aura",
	Description = "Say goodbye to anyone that gets near you.",
	Default = false,
	Callback = function(p214)
		if vu8() ~= true then
			vu1:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		else
			vu210 = p214
			local function v217(p215)
				local v216 = {
					"PunchTarget",
					workspace:WaitForChild(p215)
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(v216))
			end
			while vu210 do
				local v218, v219, v220 = ipairs(game.Players:GetPlayers())
				while true do
					local v221
					v220, v221 = v218(v219, v220)
					if v220 == nil then
						break
					end
					if v221 ~= vu33 then
						local v222 = v221.Character
						if v222 and (v222:FindFirstChild("Humanoid") and (v222.Humanoid.Health > 0 and (v222:FindFirstChild("HumanoidRootPart") and (vu33.Character.HumanoidRootPart.Position - v222.HumanoidRootPart.Position).Magnitude <= vu211))) then
							if vu33.Character:FindFirstChild("Punch") then
								v217(v222.Name)
							else
								game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(vu33.Backpack:FindFirstChild("Punch"))
							end
						end
					end
				end
				task.wait(vu212)
			end
		end
	end
})
v42.Combat:AddSection("Kill Player")
local vu223 = 5
v42.Combat:AddSlider("Distance", {
	Title = "Distance",
	Description = "",
	Default = 5,
	Min = 1,
	Max = 20,
	Rounding = 0.1,
	Callback = function(p224)
		vu223 = p224
	end
})
local vu225 = "None"
local vu226 = {}
local vu227 = game:GetService("Players")
if vu227 then
	local v228, v229, v230 = pairs(vu227:GetPlayers())
	while true do
		local v231, v232 = v228(v229, v230)
		if v231 == nil then
			break
		end
		v230 = v231
		if v232 ~= vu33 then
			table.insert(vu226, v232.Name)
		end
	end
end
local vu233 = v42.Combat:AddDropdown("", {
	Title = "Target Player",
	Description = "Choose the player you wanna autofarm.",
	Values = vu226,
	Multi = false,
	Default = 1
})
local v234 = vu233
vu233.OnChanged(v234, function(p235)
	vu225 = p235
end)
local function v241(_)
	vu226 = {}
	local v236 = vu227
	local v237, v238, v239 = pairs(v236:GetPlayers())
	while true do
		local v240
		v239, v240 = v237(v238, v239)
		if v239 == nil then
			break
		end
		table.insert(vu226, v240.Name)
	end
	vu233:SetValue(vu226)
end
local function v247(_)
	vu226 = {}
	local v242 = vu227
	local v243, v244, v245 = pairs(v242:GetPlayers())
	while true do
		local v246
		v245, v246 = v243(v244, v245)
		if v245 == nil then
			break
		end
		table.insert(vu226, v246.Name)
	end
	vu233:SetValue(vu226)
end
vu227.PlayerAdded:Connect(v241)
vu227.PlayerRemoving:Connect(v247)
local vu248 = nil
local function vu275(p249, p250)
	local v251 = game.Players.LocalPlayer
	local v252 = v251.Character
	if p250 == true then
		local v253, v254, v255 = pairs(workspace:GetChildren())
		while true do
			local v256
			v255, v256 = v253(v254, v255)
			if v255 == nil then
				break
			end
			if v256.Name == v251.Name then
				local v257, v258, v259 = pairs(workspace[v251.Name]:GetChildren())
				while true do
					local v260
					v259, v260 = v257(v258, v259)
					if v259 == nil then
						break
					end
					if v260:IsA("BasePart") then
						v260.CanCollide = false
					end
				end
			end
		end
	end
	local v261 = game:GetService("TweenService")
	game:GetService("RunService")
	if v252 then
		v252 = v252:FindFirstChild("HumanoidRootPart")
	end
	if v252 then
		local v262 = v252.Position
		local v263 = math.huge
		local v264 = game:GetService("Workspace"):GetChildren()
		local v265 = nil
		for v266 = 1, # v264 do
			local v267 = v264[v266]
			local v268 = v267:FindFirstChild("HumanoidRootPart")
			if v268 then
				if v267.Name == p249 then
					local v269 = (v262 - v268.Position).Magnitude
					if v269 < v263 then
						v265 = v267
						v263 = v269
					end
				end
			end
		end
		if v265 then
			local v270 = v265:FindFirstChild("HumanoidRootPart") and v265.HumanoidRootPart.Position
			if v270 then
				local v271 = vu223
				local v272 = v270 + v265.HumanoidRootPart.CFrame.LookVector * - v271
				local v273 = v261:Create(v252, TweenInfo.new(math.round((v270 - workspace.CurrentCamera.CFrame.p).Magnitude) / 750, Enum.EasingStyle.Linear), {
					CFrame = CFrame.new(v272, v270)
				})
				v273:Play()
				v273.Completed:Wait()
				if v265:FindFirstChildOfClass("Humanoid") and v265.Humanoid.Health ~= 0 then
					if v265 then
						if vu33.Character:FindFirstChild("Punch") then
							local v274 = {
								"PunchTarget",
								workspace:WaitForChild(v265.Name)
							}
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack(v274))
						else
							game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(vu33.Backpack:FindFirstChild("Punch"))
						end
					elseif v265.Humanoid.Health == 0 then
						v265:Destroy()
					end
				end
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Target Not Found.",
				SubContent = "Waiting Until It Spawns.",
				Duration = 5
			})
			task.wait(5)
		end
	else
		return
	end
end
v42.Combat:AddToggle("", {
	Title = "Kill Player",
	Description = "Auto kills selected player",
	Default = false,
	Callback = function(p276)
		if vu8() ~= true then
			vu1:Notify({
				Title = "Error.",
				Content = "You Must Own Premium In Order To Use This.",
				SubContent = "Join Our Discord To Buy MikeyHub.",
				Duration = 5
			})
		else
			vu248 = p276
			while task.wait() and vu248 do
				vu275(vu225, vu248)
			end
		end
	end
})
v42.Misc:AddSection("Main")
v42.Misc:AddButton({
	Title = "Instant ProximityPromots",
	Description = "Allows you to activate all proximityprompts instantly.",
	Callback = function()
		local v277, v278, v279 = pairs(workspace:GetDescendants())
		local v280 = {}
		local v281 = 0.1
		while true do
			local v282
			v279, v282 = v277(v278, v279)
			if v279 == nil then
				break
			end
			if v282:IsA("ProximityPrompt") then
				v280[v282] = v282.HoldDuration
				v282.HoldDuration = v281
			end
		end
	end
})
v42.Misc:AddButton({
	Title = "Force Reset",
	Description = "If you wanna live, don\'t use this lol",
	Callback = function()
		vu33.Character.Humanoid.Health = 0
	end
})
v42.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "Rejoins the game you\'re currently in.",
	Callback = function()
		local v283 = game:GetService("TeleportService")
		local v284 = game:GetService("Players").LocalPlayer
		v283:Teleport(game.PlaceId, v284)
	end
})
v42.Visuals:AddSection("ESP")
local vu285 = Color3.fromRGB(255, 255, 255)
local vu286 = Color3.fromRGB(255, 255, 255)
local _ = game:GetService("Players").LocalPlayer
local vu287 = v42.Visuals:AddColorpicker("Colorpicker", {
	Title = "Fill Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local vu288 = v42.Visuals:AddColorpicker("Colorpicker", {
	Title = "Outline Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local v289 = vu287
vu287.OnChanged(v289, function()
	vu285 = vu287.Value
end)
local v290 = vu288
vu288.OnChanged(v290, function()
	vu286 = vu288.Value
end)
v42.Visuals:AddToggle("", {
	Title = "ESP",
	Description = "Highlights every player, allowing you to see them from afar.",
	Default = false,
	Callback = function(p291)
		getgenv().enabled = p291
		getgenv().filluseteamcolor = false
		getgenv().outlineuseteamcolor = false
		getgenv().fillcolor = vu285
		getgenv().outlinecolor = vu286
		getgenv().filltrans = 0
		getgenv().outlinetrans = 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
	end
})
v42.Visuals:AddSection("World")
local vu292 = game:GetService("Lighting")
local vu293 = vu292.Ambient
v42.Visuals:AddToggle("", {
	Title = "Full Bright",
	Description = "light up light up the world",
	Default = false,
	Callback = function(p294)
		if p294 == true then
			vu292.Ambient = Color3.new(1, 1, 1)
			vu292.ColorShift_Bottom = Color3.new(1, 1, 1)
			vu292.ColorShift_Top = Color3.new(1, 1, 1)
		else
			vu292.Ambient = vu293
			vu292.ColorShift_Bottom = Color3.new()
			vu292.ColorShift_Top = Color3.new()
		end
	end
})
