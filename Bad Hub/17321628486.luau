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
WelcomeGroupbox:AddLabel("No Jumping Obby")
WelcomeGroupbox:AddLabel("[Checkpoint Teleporter]")
local ScriptStatusGroupbox = TabManager.Main:AddRightGroupbox("Script Status", "check")
ScriptStatusGroupbox:AddLabel("Script: No Jump Game")
ScriptStatusGroupbox:AddLabel("Status: Active")
ScriptStatusGroupbox:AddLabel("")
ScriptStatusGroupbox:AddLabel("Features:")
ScriptStatusGroupbox:AddLabel("Checkpoint Teleporter")
ScriptStatusGroupbox:AddLabel("Auto Rebirth (Stage 241)")
ScriptStatusGroupbox:AddLabel("Walk Speed Control")
ScriptStatusGroupbox:AddLabel("Jump Enable/Disable")
ScriptStatusGroupbox:AddLabel("Flight System (F Key)")
ScriptStatusGroupbox:AddLabel("Noclip")
local PlayerMouse = game:GetService("Players").LocalPlayer:GetMouse()
local CheckpointTeleporterGroupbox = TabManager.Exploits:AddLeftGroupbox("Checkpoint Teleporter", "flag")
local CheckpointTeleporterRunning = false
local TeleportDelay = 0.1
local AutoRebirthEnabled = false
CheckpointTeleporterGroupbox:AddButton({
    Text = "Get All Checkpoints",
    Func = function()
        if CheckpointTeleporterRunning then
            LibraryInstance:Notify({
                Title = "Checkpoint",
                Content = "Checkpoint teleporter already running!"
            })
        else
            CheckpointTeleporterRunning = true
            task.spawn(function()
                local CheckpointContainer = game.Workspace:FindFirstChild("Checkpoints")
                if CheckpointContainer then
                    local LocalPlayer = game:GetService("Players").LocalPlayer
                    local CheckpointIndex = 1
                    if LocalPlayer and LocalPlayer:FindFirstChild("leaderstats") then
                        local PlayerStage = LocalPlayer.leaderstats:FindFirstChild("Stage")
                        if PlayerStage then
                            CheckpointIndex = PlayerStage.Value
                            LibraryInstance:Notify({
                                Title = "Checkpoint",
                                Content = "Starting from stage: " .. CheckpointIndex
                            })
                        end
                    end
                    while CheckpointIndex <= math.huge and CheckpointTeleporterRunning do
                        local CheckpointInstance = CheckpointContainer:FindFirstChild(tostring(CheckpointIndex))
                        if CheckpointInstance then
                            local LocalPlayerReference = game:GetService("Players").LocalPlayer
                            if LocalPlayerReference.Character and LocalPlayerReference.Character:FindFirstChild("HumanoidRootPart") then
                                pcall(function()
                                    if CheckpointIndex ~= 241 then
                                        if CheckpointInstance:FindFirstChild("HumanoidRootPart") then
                                            LocalPlayerReference.Character.HumanoidRootPart.CFrame = CheckpointInstance.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                                        elseif CheckpointInstance:IsA("Part") then
                                            LocalPlayerReference.Character.HumanoidRootPart.CFrame = CFrame.new(CheckpointInstance.Position + Vector3.new(0, 2, 0))
                                        end
                                    elseif CheckpointInstance:FindFirstChild("HumanoidRootPart") then
                                        LocalPlayerReference.Character.HumanoidRootPart.CFrame = CheckpointInstance.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                                    elseif CheckpointInstance:IsA("Part") then
                                        LocalPlayerReference.Character.HumanoidRootPart.CFrame = CFrame.new(CheckpointInstance.Position + Vector3.new(0, 5, 0))
                                    end
                                end)
                            end
                            task.wait(TeleportDelay)
                            local TeleportDistance = TeleportDelay >= 0.1 and 0.09 or TeleportDelay / 2
                            task.wait(TeleportDistance)
                            if LocalPlayerReference and LocalPlayerReference:FindFirstChild("leaderstats") then
                                local PlayerStageReference = LocalPlayerReference.leaderstats:FindFirstChild("Stage")
                                if PlayerStageReference then
                                    if CheckpointIndex <= PlayerStageReference.Value then
                                        CheckpointIndex = CheckpointIndex + 1
                                    end
                                else
                                    CheckpointIndex = CheckpointIndex + 1
                                end
                            else
                                CheckpointIndex = CheckpointIndex + 1
                            end
                        else
                            task.wait(1)
                        end
                    end
                    CheckpointTeleporterRunning = false
                else
                    LibraryInstance:Notify({
                        Title = "Error",
                        Content = "Checkpoints folder not found in Workspace!"
                    })
                    CheckpointTeleporterRunning = false
                end
            end)
        end
    end
})
task.spawn(function()
    while true do
        repeat
            task.wait(0.5)
        until AutoRebirthEnabled
        local LocalPlayerInstance = game:GetService("Players").LocalPlayer
        if LocalPlayerInstance and LocalPlayerInstance:FindFirstChild("leaderstats") then
            local PlayerStageInstance = LocalPlayerInstance.leaderstats:FindFirstChild("Stage")
            if PlayerStageInstance and PlayerStageInstance.Value >= 241 then
                pcall(function()
                    local RebirthToggle = game:GetService("StarterGui"):FindFirstChild("SideGuis"):FindFirstChild("ToggleRebirth")
                    if RebirthToggle and RebirthToggle:IsA("GuiButton") then
                        local RebirthTogglePosition = RebirthToggle.AbsolutePosition + RebirthToggle.AbsoluteSize / 2
                        RebirthToggle.Parent.Visible = true
                        RebirthToggle.Visible = true
                        task.wait(0.1)
                        PlayerMouse.Move(RebirthTogglePosition.X, RebirthTogglePosition.Y)
                        task.wait(0.05)
                        RebirthToggle.MouseButton1Down:Fire()
                        task.wait(0.05)
                        RebirthToggle.MouseButton1Up:Fire()
                        task.wait(1.5)
                    end
                    local RebirthFrame = game:GetService("StarterGui"):FindFirstChild("RebirthFrame"):FindFirstChild("Content"):FindFirstChild("Yes")
                    if RebirthFrame and RebirthFrame:IsA("GuiButton") then
                        local RebirthFramePosition = RebirthFrame.AbsolutePosition + RebirthFrame.AbsoluteSize / 2
                        RebirthFrame.Parent.Parent.Parent.Visible = true
                        RebirthFrame.Parent.Parent.Visible = true
                        RebirthFrame.Parent.Visible = true
                        RebirthFrame.Visible = true
                        task.wait(0.1)
                        PlayerMouse.Move(RebirthFramePosition.X, RebirthFramePosition.Y)
                        task.wait(0.05)
                        RebirthFrame.MouseButton1Down:Fire()
                        task.wait(0.05)
                        RebirthFrame.MouseButton1Up:Fire()
                        LibraryInstance:Notify({
                            Title = "Rebirth",
                            Content = "Auto rebirth at stage 241!"
                        })
                        task.wait(2)
                    end
                end)
            end
        end
    end
end)
CheckpointTeleporterGroupbox:AddSlider("TeleportSpeed", {
    Text = "Teleport Speed",
    Default = 0.1,
    Min = 0.05,
    Max = 1,
    Rounding = 2,
    Suffix = "s",
    Callback = function(Parameter1)
        TeleportDelay = Parameter1
    end,
    Tooltip = "Set the teleport interval in seconds",
    Disabled = false,
    Visible = true
})
CheckpointTeleporterGroupbox:AddButton({
    Text = "Stop",
    Func = function()
        CheckpointTeleporterRunning = false
        LibraryInstance:Notify({
            Title = "Checkpoint",
            Content = "Stopped!"
        })
    end
})
local AutoRebirthGroupbox = TabManager.Exploits:AddRightGroupbox("Auto Rebirth", "repeat")
AutoRebirthGroupbox:AddToggle("AutoRebirthToggle", {
    Text = "Auto Rebirth",
    Default = false,
    Callback = function(Parameter2)
        AutoRebirthEnabled = Parameter2
        if Parameter2 then
            LibraryInstance:Notify({
                Title = "Rebirth",
                Content = "Auto Rebirth enabled!"
            })
        else
            LibraryInstance:Notify({
                Title = "Rebirth",
                Content = "Auto Rebirth disabled!"
            })
        end
    end
})
AutoRebirthGroupbox:AddButton({
    Text = "Rebirth",
    Func = function()
        pcall(function()
            local RebirthToggleReference = game:GetService("StarterGui"):FindFirstChild("SideGuis"):FindFirstChild("ToggleRebirth")
            if RebirthToggleReference and RebirthToggleReference:IsA("GuiButton") then
                local RebirthTogglePositionReference = RebirthToggleReference.AbsolutePosition + RebirthToggleReference.AbsoluteSize / 2
                RebirthToggleReference.Parent.Visible = true
                RebirthToggleReference.Visible = true
                task.wait(0.1)
                PlayerMouse.Move(RebirthTogglePositionReference.X, RebirthTogglePositionReference.Y)
                task.wait(0.05)
                RebirthToggleReference.MouseButton1Down:Fire()
                task.wait(0.05)
                RebirthToggleReference.MouseButton1Up:Fire()
                task.wait(0.5)
            end
            local RebirthFrameReference = game:GetService("StarterGui"):FindFirstChild("RebirthFrame"):FindFirstChild("Content"):FindFirstChild("Yes")
            if RebirthFrameReference and RebirthFrameReference:IsA("GuiButton") then
                local RebirthFramePositionReference = RebirthFrameReference.AbsolutePosition + RebirthFrameReference.AbsoluteSize / 2
                RebirthFrameReference.Parent.Parent.Parent.Visible = true
                RebirthFrameReference.Parent.Parent.Visible = true
                RebirthFrameReference.Parent.Visible = true
                RebirthFrameReference.Visible = true
                task.wait(0.1)
                PlayerMouse.Move(RebirthFramePositionReference.X, RebirthFramePositionReference.Y)
                task.wait(0.05)
                RebirthFrameReference.MouseButton1Down:Fire()
                task.wait(0.05)
                RebirthFrameReference.MouseButton1Up:Fire()
                LibraryInstance:Notify({
                    Title = "Rebirth",
                    Content = "Rebirth successful!"
                })
            else
                LibraryInstance:Notify({
                    Title = "Error",
                    Content = "Rebirth UI not found!"
                })
            end
        end)
    end
})
local PlayerControlsGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Player Controls", "user")
local JumpForce = 16
local WalkSpeed = 50
local NoclipEnabled = false
local FlightEnabled = false
local FlightSpeed = 50
local FlightDirection = nil
local JumpEnabled = false
PlayerControlsGroupbox:AddSlider("PlayerSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter3)
        JumpForce = Parameter3
        local LocalPlayerReference2 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference2.Character and LocalPlayerReference2.Character:FindFirstChild("Humanoid") then
            LocalPlayerReference2.Character.Humanoid.WalkSpeed = Parameter3
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
        WalkSpeed = Parameter4
        local LocalPlayerInstance2 = game:GetService("Players").LocalPlayer
        if LocalPlayerInstance2.Character and LocalPlayerInstance2.Character:FindFirstChild("Humanoid") then
            LocalPlayerInstance2.Character.Humanoid.JumpPower = Parameter4
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
        local LocalPlayerReference3 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference3.Character then
            local CharacterDescendants, CharacterDescendantsReference, CharacterDescendantsInstance = pairs(LocalPlayerReference3.Character:GetDescendants())
            while true do
                local UnusedVariable
                CharacterDescendantsInstance, UnusedVariable = CharacterDescendants(CharacterDescendantsReference, CharacterDescendantsInstance)
                if CharacterDescendantsInstance == nil then
                    break
                end
                if UnusedVariable:IsA("BasePart") and UnusedVariable.Name ~= "HumanoidRootPart" then
                    UnusedVariable.CanCollide = false
                    UnusedVariable.Transparency = 1
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Make Visible",
    Func = function()
        local LocalPlayerReference4 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference4.Character then
            local CharacterDescendants2, CharacterDescendantsReference2, CharacterDescendantsInstance2 = pairs(LocalPlayerReference4.Character:GetDescendants())
            while true do
                local UnusedVariable2
                CharacterDescendantsInstance2, UnusedVariable2 = CharacterDescendants2(CharacterDescendantsReference2, CharacterDescendantsInstance2)
                if CharacterDescendantsInstance2 == nil then
                    break
                end
                if UnusedVariable2:IsA("BasePart") and UnusedVariable2.Name ~= "HumanoidRootPart" then
                    UnusedVariable2.CanCollide = true
                    UnusedVariable2.Transparency = 0
                end
            end
        end
    end
})
CharacterGroupbox:AddButton({
    Text = "Kill Character",
    Func = function()
        local LocalPlayerReference5 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference5.Character and LocalPlayerReference5.Character:FindFirstChild("Humanoid") then
            LocalPlayerReference5.Character.Humanoid.Health = 0
        end
    end
})
local JumpingGroupbox = TabManager["Local Player"]:AddLeftGroupbox("Jumping", "user")
JumpingGroupbox:AddButton({
    Text = "Enable Jumping",
    Func = function()
        NoclipEnabled = true
        local EnableJumpingRemote = game.ReplicatedStorage:FindFirstChild("EnableJumping")
        if EnableJumpingRemote then
            if EnableJumpingRemote:IsA("BindableEvent") then
                EnableJumpingRemote:Fire()
            elseif EnableJumpingRemote:IsA("RemoteEvent") then
                EnableJumpingRemote:FireServer()
            end
        end
        local LocalPlayerReference6 = game:GetService("Players").LocalPlayer
        if LocalPlayerReference6.Character and LocalPlayerReference6.Character:FindFirstChild("Humanoid") then
            LocalPlayerReference6.Character.Humanoid.JumpPower = 50
        end
        LibraryInstance:Notify({
            Title = "Jump",
            Content = "Jumping enabled!"
        })
    end
})
JumpingGroupbox:AddButton({
    Text = "Disable Jumping",
    Func = function()
        NoclipEnabled = false
        local LocalPlayerInstance3 = game:GetService("Players").LocalPlayer
        if LocalPlayerInstance3.Character and LocalPlayerInstance3.Character:FindFirstChild("Humanoid") then
            LocalPlayerInstance3.Character.Humanoid.JumpPower = 0
        end
        LibraryInstance:Notify({
            Title = "Jump",
            Content = "Jumping disabled!"
        })
    end
})
local FlightGroupbox = TabManager["Local Player"]:AddRightGroupbox("Flight", "wind")
FlightGroupbox:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Suffix = "",
    Callback = function(Parameter5)
        FlightSpeed = Parameter5
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
        local LocalPlayerReference7 = game:GetService("Players").LocalPlayer
        if FlightEnabled then
            if LocalPlayerReference7 and LocalPlayerReference7.Character and LocalPlayerReference7.Character:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = LocalPlayerReference7.Character.HumanoidRootPart
                FlightDirection = Instance.new("BodyVelocity")
                FlightDirection.Velocity = Vector3.new(0, 0, 0)
                FlightDirection.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                FlightDirection.Parent = HumanoidRootPart
                task.spawn(function()
                    while FlightEnabled do
                        task.wait(0.05)
                        if LocalPlayerReference7.Character and LocalPlayerReference7.Character:FindFirstChild("HumanoidRootPart") then
                            local UnusedVariable3 = LocalPlayerReference7.Character.HumanoidRootPart
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
                            FlightDirection.Velocity = ZeroVector * FlightSpeed
                        end
                    end
                end)
                LibraryInstance:Notify({
                    Title = "Flight",
                    Content = "Flight enabled!"
                })
            end
        else
            if FlightDirection then
                FlightDirection:Destroy()
                FlightDirection = nil
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
        JumpEnabled = Parameter9
        local LocalPlayerReference8 = game:GetService("Players").LocalPlayer
        if JumpEnabled then
            task.spawn(function()
                while JumpEnabled do
                    task.wait(0.05)
                    if LocalPlayerReference8.Character then
                        local CharacterDescendants3, CharacterDescendantsReference3, CharacterDescendantsInstance3 = pairs(LocalPlayerReference8.Character:GetDescendants())
                        while true do
                            local UnusedVariable4
                            CharacterDescendantsInstance3, UnusedVariable4 = CharacterDescendants3(CharacterDescendantsReference3, CharacterDescendantsInstance3)
                            if CharacterDescendantsInstance3 == nil then
                                break
                            end
                            if UnusedVariable4:IsA("BasePart") then
                                UnusedVariable4.CanCollide = false
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
            if LocalPlayerReference8.Character then
                local CharacterDescendants4, CharacterDescendantsReference4, CharacterDescendantsInstance4 = pairs(LocalPlayerReference8.Character:GetDescendants())
                while true do
                    local UnusedVariable5
                    CharacterDescendantsInstance4, UnusedVariable5 = CharacterDescendants4(CharacterDescendantsReference4, CharacterDescendantsInstance4)
                    if CharacterDescendantsInstance4 == nil then
                        break
                    end
                    if UnusedVariable5:IsA("BasePart") then
                        UnusedVariable5.CanCollide = true
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
SaveManager:SetFolder("BadHub/NO JUMPING OBBY")
SaveManager:SetSubFolder("Noone")
SaveManager:BuildConfigSection(TabManager["UI Settings"])
ThemeManager:ApplyToTab(TabManager["UI Settings"])
SaveManager:LoadAutoloadConfig()
local LibraryReference2 = LibraryInstance
LibraryInstance.OnUnload(LibraryReference2, function()
    CheckpointTeleporterRunning = false
    NoclipEnabled = false
    FlightEnabled = false
    if FlightDirection then
        FlightDirection:Destroy()
        FlightDirection = nil
    end
    JumpEnabled = false
    local LocalPlayerReference9 = game:GetService("Players").LocalPlayer
    if LocalPlayerReference9.Character then
        local CharacterDescendants5, CharacterDescendantsReference5, CharacterDescendantsInstance5 = pairs(LocalPlayerReference9.Character:GetDescendants())
        while true do
            local UnusedVariable6
            CharacterDescendantsInstance5, UnusedVariable6 = CharacterDescendants5(CharacterDescendantsReference5, CharacterDescendantsInstance5)
            if CharacterDescendantsInstance5 == nil then
                break
            end
            if UnusedVariable6:IsA("BasePart") then
                UnusedVariable6.CanCollide = true
            end
        end
    end
    if LocalPlayerReference9.Character and LocalPlayerReference9.Character:FindFirstChild("Humanoid") then
        LocalPlayerReference9.Character.Humanoid.WalkSpeed = 16
        LocalPlayerReference9.Character.Humanoid.JumpPower = 50
    end
    if LocalPlayerReference9.Character then
        local CharacterDescendants6, CharacterDescendantsReference6, CharacterDescendantsInstance6 = pairs(LocalPlayerReference9.Character:GetDescendants())
        while true do
            local UnusedVariable7
            CharacterDescendantsInstance6, UnusedVariable7 = CharacterDescendants6(CharacterDescendantsReference6, CharacterDescendantsInstance6)
            if CharacterDescendantsInstance6 == nil then
                break
            end
            if UnusedVariable7:IsA("BasePart") and UnusedVariable7.Name ~= "HumanoidRootPart" then
                UnusedVariable7.CanCollide = true
                UnusedVariable7.Transparency = 0
            end
        end
    end
    LibraryInstance:Notify({
        Title = "Unload",
        Content = "Bad Hub Unloaded!"
    })
end)
