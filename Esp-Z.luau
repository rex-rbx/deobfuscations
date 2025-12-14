local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local EspGui = PlayerGui:FindFirstChild("ESP_GUI")
if EspGui then
    EspGui:Destroy()
    local PlayerIterator, PlayerTable, PlayerKey = pairs(game.Players:GetPlayers())
    while true do
        local TargetPlayer
        PlayerKey, TargetPlayer = PlayerIterator(PlayerTable, PlayerKey)
        if PlayerKey == nil then
            break
        end
        if TargetPlayer ~= LocalPlayer and TargetPlayer.Character then
            local HighlightObject = TargetPlayer.Character:FindFirstChildOfClass("Highlight")
            if HighlightObject then
                HighlightObject:Destroy()
            end
            local HeadObject = TargetPlayer.Character:FindFirstChild("Head")
            if HeadObject then
                local NameTagObject = HeadObject:FindFirstChild("ESP_NameTag")
                if NameTagObject then
                    NameTagObject:Destroy()
                end
            end
        end
    end
end
local ScreenGuiInstance = Instance.new("ScreenGui")
ScreenGuiInstance.Name = "ESP_GUI"
ScreenGuiInstance.Parent = PlayerGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 300)
MainFrame.Position = UDim2.new(0.5, - 175, 0.5, - 192)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGuiInstance
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.Text = "Shlerpy\'s ESP"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 20
TitleLabel.Parent = MainFrame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleLabel
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, - 40, 0, 3)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = MainFrame
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton
local ButtonInstance = Instance.new("TextButton")
ButtonInstance.Size = UDim2.new(1, - 20, 0, 45)
ButtonInstance.Position = UDim2.new(0, 10, 0, 50)
ButtonInstance.Text = "Enable ESP"
ButtonInstance.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ButtonInstance.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonInstance.Font = Enum.Font.Gotham
ButtonInstance.TextSize = 16
ButtonInstance.Parent = MainFrame
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ButtonInstance
local ButtonInstance1 = Instance.new("TextButton")
ButtonInstance1.Size = UDim2.new(1, - 20, 0, 45)
ButtonInstance1.Position = UDim2.new(0, 10, 0, 105)
ButtonInstance1.Text = "Rainbow ESP: ON"
ButtonInstance1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ButtonInstance1.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonInstance1.Font = Enum.Font.Gotham
ButtonInstance1.TextSize = 16
ButtonInstance1.Parent = MainFrame
local ButtonCorner1 = Instance.new("UICorner")
ButtonCorner1.CornerRadius = UDim.new(0, 8)
ButtonCorner1.Parent = ButtonInstance1
local ButtonInstance2 = Instance.new("TextButton")
ButtonInstance2.Size = UDim2.new(1, - 20, 0, 45)
ButtonInstance2.Position = UDim2.new(0, 10, 0, 160)
ButtonInstance2.Text = "Distance: OFF"
ButtonInstance2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ButtonInstance2.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonInstance2.Font = Enum.Font.Gotham
ButtonInstance2.TextSize = 16
ButtonInstance2.Parent = MainFrame
local ButtonCorner2 = Instance.new("UICorner")
ButtonCorner2.CornerRadius = UDim.new(0, 8)
ButtonCorner2.Parent = ButtonInstance2
local LabelInstance = Instance.new("TextLabel")
LabelInstance.Size = UDim2.new(1, - 20, 0, 20)
LabelInstance.Position = UDim2.new(0, 10, 0, 215)
LabelInstance.BackgroundTransparency = 1
LabelInstance.Text = "FOV: 70"
LabelInstance.TextColor3 = Color3.fromRGB(255, 255, 255)
LabelInstance.Font = Enum.Font.GothamBold
LabelInstance.TextSize = 14
LabelInstance.Parent = MainFrame
local FrameInstance = Instance.new("Frame")
FrameInstance.Size = UDim2.new(1, - 20, 0, 50)
FrameInstance.Position = UDim2.new(0, 10, 0, 240)
FrameInstance.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FrameInstance.BorderSizePixel = 0
FrameInstance.Parent = MainFrame
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = FrameInstance
local FrameInstance1 = Instance.new("Frame")
FrameInstance1.Size = UDim2.new(1, - 16, 0, 28)
FrameInstance1.Position = UDim2.new(0, 8, 0, 12)
FrameInstance1.BackgroundTransparency = 1
FrameInstance1.Parent = FrameInstance
local FrameInstance2 = Instance.new("Frame")
FrameInstance2.Size = UDim2.new(1, 0, 0, 6)
FrameInstance2.Position = UDim2.new(0, 0, 0, 11)
FrameInstance2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FrameInstance2.Parent = FrameInstance1
local FrameCorner1 = Instance.new("UICorner")
FrameCorner1.CornerRadius = UDim.new(0, 3)
FrameCorner1.Parent = FrameInstance2
local FrameInstance3 = Instance.new("Frame")
FrameInstance3.Size = UDim2.new(0.33, 0, 1, 0)
FrameInstance3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FrameInstance3.Parent = FrameInstance2
local FrameCorner2 = Instance.new("UICorner")
FrameCorner2.CornerRadius = UDim.new(0, 3)
FrameCorner2.Parent = FrameInstance3
local ButtonInstance3 = Instance.new("TextButton")
ButtonInstance3.Size = UDim2.new(0, 14, 0, 14)
ButtonInstance3.Position = UDim2.new(0.33, - 7, 0, 7)
ButtonInstance3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonInstance3.BorderSizePixel = 0
ButtonInstance3.Text = ""
ButtonInstance3.Parent = FrameInstance1
local ButtonCorner3 = Instance.new("UICorner")
ButtonCorner3.CornerRadius = UDim.new(0, 7)
ButtonCorner3.Parent = ButtonInstance3
local Value1 = 70
local BooleanValue = false
local UserInputService = game:GetService("UserInputService")
local Mouse = LocalPlayer
local MousePosition = LocalPlayer.GetMouse(Mouse)
ButtonInstance3.MouseButton1Down:Connect(function()
    BooleanValue = true
end)
UserInputService.InputEnded:Connect(function(Parameter1, UnusedParameter)
    if Parameter1.UserInputType == Enum.UserInputType.MouseButton1 then
        BooleanValue = false
    end
end)
game:GetService("RunService").RenderStepped:Connect(function()
    if BooleanValue then
        local FrameWidth = FrameInstance2.AbsoluteSize.X
        local FrameXPosition = FrameInstance2.AbsolutePosition.X
        local MouseXPosition = MousePosition.X
        local NormalizedXPosition = math.clamp(MouseXPosition - FrameXPosition, 0, FrameWidth) / FrameWidth
        Value1 = math.floor(40 + NormalizedXPosition * 80)
        LabelInstance.Text = "FOV: " .. Value1
        FrameInstance3.Size = UDim2.new(NormalizedXPosition, 0, 1, 0)
        ButtonInstance3.Position = UDim2.new(NormalizedXPosition, - 7, 0, 7)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.FieldOfView = Value1
        end
    end
end)
local FrameInstance4 = Instance.new("Frame")
FrameInstance4.Size = UDim2.new(0, 260, 0, 60)
FrameInstance4.Position = UDim2.new(1, - 270, 1, - 70)
FrameInstance4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FrameInstance4.Visible = false
FrameInstance4.Parent = ScreenGuiInstance
local FrameCorner3 = Instance.new("UICorner")
FrameCorner3.CornerRadius = UDim.new(0, 10)
FrameCorner3.Parent = FrameInstance4
local LabelInstance1 = Instance.new("TextLabel")
LabelInstance1.Size = UDim2.new(1, 0, 0, 35)
LabelInstance1.BackgroundTransparency = 1
LabelInstance1.TextColor3 = Color3.fromRGB(255, 255, 255)
LabelInstance1.Font = Enum.Font.GothamBold
LabelInstance1.TextSize = 14
LabelInstance1.Text = ""
LabelInstance1.TextScaled = false
LabelInstance1.Parent = FrameInstance4
local FrameInstance5 = Instance.new("Frame")
FrameInstance5.Size = UDim2.new(1, - 10, 0, 3)
FrameInstance5.Position = UDim2.new(0, 5, 1, - 8)
FrameInstance5.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FrameInstance5.Parent = FrameInstance4
local FrameCorner4 = Instance.new("UICorner")
FrameCorner4.CornerRadius = UDim.new(0, 2)
FrameCorner4.Parent = FrameInstance5
local FrameInstance6 = Instance.new("Frame")
FrameInstance6.Size = UDim2.new(0, 0, 1, 0)
FrameInstance6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FrameInstance6.Parent = FrameInstance5
local FrameCorner5 = Instance.new("UICorner")
FrameCorner5.CornerRadius = UDim.new(0, 2)
FrameCorner5.Parent = FrameInstance6
local TableInstance = {}
local IndexValue = 0
local function Function1(Parameter2, Parameter3)
    table.insert(TableInstance, {
        message = Parameter2,
        duration = Parameter3
    })
    if IndexValue == 0 then
        local function Function2()
            if # TableInstance ~= 0 then
                IndexValue = IndexValue + 1
                local TableEntry = table.remove(TableInstance, 1)
                LabelInstance1.Text = TableEntry.message
                FrameInstance4.Visible = true
                FrameInstance4.BackgroundTransparency = 0
                LabelInstance1.TextTransparency = 0
                FrameInstance6.Size = UDim2.new(0, 0, 1, 0)
                local CalculatedValue = - 70 - (IndexValue - 1) * 75
                local UnusedParameter = FrameInstance4.Position
                FrameInstance4.Position = UDim2.new(1, - 270, 1, CalculatedValue)
                local StartTime = tick()
                local RunService = game:GetService("RunService")
                local NilValue = nil
                NilValue = RunService.RenderStepped:Connect(function()
                    local ElapsedTime = tick() - StartTime
                    local NormalizedElapsedTime = math.clamp(ElapsedTime / TableEntry.duration, 0, 1)
                    FrameInstance6.Size = UDim2.new(NormalizedElapsedTime, 0, 1, 0)
                    if TableEntry.duration <= ElapsedTime then
                        NilValue:Disconnect()
                        local StartTime1 = tick()
                        local NilValue1 = nil
                        NilValue1 = RunService.RenderStepped:Connect(function()
                            local ElapsedTime1 = tick() - StartTime1
                            local NormalizedElapsedTime1 = math.clamp(ElapsedTime1 / 0.3, 0, 1)
                            FrameInstance4.BackgroundTransparency = NormalizedElapsedTime1
                            LabelInstance1.TextTransparency = NormalizedElapsedTime1
                            if ElapsedTime1 >= 0.3 then
                                NilValue1:Disconnect()
                                FrameInstance4.Visible = false
                                IndexValue = IndexValue - 1
                                Function2()
                            end
                        end)
                    end
                end)
            else
                IndexValue = 0
            end
        end
        Function2()
    end
