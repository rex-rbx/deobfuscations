local RepositoryUrl = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local LibraryInstance = loadstring(game:HttpGet(RepositoryUrl .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(RepositoryUrl .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(RepositoryUrl .. "addons/SaveManager.lua"))()
local OptionsMenu = LibraryInstance.Options
local TogglesMenu = LibraryInstance.Toggles
LibraryInstance.ForceCheckbox = false
LibraryInstance.ShowToggleFrameInKeybinds = true
local LibraryReference = LibraryInstance
local MainWindow = LibraryInstance.CreateWindow(LibraryReference, {
    Title = "Bad Hub",
    Footer = "Version: 1.0",
    Icon = 134381203385642,
    NotifySide = "Right",
    ShowCustomCursor = true
})
local TabManager = {
    Main = MainWindow:AddTab("Main", "house"),
    Exploits = MainWindow:AddTab("Exploits", "zap"),
    ["Local Player"] = MainWindow:AddTab("Local Player", "user"),
    ["UI Settings"] = MainWindow:AddTab("UI Settings", "settings")
}
local WelcomeGroupbox = TabManager.Main:AddLeftGroupbox("Welcome", "info")
WelcomeGroupbox:AddLabel("Welcome to Bad Hub!")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("Thank you for using Bad Hub!")
WelcomeGroupbox:AddLabel("Version: 1.0")
WelcomeGroupbox:AddLabel("")
WelcomeGroupbox:AddLabel("Grow Older every Click")
WelcomeGroupbox:AddLabel("Script loaded successfully!")
local StatusGroupbox = TabManager.Main:AddRightGroupbox("Script Status", "check")
local PlaceId = game.PlaceId
Color3.fromRGB(0, 255, 0)
StatusGroupbox:AddLabel("Current Game: Grow Older every Click")
StatusGroupbox:AddLabel("Status: Active")
StatusGroupbox:AddLabel("")
StatusGroupbox:AddLabel("Features:")
StatusGroupbox:AddLabel("Auto Click")
StatusGroupbox:AddLabel("Walk Speed Control")
StatusGroupbox:AddLabel("Jump Power Control")
StatusGroupbox:AddLabel("Invisibility Toggle")
StatusGroupbox:AddLabel("Flight System (F Key)")
StatusGroupbox:AddLabel("Noclip (Collision Off)")
local AutoClickGroupbox = TabManager.Exploits:AddLeftGroupbox("Auto Click", "zap")
local AutoClickEnabled = false
local UnusedVariable = nil
local ClickSpeedValue = 0.005
AutoClickGroupbox:AddSlider("ClickSpeed", {
    Text = "Click Speed",
    Default = 0.1,
    Min = 0.001,
    Max = 1,
    Rounding = 4,
    Suffix = "s",
    Callback = function(ClickSpeedParameter)
        ClickSpeedValue = ClickSpeedParameter
    end,
    Tooltip = "Set your click speed in seconds",
    Disabled = false,
    Visible = true
})
AutoClickGroupbox:AddToggle("AutoClickToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(p17)
        AutoClickEnabled = p17
        if p17 then
            UnusedVariable = task.spawn(function()
                while AutoClickEnabled do
                    task.wait(ClickSpeedValue)
                    if AutoClickEnabled then
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Click"):FireServer()
                        end)
                    end
                end
            end)
            LibraryInstance:Notify({
                Title = "Auto Click",
                Content = "Auto Click enabled!"
            })
        else
            LibraryInstance:Notify({
                Title = "Auto Click",
                Content = "Auto Click disabled!"
            })
        end
    end
})
local AutoRebirthGroupbox = TabManager.Exploits:AddRightGroupbox("Auto Rebirth", "zap")
local AutoRebirthEnabled = false
local UnusedVariable1 = nil
local RebirthCount = 1
AutoRebirthGroupbox:AddDropdown("RebirthSelector", {
    Values = {
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22"
    },
    Default = "1",
    Text = "Select Rebirth Level",
    Callback = function(Parameter1)
        RebirthCount = tonumber(Parameter1)
    end
})
AutoRebirthGroupbox:AddToggle("AutoRebirthToggle", {
    Text = "Enable/Disable",
    Default = false,
    Callback = function(Parameter2)
        AutoRebirthEnabled = Parameter2
        if Parameter2 then
            UnusedVariable1 = task.spawn(function()
                while AutoRebirthEnabled do
                    task.wait(0.5)
                    if AutoRebirthEnabled then
                        pcall(function()
                            local RebirthText = RebirthCount == 0 and "Rebirth" or "Rebirth" .. RebirthCount .. ""
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild(RebirthText):FireServer()
                        end)
                    end
                end
            end)
            LibraryInstance:Notify({
                Title = "Auto Rebirth",
                Content = "Auto Rebirth enabled! (Level " .. RebirthCount .. ")"
            })
        else
            LibraryInstance:Notify({
                Title = "Auto Rebirth",
                Content = "Auto Rebirth disabled!"
            })
        end
    end
})
local PlayerControlsGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Player Controls", "user")
local UnusedValue1 = 16
local UnusedValue2 = 50
task.spawn(function()
    while true do
        repeat
            task.wait(0.05)
            local LocalPlayer = game:GetService("Players").LocalPlayer
        until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        LocalPlayer.Character.Humanoid.WalkSpeed = UnusedValue1
    end
end)
PlayerControlsGroupbox:AddSlider("PlayerSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter3)
        UnusedValue1 = Parameter3
        local LocalPlayerReference = game:GetService("Players").LocalPlayer
        if LocalPlayerReference.Character and LocalPlayerReference.Character:FindFirstChild("Humanoid") then
            LocalPlayerReference.Character.Humanoid.WalkSpeed = Parameter3
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
    Callback = function(Parameter4)
        UnusedValue2 = Parameter4
        local LocalPlayerInstance = game:GetService("Players").LocalPlayer
        if LocalPlayerInstance.Character and LocalPlayerInstance.Character:FindFirstChild("Humanoid") then
            LocalPlayerInstance.Character.Humanoid.JumpPower = Parameter4
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
        local LocalPlayerCharacter = game:GetService("Players").LocalPlayer
        if LocalPlayerCharacter.Character then
            local CharacterDescendants, CharacterDescendants1, CharacterDescendants2 = pairs(LocalPlayerCharacter.Character:GetDescendants())
            while true do
                local UnusedVariable2
                CharacterDescendants2, UnusedVariable2 = CharacterDescendants(CharacterDescendants1, CharacterDescendants2)
                if CharacterDescendants2 == nil then
                    break
                end
                if UnusedVariable2:IsA("BasePart") and UnusedVariable2.Name ~= "HumanoidRootPart" then
                    UnusedVariable2.CanCollide = false
                    UnusedVariable2.Transparency = 1
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Make Visible",
    Func = function()
        local LocalPlayerInstance1 = game:GetService("Players").LocalPlayer
        if LocalPlayerInstance1.Character then
            local CharacterDescendants3, CharacterDescendants4, CharacterDescendants5 = pairs(LocalPlayerInstance1.Character:GetDescendants())
            while true do
                local UnusedVariable3
                CharacterDescendants5, UnusedVariable3 = CharacterDescendants3(CharacterDescendants4, CharacterDescendants5)
                if CharacterDescendants5 == nil then
                    break
                end
                if UnusedVariable3:IsA("BasePart") and UnusedVariable3.Name ~= "HumanoidRootPart" then
                    UnusedVariable3.CanCollide = true
                    UnusedVariable3.Transparency = 0
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Kill Character",
    Func = function()
        local LocalPlayerReference1 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference1.Character and LocalPlayerReference1.Character:FindFirstChild("Humanoid") then
            LocalPlayerReference1.Character.Humanoid.Health = 0
        end
    end
})
local CharacterInfoGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Character Info", "info")
CharacterInfoGroupbox:AddLabel("Name: " .. game:GetService("Players").LocalPlayer.Name)
CharacterInfoGroupbox:AddLabel("UserId: " .. game:GetService("Players").LocalPlayer.UserId)
local FlightGroupbox = TabManager["Local Player"]:AddRightGroupbox("Flight", "wind")
local FlightEnabled = false
local UnusedValue3 = 50
local UnusedVariable4 = nil
local UnusedVariable5 = false
FlightGroupbox:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter5)
        UnusedValue3 = Parameter5
    end,
    Tooltip = "Set your fly speed",
    Disabled = false,
    Visible = true
})
FlightGroupbox:AddToggle("FlyToggle", {
    Text = "Fly",
    Default = false,
    Callback = function(Parameter6)
        FlightEnabled = Parameter6
        local LocalPlayerInstance2 = game:GetService("Players").LocalPlayer
        if FlightEnabled then
            if LocalPlayerInstance2 and LocalPlayerInstance2.Character and LocalPlayerInstance2.Character:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = LocalPlayerInstance2.Character.HumanoidRootPart
                UnusedVariable4 = Instance.new("BodyVelocity")
                UnusedVariable4.Velocity = Vector3.new(0, 0, 0)
                UnusedVariable4.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                UnusedVariable4.Parent = HumanoidRootPart
                task.spawn(function()
                    while FlightEnabled do
                        task.wait(0.05)
                        if LocalPlayerInstance2.Character and LocalPlayerInstance2.Character:FindFirstChild("HumanoidRootPart") then
                            local HumanoidRootPartReference = LocalPlayerInstance2.Character.HumanoidRootPart
                            local CurrentCamera = workspace.CurrentCamera
                            local CameraLookVector = CurrentCamera.CFrame.LookVector
                            local VectorZero = Vector3.new(0, 0, 0)
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                                VectorZero = VectorZero + CameraLookVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                                VectorZero = VectorZero - CameraLookVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                                VectorZero = VectorZero - CurrentCamera.CFrame.RightVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                                VectorZero = VectorZero + CurrentCamera.CFrame.RightVector
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                                VectorZero = VectorZero + Vector3.new(0, 1, 0)
                            end
                            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                                VectorZero = VectorZero - Vector3.new(0, 1, 0)
                            end
                            if VectorZero.Magnitude > 0 then
                                VectorZero = VectorZero.Unit
                            end
                            UnusedVariable4.Velocity = VectorZero * UnusedValue3
                        end
                    end
                end)
                LibraryInstance:Notify({
                    Title = "Flight",
                    Content = "Flight enabled!"
                })
            end
        else
            if UnusedVariable4 then
                UnusedVariable4:Destroy()
                UnusedVariable4 = nil
            end
            LibraryInstance:Notify({
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
game:GetService("UserInputService").InputBegan:Connect(function(Parameter7, Parameter8)
    if not Parameter8 then
        if Parameter7.KeyCode == Enum.KeyCode.F then
            FlightEnabled = not FlightEnabled
            TogglesMenu.FlyToggle:SetValue(FlightEnabled)
        end
    end
end)
FlightGroupbox:AddToggle("NoclipToggle", {
    Text = "Noclip",
    Default = false,
    Callback = function(Parameter9)
        UnusedVariable5 = Parameter9
        local LocalPlayerInstance3 = game:GetService("Players").LocalPlayer
        if UnusedVariable5 then
            task.spawn(function()
                while UnusedVariable5 do
                    task.wait(0.05)
                    if LocalPlayerInstance3.Character then
                        local CharacterDescendants6, CharacterDescendants7, CharacterDescendants8 = pairs(LocalPlayerInstance3.Character:GetDescendants())
                        while true do
                            local UnusedVariable6
                            CharacterDescendants8, UnusedVariable6 = CharacterDescendants6(CharacterDescendants7, CharacterDescendants8)
                            if CharacterDescendants8 == nil then
                                break
                            end
                            if UnusedVariable6:IsA("BasePart") then
                                UnusedVariable6.CanCollide = false
                            end
                        end
                    end
                end
            end)
            LibraryInstance:Notify({
                Title = "Noclip",
                Content = "Noclip enabled!"
            })
        else
            if LocalPlayerInstance3.Character then
                local CharacterDescendants9, CharacterDescendants10, CharacterDescendants11 = pairs(LocalPlayerInstance3.Character:GetDescendants())
                while true do
                    local UnusedVariable7
                    CharacterDescendants11, UnusedVariable7 = CharacterDescendants9(CharacterDescendants10, CharacterDescendants11)
                    if CharacterDescendants11 == nil then
                        break
                    end
                    if UnusedVariable7:IsA("BasePart") then
                        UnusedVariable7.CanCollide = true
                    end
                end
            end
            LibraryInstance:Notify({
                Title = "Noclip",
                Content = "Noclip disabled!"
            })
        end
    end
})
local MenuGroupbox = TabManager["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroupbox:AddToggle("KeybindMenuOpen", {
    Default = LibraryInstance.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(Parameter10)
        LibraryInstance.KeybindFrame.Visible = Parameter10
    end
})
MenuGroupbox:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Parameter11)
        LibraryInstance.ShowCustomCursor = Parameter11
    end
})
MenuGroupbox:AddDropdown("NotificationSide", {
    Values = {
        "Left",
        "Right"
    },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Parameter12)
        LibraryInstance:SetNotifySide(Parameter12)
    end
})
MenuGroupbox:AddDivider()
MenuGroupbox:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})
MenuGroupbox:AddButton("Unload", function()
    LibraryInstance:Unload()
end)
LibraryInstance.ToggleKeybind = OptionsMenu.MenuKeybind
ThemeManager:SetLibrary(LibraryInstance)
SaveManager:SetLibrary(LibraryInstance)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({
    "MenuKeybind"
})
ThemeManager:SetFolder("BadHub")
SaveManager:SetFolder("BadHub/Age")
SaveManager:SetSubFolder("Config")
SaveManager:BuildConfigSection(TabManager["UI Settings"])
ThemeManager:ApplyToTab(TabManager["UI Settings"])
SaveManager:LoadAutoloadConfig()
local LibraryReference1 = LibraryInstance
LibraryInstance.OnUnload(LibraryReference1, function()
    AutoClickEnabled = false
    AutoRebirthEnabled = false
    FlightEnabled = false
    if UnusedVariable4 then
        UnusedVariable4:Destroy()
        UnusedVariable4 = nil
    end
    UnusedVariable5 = false
    local LocalPlayerInstance4 = game:GetService("Players").LocalPlayer
    if LocalPlayerInstance4.Character then
        local CharacterDescendants12, CharacterDescendants13, CharacterDescendants14 = pairs(LocalPlayerInstance4.Character:GetDescendants())
        while true do
            local UnusedVariable8
            CharacterDescendants14, UnusedVariable8 = CharacterDescendants12(CharacterDescendants13, CharacterDescendants14)
            if CharacterDescendants14 == nil then
                break
            end
            if UnusedVariable8:IsA("BasePart") then
                UnusedVariable8.CanCollide = true
            end
        end
    end
    if LocalPlayerInstance4.Character and LocalPlayerInstance4.Character:FindFirstChild("Humanoid") then
        LocalPlayerInstance4.Character.Humanoid.WalkSpeed = 16
        LocalPlayerInstance4.Character.Humanoid.JumpPower = 50
    end
    if LocalPlayerInstance4.Character then
        local CharacterDescendants15, CharacterDescendants16, CharacterDescendants17 = pairs(LocalPlayerInstance4.Character:GetDescendants())
        while true do
            local UnusedVariable9
            CharacterDescendants17, UnusedVariable9 = CharacterDescendants15(CharacterDescendants16, CharacterDescendants17)
            if CharacterDescendants17 == nil then
                break
            end
            if UnusedVariable9:IsA("BasePart") and UnusedVariable9.Name ~= "HumanoidRootPart" then
                UnusedVariable9.CanCollide = true
                UnusedVariable9.Transparency = 0
            end
        end
    end
    LibraryInstance:Notify({
        Title = "Unload",
        Content = "Age Script Unloaded!"
    })
end)
