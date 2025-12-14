local vu1 = game:GetService("Players")
local vu2 = game:GetService("Workspace")
local vu3 = game:GetService("RunService")
local vu4 = game:GetService("UserInputService")
local vu5 = {}
vu5.__index = vu5
vu5.Config = {
    TeamCheck = true,
    ESPDistance = 325,
    BoxColor = Color3.new(0.403922, 0.34902, 0.701961),
    SkeletonColor = Color3.new(0.403922, 0.34902, 0.701961),
    ChamsColor = Color3.new(1, 0, 0),
    TracerOrigin = "Bottom Screen",
    TracerColor = Color3.new(0.403922, 0.34902, 0.701961)
}
vu5.State = {
    BoxEnabled = false,
    NameEnabled = false,
    DistanceEnabled = false,
    SkeletonEnabled = false,
    HealthTextEnabled = false,
    HealthBarEnabled = false,
    TracerEnabled = false,
    ChamsEnabled = false
}
vu5.Caches = {
    BoxCache = {},
    SkeletonCache = {},
    HealthCache = {},
    TracerCache = {},
    ChamsCache = {}
}
local vu6 = vu1.LocalPlayer
local vu7 = vu2.CurrentCamera
local vu8 = 30
local vu9 = nil
local vu10 = nil
local function vu14(p11)
    local v12, v13 = pcall(p11)
    if not v12 then
        warn("ZixyESP Error: " .. tostring(v13))
    end
end
function vu5.CreateBox(p15, _)
    local v16 = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        HealthText = Drawing.new("Text"),
        HealthBarBackground = Drawing.new("Square"),
        HealthBar = Drawing.new("Square")
    }
    v16.Box.Thickness = 2
    v16.Box.Color = p15.Config.BoxColor
    v16.Box.Filled = false
    v16.Box.Visible = false
    v16.Name.Size = 16
    v16.Name.Color = Color3.new(1, 1, 1)
    v16.Name.Outline = true
    v16.Name.Center = true
    v16.Name.Visible = false
    v16.Distance.Size = 16
    v16.Distance.Color = Color3.new(1, 1, 1)
    v16.Distance.Outline = true
    v16.Distance.Center = true
    v16.Distance.Visible = false
    v16.HealthText.Size = 16
    v16.HealthText.Color = Color3.new(1, 1, 1)
    v16.HealthText.Outline = true
    v16.HealthText.Center = true
    v16.HealthText.Visible = false
    v16.HealthBarBackground.Size = Vector2.new(5, 50)
    v16.HealthBarBackground.Color = Color3.new(0, 0, 0)
    v16.HealthBarBackground.Filled = true
    v16.HealthBarBackground.Transparency = 0.5
    v16.HealthBarBackground.Visible = false
    v16.HealthBar.Size = Vector2.new(5, 50)
    v16.HealthBar.Color = Color3.new(0, 1, 0)
    v16.HealthBar.Filled = true
    v16.HealthBar.Visible = false
    return v16
end
function vu5.CreateSkeleton(p17, p18)
    local v19 = p18.Character
    local v20 = v19 and v19:FindFirstChild("Torso")
    if v20 then
        v20 = not v19:FindFirstChild("UpperTorso")
    end
    local v21
    if v20 then
        v21 = {
            HeadToTorso = Drawing.new("Line"),
            TorsoToLeftArm = Drawing.new("Line"),
            TorsoToRightArm = Drawing.new("Line"),
            TorsoToLeftLeg = Drawing.new("Line"),
            TorsoToRightLeg = Drawing.new("Line")
        }
    else
        v21 = {
            HeadToUpperTorso = Drawing.new("Line"),
            UpperTorsoToLowerTorso = Drawing.new("Line"),
            UpperTorsoToLeftUpperArm = Drawing.new("Line"),
            LeftUpperArmToLeftLowerArm = Drawing.new("Line"),
            LeftLowerArmToLeftHand = Drawing.new("Line"),
            UpperTorsoToRightUpperArm = Drawing.new("Line"),
            RightUpperArmToRightLowerArm = Drawing.new("Line"),
            RightLowerArmToRightHand = Drawing.new("Line"),
            LowerTorsoToLeftUpperLeg = Drawing.new("Line"),
            LeftUpperLegToLeftLowerLeg = Drawing.new("Line"),
            LeftLowerLegToLeftFoot = Drawing.new("Line"),
            LowerTorsoToRightUpperLeg = Drawing.new("Line"),
            RightUpperLegToRightLowerLeg = Drawing.new("Line"),
            RightLowerLegToRightFoot = Drawing.new("Line")
        }
    end
    local v22, v23, v24 = pairs(v21)
    while true do
        local v25
        v24, v25 = v22(v23, v24)
        if v24 == nil then
            break
        end
        v25.Thickness = 2
        v25.Color = p17.Config.SkeletonColor
        v25.Visible = false
    end
    return v21
