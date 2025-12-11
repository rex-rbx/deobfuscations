local vu1 = game:GetService("MarketplaceService")
local vu2 = game:GetService("Players").LocalPlayer
getgenv().Lib = loadstring([=[local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Settings = {}
local UIReferences = {
    Toggles = {},
    Dropdowns = {}
}

local function LoadSettings()
    local saveFile = "Rdnm.json"
    pcall(function()
        if getgenv and getgenv().SaveFile then
            saveFile = getgenv().SaveFile
        end
    end)
    if not saveFile:match("%.json$") then
        saveFile = saveFile .. ".json"
    end
    if isfile(saveFile) then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile(saveFile))
        end)
        if success and type(result) == "table" then
            Settings = result
            if tostring(game.PlaceId) ~= "13127800756" and (next(Settings) == nil or not Settings[tostring(game.PlaceId)]) then
                Settings[tostring(game.PlaceId)] = {}
            end
        else
            Settings = {}
            if tostring(game.PlaceId) ~= "13127800756" then
                Settings[tostring(game.PlaceId)] = {}
            end
        end
    else
        Settings = {}
        if tostring(game.PlaceId) ~= "13127800756" then
            Settings[tostring(game.PlaceId)] = {}
        end
        pcall(function()
            writefile(saveFile, HttpService:JSONEncode(Settings))
        end)
    end
    for gameId, gameSettings in pairs(Settings) do
        if UIReferences.Toggles[gameId] then
            for name, value in pairs(gameSettings) do
                if UIReferences.Toggles[name] then
                    local toggle = UIReferences.Toggles[name]
                    toggle.Toggled = value
                    toggle.TickCover.Position = value and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7)
                    toggle.TickCover.Size = value and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)
                    toggle.CheckboxOutline.ImageColor3 = value and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
                    toggle.CheckboxTicked.ImageColor3 = value and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
                    if value and toggle.Callback then
                        toggle.Callback(true)
                    end
                end
            end
        end
        if UIReferences.Dropdowns[gameId] then
            for name, value in pairs(gameSettings) do
                if UIReferences.Dropdowns[name] then
                    local dropdown = UIReferences.Dropdowns[name]
                    dropdown.SelectedOption = value
                    dropdown.TitleToggle.Text = name .. " - " .. value
                    if dropdown.Callback then
                        dropdown.Callback(value)
                    end
                end
            end
        end
    end
end
LoadSettings()

local function SaveSettings()
    local saveFile = "Rdnm.json"
    pcall(function()
        if getgenv and getgenv().SaveFile then
            saveFile = getgenv().SaveFile
        end
    end)
    if not saveFile:match("%.json$") then
        saveFile = saveFile .. ".json"
    end
    if not Settings then
        Settings = {}
        if tostring(game.PlaceId) ~= "13127800756" then
            Settings[tostring(game.PlaceId)] = {}
        end
    end
    if tostring(game.PlaceId) ~= "13127800756" then
        pcall(function()
            local settingsToSave = {}
            for gameId, gameSettings in pairs(Settings) do
                if gameId ~= "13127800756" then
                    settingsToSave[gameId] = gameSettings
                end
            end
            writefile(saveFile, HttpService:JSONEncode(settingsToSave))
        end)
    end
end
ContentProvider:PreloadAsync({"rbxassetid://3570695787", "rbxassetid://2708891598", "rbxassetid://4155801252", "rbxassetid://4695575676", "rbxassetid://4155801252"})
Library = {
    LibraryColorTable = {},
    TabCount = 0,
    FirstTab = nil,
    CurrentlyBinding = false,
    RainbowColorValue = 0,
    HueSelectionPosition = 0,
    Theme = {
        MainColor = Color3.fromRGB(255, 75, 75),
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        UIToggleKey = Enum.KeyCode.RightControl,
        TextFont = Enum.Font.SourceSansBold,
        EasingStyle = Enum.EasingStyle.Quart,
        Color = Color3.fromRGB(255, 75, 75),      
        TextColor = Color3.fromRGB(255, 255, 255) 
    }
}
local selectedColor = Color3.fromRGB(255, 75, 75) 

pcall(function()
    if getgenv and not getgenv().Color then
    Library.Theme.Color = Color3.fromRGB(255, 75, 75)
    elseif getgenv().Color == "rgb" then
        task.spawn(function()
            while true do
                if getgenv().StopRGB then break end
                for i = 0, 1, 0.001 do
                    selectedColor = Color3.fromHSV(i, 1, 1)
                    Library.Theme.Color = selectedColor
                    for _, v in pairs(Library.LibraryColorTable) do
                        if v:IsA("Frame") or v:IsA("ImageButton") or (v:IsA("ImageLabel") and (v.Name == "Border" or v.Name == "BackgroundTab" or v == SectionBorder)) or v == SectionLayout then
                            v.ImageColor3 = Library.Theme.Color
                        end
                    end
                    task.wait(0.0001)
                end
            end
        end)
    else
        local colorMap = {
            blue = Color3.fromRGB(0, 0, 255),
            red = Color3.fromRGB(255, 0, 0),
            green = Color3.fromRGB(0, 255, 0),
            yellow = Color3.fromRGB(255, 255, 0),
            purple = Color3.fromRGB(128, 0, 128),
            pink = Color3.fromRGB(255, 105, 180),
            default = Color3.fromRGB(255, 75, 75),
            cyan = Color3.fromRGB(0, 255, 255),
            brown = Color3.fromRGB(139, 69, 19),
            orange = Color3.fromRGB(255, 165, 0),
            black = Color3.fromRGB(0, 0, 0),
            white = Color3.fromRGB(255, 255, 255)
        }
        local colorKey = string.lower(getgenv().Color)
        selectedColor = colorMap[colorKey] or colorMap.default
        Library.Theme.Color = selectedColor
    end
end)
local function UpdateTextColors()
    for _, v in pairs(Library.LibraryColorTable) do
        if typeof(v) == "Instance" then
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                v.TextColor3 = Library.Theme.TextColor
            elseif v:IsA("ImageLabel") and (v.Name == "CheckboxTicked" or v.Name == "CheckboxOutline") then
                v.ImageColor3 = Library.Theme.TextColor
            elseif v:IsA("TextLabel") and (v.Name == "Title" or v.Name == "TitleTab" or v.Name == "SectionTitle") then
                v.TextColor3 = Library.Theme.TextColor
            end
        end
    end
end
local selectedTextColor = Color3.fromRGB(255, 255, 255)
pcall(function()
    if getgenv().TextColor == "rgb" then
        task.spawn(function()
            while true do
                if getgenv().StopRGB then break end
                for i = 0, 1, 0.002 do
                    Library.Theme.TextColor = Color3.fromHSV(i, 1, 1)
                    for _, v in pairs(Library.LibraryColorTable) do
                        if v:IsA("TextLabel") or v:IsA("TextButton") then
                            v.TextColor3 = Library.Theme.TextColor
                        elseif v:IsA("ImageLabel") and v.Name == "CheckboxTicked" then
                            v.ImageColor3 = Library.Theme.TextColor
                        elseif v:IsA("ImageLabel") and v.Name == "CheckboxOutline" then
                            v.ImageColor3 = Library.Theme.TextColor
                        elseif v:IsA("TextLabel") and (v.Name == "Title" or v.Name == "TitleTab" or v.Name == "SectionTitle") then
                            v.TextColor3 = Library.Theme.TextColor
                        end
                    end
                    task.wait(0.01)
                end
            end
        end)
    else
        local colorMap = {
            blue = Color3.fromRGB(0, 0, 255),
            red = Color3.fromRGB(255, 0, 0),
            green = Color3.fromRGB(0, 255, 0),
            yellow = Color3.fromRGB(255, 255, 0),
            purple = Color3.fromRGB(128, 0, 128),
            pink = Color3.fromRGB(255, 105, 180),
            default = Color3.fromRGB(255, 255, 255),
            cyan = Color3.fromRGB(0, 255, 255),
            brown = Color3.fromRGB(139, 69, 19),
            orange = Color3.fromRGB(255, 165, 0),
            black = Color3.fromRGB(0, 0, 0),
            white = Color3.fromRGB(255, 255, 255)
        }
        local colorKey = string.lower(tostring(getgenv().TextColor))
        Library.Theme.TextColor = colorMap[colorKey] or Color3.fromRGB(255, 255, 255)
        UpdateTextColors()
    end
end)
pcall(function()
    if getgenv().font then
        local fontMap = {
            bold = Enum.Font.SourceSansBold,
            regular = Enum.Font.SourceSans,
            italic = Enum.Font.SourceSansItalic,
            light = Enum.Font.SourceSansLight,
            semibold = Enum.Font.SourceSansSemibold,
            arial = Enum.Font.Arial,
            arialbold = Enum.Font.ArialBold,
            legacy = Enum.Font.Legacy,
            cartosil = Enum.Font.Cartosil,
            specialelite = Enum.Font.SpecialElite
        }
        local fontKey = string.lower(getgenv().Font)
        Library.Theme.TextFont = fontMap[fontKey] or Enum.Font.SourceSansBold
    end
end)

Library.Theme.MainColor = selectedColor
local function DarkenObjectColor(object, amount)
    local h, s, v = Color3.toHSV(object)
    v = math.clamp(v - (amount / 255), 0, 1)
    s = math.clamp(s - (amount / 510), 0, 1)
    return Color3.fromHSV(h, s, v)
end

local function SetUIAccent(color)
    for i, v in pairs(Library.LibraryColorTable) do
        if HasProperty(v, "ImageColor3") then
            if v ~= "CheckboxOutline" and v.ImageColor3 ~= Color3.fromRGB(65, 65, 65) then
                v.ImageColor3 = color
            end
        end

        if HasProperty(v, "TextColor3") then
            if v.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
                v.TextColor3 = color
            end
        end
    end
end

local function RippleEffect(object)
    task.spawn(function()
        local Ripple = Instance.new("ImageLabel")

        Ripple.Name = "Ripple"
        Ripple.Parent = object
        Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Ripple.BackgroundTransparency = 1.000
        Ripple.ZIndex = 8
        Ripple.Image = "rbxassetid://2708891598"
        Ripple.ImageTransparency = 0.800
        Ripple.ScaleType = Enum.ScaleType.Fit

        Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        task.wait(0.5)
        TweenService:Create(Ripple, TweenInfo.new(1, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

        task.wait(1)
        Ripple:Destroy()
    end)
end

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
    
    local function Update(input)
        local Delta = input.Position - DragStart
        object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
    end
    
    topbarobject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    topbarobject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
end

local UILibrary = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Border = Instance.new("ImageLabel")
local Topbar = Instance.new("Frame")
local UITabs = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local TabButtons = Instance.new("ImageLabel")
local TabButtonLayout = Instance.new("UIListLayout")

UILibrary.Name = "Rndm."
UILibrary.Parent = CoreGui
UILibrary.DisplayOrder = 1
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Global

Main.Name = "Main"
Main.Parent = UILibrary
Main.BackgroundColor3 = Library.Theme.BackgroundColor
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(0.5, -225, 0.5, -125)
Main.Size = UDim2.new(0, 450, 0, 0)
Main.ZIndex = 2
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Library.Theme.BackgroundColor
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.050
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main
Border.Name = "Border"
Border.Parent = Main
Border.BackgroundColor3 = Library.Theme.MainColor
Border.BackgroundTransparency = 1.000
Border.Position = UDim2.new(0, -1, 0, -1)
Border.Size = UDim2.new(1, 2, 1, 2)
Border.Image = "rbxassetid://3570695787"
Border.ImageColor3 = Library.Theme.MainColor
Border.ScaleType = Enum.ScaleType.Slice
Border.SliceCenter = Rect.new(95, 95, 95, 95)
Border.SliceScale = 0.050
Border.ImageTransparency = 0

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.Size = UDim2.new(0, 450, 0, 15)
Topbar.ZIndex = 2

UITabs.Name = "UITabs"
UITabs.Parent = Main
UITabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UITabs.BackgroundTransparency = 1.000
UITabs.ClipsDescendants = true
UITabs.Size = UDim2.new(1, 0, 1, 0)

Tabs.Name = "Tabs"
Tabs.Parent = UITabs
Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tabs.BackgroundTransparency = 1.000
Tabs.Position = UDim2.new(0, 13, 0, 41)
Tabs.Size = UDim2.new(0, 421, 0, 209)
Tabs.ZIndex = 2

TabButtons.Name = "TabButtons"
TabButtons.Parent = UITabs
TabButtons.BackgroundColor3 = Library.Theme.MainColor
TabButtons.BackgroundTransparency = 1.000
TabButtons.Position = UDim2.new(0, 14, 0, 16)
TabButtons.Size = UDim2.new(0, 419, 0, 25)
TabButtons.ZIndex = 2
TabButtons.Image = "rbxassetid://3570695787"
TabButtons.ImageColor3 = Library.Theme.MainColor
TabButtons.ScaleType = Enum.ScaleType.Slice
TabButtons.SliceCenter = Rect.new(100, 100, 100, 100)
TabButtons.SliceScale = 0.050
TabButtons.ClipsDescendants = true

TabButtonLayout.Name = "TabButtonLayout"
TabButtonLayout.Parent = TabButtons
TabButtonLayout.FillDirection = Enum.FillDirection.Horizontal
TabButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
local TabScrollingFrame = Instance.new("ScrollingFrame")
TabScrollingFrame.Name = "TabScrollingFrame"
TabScrollingFrame.Parent = TabButtons
TabScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
TabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
TabScrollingFrame.BackgroundTransparency = 1
TabScrollingFrame.ScrollBarThickness = 5
TabScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
TabScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
TabScrollingFrame.ClipsDescendants = true
TabButtonLayout.Parent = TabScrollingFrame

TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 250)}):Play()
TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

table.insert(Library.LibraryColorTable, Border)
table.insert(Library.LibraryColorTable, TabButtons)
MakeDraggable(Topbar, Main)


local TweenService = game:GetService("TweenService")

local MinimizeBtn = Instance.new("ImageButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = Topbar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -25, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 15, 0, 15)
MinimizeBtn.ZIndex = 10
MinimizeBtn.Image = "rbxassetid://3570695787"
MinimizeBtn.ImageColor3 = Library.Theme.MainColor
MinimizeBtn.ScaleType = Enum.ScaleType.Slice
MinimizeBtn.SliceCenter = Rect.new(100, 100, 100, 100)
MinimizeBtn.SliceScale = 0.050

local MinIcon = Instance.new("TextLabel")
MinIcon.Name = "MinIcon"
MinIcon.Parent = MinimizeBtn
MinIcon.BackgroundTransparency = 1
MinIcon.Size = UDim2.new(1, 0, 1, 0)
MinIcon.ZIndex = 11
MinIcon.Font = Library.Theme.TextFont
MinIcon.Text = "-"
MinIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MinIcon.TextSize = 16

local FloatingIcon = Instance.new("ImageButton")
FloatingIcon.Name = "FloatingIcon"
FloatingIcon.Parent = UILibrary
FloatingIcon.BackgroundTransparency = 1
FloatingIcon.Position = UDim2.new(0, 100, 0, 100)
FloatingIcon.Size = UDim2.new(0, 40, 0, 40)
FloatingIcon.Visible = false
FloatingIcon.ZIndex = 50
FloatingIcon.Image = "rbxassetid://3570695787"
FloatingIcon.ImageColor3 = Library.Theme.MainColor
FloatingIcon.ScaleType = Enum.ScaleType.Slice
FloatingIcon.SliceCenter = Rect.new(100, 100, 100, 100)
FloatingIcon.SliceScale = 0.050

local FloatingText = Instance.new("TextLabel")
FloatingText.Name = "FloatingText"
FloatingText.Parent = FloatingIcon
FloatingText.BackgroundTransparency = 1
FloatingText.Size = UDim2.new(1, 0, 1, 0)
FloatingText.ZIndex = 51
FloatingText.Font = Library.Theme.TextFont
FloatingText.Text = "W"
FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingText.TextSize = 20
local function AutoContrast()
    local color = string.lower(tostring(getgenv().Color))
    if color == "white" then
        FloatingText.TextColor3 = Color3.fromRGB(0, 0, 0)
    elseif color == "black" then
        FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255) 
    else
        FloatingText.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

AutoContrast()
if not Library.LibraryColorTable then
    Library.LibraryColorTable = {}
end

table.insert(Library.LibraryColorTable, MinimizeBtn)
table.insert(Library.LibraryColorTable, FloatingIcon)

local Minimized = false
local isDragging = false
local lastValidPosition = UDim2.new(0, 100, 0, 100)
local originalMainSize

local function MaximizeUI()
    local floatingIconTween = TweenService:Create(FloatingIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0)
    })
    floatingIconTween:Play()
    
    if Main then 
        Main.Visible = true
        Main.Size = UDim2.new(0, 50, 0, 50)
        Main.Transparency = 1
        
        local mainTween = TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = originalMainSize or UDim2.new(0.5, 0, 0.5, 0),
            Position = lastValidPosition,
            Transparency = 0
        })
        mainTween:Play()
        
        
        if not Main:FindFirstChildOfClass("UICorner") then
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0.1, 0)  
            corner.Parent = Main
        end
    end
    
    
    if Border then 
        Border.Visible = false
    end
    
    task.delay(0.3, function()
        FloatingIcon.Visible = false
        FloatingIcon.Size = UDim2.new(0, 40, 0, 40)
    end)
    
    Minimized = false
end

local function MinimizeUI()
    if Main and Main.AbsolutePosition then
        lastValidPosition = UDim2.new(0, Main.AbsolutePosition.X, 0, Main.AbsolutePosition.Y)
        
        if not originalMainSize then
            originalMainSize = Main.Size
        end
    end
    
    if Main then 
        local mainTween = TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 50, 0, 50),
            Position = lastValidPosition,
            Transparency = 1
        })
        mainTween:Play()
        
        
        if not Main:FindFirstChildOfClass("UICorner") then
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0.1, 0)  
            corner.Parent = Main
        end
    end
    
    
    if Border then 
        Border.Visible = false 
    end
    
    FloatingIcon.Position = lastValidPosition
    local floatingIconTween = TweenService:Create(FloatingIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 40, 0, 40)
    })
    floatingIconTween:Play()
    
    task.delay(0.3, function()
        if Main then Main.Visible = false end
        FloatingIcon.Visible = true
    end)
    
    Minimized = true
end




MinimizeBtn.MouseButton1Click:Connect(function()
    if not Minimized then
        MinimizeUI()
    end
end)

