repeat
    task.wait()
until game:IsLoaded() and pcall(function() return game:GetService("Players").LocalPlayer.Character end) and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local v1 = Instance.new("ScreenGui")
local v2 = Instance.new("Frame")
local v3 = Instance.new("TextLabel")
local v4 = Instance.new("TextLabel")
local v5 = Instance.new("TextLabel")
v1.Name = "fhautofarm"
v1.Parent = game:GetService("CoreGui")
v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v2.Parent = v1
v2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
v2.BorderSizePixel = 0
v2.Position = UDim2.new(0.039182283, 0, 0.778606951, 0)
v2.Size = UDim2.new(0.25, 0, 0.100000001, 0)
v3.Parent = v2
v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v3.BackgroundTransparency = 1
v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
v3.BorderSizePixel = 0
v3.Position = UDim2.new(0.0919931829, 0, 0.385572135, 0)
v3.Size = UDim2.new(0.810902894, 0, - 0.385572135, 0)
v3.Font = Enum.Font.SourceSans
v3.Text = "Forge Hub Autofarm"
v3.TextColor3 = Color3.fromRGB(255, 255, 255)
v3.TextScaled = true
v3.TextSize = 14
v3.TextWrapped = true
v4.Parent = v2
v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v4.BackgroundTransparency = 1
v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
v4.BorderSizePixel = 0
v4.Position = UDim2.new(0.0919931829, 0, 0.696517408, 0)
v4.Size = UDim2.new(0.810902894, 0, - 0.385572135, 0)
v4.Font = Enum.Font.SourceSans
v4.Text = "Active"
v4.TextColor3 = Color3.fromRGB(34, 255, 0)
v4.TextScaled = true
v4.TextSize = 14
v4.TextWrapped = true
v5.Parent = v2
v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v5.BackgroundTransparency = 1
v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
v5.BorderSizePixel = 0
v5.Position = UDim2.new(0.0919931829, 0, 0.920397997, 0)
v5.Size = UDim2.new(0.810902894, 0, - 0.223880589, 0)
v5.Font = Enum.Font.SourceSans
v5.Text = "Rejoin to deactivate."
v5.TextColor3 = Color3.fromRGB(255, 0, 0)
v5.TextScaled = true
v5.TextSize = 14
v5.TextWrapped = true
task.spawn(function()
    task.wait(120)
    local v6 = {}
    local v7 = game:GetService("HttpService"):JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)))
    if v7 and v7.data then
        local v8 = next
        local v9 = v7.data
        local v10 = nil
        while true do
            local v11
            v10, v11 = v8(v9, v10)
            if v10 == nil then
                break
            end
            if type(v11) == "table" and (tonumber(v11.playing) and (tonumber(v11.maxPlayers) and (v11.playing < v11.maxPlayers and v11.id ~= game.JobId))) then
                table.insert(v6, 1, v11.id)
            end
        end
    end
    if # v6 > 0 then
        local v12 = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
        v12("\r\n            getgenv().nolimbsOption = " .. tostring(getgenv().nolimbsOption or false) .. "\r\n            getgenv().nonameOption = " .. tostring(getgenv().nonameOption or false) .. "\r\n            loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Skzuppy/forge-hub/refs/heads/main/slapfarm_player\"))()\r\n        ")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v6[math.random(1, # v6)], game:GetService("Players").LocalPlayer)
    end
end)
task.wait(1)
local vu14 = game:GetService("Players")
local vu15 = game:GetService("Workspace")
local function vu60(p16)
    local function v57()
        local v17 = vu14.LocalPlayer
        local v18 = v17.Character or v17.CharacterAdded:Wait()
        if v18:FindFirstChild("InLobby") then
            local v19 = vu15:FindFirstChild("Lobby"):FindFirstChild("Teleport1");
            (vu14.LocalPlayer.Character or vu14.LocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(v19.Position)
        end
        repeat
            wait()
        until not v18:FindFirstChild("InLobby")
        local v20, v21, v22 = pairs(workspace.Arena.island5.Slapples:GetChildren())
        while true do
            local v23
            v22, v23 = v20(v21, v22)
            if v22 == nil then
                break
            end
            if v23.Name == "Slapple" and (v23:FindFirstChild("Glove") and v23:FindFirstChild("HandleLight").Transparency ~= 1) then
                repeat
                    v18.HumanoidRootPart.CFrame = CFrame.new(v23.Glove.Position)
                    workspace.CurrentCamera.CameraSubject = v23.HandleLight
                    local v24 = v23.Glove
                    local v25 = (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildWhichIsA("BasePart")
                    firetouchinterest(v24, v25, 0)
                    task.wait()
                    firetouchinterest(v24, v25, 1)
                    wait()
                until v23.HandleLight.Transparency == 1 or not v23.HandleLight
            end
        end
        while true do
            local v26 = vu14.LocalPlayer
            local v27 = v26.Character or v26.CharacterAdded:Wait()
            local v28, v29, v30 = pairs(v27:GetDescendants())
            local v31
            v30, v31 = v28(v29, v30)
            if v30 ~= nil then
                if v31:IsA("BasePart") and v31.CanCollide == true then
                    v31.CanCollide = false
                end
            end
            if getgenv().nolimbsOption then
                local v32, v33, v34 = pairs(v27:GetChildren())
                while true do
                    local v35
                    v34, v35 = v32(v33, v34)
                    if v34 == nil then
                        break
                    end
                    if v35:IsA("BasePart") and v35.Name == "Right Leg" or (v35.Name == "Left Leg" or (v35.Name == "Right Arm" or v35.Name == "Left Arm")) then
                        v35:Destroy()
                    end
                end
            end
            if getgenv().nonameOption then
                local v36, v37, v38 = pairs(v27:GetDescendants())
                while true do
                    local v39
                    v38, v39 = v36(v37, v38)
                    if v38 == nil then
                        break
                    end
                    if v39:IsA("BillboardGui") or v39:IsA("SurfaceGui") then
                        v39:Destroy()
                    end
                end
            end
            local v40 = vu14
            local v41, v42, v43 = pairs(v40:GetChildren())
            while true do
                local v44
                v43, v44 = v41(v42, v43)
                if v43 == nil then
                    break
                end
                if workspace.Arena:FindFirstChild("CubeOfDeathArea") then
                    workspace.Arena:FindFirstChild("CubeOfDeathArea"):Destroy()
                end
                if v26 ~= v44 and (v44.Character and (v27 and (v44.Character.HumanoidRootPart.CFrame.Position.Y < 294 and v44.Character.Head.Transparency == 0))) and (not v44.Character:FindFirstChild("rock") and (not v44.Character:FindFirstChild("Reversed") and v44.Character.HumanoidRootPart.CFrame.Position.Y >= - 60 and not v44.Character:FindFirstChild("InLobby"))) then
                    local v45 = vu14.LocalPlayer
                    local v46 = v45.Character or v45.CharacterAdded:Wait()
                    if v46:FindFirstChild("InLobby") then
                        local v47 = vu15:FindFirstChild("Lobby"):FindFirstChild("Teleport1");
                        (vu14.LocalPlayer.Character or vu14.LocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(v47.Position)
                    end
                    repeat
                        task.wait()
                    until not v46:FindFirstChild("InLobby")
                    vu15:WaitForChild("BountyHunterRoom"):WaitForChild("BountyHunterBooth"):WaitForChild("_configPart"):WaitForChild("OpenRemote"):InvokeServer()
                    vu15:WaitForChild("BountyHunterRoom"):WaitForChild("BountyHunterBooth"):WaitForChild("_configPart"):WaitForChild("LeaveRemote"):FireServer()
                    local v48 = v44.Character:FindFirstChild("HumanoidRootPart")
                    if v48 then
                        workspace.CurrentCamera.CameraSubject = v44.Character:FindFirstChildOfClass("Humanoid") or v48
                        v45.Character.HumanoidRootPart.CFrame = CFrame.new(v48.Position)
                        local v49 = string.lower(v45:GetAttribute("Glove"))
                        local v50 = tick()
                        while tick() - v50 < 0.8 and v44.Character.HumanoidRootPart.CFrame.Position.Y >= - 60 do
                            v45.Character.HumanoidRootPart.CFrame = CFrame.new(v48.Position - Vector3.new(0, 5, 0))
                            task.wait()
                        end
                        local v51, v52, v53 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                        local v54 = {
                            v48
                        }
                        while true do
                            local v55
                            v53, v55 = v51(v52, v53)
                            if v53 == nil then
                                break
                            end
                            local v56 = string.lower(v55.Name)
                            if v56 ~= "mailsend" and (not v48:FindFirstChild("Digging") and (not v48:FindFirstChild("Reversed") and (v55:IsA("RemoteEvent") and (v56:find("hit") or (v56:find("ht") or (v56:find(v49) or (v56 == "b" or (v56 == v49 .. "hit" or (v56 == "hit" .. v49 or (v56 == v49 .. "h" or (v56 == "h" .. v49 or v56 == v49))))))))))) then
                                v55:FireServer(unpack(v54))
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end
    local v58, v59 = pcall(v57)
    if not v58 then
        warn("Error in main loop: " .. v59)
        task.wait(1)
        vu60(p16)
    end
end
local v61 = vu14.LocalPlayer
vu60(v61.Character or v61.CharacterAdded:Wait())
v61.CharacterAdded:Connect(vu60)
