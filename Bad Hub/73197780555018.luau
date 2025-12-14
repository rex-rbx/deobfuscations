local RepositoryUrl = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local LibraryModule = loadstring(game:HttpGet(RepositoryUrl .. "Library.lua"))()
local ThemeManagerModule = loadstring(game:HttpGet(RepositoryUrl .. "addons/ThemeManager.lua"))()
local SaveManagerModule = loadstring(game:HttpGet(RepositoryUrl .. "addons/SaveManager.lua"))()
local LibraryOptions = LibraryModule.Options
local LibraryToggles = LibraryModule.Toggles
LibraryModule.ForceCheckbox = false
LibraryModule.ShowToggleFrameInKeybinds = true
local LibraryInstance = LibraryModule
local MainWindow = LibraryModule.CreateWindow(LibraryInstance, {
    Title = "Bad Hub",
    Footer = "Version: 1.0",
    Icon = 134381203385642,
    NotifySide = "Right",
    ShowCustomCursor = true
})
local TabManager = {
    Main = MainWindow:AddTab("Main", "house"),
    ["INF Wins"] = MainWindow:AddTab("INF Wins", "zap"),
    ["Gamepass Unlocker"] = MainWindow:AddTab("Gamepass Unlocker", "lock"),
    ["Auto Roll"] = MainWindow:AddTab("Auto Roll", "shell"),
    ["World Unlocker"] = MainWindow:AddTab("World Unlocker", "globe"),
    ["Local Player"] = MainWindow:AddTab("Local Player", "user"),
    ["UI Settings"] = MainWindow:AddTab("UI Settings", "settings")
}
local WelcomeGroupbox = TabManager.Main:AddLeftGroupbox("Welcome", "info")
WelcomeGroupbox:AddLabel("Welcome to Bad Hub!")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("Thank you for using Bad Hub!")
WelcomeGroupbox:AddLabel("Version: 1.0")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("Jump Higher Per RNG")
WelcomeGroupbox:AddLabel("[Offline RNG]")
local ScriptStatusGroupbox = TabManager.Main:AddRightGroupbox("Script Status", "check")
ScriptStatusGroupbox:AddLabel("Script: Jump Game")
ScriptStatusGroupbox:AddLabel("Status: Active")
ScriptStatusGroupbox:AddLabel("")
ScriptStatusGroupbox:AddLabel("Features:")
ScriptStatusGroupbox:AddLabel("INF Wins (World 1&2)")
ScriptStatusGroupbox:AddLabel("Gamepass Unlocker")
ScriptStatusGroupbox:AddLabel("Auto Roll RNG")
ScriptStatusGroupbox:AddLabel("Walk Speed Control")
ScriptStatusGroupbox:AddLabel("Flight System (F Key)")
ScriptStatusGroupbox:AddLabel("Noclip")
local IsInitialized = false
local DefaultValue = 50
local NilValue = nil
local IsEnabled = false
local InfWinsGroupbox = TabManager["INF Wins"]:AddLeftGroupbox("INF Wins (World 1)", "zap")
local InfWinsEnabled = false
local NullValue = nil
local MinValue = 5
InfWinsGroupbox:AddToggle("INFWinsToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(ToggleState)
        InfWinsEnabled = ToggleState
        if ToggleState then
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local DefaultPosition = Vector3.new(890.1629028320312, 30.358455181121826, - 129.4036102294922)
            if LocalPlayer.Character then
                LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(DefaultPosition)
            end
            NullValue = task.spawn(function()
                while InfWinsEnabled do
                    task.wait(MinValue)
                    if InfWinsEnabled and LocalPlayer.Character then
                        pcall(function()
                            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(DefaultPosition)
                        end)
                    end
                end
            end)
            LocalPlayer.CharacterAdded:Connect(function(Param1)
                if InfWinsEnabled then
                    Param1:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(DefaultPosition)
                end
            end)
        end
    end
})
InfWinsGroupbox:AddSlider("TeleportSpeed", {
    Text = "Teleport Speed (5 Recommended)",
    Default = 5,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Suffix = "s",
    Callback = function(Param2)
        MinValue = Param2
    end,
    Tooltip = "Set the teleport interval in seconds",
    Disabled = false,
    Visible = true
})
local InfWins2Groupbox = TabManager["INF Wins"]:AddRightGroupbox("INF Wins (World 2)", "zap")
local IsDisabled = false
local EmptyValue = nil
local MaxValue = 5
InfWins2Groupbox:AddToggle("INFWinsToggle2", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(Param3)
        IsDisabled = Param3
        if Param3 then
            local PlayerInstance = game:GetService("Players").LocalPlayer
            local StartPosition = Vector3.new(1183.1431884765625, 90.56680297851562, 2109.67822265625)
            if PlayerInstance.Character then
                PlayerInstance.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(StartPosition)
            end
            EmptyValue = task.spawn(function()
                while IsDisabled do
                    task.wait(MaxValue)
                    if IsDisabled and PlayerInstance.Character then
                        pcall(function()
                            PlayerInstance.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(StartPosition)
                        end)
                    end
                end
            end)
            PlayerInstance.CharacterAdded:Connect(function(Param4)
                if IsDisabled then
                    Param4:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(StartPosition)
                end
            end)
        end
    end
})
InfWins2Groupbox:AddSlider("TeleportSpeed2", {
    Text = "Teleport Speed (5 Recommended)",
    Default = 5,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Suffix = "s",
    Callback = function(Param5)
        MaxValue = Param5
    end,
    Tooltip = "Set the teleport interval in seconds",
    Disabled = false,
    Visible = true
})
local FastRngGroupbox = TabManager["Gamepass Unlocker"]:AddLeftGroupbox("Fast RNG", "gift")
FastRngGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("FastRNG").Value = 1
    end
})
FastRngGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("FastRNG").Value = 0
    end
})
local LuckyGroupbox = TabManager["Gamepass Unlocker"]:AddLeftGroupbox("Lucky", "gift")
LuckyGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_1").Value = 1
    end
})
LuckyGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_1").Value = 0
    end
})
local HugeLuckyGroupbox = TabManager["Gamepass Unlocker"]:AddLeftGroupbox("Huge Lucky", "gift")
HugeLuckyGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_2").Value = 1
    end
})
HugeLuckyGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_2").Value = 0
    end
})
local UltraLuckyGroupbox = TabManager["Gamepass Unlocker"]:AddLeftGroupbox("Ultra Lucky", "gift")
UltraLuckyGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_3").Value = 1
    end
})
UltraLuckyGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Luck_3").Value = 0
    end
})
local VipGroupbox = TabManager["Gamepass Unlocker"]:AddRightGroupbox("VIP", "gift")
VipGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Vip").Value = 1
    end
})
VipGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Vip").Value = 0
    end
})
local DoubleWinsGroupbox = TabManager["Gamepass Unlocker"]:AddRightGroupbox("Double Wins", "gift")
DoubleWinsGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Double_Wins").Value = 1
    end
})
DoubleWinsGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Double_Wins").Value = 0
    end
})
local DoubleJumpGroupbox = TabManager["Gamepass Unlocker"]:AddRightGroupbox("Double Jump", "gift")
DoubleJumpGroupbox:AddButton({
    Text = "Unlock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Double_Jump").Value = 1
    end
})
DoubleJumpGroupbox:AddButton({
    Text = "Lock",
    Func = function()
        game:GetService("Players").LocalPlayer:WaitForChild("Gamepass"):WaitForChild("Double_Jump").Value = 0
    end
})
local AutoRollGroupbox = TabManager["Auto Roll"]:AddLeftGroupbox("Auto Roll", "shell")
local IsAutoRollEnabled = false
AutoRollGroupbox:AddToggle("AutoRollToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(Param6)
        IsAutoRollEnabled = Param6
        local RngValue = game:GetService("Players").LocalPlayer:WaitForChild("RNG")
        if Param6 then
            RngValue:WaitForChild("RNG_Doing").Value = 1
        else
            RngValue:WaitForChild("RNG_Doing").Value = 0
        end
    end
})
local FastRngToggle = TabManager["Auto Roll"]:AddRightGroupbox("Enable Fast RNG", "shell")
local IsFastRngEnabled = false
FastRngToggle:AddToggle("AutoRollFastToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(Param7)
        IsFastRngEnabled = Param7
        local PlayerRng = game:GetService("Players").LocalPlayer:WaitForChild("RNG")
        if Param7 then
            PlayerRng:WaitForChild("RNG_Fast").Value = 1
        else
            PlayerRng:WaitForChild("RNG_Fast").Value = 0
        end
    end
})
TabManager["Auto Roll"]:AddLeftGroupbox("Set Cooldown", "shell"):AddSlider("RNGCooldown", {
    Text = "Cooldown",
    Default = 5,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Suffix = "s",
    Callback = function(Param8)
        game:GetService("Players").LocalPlayer:WaitForChild("RNG"):WaitForChild("RNG_CD").Value = Param8
    end,
    Tooltip = "Set the RNG cooldown in seconds",
    Disabled = false,
    Visible = true
})
local World2UnlockerGroupbox = TabManager["World Unlocker"]:AddLeftGroupbox("World 2 Unlocker", "globe")
local IsWorld2Unlocked = false
World2UnlockerGroupbox:AddToggle("WorldUnlockerToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(Param9)
        IsWorld2Unlocked = Param9
        local PlayerStats = game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats")
        if Param9 then
            PlayerStats:WaitForChild("world").Value = 2
            LibraryModule:Notify({
                Title = "World Unlocker",
                Content = "World 2 unlocked!"
            })
        else
            PlayerStats:WaitForChild("world").Value = 1
            LibraryModule:Notify({
                Title = "World Unlocker",
                Content = "World 2 locked!"
            })
        end
    end
})
local PlayerControlsGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Player Controls", "user")
local DefaultValue1 = 16
local DefaultValue2 = 50
task.spawn(function()
    while true do
        repeat
            task.wait(0.05)
            local PlayerInstance1 = game:GetService("Players").LocalPlayer
        until PlayerInstance1 and PlayerInstance1.Character and PlayerInstance1.Character:FindFirstChild("Humanoid")
        PlayerInstance1.Character.Humanoid.WalkSpeed = DefaultValue1
    end
end)
PlayerControlsGroupbox:AddSlider("PlayerSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Suffix = "",
    Callback = function(Param10)
        DefaultValue1 = Param10
        local PlayerInstance2 = game:GetService("Players").LocalPlayer
        if PlayerInstance2.Character and PlayerInstance2.Character:FindFirstChild("Humanoid") then
            PlayerInstance2.Character.Humanoid.WalkSpeed = Param10
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
    Callback = function(Param11)
        DefaultValue2 = Param11
        local PlayerInstance3 = game:GetService("Players").LocalPlayer
        if PlayerInstance3.Character and PlayerInstance3.Character:FindFirstChild("Humanoid") then
            PlayerInstance3.Character.Humanoid.JumpPower = Param11
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
        local PlayerCharacter = game:GetService("Players").LocalPlayer
        if PlayerCharacter.Character then
            local CharacterDescendants, CharacterDescendants1, CharacterDescendants2 = pairs(PlayerCharacter.Character:GetDescendants())
            while true do
                local UnknownValue
                CharacterDescendants2, UnknownValue = CharacterDescendants(CharacterDescendants1, CharacterDescendants2)
                if CharacterDescendants2 == nil then
                    break
                end
                if UnknownValue:IsA("BasePart") and UnknownValue.Name ~= "HumanoidRootPart" then
                    UnknownValue.CanCollide = false
                    UnknownValue.Transparency = 1
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Make Visible",
    Func = function()
        local PlayerCharacter1 = game:GetService("Players").LocalPlayer
        if PlayerCharacter1.Character then
            local CharacterDescendants3, CharacterDescendants4, CharacterDescendants5 = pairs(PlayerCharacter1.Character:GetDescendants())
            while true do
                local UnknownValue1
                CharacterDescendants5, UnknownValue1 = CharacterDescendants3(CharacterDescendants4, CharacterDescendants5)
                if CharacterDescendants5 == nil then
                    break
                end
                if UnknownValue1:IsA("BasePart") and UnknownValue1.Name ~= "HumanoidRootPart" then
                    UnknownValue1.CanCollide = true
                    UnknownValue1.Transparency = 0
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Kill Character",
    Func = function()
        local PlayerCharacter2 = game:GetService("Players").LocalPlayer
        if PlayerCharacter2.Character and PlayerCharacter2.Character:FindFirstChild("Humanoid") then
            PlayerCharacter2.Character.Humanoid.Health = 0
        end
    end
})
local CharacterInfoGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Character Info", "info")
CharacterInfoGroupbox:AddLabel("Name: " .. game:GetService("Players").LocalPlayer.Name)
CharacterInfoGroupbox:AddLabel("UserId: " .. game:GetService("Players").LocalPlayer.UserId)
local FlightGroupbox = TabManager["Local Player"]:AddRightGroupbox("Flight", "wind")
FlightGroupbox:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Suffix = "",
    Callback = function(Param12)
        DefaultValue = Param12
    end,
    Tooltip = "Set your fly speed",
    Disabled = false,
    Visible = true
})
FlightGroupbox:AddToggle("FlyToggle", {
    Text = "Fly",
    Default = false,
    Callback = function(Param13)
        IsInitialized = Param13
        local PlayerInstance4 = game:GetService("Players").LocalPlayer
        if IsInitialized then
            if PlayerInstance4 and PlayerInstance4.Character and PlayerInstance4.Character:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = PlayerInstance4.Character.HumanoidRootPart
                NilValue = Instance.new("BodyVelocity")
                NilValue.Velocity = Vector3.new(0, 0, 0)
                NilValue.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                NilValue.Parent = HumanoidRootPart
                task.spawn(function()
                    while IsInitialized do
                        task.wait(0.05)
                        if PlayerInstance4.Character and PlayerInstance4.Character:FindFirstChild("HumanoidRootPart") then
                            local UnusedValue = PlayerInstance4.Character.HumanoidRootPart
                            local CurrentCamera = workspace.CurrentCamera
                            local LookVector = CurrentCamera.CFrame.LookVector
                            local ZeroVector = Vector3.new(0, 0, 0)
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                                ZeroVector = ZeroVector + LookVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                                ZeroVector = ZeroVector - LookVector
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
                            NilValue.Velocity = ZeroVector * DefaultValue
                        end
                    end
                end)
                LibraryModule:Notify({
                    Title = "Flight",
                    Content = "Flight enabled!"
                })
            end
        else
            if NilValue then
                NilValue:Destroy()
                NilValue = nil
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
game:GetService("UserInputService").InputBegan:Connect(function(Param14, Param15)
    if not Param15 then
        if Param14.KeyCode == Enum.KeyCode.F then
            IsInitialized = not IsInitialized
            LibraryToggles.FlyToggle:SetValue(IsInitialized)
        end
    end
end)
FlightGroupbox:AddToggle("NoclipToggle", {
    Text = "Noclip",
    Default = false,
    Callback = function(Param16)
        IsEnabled = Param16
        local PlayerInstance5 = game:GetService("Players").LocalPlayer
        if IsEnabled then
            task.spawn(function()
                while IsEnabled do
                    task.wait(0.05)
                    if PlayerInstance5.Character then
                        local CharacterDescendants6, CharacterDescendants7, CharacterDescendants8 = pairs(PlayerInstance5.Character:GetDescendants())
                        while true do
                            local UnknownValue2
                            CharacterDescendants8, UnknownValue2 = CharacterDescendants6(CharacterDescendants7, CharacterDescendants8)
                            if CharacterDescendants8 == nil then
                                break
                            end
                            if UnknownValue2:IsA("BasePart") then
                                UnknownValue2.CanCollide = false
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
            if PlayerInstance5.Character then
                local CharacterDescendants9, CharacterDescendants10, CharacterDescendants11 = pairs(PlayerInstance5.Character:GetDescendants())
                while true do
                    local UnknownValue3
                    CharacterDescendants11, UnknownValue3 = CharacterDescendants9(CharacterDescendants10, CharacterDescendants11)
                    if CharacterDescendants11 == nil then
                        break
                    end
                    if UnknownValue3:IsA("BasePart") then
                        UnknownValue3.CanCollide = true
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
    Callback = function(Param17)
        LibraryModule.KeybindFrame.Visible = Param17
    end
})
MenuGroupbox:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Param18)
        LibraryModule.ShowCustomCursor = Param18
    end
})
MenuGroupbox:AddDropdown("NotificationSide", {
    Values = {
        "Left",
        "Right"
    },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Param19)
        LibraryModule:SetNotifySide(Param19)
    end
})
MenuGroupbox:AddDropdown("DPIDropdown", {
    Values = {
        "50%",
        "75%",
        "100%",
        "125%",
        "150%",
        "175%",
        "200%"
    },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Param20)
        local Pattern = Param20:gsub("%%", "")
        LibraryModule:SetDPIScale((tonumber(Pattern)))
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
LibraryModule.ToggleKeybind = LibraryOptions.MenuKeybind
ThemeManagerModule:SetLibrary(LibraryModule)
SaveManagerModule:SetLibrary(LibraryModule)
SaveManagerModule:IgnoreThemeSettings()
SaveManagerModule:SetIgnoreIndexes({
    "MenuKeybind"
})
ThemeManagerModule:SetFolder("BadHub")
SaveManagerModule:SetFolder("BadHub/Jump Higher Per RNG[Offline RNG]")
SaveManagerModule:SetSubFolder("Noone")
SaveManagerModule:BuildConfigSection(TabManager["UI Settings"])
ThemeManagerModule:ApplyToTab(TabManager["UI Settings"])
SaveManagerModule:LoadAutoloadConfig()
local Library = LibraryModule
LibraryModule.OnUnload(Library, function()
    InfWinsEnabled = false
    IsDisabled = false
    IsAutoRollEnabled = false
    IsFastRngEnabled = false
    IsInitialized = false
    if NilValue then
        NilValue:Destroy()
        NilValue = nil
    end
    IsEnabled = false
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if LocalPlayer.Character then
        local Descendant1, Descendant2, Descendant3 = pairs(LocalPlayer.Character:GetDescendants())
        while true do
            local UnknownValue
            Descendant3, UnknownValue = Descendant1(Descendant2, Descendant3)
            if Descendant3 == nil then
                break
            end
            if UnknownValue:IsA("BasePart") then
                UnknownValue.CanCollide = true
            end
        end
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
    if LocalPlayer.Character then
        local Descendant4, Descendant5, Descendant6 = pairs(LocalPlayer.Character:GetDescendants())
        while true do
            local UnusedValue
            Descendant6, UnusedValue = Descendant4(Descendant5, Descendant6)
            if Descendant6 == nil then
                break
            end
            if UnusedValue:IsA("BasePart") and UnusedValue.Name ~= "HumanoidRootPart" then
                UnusedValue.CanCollide = true
                UnusedValue.Transparency = 0
            end
        end
    end
    print("Unloaded!")
end)