local function MakeDraggableWithTracking(gui)
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        gui.Position = newPosition
        lastValidPosition = newPosition
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            isDragging = true

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    isDragging = false
                    
                    if (input.Position - dragStart).Magnitude < 5 then
                        MaximizeUI()
                    end
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

MakeDraggableWithTracking(FloatingIcon)

local function CloseAllTabs()
    for i, v in pairs(Tabs:GetChildren()) do
        if v:IsA("Frame") then
            v.Visible = false
        end
    end
end

local function ResetAllTabButtons()
    for i, v in pairs(TabScrollingFrame:GetChildren()) do
        if v:IsA("ImageButton") then
            TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
        end
    end
end

local function KeepFirstTabOpen()
    for i, v in pairs(Tabs:GetChildren()) do
        if v:IsA("Frame") then
            if v.Name == (Library.FirstTab .. "Tab") then
                v.Visible = true
            else
                v.Visible = false
            end
        end

        for i, v in pairs(TabScrollingFrame:GetChildren()) do
            if v:IsA("ImageButton") then
                if v.Name:find(Library.FirstTab .. "TabButton") then
                    TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 15)}):Play()
                else
                    TweenService:Create(v, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                end
            end
        end
    end
end

local function ToggleUI()
    Library.UIOpen = not Library.UIOpen
            
    if Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
        TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    elseif not Library.UIOpen then
        TweenService:Create(Main, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 250)}):Play()
        TweenService:Create(Border, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
    end
end

task.spawn(function()
    while task.wait() do
        Library.RainbowColorValue = Library.RainbowColorValue + 1/255
        Library.HueSelectionPosition = Library.HueSelectionPosition + 1

        if Library.RainbowColorValue >= 1 then
            Library.RainbowColorValue = 0
        end

        if Library.HueSelectionPosition == 105 then
            Library.HueSelectionPosition = 0
        end
    end
end)
function Library:CreateTab(name)
    local NameTab = Instance.new("Frame")
    local NameTabButton = Instance.new("ImageButton")
    local Title = Instance.new("TextLabel")
    local SectionLayout = Instance.new("UIListLayout")
    local SectionPadding = Instance.new("UIPadding")

    local gameId = tostring(game.PlaceId)
    local TabElements = { GameId = gameId }
    Library.TabCount = Library.TabCount + 1

    if Library.TabCount == 1 then
        Library.FirstTab = name
    end

    NameTab.Name = (name .. "Tab")
    NameTab.Parent = Tabs
    NameTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameTab.BackgroundTransparency = 1.000
    NameTab.Size = UDim2.new(1, 0, 1, 0)
    NameTab.ZIndex = 2
    NameTab.ClipsDescendants = true
    NameTab.Position = UDim2.new(-1, 0, 0, 0)

    NameTabButton.Name = (name .. "TabButton")
    NameTabButton.Parent = TabScrollingFrame
    NameTabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameTabButton.BackgroundTransparency = 1.000
    NameTabButton.Size = UDim2.new(0, 84, 0, 25)
    NameTabButton.ZIndex = 2
    NameTabButton.Image = "rbxassetid://3570695787"
    NameTabButton.ImageColor3 = Library.Theme.MainColor
    NameTabButton.ScaleType = Enum.ScaleType.Slice
    NameTabButton.SliceCenter = Rect.new(100, 100, 100, 100)
    NameTabButton.SliceScale = 0.050

    Title.Name = "Title"
    Title.Parent = NameTabButton
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.ZIndex = 2
    Title.Font = Library.Theme.TextFont
    Title.Text = name
    Title.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, Title) 
    Title.TextSize = 15.000
    local SectionScrollingFrame = Instance.new("ScrollingFrame")
    SectionScrollingFrame.Name = "SectionScrollingFrame"
    SectionScrollingFrame.Parent = NameTab
    SectionScrollingFrame.BackgroundTransparency = 0
    SectionScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
    SectionScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    SectionScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    SectionScrollingFrame.ScrollBarThickness = 10
    SectionScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
    SectionScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
    SectionScrollingFrame.ClipsDescendants = true
    SectionLayout.Name = "SectionLayout"
    SectionLayout.Parent = SectionScrollingFrame
    SectionLayout.FillDirection = Enum.FillDirection.Horizontal
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 25)

    SectionPadding.Name = "SectionPadding"
    SectionPadding.Parent = SectionScrollingFrame
    SectionPadding.PaddingTop = UDim.new(0, 12)

    NameTab.Visible = false

    table.insert(Library.LibraryColorTable, NameTabButton)

    local originalSize = NameTabButton.Size
    local smallSize = UDim2.new(0, 74, 0, 20)

NameTabButton.MouseButton1Down:Connect(function()
    if CloseAllTabs and type(CloseAllTabs) == "function" then 
        CloseAllTabs() 
    else
        for _, v in pairs(Tabs:GetChildren()) do
            if v:IsA("Frame") then 
                v.Visible = false 
                v.Position = UDim2.new(0, 0, 0, 0)
            end
        end
    end
    
    if ResetAllTabButtons and type(ResetAllTabButtons) == "function" then 
        ResetAllTabButtons() 
    else
        for _, v in pairs(TabButtons:GetChildren()) do
            if v:IsA("ImageButton") then
                TweenService:Create(v, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                    ImageColor3 = Library.Theme.MainColor
                }):Play()
            end
        end
    end
    
    NameTab.Visible = true
    
    for _, child in pairs(NameTab:GetChildren()) do
        if child:IsA("ImageLabel") and child.Name:match("Section$") then
            child.ImageTransparency = 1
            child.ImageColor3 = Library.Theme.MainColor
            
            TweenService:Create(child, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                ImageTransparency = 0,
                ImageColor3 = Library.Theme.BackgroundColor
            }):Play()
        end
    end
    
    TweenService:Create(NameTabButton, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
        ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 20),
        Size = smallSize
    }):Play()
    table.insert(Library.LibraryColorTable, NameTabButton)
    TweenService:Create(NameTab, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
end)

    ResetAllTabButtons = function()
    for _, v in pairs(TabScrollingFrame:GetChildren()) do
        if v:IsA("ImageButton") then
            TweenService:Create(v, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                ImageColor3 = Library.Theme.MainColor,
                Size = originalSize
            }):Play()
        end
    end
end

local function ShowFirstTab()
    if NameTab.Name == (Library.FirstTab .. "Tab") then
        NameTab.Visible = true
        TweenService:Create(NameTabButton, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
            ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 20),
            Size = smallSize
        }):Play()
        
        TweenService:Create(NameTab, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
    end
end

    task.wait(0.1)
ShowFirstTab()
task.wait(0.1)  
if NameTab.Name == (Library.FirstTab .. "Tab") then
    for _, child in pairs(NameTab:GetChildren()) do
        if child:IsA("ImageLabel") and child.Name:match("Section$") then
            child.ImageTransparency = 1
            child.ImageColor3 = Library.Theme.MainColor
            child.Position = UDim2.new(0, 0, -0.5, 0)
            child.Size = UDim2.new(0, 197, 0, 0)
            if child.Name == "SectionBorder" then
                child.Position = UDim2.new(0, 0, 0, 0)
            end
            TweenService:Create(child, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(0, 197, 0, 181),
                ImageTransparency = 0,
                ImageColor3 = Library.Theme.BackgroundColor
            }):Play()
        end
    end
end

  

function TabElements:CreateSection(name)
    local NameSection = Instance.new("ImageLabel")
    local SectionBorder = Instance.new("ImageLabel")
    local SectionTitle = Instance.new("TextLabel")
    local SectionContent = Instance.new("ScrollingFrame")
    local SectionContentLayout = Instance.new("UIListLayout")

    local SectionElements = { GameId = self.GameId }

    NameSection.Name = (name .. "Section")
    NameSection.Parent = SectionScrollingFrame
    NameSection.BackgroundColor3 = Library.Theme.BackgroundColor
    NameSection.BackgroundTransparency = 1.000
    NameSection.Position = UDim2.new(0, 0, 0.0574162677, 0)
    NameSection.Size = UDim2.new(0, 197, 0, 181)
    NameSection.ZIndex = 4
    NameSection.Image = "rbxassetid://3570695787"
    NameSection.ImageColor3 = Library.Theme.MainColor
    table.insert(Library.LibraryColorTable, NameSection)
    NameSection.ScaleType = Enum.ScaleType.Slice
    NameSection.SliceCenter = Rect.new(100, 100, 100, 100)
    NameSection.SliceScale = 0.025
    NameSection.ImageTransparency = 1

    SectionBorder.Name = "SectionBorder"
    SectionBorder.Parent = NameSection
    SectionBorder.BackgroundColor3 = Library.Theme.MainColor
    SectionBorder.BackgroundTransparency = 1.000
    SectionBorder.Position = UDim2.new(0, -1, 0, -1)
    SectionBorder.Size = UDim2.new(1, 2, 1, 2)
    SectionBorder.ZIndex = 3
    SectionBorder.Image = "rbxassetid://3570695787"
    SectionBorder.ImageColor3 = Library.Theme.MainColor
    table.insert(Library.LibraryColorTable, SectionBorder)
    SectionBorder.ScaleType = Enum.ScaleType.Slice
    SectionBorder.SliceCenter = Rect.new(100, 100, 100, 100)
    SectionBorder.SliceScale = 0.050
    
    SectionTitle.Name = "SectionTitle"
    SectionTitle.Parent = NameSection
    SectionTitle.BackgroundColor3 = Library.Theme.BackgroundColor
    SectionTitle.BorderSizePixel = 0
    SectionTitle.Text = name
    SectionTitle.Position = UDim2.new(0.5, (-SectionTitle.TextBounds.X - 5) / 2, 0, -12)
    SectionTitle.Size = UDim2.new(0, SectionTitle.TextBounds.X + 20, 0, 22)
    SectionTitle.ZIndex = 4
    SectionTitle.Font = Library.Theme.TextFont
    SectionTitle.TextColor3 = Library.Theme.TextColor
    table.insert(Library.LibraryColorTable, SectionTitle)
    SectionTitle.TextSize = 14.000
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 10)
    titleCorner.Parent = SectionTitle
    
    local isDetached = false
    local lastValidPosition = NameSection.Position
    local originalParent = NameSection.Parent
    local minimized = false
    
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://3570695787"
    Shadow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.ImageTransparency = 0.7
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(100, 100, 100, 100)
    Shadow.SliceScale = 0.025
    Shadow.Size = UDim2.new(0, 197, 0, 181)
    Shadow.ZIndex = 3
    Shadow.Visible = false
    Shadow.Parent = UITabs
    
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.Parent = NameSection
    MinimizeBtn.BackgroundTransparency = 1
    MinimizeBtn.Position = UDim2.new(1, -25, 0, 5)
    MinimizeBtn.Size = UDim2.new(0, 20, 0, 20)
    MinimizeBtn.ZIndex = 5
    MinimizeBtn.Font = Library.Theme.TextFont
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Library.Theme.TextColor
    MinimizeBtn.TextSize = 16
    MinimizeBtn.Visible = false
    
local function MakeSectionDraggable()
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    local holdStartTime
    local isHolding = false

    local function update(input)
        if dragging and NameSection then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            NameSection.Position = newPos
            
            if isDetached then
                local nearestTab = nil
                local minDistance = math.huge
                for _, tab in pairs(Tabs:GetChildren()) do
                    if tab:IsA("Frame") and tab.Visible then
                        local tabPos = tab.AbsolutePosition
                        local sectionPos = NameSection.AbsolutePosition
                        local distance = math.sqrt((sectionPos.X - tabPos.X)^2 + (sectionPos.Y - tabPos.Y)^2)
                        if distance < minDistance then
                            minDistance = distance
                            nearestTab = tab
                        end
                    end
                end
                
                if nearestTab and NameSection then
                    local tabPos = nearestTab.AbsolutePosition
                    local distance = minDistance
                    local minAttachDistance = 75
                    
                    if distance < minAttachDistance then
                        local relativeX = tabPos.X - UILibrary.AbsolutePosition.X
                        local relativeY = tabPos.Y - UILibrary.AbsolutePosition.Y
                        Shadow.Position = UDim2.new(0, relativeX, 0, relativeY)
                        Shadow.Visible = true
                    else
                        Shadow.Visible = false
                    end
                else
                    Shadow.Visible = false
                end
            end
        end
    end

    SectionTitle.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and NameSection then
            dragging = true
            dragStart = input.Position
            startPos = NameSection.Position
            holdStartTime = tick()
            isHolding = true
            
            task.spawn(function()
                while isHolding do
                    if tick() - holdStartTime >= 0.5 and not isDetached then
                        lastValidPosition = NameSection.Position
                        isDetached = true
                        MinimizeBtn.Visible = true
                        
                        
                        NameSection.Parent = UILibrary
                        local detachOffsetX = 15
                        local detachOffsetY = -15
                        TweenService:Create(NameSection, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                            ImageColor3 = Color3.fromRGB(50, 50, 50),
                            Position = UDim2.new(
                                startPos.X.Scale,
                                startPos.X.Offset + detachOffsetX,
                                startPos.Y.Scale,
                                startPos.Y.Offset + detachOffsetY
                            )
                        }):Play()
                        
                        
                        TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 187, 0, 171)
                        }):Play()
                        task.wait(0.15)
                        TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 197, 0, 181)
                        }):Play()
                        
                        SectionTitle.Size = UDim2.new(0, NameSection.Size.X.Offset - 20, 0, 22)
                        SectionTitle.Position = UDim2.new(0.5, -SectionTitle.Size.X.Offset / 2, 0, -12)
                        break
                    end
                    task.wait()
                end
            end)
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    isHolding = false
                    if isDetached and NameSection then
                        local nearestTab = nil
                        local minDistance = math.huge
                        for _, tab in pairs(Tabs:GetChildren()) do
                            if tab:IsA("Frame") and tab.Visible then
                                local tabPos = tab.AbsolutePosition
                                local sectionPos = NameSection.AbsolutePosition
                                local distance = math.sqrt((sectionPos.X - tabPos.X)^2 + (sectionPos.Y - tabPos.Y)^2)
                                if distance < minDistance then
                                    minDistance = distance
                                    nearestTab = tab
                                end
                            end
                        end
                        
                        if nearestTab then
                            local tabPos = nearestTab.AbsolutePosition
                            local distance = minDistance
                            local minAttachDistance = 75
                            if distance < minAttachDistance then
                                local hasSectionAtDefault = false
                                for _, child in pairs(nearestTab:GetChildren()) do
                                    if child:IsA("ImageLabel") and child.Name:match("Section$") and
                                       child.Position == UDim2.new(0, 0, 0.0574162677, 0) then
                                        hasSectionAtDefault = true
                                        break
                                    end
                                end
                                
                                if not hasSectionAtDefault then
                                    
                                    local relativeX = tabPos.X - UILibrary.AbsolutePosition.X
                                    local relativeY = tabPos.Y - UILibrary.AbsolutePosition.Y
                                    local targetPos = UDim2.new(0, relativeX, 0, relativeY + 12)
                                    TweenService:Create(NameSection, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.In), {
                                        Position = targetPos,
                                        ImageColor3 = Library.Theme.BackgroundColor
                                    }):Play()
                                    
                                    
                                    TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Size = UDim2.new(0, 207, 0, 191)
                                    }):Play()
                                    task.wait(0.15)
                                    TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Size = UDim2.new(0, 197, 0, 181)
                                    }):Play()
                                    
                                    task.wait(0.3)
                                    NameSection.Parent = nearestTab.SectionScrollingFrame
                                    isDetached = false
                                    MinimizeBtn.Visible = false
                                    SectionTitle.Size = UDim2.new(0, SectionTitle.TextBounds.X + 20, 0, 22)
                                    SectionTitle.Position = UDim2.new(0.5, (-SectionTitle.TextBounds.X - 5) / 2, 0, -12)
                                    NameSection.Position = UDim2.new(0, 0, 0.0574162677, 0)
                                    Shadow.Visible = false
                                    
                                    local layout = nearestTab:FindFirstChild("SectionLayout")
                                    if layout then
                                        layout:ApplyLayout()
                                    end
                                else
                                    
                                    local availableTab = nil
                                    for _, tab in pairs(Tabs:GetChildren()) do
                                        if tab:IsA("Frame") and tab.Visible then
                                            local hasDefaultSection = false
                                            for _, child in pairs(tab:GetChildren()) do
                                                if child:IsA("ImageLabel") and child.Name:match("Section$") and
                                                   child.Position == UDim2.new(0, 0, 0.0574162677, 0) then
                                                    hasDefaultSection = true
                                                    break
                                                end
                                            end
                                            if not hasDefaultSection then
                                                availableTab = tab
                                                break
                                            end
                                        end
                                    end
                                    
                                    if availableTab then
                                        local newTabPos = availableTab.AbsolutePosition
                                        local relativeX = newTabPos.X - UILibrary.AbsolutePosition.X
                                        local relativeY = newTabPos.Y - UILibrary.AbsolutePosition.Y
                                        local targetPos = UDim2.new(0, relativeX, 0, relativeY + 12)
                                        TweenService:Create(NameSection, TweenInfo.new(0.3, Library.Theme.EasingStyle, Enum.EasingDirection.In), {
                                            Position = targetPos,
                                            ImageColor3 = Library.Theme.BackgroundColor
                                        }):Play()
                                        
                                        
                                        TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            Size = UDim2.new(0, 207, 0, 191)
                                        }):Play()
                                        task.wait(0.15)
                                        TweenService:Create(NameSection, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            Size = UDim2.new(0, 197, 0, 181)
                                        }):Play()
                                        
                                        task.wait(0.3)
                                        NameSection.Parent = availableTab
                                        isDetached = false
                                        MinimizeBtn.Visible = false
                                        SectionTitle.Size = UDim2.new(0, SectionTitle.TextBounds.X + 20, 0, 22)
                                        SectionTitle.Position = UDim2.new(0.5, (-SectionTitle.TextBounds.X - 5) / 2, 0, -12)
                                        NameSection.Position = UDim2.new(0, 0, 0.0574162677, 0)
                                        Shadow.Visible = false
                                        
                                        local layout = availableTab:FindFirstChild("SectionLayout")
                                        if layout then
                                            layout:ApplyLayout()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    SectionTitle.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and NameSection then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
    
    local function ToggleMinimize()
        if not isDetached then return end
        
        minimized = not minimized
        if minimized then
            TweenService:Create(NameSection, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 197, 0, 30),
                ImageColor3 = Color3.fromRGB(70, 70, 70)
            }):Play()
            SectionContent.Visible = false
            MinimizeBtn.Text = "⌄"
        else
            TweenService:Create(NameSection, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 197, 0, 181),
                ImageColor3 = Color3.fromRGB(50, 50, 50)
            }):Play()
            SectionContent.Visible = true
            MinimizeBtn.Text = "-"
        end
    end
    
    MinimizeBtn.MouseButton1Click:Connect(ToggleMinimize)
    MakeSectionDraggable()
    
    task.spawn(function()
        task.wait()
        NameSection.Position = UDim2.new(0, 0, -0.5, 0)
        TweenService:Create(NameSection, TweenInfo.new(0.5, Library.Theme.EasingStyle), {
            Position = lastValidPosition,
            ImageTransparency = 0,
            ImageColor3 = Library.Theme.BackgroundColor
        }):Play()
    end)
    
    SectionContent.Name = "SectionContent"
    SectionContent.Parent = NameSection
    SectionContent.Active = true
    SectionContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SectionContent.BackgroundTransparency = 1.000
    SectionContent.BorderColor3 = Color3.fromRGB(27, 42, 53)
    SectionContent.BorderSizePixel = 0
    SectionContent.Size = UDim2.new(1, 0, 1, 0)
    SectionContent.ZIndex = 4
    SectionContent.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    SectionContent.ScrollBarImageColor3 = Color3.fromRGB(85, 85, 85)
    SectionContent.ScrollBarThickness = 4
    SectionContent.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    SectionContentLayout.Name = "SectionContentLayout"
    SectionContentLayout.Parent = SectionContent
    SectionContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    table.insert(Library.LibraryColorTable, SectionBorder)

