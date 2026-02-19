if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()
local request = (http and http.request) or http_request or httprequest or httpreq or request
local function serverHop()
    local servers = {}
    local api = `https://games.roblox.com/v1/games/{game.PlaceId}/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true`
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(api))
    end)
    if success and result and result.data then
        for _, v in result.data do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                table.insert(servers, v.id)
            end
        end
    end
    if #servers > 0 then
        local teleportScript = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/rex-rbx/deobfuscations/refs/heads/main/ForgeHub/AutoSlappleFarm.luau\"))()"                
        if queue_on_teleport then
            queue_on_teleport(teleportScript)
        end
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
    end
end
local sg = Instance.new("ScreenGui")
sg.Name = "fhautofarm"
sg.Parent = CoreGui
local mainFrame = Instance.new("Frame", sg)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Position = UDim2.new(0.05, 0, 0.8, 0)
mainFrame.Size = UDim2.new(0, 200, 0, 80)
mainFrame.BorderSizePixel = 0
local title = Instance.new("TextLabel", mainFrame)
title.Text = "Forge Hub Autofarm"
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
local status = Instance.new("TextLabel", mainFrame)
status.Text = "Active"
status.Position = UDim2.new(0, 0, 0.4, 0)
status.Size = UDim2.new(1, 0, 0.3, 0)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(34, 255, 0)
status.TextScaled = true
local notice = Instance.new("TextLabel", mainFrame)
notice.Text = "Rejoin to deactivate."
notice.Position = UDim2.new(0, 0, 0.7, 0)
notice.Size = UDim2.new(1, 0, 0.3, 0)
notice.BackgroundTransparency = 1
notice.TextColor3 = Color3.fromRGB(255, 0, 0)
notice.TextScaled = true
local function startFarm()
    while task.wait() do
        local char = lp.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then continue end
        for _, part in char:QueryDescendants("BasePart") do
            part.CanCollide = false
        end
        if char:FindFirstChild("InLobby") then
            local lobbyTeleport = workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild("Teleport1")
            if lobbyTeleport then
                root.CFrame = lobbyTeleport.CFrame
            end
            repeat task.wait() until not char:FindFirstChild("InLobby")
            task.wait(1)
        end
        local slapplesFolder = workspace.Arena.island5.Slapples
        local slapples = slapplesFolder:GetChildren()
        if #slapples > 0 then
            for _, slapple in slapples do
                if slapple.Name == "Slapple" and slapple:FindFirstChild("Glove") then
                    local light = slapple:FindFirstChild("HandleLight")
                    if light and light.Transparency ~= 1 then
                        workspace.CurrentCamera.CameraSubject = light
                        firetouchinterest(root, slapple.Glove, 0)
                        firetouchinterest(root, slapple.Glove, 1)
                        task.wait(0.1)
                    end
                end
            end
        else
            serverHop()
            break
        end
    end
end
task.spawn(function()
    local success, err = pcall(startFarm)
    if not success then
        warn(`Main loop crashed: {err}`)
        task.wait(2)
        serverHop()
    end
end)
task.delay(300, function()
    serverHop()
end)
