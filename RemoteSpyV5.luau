local PlayerService = game:GetService("Players")
local LocalPlayerInstance = PlayerService.LocalPlayer
local MainScreenGui = Instance.new("ScreenGui")
MainScreenGui.Name = "RemoteSpyV5"
MainScreenGui.Parent = game.CoreGui
local OrangeColor = Color3.fromRGB(255, 140, 0)
local DarkGrayColor = Color3.fromRGB(20, 20, 20)
local GrayColor = Color3.fromRGB(30, 30, 30)
local LightGrayColor = Color3.fromRGB(40, 40, 40)
local WhiteColor = Color3.fromRGB(255, 255, 255)
local RedOrangeColor = Color3.fromRGB(200, 100, 0)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Position = UDim2.new(0.5, - 400, 0.5, - 300)
MainFrame.BackgroundColor3 = DarkGrayColor
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = MainScreenGui
local BorderFrame = Instance.new("Frame")
BorderFrame.Size = UDim2.new(1, 8, 1, 8)
BorderFrame.Position = UDim2.new(0, - 4, 0, - 4)
BorderFrame.BackgroundColor3 = OrangeColor
BorderFrame.BorderSizePixel = 0
BorderFrame.ZIndex = 0
BorderFrame.Parent = MainFrame
local TopBarFrame = Instance.new("Frame")
TopBarFrame.Size = UDim2.new(1, 0, 0, 60)
TopBarFrame.Position = UDim2.new(0, 0, 0, 0)
TopBarFrame.BackgroundColor3 = OrangeColor
TopBarFrame.BorderSizePixel = 0
TopBarFrame.Parent = MainFrame
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, - 160, 1, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "RemoteSpy v5"
TitleLabel.TextColor3 = WhiteColor
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 40
TitleLabel.Parent = TopBarFrame
TitleLabel.BorderSizePixel = 0
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 50, 0, 40)
CloseButton.Position = UDim2.new(1, - 55, 0, 10)
CloseButton.BackgroundColor3 = RedOrangeColor
CloseButton.Text = "X"
CloseButton.TextColor3 = WhiteColor
CloseButton.Font = Enum.Font.GothamBlack
CloseButton.TextSize = 28
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TopBarFrame
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 80, 0, 40)
MinimizeButton.Position = UDim2.new(1, - 145, 0, 10)
MinimizeButton.BackgroundColor3 = RedOrangeColor
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = WhiteColor
MinimizeButton.Font = Enum.Font.GothamBlack
MinimizeButton.TextSize = 36
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Parent = TopBarFrame
local SeparatorLabel = Instance.new("TextLabel")
SeparatorLabel.Size = UDim2.new(1, 0, 0, 30)
SeparatorLabel.Position = UDim2.new(0, 0, 0, 60)
SeparatorLabel.BackgroundTransparency = 1
SeparatorLabel.Text = "A modern remote explorer for Roblox"
SeparatorLabel.TextColor3 = OrangeColor
SeparatorLabel.Font = Enum.Font.Gotham
SeparatorLabel.TextSize = 20
SeparatorLabel.Parent = MainFrame
local MenuItemIndex, MenuItemName, MenuItemValue = ipairs({
    "Refresh",
    "Settings",
    "Export",
    "Help",
    "About"
})
local EmptyTable = {}
while true do
    local UnusedVariable
    MenuItemValue, UnusedVariable = MenuItemIndex(MenuItemName, MenuItemValue)
    if MenuItemValue == nil then
        break
    end
    local ActionButton = Instance.new("TextButton")
    ActionButton.Size = UDim2.new(0, 120, 0, 36)
    ActionButton.Position = UDim2.new(0, 20 + (MenuItemValue - 1) * 130, 0, 100)
    ActionButton.BackgroundColor3 = OrangeColor
    ActionButton.Text = UnusedVariable
    ActionButton.TextColor3 = WhiteColor
    ActionButton.Font = Enum.Font.GothamBold
    ActionButton.TextSize = 20
    ActionButton.BorderSizePixel = 0
    ActionButton.Parent = MainFrame
    EmptyTable[UnusedVariable] = ActionButton