local updating = false

SectionContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    if not updating then
        updating = true
        task.defer(function()
            SectionContent.CanvasSize = UDim2.new(0, 0, 0, SectionContentLayout.AbsoluteContentSize.Y + 15)
            updating = false
        end)
    end
end)

    task.spawn(function()
        task.wait()
        TweenService:Create(NameSection, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
            ImageTransparency = 0,
            ImageColor3 = Library.Theme.BackgroundColor
        }):Play()
    end)


function SectionElements:CreateLabel(name, text, callback, options)
    local NameLabel = Instance.new("TextLabel")
    local LabelButton = nil

    local opts = options or {}
    local holdColor = opts.holdColor or false

    NameLabel.Name = (name .. "Label")
    NameLabel.Parent = SectionContent
    NameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.BackgroundTransparency = 1.000
    NameLabel.Text = text or ""
    NameLabel.Size = UDim2.new(0, 197, 0, NameLabel.TextBounds.Y)
    NameLabel.ZIndex = 5
    NameLabel.Font = Library.Theme.TextFont
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    table.insert(Library.LibraryColorTable, NameLabel)
    NameLabel.TextSize = 15.000

    local isColorHeld = false

    if callback and type(callback) == "function" then
        LabelButton = Instance.new("TextButton")
        LabelButton.Name = "LabelButton"
        LabelButton.Parent = NameLabel
        LabelButton.BackgroundTransparency = 1.000
        LabelButton.Size = UDim2.new(1, 0, 1, 0)
        LabelButton.Position = UDim2.new(0, 0, 0, 0)
        LabelButton.ZIndex = 6
        LabelButton.Font = Library.Theme.TextFont
        LabelButton.Text = ""
        LabelButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        LabelButton.TextSize = 15.000

        LabelButton.MouseButton1Click:Connect(function()
            callback()
            if holdColor then
                for _, child in pairs(SectionContent:GetChildren()) do
                    if child:IsA("TextLabel") and child ~= NameLabel then
                        TweenService:Create(
                            child,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                            {TextColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                    end
                end
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Library.Theme.MainColor}
                ):Play()
                isColorHeld = true
            end
        end)

        if holdColor then
            LabelButton.MouseEnter:Connect(function()
                if not isColorHeld then
                    TweenService:Create(
                        NameLabel,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                        {TextColor3 = Library.Theme.MainColor}
                    ):Play()
                end
            end)
        else
            LabelButton.MouseEnter:Connect(function()
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Library.Theme.MainColor}
                ):Play()
            end)

            LabelButton.MouseLeave:Connect(function()
                TweenService:Create(
                    NameLabel,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)}
                ):Play()
            end)
        end
    end

    local function ChangeText(newtext)
        NameLabel.Text = newtext
    end

    local function RefreshLabel(newtext)
        TweenService:Create(
            NameLabel,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 1}
        ):Play()

        task.wait(0.3)
        NameLabel.Text = newtext
        TweenService:Create(
            NameLabel,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 0}
        ):Play()
    end

    NameLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
        if NameLabel.Text ~= "" then
            TweenService:Create(
                NameLabel,
                TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 197, 0, NameLabel.TextBounds.Y)}
            ):Play()
        else
            TweenService:Create(
                NameLabel,
                TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 197, 0, 0)}
            ):Play()
        end
    end)

    SectionContent.CanvasSize = UDim2.new(0, 0, 0, SectionContentLayout.AbsoluteContentSize.Y + 15)

    return {
        ChangeText = ChangeText,
        Refresh = RefreshLabel
    }
end

        function SectionElements:CreateButton(name, callback)
            local NameButton = Instance.new("Frame")
            local Button = Instance.new("TextButton")
            local ButtonRounded = Instance.new("ImageLabel")

            NameButton.Name = (name .. "Button")
            NameButton.Parent = SectionContent
            NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameButton.BackgroundTransparency = 1.000
            NameButton.Size = UDim2.new(0, 197, 0, 35)
            NameButton.ZIndex = 5

            Button.Name = "Button"
            Button.Parent = NameButton
            Button.BackgroundColor3 = Library.Theme.MainColor
table.insert(Library.LibraryColorTable, Button)
            Button.BackgroundTransparency = 1.000
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0.454314709, -76, 0.528571427, -12)
            Button.Size = UDim2.new(0, 168, 0, 25)
            Button.ZIndex = 6
            Button.Font = Library.Theme.TextFont
            Button.Text = name
            Button.TextColor3 = Library.Theme.TextColor
            Button.TextSize = 15.000
            Button.ClipsDescendants = true

            ButtonRounded.Name = "ButtonRounded"
            ButtonRounded.Parent = Button
            ButtonRounded.Active = true
            ButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonRounded.BackgroundTransparency = 1.000
            ButtonRounded.Position = UDim2.new(0.5, 0, 0.5, 0)
            ButtonRounded.Selectable = true
            ButtonRounded.Size = UDim2.new(1, 0, 1, 0)
            ButtonRounded.ZIndex = 5
            ButtonRounded.Image = "rbxassetid://3570695787"
            ButtonRounded.ImageColor3 = Library.Theme.MainColor
            ButtonRounded.ScaleType = Enum.ScaleType.Slice
            ButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            ButtonRounded.SliceScale = 0.050

            Button.MouseButton1Down:Connect(function()
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = DarkenObjectColor(Library.Theme.MainColor, 20)}):Play()

                RippleEffect(Button)
                callback(Button)
            end)

            Button.MouseButton1Up:Connect(function()
                TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
            end)

            Button.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageColor3 = Library.Theme.MainColor}):Play()
                end
            end)

            table.insert(Library.LibraryColorTable, ButtonRounded)
        end
function SectionElements:CreateToggle(name, ...)
    local args = {...}
    local presetToggle, callback, tooltipText = nil, nil, nil

    for i, v in ipairs(args) do
        if type(v) == "boolean" then
            presetToggle = v
        elseif type(v) == "function" and not callback then
            callback = v
        elseif type(v) == "string" and not tooltipText then
            tooltipText = v
        end
    end
    callback = callback or function() end

    local NameToggle = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Toggle = Instance.new("TextButton")
    local CheckboxOutline = Instance.new("ImageLabel")
    local CheckboxTicked = Instance.new("ImageLabel")
    local TickCover = Instance.new("Frame")
    local Tooltip

    local gameId = self.GameId or tostring(game.PlaceId)
    if not Settings[gameId] then Settings[gameId] = {} end
    local Toggled = (presetToggle ~= nil and presetToggle) or false
    if Settings[gameId][name] ~= nil then
        Toggled = Settings[gameId][name]
    end

    if not UIReferences then UIReferences = { Toggles = {} } end
    UIReferences.Toggles[name] = {
        Toggled = Toggled,
        TickCover = TickCover,
        CheckboxOutline = CheckboxOutline,
        CheckboxTicked = CheckboxTicked,
        Callback = callback,
        EnabledDuringLoad = true
    }

    NameToggle.Name = (name .. "Toggle")
    NameToggle.Parent = SectionContent or error("SectionContent tidak ditemukan")
    NameToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameToggle.BackgroundTransparency = 1.000
    NameToggle.Size = UDim2.new(0, 197, 0, 35)
    NameToggle.ZIndex = 5

    Title.Name = "Title"
    Title.Parent = NameToggle
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 13, 0, 0)
    Title.Size = UDim2.new(0, 149, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Title.Text = name
    Title.TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)
    if Library and Library.LibraryColorTable then table.insert(Library.LibraryColorTable, Title) end
    if _G.UpdateTextColors then UpdateTextColors() end
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Toggle.Name = "Toggle"
    Toggle.Parent = NameToggle
    Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.BackgroundTransparency = 1.000
    Toggle.Position = UDim2.new(0, 161, 0, 7)
    Toggle.Size = UDim2.new(0, 20, 0, 20)
    Toggle.ZIndex = 5
    Toggle.AutoButtonColor = false
    Toggle.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
    Toggle.Text = ""
    Toggle.TextColor3 = Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14.000

    CheckboxOutline.Name = "CheckboxOutline"
    CheckboxOutline.Parent = Toggle
    CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckboxOutline.BackgroundTransparency = 1.000
    CheckboxOutline.Position = UDim2.new(0.5, -12, 0.5, -12)
    CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
    CheckboxOutline.ZIndex = 5
    CheckboxOutline.Image = "rbxassetid://5416796047"
    CheckboxOutline.ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)

    CheckboxTicked.Name = "CheckboxTicked"
    CheckboxTicked.Parent = Toggle
    CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckboxTicked.BackgroundTransparency = 1.000
    CheckboxTicked.Position = UDim2.new(0.5, -12, 0.5, -12)
    CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
    CheckboxTicked.ZIndex = 6
    CheckboxTicked.Image = "rbxassetid://5416796675"
    CheckboxTicked.ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)
    if Library and Library.LibraryColorTable then table.insert(Library.LibraryColorTable, CheckboxTicked) end

    TickCover.Name = "TickCover"
    TickCover.Parent = Toggle
    TickCover.BackgroundColor3 = Library and Library.Theme and Library.Theme.BackgroundColor or Color3.fromRGB(35, 35, 35)
    TickCover.BorderSizePixel = 0
    TickCover.Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7)
    TickCover.Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)
    TickCover.ZIndex = 7

    if tooltipText then
        Tooltip = Instance.new("TextLabel")
        Tooltip.Name = "Tooltip"
        Tooltip.Parent = NameToggle
        Tooltip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tooltip.Position = UDim2.new(0, 10, 0, -10)
        Tooltip.ZIndex = 10
        Tooltip.Font = Library and Library.Theme and Library.Theme.TextFont or Enum.Font.SourceSansBold
        Tooltip.Text = tooltipText
        Tooltip.TextColor3 = Color3.fromRGB(0, 0, 0)
        Tooltip.TextSize = 14.000
        Tooltip.Visible = false
        Tooltip.ClipsDescendants = true

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Tooltip

        local lineCount = 0
        for _ in tooltipText:gmatch("\n") do
            lineCount = lineCount + 1
        end
        Tooltip.Position = UDim2.new(0, 10, 0, -10 - (lineCount * 20))
        Tooltip.Size = UDim2.new(0, math.min(Tooltip.TextBounds.X + 10, 187), 0, Tooltip.TextBounds.Y + 5)

        Title.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                Tooltip.Visible = true
            elseif input.UserInputType == Enum.UserInputType.MouseMovement then
                Tooltip.Visible = true
            end
        end)

        Title.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                Tooltip.Visible = false
            elseif input.UserInputType == Enum.UserInputType.MouseMovement then
                Tooltip.Visible = false
            end
        end)
    end

    local function safeCallback(state)
        if type(callback) == "function" and UIReferences.Toggles[name].EnabledDuringLoad then
            local success, err = pcall(callback, state)
            if not success then
                warn(err)
            end
        end
    end

    Toggle.MouseButton1Down:Connect(function()
        Toggled = not Toggled
        UIReferences.Toggles[name].EnabledDuringLoad = true
        TweenService:Create(Title, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)}):Play()
        TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7), Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)}):Play()
        TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
        TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
        Settings[gameId][name] = Toggled
        SaveSettings()
        safeCallback(Toggled)
        task.wait()
    end)

    if Library and Library.LibraryColorTable then
        table.insert(Library.LibraryColorTable, CheckboxOutline)
        table.insert(Library.LibraryColorTable, CheckboxTicked)
    end

    if Toggled then
        task.wait(0.1)
    end

    if SectionContent and SectionContentLayout then
        SectionContent.CanvasSize = UDim2.new(0, 0, 0, SectionContentLayout.AbsoluteContentSize.Y + 15)
    end

    task.delay(1, function()
        if UIReferences and UIReferences.Toggles[name] and UIReferences.Toggles[name].Toggled then
            UIReferences.Toggles[name].EnabledDuringLoad = true
            safeCallback(UIReferences.Toggles[name].Toggled)
        end
    end)

    return {
        SetState = function(state)
            Toggled = state
            UIReferences.Toggles[name].EnabledDuringLoad = true
            TweenService:Create(Title, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Toggled and (Library and Library.Theme and Library.Theme.TextColor or Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = Toggled and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, -7, 0.5, -7), Size = Toggled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 14, 0, 14)}):Play()
            TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
            TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Toggled and (Library and Library.Theme and Library.Theme.MainColor or Color3.fromRGB(255, 75, 75)) or Color3.fromRGB(65, 65, 65)}):Play()
            Settings[gameId][name] = state
            SaveSettings()
            safeCallback(state)
            task.wait()
        end
    }
end
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function SectionElements:CreateSlider(name, minimumvalue, maximumvalue, presetvalue, precisevalue, callback)
    local NameSlider = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local SliderBackground = Instance.new("ImageLabel")
    local SliderIndicator = Instance.new("ImageLabel")
    local CircleSelector = Instance.new("ImageLabel")
    local SliderValue = Instance.new("ImageLabel")
    local Value = Instance.new("TextBox")

    local SliderDragging = false
    local StartingValue = presetvalue

    NameSlider.Name = (name .. "Slider")
    NameSlider.Parent = SectionContent
    NameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameSlider.BackgroundTransparency = 1.000
    NameSlider.Position = UDim2.new(0, 0, 0.497237563, 0)
    NameSlider.Size = UDim2.new(0, 197, 0, 50)
    NameSlider.ZIndex = 5

    Title.Name = "Title"
    Title.Parent = NameSlider
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 12, 0, 0)
    Title.Size = UDim2.new(0, 121, 0, 35)
    Title.ZIndex = 5
    Title.Font = Library.Theme.TextFont
    Title.Text = name
    Title.TextColor3 = Library.Theme.TextColor
table.insert(Library.LibraryColorTable, Title)
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    SliderBackground.Name = "SliderBackground"
    SliderBackground.Parent = NameSlider
    SliderBackground.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    SliderBackground.BackgroundTransparency = 1.000
    SliderBackground.Position = UDim2.new(0.0600000359, 0, 0.699999988, 0)
    SliderBackground.Size = UDim2.new(0, 169, 0, 4)
    SliderBackground.ZIndex = 5
    SliderBackground.Image = "rbxassetid://3570695787"
    SliderBackground.ImageColor3 = Color3.fromRGB(55, 55, 55)
    SliderBackground.ScaleType = Enum.ScaleType.Slice
    SliderBackground.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderBackground.SliceScale = 0.150

    SliderIndicator.Name = "SliderIndicator"
    SliderIndicator.Parent = SliderBackground
    SliderIndicator.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    SliderIndicator.BackgroundTransparency = 1.000
    SliderIndicator.Size = UDim2.new(((StartingValue or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)
    SliderIndicator.ZIndex = 5
    SliderIndicator.Image = "rbxassetid://3570695787"
    SliderIndicator.ImageColor3 = Library.Theme.MainColor
    SliderIndicator.ScaleType = Enum.ScaleType.Slice
    SliderIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderIndicator.SliceScale = 0.150

    CircleSelector.Name = "CircleSelector"
    CircleSelector.Parent = SliderIndicator
    CircleSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CircleSelector.BackgroundTransparency = 1.000
    CircleSelector.Position = UDim2.new(0.986565471, -7, 0.75, -7)
    CircleSelector.Size = UDim2.new(0, 12, 0, 12)
    CircleSelector.ZIndex = 5
    CircleSelector.Image = "rbxassetid://3570695787"

    SliderValue.Name = "SliderValue"
    SliderValue.Parent = NameSlider
    SliderValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    SliderValue.BackgroundTransparency = 1.000
    SliderValue.Position = UDim2.new(0.764771521, -12, 0.400000006, -12)
    SliderValue.Size = UDim2.new(0, 42, 0, 19)
    SliderValue.ZIndex = 5
    SliderValue.Image = "rbxassetid://3570695787"
    SliderValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
    SliderValue.ScaleType = Enum.ScaleType.Slice
    SliderValue.SliceCenter = Rect.new(100, 100, 100, 100)
    SliderValue.SliceScale = 0.030

    Value.Name = "Value"
    Value.Parent = SliderValue
    Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Value.BackgroundTransparency = 1.000
    Value.Size = UDim2.new(1, 0, 1, 0)
    Value.ZIndex = 5
    Value.Font = Library.Theme.TextFont
    Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
    Value.TextColor3 = Color3.fromRGB(255, 255, 255)
    Value.TextSize = 14.000

    
    local function enlargeCircle()
        TweenService:Create(CircleSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 18, 0, 18)}):Play()
    end

    
    local function shrinkCircle()
        TweenService:Create(CircleSelector, TweenInfo.new(0.1), {Size = UDim2.new(0, 12, 0, 12)}):Play()
    end


    local function Sliding(input)
        local SliderPosition
        if input.UserInputType == Enum.UserInputType.Touch then
            SliderPosition = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1, 0)
        elseif input.UserInputType == Enum.UserInputType.MouseMovement then
            SliderPosition = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1, 0)
        end

        TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = SliderPosition}):Play()

        local NonSliderPreciseValue = math.floor(((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue)
        local SliderPreciseValue = ((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue

        local SlidingValue = (precisevalue and SliderPreciseValue or NonSliderPreciseValue)
        SlidingValue = tonumber(string.format("%.2f", SlidingValue))

        Value.Text = tostring(SlidingValue)
        callback(SlidingValue)
    end

    CircleSelector.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = true
            enlargeCircle()  
            Sliding(input)   
        end
    end)

    
    CircleSelector.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            SliderDragging = false
            shrinkCircle()   
        end
    end)

    
    UserInputService.InputChanged:Connect(function(input)
        if SliderDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            
            Sliding(input)
        end
    end)

    
    Value.FocusLost:Connect(function()
        if not tonumber(Value.Text) then
            Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
        elseif Value.Text == "" or tonumber(Value.Text) <= minimumvalue then
            Value.Text = minimumvalue
        elseif Value.Text == "" or tonumber(Value.Text) >= maximumvalue then
            Value.Text = maximumvalue
        end

        TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(((tonumber(Value.Text) or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)}):Play()
        callback(tonumber(Value.Text))
    end)

    callback(StartingValue)
end

function SectionElements:CreateTextBox(name, characterLimit, placeholderText, callback)
            local NameTextBox = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local InputBox = Instance.new("TextBox")

            local gameId = self.GameId
            if not Settings[gameId] then Settings[gameId] = {} end
            local SavedText = Settings[gameId][name] or placeholderText or ""

            NameTextBox.Name = name .. "TextBox"
            NameTextBox.Parent = SectionContent
            NameTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameTextBox.BackgroundTransparency = 1.000
            NameTextBox.Size = UDim2.new(1, -10, 0, 50)
            NameTextBox.ZIndex = 5

            Title.Name = "Title"
            Title.Parent = NameTextBox
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 10, 0, 0)
            Title.Size = UDim2.new(1, -24, 0, 20)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            InputBox.Name = "InputBox"
            InputBox.Parent = NameTextBox
            InputBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            InputBox.BackgroundTransparency = 0.100
            InputBox.Position = UDim2.new(0, 10, 0, 20)
            InputBox.Size = UDim2.new(1, -20, 0, 22)
            InputBox.ZIndex = 5
            InputBox.Font = Library.Theme.TextFont
            InputBox.PlaceholderText = placeholderText or "message..."
            InputBox.Text = SavedText
            InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputBox.TextSize = 14.000
            InputBox.TextXAlignment = Enum.TextXAlignment.Left

            InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                if #InputBox.Text > characterLimit then
                    InputBox.Text = InputBox.Text:sub(1, characterLimit)
                end
                if not Settings[gameId] then Settings[gameId] = {} end
                Settings[gameId][name] = InputBox.Text ~= "" and InputBox.Text or placeholderText
                SaveSettings()
                if callback then
                    callback(InputBox.Text ~= "" and InputBox.Text or placeholderText)
                end
            end)

            return NameTextBox, InputBox
        end