end
function vu5.CreateTracer(p26, _)
    local v27 = Drawing.new("Line")
    v27.Thickness = 2
    v27.Color = p26.Config.TracerColor
    v27.Visible = false
    return v27
end
function vu5.CreateChams(p28, p29)
    local v30 = Instance.new("Highlight")
    v30.FillColor = p28.Config.ChamsColor
    v30.OutlineColor = Color3.new(1, 1, 1)
    v30.FillTransparency = 0.5
    v30.OutlineTransparency = 0
    v30.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    v30.Parent = p29.Character
    v30.Adornee = p29.Character
    return v30
end
function vu5.ClearBox(p31, p32)
    if p31.Caches.BoxCache[p32] then
        p31.Caches.BoxCache[p32].Box:Remove()
        p31.Caches.BoxCache[p32].Name:Remove()
        p31.Caches.BoxCache[p32].Distance:Remove()
        p31.Caches.BoxCache[p32].HealthText:Remove()
        p31.Caches.BoxCache[p32].HealthBarBackground:Remove()
        p31.Caches.BoxCache[p32].HealthBar:Remove()
        p31.Caches.BoxCache[p32] = nil
    end
end
function vu5.ClearSkeleton(p33, p34)
    if p33.Caches.SkeletonCache[p34] then
        local v35, v36, v37 = pairs(p33.Caches.SkeletonCache[p34])
        while true do
            local v38
            v37, v38 = v35(v36, v37)
            if v37 == nil then
                break
            end
            v38:Remove()
        end
        p33.Caches.SkeletonCache[p34] = nil
    end
end
function vu5.ClearTracer(p39, p40)
    if p39.Caches.TracerCache[p40] then
        p39.Caches.TracerCache[p40]:Remove()
        p39.Caches.TracerCache[p40] = nil
    end
end
function vu5.ClearChams(p41, p42)
    if p41.Caches.ChamsCache[p42] then
        p41.Caches.ChamsCache[p42]:Destroy()
        p41.Caches.ChamsCache[p42] = nil
    end
