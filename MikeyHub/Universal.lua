local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local vu14 = true
local vu15 = ""
local v23 = "MIKEYHUB [CRACKED]"
local vu26 = vu1:CreateWindow({
	Title = v23,
	SubTitle = "cracked by rex-rbx",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightShift
})
local v47 = {
	Player = vu26:AddTab({
		Title = "| Player",
		Icon = "user"
	}),
	FeScripts = vu26:AddTab({
		Title = "| FE Scripts",
		Icon = "crown"
	}),
	Tools = vu26:AddTab({
		Title = "| Useful",
		Icon = "hammer"
	}),
	Chat = vu26:AddTab({
		Title = "| Chat",
		Icon = "message-circle"
	}),
	Combat = vu26:AddTab({
		Title = "| Combat",
		Icon = "swords"
	}),
	Trolling = vu26:AddTab({
		Title = "| Trolling",
		Icon = "smile"
	}),
	Teleport = vu26:AddTab({
		Title = "| Teleport",
		Icon = "map"
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
v47.Player:AddSection("Main")
local vu48 = nil
infJumpDebounce = false
v47.Player:AddToggle("", {
	Title = "Infinite Jump",
	Description = "321 jump yesss, 321 jump yesssss, 321 jump yessss.",
	Default = false,
	Callback = function(p49)
		if p49 == true then
			vu48 = vu35.JumpRequest:Connect(function()
				if not infJumpDebounce then
					infJumpDebounce = true
					vu38.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
					wait()
					infJumpDebounce = false
				end
			end)
		else
			if vu48 then
				vu48:Disconnect()
			end
			infJumpDebounce = false
		end
	end
})
local vu50 = nil
local function vu59(_)
	if vu50 ~= true then
		vu50 = false
	else
		local v51, v52, v53 = pairs(workspace:GetChildren())
		while true do
			local v54
			v53, v54 = v51(v52, v53)
			if v53 == nil then
				break
			end
			if v54.Name == vu38.Name then
				local v55, v56, v57 = pairs(workspace[vu38.Name]:GetChildren())
				while true do
					local v58
					v57, v58 = v55(v56, v57)
					if v57 == nil then
						break
					end
					if v58:IsA("BasePart") then
						v58.CanCollide = false
					end
				end
			end
		end
	end
end
v47.Player:AddToggle("", {
	Title = "No Clip",
	Description = "boo bitch im a ghost.",
	Default = false,
	Callback = function(p60)
		vu50 = p60
		vu59(p60)
	end
})
local vu61 = game:GetService("RunService")
swimming = false
local vu62 = workspace.Gravity
local vu63 = nil
v47.Player:AddToggle("", {
	Title = "Air Swim",
	Description = "Allows you to swim in the air.",
	Default = false,
	Callback = function(p64)
		if p64 == true then
			if not swimming and (vu38 and vu38.Character) and vu38.Character:FindFirstChildWhichIsA("Humanoid") then
				vu62 = workspace.Gravity
				workspace.Gravity = 0
				local function v65()
					workspace.Gravity = vu62
					swimming = false
				end
				local vu66 = vu38.Character:FindFirstChildWhichIsA("Humanoid")
				gravReset = vu66.Died:Connect(v65)
				local v67 = Enum.HumanoidStateType:GetEnumItems()
				table.remove(v67, table.find(v67, Enum.HumanoidStateType.None))
				local v68, v69, v70 = pairs(v67)
				while true do
					local v71
					v70, v71 = v68(v69, v70)
					if v70 == nil then
						break
					end
					vu66:SetStateEnabled(v71, false)
				end
				vu66:ChangeState(Enum.HumanoidStateType.Swimming)
				vu63 = vu61.Heartbeat:Connect(function()
					pcall(function()
						vu38.Character.HumanoidRootPart.Velocity = (vu66.MoveDirection ~= Vector3.new() or vu35:IsKeyDown(Enum.KeyCode.Space)) and vu38.Character.HumanoidRootPart.Velocity or Vector3.new()
					end)
				end)
				swimming = true
			end
		elseif vu38 and vu38.Character and vu38.Character:FindFirstChildWhichIsA("Humanoid") then
			workspace.Gravity = vu62
			swimming = false
			if gravReset then
				gravReset:Disconnect()
			end
			if vu63 ~= nil then
				vu63:Disconnect()
				vu63 = nil
			end
			local v72 = vu38.Character:FindFirstChildWhichIsA("Humanoid")
			local v73 = Enum.HumanoidStateType:GetEnumItems()
			table.remove(v73, table.find(v73, Enum.HumanoidStateType.None))
			local v74, v75, v76 = pairs(v73)
			while true do
				local v77
				v76, v77 = v74(v75, v76)
				if v76 == nil then
					break
				end
				v72:SetStateEnabled(v77, true)
			end
		end
	end
})
v47.Player:AddButton({
	Title = "Anti Fling",
	Description = "Prevents you from getting flinged.",
	Callback = function()
		local vu78 = game:GetService("Players")
		local v79 = game:GetService("RunService")
		local vu80 = vu78.LocalPlayer
		v79.Stepped:Connect(function()
			local v81 = vu78
			local v82, v83, v84 = pairs(v81:GetChildren())
			while true do
				local v85
				v84, v85 = v82(v83, v84)
				if v84 == nil then
					break
				end
				if v85 ~= vu80 and v85.Character then
					local v86, v87, v88 = pairs(v85.Character:GetChildren())
					while true do
						local v89
						v88, v89 = v86(v87, v88)
						if v88 == nil then
							break
						end
						if v89.Name == "HumanoidRootPart" then
							v89.CanCollide = false
						end
					end
				end
			end
			local v90, v91, v92 = pairs(workspace:GetChildren())
			while true do
				local v93
				v92, v93 = v90(v91, v92)
				if v92 == nil then
					break
				end
				if v93:IsA("Accessory") and v93:FindFirstChildWhichIsA("Part") then
					v93:FindFirstChildWhichIsA("Part"):Destroy()
				end
			end
		end)
	end
})
v47.FeScripts:AddSection("Fling")
v47.FeScripts:AddInput("InPutKey", {
	Title = "Fling Player",
	Description = "Flings selected player",
	Default = "",
	Placeholder = "",
	Numeric = false,
	Finished = true,
	Callback = function(p94)
		local v95 = {
			p94
		}
		local vu96 = game:GetService("Players")
		local vu97 = vu96.LocalPlayer
		local vu98 = false
		local function v106(p99)
			local v100 = p99:lower()
			if v100 == "all" or v100 == "others" then
				vu98 = true
				return
			elseif v100 == "random" then
				local v101 = vu96:GetPlayers()
				if table.find(v101, vu97) then
					table.remove(v101, table.find(v101, vu97))
				end
				return v101[math.random(# v101)]
			elseif v100 ~= "random" and (v100 ~= "all" and v100 ~= "others") then
				local v102 = next
				local v103, v104 = vu96:GetPlayers()
				while true do
					local v105
					v104, v105 = v102(v103, v104)
					if v104 == nil then
						break
					end
					if v105 ~= vu97 then
						if v105.Name:lower():match("^" .. v100) then
							return v105
						end
						if v105.DisplayName:lower():match("^" .. v100) then
							return v105
						end
					end
				end
			end
		end
		local function v132(pu107)
			local vu108 = vu97.Character
			local vu109
			if vu108 then
				vu109 = vu108:FindFirstChildOfClass("Humanoid")
			else
				vu109 = vu108
			end
			local vu110
			if vu109 then
				vu110 = vu109.RootPart
			else
				vu110 = vu109
			end
			local vu111 = pu107.Character
			local vu112 = nil
			local v113 = nil
			local v114 = nil
			local v115 = nil
			local vu116
			if vu111:FindFirstChildOfClass("Humanoid") then
				vu116 = vu111:FindFirstChildOfClass("Humanoid")
			else
				vu116 = nil
			end
			if vu116 and vu116.RootPart then
				vu112 = vu116.RootPart
			end
			if vu111:FindFirstChild("Head") then
				v113 = vu111.Head
			end
			if vu111:FindFirstChildOfClass("Accessory") then
				v114 = vu111:FindFirstChildOfClass("Accessory")
			end
			if Accessoy and v114:FindFirstChild("Handle") then
				v115 = v114.Handle
			end
			if vu108 and (vu109 and vu110) then
				if vu110.Velocity.Magnitude < 50 then
					getgenv().OldPos = vu110.CFrame
				end
				if vu116 and (vu116.Sit and not vu98) then
					return vu1:Notify({
						Title = "Error",
						Content = "User is sitting.",
						SubContent = "",
						Duration = 5
					})
				end
				if v113 then
					workspace.CurrentCamera.CameraSubject = v113
				elseif v113 or not v115 then
					if vu116 and vu112 then
						workspace.CurrentCamera.CameraSubject = vu116
					end
				else
					workspace.CurrentCamera.CameraSubject = v115
				end
				if not vu111:FindFirstChildWhichIsA("BasePart") then
					return
				end
				local function vu120(p117, p118, p119)
					vu110.CFrame = CFrame.new(p117.Position) * p118 * p119
					vu108:SetPrimaryPartCFrame(CFrame.new(p117.Position) * p118 * p119)
					vu110.Velocity = Vector3.new(90000000, 900000000, 90000000)
					vu110.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
				end
				local function v125(p121)
					local v122 = tick()
					local v123 = 2
					local v124 = 0
					while vu110 and vu116 do
						if p121.Velocity.Magnitude >= 50 then
							vu120(p121, CFrame.new(0, 1.5, vu116.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, - vu116.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, 1.5, vu116.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, 1.5, vu112.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, - vu112.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, 1.5, vu112.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						else
							v124 = v124 + 100
							vu120(p121, CFrame.new(0, 1.5, 0) + vu116.MoveDirection * p121.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0) + vu116.MoveDirection * p121.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(2.25, 1.5, - 2.25) + vu116.MoveDirection * p121.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(- 2.25, - 1.5, 2.25) + vu116.MoveDirection * p121.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, 1.5, 0) + vu116.MoveDirection, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
							vu120(p121, CFrame.new(0, - 1.5, 0) + vu116.MoveDirection, CFrame.Angles(math.rad(v124), 0, 0))
							task.wait()
						end
						if p121.Velocity.Magnitude > 500 or (p121.Parent ~= pu107.Character or (pu107.Parent ~= vu96 or (not pu107.Character == vu111 or (vu116.Sit or (vu109.Health <= 0 or tick() > v122 + v123))))) then
							break
						end
					end
				end
				workspace.FallenPartsDestroyHeight = 0 / 0
				local v126 = Instance.new("BodyVelocity")
				v126.Name = "EpixVel"
				v126.Parent = vu110
				v126.Velocity = Vector3.new(900000000, 900000000, 900000000)
				v126.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
				vu109:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
				if vu112 and v113 then
					if (vu112.CFrame.p - v113.CFrame.p).Magnitude <= 5 then
						v125(vu112)
					else
						v125(v113)
					end
				elseif vu112 and not v113 then
					v125(vu112)
				elseif vu112 or not v113 then
					if vu112 or (v113 or not (v114 and v115)) then
						return vu1:Notify({
							Title = "Error",
							Content = "Something went wrong.",
							SubContent = "",
							Duration = 5
						})
					end
					v125(v115)
				else
					v125(v113)
				end
				v126:Destroy()
				vu109:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
				workspace.CurrentCamera.CameraSubject = vu109
				repeat
					vu110.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
					local v127 = vu108
					vu108.SetPrimaryPartCFrame(v127, getgenv().OldPos * CFrame.new(0, 0.5, 0))
					local v128 = vu109
					vu109.ChangeState(v128, "GettingUp")
					local v129 = vu108
					table.foreach(vu108.GetChildren(v129), function(_, p130)
						if p130:IsA("BasePart") then
							local v131 = Vector3.new()
							p130.RotVelocity = Vector3.new()
							p130.Velocity = v131
						end
					end)
					task.wait()
				until (vu110.Position - getgenv().OldPos.p).Magnitude < 25
				workspace.FallenPartsDestroyHeight = getgenv().FPDH
			else
				local _ = vu1.Notify
			end
		end
		if v95[1] then
			local v133 = next
			local v134 = vu97
			local v135 = v95
			local v136 = vu96
			local v137 = vu98
			local v138 = nil
			while true do
				local v139
				v138, v139 = v133(v95, v138)
				if v138 == nil then
					break
				end
				v106(v139)
			end
			if v137 then
				local v140 = next
				local v141, v142 = v136:GetPlayers()
				while true do
					local v143
					v142, v143 = v140(v141, v142)
					if v142 == nil then
						break
					end
					v132(v143)
				end
			end
			local v144 = next
			local v145 = nil
			while true do
				local v146
				v145, v146 = v144(v135, v145)
				if v145 == nil then
					break
				end
				if v106(v146) and v106(v146) ~= v134 then
					local v147 = v106(v146)
					if v147 then
						v132(v147)
					end
				elseif not (v106(v146) or v137) then
					vu1:Notify({
						Title = "Error",
						Content = "Username invaild.",
						SubContent = "",
						Duration = 5
					})
				end
			end
		end
	end
})
v47.FeScripts:AddButton({
	Title = "FE Fling All",
	Description = "Flings everyone, only works if the game has collisons enabled.",
	Callback = function()
		if vu14 then
			local v148 = {
				"All"
			}
			local vu149 = game:GetService("Players")
			local vu150 = vu149.LocalPlayer
			local vu151 = false
			local function v159(p152)
				local v153 = p152:lower()
				if v153 == "all" or v153 == "others" then
					vu151 = true
					return
				elseif v153 == "random" then
					local v154 = vu149:GetPlayers()
					if table.find(v154, vu150) then
						table.remove(v154, table.find(v154, vu150))
					end
					return v154[math.random(# v154)]
				elseif v153 ~= "random" and (v153 ~= "all" and v153 ~= "others") then
					local v155 = next
					local v156, v157 = vu149:GetPlayers()
					while true do
						local v158
						v157, v158 = v155(v156, v157)
						if v157 == nil then
							break
						end
						if v158 ~= vu150 then
							if v158.Name:lower():match("^" .. v153) then
								return v158
							end
							if v158.DisplayName:lower():match("^" .. v153) then
								return v158
							end
						end
					end
				end
			end
			local function v185(pu160)
				local vu161 = vu150.Character
				local vu162
				if vu161 then
					vu162 = vu161:FindFirstChildOfClass("Humanoid")
				else
					vu162 = vu161
				end
				local vu163
				if vu162 then
					vu163 = vu162.RootPart
				else
					vu163 = vu162
				end
				local vu164 = pu160.Character
				local vu165 = nil
				local v166 = nil
				local v167 = nil
				local v168 = nil
				local vu169
				if vu164:FindFirstChildOfClass("Humanoid") then
					vu169 = vu164:FindFirstChildOfClass("Humanoid")
				else
					vu169 = nil
				end
				if vu169 and vu169.RootPart then
					vu165 = vu169.RootPart
				end
				if vu164:FindFirstChild("Head") then
					v166 = vu164.Head
				end
				if vu164:FindFirstChildOfClass("Accessory") then
					v167 = vu164:FindFirstChildOfClass("Accessory")
				end
				if Accessoy and v167:FindFirstChild("Handle") then
					v168 = v167.Handle
				end
				if vu161 and (vu162 and vu163) then
					if vu163.Velocity.Magnitude < 50 then
						getgenv().OldPos = vu163.CFrame
					end
					if vu169 and (vu169.Sit and not vu151) then
						return vu1:Notify({
							Title = "Error",
							Content = "User is sitting.",
							SubContent = "",
							Duration = 5
						})
					end
					if v166 then
						workspace.CurrentCamera.CameraSubject = v166
					elseif v166 or not v168 then
						if vu169 and vu165 then
							workspace.CurrentCamera.CameraSubject = vu169
						end
					else
						workspace.CurrentCamera.CameraSubject = v168
					end
					if not vu164:FindFirstChildWhichIsA("BasePart") then
						return
					end
					local function vu173(p170, p171, p172)
						vu163.CFrame = CFrame.new(p170.Position) * p171 * p172
						vu161:SetPrimaryPartCFrame(CFrame.new(p170.Position) * p171 * p172)
						vu163.Velocity = Vector3.new(90000000, 900000000, 90000000)
						vu163.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
					end
					local function v178(p174)
						local v175 = tick()
						local v176 = 2
						local v177 = 0
						while vu163 and vu169 do
							if p174.Velocity.Magnitude >= 50 then
								vu173(p174, CFrame.new(0, 1.5, vu169.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, - vu169.WalkSpeed), CFrame.Angles(0, 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, 1.5, vu169.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, 1.5, vu165.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, - vu165.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, 1.5, vu165.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
								task.wait()
							else
								v177 = v177 + 100
								vu173(p174, CFrame.new(0, 1.5, 0) + vu169.MoveDirection * p174.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0) + vu169.MoveDirection * p174.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(2.25, 1.5, - 2.25) + vu169.MoveDirection * p174.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(- 2.25, - 1.5, 2.25) + vu169.MoveDirection * p174.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, 1.5, 0) + vu169.MoveDirection, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
								vu173(p174, CFrame.new(0, - 1.5, 0) + vu169.MoveDirection, CFrame.Angles(math.rad(v177), 0, 0))
								task.wait()
							end
							if p174.Velocity.Magnitude > 500 or (p174.Parent ~= pu160.Character or (pu160.Parent ~= vu149 or (not pu160.Character == vu164 or (vu169.Sit or (vu162.Health <= 0 or tick() > v175 + v176))))) then
								break
							end
						end
					end
					workspace.FallenPartsDestroyHeight = 0 / 0
					local v179 = Instance.new("BodyVelocity")
					v179.Name = "EpixVel"
					v179.Parent = vu163
					v179.Velocity = Vector3.new(900000000, 900000000, 900000000)
					v179.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
					vu162:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
					if vu165 and v166 then
						if (vu165.CFrame.p - v166.CFrame.p).Magnitude <= 5 then
							v178(vu165)
						else
							v178(v166)
						end
					elseif vu165 and not v166 then
						v178(vu165)
					elseif vu165 or not v166 then
						if vu165 or (v166 or not (v167 and v168)) then
							return vu1:Notify({
								Title = "Error",
								Content = "Something went wrong.",
								SubContent = "",
								Duration = 5
							})
						end
						v178(v168)
					else
						v178(v166)
					end
					v179:Destroy()
					vu162:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
					workspace.CurrentCamera.CameraSubject = vu162
					repeat
						vu163.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
						local v180 = vu161
						vu161.SetPrimaryPartCFrame(v180, getgenv().OldPos * CFrame.new(0, 0.5, 0))
						local v181 = vu162
						vu162.ChangeState(v181, "GettingUp")
						local v182 = vu161
						table.foreach(vu161.GetChildren(v182), function(_, p183)
							if p183:IsA("BasePart") then
								local v184 = Vector3.new()
								p183.RotVelocity = Vector3.new()
								p183.Velocity = v184
							end
						end)
						task.wait()
					until (vu163.Position - getgenv().OldPos.p).Magnitude < 25
					workspace.FallenPartsDestroyHeight = getgenv().FPDH
				else
					local _ = vu1.Notify
				end
			end
			if not v148[1] then
				return
			end
			local v186 = next
			local v187 = vu150
			local v188 = v148
			local v189 = vu149
			local v190 = vu151
			local v191 = nil
			while true do
				local v192
				v191, v192 = v186(v148, v191)
				if v191 == nil then
					break
				end
				v159(v192)
			end
			if v190 then
				local v193 = next
				local v194, v195 = v189:GetPlayers()
				while true do
					local v196
					v195, v196 = v193(v194, v195)
					if v195 == nil then
						break
					end
					v185(v196)
				end
			end
			local v197 = next
			local v198 = nil
			while true do
				local v199
				v198, v199 = v197(v188, v198)
				if v198 == nil then
					break
				end
				if v159(v199) and v159(v199) ~= v187 then
					local v200 = v159(v199)
					if v200 then
						v185(v200)
					end
				elseif not (v159(v199) or v190) then
					vu1:Notify({
						Title = "Error",
						Content = "Username invaild.",
						SubContent = "",
						Duration = 5
					})
				end
			end
		else
			vu1:Notify({
				Title = "Error",
				Content = "You must own premium in order to use this.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v47.Player:AddSection("Properties Changers")
local vu201 = 16
local vu202 = 50
local vu203 = workspace.Gravity
local vu204 = vu203
v47.Player:AddSlider("", {
	Title = "Speed",
	Description = "How fast can fast be",
	Default = 16,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(p205)
		vu201 = p205
	end
})
v47.Player:AddSlider("", {
	Title = "JumpPower",
	Description = "How high can you really jump",
	Default = 50,
	Min = 1,
	Max = 1000,
	Rounding = 0.1,
	Callback = function(p206)
		vu202 = p206
	end
})
v47.Player:AddSlider("", {
	Title = "Gravity",
	Description = "moon but earth",
	Default = vu203,
	Min = 1,
	Max = 500,
	Rounding = 0.1,
	Callback = function(p207)
		vu204 = p207
	end
})
local vu208 = nil
local vu209 = nil
local vu210 = nil
local function vu211()
	if vu209 ~= true then
		vu38.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
	else
		vu38.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = vu201
	end
end
local function vu212()
	if vu208 ~= true then
		workspace.Gravity = vu203
	else
		workspace.Gravity = vu204
	end
end
local function vu213()
	if vu210 ~= true then
		if vu38.Character:FindFirstChildOfClass("Humanoid").UseJumpPower ~= true then
			vu38.Character:FindFirstChildOfClass("Humanoid").JumpHeight = 50
		else
			vu38.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
		end
	elseif vu38.Character:FindFirstChildOfClass("Humanoid").UseJumpPower ~= true then
		vu38.Character:FindFirstChildOfClass("Humanoid").JumpHeight = vu202
	else
		vu38.Character:FindFirstChildOfClass("Humanoid").JumpPower = vu202
	end
end
v47.Player:AddToggle("", {
	Title = "Enable Speed",
	Description = "Enables/disables speed changers (may get you kicked if your game has a anticheat)",
	Default = false,
	Callback = function(p214)
		vu209 = p214
		repeat
			vu211(p214)
			task.wait(0.1)
		until vu209 == false
	end
})
v47.Player:AddToggle("", {
	Title = "Enable JumpPower",
	Description = "Enables/disables jumppower changers (may get you kicked if your game has a anticheat)",
	Default = false,
	Callback = function(p215)
		vu210 = p215
		repeat
			vu213()
			task.wait(0.1)
		until vu210 == false
	end
})
v47.Player:AddToggle("", {
	Title = "Enable Gravity",
	Description = "Enables/disables gravity changers (may get you kicked if your game has a anticheat)",
	Default = false,
	Callback = function(p216)
		vu208 = p216
		repeat
			vu212()
			task.wait(0.1)
		until vu208 == false
	end
})
v47.Tools:AddSection("Main")
v47.Tools:AddButton({
	Title = "Fast ProximityPromots",
	Description = "Allows you to activate all proximityprompts instantly.",
	Callback = function()
		local v217, v218, v219 = pairs(workspace:GetDescendants())
		local v220 = {}
		local v221 = 0.1
		while true do
			local v222
			v219, v222 = v217(v218, v219)
			if v219 == nil then
				break
			end
			if v222:IsA("ProximityPrompt") then
				v220[v222] = v222.HoldDuration
				v222.HoldDuration = v221
			end
		end
	end
})
v47.Tools:AddButton({
	Title = "Anti Kick (Client)",
	Description = "Bypasses any kicks from the client.",
	Callback = function()
		if hookmetamethod then
			local vu223 = game:GetService("Players").LocalPlayer
			local vu224 = nil
			local vu225 = nil
			vu224 = hookmetamethod(game, "__index", function(p226, p227)
				if p226 ~= vu223 or p227:lower() ~= "kick" then
					return vu224(p226, p227)
				else
					return error("Expected \':\' not \'.\' calling member function Kick", 2)
				end
			end)
			vu225 = hookmetamethod(game, "__namecall", function(p228, ...)
				if p228 ~= vu223 or getnamecallmethod():lower() ~= "kick" then
					return vu225(p228, ...)
				end
			end)
			vu1:Notify({
				Title = "MikeyHub : ",
				Content = "Anti Kick is now active, this is only for client kicks, if you get kicked by server it wont bypass it.",
				SubContent = "Your Executor Is Trash.",
				Duration = 5
			})
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Your Executor Does Not Support This Feature.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v47.Tools:AddSection("Tools")
v47.Tools:AddButton({
	Title = "BTools",
	Description = "Gives you btools.",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
	end
})
v47.Tools:AddButton({
	Title = "Teleport Tool",
	Description = "Gives you the teleport tool (click anywhere to teleport).",
	Callback = function()
		local vu229 = vu38:GetMouse()
		local v230 = Instance.new("Tool")
		v230.Name = "Teleport Tool"
		v230.RequiresHandle = false
		v230.Parent = vu38.Backpack
		v230.Activated:Connect(function()
			local v231 = vu38.Character or workspace:FindFirstChild(vu38.Name)
			local v232
			if v231 then
				v232 = v231:FindFirstChild("HumanoidRootPart")
			else
				v232 = v231
			end
			if not (v231 and v232) then
				return warn("Failed to find HumanoidRootPart")
			end
			v232.CFrame = CFrame.new(vu229.Hit.X, vu229.Hit.Y + 3, vu229.Hit.Z, select(4, v232.CFrame:components()))
		end)
	end
})
v47.Tools:AddButton({
	Title = "Remove All Tools",
	Description = "Removes all of your tools from inventory.",
	Callback = function()
		local v233, v234, v235 = pairs(vu38:FindFirstChildOfClass("Backpack"):GetDescendants())
		while true do
			local v236
			v235, v236 = v233(v234, v235)
			if v235 == nil then
				break
			end
			if v236:IsA("Tool") or v236:IsA("HopperBin") then
				v236:Destroy()
			end
		end
		local v237, v238, v239 = pairs(vu38.Character:GetDescendants())
		while true do
			local v240
			v239, v240 = v237(v238, v239)
			if v239 == nil then
				break
			end
			if v240:IsA("Tool") or v240:IsA("HopperBin") then
				v240:Destroy()
			end
		end
	end
})
v47.Combat:AddParagraph({
	Title = "Note : ",
	Content = "Most of these options may not work on all games."
})
v47.Combat:AddSection("Hitbox Expander")
local vu241 = 15
local vu242 = 1
local vu243 = nil
local vu244 = false
v47.Combat:AddSlider("", {
	Title = "Hitbox Size",
	Description = "",
	Default = 5,
	Min = 1,
	Max = 100,
	Rounding = 0.1,
	Callback = function(p245)
		vu241 = p245
	end
})
v47.Combat:AddToggle("", {
	Title = "Hitbox Visualizer",
	Description = "Makes player hitbox visible.",
	Default = false,
	Callback = function(p246)
		vu244 = p246
	end
})
v47.Combat:AddToggle("", {
	Title = "Hitbox Expander",
	Description = "In short terms, reach",
	Default = false,
	Callback = function(p247)
		vu243 = p247
		while vu243 do
			local v248 = next
			local v249, v250 = game:GetService("Players"):GetPlayers()
			while true do
				local vu251
				v250, vu251 = v248(v249, v250)
				if v250 == nil then
					break
				end
				if vu251.Name ~= game:GetService("Players").LocalPlayer.Name then
					pcall(function()
						vu251.Character.HumanoidRootPart.Size = Vector3.new(vu241, vu241, vu241)
						vu251.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						if vu244 ~= true then
							vu251.Character.HumanoidRootPart = vu242
						else
							vu251.Character.HumanoidRootPart.Transparency = 0.5
						end
						vu251.Character.HumanoidRootPart.Material = "Neon"
						vu251.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
			task.wait(1)
		end
	end
})
v47.Teleport:AddSection("Teleport To Player")
local vu252 = "None"
local v253 = {}
local v254 = game:GetService("Players")
if v254 then
	local v255, v256, v257 = pairs(v254:GetPlayers())
	while true do
		local v258, v259 = v255(v256, v257)
		if v258 == nil then
			break
		end
		v257 = v258
		if v259 ~= vu38 then
			table.insert(v253, v259.Name)
		end
	end
end
local vu260 = v47.Teleport:AddDropdown("", {
	Title = "Target Player",
	Description = "Choose the player you wanna troll.",
	Values = v253,
	Multi = false,
	Default = 1
})
local v261 = vu260
vu260.OnChanged(v261, function(p262)
	vu252 = p262
end)
local function v264(p263)
	vu260:SetValue(tostring(p263.Name))
end
v254.PlayerAdded:Connect(v264)
v47.Teleport:AddButton({
	Title = "Teleport",
	Description = "Teleports you to targetted player.",
	Callback = function()
		local v265 = game.Players.LocalPlayer.Character.HumanoidRootPart
		local v266 = game:GetService("Players"):FindFirstChild(vu252)
		if v266 then
			if v266.Character and v266.Character:FindFirstChild("HumanoidRootPart") then
				local _ = v265.CFrame
				v265.CFrame = v266.Character.HumanoidRootPart.CFrame
			else
				vu1:Notify({
					Title = "Error.",
					Content = "Player found but not ingame (they\'re in menu).",
					SubContent = "",
					Duration = 5
				})
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Player Not Found.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v47.Teleport:AddSection("Teleport To Saved Location")
local vu267 = nil
v47.Teleport:AddButton({
	Title = "Save Location",
	Description = "Saves your current location.",
	Callback = function()
		vu267 = vu38.Character.HumanoidRootPart.CFrame
	end
})
v47.Teleport:AddButton({
	Title = "Teleport To Save Location",
	Description = "Teleports you to your saved location.",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu267
	end
})
v47.Teleport:AddSection("Other")
v47.Teleport:AddButton({
	Title = "Teleport To Random Player",
	Description = "Teleports to random player.",
	Callback = function()
		local function vu271(p268)
			local v269 = game:GetService("Players"):GetPlayers()
			if # v269 <= 1 then
				return nil
			end
			local v270 = v269[math.random(1, # v269)]
			local _ = v270 == p268
			return v270
		end
		local v272 = game.Players.LocalPlayer.Character.HumanoidRootPart
		local v273 = vu271(nil)
		if v273 then
			if v273.Character and v273.Character:FindFirstChild("HumanoidRootPart") then
				local _ = v272.CFrame
				v272.CFrame = v273.Character.HumanoidRootPart.CFrame
			else
				vu1:Notify({
					Title = "Error.",
					Content = "Random player isn\'t ingame, (execute code again)",
					SubContent = "",
					Duration = 5
				})
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "No Players Found.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v47.Chat:AddSection("Main")
v47.Chat:AddButton({
	Title = "Chat Spy",
	Description = "Allows you to see chat if its hidden.",
	Callback = function()
		local v274 = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Chat"):GetChildren()
		if v274 then
			local v275, v276, v277 = pairs(v274)
			while true do
				local v278
				v277, v278 = v275(v276, v277)
				if v277 == nil then
					break
				end
				if v278 and v278:FindFirstChild("ChatChannelParentFrame") then
					v278.ChatChannelParentFrame.Visible = true
				else
					vu1:Notify({
						Title = "Error.",
						Content = "Failed to find chat frame.",
						SubContent = "",
						Duration = 5
					})
				end
			end
		else
			vu1:Notify({
				Title = "Error.",
				Content = "Failed to find chat.",
				SubContent = "",
				Duration = 5
			})
		end
	end
})
v47.Chat:AddSection("Chat Tag")
local vu279 = "MikeyHub Is Best Hub"
local vu280 = game:GetService("TextChatService")
local vu281 = game:GetService("Players")
local vu282 = vu281.LocalPlayer;
({}).Color = "#6df76f"
local vu283 = Color3.fromRGB(109, 247, 111)
v47.Chat:AddInput("Input", {
	Title = "Tag Name",
	Description = "",
	Default = "",
	Placeholder = "",
	Numeric = false,
	Finished = false,
	Callback = function(p284)
		vu279 = p284
	end
})
local vu285 = v47.Chat:AddColorpicker("Colorpicker", {
	Title = "Tag Color",
	Description = "",
	Default = Color3.fromRGB(109, 247, 111)
})
local v286 = vu285
vu285.OnChanged(v286, function()
	vu283 = (function(p287)
		local v288 = math.floor(p287.R * 255)
		local v289 = math.floor(p287.G * 255)
		local v290 = math.floor(p287.B * 255)
		return string.format("#%02X%02X%02X", v288, v289, v290)
	end)(vu285.Value)
end)
v47.Chat:AddToggle("MyToggle", {
	Title = "Chat Tag",
	Description = "Adds a tag besides your name (client sided, only you will see this)",
	Default = false,
	Callback = function(pu291)
		function vu280.OnIncomingMessage(p292, _)
			local v293 = Instance.new("TextChatMessageProperties")
			if vu281:GetPlayerByUserId(p292.TextSource.UserId).Name == vu282.Name and pu291 == true then
				v293.PrefixText = "<font color=\"" .. vu283 .. "\">" .. vu279 .. "</font> " .. p292.PrefixText
			end
			return v293
		end
	end
})
v47.Visuals:AddSection("ESP")
local vu294 = Color3.fromRGB(255, 255, 255)
local vu295 = Color3.fromRGB(255, 255, 255)
local _ = game:GetService("Players").LocalPlayer
local vu296 = v47.Visuals:AddColorpicker("Colorpicker", {
	Title = "Fill Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local vu297 = v47.Visuals:AddColorpicker("Colorpicker", {
	Title = "Outline Color",
	Description = "",
	Default = Color3.fromRGB(255, 255, 255)
})
local v298 = vu296
vu296.OnChanged(v298, function()
	vu294 = vu296.Value
end)
local v299 = vu297
vu297.OnChanged(v299, function()
	vu295 = vu297.Value
end)
v47.Visuals:AddToggle("", {
	Title = "ESP",
	Description = "Highlights every player, allowing you to see them from afar.",
	Default = false,
	Callback = function(p300)
		getgenv().enabled = p300
		getgenv().filluseteamcolor = false
		getgenv().outlineuseteamcolor = false
		getgenv().fillcolor = vu294
		getgenv().outlinecolor = vu295
		getgenv().filltrans = 0
		getgenv().outlinetrans = 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
	end
})
v47.Visuals:AddSection("World")
local vu301 = game:GetService("Lighting")
local vu302 = vu301.Ambient
v47.Visuals:AddToggle("", {
	Title = "Full Bright",
	Description = "light up light up the world",
	Default = false,
	Callback = function(p303)
		if p303 == true then
			vu301.Ambient = Color3.new(1, 1, 1)
			vu301.ColorShift_Bottom = Color3.new(1, 1, 1)
			vu301.ColorShift_Top = Color3.new(1, 1, 1)
		else
			vu301.Ambient = vu302
			vu301.ColorShift_Bottom = Color3.new()
			vu301.ColorShift_Top = Color3.new()
		end
	end
})
v47.Visuals:AddToggle("", {
	Title = "Night / Day",
	Description = "Changes the time to night.",
	Default = false,
	Callback = function(p304)
		if p304 == true then
			vu301.ClockTime = 0
		else
			vu301.ClockTime = 14
		end
	end
})
v47.Visuals:AddButton({
	Title = "No Fog",
	Description = "Removes fog.",
	Callback = function()
		vu301.FogEnd = 100000
		local v305 = vu301
		local v306, v307, v308 = pairs(v305:GetDescendants())
		while true do
			local v309
			v308, v309 = v306(v307, v308)
			if v308 == nil then
				break
			end
			if v309:IsA("Atmosphere") then
				v309:Destroy()
			end
		end
	end
})
function getRoot(p310)
	return p310:FindFirstChild("HumanoidRootPart") or (p310:FindFirstChild("Torso") or p310:FindFirstChild("UpperTorso"))
end
function randomString()
	local v311 = {}
	for v312 = 1, math.random(10, 20) do
		v311[v312] = string.char(math.random(32, 126))
	end
	return table.concat(v311)
end
v47.Trolling:AddSection("Main")
flinging = false
v47.Trolling:AddToggle("", {
	Title = "Fling",
	Description = "Only works if you can collide into player",
	Default = false,
	Callback = function(p313)
		if p313 == true then
			flinging = false
			local v314, v315, v316 = pairs(vu38.Character:GetDescendants())
			while true do
				local v317
				v316, v317 = v314(v315, v316)
				if v316 == nil then
					break
				end
				if v317:IsA("BasePart") then
					v317.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
				end
			end
			wait(0.1)
			local v318 = Instance.new("BodyAngularVelocity")
			v318.Name = randomString()
			v318.Parent = getRoot(vu38.Character)
			v318.AngularVelocity = Vector3.new(0, 99999, 0)
			v318.MaxTorque = Vector3.new(0, math.huge, 0)
			v318.P = math.huge
			local v319 = vu38.Character:GetChildren()
			local v320 = next
			local v321 = nil
			while true do
				local v322
				v321, v322 = v320(v319, v321)
				if v321 == nil then
					break
				end
				if v322:IsA("BasePart") then
					v322.CanCollide = false
					v322.Massless = true
					v322.Velocity = Vector3.new(0, 0, 0)
				end
			end
			flinging = true
			flingDied = vu38.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
				flinging = false
			end)
			repeat
				v318.AngularVelocity = Vector3.new(0, 99999, 0)
				wait(0.2)
				v318.AngularVelocity = Vector3.new(0, 0, 0)
				wait(0.1)
			until flinging == false
		else
			if flingDied then
				flingDied:Disconnect()
			end
			flinging = false
			wait(0.1)
			local v323 = vu38.Character
			if not (v323 and getRoot(v323)) then
				return
			end
			local v324, v325, v326 = pairs(getRoot(v323):GetChildren())
			while true do
				local v327
				v326, v327 = v324(v325, v326)
				if v326 == nil then
					break
				end
				if v327.ClassName == "BodyAngularVelocity" then
					v327:Destroy()
				end
			end
			local v328, v329, v330 = pairs(v323:GetDescendants())
			while true do
				local v331
				v330, v331 = v328(v329, v330)
				if v330 == nil then
					break
				end
				if v331.ClassName == "Part" or v331.ClassName == "MeshPart" then
					v331.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
				end
			end
		end
	end
})
v47.Misc:AddSection("Main")
local vu332 = game:GetService("RunService")
v47.Misc:AddButton({
	Title = "Anti Lag",
	Description = "Makes your game run better",
	Callback = function()
		local v333 = workspace:FindFirstChildOfClass("Terrain")
		v333.WaterWaveSize = 0
		v333.WaterWaveSpeed = 0
		v333.WaterReflectance = 0
		v333.WaterTransparency = 0
		vu301.GlobalShadows = false
		vu301.FogEnd = 9000000000
		settings().Rendering.QualityLevel = 1
		local v334, v335, v336 = pairs(game:GetDescendants())
		while true do
			local v337
			v336, v337 = v334(v335, v336)
			if v336 == nil then
				break
			end
			if v337:IsA("Part") or (v337:IsA("UnionOperation") or (v337:IsA("MeshPart") or (v337:IsA("CornerWedgePart") or v337:IsA("TrussPart")))) then
				v337.Material = "Plastic"
				v337.Reflectance = 0
			elseif v337:IsA("Decal") then
				v337.Transparency = 1
			elseif v337:IsA("ParticleEmitter") or v337:IsA("Trail") then
				v337.Lifetime = NumberRange.new(0)
			elseif v337:IsA("Explosion") then
				v337.BlastPressure = 1
				v337.BlastRadius = 1
			end
		end
		local v338 = vu301
		local v339, v340, v341 = pairs(v338:GetDescendants())
		while true do
			local v342
			v341, v342 = v339(v340, v341)
			if v341 == nil then
				break
			end
			if v342:IsA("BlurEffect") or (v342:IsA("SunRaysEffect") or (v342:IsA("ColorCorrectionEffect") or (v342:IsA("BloomEffect") or v342:IsA("DepthOfFieldEffect")))) then
				v342.Enabled = false
			end
		end
		workspace.DescendantAdded:Connect(function(pu343)
			task.spawn(function()
				if pu343:IsA("ForceField") then
					vu332.Heartbeat:Wait()
					pu343:Destroy()
				elseif pu343:IsA("Sparkles") then
					vu332.Heartbeat:Wait()
					pu343:Destroy()
				elseif pu343:IsA("Smoke") or pu343:IsA("Fire") then
					vu332.Heartbeat:Wait()
					pu343:Destroy()
				end
			end)
		end)
	end
})
v47.Misc:AddButton({
	Title = "Anti AFK",
	Description = "Prevents you from being kicked for being afk.",
	Callback = function()
		local v344 = next
		local v345, v346 = getconnections(game:GetService("Players").LocalPlayer.Idled)
		while true do
			local v347
			v346, v347 = v344(v345, v346)
			if v346 == nil then
				break
			end
			v347:Disable()
		end
	end
})
v47.Misc:AddButton({
	Title = "Force Reset",
	Description = "If you wanna live, don\'t use this lol",
	Callback = function()
		vu38.Character.Humanoid.Health = 0
	end
})
v47.Misc:AddButton({
	Title = "Rejoin Server",
	Description = "Rejoins the game you\'re currently in.",
	Callback = function()
		local v348 = game:GetService("TeleportService")
		local v349 = game:GetService("Players").LocalPlayer
		v348:Teleport(game.PlaceId, v349)
	end
})
v47.Misc:AddSection("Other")
v47.Misc:AddToggle("", {
	Title = "First Person ",
	Description = "Locks your camera into first person, open menu to move mouse around to turn off.",
	Default = false,
	Callback = function(p350)
		if p350 == true then
			vu38.CameraMode = Enum.CameraMode.LockFirstPerson
		else
			vu38.CameraMode = Enum.CameraMode.Classic
		end
	end
})
v47.Misc:AddButton({
	Title = "Camera Unlock",
	Description = "Removes the maxium zoom distance",
	Callback = function()
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999999
	end
})
vu26:SelectTab(1)