end
local UserInputService1 = game:GetService("UserInputService")
local BooleanValue1 = true
UserInputService1.InputBegan:Connect(function(Parameter4, Parameter5)
    if not Parameter5 then
        if Parameter4.KeyCode == Enum.KeyCode.K then
            BooleanValue1 = not BooleanValue1
            MainFrame.Visible = BooleanValue1
            if not BooleanValue1 then
                Function1("Press K to Enable the menu!", 4)
            end
        end
    end
end)
local BooleanValue2 = false
local ColorValue = Color3.fromRGB(255, 255, 255)
local BooleanValue3 = true
local BooleanValue4 = false
local function Function3(PlayerParameter, Parameter6)
    if PlayerParameter.Character then
        local HighlightObject1 = PlayerParameter.Character:FindFirstChildOfClass("Highlight")
        if HighlightObject1 then
            if BooleanValue3 then
                Parameter6 = Color3.fromHSV(0, 0, 1) or Parameter6
            end
            HighlightObject1.FillColor = Parameter6
        else
            local HighlightInstance = Instance.new("Highlight")
            if BooleanValue3 then
                Parameter6 = Color3.fromHSV(0, 0, 1) or Parameter6
            end
            HighlightInstance.FillColor = Parameter6
            HighlightInstance.OutlineColor = Color3.fromRGB(255, 255, 255)
            HighlightInstance.Parent = PlayerParameter.Character
        end
        local HeadObject1 = PlayerParameter.Character:FindFirstChild("Head")
        if HeadObject1 and not HeadObject1:FindFirstChild("ESP_NameTag") then
            local BillboardGuiInstance = Instance.new("BillboardGui")
            BillboardGuiInstance.Name = "ESP_NameTag"
            BillboardGuiInstance.Size = UDim2.new(0, 140, 0, 65)
            BillboardGuiInstance.AlwaysOnTop = true
            BillboardGuiInstance.LightInfluence = 0
            BillboardGuiInstance.MaxDistance = 9999
            BillboardGuiInstance.Parent = HeadObject1
            local FrameInstance7 = Instance.new("Frame")
            FrameInstance7.Size = UDim2.new(1, 0, 1, 0)
            FrameInstance7.BackgroundTransparency = 1
            FrameInstance7.Parent = BillboardGuiInstance
            local LabelInstance2 = Instance.new("TextLabel")
            LabelInstance2.Size = UDim2.new(1, 0, 0.33, 0)
            LabelInstance2.Position = UDim2.new(0, 0, 0, 0)
            LabelInstance2.BackgroundTransparency = 1
            LabelInstance2.Text = PlayerParameter.Name
            LabelInstance2.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelInstance2.Font = Enum.Font.GothamBold
            LabelInstance2.TextSize = 14
            LabelInstance2.TextStrokeTransparency = 0.3
            LabelInstance2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            LabelInstance2.Parent = FrameInstance7
            local LabelInstance3 = Instance.new("TextLabel")
            LabelInstance3.Size = UDim2.new(1, 0, 0.33, 0)
            LabelInstance3.Position = UDim2.new(0, 0, 0.33, 0)
            LabelInstance3.BackgroundTransparency = 1
            LabelInstance3.Text = "HP: --"
            LabelInstance3.TextColor3 = Color3.fromRGB(100, 255, 100)
            LabelInstance3.Font = Enum.Font.GothamBold
            LabelInstance3.TextSize = 12
            LabelInstance3.TextStrokeTransparency = 0.3
            LabelInstance3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            LabelInstance3.Parent = FrameInstance7
            local LabelInstance4 = Instance.new("TextLabel")
            LabelInstance4.Size = UDim2.new(1, 0, 0.34, 0)
            LabelInstance4.Position = UDim2.new(0, 0, 0.66, 0)
            LabelInstance4.BackgroundTransparency = 1
            LabelInstance4.Text = "Distance: --m"
            LabelInstance4.TextColor3 = Color3.fromRGB(150, 200, 255)
            LabelInstance4.Font = Enum.Font.GothamBold
            LabelInstance4.TextSize = 11
            LabelInstance4.TextStrokeTransparency = 0.3
            LabelInstance4.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            LabelInstance4.Parent = FrameInstance7
            local HumanoidInstance = PlayerParameter.Character:FindFirstChildOfClass("Humanoid")
            if HumanoidInstance then
                local NilValue2 = nil
                NilValue2 = game:GetService("RunService").RenderStepped:Connect(function()
                    if HumanoidInstance and HumanoidInstance.Health > 0 then
                        LabelInstance3.Text = "HP: " .. math.floor(HumanoidInstance.Health) .. "/" .. math.floor(HumanoidInstance.MaxHealth)
                        LabelInstance3.TextColor3 = Color3.fromRGB(math.max(0, 255 - HumanoidInstance.Health / HumanoidInstance.MaxHealth * 255), 255 * (HumanoidInstance.Health / HumanoidInstance.MaxHealth), 100)
                        if BooleanValue4 then
                            LabelInstance4.Visible = true
                            if LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and PlayerParameter.Character:FindFirstChild("HumanoidRootPart")) then
                                LabelInstance4.Text = "Distance: " .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - PlayerParameter.Character.HumanoidRootPart.Position).Magnitude) .. "m"
                            end
                        else
                            LabelInstance4.Visible = false
                        end
                    else
                        NilValue2:Disconnect()
                    end
                end)
            end
        end
    end