end
function vu5.UpdateBox(p43)
    if p43.State.BoxEnabled or (p43.State.NameEnabled or (p43.State.DistanceEnabled or (p43.State.HealthTextEnabled or p43.State.HealthBarEnabled))) then
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            local v44 = vu6.Character.HumanoidRootPart
            local v45 = vu1
            local v46, v47, v48 = ipairs(v45:GetPlayers())
            while true do
                local v49
                v48, v49 = v46(v47, v48)
                if v48 == nil then
                    break
                end
                if v49 ~= vu6 then
                    if v49.Character and (v49.Character:FindFirstChild("HumanoidRootPart") and v49.Character:FindFirstChild("Humanoid")) then
                        local v50 = v49.Character
                        local v51 = v50.Humanoid
                        if v51.Health > 0 then
                            local v52 = v50.HumanoidRootPart
                            local v53 = (v44.Position - v52.Position).Magnitude
                            if p43.Config.ESPDistance >= v53 then
                                if p43.Config.TeamCheck and (vu6.Team and v49.Team == vu6.Team) then
                                    p43:ClearBox(v49)
                                else
                                    if not p43.Caches.BoxCache[v49] then
                                        p43.Caches.BoxCache[v49] = p43:CreateBox(v49)
                                    end
                                    local v54 = p43.Caches.BoxCache[v49]
                                    local v55, v56 = vu7:WorldToViewportPoint(v52.Position)
                                    if v56 then
                                        local v57 = v50:FindFirstChild("Head")
                                        local v58 = v57 and vu7:WorldToViewportPoint(v57.Position + Vector3.new(0, 1, 0)) or vu7:WorldToViewportPoint(v52.Position + Vector3.new(0, 3, 0))
                                        local v59 = vu7:WorldToViewportPoint(v52.Position - Vector3.new(0, 3, 0))
                                        local v60 = math.abs(v58.Y - v59.Y)
                                        local v61 = v60 * 0.66
                                        local v62 = Vector2.new(v55.X, (v58.Y + v59.Y) / 2)
                                        v54.Box.Size = Vector2.new(v61, v60)
                                        v54.Box.Position = v62 - Vector2.new(v61 / 2, v60 / 2)
                                        v54.Box.Visible = p43.State.BoxEnabled
                                        v54.Name.Text = v49.Name
                                        v54.Name.Position = Vector2.new(v55.X, v58.Y - 20)
                                        v54.Name.Visible = p43.State.NameEnabled
                                        v54.Distance.Text = tostring(math.floor(v53)) .. " studs"
                                        v54.Distance.Position = Vector2.new(v55.X, v59.Y + 5)
                                        v54.Distance.Visible = p43.State.DistanceEnabled
                                        if p43.State.HealthTextEnabled then
                                            local v63 = v51.Health / v51.MaxHealth
                                            v54.HealthText.Text = "Health: " .. tostring(math.floor(v63 * 100)) .. "%"
                                            v54.HealthText.Position = Vector2.new(v55.X, v58.Y - 40)
                                            v54.HealthText.Visible = true
                                        else
                                            v54.HealthText.Visible = false
                                        end
                                        if p43.State.HealthBarEnabled then
                                            local v64 = v51.Health / v51.MaxHealth
                                            local v65 = 5
                                            local v66 = v62.X - v61 / 2 - 10
                                            local v67 = v62.Y - v60 / 2
                                            v54.HealthBarBackground.Position = Vector2.new(v66, v67)
                                            v54.HealthBarBackground.Size = Vector2.new(v65, v60)
                                            v54.HealthBarBackground.Visible = true
                                            v54.HealthBar.Position = Vector2.new(v66, v67 + v60 * (1 - v64))
                                            v54.HealthBar.Size = Vector2.new(v65, v60 * v64)
                                            v54.HealthBar.Color = Color3.new(1 - v64, v64, 0)
                                            v54.HealthBar.Visible = true
                                        else
                                            v54.HealthBarBackground.Visible = false
                                            v54.HealthBar.Visible = false
                                        end
                                    else
                                        v54.Box.Visible = false
                                        v54.Name.Visible = false
                                        v54.Distance.Visible = false
                                        v54.HealthText.Visible = false
                                        v54.HealthBarBackground.Visible = false
                                        v54.HealthBar.Visible = false
                                    end
                                end
                            else
                                p43:ClearBox(v49)
                            end
                        else
                            p43:ClearBox(v49)
                        end
                    else
                        p43:ClearBox(v49)
                    end
                end
            end
        else
            local v68, v69, v70 = pairs(p43.Caches.BoxCache)
            while true do
                local v71
                v70, v71 = v68(v69, v70)
                if v70 == nil then
                    break
                end
                p43:ClearBox(v70)
            end
        end
    else
        local v72, v73, v74 = pairs(p43.Caches.BoxCache)
        while true do
            local v75
            v74, v75 = v72(v73, v74)
            if v74 == nil then
                break
            end
            p43:ClearBox(v74)
        end
        return
    end
