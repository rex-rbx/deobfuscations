

 local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

--// Configuration
local FILENAME = "GalaxyUI_Config.json"
local DATA = {
    Tabs = {
        ["Main"] = {}
    }
}

--// Save/Load System (Exploit Environment Check)
local function SaveData()
    if writefile then
        pcall(function()
            writefile(FILENAME, HttpService:JSONEncode(DATA))
        end)
    end
end

local function LoadData()
    if readfile and isfile and isfile(FILENAME) then
        pcall(function()
            DATA = HttpService:JSONDecode(readfile(FILENAME))
        end)
    end
end
LoadData()

--// UI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GalaxyLoader"
ScreenGui.ResetOnSpawn = false
pcall(function()
    ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")
end)

--// Icons
local ICONS = {
    Plus = "rbxassetid://6031154871",
    Close = "rbxassetid://6031094678",
    Play = "rbxassetid://6031091004",
    Settings = "rbxassetid://6031280882",
    Galaxy = "rbxassetid://6444300500" -- Galaxy texture
}

--// Utilities
local function MakeDraggable(gui)
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        TweenService:Create(gui, TweenInfo.new(0.15), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
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

local function CreateRipple(btn)
    local circle = Instance.new("ImageLabel")
    circle.Name = "Ripple"
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.BackgroundTransparency = 0.6
    circle.BorderSizePixel = 0
    circle.ImageTransparency = 0.6
    circle.ZIndex = 10
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = circle
    circle.Parent = btn
    
    local x = Mouse.X - btn.AbsolutePosition.X
    local y = Mouse.Y - btn.AbsolutePosition.Y
    circle.Position = UDim2.new(0, x, 0, y)
    
    local newSize = UDim2.new(0, math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2, 0, math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2)
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenSize = TweenService:Create(circle, tweenInfo, {Size = newSize, Position = UDim2.new(0, x - (newSize.X.Offset/2), 0, y - (newSize.Y.Offset/2)), BackgroundTransparency = 1})
    
    tweenSize:Play()
    game:GetService("Debris"):AddItem(circle, 0.5)
end

--// The Rainbow Button
local OpenBtn = Instance.new("ImageButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OpenBtn.Parent = ScreenGui
MakeDraggable(OpenBtn)

local OpenBtnCorner = Instance.new("UICorner", OpenBtn)
OpenBtnCorner.CornerRadius = UDim.new(1, 0)

local RainbowGradient = Instance.new("UIGradient")
RainbowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255,127,0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255,255,0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0,255,0)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(143,0,255))
})
RainbowGradient.Parent = OpenBtn

local OpenIcon = Instance.new("ImageLabel", OpenBtn)
OpenIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
OpenIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
OpenIcon.BackgroundTransparency = 1
OpenIcon.Image = ICONS.Settings
OpenIcon.ImageColor3 = Color3.new(1,1,1)

-- Rainbow Loop
RunService.RenderStepped:Connect(function()
    RainbowGradient.Rotation = (RainbowGradient.Rotation + 2) % 360
end)

--// Main UI Structure
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainUI"
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Starts closed
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.ClipsDescendants = true
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Parent = ScreenGui
MainFrame.Visible = false
MakeDraggable(MainFrame)

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

local GalaxyBG = Instance.new("ImageLabel", MainFrame)
GalaxyBG.Size = UDim2.new(1, 0, 1, 0)
GalaxyBG.Image = ICONS.Galaxy
GalaxyBG.ImageTransparency = 0.6
GalaxyBG.BackgroundTransparency = 1
GalaxyBG.ScaleType = Enum.ScaleType.Slice
GalaxyBG.ZIndex = 0

local Sidebar = Instance.new("ScrollingFrame", MainFrame)
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 120, 1, -40)
Sidebar.Position = UDim2.new(0, 10, 0, 10)
Sidebar.BackgroundTransparency = 0.5
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Sidebar.ScrollBarThickness = 2
Sidebar.BorderSizePixel = 0

