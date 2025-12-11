repeat
    task.wait()
until game:IsLoaded() and pcall(function() return game:GetService("Players").LocalPlayer end) and pcall(function() return game:GetService("Players").LocalPlayer.Character end) and pcall(function() return game:GetService("Players").LocalPlayer.Character.HumanoidRootPart end)
if getgenv().useWebhooks == true and getgenv().webhookURL then
    print("YES YES YES YES")
    function sendMSG(p1)
        local v2 = game:GetService("HttpService")
        local v3 = {}
        local v4 = {}
        local v5 = {
            title = p1.title,
            description = p1.description,
            color = p1.color,
            fields = p1.fields,
            footer = {
                text = p1.footer.text
            }
        }
        __set_list(v4, 1, {
            v5
        })
        v3.embeds = v4
        local v6 = v2:JSONEncode(v3)
        (request or http_request or httprequest or httpreq or (http and http.request) or (syn and syn.request) or (fluxus and fluxus.request) or syn_request or fluxus_request or bunni_request)({
            Url = getgenv().webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = v6
        })
        print("Sent")
    end
    if getgenv().startTime then
        local v7 = (tick() - tonumber(getgenv().startTime)) / 60
        local _ = string.format("%.2f", v7) .. " minutes"
    end
    local v8 = tostring(getgenv().webhookFrequency) .. " minutes"
    local v9 = {
        title = "Forge Hub - Slapple Farm",
        description = "Boxer Farm Stats",
        color = 16753920,
        fields = {
            {
                name = "Name:",
                value = game.Players.LocalPlayer.Name
            },
            {
                name = "Starting Slaps:",
                value = getgenv().startSlaps
            },
            {
                name = "Slaps Gained:",
                value = tostring(game:GetService("Players").LocalPlayer.leaderstats.Slaps.Value - tostring(getgenv().startSlaps))
            },
            {
                name = "Total Slaps:",
                value = game:GetService("Players").LocalPlayer.leaderstats.Slaps.Value
            },
            {
                name = "Next Update in:",
                value = v8
            }
        },
        footer = {
            text = "By Skuppy"
        }
    }
    local v10 = tonumber(getgenv().startTime) or 0
    local v11 = tonumber(getgenv().webhookFrequency) or 1
    if tick() - v10 >= v11 * 60 then
        getgenv().startTime = tick()
        sendMSG(v9)
    end