end
function vu5.UpdateSkeleton(p76)
    if p76.State.SkeletonEnabled then
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            local v77 = vu6.Character.HumanoidRootPart
            local v78 = vu1
            local v79, v80, v81 = ipairs(v78:GetPlayers())
            while true do
                local v82
                v81, v82 = v79(v80, v81)
                if v81 == nil then
                    break
                end
                local vu83 = false
                local function v84()
                    vu83 = true
                end
                if v82 ~= vu6 then
                    if v82.Character and (v82.Character:FindFirstChild("HumanoidRootPart") and v82.Character:FindFirstChild("Humanoid")) then
                        local v85 = v82.Character
                        if v85.Humanoid.Health > 0 then
                            local v86 = v85.HumanoidRootPart
                            if (v77.Position - v86.Position).Magnitude <= p76.Config.ESPDistance then
                                if p76.Config.TeamCheck and (vu6.Team and v82.Team == vu6.Team) then
                                    p76:ClearSkeleton(v82)
                                else
                                    if not p76.Caches.SkeletonCache[v82] then
                                        p76.Caches.SkeletonCache[v82] = p76:CreateSkeleton(v82)
                                    end
                                    local v87 = p76.Caches.SkeletonCache[v82]
                                    local v88 = v85:FindFirstChild("Torso")
                                    if v88 then
                                        v88 = not v85:FindFirstChild("UpperTorso")
                                    end
                                    local v89
                                    if v88 then
                                        v89 = {
                                            Head = v85:FindFirstChild("Head"),
                                            Torso = v85:FindFirstChild("Torso"),
                                            LeftArm = v85:FindFirstChild("Left Arm"),
                                            RightArm = v85:FindFirstChild("Right Arm"),
                                            LeftLeg = v85:FindFirstChild("Left Leg"),
                                            RightLeg = v85:FindFirstChild("Right Leg")
                                        }
                                    else
                                        v89 = {
                                            Head = v85:FindFirstChild("Head"),
                                            UpperTorso = v85:FindFirstChild("UpperTorso") or v85:FindFirstChild("Torso"),
                                            LowerTorso = v85:FindFirstChild("LowerTorso") or v85:FindFirstChild("HumanoidRootPart"),
                                            LeftUpperArm = v85:FindFirstChild("LeftUpperArm"),
                                            LeftLowerArm = v85:FindFirstChild("LeftLowerArm"),
                                            LeftHand = v85:FindFirstChild("LeftHand"),
                                            RightUpperArm = v85:FindFirstChild("RightUpperArm"),
                                            RightLowerArm = v85:FindFirstChild("RightLowerArm"),
                                            RightHand = v85:FindFirstChild("RightHand"),
                                            LeftUpperLeg = v85:FindFirstChild("LeftUpperLeg"),
                                            LeftLowerLeg = v85:FindFirstChild("LeftLowerLeg"),
                                            LeftFoot = v85:FindFirstChild("LeftFoot"),
                                            RightUpperLeg = v85:FindFirstChild("RightUpperLeg"),
                                            RightLowerLeg = v85:FindFirstChild("RightLowerLeg"),
                                            RightFoot = v85:FindFirstChild("RightFoot")
                                        }
                                    end
                                    local v90, v91, v92 = pairs(v89)
                                    local v93 = true
                                    while true do
                                        local v94
                                        v92, v94 = v90(v91, v92)
                                        if v92 == nil then
                                            break
                                        end
                                        if not v94 then
                                            v84()
                                            v93 = false
                                        end
                                    end
                                    if v93 then
                                        if v88 then
                                            local v95, v96 = vu7:WorldToViewportPoint(v89.Head.Position)
                                            local v97, v98 = vu7:WorldToViewportPoint(v89.Torso.Position)
                                            local v99, v100 = vu7:WorldToViewportPoint(v89.LeftArm.Position)
                                            local v101, v102 = vu7:WorldToViewportPoint(v89.RightArm.Position)
                                            local v103, v104 = vu7:WorldToViewportPoint(v89.LeftLeg.Position)
                                            local v105, v106 = vu7:WorldToViewportPoint(v89.RightLeg.Position)
                                            v87.HeadToTorso.From = Vector2.new(v95.X, v95.Y)
                                            v87.HeadToTorso.To = Vector2.new(v97.X, v97.Y)
                                            local v107 = v87.HeadToTorso
                                            if v96 then
                                                if v98 then
                                                    v96 = p76.State.SkeletonEnabled
                                                else
                                                    v96 = v98
                                                end
                                            end
                                            v107.Visible = v96
                                            v87.TorsoToLeftArm.From = Vector2.new(v97.X, v97.Y)
                                            v87.TorsoToLeftArm.To = Vector2.new(v99.X, v99.Y)
                                            local v108 = v87.TorsoToLeftArm
                                            if v98 then
                                                if v100 then
                                                    v100 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v100 = v98
                                            end
                                            v108.Visible = v100
                                            v87.TorsoToRightArm.From = Vector2.new(v97.X, v97.Y)
                                            v87.TorsoToRightArm.To = Vector2.new(v101.X, v101.Y)
                                            local v109 = v87.TorsoToRightArm
                                            if v98 then
                                                if v102 then
                                                    v102 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v102 = v98
                                            end
                                            v109.Visible = v102
                                            v87.TorsoToLeftLeg.From = Vector2.new(v97.X, v97.Y)
                                            v87.TorsoToLeftLeg.To = Vector2.new(v103.X, v103.Y)
                                            local v110 = v87.TorsoToLeftLeg
                                            if v98 then
                                                if v104 then
                                                    v104 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v104 = v98
                                            end
                                            v110.Visible = v104
                                            v87.TorsoToRightLeg.From = Vector2.new(v97.X, v97.Y)
                                            v87.TorsoToRightLeg.To = Vector2.new(v105.X, v105.Y)
                                            local v111 = v87.TorsoToRightLeg
                                            if v98 then
                                                if v106 then
                                                    v106 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v106 = v98
                                            end
                                            v111.Visible = v106
                                        else
                                            local v112, v113 = vu7:WorldToViewportPoint(v89.Head.Position)
                                            local v114, v115 = vu7:WorldToViewportPoint(v89.UpperTorso.Position)
                                            local v116, v117 = vu7:WorldToViewportPoint(v89.LowerTorso.Position)
                                            local v118, v119 = vu7:WorldToViewportPoint(v89.LeftUpperArm.Position)
                                            local v120, v121 = vu7:WorldToViewportPoint(v89.LeftLowerArm.Position)
                                            local v122, v123 = vu7:WorldToViewportPoint(v89.LeftHand.Position)
                                            local v124, v125 = vu7:WorldToViewportPoint(v89.RightUpperArm.Position)
                                            local v126, v127 = vu7:WorldToViewportPoint(v89.RightLowerArm.Position)
                                            local v128, v129 = vu7:WorldToViewportPoint(v89.RightHand.Position)
                                            local v130, v131 = vu7:WorldToViewportPoint(v89.LeftUpperLeg.Position)
                                            local v132, v133 = vu7:WorldToViewportPoint(v89.LeftLowerLeg.Position)
                                            local v134, v135 = vu7:WorldToViewportPoint(v89.LeftFoot.Position)
                                            local v136, v137 = vu7:WorldToViewportPoint(v89.RightUpperLeg.Position)
                                            local v138, v139 = vu7:WorldToViewportPoint(v89.RightLowerLeg.Position)
                                            local v140, v141 = vu7:WorldToViewportPoint(v89.RightFoot.Position)
                                            v87.HeadToUpperTorso.From = Vector2.new(v112.X, v112.Y)
                                            v87.HeadToUpperTorso.To = Vector2.new(v114.X, v114.Y)
                                            local v142 = v87.HeadToUpperTorso
                                            if v113 then
                                                if v115 then
                                                    v113 = p76.State.SkeletonEnabled
                                                else
                                                    v113 = v115
                                                end
                                            end
                                            v142.Visible = v113
                                            v87.UpperTorsoToLowerTorso.From = Vector2.new(v114.X, v114.Y)
                                            v87.UpperTorsoToLowerTorso.To = Vector2.new(v116.X, v116.Y)
                                            local v143 = v87.UpperTorsoToLowerTorso
                                            local v144
                                            if v115 then
                                                if v117 then
                                                    v144 = p76.State.SkeletonEnabled
                                                else
                                                    v144 = v117
                                                end
                                            else
                                                v144 = v115
                                            end
                                            v143.Visible = v144
                                            v87.UpperTorsoToLeftUpperArm.From = Vector2.new(v114.X, v114.Y)
                                            v87.UpperTorsoToLeftUpperArm.To = Vector2.new(v118.X, v118.Y)
                                            local v145 = v87.UpperTorsoToLeftUpperArm
                                            local v146
                                            if v115 then
                                                if v119 then
                                                    v146 = p76.State.SkeletonEnabled
                                                else
                                                    v146 = v119
                                                end
                                            else
                                                v146 = v115
                                            end
                                            v145.Visible = v146
                                            v87.LeftUpperArmToLeftLowerArm.From = Vector2.new(v118.X, v118.Y)
                                            v87.LeftUpperArmToLeftLowerArm.To = Vector2.new(v120.X, v120.Y)
                                            local v147 = v87.LeftUpperArmToLeftLowerArm
                                            if v119 then
                                                if v121 then
                                                    v119 = p76.State.SkeletonEnabled
                                                else
                                                    v119 = v121
                                                end
                                            end
                                            v147.Visible = v119
                                            v87.LeftLowerArmToLeftHand.From = Vector2.new(v120.X, v120.Y)
                                            v87.LeftLowerArmToLeftHand.To = Vector2.new(v122.X, v122.Y)
                                            local v148 = v87.LeftLowerArmToLeftHand
                                            if v121 then
                                                if v123 then
                                                    v123 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v123 = v121
                                            end
                                            v148.Visible = v123
                                            v87.UpperTorsoToRightUpperArm.From = Vector2.new(v114.X, v114.Y)
                                            v87.UpperTorsoToRightUpperArm.To = Vector2.new(v124.X, v124.Y)
                                            local v149 = v87.UpperTorsoToRightUpperArm
                                            if v115 then
                                                if v125 then
                                                    v115 = p76.State.SkeletonEnabled
                                                else
                                                    v115 = v125
                                                end
                                            end
                                            v149.Visible = v115
                                            v87.RightUpperArmToRightLowerArm.From = Vector2.new(v124.X, v124.Y)
                                            v87.RightUpperArmToRightLowerArm.To = Vector2.new(v126.X, v126.Y)
                                            local v150 = v87.RightUpperArmToRightLowerArm
                                            if v125 then
                                                if v127 then
                                                    v125 = p76.State.SkeletonEnabled
                                                else
                                                    v125 = v127
                                                end
                                            end
                                            v150.Visible = v125
                                            v87.RightLowerArmToRightHand.From = Vector2.new(v126.X, v126.Y)
                                            v87.RightLowerArmToRightHand.To = Vector2.new(v128.X, v128.Y)
                                            local v151 = v87.RightLowerArmToRightHand
                                            if v127 then
                                                if v129 then
                                                    v129 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v129 = v127
                                            end
                                            v151.Visible = v129
                                            v87.LowerTorsoToLeftUpperLeg.From = Vector2.new(v116.X, v116.Y)
                                            v87.LowerTorsoToLeftUpperLeg.To = Vector2.new(v130.X, v130.Y)
                                            local v152 = v87.LowerTorsoToLeftUpperLeg
                                            local v153
                                            if v117 then
                                                if v131 then
                                                    v153 = p76.State.SkeletonEnabled
                                                else
                                                    v153 = v131
                                                end
                                            else
                                                v153 = v117
                                            end
                                            v152.Visible = v153
                                            v87.LeftUpperLegToLeftLowerLeg.From = Vector2.new(v130.X, v130.Y)
                                            v87.LeftUpperLegToLeftLowerLeg.To = Vector2.new(v132.X, v132.Y)
                                            local v154 = v87.LeftUpperLegToLeftLowerLeg
                                            if v131 then
                                                if v133 then
                                                    v131 = p76.State.SkeletonEnabled
                                                else
                                                    v131 = v133
                                                end
                                            end
                                            v154.Visible = v131
                                            v87.LeftLowerLegToLeftFoot.From = Vector2.new(v132.X, v132.Y)
                                            v87.LeftLowerLegToLeftFoot.To = Vector2.new(v134.X, v134.Y)
                                            local v155 = v87.LeftLowerLegToLeftFoot
                                            if v133 then
                                                if v135 then
                                                    v135 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v135 = v133
                                            end
                                            v155.Visible = v135
                                            v87.LowerTorsoToRightUpperLeg.From = Vector2.new(v116.X, v116.Y)
                                            v87.LowerTorsoToRightUpperLeg.To = Vector2.new(v136.X, v136.Y)
                                            local v156 = v87.LowerTorsoToRightUpperLeg
                                            if v117 then
                                                if v137 then
                                                    v117 = p76.State.SkeletonEnabled
                                                else
                                                    v117 = v137
                                                end
                                            end
                                            v156.Visible = v117
                                            v87.RightUpperLegToRightLowerLeg.From = Vector2.new(v136.X, v136.Y)
                                            v87.RightUpperLegToRightLowerLeg.To = Vector2.new(v138.X, v138.Y)
                                            local v157 = v87.RightUpperLegToRightLowerLeg
                                            if v137 then
                                                if v139 then
                                                    v137 = p76.State.SkeletonEnabled
                                                else
                                                    v137 = v139
                                                end
                                            end
                                            v157.Visible = v137
                                            v87.RightLowerLegToRightFoot.From = Vector2.new(v138.X, v138.Y)
                                            v87.RightLowerLegToRightFoot.To = Vector2.new(v140.X, v140.Y)
                                            local v158 = v87.RightLowerLegToRightFoot
                                            if v139 then
                                                if v141 then
                                                    v141 = p76.State.SkeletonEnabled
                                                end
                                            else
                                                v141 = v139
                                            end
                                            v158.Visible = v141
                                        end
                                    else
                                        p76:ClearSkeleton(v82)
                                    end
                                end
                            else
                                p76:ClearSkeleton(v82)
                            end
                        else
                            p76:ClearSkeleton(v82)
                        end
                    else
                        p76:ClearSkeleton(v82)
                    end
                end
                if vu83 then
                    break
                end
            end
        else
            local v159, v160, v161 = pairs(p76.Caches.SkeletonCache)
            while true do
                local v162
                v161, v162 = v159(v160, v161)
                if v161 == nil then
                    break
                end
                p76:ClearSkeleton(v161)
            end
        end
    else
        local v163, v164, v165 = pairs(p76.Caches.SkeletonCache)
        while true do
            local v166
            v165, v166 = v163(v164, v165)
            if v165 == nil then
                break
            end
            p76:ClearSkeleton(v165)
        end
        return
    end