local SideList = Instance.new("UIListLayout", Sidebar)
SideList.Padding = UDim.new(0, 5)
SideList.SortOrder = Enum.SortOrder.LayoutOrder

local ContentArea = Instance.new("Frame", MainFrame)
ContentArea.Name = "Content"
ContentArea.Size = UDim2.new(1, -150, 1, -40)
ContentArea.Position = UDim2.new(0, 140, 0, 10)
ContentArea.BackgroundTransparency = 1

local AddScriptBtn = Instance.new("TextButton", MainFrame)
AddScriptBtn.Name = "AddScript"
AddScriptBtn.Size = UDim2.new(0, 120, 0, 25)
AddScriptBtn.Position = UDim2.new(0, 10, 1, -35)
AddScriptBtn.BackgroundColor3 = Color3.fromRGB(40, 200, 40)
AddScriptBtn.Text = "Add Tab / Script"
AddScriptBtn.TextColor3 = Color3.new(1,1,1)
AddScriptBtn.Font = Enum.Font.GothamBold
AddScriptBtn.TextSize = 11
Instance.new("UICorner", AddScriptBtn).CornerRadius = UDim.new(0, 6)

--// Scripting the UI Logic
local CurrentTab = "Main"
local LoadedTabs = {} -- Keep track of UI elements

local CreatorFrame = Instance.new("Frame", MainFrame)
CreatorFrame.Name = "Creator"
CreatorFrame.Size = UDim2.new(1, 0, 1, 0)
CreatorFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
CreatorFrame.BackgroundTransparency = 0.2
CreatorFrame.Visible = false
CreatorFrame.ZIndex = 5
Instance.new("UICorner", CreatorFrame).CornerRadius = UDim.new(0, 15)

local CreatorBox = Instance.new("Frame", CreatorFrame)
CreatorBox.Size = UDim2.new(0, 300, 0, 250)
CreatorBox.Position = UDim2.new(0.5, 0, 0.5, 0)
CreatorBox.AnchorPoint = Vector2.new(0.5, 0.5)
CreatorBox.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Instance.new("UICorner", CreatorBox).CornerRadius = UDim.new(0, 8)

local NameInput = Instance.new("TextBox", CreatorBox)
NameInput.PlaceholderText = "Script/Tab Name"
NameInput.Size = UDim2.new(0.9, 0, 0, 30)
NameInput.Position = UDim2.new(0.05, 0, 0.1, 0)
NameInput.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
NameInput.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", NameInput).CornerRadius = UDim.new(0, 4)

local CodeInput = Instance.new("TextBox", CreatorBox)
CodeInput.PlaceholderText = "Code here (Leave empty for new Tab)"
CodeInput.Size = UDim2.new(0.9, 0, 0, 120)
CodeInput.Position = UDim2.new(0.05, 0, 0.25, 0)
CodeInput.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
CodeInput.TextColor3 = Color3.new(1,1,1)
CodeInput.TextYAlignment = Enum.TextYAlignment.Top
CodeInput.MultiLine = true
CodeInput.ClearTextOnFocus = false
Instance.new("UICorner", CodeInput).CornerRadius = UDim.new(0, 4)

local SaveConfigBtn = Instance.new("TextButton", CreatorBox)
SaveConfigBtn.Text = "SAVE"
SaveConfigBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
SaveConfigBtn.Size = UDim2.new(0.4, 0, 0, 30)
SaveConfigBtn.Position = UDim2.new(0.55, 0, 0.8, 0)
SaveConfigBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", SaveConfigBtn).CornerRadius = UDim.new(0, 4)

local CancelConfigBtn = Instance.new("TextButton", CreatorBox)
CancelConfigBtn.Text = "CANCEL"
CancelConfigBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CancelConfigBtn.Size = UDim2.new(0.4, 0, 0, 30)
CancelConfigBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
CancelConfigBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", CancelConfigBtn).CornerRadius = UDim.new(0, 4)

--// Animation Function
local function AnimateOpen(frame, targetSize)
    if frame.Visible then
        TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
        task.wait(0.5)
        frame.Visible = false
    else
        frame.Visible = true
        frame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    end
