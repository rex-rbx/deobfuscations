local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v3 = {
    ["Version"] = "v2.5.2",
    ["Owner"] = "jakefromjakesfarm",
    ["Status"] = "mikeyhub v3 is soon.",
    ["TOS"] = "haha no",
    ["KeySystemDown"] = false,
    ["NonSupportedExes"] = {}
}
local v4 = game.PlaceId
local v5 = game:GetService("MarketplaceService"):GetProductInfo(v4)
local vu7 = game:GetService("Players").LocalPlayer
local v14 = true
local vu15 = ""
local v23
if v14 == true then
    v23 = "MikeyHub+ " .. tostring(v3.Version)
else
    v23 = "MikeyHub " .. tostring(v3.Version)
end
local v25 = (function(p24)
    return p24:gsub("%b[]", ""):gsub("%b{}", ""):gsub("%b()", ""):match("^%s*(.-)%s*$")
end)((tostring(v5.Name)))
local vu26 = vu1:CreateWindow({
    Title = v23,
    SubTitle = "- By " .. tostring(v3.Owner) .. " - " .. v25,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = getgenv().Blur or false,
    Theme = getgenv().Theme or "Dark",
    MinimizeKey = getgenv().MinizeKey or Enum.KeyCode.LeftControl
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
if getgenv().LoaderKey ~= nil then
    if v33 == v32 then
        local function v35()
            local v34 = cloneref(game:GetService("Players"))
            return tostring(v34.LocalPlayer.UserId)
        end
        local vu36 = game:GetService("UserInputService")
        local v37 = vu36
        table.find({
            Enum.Platform.IOS,
            Enum.Platform.Android
        }, vu36.GetPlatform(v37))
        local v38 = identifyexecutor()
        local vu39 = game:GetService("Players").LocalPlayer
        local function v41()
            local v40 = vu36:GetPlatform()
            return v40 ~= Enum.Platform.Android and (v40 ~= Enum.Platform.IOS and "PC" or "IPhone") or "Android"
        end
        local vu42 = false
        spawn(function()
            task.wait(2)
            vu42 = true
        end)
            local v48 = {
                Main = vu26:AddTab({
                    Title = "| Player",
                    Icon = "user"
                }),
                AutoFarm = vu26:AddTab({
                    Title = "| AutoFarm",
                    Icon = "home"
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
                Title = "Infinite Stamina",
                Description = "yes",
                Callback = function()
                    local v49 = next
                    local v50, v51 = getgc(true)
                    while true do
                        local v52
                        v51, v52 = v49(v50, v51)
                        if v51 == nil then
                            break
                        end
                        if typeof(v52) == "function" and debug.info(v52, "n") == "getMaxStamina" then
                            hookfunction(v52, function()
                                return 999999
                            end)
                        end
                    end
                end
            })
            v48.AutoFarm:AddSection("Training")
            v48.AutoFarm:AddToggle("", {
                Title = "Auto Train",
                Description = "",
                Default = false,
                Callback = function(p53)
                    if vu39:GetAttribute("IsWorkingOut") then
                        while p53 do
                            local v54 = {
                                workspace:GetServerTimeNow() - game:GetService("Players").LocalPlayer.AccountAge * 24 * 60 * 60
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("WorkoutHandler_TriggerWorkoutGain"):FireServer(unpack(v54))
                            task.wait()
                        end
                    else
                        vu1:Notify({
                            Title = "Error.",
                            Content = "You must be working out in order for this to work",
                            SubContent = "",
                            Duration = 5
                        })
                    end
                end
            })
            v48.AutoFarm:AddSection("Prestige")
            v48.AutoFarm:AddToggle("", {
                Title = "Auto Prestige",
                Description = "",
                Default = false,
                Callback = function(p55)
                    while p55 do
                        local v56 = {
                            game:GetService("Players").LocalPlayer
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BodyTransform_prestigeToServerEvent"):FireServer(unpack(v56))
                        task.wait()
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
                    local v57 = game:GetService("TeleportService")
                    local v58 = game:GetService("Players").LocalPlayer
                    v57:Teleport(game.PlaceId, v58)
                end
            })
            v48.Visuals:AddSection("World")
            local vu68 = game:GetService("Lighting")
            local vu69 = vu68.Ambient
            v48.Visuals:AddToggle("", {
                Title = "Full Bright",
                Description = "light up light up the world",
                Default = false,
                Callback = function(p70)
                    if p70 == true then
                        vu68.Ambient = Color3.new(1, 1, 1)
                        vu68.ColorShift_Bottom = Color3.new(1, 1, 1)
                        vu68.ColorShift_Top = Color3.new(1, 1, 1)
                    else
                        vu68.Ambient = vu69
                        vu68.ColorShift_Bottom = Color3.new()
                        vu68.ColorShift_Top = Color3.new()
                    end
                end
            })
            vu26:SelectTab(1)
        end
end