end
function vu5.UpdateTracer(p167)
    if p167.State.TracerEnabled then
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            local v168 = vu6.Character.HumanoidRootPart
            local v169 = vu7.ViewportSize
            local v170 = nil
            if p167.Config.TracerOrigin ~= "Bottom Screen" then
                if p167.Config.TracerOrigin ~= "Cursor" then
                    if p167.Config.TracerOrigin == "Top Screen" then
                        v170 = Vector2.new(v169.X / 2, 0)
                    end
                else
                    v170 = vu4:GetMouseLocation()
                end
            else
                v170 = Vector2.new(v169.X / 2, v169.Y)
            end
            local v171 = vu1
            local v172, v173, v174 = ipairs(v171:GetPlayers())
            while true do
                local v175
                v174, v175 = v172(v173, v174)
                if v174 == nil then
                    break
                end
                if v175 ~= vu6 then
                    if v175.Character and (v175.Character:FindFirstChild("HumanoidRootPart") and v175.Character:FindFirstChild("Humanoid")) then
                        local v176 = v175.Character
                        if v176.Humanoid.Health > 0 then
                            local v177 = v176:FindFirstChild("Head") or v176.HumanoidRootPart
                            if (v168.Position - v177.Position).Magnitude <= p167.Config.ESPDistance then
                                if p167.Config.TeamCheck and (vu6.Team and v175.Team == vu6.Team) then
                                    p167:ClearTracer(v175)
                                else
                                    if not p167.Caches.TracerCache[v175] then
                                        p167.Caches.TracerCache[v175] = p167:CreateTracer(v175)
                                    end
                                    local v178 = p167.Caches.TracerCache[v175]
                                    local v179, v180 = vu7:WorldToViewportPoint(v177.Position)
                                    v178.From = v170
                                    v178.To = Vector2.new(v179.X, v179.Y)
                                    if v180 then
                                        v180 = p167.State.TracerEnabled
                                    end
                                    v178.Visible = v180
                                end
                            else
                                p167:ClearTracer(v175)
                            end
                        else
                            p167:ClearTracer(v175)
                        end
                    else
                        p167:ClearTracer(v175)
                    end
                end
            end
        else
            local v181, v182, v183 = pairs(p167.Caches.TracerCache)
            while true do
                local v184
                v183, v184 = v181(v182, v183)
                if v183 == nil then
                    break
                end
                p167:ClearTracer(v183)
            end
        end
    else
        local v185, v186, v187 = pairs(p167.Caches.TracerCache)
        while true do
            local v188
            v187, v188 = v185(v186, v187)
            if v187 == nil then
                break
            end
            p167:ClearTracer(v187)
        end
        return
    end