end

--// Logic
local function RefreshUI()
    -- Clear existing
    for _, v in pairs(Sidebar:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(ContentArea:GetChildren()) do v:Destroy() end

    -- Create Tab Buttons
    for tabName, _ in pairs(DATA.Tabs) do
        local btn = Instance.new("TextButton", Sidebar)
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.BackgroundColor3 = (CurrentTab == tabName and Color3.fromRGB(100, 100, 200) or Color3.fromRGB(40, 40, 50))
        btn.Text = tabName
        btn.TextColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        
        btn.MouseButton1Click:Connect(function()
            CreateRipple(btn)
            CurrentTab = tabName
            RefreshUI()
        end)
    end

    -- Load Scripts into Content
    local ScrollingContent = Instance.new("ScrollingFrame", ContentArea)
    ScrollingContent.Size = UDim2.new(1, 0, 1, 0)
    ScrollingContent.BackgroundTransparency = 1
    ScrollingContent.ScrollBarThickness = 2
    local List = Instance.new("UIListLayout", ScrollingContent)
    List.Padding = UDim.new(0, 5)

    local currentScripts = DATA.Tabs[CurrentTab] or {}
    
    for i, scriptData in ipairs(currentScripts) do
        local scriptFrame = Instance.new("Frame", ScrollingContent)
        scriptFrame.Size = UDim2.new(1, 0, 0, 40)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        Instance.new("UICorner", scriptFrame).CornerRadius = UDim.new(0, 6)

        local lbl = Instance.new("TextLabel", scriptFrame)
        lbl.Text = scriptData.name
        lbl.Size = UDim2.new(0.6, 0, 1, 0)
        lbl.Position = UDim2.new(0.05, 0, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.new(1,1,1)
        lbl.Font = Enum.Font.GothamSemibold
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local runBtn = Instance.new("TextButton", scriptFrame)
        runBtn.Size = UDim2.new(0, 35, 0, 35)
        runBtn.Position = UDim2.new(0.85, 0, 0.5, 0)
        runBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        runBtn.Text = ""
        runBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        Instance.new("UICorner", runBtn).CornerRadius = UDim.new(0, 8)
        
        local ico = Instance.new("ImageLabel", runBtn)
        ico.Image = ICONS.Play
        ico.Size = UDim2.new(0.6, 0, 0.6, 0)
        ico.AnchorPoint = Vector2.new(0.5, 0.5)
        ico.Position = UDim2.new(0.5, 0, 0.5, 0)
        ico.BackgroundTransparency = 1

        runBtn.MouseButton1Click:Connect(function()
            CreateRipple(runBtn)
            if loadstring then
                task.spawn(function()
                    local func, err = loadstring(scriptData.script)
                    if func then func() else warn(err) end
                end)
            else
                warn("Loadstring not supported on this executor/game.")
            end
        end)
    end
    
    List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingContent.CanvasSize = UDim2.new(0, 0, 0, List.AbsoluteContentSize.Y)
    end)
end

--// Button Events
OpenBtn.MouseButton1Click:Connect(function()
    AnimateOpen(MainFrame, UDim2.new(0, 500, 0, 300))
end)

AddScriptBtn.MouseButton1Click:Connect(function()
    CreatorFrame.Visible = true
    NameInput.Text = ""
    CodeInput.Text = ""
end)

CancelConfigBtn.MouseButton1Click:Connect(function()
    CreatorFrame.Visible = false
end)

SaveConfigBtn.MouseButton1Click:Connect(function()
    local name = NameInput.Text
    local code = CodeInput.Text
    
    if name == "" then return end
    
    if code == "" or code:match("^%s*$") then
        -- Create New Tab
        if not DATA.Tabs[name] then
            DATA.Tabs[name] = {}
        end
    else
        -- Create Script in Current Tab
        table.insert(DATA.Tabs[CurrentTab], {name = name, script = code})
    end
    
    SaveData()
    CreatorFrame.Visible = false
    RefreshUI()
end)

-- Initial Load
RefreshUI()
