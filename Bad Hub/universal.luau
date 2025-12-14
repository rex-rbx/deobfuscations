local RepositoryUrl = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local LibraryModule = loadstring(game:HttpGet(RepositoryUrl .. "Library.lua"))()
local ThemeManagerModule = loadstring(game:HttpGet(RepositoryUrl .. "addons/ThemeManager.lua"))()
local SaveManagerModule = loadstring(game:HttpGet(RepositoryUrl .. "addons/SaveManager.lua"))()
local OptionsConfig = LibraryModule.Options
local ToggleConfig = LibraryModule.Toggles
LibraryModule.ForceCheckbox = false
LibraryModule.ShowToggleFrameInKeybinds = true
local MainWindow = LibraryModule:CreateWindow({
    Title = "Bad Hub Universal",
    Footer = "Version: 1.0",
    Icon = 134381203385642,
    NotifySide = "Right",
    ShowCustomCursor = true
})
local TabManager = {
    Main = MainWindow:AddTab("Main", "house"),
    ["Supported Games"] = MainWindow:AddTab("Supported Games", "gamepad"),
    ["Local Player"] = MainWindow:AddTab("Local Player", "user"),
    ["UI Settings"] = MainWindow:AddTab("UI Settings", "settings")
}
local WelcomeGroupbox = TabManager.Main:AddLeftGroupbox("Welcome", "info")
WelcomeGroupbox:AddLabel("Welcome to Bad Hub Universal!")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("Thank you for using Bad Hub!")
WelcomeGroupbox:AddLabel("Version: 1.0")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("This universal script works")
WelcomeGroupbox:AddLabel("across multiple Roblox games.")
local StatusGroupbox = TabManager.Main:AddRightGroupbox("Script Status", "check")
local CurrentPlaceId = game.PlaceId
local GameStatus = "Supported"
Color3.fromRGB(0, 255, 0)
local SupportedGamesMap = {
    [73197780555018] = "Jump Higher Per RNG[Offline RNG]",
    [17321628486] = "NO JUMPING OBBY",
    [95525734724032] = "Every Click +1 Age"
}
local CurrentGameName
if SupportedGamesMap[CurrentPlaceId] then
    CurrentGameName = SupportedGamesMap[CurrentPlaceId]
else
    Color3.fromRGB(255, 200, 0)
    CurrentGameName = "Universal Mode"
    GameStatus = "Fallback"
end
StatusGroupbox:AddLabel("Current Game: " .. CurrentGameName)
StatusGroupbox:AddLabel("Status: " .. GameStatus)
StatusGroupbox:AddLabel("")
StatusGroupbox:AddLabel("Features:")
StatusGroupbox:AddLabel("Walk Speed Control")
StatusGroupbox:AddLabel("Jump Power Control")
StatusGroupbox:AddLabel("Invisibility Toggle")
StatusGroupbox:AddLabel("Flight System (F Key)")
StatusGroupbox:AddLabel("Noclip (Collision Off)")
local GameListGroupbox = TabManager["Supported Games"]:AddLeftGroupbox("Game List", "gamepad2")
GameListGroupbox:AddLabel("All supported games:")
GameListGroupbox:AddDivider()
local GameIterator, GameKey, GameValue = pairs(SupportedGamesMap)
while true do
    local GameId, GameName = GameIterator(GameKey, GameValue)
    if GameId == nil then
        break
    end
    GameValue = GameId
    local GameUrl = "https://www.roblox.com/games/" .. GameId
    GameListGroupbox:AddButton({
        Text = GameName,
        Func = function()
            setclipboard(GameUrl)
            LibraryModule:Notify({
                Title = "Copied",
                Content = "Game link copied to clipboard!"
            })
        end
    })