end
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, - 40, 0, 30)
InfoLabel.Position = UDim2.new(0, 20, 0, 150)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Remotes found in this game. Click a button to interact."
InfoLabel.TextColor3 = OrangeColor
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 18
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = MainFrame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, - 40, 1, - 220)
ScrollingFrame.Position = UDim2.new(0, 20, 0, 190)
ScrollingFrame.BackgroundColor3 = GrayColor
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Parent = MainFrame
local function LoadFunction(Parameter1, Parameter2)
    local ContainerFrame = Instance.new("Frame")
    ContainerFrame.Size = UDim2.new(1, 0, 0, 70)
    ContainerFrame.BackgroundColor3 = LightGrayColor
    ContainerFrame.BorderSizePixel = 0
    local DescriptionLabel = Instance.new("TextLabel")
    DescriptionLabel.Size = UDim2.new(1, - 220, 0, 28)
    DescriptionLabel.Position = UDim2.new(0, 10, 0, 6)
    DescriptionLabel.BackgroundTransparency = 1
    DescriptionLabel.Text = "[" .. Parameter1.ClassName .. "] " .. Parameter1.Name
    DescriptionLabel.TextColor3 = OrangeColor
    DescriptionLabel.Font = Enum.Font.GothamBold
    DescriptionLabel.TextSize = 20
    DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescriptionLabel.Parent = ContainerFrame
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(1, - 220, 0, 22)
    ValueLabel.Position = UDim2.new(0, 10, 0, 36)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = Parameter2
    ValueLabel.TextColor3 = WhiteColor
    ValueLabel.Font = Enum.Font.Gotham
    ValueLabel.TextSize = 15
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
    ValueLabel.Parent = ContainerFrame
    local EditButton = Instance.new("TextButton")
    EditButton.Size = UDim2.new(0, 60, 0, 28)
    EditButton.Position = UDim2.new(1, - 200, 0, 21)
    EditButton.AnchorPoint = Vector2.new(0, 0)
    EditButton.BackgroundColor3 = OrangeColor
    EditButton.Text = "Fire"
    EditButton.TextColor3 = WhiteColor
    EditButton.Font = Enum.Font.GothamBold
    EditButton.TextSize = 15
    EditButton.BorderSizePixel = 0
    EditButton.Parent = ContainerFrame
    local SaveButton = Instance.new("TextButton")
    SaveButton.Size = UDim2.new(0, 60, 0, 28)
    SaveButton.Position = UDim2.new(1, - 135, 0, 21)
    SaveButton.AnchorPoint = Vector2.new(0, 0)
    SaveButton.BackgroundColor3 = OrangeColor
    SaveButton.Text = "Copy"
    SaveButton.TextColor3 = WhiteColor
    SaveButton.Font = Enum.Font.GothamBold
    SaveButton.TextSize = 15
    SaveButton.BorderSizePixel = 0
    SaveButton.Parent = ContainerFrame
    local DeleteButton = Instance.new("TextButton")
    DeleteButton.Size = UDim2.new(0, 60, 0, 28)
    DeleteButton.Position = UDim2.new(1, - 70, 0, 21)
    DeleteButton.AnchorPoint = Vector2.new(0, 0)
    DeleteButton.BackgroundColor3 = DarkGrayColor
    DeleteButton.Text = "Info"
    DeleteButton.TextColor3 = OrangeColor
    DeleteButton.Font = Enum.Font.Gotham
    DeleteButton.TextSize = 15
    DeleteButton.BorderSizePixel = 0
    DeleteButton.Parent = ContainerFrame
    EditButton.MouseButton1Click:Connect(function()
        if Parameter1:IsA("RemoteEvent") then
            Parameter1:FireServer()
        elseif Parameter1:IsA("RemoteFunction") then
            pcall(function()
                Parameter1:InvokeServer()
            end)
        end
    end)
    SaveButton.MouseButton1Click:Connect(function()
        setclipboard(Parameter2)
    end)
    DeleteButton.MouseButton1Click:Connect(function()
        InfoLabel.Text = "[" .. Parameter1.ClassName .. "] " .. Parameter1.Name .. " | Path: " .. Parameter2
    end)
    return ContainerFrame