function SectionElements:CreateImage(name, imageId, size)
    local ImageHolder = Instance.new("Frame")
    ImageHolder.Name = name .. "_ImageHolder"
    ImageHolder.BackgroundTransparency = 1
    ImageHolder.Size = UDim2.new(1, 0, 0, (size and size.Y and size.Y[2]) or 100)
    ImageHolder.Parent = SectionContent
ImageHolder.ZIndex = 999
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = name .. "_Image"
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0)
    ImageLabel.Position = UDim2.new(0.5, 0, 0, 0)
    ImageLabel.Size = UDim2.new(
        size and size.X and size.X[1] or 0,
        size and size.X and size.X[2] or 100,
        size and size.Y and size.Y[1] or 0,
        size and size.Y and size.Y[2] or 100
    )
    ImageLabel.Image = imageId or ""
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.Parent = ImageHolder
    ImageLabel.ZIndex = 999




    local Element = {
        Type = "Image",
        Holder = ImageHolder,
        Image = ImageLabel,
        Refresh = function(self, newImage)
            self.Image.Image = newImage
        end
    }

    return Element
end
        function SectionElements:CreateColorPicker(name, presetcolor, callback)
            local NameColorPicker = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local ColorPickerToggle = Instance.new("ImageButton")
            local ColorPicker = Instance.new("ImageLabel")
            local Color = Instance.new("ImageLabel")
            local ColorRound = Instance.new("ImageLabel")
            local ColorSelection = Instance.new("ImageLabel")
            local RValue = Instance.new("ImageLabel")
            local ValueR = Instance.new("TextLabel")
            local GValue = Instance.new("ImageLabel")
            local ValueG = Instance.new("TextLabel")
            local BValue = Instance.new("ImageLabel")
            local ValueB = Instance.new("TextLabel")
            local RainbowToggle = Instance.new("Frame")
            local RainbowToggleTitle = Instance.new("TextLabel")
            local Toggle = Instance.new("TextButton")
            local CheckboxOutline = Instance.new("ImageLabel")
            local CheckboxTicked = Instance.new("ImageLabel")
            local TickCover = Instance.new("Frame")
            local Hue = Instance.new("ImageLabel")
            local UIGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")
            
            local ColorPickerToggled = false
            local OldToggleColor = Color3.fromRGB(0, 0, 0)
            local OldColor = Color3.fromRGB(0, 0, 0)
            local OldColorSelectionPosition = nil
            local OldHueSelectionPosition = nil
            local ColorH, ColorS, ColorV = 1, 1, 1
            local RainbowColorPicker = false
            local ColorPickerInput = nil
            local ColorInput = nil
            local HueInput = nil

            NameColorPicker.Name = (name .. "ColorPicker")
            NameColorPicker.Parent = SectionContent
            NameColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameColorPicker.BackgroundTransparency = 1.000
            NameColorPicker.Position = UDim2.new(0, 0, 0.138121545, 0)
            NameColorPicker.Size = UDim2.new(0, 197, 0, 32)
            NameColorPicker.ClipsDescendants = true

            Title.Name = "Title"
            Title.Parent = NameColorPicker
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 0)
            Title.Size = UDim2.new(0, 151, 0, 30)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left
            
            ColorPickerToggle.Name = "ColorPickerToggle"
            ColorPickerToggle.Parent = NameColorPicker
            ColorPickerToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerToggle.BackgroundTransparency = 1.000
            ColorPickerToggle.Position = UDim2.new(0, 139, 0, 5)
            ColorPickerToggle.Size = UDim2.new(0, 42, 0, 20)
            ColorPickerToggle.ZIndex = 5
            ColorPickerToggle.Image = "rbxassetid://3570695787"
            ColorPickerToggle.ImageColor3 = presetcolor
            ColorPickerToggle.ScaleType = Enum.ScaleType.Slice
            ColorPickerToggle.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorPickerToggle.SliceScale = 0.030
            
            ColorPicker.Name = "ColorPicker"
            ColorPicker.Parent = NameColorPicker
            ColorPicker.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ColorPicker.BackgroundTransparency = 1.000
            ColorPicker.ClipsDescendants = true
            ColorPicker.Position = UDim2.new(0.0599999987, 0, 0, 30)
            ColorPicker.Size = UDim2.new(0, 169, 0, 175)
            ColorPicker.ZIndex = 10
            ColorPicker.Image = "rbxassetid://3570695787"
            ColorPicker.ImageColor3 = Color3.fromRGB(45, 45, 45)
            ColorPicker.ScaleType = Enum.ScaleType.Slice
            ColorPicker.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorPicker.SliceScale = 0.070
            ColorPicker.ImageTransparency = 1

            Color.Name = "Color"
            Color.Parent = ColorPicker
            Color.BackgroundColor3 = presetcolor
            Color.BorderSizePixel = 0
            Color.Position = UDim2.new(0, 9, 0, 10)
            Color.Size = UDim2.new(0, 124, 0, 105)
            Color.ZIndex = 10
            Color.Image = "rbxassetid://4155801252"
            
            ColorRound.Name = "ColorRound"
            ColorRound.Parent = Color
            ColorRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorRound.BackgroundTransparency = 1.000
            ColorRound.ClipsDescendants = true
            ColorRound.Size = UDim2.new(1, 0, 1, 0)
            ColorRound.ZIndex = 10
            ColorRound.Image = "rbxassetid://4695575676"
            ColorRound.ImageColor3 = Color3.fromRGB(45, 45, 45)
            ColorRound.ScaleType = Enum.ScaleType.Slice
            ColorRound.SliceCenter = Rect.new(128, 128, 128, 128)
            ColorRound.SliceScale = 0.050
    
            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.ZIndex = 25
            ColorSelection.Image = "rbxassetid://4953646208"
            ColorSelection.ScaleType = Enum.ScaleType.Fit
            
            RValue.Name = "RValue"
            RValue.Parent = ColorPicker
            RValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            RValue.BackgroundTransparency = 1.000
            RValue.Position = UDim2.new(0, 10, 0, 123)
            RValue.Size = UDim2.new(0, 42, 0, 19)
            RValue.ZIndex = 10
            RValue.Image = "rbxassetid://3570695787"
            RValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            RValue.ScaleType = Enum.ScaleType.Slice
            RValue.SliceCenter = Rect.new(100, 100, 100, 100)
            RValue.SliceScale = 0.030
            
            ValueR.Name = "ValueR"
            ValueR.Parent = RValue
            ValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueR.BackgroundTransparency = 1.000
            ValueR.Size = UDim2.new(1, 0, 1, 0)
            ValueR.ZIndex = 11
            ValueR.Font = Library.Theme.TextFont
            ValueR.Text = "R: 255"
            ValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueR.TextSize = 14.000
            
            GValue.Name = "GValue"
            GValue.Parent = ColorPicker
            GValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            GValue.BackgroundTransparency = 1.000
            GValue.Position = UDim2.new(0, 64, 0, 123)
            GValue.Size = UDim2.new(0, 42, 0, 19)
            GValue.ZIndex = 10
            GValue.Image = "rbxassetid://3570695787"
            GValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            GValue.ScaleType = Enum.ScaleType.Slice
            GValue.SliceCenter = Rect.new(100, 100, 100, 100)
            GValue.SliceScale = 0.030
            
            ValueG.Name = "ValueG"
            ValueG.Parent = GValue
            ValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueG.BackgroundTransparency = 1.000
            ValueG.Size = UDim2.new(1, 0, 1, 0)
            ValueG.ZIndex = 11
            ValueG.Font = Library.Theme.TextFont
            ValueG.Text = "G: 255"
            ValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueG.TextSize = 14.000
            
            BValue.Name = "BValue"
            BValue.Parent = ColorPicker
            BValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            BValue.BackgroundTransparency = 1.000
            BValue.Position = UDim2.new(0, 119, 0, 123)
            BValue.Size = UDim2.new(0, 42, 0, 19)
            BValue.ZIndex = 10
            BValue.Image = "rbxassetid://3570695787"
            BValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
            BValue.ScaleType = Enum.ScaleType.Slice
            BValue.SliceCenter = Rect.new(100, 100, 100, 100)
            BValue.SliceScale = 0.030
            
            ValueB.Name = "ValueB"
            ValueB.Parent = BValue
            ValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueB.BackgroundTransparency = 1.000
            ValueB.Size = UDim2.new(1, 0, 1, 0)
            ValueB.ZIndex = 11
            ValueB.Font = Library.Theme.TextFont
            ValueB.Text = "B: 255"
            ValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueB.TextSize = 14.000
            
            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = ColorPicker
            RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggle.BackgroundTransparency = 1.000
            RainbowToggle.Position = UDim2.new(0, 10, 0, 143)
            RainbowToggle.Size = UDim2.new(0, 160, 0, 35)
            RainbowToggle.ZIndex = 10
            
            RainbowToggleTitle.Name = "RainbowToggleTitle"
            RainbowToggleTitle.Parent = RainbowToggle
            RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.BackgroundTransparency = 1.000
            RainbowToggleTitle.Size = UDim2.new(0, 124, 0, 30)
            RainbowToggleTitle.ZIndex = 10
            RainbowToggleTitle.Font = Library.Theme.TextFont
            RainbowToggleTitle.Text = "Rainbow"
            RainbowToggleTitle.TextColor3 = Color3.fromRGB(185, 185, 185)
            RainbowToggleTitle.TextSize = 15
            RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            Toggle.Name = "Toggle"
            Toggle.Parent = RainbowToggle
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BackgroundTransparency = 1.000
            Toggle.Position = UDim2.new(0, 131, 0, 5)
            Toggle.Size = UDim2.new(0, 20, 0, 20)
            Toggle.ZIndex = 10
            Toggle.AutoButtonColor = false
            Toggle.Font = Library.Theme.TextFont
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000
            
            CheckboxOutline.Name = "CheckboxOutline"
            CheckboxOutline.Parent = Toggle
            CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckboxOutline.BackgroundTransparency = 1.000
            CheckboxOutline.Position = UDim2.new(0.5, -12, 0.5, -12)
            CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
            CheckboxOutline.ZIndex = 10
            CheckboxOutline.Image = "http://www.roblox.com/asset/?id=5416796047"
            CheckboxOutline.ImageColor3 = Color3.fromRGB(65, 65, 65)
            
            CheckboxTicked.Name = "CheckboxTicked"
            CheckboxTicked.Parent = Toggle
            CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckboxTicked.BackgroundTransparency = 1.000
            CheckboxTicked.Position = UDim2.new(0.5, -12, 0.5, -12)
            CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
            CheckboxTicked.ZIndex = 10
            CheckboxTicked.Image = "http://www.roblox.com/asset/?id=5416796675"
            CheckboxTicked.ImageColor3 = Color3.fromRGB(65, 65, 65)

            TickCover.Name = "TickCover"
            TickCover.Parent = Toggle
            TickCover.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TickCover.BorderSizePixel = 0
            TickCover.Position = UDim2.new(0.5, -7, 0.5, -7)
            TickCover.Size = UDim2.new(0, 14, 0, 14)
            TickCover.ZIndex = 10
            
            Hue.Name = "Hue"
            Hue.Parent = ColorPicker
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.BackgroundTransparency = 1.000
            Hue.Position = UDim2.new(0, 136, 0, 10)
            Hue.Size = UDim2.new(0, 25, 0, 105)
            Hue.ZIndex = 10
            Hue.Image = "rbxassetid://3570695787"
            Hue.ScaleType = Enum.ScaleType.Slice
            Hue.SliceCenter = Rect.new(100, 100, 100, 100)
            Hue.SliceScale = 0.050

            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
            UIGradient.Rotation = 270
            UIGradient.Parent = Hue
            
            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.ZIndex = 10
            HueSelection.Image = "rbxassetid://4953646208"
            HueSelection.ScaleType = Enum.ScaleType.Fit

            local function SetRGBValues()
                ValueR.Text = ("R: " .. math.floor(ColorPickerToggle.ImageColor3.r * 255))
                ValueG.Text = ("G: " .. math.floor(ColorPickerToggle.ImageColor3.g * 255))
                ValueB.Text = ("B: " .. math.floor(ColorPickerToggle.ImageColor3.b * 255))
            end
    
            local function UpdateColorPicker(nope)
                ColorPickerToggle.ImageColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    
                SetRGBValues()
                callback(ColorPickerToggle.ImageColor3)
            end
    
            ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
            ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
            ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
    
            ColorPickerToggle.ImageColor3 = presetcolor
            Color.BackgroundColor3 = presetcolor
            SetRGBValues()
            callback(Color.BackgroundColor3)
    
            Color.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then return end
    
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                    
                    ColorInput = RunService.RenderStepped:Connect(function()
                        local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                        local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
    
                        ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                        ColorS = ColorX
                        ColorV = 1 - ColorY
    
                        UpdateColorPicker(true)
                    end)
                end
            end)
    
            Color.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                end
            end)
    
            Hue.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then return end
    
                    if HueInput then
                        HueInput:Disconnect()
                    end
                    
                    HueInput = RunService.RenderStepped:Connect(function()
                        local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
    
                        HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                        ColorH = 1 - HueY
    
                        UpdateColorPicker(true)
                    end)
                end
            end)
    
            Hue.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if HueInput then
                        HueInput:Disconnect()
                    end
                end
            end)
    
            Toggle.MouseButton1Down:Connect(function()
                RainbowColorPicker = not RainbowColorPicker
            
                if ColorInput then
                    ColorInput:Disconnect()
                end
    
                if HueInput then
                    HueInput:Disconnect()
                end
    
                if RainbowColorPicker then              
                    TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)}):Play()
                    TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Library.Theme.MainColor}):Play()
                    TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Library.Theme.MainColor}):Play()
    
                    OldToggleColor = ColorPickerToggle.ImageColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position
    
                    while RainbowColorPicker do
                        ColorPickerToggle.ImageColor3 = Color3.fromHSV(Library.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Library.RainbowColorValue, 1, 1)
            
                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0.48, 0, 0, Library.HueSelectionPosition)
            
                        SetRGBValues()
                        callback(Color.BackgroundColor3)
                        task.wait()
                    end
                elseif not RainbowColorPicker then
                    ColorPickerToggle.ImageColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor
    
                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition
    
                    SetRGBValues()
                    callback(ColorPickerToggle.ImageColor3)

                    TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
                    TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -7, 0.5, -7), Size = UDim2.new(0, 14, 0, 14)}):Play()
                    TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
                    TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
                end
            end)

            ColorPickerToggle.MouseButton1Down:Connect(function()
                ColorPickerToggled = not ColorPickerToggled

                if ColorPickerToggled then
                    TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 210)}):Play()
                    TweenService:Create(ColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
                elseif not ColorPickerToggled then
                    TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 32)}):Play()
                    TweenService:Create(ColorPicker, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
                end
            end)

            table.insert(Library.LibraryColorTable, CheckboxOutline)
            table.insert(Library.LibraryColorTable, CheckboxTicked)
        end
