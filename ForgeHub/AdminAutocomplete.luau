repeat
    task.wait()
until game:IsLoaded()
task.wait(5)
local v1 = Instance.new("ScreenGui")
local v2 = Instance.new("Frame")
local v3 = Instance.new("UICorner")
local v4 = Instance.new("TextLabel")
local vu5 = Instance.new("TextLabel")
local vu6 = Instance.new("Frame")
local v7 = Instance.new("TextLabel")
local vu8 = Instance.new("TextLabel")
local v9 = Instance.new("TextLabel")
local vu10 = Instance.new("TextButton")
Instance.new("TextButton")
Instance.new("TextButton")
Instance.new("TextLabel")
Instance.new("TextLabel")
v1.Name = "FH"
v1.Parent = game:GetService("CoreGui")
v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v2.Parent = v1
v2.AnchorPoint = Vector2.new(0.5, 0.5)
v2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
v2.BorderSizePixel = 0
v2.Position = UDim2.new(0.5, 0, 0.5, 0)
v2.Size = UDim2.new(0, 199, 0, 65)
v3.Parent = v2
v4.Name = "Title"
v4.Parent = v2
v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v4.BackgroundTransparency = 1
v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
v4.BorderSizePixel = 0
v4.Size = UDim2.new(0, 199, 0, - 22)
v4.Font = Enum.Font.SourceSansBold
v4.Text = "Forge Hub Admin Trial Completer"
v4.TextColor3 = Color3.fromRGB(255, 255, 255)
v4.TextScaled = true
v4.TextSize = 14
v4.TextStrokeTransparency = 0
v4.TextWrapped = true
vu6.Name = "StatusFrame"
vu6.Parent = v2
vu6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu6.BackgroundTransparency = 0.9
vu6.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu6.BorderSizePixel = 0
vu6.Position = UDim2.new(0, 12, 0, 14)
vu6.Size = UDim2.new(0, 174, 0, 37)
vu6.Visible = false
v7.Name = "STitle"
v7.Parent = vu6
v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v7.BackgroundTransparency = 1
v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
v7.BorderSizePixel = 0
v7.Position = UDim2.new(0.189100593, 0, - 0.0168564264, 0)
v7.Size = UDim2.new(0.616087079, 0, - 0.30277431, 0)
v7.Font = Enum.Font.SourceSans
v7.Text = "Status:"
v7.TextColor3 = Color3.fromRGB(255, 255, 255)
v7.TextScaled = true
v7.TextSize = 14
v7.TextWrapped = true
vu8.Name = "Status"
vu8.Parent = vu6
vu8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu8.BackgroundTransparency = 1
vu8.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu8.BorderSizePixel = 0
vu8.Position = UDim2.new(0.0799051896, 0, 0.85485512, 0)
vu8.Size = UDim2.new(0.868960679, 0, - 0.679133236, 0)
vu8.Font = Enum.Font.SourceSans
vu8.Text = "Waiting to Start"
vu8.TextColor3 = Color3.fromRGB(255, 255, 255)
vu8.TextScaled = true
vu8.TextSize = 14
vu8.TextWrapped = true
v9.Name = "cred"
v9.Parent = v2
v9.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
v9.BackgroundTransparency = 1
v9.BorderColor3 = Color3.fromRGB(0, 0, 0)
v9.BorderSizePixel = 0
v9.Position = UDim2.new(0, 92, 0, 63)
v9.Size = UDim2.new(0, 151, 0, - 12)
v9.Font = Enum.Font.SourceSansBold
v9.Text = "By Skuppy"
v9.TextColor3 = Color3.fromRGB(85, 85, 85)
v9.TextScaled = true
v9.TextSize = 14
v9.TextTransparency = 0.31
v9.TextWrapped = true
vu10.Name = "START"
vu10.Parent = v2
vu10.BackgroundColor3 = Color3.fromRGB(17, 255, 0)
vu10.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu10.BorderSizePixel = 0
vu10.Position = UDim2.new(0, 46, 0, 30)
vu10.Size = UDim2.new(0, 107, 0, - 29)
vu10.Font = Enum.Font.SourceSans
vu10.Text = "START"
vu10.TextColor3 = Color3.fromRGB(255, 255, 255)
vu10.TextScaled = true
vu10.TextSize = 14
vu10.TextStrokeTransparency = 0
vu10.TextWrapped = true
local vu11 = false
vu10.Activated:Connect(function()
    vu8.Text = "Starting"
    vu11 = true
    vu10:Destroy()
    vu6.Visible = true
    vu5:Destroy()
end)
local v12 = vu8
repeat
    task.wait()
until vu11 == true
local _ = game:GetService("Players").LocalPlayer
local v13 = tick()
while tick() - v13 < 1 do
    v12.Text = "Spoofing Completion"
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(504.135162, 80.9125443, 60.8649597, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    game:GetService("RunService").RenderStepped:Wait()
end
task.wait(3)
v12.Text = "Wait 1 hour here for the badge. (ANTI AFK ON)"
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
	  game:GetService("VirtualUser"):ClickButton2(Vector2.zero)
end)