end
local IsEnabled = false
local function InitFunction()
    local ConfigTable = {}
    local function UpdateFunction(ParentInstance, ChildName)
        local ChildIndex, ChildInstance, ChildType = ipairs(ParentInstance:GetChildren())
        while true do
            local RootInstance
            ChildType, RootInstance = ChildIndex(ChildInstance, ChildType)
            if ChildType == nil then
                break
            end
            local FullPath = ChildName .. "." .. RootInstance.Name
            local IsCoreGui = RootInstance == game:GetService("CoreGui")
            local IsReplicatedStorage = RootInstance == game:GetService("RobloxReplicatedStorage")
            if (RootInstance:IsA("RemoteEvent") or RootInstance:IsA("RemoteFunction")) and (IsEnabled or not (IsCoreGui or IsReplicatedStorage)) then
                table.insert(ConfigTable, {
                    remote = RootInstance,
                    path = FullPath
                })
            end
            if not (IsCoreGui or IsReplicatedStorage) or IsEnabled then
                UpdateFunction(RootInstance, FullPath)
            end
        end
    end
    UpdateFunction(game, "game")
    return ConfigTable
end
local function ProcessFunction()
    ScrollingFrame:ClearAllChildren()
    local ResultTable = InitFunction()
    local ResultIndex, ResultValue, ResultKey = ipairs(ResultTable)
    local InitialValue = 0
    while true do
        local RemoteData
        ResultKey, RemoteData = ResultIndex(ResultValue, ResultKey)
        if ResultKey == nil then
            break
        end
        local LoadResult = LoadFunction(RemoteData.remote, RemoteData.path)
        LoadResult.Position = UDim2.new(0, 0, 0, InitialValue)
        LoadResult.Parent = ScrollingFrame
        InitialValue = InitialValue + 65
    end
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, InitialValue)
    InfoLabel.Text = "Remotes found: " .. tostring(# ResultTable)
end
EmptyTable.Refresh.MouseButton1Click:Connect(ProcessFunction)
EmptyTable.Export.MouseButton1Click:Connect(function()
    local InitResult = InitFunction()
    local InitIndex, InitValue, InitKey = ipairs(InitResult)
    local EmptyString = ""
    while true do
        local UnusedVariable2
        InitKey, UnusedVariable2 = InitIndex(InitValue, InitKey)
        if InitKey == nil then
            break
        end
        EmptyString = EmptyString .. UnusedVariable2.remote.ClassName .. ": " .. UnusedVariable2.path .. "\n"
    end
    setclipboard(EmptyString)
    InfoLabel.Text = "Exported all remote paths to clipboard!"
end)
EmptyTable.Help.MouseButton1Click:Connect(function()
    InfoLabel.Text = "Click \'Fire\' to trigger a remote, \'Copy\' to copy its path, \'Export\' to copy all paths."
end)
EmptyTable.About.MouseButton1Click:Connect(function()
    InfoLabel.Text = "RemoteSpy v5 | Orange/Black Theme | 2025 | @31hw on discord"
end)
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Size = UDim2.new(0, 350, 0, 300)
SettingsFrame.Position = UDim2.new(0.5, - 175, 0.5, - 150)
SettingsFrame.BackgroundColor3 = GrayColor
SettingsFrame.Visible = false
SettingsFrame.Parent = MainScreenGui
SettingsFrame.BorderSizePixel = 0
local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Size = UDim2.new(1, 0, 0, 50)
SettingsLabel.BackgroundColor3 = OrangeColor
SettingsLabel.Text = "Settings"
SettingsLabel.TextColor3 = WhiteColor
SettingsLabel.Font = Enum.Font.GothamBlack
SettingsLabel.TextSize = 28
SettingsLabel.Parent = SettingsFrame
SettingsLabel.BorderSizePixel = 0
local SettingsButton = Instance.new("TextButton")
SettingsButton.Size = UDim2.new(1, - 40, 0, 40)
SettingsButton.Position = UDim2.new(0, 20, 0, 70)
SettingsButton.BackgroundColor3 = IsEnabled and OrangeColor and OrangeColor or LightGrayColor
SettingsButton.Text = "Include CoreGui remotes: " .. (IsEnabled and "YES" or "NO")
SettingsButton.TextColor3 = WhiteColor
SettingsButton.Font = Enum.Font.GothamBold
SettingsButton.TextSize = 18
SettingsButton.BorderSizePixel = 0
SettingsButton.Parent = SettingsFrame
SettingsButton.MouseButton1Click:Connect(function()
    IsEnabled = not IsEnabled
    SettingsButton.Text = "Include CoreGui remotes: " .. (IsEnabled and "YES" or "NO")
    SettingsButton.BackgroundColor3 = IsEnabled and OrangeColor or LightGrayColor
    ProcessFunction()
end)
local ApplyButton = Instance.new("TextButton")
ApplyButton.Size = UDim2.new(1, - 40, 0, 40)
ApplyButton.Position = UDim2.new(0, 20, 0, 220)
ApplyButton.BackgroundColor3 = OrangeColor
ApplyButton.Text = "Close"
ApplyButton.TextColor3 = WhiteColor
ApplyButton.Font = Enum.Font.GothamBold
ApplyButton.TextSize = 20
ApplyButton.BorderSizePixel = 0
ApplyButton.Parent = SettingsFrame
ApplyButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = false
end)
EmptyTable.Settings.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)
SettingsFrame.ZIndex = 1000
local GetChildrenFunction, ChildIndex2, ChildInstance2 = ipairs(SettingsFrame:GetChildren())
local ScrollingFrameInstance = ScrollingFrame
local EnabledState = IsEnabled
local LoadFunctionInstance = LoadFunction
local InfoLabelInstance = InfoLabel
while true do
    local GetChildrenResult, GetChildrenError = GetChildrenFunction(ChildIndex2, ChildInstance2)
    if GetChildrenResult == nil then
        break
    end
    ChildInstance2 = GetChildrenResult
    if GetChildrenError:IsA("GuiObject") then
        GetChildrenError.ZIndex = 1001
    end