function Library:CreateWindow(text)
    local WindowTitle = Instance.new("TextLabel")
    WindowTitle.Name = "WindowTitle"
    WindowTitle.Parent = Topbar
    WindowTitle.BackgroundTransparency = 1
    WindowTitle.AnchorPoint = Vector2.new(0.5, 0)
    WindowTitle.Position = UDim2.new(0.5, 0, 0, 0)
    WindowTitle.Size = UDim2.new(0, 400, 1, 0)
    WindowTitle.ZIndex = 3
    WindowTitle.Font = Library.Theme.TextFont
    WindowTitle.Text = text or "Window Title"
    WindowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    WindowTitle.TextSize = 14
    WindowTitle.TextXAlignment = Enum.TextXAlignment.Center

    table.insert(Library.LibraryColorTable, WindowTitle)

    local function ColorTransition()
        while true do
            for i = 0, 1, 0.01 do
                local r = 255
                local g = 255 - (i * (255 - 75))
                local b = 255 - (i * (255 - 75))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
            for i = 0, 1, 0.01 do
                local r = 255 - (i * 255)
                local g = 75 - (i * 75)
                local b = 75 + (i * (255 - 75))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
            for i = 0, 1, 0.01 do
                local r = 0 + (i * 255)
                local g = 0 + (i * 255)
                local b = 255 - (i * (255 - 255))
                WindowTitle.TextColor3 = Color3.fromRGB(r, g, b)
                task.wait(0.02)
            end
        end
    end

    task.spawn(ColorTransition)

    return WindowTitle
end
function Library:CreateText(texts, duration, colorHex)
    local textContainer = Instance.new("Frame")
    local textLabel = Instance.new("TextLabel")
    local currentIndex = 1

    if not texts or #texts < 1 or #texts > 5 then
        warn("Texts must be an array with 1 to 5 entries")
        return
    end
    duration = duration or 2
    local color = colorHex and Color3.fromHex(colorHex) or Library.Theme.TextColor

    textContainer.Name = "TextContainer"
    textContainer.Parent = game:GetService("CoreGui")["Rndm."].Main
    textContainer.BackgroundTransparency = 1
    textContainer.Position = UDim2.new(0, 10, 0, 232)
    textContainer.Size = UDim2.new(0, 425, 0, 20)
    textContainer.ZIndex = 100

    textLabel.Name = "TextLabel"
    textLabel.Parent = textContainer
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.ZIndex = 101
    textLabel.Font = Library.Theme.TextFont
    textLabel.Text = texts[1]
    textLabel.TextColor3 = color
    textLabel.TextTransparency = 0
    textLabel.TextSize = 14 
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left

    local function transitionText()
        while true do
            local nextIndex = currentIndex % #texts + 1
            TweenService:Create(textLabel, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                TextTransparency = 1
            }):Play()
            task.wait(0.5)
            textLabel.Text = texts[nextIndex]
            TweenService:Create(textLabel, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                TextTransparency = 0.5
            }):Play()
            currentIndex = nextIndex
            task.wait(duration)
        end
    end

    task.spawn(transitionText)

    return textContainer
end

function SectionElements:CreateDropdown(name, options, presetoption, callback)
    local NameDropdown = Instance.new("Frame")
    local TitleToggle = Instance.new("TextButton")
    local Dropdown = Instance.new("ImageLabel")
    local DropdownContentLayout = Instance.new("UIListLayout")

    local gameId = self.GameId
    local DropdownToggled = false
    table.insert(options, 1, "None")
    if not Settings[gameId] then Settings[gameId] = {} end
    local SelectedOption = tostring(Settings[gameId][name] or options[presetoption] or options[1] or "None")

    
    NameDropdown.Name = (name .. "Dropdown")
    NameDropdown.Parent = SectionContent
    NameDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameDropdown.BackgroundTransparency = 1.000
    NameDropdown.Position = UDim2.new(0, 0, 0.773480654, 0)
    NameDropdown.Size = UDim2.new(0, 197, 0, 35)
    NameDropdown.ZIndex = 10

    TitleToggle.Name = "TitleToggle"
    TitleToggle.Parent = NameDropdown
    TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.BackgroundTransparency = 1.000
    TitleToggle.BorderSizePixel = 0
    TitleToggle.Position = UDim2.new(0, 13, 0, 0)
    TitleToggle.Size = UDim2.new(0, 167, 0, 30)
    TitleToggle.ZIndex = 11
    TitleToggle.Font = Library.Theme.TextFont
    TitleToggle.Text = (name .. " - " .. SelectedOption)
    TitleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.TextSize = 15.000
    TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

    Dropdown.Name = "Dropdown"
    Dropdown.Parent = NameDropdown
    Dropdown.BackgroundColor3 = Library.Theme.BackgroundColor
    Dropdown.BackgroundTransparency = 1.000
    Dropdown.Position = UDim2.new(0, 15, 0, 30)
    Dropdown.Size = UDim2.new(0, 165, 0, 0)
    Dropdown.ZIndex = 12
    Dropdown.Image = "rbxassetid://3570695787"
    Dropdown.ImageColor3 = Color3.fromRGB(45, 45, 45)
    Dropdown.ScaleType = Enum.ScaleType.Slice
    Dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
    Dropdown.SliceScale = 0.050
    Dropdown.ClipsDescendants = true

    DropdownContentLayout.Name = "DropdownContentLayout"
    DropdownContentLayout.Parent = Dropdown
    DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local searchTextBox = Instance.new("TextBox")
    searchTextBox.Name = "SearchTextBox"
    searchTextBox.Parent = Dropdown
    searchTextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    searchTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchTextBox.PlaceholderText = "Search..."
    searchTextBox.Size = UDim2.new(1, 0, 0, 20)
    searchTextBox.Position = UDim2.new(0, 0, 0, 0)
    searchTextBox.Visible = false
    searchTextBox.TextSize = 14
    searchTextBox.Font = Library.Theme.TextFont
    searchTextBox.ZIndex = 13

    local function ResetAllDropdownItems()
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            end
        end
    end

    local function ClearAllDropdownItems()
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
        DropdownToggled = true
        searchTextBox.Visible = false
        TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35)}):Play()
        TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, 0)}):Play()
    end

    local function updateOptions(filterText)
        for i, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end

        for i, v in pairs(options) do
            if string.find(string.lower(v), string.lower(filterText)) then
                local NameButton = Instance.new("TextButton")
                NameButton.Name = (v .. "DropdownButton")
                NameButton.Parent = Dropdown
                NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NameButton.BackgroundTransparency = 1.000
                NameButton.BorderSizePixel = 0
                NameButton.Size = UDim2.new(0, 165, 0, 25)
                NameButton.ZIndex = 14
                NameButton.AutoButtonColor = false
                NameButton.Font = Library.Theme.TextFont
                NameButton.Text = v
                NameButton.TextColor3 = (v == SelectedOption) and Library.Theme.MainColor or Color3.fromRGB(255, 255, 255)
                NameButton.TextSize = 15.000
                
                NameButton.TextXAlignment = Enum.TextXAlignment.Center

                
                local textBounds = NameButton.TextBounds.X + 20 
                local ClickArea = Instance.new("TextButton")
                ClickArea.Name = "ClickArea"
                ClickArea.Parent = NameButton
                ClickArea.BackgroundTransparency = 1.000
                ClickArea.Size = UDim2.new(0, textBounds, 0, 25)
                ClickArea.Position = UDim2.new(0.5, -textBounds / 2, 0, 0) 
                ClickArea.ZIndex = 15
                ClickArea.Text = ""
                ClickArea.AutoButtonColor = false

                table.insert(Library.LibraryColorTable, NameButton)

                
                ClickArea.MouseButton1Down:Connect(function()
                    SelectedOption = v
                    ResetAllDropdownItems()
                    TitleToggle.Text = (name .. " - " .. SelectedOption)
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                    if not Settings[gameId] then Settings[gameId] = {} end
                    Settings[gameId][name] = SelectedOption
                    SaveSettings()
                    if type(callback) == "function" then
                        callback(SelectedOption)
                    end
                    ClearAllDropdownItems()
                end)

                ClickArea.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                    end
                end)

                ClickArea.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end
                end)
            end
        end
    end

    TitleToggle.MouseButton1Down:Connect(function()
        DropdownToggled = not DropdownToggled
        if DropdownToggled then
            searchTextBox.Visible = false
            updateOptions("")
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, 0)}):Play()
        else
            searchTextBox.Visible = true
            searchTextBox.Text = ""
            updateOptions("")
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y + 20)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, DropdownContentLayout.AbsoluteContentSize.Y + 20)}):Play()
        end
    end)

    searchTextBox.Changed:Connect(function(property)
        if property == "Text" and not DropdownToggled then
            updateOptions(searchTextBox.Text)
        end
    end)

    local function Refresh(newoptions, newpresetoption, newcallback)
        options = newoptions or options
        local presetValue = options[newpresetoption] or Settings[gameId][name] or options[1]
        SelectedOption = presetValue
        
        if SelectedOption and SelectedOption ~= "None" and type(newcallback) == "function" then
            callback(SelectedOption)
        end
        
        TitleToggle.Text = (name .. " - " .. SelectedOption)
        Settings[gameId][name] = SelectedOption
        SaveSettings()
        
        ClearAllDropdownItems()
        updateOptions("")
    end

    updateOptions("")
    if type(callback) == "function" and SelectedOption ~= "None" then
        callback(SelectedOption)
    end

    if SectionContent and SectionContentLayout then
        SectionContent.CanvasSize = UDim2.new(0, 0, 0, SectionContentLayout.AbsoluteContentSize.Y + 15)
    end

    return {
        Refresh = Refresh
    }
end
function SectionElements:CreateMultiDropdown(name, options, minSelect, maxSelect, presetOptions, callback)
    local NameDropdown = Instance.new("Frame")
    local TitleToggle = Instance.new("TextButton")
    local Dropdown = Instance.new("ImageLabel")
    local DropdownContentLayout = Instance.new("UIListLayout")
    
    local DropdownToggled = false
    local gameId = self.GameId
    local SelectedOptions = presetOptions or {}
    local minSelect = tonumber(minSelect) or 1
    local maxSelect = tonumber(maxSelect) or (#options or 0)

    
    if not Settings[gameId] then
        Settings[gameId] = {}
    end

    
    if Settings[gameId][name] and type(Settings[gameId][name]) == "table" then
        SelectedOptions = Settings[gameId][name]
        
        for i = #SelectedOptions, 1, -1 do
            if not table.find(options, SelectedOptions[i]) then
                table.remove(SelectedOptions, i)
            end
        end
        
        while #SelectedOptions > maxSelect do
            table.remove(SelectedOptions, #SelectedOptions)
        end
        if #SelectedOptions < minSelect then
            for i = 1, minSelect - #SelectedOptions do
                if options[i] and not table.find(SelectedOptions, options[i]) then
                    table.insert(SelectedOptions, options[i])
                end
            end
        end
    else
        
        Settings[gameId][name] = SelectedOptions
        SaveSettings() 
    end

    NameDropdown.Name = (name .. "MultiDropdown")
    NameDropdown.Parent = SectionContent
    NameDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameDropdown.BackgroundTransparency = 1.000
    NameDropdown.Size = UDim2.new(0, 197, 0, 35)
    NameDropdown.ZIndex = 5

    TitleToggle.Name = "TitleToggle"
    TitleToggle.Parent = NameDropdown
    TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.BackgroundTransparency = 1.000
    TitleToggle.BorderSizePixel = 0
    TitleToggle.Position = UDim2.new(0, 13, 0, 0)
    TitleToggle.Size = UDim2.new(0, 167, 0, 30)
    TitleToggle.ZIndex = 7
    TitleToggle.Font = Library.Theme.TextFont
    TitleToggle.Text = name .. " - " .. #SelectedOptions .. "/" .. maxSelect
    TitleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleToggle.TextSize = 15.000
    TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

    Dropdown.Name = "Dropdown"
    Dropdown.Parent = NameDropdown
    Dropdown.BackgroundColor3 = Library.Theme.BackgroundColor
    Dropdown.BackgroundTransparency = 1.000
    Dropdown.Position = UDim2.new(0, 15, 0, 30)
    Dropdown.Size = UDim2.new(0, 165, 0, 0)
    Dropdown.ZIndex = 15
    Dropdown.Image = "rbxassetid://3570695787"
    Dropdown.ImageColor3 = Color3.fromRGB(45, 45, 45)
    Dropdown.ScaleType = Enum.ScaleType.Slice
    Dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
    Dropdown.SliceScale = 0.050
    Dropdown.ClipsDescendants = true

    DropdownContentLayout.Name = "DropdownContentLayout"
    DropdownContentLayout.Parent = Dropdown
    DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function UpdateTitle()
        TitleToggle.Text = name .. " - " .. #SelectedOptions .. "/" .. maxSelect
        if callback then
            callback(SelectedOptions)
        end
    end

    local function ResetAllDropdownItems()
        for _, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                if table.find(SelectedOptions, v.Text) then
                    TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                else
                    TweenService:Create(v, TweenInfo.new(0.25, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end
            end
        end
    end

    local function ClearAllDropdownItems()
        for _, v in pairs(Dropdown:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
    end

    local function PopulateDropdown()
        ClearAllDropdownItems()
        
        for _, v in pairs(options or {}) do
            local NameButton = Instance.new("TextButton")
            
            NameButton.Name = (v .. "DropdownButton")
            NameButton.Parent = Dropdown
            NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameButton.BackgroundTransparency = 1.000
            NameButton.BorderSizePixel = 0
            NameButton.Size = UDim2.new(0, 165, 0, 25)
            NameButton.ZIndex = 15
            NameButton.AutoButtonColor = false
            NameButton.Font = Library.Theme.TextFont
            NameButton.Text = v
            NameButton.TextColor3 = table.find(SelectedOptions, v) and Library.Theme.MainColor or Color3.fromRGB(255, 255, 255)
            NameButton.TextSize = 15.000

            NameButton.MouseButton1Click:Connect(function()
                local index = table.find(SelectedOptions, v)
                if index then
                    if #SelectedOptions > minSelect then
                        table.remove(SelectedOptions, index)
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings() 
                        UpdateTitle()
                    end
                else
                    if #SelectedOptions < maxSelect then
                        table.insert(SelectedOptions, v)
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Library.Theme.MainColor}):Play()
                        Settings[gameId][name] = SelectedOptions
                        SaveSettings() 
                        UpdateTitle()
                    end
                end
            end)

            NameButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                end
            end)

            NameButton.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                end
            end)
        end
    end

    TitleToggle.MouseButton1Down:Connect(function()
        DropdownToggled = not DropdownToggled
        
        if DropdownToggled then
            PopulateDropdown()
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
        else
            TweenService:Create(TitleToggle, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, 0)}):Play()
        end
    end)

    local function Refresh(newOptions, newMinSelect, newMaxSelect, newPresetOptions)
        options = newOptions or options
        minSelect = tonumber(newMinSelect) or minSelect
        maxSelect = tonumber(newMaxSelect) or maxSelect
        SelectedOptions = newPresetOptions or SelectedOptions
        
        for i = #SelectedOptions, 1, -1 do
            if not table.find(options, SelectedOptions[i]) then
                table.remove(SelectedOptions, i)
            end
        end
        
        while #SelectedOptions > maxSelect do
            table.remove(SelectedOptions, #SelectedOptions)
        end
        
        if #SelectedOptions < minSelect then
            for i = 1, minSelect - #SelectedOptions do
                if options[i] and not table.find(SelectedOptions, options[i]) then
                    table.insert(SelectedOptions, options[i])
                end
            end
        end
        Settings[gameId][name] = SelectedOptions
        SaveSettings() 
        UpdateTitle()

        if DropdownToggled then
            PopulateDropdown()
            TweenService:Create(NameDropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 197, 0, 35 + DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
            TweenService:Create(Dropdown, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 165, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
        end
    end

    UpdateTitle()
    return {
        Refresh = Refresh,
        GetSelected = function() return SelectedOptions end
    }
end
Library.ActiveNotifications = {}

function Library:CreateNotification(title, message, duration, buttons, buttonCallbacks)
    local NotificationFrame = Instance.new("Frame")
    local NotificationBackground = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local MessageLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local TimerBar = Instance.new("Frame")
    local TimerBarFill = Instance.new("Frame")

    local hasButtons = buttons and #buttons > 0
    local notifHeight = hasButtons and 100 or 70

    NotificationFrame.Name = "Notification"
    NotificationFrame.Parent = UILibrary
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Position = UDim2.new(1, 0, 1, -110)
    NotificationFrame.Size = UDim2.new(0, 300, 0, notifHeight)
    NotificationFrame.ZIndex = 100

    NotificationBackground.Name = "Background"
    NotificationBackground.Parent = NotificationFrame
    NotificationBackground.BackgroundColor3 = Library.Theme.MainColor
    NotificationBackground.Size = UDim2.new(1, 0, 1, 0)
    NotificationBackground.ZIndex = 100
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = NotificationBackground

    TitleLabel.Name = "Title"
    TitleLabel.Parent = NotificationBackground
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.Size = UDim2.new(0, 260, 0, 20)
    TitleLabel.ZIndex = 101
    TitleLabel.Font = Library.Theme.TextFont
    TitleLabel.Text = title or "Notification"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    MessageLabel.Name = "Message"
    MessageLabel.Parent = NotificationBackground
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Position = UDim2.new(0, 10, 0, 25)
    MessageLabel.Size = UDim2.new(0, 260, 0, hasButtons and 40 or 30)
    MessageLabel.ZIndex = 101
    MessageLabel.Font = Library.Theme.TextFont
    MessageLabel.Text = message or ""
    MessageLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    MessageLabel.TextSize = 14
    MessageLabel.TextWrapped = true
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left

    pcall(function()
        local envColor = getgenv().Color and string.lower(getgenv().Color) or nil
        if envColor == "white" then
            TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        elseif envColor == "black" then
            MessageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = NotificationBackground
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(1, -25, 0, 5)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.ZIndex = 102
    CloseButton.Font = Library.Theme.TextFont
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 16

    TimerBar.Name = "TimerBar"
    TimerBar.Parent = NotificationBackground
    TimerBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TimerBar.BorderSizePixel = 0
    TimerBar.Position = UDim2.new(0, 10, 1, -15)
    TimerBar.Size = UDim2.new(0, 280, 0, 5)
    TimerBar.ZIndex = 101

    TimerBarFill.Name = "TimerBarFill"
    TimerBarFill.Parent = TimerBar
    TimerBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TimerBarFill.BorderSizePixel = 0
    TimerBarFill.Size = UDim2.new(1, 0, 1, 0)
    TimerBarFill.ZIndex = 102

    local function closeNotification()
        local index = table.find(Library.ActiveNotifications, NotificationFrame)
        if index then
            table.remove(Library.ActiveNotifications, index)
            TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Library.Theme.EasingStyle, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, NotificationFrame.Position.Y.Scale, NotificationFrame.Position.Y.Offset)
            }):Play()
            task.delay(0.5, function()
                if NotificationFrame.Parent then
                    NotificationFrame:Destroy()
                end
                
                for i, notif in ipairs(Library.ActiveNotifications) do
                    if notif.Parent then 
                        local targetY = -110 - (i - 1) * (notif.Size.Y.Offset + 10)
                        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Position = UDim2.new(1, -310, 1, targetY)
                        }):Play()
                    end
                end
            end)
        end
    end

    if hasButtons then
        local buttonCount = math.clamp(#buttons, 1, 5)
        local buttonWidth = 280 / buttonCount - 5
        for i = 1, buttonCount do
            local ActionButton = Instance.new("TextButton")
            ActionButton.Name = "ActionButton" .. i
            ActionButton.Parent = NotificationBackground
            ActionButton.BackgroundColor3 = DarkenObjectColor(Library.Theme.MainColor, 20)
            ActionButton.Position = UDim2.new(0, 10 + (i - 1) * (buttonWidth + 5), 0, 65)
            ActionButton.Size = UDim2.new(0, buttonWidth, 0, 20)
            ActionButton.ZIndex = 102
            ActionButton.Font = Library.Theme.TextFont
            ActionButton.Text = buttons[i] or "Button " .. i
            ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ActionButton.TextSize = 14

            local ButtonRounded = Instance.new("UICorner")
            ButtonRounded.CornerRadius = UDim.new(0, 5)
            ButtonRounded.Parent = ActionButton

            ActionButton.MouseButton1Click:Connect(function()
                if buttonCallbacks and buttonCallbacks[i] then
                    buttonCallbacks[i]()
                end
                closeNotification()
            end)
        end
    end

    
    table.insert(Library.ActiveNotifications, 1, NotificationFrame)

    
    for i, notif in ipairs(Library.ActiveNotifications) do
        if notif.Parent then 
            local targetY = -110 - (i - 1) * (notif.Size.Y.Offset + 10)
            TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -310, 1, targetY)
            }):Play()
        end
    end

    
    local duration = duration or 5
    TweenService:Create(TimerBarFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 1, 0)
    }):Play()

    
    task.spawn(function()
        task.wait(duration)
        if NotificationFrame.Parent then 
            closeNotification()
        end
    end)

    CloseButton.MouseButton1Click:Connect(closeNotification)

    return NotificationFrame