end
local function Function4(PlayerParameter1)
    if PlayerParameter1.Character then
        local HighlightObject2 = PlayerParameter1.Character:FindFirstChildOfClass("Highlight")
        if HighlightObject2 then
            HighlightObject2:Destroy()
        end
        local HeadObject2 = PlayerParameter1.Character:FindFirstChild("Head")
        local NameTagObject1 = HeadObject2 and HeadObject2:FindFirstChild("ESP_NameTag")
        if NameTagObject1 then
            NameTagObject1:Destroy()
        end
    end
end
local function Function5()
    BooleanValue2 = false
    BooleanValue3 = false
    BooleanValue4 = false
    ButtonInstance1.Text = "Rainbow ESP: OFF"
    ButtonInstance2.Text = "Distance: OFF"
    ButtonInstance.Text = "ESP: OFF"
    local PlayerIterator1, PlayerTable1, PlayerKey1 = pairs(game.Players:GetPlayers())
    while true do
        local UnusedVariable
        PlayerKey1, UnusedVariable = PlayerIterator1(PlayerTable1, PlayerKey1)
        if PlayerKey1 == nil then
            break
        end
        if UnusedVariable ~= LocalPlayer then
            Function4(UnusedVariable)
        end
    end
end
ButtonInstance.MouseButton1Click:Connect(function()
    BooleanValue2 = not BooleanValue2
    ButtonInstance.Text = BooleanValue2 and "ESP: ON" or "ESP: OFF"
    if BooleanValue2 then
        local PlayerIterator2, PlayerIterator, PlayerIterator1 = pairs(game.Players:GetPlayers())
        while true do
            local UnusedVariable
            PlayerIterator1, UnusedVariable = PlayerIterator2(PlayerIterator, PlayerIterator1)
            if PlayerIterator1 == nil then
                break
            end
            if UnusedVariable ~= LocalPlayer then
                Function3(UnusedVariable, BooleanValue3 and Color3.fromHSV(0, 0, 1) or ColorValue)
            end
        end
    else
        Function5()
    end
end)
ButtonInstance1.MouseButton1Click:Connect(function()
    BooleanValue3 = not BooleanValue3
    ButtonInstance1.Text = BooleanValue3 and "Rainbow ESP: ON" or "Rainbow ESP: OFF"
    if BooleanValue3 then
        Function1("Rainbow ESP enabled!", 2)
        game:GetService("RunService").RenderStepped:Connect(function()
            if BooleanValue3 and BooleanValue2 then
                local HueValue = tick() % 5 / 5
                local ColorValue = Color3.fromHSV(HueValue, 1, 1)
                local PlayerIterator2, PlayerIterator3, PlayerIterator4 = pairs(game.Players:GetPlayers())
                while true do
                    local CharacterModel
                    PlayerIterator4, CharacterModel = PlayerIterator2(PlayerIterator3, PlayerIterator4)
                    if PlayerIterator4 == nil then
                        break
                    end
                    if CharacterModel ~= LocalPlayer and CharacterModel.Character then
                        local HighlightObject = CharacterModel.Character:FindFirstChildOfClass("Highlight")
                        if HighlightObject then
                            HighlightObject.FillColor = ColorValue
                        end
                    end
                end
            elseif not BooleanValue3 and BooleanValue2 then
                local PlayerIterator5, PlayerIterator6, PlayerIterator7 = pairs(game.Players:GetPlayers())
                while true do
                    local CharacterModel1
                    PlayerIterator7, CharacterModel1 = PlayerIterator5(PlayerIterator6, PlayerIterator7)
                    if PlayerIterator7 == nil then
                        break
                    end
                    if CharacterModel1 ~= LocalPlayer and CharacterModel1.Character then
                        local HighlightObject1 = CharacterModel1.Character:FindFirstChildOfClass("Highlight")
                        if HighlightObject1 then
                            HighlightObject1.FillColor = Color3.fromRGB(255, 255, 255)
                        end
                    end
                end
            end
        end)
    else
        Function1("Rainbow ESP disabled!", 2)
        if BooleanValue2 then
            local PlayerIterator8, PlayerIterator9, PlayerIterator10 = pairs(game.Players:GetPlayers())
            while true do
                local CharacterModel2
                PlayerIterator10, CharacterModel2 = PlayerIterator8(PlayerIterator9, PlayerIterator10)
                if PlayerIterator10 == nil then
                    break
                end
                if CharacterModel2 ~= LocalPlayer and CharacterModel2.Character then
                    local HighlightObject2 = CharacterModel2.Character:FindFirstChildOfClass("Highlight")
                    if HighlightObject2 then
                        HighlightObject2:Destroy()
                    end
                end
            end
            local PlayerIterator11, PlayerIterator12, PlayerIterator13 = pairs(game.Players:GetPlayers())
            while true do
                local CharacterModel3
                PlayerIterator13, CharacterModel3 = PlayerIterator11(PlayerIterator12, PlayerIterator13)
                if PlayerIterator13 == nil then
                    break
                end
                if CharacterModel3 ~= LocalPlayer and CharacterModel3.Character then
                    Function3(CharacterModel3, Color3.fromRGB(255, 255, 255))
                end
            end
        end
    end
end)
ButtonInstance2.MouseButton1Click:Connect(function()
    BooleanValue4 = not BooleanValue4
    ButtonInstance2.Text = BooleanValue4 and "Distance: ON" or "Distance: OFF"
    local PlayerIterator14, PlayerIterator15, PlayerIterator16 = pairs(game.Players:GetPlayers())
    while true do
        local CharacterModel4
        PlayerIterator16, CharacterModel4 = PlayerIterator14(PlayerIterator15, PlayerIterator16)
        if PlayerIterator16 == nil then
            break
        end
        if CharacterModel4 ~= LocalPlayer and CharacterModel4.Character then
            local HeadObject = CharacterModel4.Character:FindFirstChild("Head")
            if HeadObject then
                local NameTagObject = HeadObject:FindFirstChild("ESP_NameTag")
                if NameTagObject then
                    local FrameObject = NameTagObject:FindFirstChildOfClass("Frame")
                    if FrameObject then
                        local TextLabelObject = FrameObject:FindFirstChild("TextLabel")
                        if TextLabelObject and (TextLabelObject:FindFirstChild("TextLabel") == nil and FrameObject:FindFirstChildWhichIsA("TextLabel", true)) then
                            local ChildIterator, ChildIterator1, ChildIterator2 = pairs(FrameObject:GetChildren())
                            while true do
                                local UnusedVariable1
                                ChildIterator2, UnusedVariable1 = ChildIterator(ChildIterator1, ChildIterator2)
                                if ChildIterator2 == nil then
                                    break
                                end
                                if UnusedVariable1:IsA("TextLabel") and UnusedVariable1.Text:match("Distance") then
                                    UnusedVariable1.Visible = BooleanValue4
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    Function1(BooleanValue4 and "Distance display enabled!" or "Distance display disabled!", 2)
end)
local function LocalFunction(FunctionParameter)
    if FunctionParameter ~= LocalPlayer and BooleanValue2 then
        task.wait(0.5)
        if FunctionParameter.Character then
            Function3(FunctionParameter, ColorValue)
        end
    end
end
game.Players.PlayerAdded:Connect(LocalFunction)
local function LocalFunction1(FunctionParameter1)
    return function()
        if BooleanValue2 then
            task.wait(0.1)
            Function3(FunctionParameter1, ColorValue)
        end
    end
end
local PlayerIterator17, PlayerIterator18, PlayerIterator19 = pairs(game.Players:GetPlayers())
local LocalVariable = Function1
local LocalVariable1 = MainFrame
while true do
    local UnusedVariable2
    PlayerIterator19, UnusedVariable2 = PlayerIterator17(PlayerIterator18, PlayerIterator19)
    if PlayerIterator19 == nil then
        break
    end
    if UnusedVariable2 ~= LocalPlayer then
        UnusedVariable2.CharacterAdded:Connect(LocalFunction1(UnusedVariable2))
    end
end
game.Players.PlayerAdded:Connect(function(FunctionParameter2)
    FunctionParameter2.CharacterAdded:Connect(LocalFunction1(FunctionParameter2))
end)
CloseButton.MouseButton1Click:Connect(function()
    LocalVariable1.Visible = false
    LocalVariable("Press K to Enable the menu!", 2)
end)