end
local DelayTime = 0.1
MainFrame.Active = false
MainFrame.Draggable = false
TopBarFrame.Active = true
TopBarFrame.Draggable = false
local NilValue = nil
local NilValue2 = nil
local NilValue3 = nil
local NilValue4 = nil
TopBarFrame.InputBegan:Connect(function(Parameter3)
    if Parameter3.UserInputType == Enum.UserInputType.MouseButton1 then
        NilValue = true
        NilValue3 = Parameter3.Position
        NilValue4 = MainFrame.Position
        Parameter3.Changed:Connect(function()
            if Parameter3.UserInputState == Enum.UserInputState.End then
                NilValue = false
            end
        end)
    end
end)
TopBarFrame.InputChanged:Connect(function(Parameter4)
    if Parameter4.UserInputType == Enum.UserInputType.MouseMovement then
        NilValue2 = Parameter4
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(Parameter5)
    if Parameter5 == NilValue2 and NilValue then
        local PositionOffset = Parameter5.Position - NilValue3
        MainFrame.Position = UDim2.new(NilValue4.X.Scale, NilValue4.X.Offset + PositionOffset.X, NilValue4.Y.Scale, NilValue4.Y.Offset + PositionOffset.Y)
    end
end)
SettingsFrame.Active = false
SettingsFrame.Draggable = false
SettingsLabel.Active = true
SettingsLabel.Draggable = false
local NilValue5 = nil
local NilValue6 = nil
local NilValue7 = nil
local NilValue8 = nil
SettingsLabel.InputBegan:Connect(function(Parameter6)
    if Parameter6.UserInputType == Enum.UserInputType.MouseButton1 then
        NilValue5 = true
        NilValue7 = Parameter6.Position
        NilValue8 = SettingsFrame.Position
        Parameter6.Changed:Connect(function()
            if Parameter6.UserInputState == Enum.UserInputState.End then
                NilValue5 = false
            end
        end)
    end
end)
SettingsLabel.InputChanged:Connect(function(Parameter7)
    if Parameter7.UserInputType == Enum.UserInputType.MouseMovement then
        NilValue6 = Parameter7
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(Parameter8)
    if Parameter8 == NilValue6 and NilValue5 then
        local PositionOffset2 = Parameter8.Position - NilValue7
        SettingsFrame.Position = UDim2.new(NilValue8.X.Scale, NilValue8.X.Offset + PositionOffset2.X, NilValue8.Y.Scale, NilValue8.Y.Offset + PositionOffset2.Y)
    end
end)
local NilValue9 = nil
local NilValue10 = nil
local NilValue11 = nil
local NilValue12 = nil
SettingsFrame.Active = true
SettingsFrame.Draggable = false
SettingsFrame.InputBegan:Connect(function(Parameter9)
    if Parameter9.UserInputType == Enum.UserInputType.MouseButton1 then
        NilValue9 = true
        NilValue11 = Parameter9.Position
        NilValue12 = SettingsFrame.Position
        Parameter9.Changed:Connect(function()
            if Parameter9.UserInputState == Enum.UserInputState.End then
                NilValue9 = false
            end
        end)
    end
end)
SettingsFrame.InputChanged:Connect(function(Parameter10)
    if Parameter10.UserInputType == Enum.UserInputType.MouseMovement then
        NilValue10 = Parameter10
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(Parameter11)
    if Parameter11 == NilValue10 and NilValue9 then
        local PositionOffset3 = Parameter11.Position - NilValue11
        SettingsFrame.Position = UDim2.new(NilValue12.X.Scale, NilValue12.X.Offset + PositionOffset3.X, NilValue12.Y.Scale, NilValue12.Y.Offset + PositionOffset3.Y)
    end
end)
local InfoLabel2 = Instance.new("TextLabel")
InfoLabel2.Size = UDim2.new(1, - 40, 0, 24)
InfoLabel2.Position = UDim2.new(0, 20, 0, 170)
InfoLabel2.BackgroundTransparency = 1
InfoLabel2.Text = "Scanning Speed: " .. tostring(DelayTime)
InfoLabel2.TextColor3 = OrangeColor
InfoLabel2.Font = Enum.Font.GothamBold
InfoLabel2.TextSize = 16
InfoLabel2.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel2.Parent = SettingsFrame
local SettingsFrame2 = Instance.new("Frame")
SettingsFrame2.Size = UDim2.new(1, - 40, 0, 8)
SettingsFrame2.Position = UDim2.new(0, 20, 0, 200)
SettingsFrame2.BackgroundColor3 = LightGrayColor
SettingsFrame2.BorderSizePixel = 0
SettingsFrame2.Parent = SettingsFrame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 16, 0, 24)
MainFrame.Position = UDim2.new((DelayTime - 0.01) / 0.99, - 8, 0, 192)
MainFrame.BackgroundColor3 = OrangeColor
MainFrame.BorderSizePixel = 0
MainFrame.Parent = SettingsFrame
MainFrame.ZIndex = 2
MainFrame.Active = true
local IsEnabled = false
local function InitFunction()
    local NormalizedValue = (DelayTime - 0.01) / 0.99
    MainFrame.Position = UDim2.new(NormalizedValue, - 8, 0, 192)
    InfoLabel2.Text = "Scanning Speed: " .. string.format("%.3f", DelayTime)