end
function vu5.UpdateChams(p189)
    if p189.State.ChamsEnabled then
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            local v190 = vu6.Character.HumanoidRootPart
            local v191 = vu1
            local v192, v193, v194 = ipairs(v191:GetPlayers())
            while true do
                local v195
                v194, v195 = v192(v193, v194)
                if v194 == nil then
                    break
                end
                if v195 ~= vu6 then
                    if v195.Character and (v195.Character:FindFirstChild("HumanoidRootPart") and v195.Character:FindFirstChild("Humanoid")) then
                        local v196 = v195.Character
                        if v196.Humanoid.Health > 0 then
                            local v197 = v196.HumanoidRootPart
                            if (v190.Position - v197.Position).Magnitude <= p189.Config.ESPDistance then
                                if p189.Config.TeamCheck and (vu6.Team and v195.Team == vu6.Team) then
                                    p189:ClearChams(v195)
                                elseif not p189.Caches.ChamsCache[v195] then
                                    p189.Caches.ChamsCache[v195] = p189:CreateChams(v195)
                                end
                            else
                                p189:ClearChams(v195)
                            end
                        else
                            p189:ClearChams(v195)
                        end
                    else
                        p189:ClearChams(v195)
                    end
                end
            end
        else
            local v198, v199, v200 = pairs(p189.Caches.ChamsCache)
            while true do
                local v201
                v200, v201 = v198(v199, v200)
                if v200 == nil then
                    break
                end
                p189:ClearChams(v200)
            end
        end
    else
        local v202, v203, v204 = pairs(p189.Caches.ChamsCache)
        while true do
            local v205
            v204, v205 = v202(v203, v204)
            if v204 == nil then
                break
            end
            p189:ClearChams(v204)
        end
        return
    end