end
local QuickActionsGroupbox = TabManager["Supported Games"]:AddRightGroupbox("Quick Actions", "star")
QuickActionsGroupbox:AddButton({
    Text = "Copy Current Game Link",
    Func = function()
        local CurrentGameUrl = "https://www.roblox.com/games/" .. CurrentPlaceId
        setclipboard(CurrentGameUrl)
        LibraryModule:Notify({
            Title = "Copied",
            Content = "Current game link copied to clipboard!"
        })
    end
})
QuickActionsGroupbox:AddLabel("")
QuickActionsGroupbox:AddLabel("Total Games: " .. tostring(# SupportedGamesMap))
QuickActionsGroupbox:AddLabel("Current Game: " .. CurrentGameName)
local PlayerControlsGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Player Controls", "user")
local WalkSpeedValue = 16
local JumpPowerValue = 50
task.spawn(function()
    while true do
        repeat
            task.wait(0.05)
            local LocalPlayer = game:GetService("Players").LocalPlayer
        until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
    end
end)
PlayerControlsGroupbox:AddSlider("PlayerSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter1)
        WalkSpeedValue = Parameter1
        local PlayerCharacter = game:GetService("Players").LocalPlayer
        if PlayerCharacter.Character and PlayerCharacter.Character:FindFirstChild("Humanoid") then
            PlayerCharacter.Character.Humanoid.WalkSpeed = Parameter1
        end
    end,
    Tooltip = "Set your walk speed",
    Disabled = false,
    Visible = true
})
PlayerControlsGroupbox:AddSlider("PlayerJumpPower", {
    Text = "Jump Power",
    Default = 50,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter2)
        JumpPowerValue = Parameter2
        local PlayerHumanoid = game:GetService("Players").LocalPlayer
        if PlayerHumanoid.Character and PlayerHumanoid.Character:FindFirstChild("Humanoid") then
            PlayerHumanoid.Character.Humanoid.JumpPower = Parameter2
        end
    end,
    Tooltip = "Set your jump power",
    Disabled = false,
    Visible = true
})
local CharacterGroupbox = TabManager["Local Player"]:AddRightGroupbox("Character", "user")
CharacterGroupbox:AddButton({
    Text = "Make Invisible",
    Func = function()
        local PlayerModel = game:GetService("Players").LocalPlayer
        if PlayerModel.Character then
            local ModelIterator, ModelKey, ModelValue = pairs(PlayerModel.Character:GetDescendants())
            while true do
                local ModelName
                ModelValue, ModelName = ModelIterator(ModelKey, ModelValue)
                if ModelValue == nil then
                    break
                end
                if ModelName:IsA("BasePart") and ModelName.Name ~= "HumanoidRootPart" then
                    ModelName.CanCollide = false
                    ModelName.Transparency = 1
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Make Visible",
    Func = function()
        local PlayerDescendants = game:GetService("Players").LocalPlayer
        if PlayerDescendants.Character then
            local DescendantsIterator, DescendantKey, DescendantValue = pairs(PlayerDescendants.Character:GetDescendants())
            while true do
                local DescendantName
                DescendantValue, DescendantName = DescendantsIterator(DescendantKey, DescendantValue)
                if DescendantValue == nil then
                    break
                end
                if DescendantName:IsA("BasePart") and DescendantName.Name ~= "HumanoidRootPart" then
                    DescendantName.CanCollide = true
                    DescendantName.Transparency = 0
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Kill Character",
    Func = function()
        local PlayerRootPart = game:GetService("Players").LocalPlayer
        if PlayerRootPart.Character and PlayerRootPart.Character:FindFirstChild("Humanoid") then
            PlayerRootPart.Character.Humanoid.Health = 0
        end
    end
})
local CharacterInfoGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Character Info", "info")
CharacterInfoGroupbox:AddLabel("Name: " .. game:GetService("Players").LocalPlayer.Name)
CharacterInfoGroupbox:AddLabel("UserId: " .. game:GetService("Players").LocalPlayer.UserId)
local FlightGroupbox = TabManager["Local Player"]:AddRightGroupbox("Flight", "wind")
local FlightEnabled = false
local FlightSpeed = 50
local FlightDirection = nil
local FlightStatus = false
FlightGroupbox:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter3)
        FlightSpeed = Parameter3
    end,
    Tooltip = "Set your fly speed",
    Disabled = false,
    Visible = true
})
FlightGroupbox:AddToggle("FlyToggle", {
    Text = "Fly",
    Default = false,
    Callback = function(Parameter4)
        FlightEnabled = Parameter4
        local PlayerInstance = game:GetService("Players").LocalPlayer
        if FlightEnabled then
            if PlayerInstance and PlayerInstance.Character and PlayerInstance.Character:FindFirstChild("HumanoidRootPart") then
                local RootPart = PlayerInstance.Character.HumanoidRootPart
                FlightDirection = Instance.new("BodyVelocity")
                FlightDirection.Velocity = Vector3.new(0, 0, 0)
                FlightDirection.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                FlightDirection.Parent = RootPart
                task.spawn(function()
                    while FlightEnabled do
                        task.wait(0.05)
                        if PlayerInstance.Character and PlayerInstance.Character:FindFirstChild("HumanoidRootPart") then
                            local UnusedValue = PlayerInstance.Character.HumanoidRootPart
                            local CurrentCamera = workspace.CurrentCamera
                            local CameraDirection = CurrentCamera.CFrame.LookVector
                            local ZeroVector = Vector3.new(0, 0, 0)
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                                ZeroVector = ZeroVector + CameraDirection
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                                ZeroVector = ZeroVector - CameraDirection
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                                ZeroVector = ZeroVector - CurrentCamera.CFrame.RightVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                                ZeroVector = ZeroVector + CurrentCamera.CFrame.RightVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                                ZeroVector = ZeroVector + Vector3.new(0, 1, 0)
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                                ZeroVector = ZeroVector - Vector3.new(0, 1, 0)
                            end
                            if ZeroVector.Magnitude > 0 then
                                ZeroVector = ZeroVector.Unit
                            end
                            FlightDirection.Velocity = ZeroVector * FlightSpeed
                        end
                    end
                end)
                LibraryModule:Notify({
                    Title = "Flight",
                    Content = "Flight enabled!"
                })
            end
        else
            if FlightDirection then
                FlightDirection:Destroy()
                FlightDirection = nil
            end
            LibraryModule:Notify({
                Title = "Flight",
                Content = "Flight disabled!"
            })
        end
    end
}):AddKeyPicker("FlyKeybind", {
    Default = "F",
    NoUI = false,
    Text = "Fly keybind"
})
game:GetService("UserInputService").InputBegan:Connect(function(Parameter5, Parameter6)
    if not Parameter6 then
        if Parameter5.KeyCode == Enum.KeyCode.F then
            FlightEnabled = not FlightEnabled
            ToggleConfig.FlyToggle:SetValue(FlightEnabled)
        end
    end
end)
FlightGroupbox:AddToggle("NoclipToggle", {
    Text = "Noclip",
    Default = false,
    Callback = function(Parameter7)
        FlightStatus = Parameter7
        local PlayerCharacterModel = game:GetService("Players").LocalPlayer
        if FlightStatus then
            task.spawn(function()
                while FlightStatus do
                    task.wait(0.05)
                    if PlayerCharacterModel.Character then
                        local CharacterIterator, CharacterKey, CharacterValue = pairs(PlayerCharacterModel.Character:GetDescendants())
                        while true do
                            local CharacterName
                            CharacterValue, CharacterName = CharacterIterator(CharacterKey, CharacterValue)
                            if CharacterValue == nil then
                                break
                            end
                            if CharacterName:IsA("BasePart") then
                                CharacterName.CanCollide = false
                            end
                        end
                    end
                end
            end)
            LibraryModule:Notify({
                Title = "Noclip",
                Content = "Noclip enabled!"
            })
        else
            if PlayerCharacterModel.Character then
                local DescendantIterator1, DescendantKey1, DescendantValue1 = pairs(PlayerCharacterModel.Character:GetDescendants())
                while true do
                    local DescendantName1
                    DescendantValue1, DescendantName1 = DescendantIterator1(DescendantKey1, DescendantValue1)
                    if DescendantValue1 == nil then
                        break
                    end
                    if DescendantName1:IsA("BasePart") then
                        DescendantName1.CanCollide = true
                    end
                end
            end
            LibraryModule:Notify({
                Title = "Noclip",
                Content = "Noclip disabled!"
            })
        end
    end
})
local MenuGroupbox = TabManager["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroupbox:AddToggle("KeybindMenuOpen", {
    Default = LibraryModule.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(Parameter8)
        LibraryModule.KeybindFrame.Visible = Parameter8
    end
})
MenuGroupbox:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Parameter9)
        LibraryModule.ShowCustomCursor = Parameter9
    end
})
MenuGroupbox:AddDropdown("NotificationSide", {
    Values = {
        "Left",
        "Right"
    },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Parameter10)
        LibraryModule:SetNotifySide(Parameter10)
    end
})
MenuGroupbox:AddDivider()
MenuGroupbox:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})
MenuGroupbox:AddButton("Unload", function()
    LibraryModule:Unload()
end)
LibraryModule.ToggleKeybind = OptionsConfig.MenuKeybind
ThemeManagerModule:SetLibrary(LibraryModule)
SaveManagerModule:SetLibrary(LibraryModule)
SaveManagerModule:IgnoreThemeSettings()
SaveManagerModule:SetIgnoreIndexes({
    "MenuKeybind"
})
ThemeManagerModule:SetFolder("BadHub")
SaveManagerModule:SetFolder("BadHub/Universal")
SaveManagerModule:SetSubFolder("Config")
SaveManagerModule:BuildConfigSection(TabManager["UI Settings"])
ThemeManagerModule:ApplyToTab(TabManager["UI Settings"])
SaveManagerModule:LoadAutoloadConfig()
LibraryModule:OnUnload(function()
    FlightEnabled = false
    if FlightDirection then
        FlightDirection:Destroy()
        FlightDirection = nil
    end
    FlightStatus = false
    local PlayerInstance1 = game:GetService("Players").LocalPlayer
    if PlayerInstance1.Character then
        local ModelIterator1, ModelKey1, ModelValue1 = pairs(PlayerInstance1.Character:GetDescendants())
        while true do
            local ModelName1
            ModelValue1, ModelName1 = ModelIterator1(ModelKey1, ModelValue1)
            if ModelValue1 == nil then
                break
            end
            if ModelName1:IsA("BasePart") then
                ModelName1.CanCollide = true
            end
        end
    end
    if PlayerInstance1.Character and PlayerInstance1.Character:FindFirstChild("Humanoid") then
        PlayerInstance1.Character.Humanoid.WalkSpeed = 16
        PlayerInstance1.Character.Humanoid.JumpPower = 50
    end
    if PlayerInstance1.Character then
        local DescendantsIterator1, DescendantKey2, DescendantValue2 = pairs(PlayerInstance1.Character:GetDescendants())
        while true do
            local DescendantName2
            DescendantValue2, DescendantName2 = DescendantsIterator1(DescendantKey2, DescendantValue2)
            if DescendantValue2 == nil then
                break
            end
            if DescendantName2:IsA("BasePart") and DescendantName2.Name ~= "HumanoidRootPart" then
                DescendantName2.CanCollide = true
                DescendantName2.Transparency = 0
            end
        end
    end
    LibraryModule:Notify({
        Title = "Unload",
        Content = "Universal Script Unloaded!"
    })
end)