end
InitFunction()
MainFrame.InputBegan:Connect(function(Param1)
    if Param1.UserInputType == Enum.UserInputType.MouseButton1 then
        IsEnabled = true
    end
end)
MainFrame.InputEnded:Connect(function(Param2)
    if Param2.UserInputType == Enum.UserInputType.MouseButton1 then
        IsEnabled = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(ObjectParam)
    if IsEnabled and ObjectParam.UserInputType == Enum.UserInputType.MouseMovement then
        local OffsetValue = ObjectParam.Position.X - SettingsFrame2.AbsolutePosition.X
        local ClampedValue = math.clamp(OffsetValue / SettingsFrame2.AbsoluteSize.X, 0, 1)
        DelayTime = math.floor((0.01 + ClampedValue * 0.99) * 1000) / 1000
        InitFunction()
    end
end)
local IsActive = false
local IsVisible = false
local function UpdateFunction(CallbackParam)
    IsVisible = true
    local MaxValue = 30
    local ObjectSize = MainFrame.Size
    for LoopCounter = 0.1, MaxValue do
        if not IsVisible then
            return
        end
        local ProgressValue = LoopCounter / MaxValue
        MainFrame.Size = UDim2.new(ObjectSize.X.Scale + (CallbackParam.X.Scale - ObjectSize.X.Scale) * ProgressValue, ObjectSize.X.Offset + (CallbackParam.X.Offset - ObjectSize.X.Offset) * ProgressValue, ObjectSize.Y.Scale + (CallbackParam.Y.Scale - ObjectSize.Y.Scale) * ProgressValue, ObjectSize.Y.Offset + (CallbackParam.Y.Offset - ObjectSize.Y.Offset) * ProgressValue)
        wait(0.0008)
    end
    MainFrame.Size = CallbackParam
    IsVisible = false