end
        function SectionElements:CreateKeybind(name, presetbind, keyboardonly, holdmode, callback)
            local NameKeybind = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local KeybindButtonBorder = Instance.new("ImageLabel")
            local KeybindButton = Instance.new("TextButton")

            local OldBind = presetbind.Name
            local LoadFromPreset = false
            local JustBinded = false

            local NotAllowedKeys = {
                Return = true,
                Space = true,
                Tab = true,
                Unknown = true,
                MouseButton1 = true
            }

            local AllowedMouseTypes = {
                MouseButton2 = true,
                MouseButton3 = true
            }

            local ShortenedNames = {
                LeftShift = "LShift",
                RightShift = "RShift",
                LeftControl = "LCtrl",
                RightControl = "RCtrl",
                LeftAlt = "LAlt",
                RightAlt = "RAlt",
                CapsLock = "Caps",
                One = "1",
                Two = "2",
                Three = "3",
                Four = "4",
                Five = "5",
                Six = "6",
                Seven = "7",
                Eight = "8",
                Nine = "9",
                Zero = "0",
                KeypadOne = "Num-1",
                KeypadTwo = "Num-2",
                KeypadThree = "Num-3",
                KeypadFour = "Num-4",
                KeypadFive = "Num-5",
                KeypadSix = "Num-6",
                KeypadSeven = "Num-7",
                KeypadEight = "Num-8",
                KeypadNine = "Num-9",
                KeypadZero = "Num-0",
                Minus = "-",
                Equals = "=",
                Tilde = "~",
                LeftBracket = "[",
                RightBracket = "]",
                RightParenthesis = ")",
                LeftParenthesis = "(",
                Semicolon = ";",
                Quote = "'",
                BackSlash = "\\",
                Comma = ",",
                Period = ".",
                Slash = "/",
                Asterisk = "*",
                Plus = "+",
                Period = ".",
                Backquote = "`",
                MouseButton1 = "M1",
                MouseButton2 = "M2",
                MouseButton3 = "M3"
            }

            NameKeybind.Name = (name .. "Keybind")
            NameKeybind.Parent = SectionContent
            NameKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameKeybind.BackgroundTransparency = 1.000
            NameKeybind.Position = UDim2.new(0, 0, 0.138121545, 0)
            NameKeybind.Size = UDim2.new(0, 197, 0, 35)

            Title.Name = "Title"
            Title.Parent = NameKeybind
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 13, 0, 0)
            Title.Size = UDim2.new(0, 151, 0, 30)
            Title.ZIndex = 5
            Title.Font = Library.Theme.TextFont
            Title.Text = name
            Title.TextColor3 = Library.Theme.TextColor
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            KeybindButtonBorder.Name = "KeybindButtonBorder"
            KeybindButtonBorder.Parent = NameKeybind
            KeybindButtonBorder.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            KeybindButtonBorder.BackgroundTransparency = 1.000
            KeybindButtonBorder.Position = UDim2.new(0, 139, 0, 5)
            KeybindButtonBorder.Size = UDim2.new(0, 42, 0, 20)
            KeybindButtonBorder.ZIndex = 5
            KeybindButtonBorder.Image = "rbxassetid://3570695787"
            KeybindButtonBorder.ImageColor3 = Color3.fromRGB(65, 65, 65)
            KeybindButtonBorder.ScaleType = Enum.ScaleType.Slice
            KeybindButtonBorder.SliceCenter = Rect.new(100, 100, 100, 100)
            KeybindButtonBorder.SliceScale = 0.030

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindButtonBorder
            KeybindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.BackgroundTransparency = 1.000
            KeybindButton.Size = UDim2.new(1, 0, 1, 0)
            KeybindButton.ZIndex = 5
            KeybindButton.Font = Library.Theme.TextFont
            KeybindButton.Text = (ShortenedNames[presetbind.Name] or ShortenedNames[presetbind] or presetbind.Name or "None")
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 15.000
            KeybindButton.TextWrapped = true
            
            if LoadFromPreset then
                KeybindButton.Text = presetbind
            end

            if presetbind == Enum.KeyCode.Unknown or presetbind == "Unknown" then
                KeybindButton.Text = "None"
            end

            KeybindButton.MouseButton1Click:Connect(function()
                if Library.CurrentlyBinding then return end
                KeybindButton.Text = "..."

                local Input, Bruh = UserInputService.InputBegan:Wait()
                Library.CurrentlyBinding = true

                if Input.KeyCode.Name == "Backspace" or Input.KeyCode.Name == "Delete" then
                    KeybindButton.Text = "None"
                    OldBind = Enum.KeyCode.Unknown.Name
                    Library.CurrentlyBinding = false
                    JustBinded = false
                    return
                end
                
                if (Input.UserInputType ~= Enum.UserInputType.Keyboard and (AllowedMouseTypes[Input.UserInputType.Name]) and (not keyboardonly)) or (Input.KeyCode and (not NotAllowedKeys[Input.KeyCode.Name])) then
                    local BindName = ((Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType.Name) or Input.KeyCode.Name)
                    KeybindButton.Text = ShortenedNames[BindName] or BindName
                    OldBind = BindName
                    Library.CurrentlyBinding = false
                    JustBinded = true
                else
                    KeybindButton.Text = ShortenedNames[OldBind] or OldBind
                    Library.CurrentlyBinding = false
                end
            end)
            
            if not holdmode then
                UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback()
                        end
                    end
                end)
            else
                UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback(true)
                        end
                    end
                end)

                UserInputService.InputEnded:Connect(function(input, gameprocessedevent) 
                    if not gameprocessedevent then
                        if UserInputService:GetFocusedTextBox() then return end
                        if OldBind == Enum.KeyCode.Unknown.Name then return end
                        if JustBinded then JustBinded = false return end

                        HoldModeToggled = false
                        local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

                        if BindName == OldBind then 
                            callback(false)
                        end
                    end
                end)
            end
        end

        SectionContent.CanvasSize = UDim2.new(0, 0, 0, SectionContentLayout.AbsoluteContentSize.Y + 15)

        return SectionElements
    end

    return TabElements
end