end
local v12 = Instance.new("ScreenGui")
local v13 = Instance.new("Frame")
local v14 = Instance.new("TextLabel")
local v15 = Instance.new("TextLabel")
local v16 = Instance.new("TextLabel")
v12.Name = "fhautofarm"
v12.Parent = game:GetService("CoreGui")
v12.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v13.Parent = v12
v13.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
v13.BorderColor3 = Color3.fromRGB(0, 0, 0)
v13.BorderSizePixel = 0
v13.Position = UDim2.new(0.039182283, 0, 0.778606951, 0)
v13.Size = UDim2.new(0.25, 0, 0.100000001, 0)
v14.Parent = v13
v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v14.BackgroundTransparency = 1
v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
v14.BorderSizePixel = 0
v14.Position = UDim2.new(0.0919931829, 0, 0.385572135, 0)
v14.Size = UDim2.new(0.810902894, 0, - 0.385572135, 0)
v14.Font = Enum.Font.SourceSans
v14.Text = "Forge Hub Autofarm"
v14.TextColor3 = Color3.fromRGB(255, 255, 255)
v14.TextScaled = true
v14.TextSize = 14
v14.TextWrapped = true
v15.Parent = v13
v15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v15.BackgroundTransparency = 1
v15.BorderColor3 = Color3.fromRGB(0, 0, 0)
v15.BorderSizePixel = 0
v15.Position = UDim2.new(0.0919931829, 0, 0.696517408, 0)
v15.Size = UDim2.new(0.810902894, 0, - 0.385572135, 0)
v15.Font = Enum.Font.SourceSans
v15.Text = "Active"
v15.TextColor3 = Color3.fromRGB(34, 255, 0)
v15.TextScaled = true
v15.TextSize = 14
v15.TextWrapped = true
v16.Parent = v13
v16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v16.BackgroundTransparency = 1
v16.BorderColor3 = Color3.fromRGB(0, 0, 0)
v16.BorderSizePixel = 0
v16.Position = UDim2.new(0.0919931829, 0, 0.920397997, 0)
v16.Size = UDim2.new(0.810902894, 0, - 0.223880589, 0)
v16.Font = Enum.Font.SourceSans
v16.Text = "Rejoin to deactivate."
v16.TextColor3 = Color3.fromRGB(255, 0, 0)
v16.TextScaled = true
v16.TextSize = 14
v16.TextWrapped = true
task.spawn(function()
    task.wait(60)
    local v17 = {}
    local v18 = game:GetService("HttpService"):JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)))
    if v18 and v18.data then
        local v19 = next
        local v20 = v18.data
        local v21 = nil
        while true do
            local v22
            v21, v22 = v19(v20, v21)
            if v21 == nil then
                break
            end
            if type(v22) == "table" and (tonumber(v22.playing) and (tonumber(v22.maxPlayers) and (v22.playing < v22.maxPlayers and v22.id ~= game.JobId))) then
                table.insert(v17, 1, v22.id)
            end
        end
    end
    if # v17 > 0 then 
        local v23 = (syn and syn.queue_on_teleport) or syn_queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or fluxus_queue_on_teleport or queue_on_teleport or queueonteleport or function() end
        v23("\r\n            getgenv().useWebhooks = \"" .. tostring(getgenv().useWebhooks) .. "\"\r\n            getgenv().startTime = \"" .. tostring(tick()) .. "\"\r\n            getgenv().webhookURL = \"" .. tostring(getgenv().webhookURL) .. "\"\r\n            getgenv().webhookFrequency = \"" .. tostring(getgenv().webhookFrequency) .. "\"\r\n            loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Skzuppy/forge-hub/refs/heads/main/slapfarm_slapple\"))()\r\n        ")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v17[math.random(1, # v17)], game:GetService("Players").LocalPlayer)
    end
end)
task.wait(1)
print("YES")
local vu25 = game:GetService("Players")
local vu26 = game:GetService("Workspace")
local function vu50(p27)
    local function v47()
        print("GHULP")
        local v28 = vu25.LocalPlayer
        local v29 = v28.Character or v28.CharacterAdded:Wait()
        local v30, v31, v32 = pairs(v29:GetDescendants())
        if v33:IsA("BasePart") and v33.CanCollide then
            v33.CanCollide = false
        end
        local v33
        v32, v33 = v30(v31, v32)
        if v32 ~= nil then
        else
        end
        if v29:FindFirstChild("InLobby") then
            local v34 = vu26:FindFirstChild("Lobby"):FindFirstChild("Teleport1")
            local v35 = v29:FindFirstChild("HumanoidRootPart")
            if v35 then
                v35.CFrame = CFrame.new(v34.Position)
            end
        end
        repeat
            task.wait()
        until not v29:FindFirstChild("InLobby")
        task.wait(1)
        local v36, v37, v38 = pairs(workspace.Arena.island5.Slapples:GetChildren())
        if v39.Name == "Slapple" and (v39:FindFirstChild("Glove") and v39:FindFirstChild("HandleLight").Transparency ~= 1) then
            workspace.CurrentCamera.CameraSubject = v39.HandleLight
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("Head"), v39.Glove, 0)
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("Head"), v39.Glove, 1)
            task.wait()
        end
        local v39
        v38, v39 = v36(v37, v38)
        if v38 ~= nil then
        else
        end
        local v40 = {}
        local v41 = game:GetService("HttpService"):JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)))
        if v41 and v41.data then
            local v42 = next
            local v43 = v41.data
            local v44 = nil
            while true do
                local v45
                v44, v45 = v42(v43, v44)
                if v44 == nil then
                    break
                end
                if typeof(v45) == "table" and (tonumber(v45.playing) and (tonumber(v45.maxPlayers) and (v45.playing < v45.maxPlayers and v45.id ~= game.JobId))) then
                    table.insert(v40, 1, v45.id)
                end
            end
        end
        if # v40 > 0 then
            local v46 = (syn and syn.queue_on_teleport) or syn_queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or fluxus_queue_on_teleport or queue_on_teleport or queueonteleport or function() end 
            v46("\r\n                    getgenv().useWebhooks = \"" .. tostring(getgenv().useWebhooks) .. "\"\r\n                    getgenv().startTime = \"" .. tostring(getgenv().startTime) .. "\"\r\n                    getgenv().webhookURL = \"" .. tostring(getgenv().webhookURL) .. "\"\r\n                    getgenv().webhookFrequency = \"" .. tostring(getgenv().webhookFrequency) .. "\"\r\n                    loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Skzuppy/forge-hub/refs/heads/main/slapfarm_slapple\"))()\r\n                ")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v40[math.random(1, # v40)], game:GetService("Players").LocalPlayer)
        end
        task.wait()
    end
    local v48, v49 = pcall(v47)
    if not v48 then
        warn("Error in main loop: " .. v49)
        task.wait(1)
        vu50(p27)
    end
end
local v51 = vu25.LocalPlayer
vu50(v51.Character or v51.CharacterAdded:Wait())
print("HOLY M")
v51.CharacterAdded:Connect(vu50)