end
function vu5.new()
    return setmetatable({}, vu5)
end
function vu5.InitiateBox(p206, p207, p208)
    p206.State.BoxEnabled = p208 ~= false
    if p207 then
        p206.Config.BoxColor = p207
        local v209, v210, v211 = pairs(p206.Caches.BoxCache)
        while true do
            local v212
            v211, v212 = v209(v210, v211)
            if v211 == nil then
                break
            end
            v212.Box.Color = p207
        end
    end
end
function vu5.InitiateName(p213, p214)
    p213.State.NameEnabled = p214 == true
end
function vu5.InitiateDistance(p215, p216)
    p215.State.DistanceEnabled = p216 == true
end
function vu5.InitiateSkeleton(p217, p218, p219)
    p217.State.SkeletonEnabled = p219 ~= false
    if p218 then
        p217.Config.SkeletonColor = p218
        local v220, v221, v222 = pairs(p217.Caches.SkeletonCache)
        while true do
            local v223
            v222, v223 = v220(v221, v222)
            if v222 == nil then
                break
            end
            local v224, v225, v226 = pairs(v223)
            while true do
                local v227
                v226, v227 = v224(v225, v226)
                if v226 == nil then
                    break
                end
                v227.Color = p218
            end
        end
    end
end
function vu5.InitiateHealthText(p228, p229)
    p228.State.HealthTextEnabled = p229 == true