return Library]=])()
local v3 = getgenv().Lib
local vu4 = "Unknown Game"
pcall(function()
    local v5 = vu1:GetProductInfo(game.PlaceId)
    if v5 and v5.Name then
        vu4 = v5.Name
    end
end)
local v6 = v3:CreateTab("Main")
local v7 = v6:CreateSection("Products")
local v8 = v6:CreateSection("Product Statistics")
v3:CreateWindow(vu4 .. " - This script were Made by rndm")
local vu9 = {}
local vu10 = {}
local vu11 = nil
local vu12 = false
local vu13 = 0
local vu14 = v8:CreateLabel("expensiveLabel", "Most Expensive:\nLoading...")
local vu15 = v8:CreateLabel("cheapLabel", "Cheapest Product:\nLoading...")
local vu16 = v8:CreateLabel("purchaseCount", "Products Purchased: 0")
local vu17 = v8:CreateLabel("totalProducts", "Total Products: 0")
local function vu24()
    if # vu9 <= 0 then
        vu14.ChangeText("Most Expensive:\nNo products found")
        vu15.ChangeText("Cheapest Product:\nNo products found")
    else
        local v18 = vu9[1]
        local v19 = vu9[1]
        local v20, v21, v22 = ipairs(vu9)
        while true do
            local v23
            v22, v23 = v20(v21, v22)
            if v22 == nil then
                break
            end
            if v23.price > v18.price then
                v18 = v23
            end
            if v23.price < v19.price then
                v19 = v23
            end
        end
        vu14.ChangeText("Most Expensive:\n" .. v18.name)
        vu15.ChangeText("Cheapest Product:\n" .. v19.name)
    end
    vu16.ChangeText("Products Purchased: " .. vu13)
    vu17.ChangeText("Total Products: " .. # vu9)
end
local vu30 = v7:CreateDropdown("Select Product", {
    "Loading...."
}, 1, function(p25)
    local v26, v27, v28 = ipairs(vu9)
    while true do
        local v29
        v28, v29 = v26(v27, v28)
        if v28 == nil then
            break
        end
        if v29.name == p25 then
            vu11 = v29.id
            break
        end
    end
end)
local function vu41()
    vu9 = {}
    vu10 = {}
    local v31 = vu1:GetDeveloperProductsAsync()
    local v32, v33, v34 = pairs(v31:GetCurrentPage())
    while true do
        local v35
        v34, v35 = v32(v33, v34)
        if v34 == nil then
            break
        end
        table.insert(vu9, {
            id = v35.ProductId,
            name = v35.Name,
            price = v35.PriceInRobux or 0
        })
        table.insert(vu10, v35.Name)
    end
    vu30.Refresh(vu10, 1, function(p36)
        local v37, v38, v39 = ipairs(vu9)
        while true do
            local v40
            v39, v40 = v37(v38, v39)
            if v39 == nil then
                break
            end
            if v40.name == p36 then
                vu11 = v40.id
                break
            end
        end
    end)
    vu24()
end
v7:CreateButton("Refresh", function()
    vu41()
    Library:CreateNotification("Info", "Dropdown has been refreshed", 2)
end)
v7:CreateButton("Buy Product", function()
    if vu11 then
        vu1:SignalPromptProductPurchaseFinished(vu2.UserId, vu11, true)
        vu13 = vu13 + 1
        vu24()
    else
        Library:CreateNotification("Error", "Please select something.", 3)
    end
end)
v7:CreateButton("Buy All Products", function()
    if # vu9 <= 0 then
        Library:CreateNotification("Error", "I can\'t find any products", 3)
    else
        local v42, v43, v44 = ipairs(vu9)
        while true do
            local v45
            v44, v45 = v42(v43, v44)
            if v44 == nil then
                break
            end
            vu1:SignalPromptProductPurchaseFinished(vu2.UserId, v45.id, true)
            vu13 = vu13 + 1
        end
        vu24()
    end
end)
v7:CreateToggle("Auto Buy Selected", function(p46)
    vu12 = p46
    if vu12 then
        while vu12 do
            if vu11 then
                vu1:SignalPromptProductPurchaseFinished(vu2.UserId, vu11, true)
                vu13 = vu13 + 1
                vu24()
            end
            task.wait()
        end
    end
end, "Automatically buys the selected product")
v7:CreateButton("Copy Selected Product ID", function()
    if vu11 then
        if pcall(function()
            setclipboard(tostring(vu11))
        end) then
            Library:CreateNotification("Copied", "Product ID " .. vu11 .. " copied to clipboard", 3)
        else
            Library:CreateNotification("Error", "Executor doesn\'t support clipboard copy. Product ID printed to output", 3)
            print("Product ID:", vu11)
        end
    else
        Library:CreateNotification("Warning", "No product selected", 2)
    end
end)
vu41()
v8:CreateButton("Hook Product Id", function()
    local vu47 = getrawmetatable(game)
    if pcall(function()
        setreadonly(vu47, false)
    end) then
        local vu48 = vu47.__namecall
        vu47.__namecall = newcclosure(function(p49, ...)
            local vu50 = getnamecallmethod() == "PromptProductPurchase" and ({
                ...
            })[2]
            if vu50 then
                if pcall(function()
                    setclipboard(tostring(vu50))
                end) then
                    Library:CreateNotification("Product Id Hooker", tostring(vu50) .. " has been copied to clipboard", 3)
                else
                    print("Product ID:", vu50)
                    Library:CreateNotification("Product Id Hooker", "Executor doesn\'t support setclipboard. Product ID " .. tostring(vu50) .. " printed to output", 5)
                end
            end
            return vu48(p49, ...)
        end)
        setreadonly(vu47, true)
        Library:CreateNotification("Hook Activated", "Hook Product ID is now active. Please click a product to hook its ID", 5)
    else
        Library:CreateNotification("Error", "Failed to modify metatable", 3)
    end
end)
local vu51 = nil
v8:CreateTextBox("Product ID Input", 20, "Enter Product ID", function(p52)
    vu51 = tonumber(p52)
    if not vu51 then
        Library:CreateNotification("Warning", "Please enter a valid number", 2)
    end
end)
v8:CreateButton("Add Product to Dropdown", function()
    if vu51 then
        local vu53 = "Unknown Product (ID: " .. vu51 .. ")"
        local function vu58(pu54, p55)
            for _ = 1, p55 do
                local v56, v57 = pcall(function()
                    return vu1:GetProductInfo(pu54)
                end)
                if v56 and (v57 and v57.Name) then
                    return v57
                end
                task.wait(1.5 + math.random())
            end
            return nil
        end
        task.spawn(function()
            local v59 = vu58(vu51, 3)
            if v59 and v59.Name then
                vu53 = v59.Name
            else
                Library:CreateNotification("Warning", "Failed to fetch product info. Will use fallback name.", 3)
            end
            local v60, v61, v62 = ipairs(vu9)
            while true do
                local v63
                v62, v63 = v60(v61, v62)
                if v62 == nil then
                    break
                end
                if v63.id == vu51 then
                    Library:CreateNotification("Info", "Product " .. vu53 .. " is already in the dropdown", 3)
                    return
                end
            end
            table.insert(vu9, {
                id = vu51,
                name = vu53,
                price = v59 and v59.PriceInRobux or 0
            })
            table.insert(vu10, vu53)
            vu30.Refresh(vu10, 1, function(p64)
                local v65, v66, v67 = ipairs(vu9)
                while true do
                    local v68
                    v67, v68 = v65(v66, v67)
                    if v67 == nil then
                        break
                    end
                    if v68.name == p64 then
                        vu11 = v68.id
                        break
                    end
                end
            end)
            vu24()
            Library:CreateNotification("Success", "Added " .. vu53 .. " to dropdown", 3)
        end)
    else
        Library:CreateNotification("Error", "Please enter a valid Product ID (numbers only)", 3)
    end
end)
local vu69 = game:GetService("HttpService")
local v70 = game:GetService("Players")
local vu71 = game:GetService("MarketplaceService")
local vu72 = v70.LocalPlayer
local vu73 = game.PlaceId
local vu74 = false
local vu75 = nil
local vu76 = {}
local vu77 = 0
local v78 = v3:CreateTab("Gamepass")
local v79 = v78:CreateSection("Main")
local v80 = v78:CreateSection("Statistic")
local vu81 = v80:CreateLabel("Cheapest", "Cheapest Gamepass:\nN/A")
v80:CreateLabel(" Sperator", "---------------")
local vu82 = v80:CreateLabel("MostExp", "Most Expensive Gamepass:\nN/A")
v80:CreateLabel("sperator", "---------------")
local vu83 = v80:CreateLabel("TotalPurchased", "Gamepass Purchased: 0")
local function v91(pu84, pu85, pu86, pu87, pu88)
    local v89, v90 = pcall(function()
        return pu84:CreateDropdown(pu85, pu86, pu87, pu88)
    end)
    return v89 and v90 and v90 or nil
end
local function vu96(pu92, pu93, pu94, pu95)
    if pu92 then
        pcall(function()
            pu92.Refresh(pu93, pu94, pu95)
        end)
    end
end
local function vu99(pu97, pu98)
    if pu97 then
        pcall(function()
            pu97.Refresh(pu98)
        end)
    end
end
local function vu103(pu100)
    local v101, v102 = pcall(function()
        return vu69:JSONDecode((game:HttpGet("https://apis.roblox.com/universes/v1/places/" .. pu100 .. "/universe"))).universeId
    end)
    return v101 and v102 and v102 or nil
end
local function vu108(pu104)
    local v106, v107 = pcall(function()
        local v105 = "https://games.roblox.com/v1/games/" .. pu104 .. "/game-passes?page=1&limit=100"
        return vu69:JSONDecode((game:HttpGet(v105))).data
    end)
    return v106 and v107 and v107 or {}
end
local function vu110(pu109)
    pcall(function()
        vu71:SignalPromptGamePassPurchaseFinished(vu72, pu109, true)
        print(pu109)
    end)
    vu77 = vu77 + 1
    vu83.Refresh("Gamepass Purchased: " .. vu77)
end
local vu111 = nil
local vu112 = {}
local v113 = vu103(vu73)
if v113 then
    local v114 = vu108(v113)
    local v115 = {
        name = nil,
        price = math.huge
    }
    local v116 = {
        name = nil,
        price = - math.huge
    }
    local v117, v118, v119 = ipairs(v114)
    vu112 = {}
    while true do
        local v120, v121 = v117(v118, v119)
        if v120 == nil then
            break
        end
        v119 = v120
        if v121.id and (v121.displayName and v121.price) then
            table.insert(vu112, v121.displayName)
            vu76[v121.displayName] = v121.id
            v115 = v121.price < v115.price and {
                name = v121.displayName,
                price = v121.price
            } or v115
            if v121.price > v116.price then
                v116 = {
                    name = v121.displayName,
                    price = v121.price
                }
            end
        end
    end
    if v115.name then
        vu81.Refresh("Cheapest Gamepass:\n " .. v115.name .. " (" .. v115.price .. " Robux)")
    end
    if v116.name then
        vu82.Refresh("Most Expensive Gamepass:\n " .. v116.name .. " (" .. v116.price .. " Robux)")
    end
    local vu123 = v91(v79, "Select Gamepass", vu112, 1, function(p122)
        vu75 = vu76[p122]
    end)
    v79:CreateButton("Refresh Dropdown", function()
        local v124 = vu103(vu73)
        if v124 then
            local v125 = vu108(v124)
            table.clear(vu76)
            local v126 = {
                name = nil,
                price = math.huge
            }
            local v127 = {
                name = nil,
                price = - math.huge
            }
            local v128, v129, v130 = ipairs(v125)
            local v131 = {}
            while true do
                local v132
                v130, v132 = v128(v129, v130)
                if v130 == nil then
                    break
                end
                if v132.id and (v132.displayName and v132.price) then
                    table.insert(v131, v132.displayName)
                    vu76[v132.displayName] = v132.id
                    v126 = v132.price < v126.price and {
                        name = v132.displayName,
                        price = v132.price
                    } or v126
                    if v132.price > v127.price then
                        v127 = {
                            name = v132.displayName,
                            price = v132.price
                        }
                    end
                end
            end
            vu96(vu123, v131, 1, function(p133)
                vu75 = vu76[p133]
            end)
            vu99(vu81, "Cheapest Gamepass:\n " .. (v126.name or "N/A") .. " (" .. (v126.price or "?") .. " Robux)")
            vu99(vu82, "Most Expensive Gamepass:\n " .. (v127.name or "N/A") .. " (" .. (v127.price or "?") .. " Robux)")
        end
    end)
    v79:CreateButton("Buy Gamepass", function()
        if vu75 then
            vu110(vu75)
        end
    end)
    v79:CreateButton("Buy All Gamepasses", function()
        local v134, v135, v136 = pairs(vu76)
        while true do
            local v137
            v136, v137 = v134(v135, v136)
            if v136 == nil then
                break
            end
            vu110(v137)
            task.wait(0.1)
        end
    end)
    v79:CreateToggle("Auto Buy Selected", function(p138)
        vu74 = p138
    end)
    v79:CreateButton("Copy Selected Gamepass Id", function()
        if vu75 then
            local v139 = {
                function()
                    warn("nothing")
                end,
                function()
                    setclipboard(tostring(vu75))
                end
            }
            Library:CreateNotification("Idk hub", "Gamepass Id (" .. tostring(vu75) .. ")has been copied into your clipboard.", {
                "Thank you",
                "Copy Gamepass Id"
            }, 5, v139)
            setclipboard(tostring(vu75))
        end
    end)
    task.spawn(function()
        while true do
            if vu74 and vu75 then
                vu110(vu75)
            end
            task.wait()
        end
    end)
    vu111 = vu123
else
    print("Failed")
end
local vu140 = nil
v80:CreateButton("Hook Gamepass Id", function()
    Library:CreateNotification("Hookers", "Hook active! Click a gamepass to copy its ID", 5)
    vu71.PromptGamePassPurchaseFinished:Connect(function(p141, p142, _)
        if p141 == vu72 then
            vu140 = p142
            setclipboard(tostring(vu140))
            local v143 = {
                function()
                    setclipboard(tostring(vu140))
                end
            }
            Library:CreateNotification("Hooked!", "Hooked Gamepass ID: " .. tostring(vu140), 6, {
                "OK"
            }, v143)
        end
    end)
end)
local vu144 = ""
v80:CreateTextBox("Manual Gamepass ID", 12, "Input ID", function(p145)
    vu144 = p145
end)
v80:CreateButton("Add Gamepass ID to Dropdown", function()
    if vu144 ~= "" then
        local v146 = "Manual_" .. vu144
        vu76[v146] = tonumber(vu144)
        table.insert(vu112, v146)
        vu111.Refresh(vu112, # vu112, function(p147)
            vu75 = vu76[p147]
        end)
    end
end)
local v148 = v3:CreateTab("Teleporter")
local v149 = v3:CreateTab("Misc")
local v150 = v149:CreateSection("Misc")
local v151 = v149:CreateSection("Universal")
local vu152 = game.Players.LocalPlayer
local vu153 = workspace.CurrentCamera
local vu154 = game:GetService("RunService")
local vu155 = game:GetService("TeleportService")
local vu156 = game:GetService("StarterGui")
local vu157 = game:GetService("UserInputService")
local vu158 = game:GetService("HttpService")
local vu159 = game:GetService("Players")
local vu160 = game:GetService("Lighting")
local vu161 = false
local vu162 = 16
v150:CreateSlider("Walkspeed", 16, 2500, 16, false, function(p163)
    vu162 = p163
    if vu161 then
        local v164 = vu152.Character
        if v164 and v164:FindFirstChild("Humanoid") then
            v164.Humanoid.WalkSpeed = p163
        end
    end
end)
v150:CreateToggle("Enable Walkspeed", function(p165)
    vu161 = p165
    local vu166 = vu152.Character
    task.spawn(function()
        while vu161 do
            if vu166 and vu166:FindFirstChild("Humanoid") then
                vu166.Humanoid.WalkSpeed = vu162
            end
            task.wait(0.1)
        end
        if vu166 and vu166:FindFirstChild("Humanoid") then
            vu166.Humanoid.WalkSpeed = 16
        end
    end)
end)
v150:CreateToggle("Anti-AFK", function(p167)
    if p167 then
        print("Afk: Turned on!")
        local vu168 = game:GetService("VirtualUser")
        vu152.Idled:Connect(function()
            vu168:CaptureController()
            vu168:ClickButton2(Vector2.new())
            print("AFK: Active!")
        end)
    else
        print("Afk: off")
    end
end)
v150:CreateToggle("White Screen", function(p169)
    if p169 then
        local v170 = Instance.new("ScreenGui")
        v170.Name = "WhiteScreen"
        v170.IgnoreGuiInset = true
        v170.Parent = game.CoreGui
        local v171 = Instance.new("Frame", v170)
        v171.Size = UDim2.new(1, 0, 1, 0)
        v171.Position = UDim2.new(0, 0, 0, 0)
        v171.BackgroundColor3 = Color3.new(1, 1, 1)
        v171.BorderSizePixel = 0
        v171.ZIndex = 0
    elseif game.CoreGui:FindFirstChild("WhiteScreen") then
        game.CoreGui.WhiteScreen:Destroy()
    end
end)
v150:CreateButton("FPS Booster", function()
    local v172 = Instance.new("BindableFunction")
    function v172.OnInvoke(p173)
        if p173 == "Yes" then
            local v174 = game:GetService("Lighting")
            local v175, v176, v177 = ipairs(v174:GetChildren())
            while true do
                local v178
                v177, v178 = v175(v176, v177)
                if v177 == nil then
                    break
                end
                if v178:IsA("PostEffect") then
                    v178:Destroy()
                end
            end
            v174.GlobalShadows = false
            v174.FogEnd = 9000000000
            v174.Brightness = 2
            local v179, v180, v181 = ipairs(workspace:GetDescendants())
            while true do
                local v182
                v181, v182 = v179(v180, v181)
                if v181 == nil then
                    break
                end
                if v182:IsA("BasePart") and not v182:IsDescendantOf(vu152.Character) then
                    v182.Material = Enum.Material.SmoothPlastic
                    v182.Reflectance = 0
                elseif v182:IsA("Texture") or v182:IsA("Decal") then
                    v182.Transparency = 1
                end
            end
            local v183 = workspace:FindFirstChild("Terrain")
            if v183 then
                v183.WaterWaveSize = 0
                v183.WaterWaveSpeed = 0
                v183.WaterReflectance = 0
                v183.WaterTransparency = 1
            end
            settings().Physics.AllowSleep = true
            settings().Rendering.QualityLevel = 1
            vu156:SetCore("SendNotification", {
                Title = "Success",
                Text = "FPS Booster applied!",
                Duration = 2
            })
        end
    end
    vu156:SetCore("SendNotification", {
        Title = "Confirmation",
        Text = "Apply FPS Booster?",
        Duration = 5,
        Callback = v172,
        Button1 = "Yes",
        Button2 = "No"
    })
end)
local vu184 = game:GetService("Players")
local vu185 = vu184.LocalPlayer
game:GetService("MarketplaceService")
local function vu192()
    local v186 = vu184
    local v187, v188, v189 = ipairs(v186:GetPlayers())
    local v190 = {}
    while true do
        local v191
        v189, v191 = v187(v188, v189)
        if v189 == nil then
            break
        end
        if v191 ~= vu185 then
            table.insert(v190, v191.Name)
        end
    end
    return v190
end
local function vu196(p193)
    local v194, v195 = pcall(p193)
    return v194 and v195 and v195 or "N/A"
end
local function vu233(pu197)
    local vu198 = {}
    if pu197.Character then
        local vu199 = pu197.Character:FindFirstChild("Head")
        if vu199 then
            local v200 = {
                name = "Head",
                id = vu196(function()
                    return tostring(vu199:GetAttribute("OriginalSize") or "Default")
                end)
            }
            table.insert(vu198, v200)
            local vu201 = vu199:FindFirstChild("face")
            if vu201 then
                local v202 = {
                    name = "Face",
                    id = vu196(function()
                        return vu201.Texture:match("%d+") or "Default"
                    end)
                }
                table.insert(vu198, v202)
            end
        end
        local v203, v204, v205 = ipairs(pu197.Character:GetChildren())
        while true do
            local v206, vu207 = v203(v204, v205)
            if v206 == nil then
                break
            end
            v205 = v206
            if vu207:IsA("Accessory") then
                local v211 = vu196(function()
                    local v208 = vu207:FindFirstChild("AccessoryId")
                    if v208 then
                        return tostring(v208.Value)
                    end
                    local v209 = vu207:FindFirstChild("Handle")
                    local v210 = v209 and (v209:FindFirstChild("Mesh") or v209:FindFirstChild("SpecialMesh"))
                    return not v210 and "N/A" or tostring(v210.MeshId:match("%d+"))
                end)
                table.insert(vu198, {
                    name = vu207.Name,
                    id = v211
                })
            end
        end
        local vu212 = pu197.Character:FindFirstChild("Shirt")
        if vu212 then
            local v213 = {
                name = "Shirt",
                id = vu196(function()
                    return vu212.ShirtTemplate:match("%d+") or "None"
                end)
            }
            table.insert(vu198, v213)
        end
        local vu214 = pu197.Character:FindFirstChild("Pants")
        if vu214 then
            local v215 = {
                name = "Pants",
                id = vu196(function()
                    return vu214.PantsTemplate:match("%d+") or "None"
                end)
            }
            table.insert(vu198, v215)
        end
        local vu216 = pu197.Character:FindFirstChild("ShirtGraphic")
        if vu216 then
            local v217 = {
                name = "T-Shirt",
                id = vu196(function()
                    return vu216.Graphic:match("%d+") or "None"
                end)
            }
            table.insert(vu198, v217)
        end
        local function v221(p218)
            local vu219 = pu197.Character:FindFirstChild(p218)
            if vu219 then
                local v220 = {
                    name = p218,
                    id = vu196(function()
                        return tostring(vu219:GetAttribute("OriginalSize") or "Default")
                    end)
                }
                table.insert(vu198, v220)
            end
        end
        v221("Left Arm")
        v221("Right Arm")
        v221("Torso")
        v221("UpperTorso")
        local v222 = pu197.Character:FindFirstChild("Humanoid")
        if v222 and v222:FindFirstChild("Animator") then
            local v223 = v222.Animator
            local v224, v225, v226 = ipairs(v223:GetPlayingAnimationTracks())
            while true do
                local vu227
                v226, vu227 = v224(v225, v226)
                if v226 == nil then
                    break
                end
                local v228 = vu196(function()
                    return vu227.Animation.AnimationId:match("%d+")
                end)
                local v229 = string.lower(vu227.Name)
                local v230 = v229:match("walk") and "Walk" or (v229:match("run") and "Run" or (v229:match("jump") and "Jump" or (v229:match("idle") and "Idle" or "Other")))
                table.insert(vu198, {
                    name = "Animation " .. v230,
                    id = v228
                })
            end
        end
        local vu231 = pu197.Character:FindFirstChild("BodyColors")
        if vu231 then
            local v232 = {
                name = "Clothing Package",
                id = vu196(function()
                    return tostring(vu231:GetAttribute("ClothingPackage") or "None")
                end)
            }
            table.insert(vu198, v232)
        end
    end
    return vu198
end
local vu234 = nil
local vu235 = {}
local vu242 = v151:CreateMultiDropdown("Select IDs", {}, 0, 100, {}, function(p236)
    vu235 = {}
    local v237, v238, v239 = ipairs(p236)
    while true do
        local v240
        v239, v240 = v237(v238, v239)
        if v239 == nil then
            break
        end
        local v241 = v240:match(": (.+)$")
        if v241 then
            table.insert(vu235, v241)
        end
    end
end)
local vu256 = v151:CreateDropdown("Select Player", vu192(), 1, function(p243)
    vu234 = vu184:FindFirstChild(p243)
    if vu234 then
        local v244 = vu233(vu234)
        local v245, v246, v247 = ipairs(v244)
        local v248 = {}
        while true do
            local v249
            v247, v249 = v245(v246, v247)
            if v247 == nil then
                break
            end
            table.insert(v248, v249.name .. ": " .. v249.id)
        end
        vu242.Refresh(v248, 1, function(p250)
            vu235 = {}
            local v251, v252, v253 = ipairs(p250)
            while true do
                local v254
                v253, v254 = v251(v252, v253)
                if v253 == nil then
                    break
                end
                local v255 = v254:match(": (.+)$")
                if v255 then
                    table.insert(vu235, v255)
                end
            end
        end)
    end
end)
v151:CreateButton("Copy Selected IDs", function()
    if # vu235 > 0 then
        setclipboard(table.concat(vu235, "\n"))
    end
end)
v151:CreateButton("Copy All IDs (Formatted)", function()
    if vu234 then
        local v257 = vu233(vu234)
        local v258, v259, v260 = ipairs(v257)
        local v261 = {}
        while true do
            local v262
            v260, v262 = v258(v259, v260)
            if v260 == nil then
                break
            end
            table.insert(v261, v262.name .. ": " .. v262.id)
        end
        setclipboard(table.concat(v261, "\n"))
    end
end)
local function vu270()
    local v263 = vu192()
    vu256.Refresh(v263, 1)
    if vu234 then
        local v264 = vu233(vu234)
        local v265, v266, v267 = ipairs(v264)
        local v268 = {}
        while true do
            local v269
            v267, v269 = v265(v266, v267)
            if v267 == nil then
                break
            end
            table.insert(v268, v269.name .. ": " .. v269.id)
        end
        vu242.Refresh(v268, 1)
    end
end
v151:CreateButton("Refresh Player", function()
    vu270()
end)
v151:CreateButton("Dex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/MDD.lua"))()
end)
local vu271 = false
local vu272 = nil
local function vu275()
    vu271 = true
    local v273 = vu152.Character
    if v273 and v273:FindFirstChild("Humanoid") then
        local vu274 = v273.Humanoid
        vu274.Sit = false
        if vu272 then
            vu272:Disconnect()
        end
        vu272 = vu274:GetPropertyChangedSignal("Sit"):Connect(function()
            if vu274.Sit then
                vu274.Sit = false
                vu274:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end)
    end
end
local function vu276()
    vu271 = false
    if vu272 then
        vu272:Disconnect()
        vu272 = nil
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu271 then
        vu275()
    end
end)
v151:CreateToggle("Antisit", function(p277)
    if p277 then
        vu275()
    else
        vu276()
    end
end)
local vu278 = false
local function vu279()
    vu278 = true
    vu156:SetCore("ResetButtonCallback", true)
end
local function vu280()
    vu278 = false
    vu156:SetCore("ResetButtonCallback", false)
end
v151:CreateToggle("Enable Reset", function(p281)
    if p281 then
        vu279()
    else
        vu280()
    end
end)
local vu282 = true
local function vu283()
    vu282 = true
    vu156:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
end
local function vu284()
    vu282 = false
    vu156:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
end
v151:CreateToggle("Enable Leaderboard", function(p285)
    if p285 then
        vu283()
    else
        vu284()
    end
end)
local vu286 = false
local vu287 = nil
local function vu293()
    vu286 = true
    vu287 = vu154.Stepped:Connect(function()
        local v288 = vu152.Character
        if v288 then
            local v289, v290, v291 = pairs(v288:GetDescendants())
            while true do
                local v292
                v291, v292 = v289(v290, v291)
                if v291 == nil then
                    break
                end
                if v292:IsA("BasePart") then
                    v292.CanCollide = false
                end
            end
        end
    end)
end
local function vu294()
    vu286 = false
    if vu287 then
        vu287:Disconnect()
        vu287 = nil
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu286 then
        vu293()
    end
end)
v151:CreateToggle("Noclip", function(p295)
    if p295 then
        vu293()
    else
        vu294()
    end
end)
local vu296 = false
local vu297 = 50
local vu298 = nil
local vu299 = false
local vu300 = false
local function vu304()
    local v301 = Instance.new("ScreenGui")
    v301.Name = "FlyControls"
    v301.Parent = game.CoreGui
    local v302 = Instance.new("TextButton")
    v302.Size = UDim2.new(0, 50, 0, 50)
    v302.Position = UDim2.new(0.9, - 60, 0.7, - 60)
    v302.Text = "\239\191\189\239\191\189"
    v302.Parent = v301
    v302.MouseButton1Down:Connect(function()
        vu299 = true
    end)
    v302.MouseButton1Up:Connect(function()
        vu299 = false
    end)
    local v303 = Instance.new("TextButton")
    v303.Size = UDim2.new(0, 50, 0, 50)
    v303.Position = UDim2.new(0.9, - 60, 0.7, 0)
    v303.Text = "\239\191\189\239\191\189"
    v303.Parent = v301
    v303.MouseButton1Down:Connect(function()
        vu300 = true
    end)
    v303.MouseButton1Up:Connect(function()
        vu300 = false
    end)
    return v301