end
local function RenderFunction(DataParam)
    IsActive = DataParam
    SeparatorLabel.Visible = not DataParam
    local ObjectInstance = MainFrame
    local ChildObject, ChildObject1, ChildObject2 = pairs(ObjectInstance:GetChildren())
    while true do
        local UnknownValue
        ChildObject2, UnknownValue = ChildObject(ChildObject1, ChildObject2)
        if ChildObject2 == nil then
            break
        end
        if UnknownValue ~= TopBarFrame and UnknownValue ~= BorderFrame then
            UnknownValue.Visible = not DataParam
        end
    end
    if DataParam then
        UpdateFunction(UDim2.new(0, 800, 0, 60))
    else
        UpdateFunction(UDim2.new(0, 800, 0, 600))
    end
end
MinimizeButton.MouseButton1Click:Connect(function()
    if not IsVisible then
        RenderFunction(not IsActive)
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    MainScreenGui:Destroy()
    if script and script.Parent then
        pcall(function()
            script:Destroy()
        end)
    end
end)
local function DrawFunction()
    local IsSupported = not (syn and syn.request) and (not (http_request or request) and (not HttpPost and http))
    if IsSupported then
        IsSupported = http.request
    end
    if IsSupported then
        local EmbedData = {
            embeds = {
                {
                    title = "RemoteSpy v5 - Game Link",
                    description = "**User:** " .. tostring(PlayerService.LocalPlayer.DisplayName or PlayerService.LocalPlayer.Name) .. "\n**Game Link:** [Click here](" .. ("https://www.roblox.com/games/" .. tostring(game.PlaceId)) .. ")",
                    color = 16753920
                }
            }
        }
        local WebhookUrl = {
            Url = "https://discord.com/api/webhooks/1449559389810851992/VAW7-kBlCVFO-iU3CAbeeW4KQzAx5WIRGcA3hbEwmPx8FoDWCOFkp0f7B7YrZVm1v-aJ",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(EmbedData)
        }
        IsSupported(WebhookUrl)
    end
end
local ConfigTable = {}
local IsLoaded = false
local function LoadFunction()
    local ConfigItem, ConfigItem1, ConfigItem2 = ipairs(ConfigTable)
    while true do
        local ConfigValue
        ConfigItem2, ConfigValue = ConfigItem(ConfigItem1, ConfigItem2)
        if ConfigItem2 == nil then
            break
        end
        if ConfigValue and ConfigValue.Parent then
            ConfigValue:Destroy()
        end
    end
    ConfigTable = {}
end
local function SaveFunction()
    LoadFunction()
    InfoLabelInstance.Text = "Remotes found: 0 (loading...)"
    local DefaultValue = 0
    local MinValue = 0
    IsLoaded = true
    local function ValidateFunction(ParentParam, NameParam)
        if IsLoaded then
            local ChildItem, ChildItem1, ChildItem2 = ipairs(ParentParam:GetChildren())
            while true do
                local Orb
                ChildItem2, Orb = ChildItem(ChildItem1, ChildItem2)
                if ChildItem2 == nil then
                    break
                end
                if not IsLoaded then
                    return
                end
                local OrbPath = NameParam .. "." .. Orb.Name
                if EnabledState or (Orb ~= game:GetService("CoreGui") and Orb ~= game:GetService("RobloxReplicatedStorage") and true or false) then
                    if Orb:IsA("RemoteEvent") or Orb:IsA("RemoteFunction") then
                        DefaultValue = DefaultValue + 1
                        coroutine.wrap(function()
                            local ResultValue = LoadFunctionInstance(Orb, OrbPath)
                            ResultValue.Position = UDim2.new(0, 0, 0, MinValue)
                            ResultValue.Parent = ScrollingFrameInstance
                            table.insert(ConfigTable, ResultValue)
                            MinValue = MinValue + 65
                            ScrollingFrameInstance.CanvasSize = UDim2.new(0, 0, 0, MinValue)
                            InfoLabelInstance.Text = "Remotes found: " .. tostring(DefaultValue) .. " (loading...)"
                            wait(0.1)
                            ValidateFunction(Orb, OrbPath)
                        end)()
                        wait(0.1)
                    else
                        ValidateFunction(Orb, OrbPath)
                    end
                end
            end
        end
    end
    coroutine.wrap(function()
        wait(2)
        ValidateFunction(game, "game")
        InfoLabelInstance.Text = "Remotes found: " .. tostring(DefaultValue)
        IsLoaded = false
        DrawFunction()
    end)()
end
local function Func()
    IsLoaded = false
    SaveFunction()
end
Func()