end
function vu5.InitiateHealthBar(p230, p231)
    p230.State.HealthBarEnabled = p231 == true
end
function vu5.InitiateTracer(p232, p233, p234, p235)
    p232.State.TracerEnabled = p235 ~= false
    if p233 then
        p232.Config.TracerColor = p233
        local v236, v237, v238 = pairs(p232.Caches.TracerCache)
        while true do
            local v239
            v238, v239 = v236(v237, v238)
            if v238 == nil then
                break
            end
            v239.Color = p233
        end
    end
    if p234 then
        p232.Config.TracerOrigin = p234
    end
end
function vu5.InitiateChams(p240, p241, p242)
    p240.State.ChamsEnabled = p242 ~= false
    if p241 then
        p240.Config.ChamsColor = p241
        local v243, v244, v245 = pairs(p240.Caches.ChamsCache)
        while true do
            local v246
            v245, v246 = v243(v244, v245)
            if v245 == nil then
                break
            end
            v246.FillColor = p241
        end
    end
end
function vu5.SetDistance(p247, p248)
    p247.Config.ESPDistance = p248
end
function vu5.TeamCheck(p249, p250)
    p249.Config.TeamCheck = p250
end
function vu5.Cleanup(p251)
    local v252, v253, v254 = pairs(p251.Caches.BoxCache)
    while true do
        local v255
        v254, v255 = v252(v253, v254)
        if v254 == nil then
            break
        end
        p251:ClearBox(v254)
    end
    local v256, v257, v258 = pairs(p251.Caches.SkeletonCache)
    while true do
        local v259
        v258, v259 = v256(v257, v258)
        if v258 == nil then
            break
        end
        p251:ClearSkeleton(v258)
    end
    local v260, v261, v262 = pairs(p251.Caches.TracerCache)
    while true do
        local v263
        v262, v263 = v260(v261, v262)
        if v262 == nil then
            break
        end
        p251:ClearTracer(v262)
    end
    local v264, v265, v266 = pairs(p251.Caches.ChamsCache)
    while true do
        local v267
        v266, v267 = v264(v265, v266)
        if v266 == nil then
            break
        end
        p251:ClearChams(v266)
    end
end
function vu5.Destroy(p268)
    p268:Cleanup()
    if vu9 then
        vu9:Disconnect()
    end
    if vu10 then
        vu10:Disconnect()
    end
    p268.State.BoxEnabled = false
    p268.State.NameEnabled = false
    p268.State.DistanceEnabled = false
    p268.State.SkeletonEnabled = false
    p268.State.HealthTextEnabled = false
    p268.State.HealthBarEnabled = false
    p268.State.TracerEnabled = false
    p268.State.ChamsEnabled = false
end
function vu5.Initialize(pu269)
    vu1.PlayerRemoving:Connect(function(pu270)
        vu14(function()
            pu269:ClearBox(pu270)
            pu269:ClearSkeleton(pu270)
            pu269:ClearTracer(pu270)
            pu269:ClearChams(pu270)
        end)
    end)
    vu1.PlayerAdded:Connect(function(pu271)
        pu271.CharacterAdded:Connect(function(pu272)
            pu272.AncestryChanged:Connect(function()
                if not pu272:IsDescendantOf(vu2) then
                    vu14(function()
                        pu269:ClearBox(pu271)
                        pu269:ClearSkeleton(pu271)
                        pu269:ClearTracer(pu271)
                        pu269:ClearChams(pu271)
                    end)
                end
            end)
            local v273 = pu272:FindFirstChild("Humanoid")
            if v273 then
                v273.Died:Connect(function()
                    vu14(function()
                        pu269:ClearBox(pu271)
                        pu269:ClearSkeleton(pu271)
                        pu269:ClearTracer(pu271)
                        pu269:ClearChams(pu271)
                    end)
                end)
            end
        end)
    end)
    vu9 = vu3.Heartbeat:Connect(function()
        if os.clock() % vu8 < 0.1 then
            vu14(function()
                pu269:Cleanup()
            end)
        end
    end)
    vu10 = vu3.RenderStepped:Connect(function()
        vu14(function()
            pu269:UpdateBox()
        end)
        vu14(function()
            pu269:UpdateSkeleton()
        end)
        vu14(function()
            pu269:UpdateTracer()
        end)
        vu14(function()
            pu269:UpdateChams()
        end)
    end)
end
return vu5