end
local function vu313()
    vu296 = true
    local v305 = vu152.Character
    if v305 and v305:FindFirstChild("HumanoidRootPart") then
        local vu306 = v305.HumanoidRootPart
        local vu307 = v305:FindFirstChild("Humanoid")
        local vu308 = Instance.new("BodyVelocity")
        vu308.MaxForce = Vector3.new(100000, 100000, 100000)
        vu308.Parent = vu306
        local vu309 = Instance.new("BodyGyro")
        vu309.MaxTorque = Vector3.new(100000, 100000, 100000)
        vu309.Parent = vu306
        if vu157.TouchEnabled then
            vu304()
        end
        vu298 = vu154.RenderStepped:Connect(function()
            if vu307 then
                vu307.PlatformStand = true
                local v310 = Vector3.new()
                local v311 = vu153.CFrame.LookVector
                local v312 = vu307.MoveDirection * vu297
                if vu157:IsKeyDown(Enum.KeyCode.Space) or vu299 then
                    v310 = v310 + Vector3.new(0, vu297, 0)
                end
                if vu157:IsKeyDown(Enum.KeyCode.LeftShift) or vu300 then
                    v310 = v310 - Vector3.new(0, vu297, 0)
                end
                vu308.Velocity = v312 + v310
                vu309.CFrame = CFrame.new(vu306.Position, vu306.Position + v311)
            end
        end)
    end
end
local function vu321()
    vu296 = false
    if vu298 then
        vu298:Disconnect()
        vu298 = nil
    end
    local v314 = vu152.Character
    if v314 then
        local v315 = v314:FindFirstChild("HumanoidRootPart")
        if v315 then
            local v316, v317, v318 = pairs(v315:GetChildren())
            while true do
                local v319
                v318, v319 = v316(v317, v318)
                if v318 == nil then
                    break
                end
                if v319:IsA("BodyVelocity") or v319:IsA("BodyGyro") then
                    v319:Destroy()
                end
            end
        end
        local v320 = v314:FindFirstChild("Humanoid")
        if v320 then
            v320.PlatformStand = false
        end
    end
    if game.CoreGui:FindFirstChild("FlyControls") then
        game.CoreGui.FlyControls:Destroy()
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu296 then
        vu313()
    end
end)
v151:CreateToggle("Fly", function(p322)
    if p322 then
        vu313()
    else
        vu321()
    end
end)
v151:CreateSlider("Fly Speed", 10, 200, 50, false, function(p323)
    vu297 = p323
end)
local vu324 = false
local function vu326()
    vu324 = true
    local v325 = vu152.Character
    if v325 and v325:FindFirstChild("HumanoidRootPart") then
        v325.HumanoidRootPart.Anchored = true
    end
end
local function vu328()
    vu324 = false
    local v327 = vu152.Character
    if v327 and v327:FindFirstChild("HumanoidRootPart") then
        v327.HumanoidRootPart.Anchored = false
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu324 then
        vu326()
    end
end)
v151:CreateToggle("Lock Position", function(p329)
    if p329 then
        vu326()
    else
        vu328()
    end
end)
v150:CreateButton("Teleport Tool", function()
    local v330 = Instance.new("Tool")
    v330.Name = "TeleportTool"
    v330.RequiresHandle = false
    v330.Parent = vu152.Backpack
    v330.Activated:Connect(function()
        local v331 = vu152:GetMouse().Hit.Position
        local v332 = vu152.Character
        if v332 and v332:FindFirstChild("HumanoidRootPart") then
            v332.HumanoidRootPart.CFrame = CFrame.new(v331 + Vector3.new(0, 5, 0))
        end
    end)
end)
v150:CreateSlider("Gravity Changer", 0, 196.2, workspace.Gravity, false, function(p333)
    workspace.Gravity = p333
end)
local vu334 = false
local vu335 = {}
local function vu345()
    vu334 = true
    local v336 = vu159
    local v337, v338, v339 = pairs(v336:GetPlayers())
    while true do
        local v340
        v339, v340 = v337(v338, v339)
        if v339 == nil then
            break
        end
        if v340 ~= vu152 and v340.Character then
            local v341 = Instance.new("Highlight")
            v341.Name = "ESPHighlight"
            v341.FillColor = Color3.new(1, 0, 0)
            v341.OutlineColor = Color3.new(1, 1, 0)
            v341.Parent = v340.Character
            vu335[v340] = v341
        end
    end
    vu159.PlayerAdded:Connect(function(pu342)
        if vu334 and pu342 ~= vu152 then
            pu342.CharacterAdded:Connect(function(p343)
                local v344 = Instance.new("Highlight")
                v344.Name = "ESPHighlight"
                v344.FillColor = Color3.new(1, 0, 0)
                v344.OutlineColor = Color3.new(1, 1, 0)
                v344.Parent = p343
                vu335[pu342] = v344
            end)
        end
    end)
end
local function vu350()
    vu334 = false
    local v346, v347, v348 = pairs(vu335)
    while true do
        local v349
        v348, v349 = v346(v347, v348)
        if v348 == nil then
            break
        end
        if v349 then
            v349:Destroy()
        end
    end
    vu335 = {}
end
v151:CreateToggle("ESP", function(p351)
    if p351 then
        vu345()
    else
        vu350()
    end
end)
local vu352 = false
local vu353 = nil
local function vu356()
    vu352 = true
    vu353 = vu154.Stepped:Connect(function()
        local v354 = vu152.Character
        if v354 and v354:FindFirstChild("Humanoid") then
            local v355 = v354.Humanoid
            v355.MaxHealth = math.huge
            v355.Health = math.huge
        end
    end)
end
local function vu359()
    vu352 = false
    if vu353 then
        vu353:Disconnect()
        vu353 = nil
    end
    local v357 = vu152.Character
    if v357 and v357:FindFirstChild("Humanoid") then
        local v358 = v357.Humanoid
        v358.MaxHealth = 100
        v358.Health = 100
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu352 then
        vu356()
    end
end)
v151:CreateToggle("God Mode", function(p360)
    if p360 then
        vu356()
    else
        vu359()
    end
end)
local vu361 = false
local vu362 = 10
local vu363 = {}
local function vu373()
    vu361 = true
    local v364 = vu159
    local v365, v366, v367 = pairs(v364:GetPlayers())
    while true do
        local v368
        v367, v368 = v365(v366, v367)
        if v367 == nil then
            break
        end
        if v368 ~= vu152 and v368.Character then
            local v369 = v368.Character:FindFirstChild("Head")
            if v369 then
                v369.Size = Vector3.new(vu362, vu362, vu362)
                v369.Transparency = 0.7
                v369.CanCollide = false
                vu363[v368] = v369
            end
        end
    end
    vu159.PlayerAdded:Connect(function(pu370)
        if vu361 and pu370 ~= vu152 then
            pu370.CharacterAdded:Connect(function(p371)
                local v372 = p371:WaitForChild("Head")
                v372.Size = Vector3.new(vu362, vu362, vu362)
                v372.Transparency = 0.7
                v372.CanCollide = false
                vu363[pu370] = v372
            end)
        end
    end)
end
local function vu378()
    vu361 = false
    local v374, v375, v376 = pairs(vu363)
    while true do
        local v377
        v376, v377 = v374(v375, v376)
        if v376 == nil then
            break
        end
        if v377 then
            v377.Size = Vector3.new(2, 1, 1)
            v377.Transparency = 0
            v377.CanCollide = true
        end
    end
    vu363 = {}
end
v151:CreateToggle("Hitbox Expander", function(p379)
    if p379 then
        vu373()
    else
        vu378()
    end
end)
v151:CreateSlider("Hitbox Size", 5, 500, 10, false, function(p380)
    vu362 = p380
    if vu361 then
        vu378()
        vu373()
    end
end)
local vu381 = false
local vu382 = nil
local function vu384()
    vu381 = true
    vu382 = vu157.JumpRequest:Connect(function()
        local v383 = vu152.Character
        if v383 and v383:FindFirstChild("Humanoid") then
            v383.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end
local function vu385()
    vu381 = false
    if vu382 then
        vu382:Disconnect()
        vu382 = nil
    end
end
v151:CreateToggle("Infinite Jump", function(p386)
    if p386 then
        vu384()
    else
        vu385()
    end
end)
local vu387 = false
local vu388 = 50
local vu389 = nil
local function vu393()
    vu387 = true
    local v390 = vu152.Character
    if v390 and v390:FindFirstChild("HumanoidRootPart") then
        local vu391 = v390.HumanoidRootPart
        vu389 = vu154.RenderStepped:Connect(function(p392)
            vu391.CFrame = vu391.CFrame * CFrame.Angles(0, math.rad(vu388) * p392, 0)
        end)
    end
end
local function vu394()
    vu387 = false
    if vu389 then
        vu389:Disconnect()
        vu389 = nil
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu387 then
        vu393()
    end
end)
v150:CreateToggle("Spinner", function(p395)
    if p395 then
        vu393()
    else
        vu394()
    end
end)
v150:CreateSlider("Spin Speed", 10, 1000, 50, false, function(p396)
    vu388 = p396
end)
local vu397 = false
local vu398 = nil
local function vu401()
    vu397 = true
    vu398 = vu154.Stepped:Connect(function()
        local v399 = vu152.Character
        if v399 and v399:FindFirstChild("HumanoidRootPart") then
            local v400 = v399.HumanoidRootPart
            v400.Velocity = Vector3.new(0, v400.Velocity.Y, 0)
            v400.RotVelocity = Vector3.new(0, 0, 0)
        end
    end)
end
local function vu402()
    vu397 = false
    if vu398 then
        vu398:Disconnect()
        vu398 = nil
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu397 then
        vu401()
    end
end)
v151:CreateToggle("Anti-Knockback", function(p403)
    if p403 then
        vu401()
    else
        vu402()
    end
end)
local vu404 = false
local vu405 = {}
local function vu410()
    vu404 = true
    local v406, v407, v408 = pairs(workspace:GetDescendants())
    while true do
        local v409
        v408, v409 = v406(v407, v408)
        if v408 == nil then
            break
        end
        if v409:IsA("BasePart") and not (v409:IsDescendantOf(vu152.Character) or v409:IsA("Terrain")) then
            vu405[v409] = v409.Transparency
            v409.Transparency = 0.8
        end
    end
end
local function vu415()
    vu404 = false
    local v411, v412, v413 = pairs(vu405)
    while true do
        local v414
        v413, v414 = v411(v412, v413)
        if v413 == nil then
            break
        end
        if v413 and v413.Parent then
            v413.Transparency = v414
        end
    end
    vu405 = {}
end
v151:CreateToggle("X-Ray", function(p416)
    if p416 then
        vu410()
    else
        vu415()
    end
end)
local function vu418(p417)
    if p417 then
        vu160.ClockTime = 12
    else
        vu160.ClockTime = 0
    end
end
v151:CreateToggle("Day/Night Changer", function(p419)
    vu418(p419)
end)
v151:CreateSlider("FOV Changer", 10, 120, vu153.FieldOfView, false, function(p420)
    vu153.FieldOfView = p420
end)
local vu421 = false
local function vu428()
    vu421 = true
    local v422 = vu152.Character
    if v422 and v422:FindFirstChild("Head") then
        v422.Head.Transparency = 1
        local v423, v424, v425 = pairs(v422:GetChildren())
        while true do
            local v426
            v425, v426 = v423(v424, v425)
            if v425 == nil then
                break
            end
            if v426:IsA("Accessory") and v426:FindFirstChild("Handle") then
                local v427 = v426.Handle
                if v427:FindFirstChild("FaceFrontAttachment") then
                    v427.Transparency = 1
                end
            end
        end
    end
end
local function vu435()
    vu421 = false
    local v429 = vu152.Character
    if v429 and v429:FindFirstChild("Head") then
        v429.Head.Transparency = 0
        local v430, v431, v432 = pairs(v429:GetChildren())
        while true do
            local v433
            v432, v433 = v430(v431, v432)
            if v432 == nil then
                break
            end
            if v433:IsA("Accessory") and v433:FindFirstChild("Handle") then
                local v434 = v433.Handle
                if v434:FindFirstChild("FaceFrontAttachment") then
                    v434.Transparency = 0
                end
            end
        end
    end
end
vu152.CharacterAdded:Connect(function(_)
    if vu421 then
        vu428()
    end
end)
v151:CreateToggle("Headless (Visual)", function(p436)
    if p436 then
        vu428()
    else
        vu435()
    end
end)
local function vu442()
    local vu437 = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local v438, v439 = pcall(function()
        return vu158:GetAsync(vu437)
    end)
    if v438 then
        local v440 = vu158:JSONDecode(v439).data
        if # v440 <= 0 then
            Library:CreateNotification("Error", "I can\'t find any server", 4)
        else
            local v441 = v440[math.random(1, # v440)]
            vu155:TeleportToPlaceInstance(game.PlaceId, v441.id, vu152)
        end
    else
        Library:CreateNotification("Error", "I can\'t fetch any server..", 5)
    end
end
v151:CreateButton("Server Hop", function()
    Library:CreateNotification("Confirmation", "Hop to a new server?", 5, {
        "Yes",
        "No"
    }, {
        function()
            Library:CreateNotification("Looking For a new server...", "Please wait..", 10)
            vu442()
        end,
        nil
    })
end)
v151:CreateButton("Rejoin", function()
    Library:CreateNotification("Confirmation", "Rejoin the game?", 5, {
        "Yes",
        "No"
    }, {
        function()
            Library:CreateNotification("Rejoining this server...", "Please wait..", 10)
            vu155:Teleport(game.PlaceId, vu152)
        end,
        nil
    })
end)
v151:CreateButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
v151:CreateButton("Respawn", function()
    local v443 = vu152.Character
    if v443 and v443:FindFirstChild("Humanoid") then
        local v444 = v443.Humanoid
        v444:TakeDamage(v444.Health)
        task.wait(0.1)
        vu152:LoadCharacter()
        vu156:SetCore("SendNotification", {
            Title = "Respawn",
            Text = "Respawned!",
            Duration = 2
        })
    end
end)
print("\nTested & working on:\nUltra hatching simulator X\nClick game X\nPet hatching simulator 99\nClickers Adventure\nClicker adventure\nSecret Tappers\nMysterious Hatchers X\nClicker legends\nTapping Master\nMega Hatchers X\nUltimate tappers\npet tappers\nPet hatchers X\ntapping gods\nGodly tappers 99\nslushy tappers\ntapping mayhem\negg tappers\nWWII Tycoon\nUndead-Rising-Tycoon\nProtect the house\nprison mining simulator\npyro playground\ninfections battleground\nThe-1-000-000-Glass-Bridge\nReborn as Driller")
local Section = v148:CreateSection("Game List")
local Sec = v148:CreateSection("Teleport")
local gm = {
["Reborn As driller"] = 121280127579038,
["Protect the house"] = 77477180745179,
["Block Incremental"]=71718181,
["Fun squid game! glass bridge 2"] = 85532644946801,
["The $1000000 glass bridge"] = 87854376962069,
["Prison mining simulator"] = 94886636839149,
["Golden Clickers"] = 14076010618,
["Clickers Adventure"] = 92774394395352,
["Luck! Clickers Adventures!"] = 87557890946310,
["New Clicker Adventure"] = 116303778461334,
["Secret Tappers"] = 127613395571937,
["Mysterious Hatchers"] = 136326314793427,
["Clicker Legends"] = 79760109249873,
["Guess the killer"] = 9171716118,
["Click Game X"] = 124553710181976,
["Tapping Masters"] = 108202498211862,
["Mega Hatchers X"] = 101897028138084,
["Pet hatching simulator reborn"] = 82183747344203,
["Pet Hatchers X"] = 16168601525,
["Tapping Gods"] = 95941360258087,
["Godly Tappers 99"] = 17757552010,
["Pet Hatching Simulator 99"] = 94640462621211,
["Ultra pet hatching simulator X"] = 123345140331667
}

local selectedGame = nil
local Label = Sec:CreateLabel("SelectedGame", "Selected:\nNone")

for gameName, _ in pairs(gm) do Section:CreateLabel(gameName, gameName, function() selectedGame = gameName Label.ChangeText("Selected: " .. gameName) end, {holdColor = true}) end


Sec:CreateButton("Teleport to Game", function() if selectedGame and gm[selectedGame] then local gameId = gm[selectedGame] game:GetService("TeleportService"):Teleport(gameId, game.Players.LocalPlayer) else Library:CreateNotification("Error", "Please select a game first!", 3) end end)
local v445 = Instance.new("ScreenGui")
v445.Name = "CustomNotification"
v445.Parent = game.CoreGui
local v446 = Instance.new("Frame")
v446.Size = UDim2.new(0, 300, 0, 50)
v446.Position = UDim2.new(1, - 320, 1, - 100)
v446.AnchorPoint = Vector2.new(1, 1)
v446.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
v446.BackgroundTransparency = 0.2
v446.Parent = v445
local v447 = Instance.new("TextLabel")
v447.Size = UDim2.new(1, - 50, 1, 0)
v447.Position = UDim2.new(0, 50, 0, 0)
v447.Font = Enum.Font.SourceSansBold
v447.Text = "Thank you for using my script!\nif you don\'t mind give me a like on the website"
v447.TextColor3 = Color3.fromRGB(255, 255, 255)
v447.TextSize = 16
v447.TextXAlignment = Enum.TextXAlignment.Left
v447.TextYAlignment = Enum.TextYAlignment.Center
v447.BackgroundTransparency = 1
v447.Parent = v446
local v448 = Instance.new("ImageLabel")
v448.Size = UDim2.new(0, 40, 0, 40)
v448.Position = UDim2.new(0, 5, 0.5, - 20)
v448.Image = "rbxassetid://316605349"
v448.BackgroundTransparency = 1
v448.Parent = v446
v446.Position = UDim2.new(1, 0, 1, - 100)
v446:TweenPosition(UDim2.new(1, - 320, 1, - 100), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
Library:CreateNotification("Thank you for using my script", "This script made by Rndm.\nLibrary Version: Beta", 5, {
    "Alright",
    "That\'s cool"
})
task.wait(6)
v446:TweenPosition(UDim2.new(1, 0, 1, - 100), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
task.wait(0.5)
v445:Destroy()
Library:CreateText({
    "Support me: PayPal rectnob29@gmail.com. Thank you for your support.",
    "Enjoying the script? Feel free to support me :)",
    "Follow me: @sucipto19454",
    "Also my friend!: @lam_Chloeslay"
}, 3, "#FF0000")
