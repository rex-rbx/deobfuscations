repeat
    task.wait()
until game:IsLoaded()
local v1 = loadstring([=[local library = {
	flags = {}, 
	items = {}
}

local runservice = cloneref(game:GetService("RunService"))
local userinputservice = cloneref(game:GetService("UserInputService"))
local tweenservice = cloneref(game:GetService("TweenService"))
local textservice = cloneref(game:GetService("TextService"))
local coregui = cloneref(game:GetService("CoreGui"))
local httpservice = cloneref(game:GetService("HttpService"))
local workspace2 = cloneref(game:GetService("Workspace"))
local guiservice = cloneref(game:GetService("GuiService"))
local marketplaceservice = cloneref(game:GetService("MarketplaceService"))

local players = cloneref(game:GetService("Players"))
local mouse = players.LocalPlayer:GetMouse()

library.theme = {
	fontsize = 17, 
	titlesize = 18, 
	font = Enum.Font.Code, 
	background = "rbxassetid://0", 
	tilesize = 90, 
	cursor = false, 
	cursorimg = "https://t0.rbxcdn.com/42f66da98c40252ee151326a82aab51f", 
	backgroundcolor = Color3.fromRGB(20, 20, 20), 
	tabstextcolor = Color3.fromRGB(207, 207, 207), 
	bordercolor = Color3.fromRGB(75, 207, 255), 
	accentcolor = Color3.fromRGB(207, 207, 207), 
	accentcolor2 = Color3.fromRGB(108, 108, 108), 
	outlinecolor = Color3.fromRGB(20, 20, 20), 
	outlinecolor2 = Color3.fromRGB(30, 30, 30), 
	sectorcolor = Color3.fromRGB(30, 30, 30), 
	toptextcolor = Color3.fromRGB(255, 255, 255), 
	topheight = 48, 
	topcolor = Color3.fromRGB(30, 30, 30), 
	topcolor2 = Color3.fromRGB(12, 12, 12), 
	buttoncolor = Color3.fromRGB(49, 49, 49), 
	buttoncolor2 = Color3.fromRGB(29, 29, 29), 
	itemscolor = Color3.fromRGB(170, 170, 170), 
	itemscolor2 = Color3.fromRGB(255, 255, 255)
}

if library.theme.cursor then
	local success = pcall(function()
		library.cursor = Drawing.new("Image")
		library.cursor.Data = game:HttpGet(library.theme.cursorimg)
		library.cursor.Size = Vector2.new(64, 64)
		library.cursor.Visible = userinputservice.MouseEnabled
		library.cursor.Rounding = 0
		library.cursor.Position = Vector2.new(mouse.X - 32, mouse.Y + 6)
	end)

	if success and library.cursor then
		userinputservice.InputChanged:Connect(function(input)
			if userinputservice.MouseEnabled and input.UserInputType == Enum.UserInputType.MouseMovement then
				library.cursor.Position = Vector2.new(input.Position.X - 32, input.Position.Y + 7)
			end
		end)

		runservice.RenderStepped:Connect(function()
			userinputservice.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
			library.cursor.Visible = userinputservice.MouseEnabled and (userinputservice.MouseIconEnabled or guiservice.MenuIsOpen)
		end)

	elseif not success and library.cursor then
		library.cursor:Remove()
	end
end

function library:CreateWindow(name, size, hidebutton)
	local window = {}
	window.name = name or ""
	window.size = UDim2.fromOffset(size.X, size.Y) or UDim2.fromOffset(500, 600)
	window.hidebutton = hidebutton or Enum.KeyCode.RightShift
	window.theme = library.theme

	local updateevent = Instance.new("BindableEvent")
	function window:UpdateTheme(theme)
		updateevent:Fire(theme or library.theme)
		window.theme = (theme or library.theme)
	end

	window.Main = Instance.new("ScreenGui", gethui and gethui() or coregui)
	window.Main.Name = "RobloxGui"
	window.Main.DisplayOrder = 15

	local dragging, draginput2, dragstart2, startpos
	userinputservice.InputChanged:Connect(function(input)
		if input == draginput2 and dragging then
			local delta = input.Position - dragstart2
			window.Frame.Position = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
		end
	end)

	local dragstart = function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragstart2 = input.Position
			startpos = window.Frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end

	local dragend = function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			draginput2 = input
		end
	end

	window.Frame = Instance.new("TextButton", window.Main)
	window.Frame.Name = "main"
	window.Frame.Position = UDim2.fromScale(0.5, 0.5)
	window.Frame.BorderSizePixel = 0
	window.Frame.Size = window.size
	window.Frame.AutoButtonColor = false
	window.Frame.Text = ""
	window.Frame.BackgroundColor3 = window.theme.backgroundcolor
	window.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	updateevent.Event:Connect(function(theme)
		window.Frame.BackgroundColor3 = theme.backgroundcolor
	end)

	userinputservice.InputBegan:Connect(function(key)
		if key.KeyCode == window.hidebutton then
			window.Frame.Visible = not window.Frame.Visible
		end
	end)

	window.BlackOutline = Instance.new("Frame", window.Frame)
	window.BlackOutline.Name = "outline"
	window.BlackOutline.ZIndex = 1
	window.BlackOutline.Size = window.size + UDim2.fromOffset(2, 2)
	window.BlackOutline.BorderSizePixel = 0
	window.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
	window.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
	updateevent.Event:Connect(function(theme)
		window.BlackOutline.BackgroundColor3 = theme.outlinecolor2
	end)

	window.Outline = Instance.new("Frame", window.Frame)
	window.Outline.Name = "outline"
	window.Outline.ZIndex = 0
	window.Outline.Size = window.size + UDim2.fromOffset(4, 4)
	window.Outline.BorderSizePixel = 0
	window.Outline.BackgroundColor3 = window.theme.outlinecolor
	window.Outline.Position = UDim2.fromOffset(- 2, - 2)
	updateevent.Event:Connect(function(theme)
		window.Outline.BackgroundColor3 = theme.outlinecolor
	end)

	window.BlackOutline2 = Instance.new("Frame", window.Frame)
	window.BlackOutline2.Name = "outline"
	window.BlackOutline2.ZIndex = - 1
	window.BlackOutline2.Size = window.size + UDim2.fromOffset(6, 6)
	window.BlackOutline2.BorderSizePixel = 0
	window.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
	window.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
	updateevent.Event:Connect(function(theme)
		window.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
	end)

	window.TopBar = Instance.new("Frame", window.Frame)
	window.TopBar.Name = "top"
	window.TopBar.Size = UDim2.fromOffset(window.size.X.Offset, window.theme.topheight)
	window.TopBar.BorderSizePixel = 0
	window.TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	window.TopBar.InputBegan:Connect(dragstart)
	window.TopBar.InputChanged:Connect(dragend)
	updateevent.Event:Connect(function(theme)
		window.TopBar.Size = UDim2.fromOffset(window.size.X.Offset, theme.topheight)
	end)

	window.TopGradient = Instance.new("UIGradient", window.TopBar)
	window.TopGradient.Rotation = 90
	window.TopGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, window.theme.topcolor), ColorSequenceKeypoint.new(1, window.theme.topcolor2)})
	updateevent.Event:Connect(function(theme)
		window.TopGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, theme.topcolor), ColorSequenceKeypoint.new(1, theme.topcolor2)})
	end)

	window.NameLabel = Instance.new("TextLabel", window.TopBar)
	window.NameLabel.TextColor3 = window.theme.toptextcolor
	window.NameLabel.Text = window.name
	window.NameLabel.TextXAlignment = Enum.TextXAlignment.Left
	window.NameLabel.Font = window.theme.font
	window.NameLabel.Name = "title"
	window.NameLabel.Position = UDim2.fromOffset(4, - 2)
	window.NameLabel.BackgroundTransparency = 1
	window.NameLabel.Size = UDim2.fromOffset(190, window.TopBar.AbsoluteSize.Y / 2 - 2)
	window.NameLabel.TextSize = window.theme.titlesize
	updateevent.Event:Connect(function(theme)
		window.NameLabel.TextColor3 = theme.toptextcolor
		window.NameLabel.Font = theme.font
		window.NameLabel.TextSize = theme.titlesize
	end)

	window.Line2 = Instance.new("Frame", window.TopBar)
	window.Line2.Name = "line"
	window.Line2.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y / 2.1)
	window.Line2.Size = UDim2.fromOffset(window.size.X.Offset, 1)
	window.Line2.BorderSizePixel = 0
	window.Line2.BackgroundColor3 = window.theme.accentcolor
	updateevent.Event:Connect(function(theme)
		window.Line2.BackgroundColor3 = theme.accentcolor
	end)

	window.TabList = Instance.new("Frame", window.TopBar)
	window.TabList.Name = "tablist"
	window.TabList.BackgroundTransparency = 1
	window.TabList.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y / 2 + 1)
	window.TabList.Size = UDim2.fromOffset(window.size.X.Offset, window.TopBar.AbsoluteSize.Y / 2)
	window.TabList.BorderSizePixel = 0
	window.TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

	window.TabList.InputBegan:Connect(dragstart)
	window.TabList.InputChanged:Connect(dragend)

	window.BlackLine = Instance.new("Frame", window.Frame)
	window.BlackLine.Name = "blackline"
	window.BlackLine.Size = UDim2.fromOffset(window.size.X.Offset, 1)
	window.BlackLine.BorderSizePixel = 0
	window.BlackLine.ZIndex = 9
	window.BlackLine.BackgroundColor3 = window.theme.outlinecolor2
	window.BlackLine.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y)
	updateevent.Event:Connect(function(theme)
		window.BlackLine.BackgroundColor3 = theme.outlinecolor2
	end)

	window.BackgroundImage = Instance.new("ImageLabel", window.Frame)
	window.BackgroundImage.Name = "background"
	window.BackgroundImage.BorderSizePixel = 0
	window.BackgroundImage.ScaleType = Enum.ScaleType.Tile
	window.BackgroundImage.Position = window.BlackLine.Position + UDim2.fromOffset(0, 1)
	window.BackgroundImage.Size = UDim2.fromOffset(window.size.X.Offset, window.size.Y.Offset - window.TopBar.AbsoluteSize.Y - 1)
	window.BackgroundImage.Image = window.theme.background or ""
	window.BackgroundImage.ImageTransparency = window.BackgroundImage.Image ~= "" and 0 or 1
	window.BackgroundImage.ImageColor3 = Color3.new()
	window.BackgroundImage.BackgroundColor3 = window.theme.backgroundcolor
	window.BackgroundImage.TileSize = UDim2.new(0, window.theme.tilesize, 0, window.theme.tilesize)
	updateevent.Event:Connect(function(theme)
		window.BackgroundImage.Image = theme.background or ""
		window.BackgroundImage.ImageTransparency = window.BackgroundImage.Image ~= "" and 0 or 1
		window.BackgroundImage.BackgroundColor3 = theme.backgroundcolor
		window.BackgroundImage.TileSize = UDim2.new(0, theme.tilesize, 0, theme.tilesize)
	end)

	window.Line = Instance.new("Frame", window.Frame)
	window.Line.Name = "line"
	window.Line.Position = UDim2.fromOffset(0, 0)
	window.Line.Size = UDim2.fromOffset(60, 1)
	window.Line.BorderSizePixel = 0
	window.Line.BackgroundColor3 = window.theme.accentcolor
	updateevent.Event:Connect(function(theme)
		window.Line.BackgroundColor3 = theme.accentcolor
	end)

	window.ListLayout = Instance.new("UIListLayout", window.TabList)
	window.ListLayout.FillDirection = Enum.FillDirection.Horizontal
	window.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	window.OpenedColorPickers = {}
	window.Tabs = {}

	function window:CreateTab(name)
		local tab = {}
		tab.name = name or ""

		local size = textservice:GetTextSize(tab.name, window.theme.fontsize, window.theme.font, Vector2.new(200, 300))

		tab.TabButton = Instance.new("TextButton", window.TabList)
		tab.TabButton.TextColor3 = window.theme.tabstextcolor
		tab.TabButton.Text = tab.name
		tab.TabButton.AutoButtonColor = false
		tab.TabButton.Font = window.theme.font
		tab.TabButton.TextYAlignment = Enum.TextYAlignment.Center
		tab.TabButton.BackgroundTransparency = 1
		tab.TabButton.BorderSizePixel = 0
		tab.TabButton.Size = UDim2.fromOffset(size.X + 15, window.TabList.AbsoluteSize.Y - 1)
		tab.TabButton.Name = tab.name
		tab.TabButton.TextSize = window.theme.fontsize
		updateevent.Event:Connect(function(theme)
			local size = textservice:GetTextSize(tab.name, theme.fontsize, theme.font, Vector2.new(200, 300))
			tab.TabButton.TextColor3 = tab.TabButton.Name == "SelectedTab" and theme.accentcolor or theme.tabstextcolor
			tab.TabButton.Font = theme.font
			tab.TabButton.Size = UDim2.fromOffset(size.X + 15, window.TabList.AbsoluteSize.Y - 1)
			tab.TabButton.TextSize = theme.fontsize
		end)

		tab.Left = Instance.new("ScrollingFrame", window.Frame)
		tab.Left.Name = "leftside"
		tab.Left.BorderSizePixel = 0
		tab.Left.Size = UDim2.fromOffset(window.size.X.Offset / 2, window.size.Y.Offset - (window.TopBar.AbsoluteSize.Y + 1))
		tab.Left.BackgroundTransparency = 1
		tab.Left.Visible = false
		tab.Left.ScrollBarThickness = 0
		tab.Left.ScrollingDirection = "Y"
		tab.Left.Position = window.BlackLine.Position + UDim2.fromOffset(0, 1)

		tab.LeftListLayout = Instance.new("UIListLayout", tab.Left)
		tab.LeftListLayout.FillDirection = Enum.FillDirection.Vertical
		tab.LeftListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		tab.LeftListLayout.Padding = UDim.new(0, 12)

		tab.LeftListPadding = Instance.new("UIPadding", tab.Left)
		tab.LeftListPadding.PaddingTop = UDim.new(0, 12)
		tab.LeftListPadding.PaddingLeft = UDim.new(0, 12)
		tab.LeftListPadding.PaddingRight = UDim.new(0, 12)

		tab.Right = Instance.new("ScrollingFrame", window.Frame)
		tab.Right.Name = "rightside"
		tab.Right.ScrollBarThickness = 0
		tab.Right.ScrollingDirection = "Y"
		tab.Right.Visible = false
		tab.Right.BorderSizePixel = 0
		tab.Right.Size = UDim2.fromOffset(window.size.X.Offset / 2, window.size.Y.Offset - (window.TopBar.AbsoluteSize.Y + 1))
		tab.Right.BackgroundTransparency = 1
		tab.Right.Position = tab.Left.Position + UDim2.fromOffset(tab.Left.AbsoluteSize.X, 0)

		tab.RightListLayout = Instance.new("UIListLayout", tab.Right)
		tab.RightListLayout.FillDirection = Enum.FillDirection.Vertical
		tab.RightListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		tab.RightListLayout.Padding = UDim.new(0, 12)

		tab.RightListPadding = Instance.new("UIPadding", tab.Right)
		tab.RightListPadding.PaddingTop = UDim.new(0, 12)
		tab.RightListPadding.PaddingLeft = UDim.new(0, 6)
		tab.RightListPadding.PaddingRight = UDim.new(0, 12)

		local block = false
		function tab:SelectTab()
			repeat task.wait() until not block

			block = true
			for i, v in (window.Tabs) do
				if v ~= tab then
					v.TabButton.TextColor3 = Color3.fromRGB(230, 230, 230)
					v.TabButton.Name = "Tab"
					v.Left.Visible = false
					v.Right.Visible = false
				end
			end

			tab.TabButton.TextColor3 = window.theme.accentcolor
			tab.TabButton.Name = "SelectedTab"
			tab.Right.Visible = true
			tab.Left.Visible = true
			window.Line:TweenSizeAndPosition(UDim2.fromOffset(size.X + 15, 1), UDim2.new(0, (tab.TabButton.AbsolutePosition.X - window.Frame.AbsolutePosition.X), 0, 0) + (window.BlackLine.Position - UDim2.fromOffset(0, 1)), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15)
			task.wait(0.2)
			block = false
		end

		if #window.Tabs == 0 then
			tab:SelectTab()
		end

		tab.TabButton.MouseButton1Down:Connect(function()
			tab:SelectTab()
		end)

		tab.SectorsLeft = {}
		tab.SectorsRight = {}

		function tab:CreateSector(name, side)
			local sector = {}
			sector.name = name or ""
			sector.side = side:lower() or "left"

			sector.Main = Instance.new("Frame", sector.side == "left" and tab.Left or tab.Right)
			sector.Main.Name = sector.name:gsub(" ", "") .. "Sector"
			sector.Main.BorderSizePixel = 0
			sector.Main.ZIndex = 4
			sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, 20)
			sector.Main.BackgroundColor3 = window.theme.sectorcolor
			updateevent.Event:Connect(function(theme)
				sector.Main.BackgroundColor3 = theme.sectorcolor
			end)

			sector.Line = Instance.new("Frame", sector.Main)
			sector.Line.Name = "line"
			sector.Line.ZIndex = 4
			sector.Line.Size = UDim2.fromOffset(sector.Main.Size.X.Offset + 4, 1)
			sector.Line.BorderSizePixel = 0
			sector.Line.Position = UDim2.fromOffset(- 2, - 2)
			sector.Line.BackgroundColor3 = window.theme.accentcolor
			updateevent.Event:Connect(function(theme)
				sector.Line.BackgroundColor3 = theme.accentcolor
			end)

			sector.BlackOutline = Instance.new("Frame", sector.Main)
			sector.BlackOutline.Name = "outline"
			sector.BlackOutline.ZIndex = 3
			sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(2, 2)
			sector.BlackOutline.BorderSizePixel = 0
			sector.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
			sector.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
			sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
				sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(2, 2)
			end)
			updateevent.Event:Connect(function(theme)
				sector.BlackOutline.BackgroundColor3 = theme.outlinecolor2
			end)


			sector.Outline = Instance.new("Frame", sector.Main)
			sector.Outline.Name = "outline"
			sector.Outline.ZIndex = 2
			sector.Outline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
			sector.Outline.BorderSizePixel = 0
			sector.Outline.BackgroundColor3 = window.theme.outlinecolor
			sector.Outline.Position = UDim2.fromOffset(- 2, - 2)
			sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
				sector.Outline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
			end)
			updateevent.Event:Connect(function(theme)
				sector.Outline.BackgroundColor3 = theme.outlinecolor
			end)

			sector.BlackOutline2 = Instance.new("Frame", sector.Main)
			sector.BlackOutline2.Name = "outline"
			sector.BlackOutline2.ZIndex = 1
			sector.BlackOutline2.Size = sector.Main.Size + UDim2.fromOffset(6, 6)
			sector.BlackOutline2.BorderSizePixel = 0
			sector.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
			sector.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
			sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
				sector.BlackOutline2.Size = sector.Main.Size + UDim2.fromOffset(6, 6)
			end)
			updateevent.Event:Connect(function(theme)
				sector.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
			end)

			local size = textservice:GetTextSize(sector.name, 15, window.theme.font, Vector2.new(2000, 2000))
			sector.Label = Instance.new("TextLabel", sector.Main)
			sector.Label.AnchorPoint = Vector2.new(0, 0.5)
			sector.Label.Position = UDim2.fromOffset(12, - 1)
			sector.Label.Size = UDim2.fromOffset(math.clamp(textservice:GetTextSize(sector.name, 15, window.theme.font, Vector2.new(200, 300)).X + 13, 0, sector.Main.Size.X.Offset), size.Y)
			sector.Label.BackgroundTransparency = 1
			sector.Label.BorderSizePixel = 0
			sector.Label.ZIndex = 6
			sector.Label.Text = sector.name
			sector.Label.TextColor3 = Color3.new(1, 1, 2552 / 255)
			sector.Label.TextStrokeTransparency = 1
			sector.Label.Font = window.theme.font
			sector.Label.TextSize = 15
			updateevent.Event:Connect(function(theme)
				local size = textservice:GetTextSize(sector.name, 15, theme.font, Vector2.new(2000, 2000))
				sector.Label.Size = UDim2.fromOffset(math.clamp(textservice:GetTextSize(sector.name, 15, theme.font, Vector2.new(200, 300)).X + 13, 0, sector.Main.Size.X.Offset), size.Y)
				sector.Label.Font = theme.font
			end)

			sector.LabelBackFrame = Instance.new("Frame", sector.Main)
			sector.LabelBackFrame.Name = "labelframe"
			sector.LabelBackFrame.ZIndex = 5
			sector.LabelBackFrame.Size = UDim2.fromOffset(sector.Label.Size.X.Offset, 10)
			sector.LabelBackFrame.BorderSizePixel = 0
			sector.LabelBackFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			sector.LabelBackFrame.Position = UDim2.fromOffset(sector.Label.Position.X.Offset, sector.BlackOutline2.Position.Y.Offset)

			sector.Items = Instance.new("Frame", sector.Main)
			sector.Items.Name = "items"
			sector.Items.ZIndex = 2
			sector.Items.BackgroundTransparency = 1
			sector.Items.Size = UDim2.fromOffset(170, 140)
			sector.Items.AutomaticSize = Enum.AutomaticSize.Y
			sector.Items.BorderSizePixel = 0

			sector.ListLayout = Instance.new("UIListLayout", sector.Items)
			sector.ListLayout.FillDirection = Enum.FillDirection.Vertical
			sector.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			sector.ListLayout.Padding = UDim.new(0, 12)

			sector.ListPadding = Instance.new("UIPadding", sector.Items)
			sector.ListPadding.PaddingTop = UDim.new(0, 15)
			sector.ListPadding.PaddingLeft = UDim.new(0, 6)
			sector.ListPadding.PaddingRight = UDim.new(0, 6)

			table.insert(sector.side:lower() == "left" and tab.SectorsLeft or tab.SectorsRight, sector)

			function sector:FixSize()
				sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 22)
				local sizeleft, sizeright = 0, 0
				for i, v in (tab.SectorsLeft) do
					sizeleft = sizeleft + v.Main.AbsoluteSize.Y
				end
				for i, v in (tab.SectorsRight) do
					sizeright = sizeright + v.Main.AbsoluteSize.Y
				end

				tab.Left.CanvasSize = UDim2.fromOffset(tab.Left.AbsoluteSize.X, sizeleft + ((#tab.SectorsLeft - 1) * tab.LeftListPadding.PaddingTop.Offset) + 20)
				tab.Right.CanvasSize = UDim2.fromOffset(tab.Right.AbsoluteSize.X, sizeright + ((#tab.SectorsRight - 1) * tab.RightListPadding.PaddingTop.Offset) + 20)
			end

			function sector:AddButton(text, callback)
				local button = {}
				button.text = text or ""
				button.callback = callback or function() end

				button.Main = Instance.new("TextButton", sector.Items)
				button.Main.BorderSizePixel = 0
				button.Main.Text = ""
				button.Main.AutoButtonColor = false
				button.Main.Name = "button"
				button.Main.ZIndex = 5
				button.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
				button.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

				button.Gradient = Instance.new("UIGradient", button.Main)
				button.Gradient.Rotation = 90
				button.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, window.theme.buttoncolor), ColorSequenceKeypoint.new(1, window.theme.buttoncolor2)})
				updateevent.Event:Connect(function(theme)
					button.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, theme.buttoncolor), ColorSequenceKeypoint.new(1, theme.buttoncolor2)})
				end)

				button.BlackOutline2 = Instance.new("Frame", button.Main)
				button.BlackOutline2.Name = "blackline"
				button.BlackOutline2.ZIndex = 4
				button.BlackOutline2.Size = button.Main.Size + UDim2.fromOffset(6, 6)
				button.BlackOutline2.BorderSizePixel = 0
				button.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				button.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
				updateevent.Event:Connect(function(theme)
					button.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
				end)

				button.Outline = Instance.new("Frame", button.Main)
				button.Outline.Name = "blackline"
				button.Outline.ZIndex = 4
				button.Outline.Size = button.Main.Size + UDim2.fromOffset(4, 4)
				button.Outline.BorderSizePixel = 0
				button.Outline.BackgroundColor3 = window.theme.outlinecolor
				button.Outline.Position = UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					button.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				button.BlackOutline = Instance.new("Frame", button.Main)
				button.BlackOutline.Name = "blackline"
				button.BlackOutline.ZIndex = 4
				button.BlackOutline.Size = button.Main.Size + UDim2.fromOffset(2, 2)
				button.BlackOutline.BorderSizePixel = 0
				button.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				button.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
				updateevent.Event:Connect(function(theme)
					button.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				button.Label = Instance.new("TextLabel", button.Main)
				button.Label.Name = "Label"
				button.Label.BackgroundTransparency = 1
				button.Label.Position = UDim2.new(0, - 1, 0, 0)
				button.Label.ZIndex = 5
				button.Label.Size = button.Main.Size
				button.Label.Font = window.theme.font
				button.Label.Text = button.text
				button.Label.TextColor3 = window.theme.itemscolor2
				button.Label.TextSize = 15
				button.Label.TextStrokeTransparency = 1
				button.Label.TextXAlignment = Enum.TextXAlignment.Center
				button.Main.MouseButton1Down:Connect(button.callback)
				updateevent.Event:Connect(function(theme)
					button.Label.Font = theme.font
					button.Label.TextColor3 = theme.itemscolor
				end)

				button.BlackOutline2.MouseEnter:Connect(function()
					button.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end)

				button.BlackOutline2.MouseLeave:Connect(function()
					button.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				end)

				sector:FixSize()

				return button
			end

			function sector:AddLabel(text)
				local label = {}

				label.Main = Instance.new("TextLabel", sector.Items)
				label.Main.Name = "Label"
				label.Main.BackgroundTransparency = 1
				label.Main.Position = UDim2.new(0, - 1, 0, 0)
				label.Main.ZIndex = 4
				label.Main.AutomaticSize = Enum.AutomaticSize.XY
				label.Main.Font = window.theme.font
				label.Main.Text = text
				label.Main.TextColor3 = window.theme.itemscolor
				label.Main.TextSize = 15
				label.Main.TextStrokeTransparency = 1
				label.Main.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					label.Main.Font = theme.font
					label.Main.TextColor3 = theme.itemscolor
				end)

				function label:Set(value)
					label.Main.Text = value
				end

				sector:FixSize()

				return label
			end

			function sector:AddToggle(text, default, callback, flag)
				local toggle = {}
				toggle.text = text or ""
				toggle.default = default or false
				toggle.callback = callback or function(value) end
				toggle.flag = flag or text or ""

				toggle.value = toggle.default

				toggle.Main = Instance.new("TextButton", sector.Items)
				toggle.Main.Name = "toggle"
				toggle.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggle.Main.BorderColor3 = window.theme.outlinecolor
				toggle.Main.BorderSizePixel = 0
				toggle.Main.Size = UDim2.fromOffset(8, 8)
				toggle.Main.AutoButtonColor = false
				toggle.Main.ZIndex = 5
				toggle.Main.Font = Enum.Font.SourceSans
				toggle.Main.Text = ""
				toggle.Main.TextColor3 = Color3.fromRGB(0, 0, 0)
				toggle.Main.TextSize = 15
				updateevent.Event:Connect(function(theme)
					toggle.Main.BorderColor3 = theme.outlinecolor
				end)

				toggle.BlackOutline2 = Instance.new("Frame", toggle.Main)
				toggle.BlackOutline2.Name = "blackline"
				toggle.BlackOutline2.ZIndex = 4
				toggle.BlackOutline2.Size = toggle.Main.Size + UDim2.fromOffset(6, 6)
				toggle.BlackOutline2.BorderSizePixel = 0
				toggle.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				toggle.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
				updateevent.Event:Connect(function(theme)
					toggle.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
				end)

				toggle.Outline = Instance.new("Frame", toggle.Main)
				toggle.Outline.Name = "blackline"
				toggle.Outline.ZIndex = 4
				toggle.Outline.Size = toggle.Main.Size + UDim2.fromOffset(4, 4)
				toggle.Outline.BorderSizePixel = 0
				toggle.Outline.BackgroundColor3 = window.theme.outlinecolor
				toggle.Outline.Position = UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					toggle.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				toggle.BlackOutline = Instance.new("Frame", toggle.Main)
				toggle.BlackOutline.Name = "blackline"
				toggle.BlackOutline.ZIndex = 4
				toggle.BlackOutline.Size = toggle.Main.Size + UDim2.fromOffset(2, 2)
				toggle.BlackOutline.BorderSizePixel = 0
				toggle.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				toggle.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
				updateevent.Event:Connect(function(theme)
					toggle.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				toggle.Gradient = Instance.new("UIGradient", toggle.Main)
				toggle.Gradient.Rotation = (22.5 * 13)
				toggle.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))})

				toggle.Label = Instance.new("TextButton", toggle.Main)
				toggle.Label.Name = "Label"
				toggle.Label.AutoButtonColor = false
				toggle.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggle.Label.BackgroundTransparency = 1
				toggle.Label.Position = UDim2.fromOffset(toggle.Main.AbsoluteSize.X + 10, - 2)
				toggle.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, toggle.BlackOutline.Size.Y.Offset)
				toggle.Label.Font = window.theme.font
				toggle.Label.ZIndex = 5
				toggle.Label.Text = toggle.text
				toggle.Label.TextColor3 = window.theme.itemscolor
				toggle.Label.TextSize = 15
				toggle.Label.TextStrokeTransparency = 1
				toggle.Label.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					toggle.Label.Font = theme.font
					toggle.Label.TextColor3 = toggle.value and window.theme.itemscolor2 or theme.itemscolor
				end)

				toggle.CheckedFrame = Instance.new("Frame", toggle.Main)
				toggle.CheckedFrame.ZIndex = 5
				toggle.CheckedFrame.BorderSizePixel = 0
				toggle.CheckedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggle.CheckedFrame.Size = toggle.Main.Size

				toggle.Gradient2 = Instance.new("UIGradient", toggle.CheckedFrame)
				toggle.Gradient2.Rotation = (22.5 * 13)
				toggle.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, window.theme.accentcolor2), ColorSequenceKeypoint.new(1, window.theme.accentcolor)})
				updateevent.Event:Connect(function(theme)
					toggle.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, theme.accentcolor2), ColorSequenceKeypoint.new(1, theme.accentcolor)})
				end)

				toggle.Items = Instance.new("Frame", toggle.Main)
				toggle.Items.Name = "\n"
				toggle.Items.ZIndex = 4
				toggle.Items.Size = UDim2.fromOffset(60, toggle.BlackOutline.AbsoluteSize.Y)
				toggle.Items.BorderSizePixel = 0
				toggle.Items.BackgroundTransparency = 1
				toggle.Items.BackgroundColor3 = Color3.new(0, 0, 0)
				toggle.Items.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, 0)

				toggle.ListLayout = Instance.new("UIListLayout", toggle.Items)
				toggle.ListLayout.FillDirection = Enum.FillDirection.Horizontal
				toggle.ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				toggle.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				toggle.ListLayout.Padding = UDim.new(0.04, 6)

				if toggle.flag and toggle.flag ~= "" then
					library.flags[toggle.flag] = toggle.default or false
				end

				function toggle:Set(value)
					if value then
						toggle.Label.TextColor3 = window.theme.itemscolor2
					else
						toggle.Label.TextColor3 = window.theme.itemscolor
					end

					toggle.value = value
					toggle.CheckedFrame.Visible = value
					if toggle.flag and toggle.flag ~= "" then
						library.flags[toggle.flag] = toggle.value
					end
					pcall(toggle.callback, value)
				end

				function toggle:Get()
					return toggle.value
				end

				toggle:Set(toggle.default)

				function toggle:AddKeybind(default, flag)
					local keybind = {}

					keybind.default = default or "None"
					keybind.value = keybind.default
					keybind.flag = flag or ((toggle.text or "") .. #toggle.Items:GetChildren())

					local shorter_keycodes = {
						["LeftShift"] = "LSHIFT", 
						["RightShift"] = "RSHIFT", 
						["LeftControl"] = "LCTRL", 
						["RightControl"] = "RCTRL", 
						["LeftAlt"] = "LALT", 
						["RightAlt"] = "RALT"
					}

					local text = keybind.default == "None" and "[None]" or "[" .. (shorter_keycodes[keybind.default.Name] or keybind.default.Name) .. "]"
					local size = textservice:GetTextSize(text, 15, window.theme.font, Vector2.new(2000, 2000))

					keybind.Main = Instance.new("TextButton", toggle.Items)
					keybind.Main.Name = "keybind"
					keybind.Main.BackgroundTransparency = 1
					keybind.Main.BorderSizePixel = 0
					keybind.Main.ZIndex = 5
					keybind.Main.Size = UDim2.fromOffset(size.X + 2, size.Y - 7)
					keybind.Main.Text = text
					keybind.Main.Font = window.theme.font
					keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
					keybind.Main.TextSize = 15
					keybind.Main.TextXAlignment = Enum.TextXAlignment.Right
					keybind.Main.MouseButton1Down:Connect(function()
						keybind.Main.Text = "[...]"
						keybind.Main.TextColor3 = window.theme.accentcolor
					end)
					updateevent.Event:Connect(function(theme)
						keybind.Main.Font = theme.font
						if keybind.Main.Text == "[...]" then
							keybind.Main.TextColor3 = theme.accentcolor
						else
							keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
						end
					end)

					if keybind.flag and keybind.flag ~= "" then
						library.flags[keybind.flag] = keybind.default
					end
					function keybind:Set(key)
						if key == "None" then
							keybind.Main.Text = "[" .. key .. "]"
							keybind.value = key
							if keybind.flag and keybind.flag ~= "" then
								library.flags[keybind.flag] = key
							end
						end
						keybind.Main.Text = "[" .. (shorter_keycodes[key.Name] or key.Name) .. "]"
						keybind.value = key
						if keybind.flag and keybind.flag ~= "" then
							library.flags[keybind.flag] = keybind.value
						end
					end

					function keybind:Get()
						return keybind.value
					end

					userinputservice.InputBegan:Connect(function(input, gameProcessed)
						if not gameProcessed then
							if keybind.Main.Text == "[...]" then
								keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
								if input.UserInputType == Enum.UserInputType.Keyboard then
									keybind:Set(input.KeyCode)
								else
									keybind:Set("None")
								end
							else
								if keybind.value ~= "None" and input.KeyCode == keybind.value then
									toggle:Set(not toggle.CheckedFrame.Visible)
								end
							end
						end
					end)

					table.insert(library.items, keybind)

					return keybind
				end

				function toggle:AddDropdown(items, default, multichoice, callback, flag)
					local dropdown = {}

					dropdown.defaultitems = items or {}
					dropdown.default = default
					dropdown.callback = callback or function() end
					dropdown.multichoice = multichoice or false
					dropdown.values = {}
					dropdown.flag = flag or ((toggle.text or "") .. #sector.Items:GetChildren() .. "a")

					dropdown.Main = Instance.new("TextButton", sector.Items)
					dropdown.Main.Name = "dropdown"
					dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.Main.BorderSizePixel = 0
					dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
					dropdown.Main.Position = UDim2.fromOffset(0, 0)
					dropdown.Main.ZIndex = 5
					dropdown.Main.AutoButtonColor = false
					dropdown.Main.Font = window.theme.font
					dropdown.Main.Text = ""
					dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.Main.TextSize = 15
					dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left
					updateevent.Event:Connect(function(theme)
						dropdown.Main.Font = theme.font
					end)

					dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
					dropdown.Gradient.Rotation = 90
					dropdown.Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 39, 39))}

					dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
					dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.SelectedLabel.BackgroundTransparency = 1
					dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
					dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
					dropdown.SelectedLabel.Font = window.theme.font
					dropdown.SelectedLabel.Text = toggle.text
					dropdown.SelectedLabel.ZIndex = 5
					dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.SelectedLabel.TextSize = 15
					dropdown.SelectedLabel.TextStrokeTransparency = 1
					dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
					updateevent.Event:Connect(function(theme)
						dropdown.SelectedLabel.Font = theme.font
					end)

					dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
					dropdown.Nav.Name = "navigation"
					dropdown.Nav.BackgroundTransparency = 1
					dropdown.Nav.LayoutOrder = 10
					dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 5)
					dropdown.Nav.Rotation = 90
					dropdown.Nav.ZIndex = 5
					dropdown.Nav.Size = UDim2.fromOffset(8, 8)
					dropdown.Nav.Image = "rbxassetid://4918373417"
					dropdown.Nav.ImageColor3 = Color3.fromRGB(210, 210, 210)

					dropdown.BlackOutline2 = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline2.Name = "blackline"
					dropdown.BlackOutline2.ZIndex = 4
					dropdown.BlackOutline2.Size = dropdown.Main.Size + UDim2.fromOffset(6, 6)
					dropdown.BlackOutline2.BorderSizePixel = 0
					dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.Outline = Instance.new("Frame", dropdown.Main)
					dropdown.Outline.Name = "blackline"
					dropdown.Outline.ZIndex = 4
					dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
					dropdown.Outline.BorderSizePixel = 0
					dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
					dropdown.Outline.Position = UDim2.fromOffset(- 2, - 2)
					updateevent.Event:Connect(function(theme)
						dropdown.Outline.BackgroundColor3 = theme.outlinecolor
					end)

					dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline.Name = "blackline444"
					dropdown.BlackOutline.ZIndex = 4
					dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
					dropdown.BlackOutline.BorderSizePixel = 0
					dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
					dropdown.ItemsFrame.Name = "itemsframe"
					dropdown.ItemsFrame.BorderSizePixel = 0
					dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
					dropdown.ItemsFrame.ScrollBarThickness = 2
					dropdown.ItemsFrame.ZIndex = 8
					dropdown.ItemsFrame.ScrollingDirection = "Y"
					dropdown.ItemsFrame.Visible = false
					dropdown.ItemsFrame.Size = UDim2.new(0, 0, 0, 0)
					dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.Main.AbsoluteSize.X, 0)

					dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
					dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
					dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

					dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
					dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
					dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
					dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
					dropdown.ListPadding.PaddingRight = UDim.new(0, 2)

					dropdown.BlackOutline2Items = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline2Items.Name = "blackline3"
					dropdown.BlackOutline2Items.ZIndex = 7
					dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
					dropdown.BlackOutline2Items.BorderSizePixel = 0
					dropdown.BlackOutline2Items.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline2Items.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 3, - 3)
					dropdown.BlackOutline2Items.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline2Items.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
					dropdown.OutlineItems.Name = "blackline8"
					dropdown.OutlineItems.ZIndex = 7
					dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
					dropdown.OutlineItems.BorderSizePixel = 0
					dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
					dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 2, - 2)
					dropdown.OutlineItems.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.OutlineItems.BackgroundColor3 = theme.outlinecolor
					end)

					dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutlineItems.Name = "blackline3"
					dropdown.BlackOutlineItems.ZIndex = 7
					dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(- 2, - 2)
					dropdown.BlackOutlineItems.BorderSizePixel = 0
					dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 1, - 1)
					dropdown.BlackOutlineItems.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutlineItems.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.Main)
					dropdown.IgnoreBackButtons.BackgroundTransparency = 1
					dropdown.IgnoreBackButtons.BorderSizePixel = 0
					dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
					dropdown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0)
					dropdown.IgnoreBackButtons.ZIndex = 7
					dropdown.IgnoreBackButtons.Text = ""
					dropdown.IgnoreBackButtons.Visible = false
					dropdown.IgnoreBackButtons.AutoButtonColor = false

					if dropdown.flag and dropdown.flag ~= "" then
						library.flags[dropdown.flag] = dropdown.multichoice and {dropdown.default or dropdown.defaultitems[1] or ""} or (dropdown.default or dropdown.defaultitems[1] or "")
					end

					function dropdown:isSelected(item)
						for i, v in (dropdown.values) do
							if v == item then
								return true
							end
						end

						return false
					end

					function dropdown:updateText(text)
						if #text >= 27 then
							text = text:sub(1, 25) .. ".."
						end
						dropdown.SelectedLabel.Text = text
					end

					dropdown.Changed = Instance.new("BindableEvent")
					function dropdown:Set(value)
						if type(value) == "table" then
							dropdown.values = value
							dropdown:updateText(table.concat(value, ", "))
							pcall(dropdown.callback, value)
						else
							dropdown:updateText(value)
							dropdown.values = {value}
							pcall(dropdown.callback, value)
						end

						dropdown.Changed:Fire(value)
						if dropdown.flag and dropdown.flag ~= "" then
							library.flags[dropdown.flag] = dropdown.multichoice and dropdown.values or dropdown.values[1]
						end
					end

					function dropdown:Get()
						return dropdown.multichoice and dropdown.values or dropdown.values[1]
					end

					dropdown.items = {}
					function dropdown:Add(v)
						local Item = Instance.new("TextButton", dropdown.ItemsFrame)
						Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
						Item.TextColor3 = Color3.fromRGB(255, 255, 255)
						Item.BorderSizePixel = 0
						Item.Position = UDim2.fromOffset(0, 0)
						Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
						Item.ZIndex = 9
						Item.Text = v
						Item.Name = v
						Item.AutoButtonColor = false
						Item.Font = window.theme.font
						Item.TextSize = 15
						Item.TextXAlignment = Enum.TextXAlignment.Left
						Item.TextStrokeTransparency = 1
						dropdown.ItemsFrame.CanvasSize = dropdown.ItemsFrame.CanvasSize + UDim2.fromOffset(0, Item.AbsoluteSize.Y)

						Item.MouseButton1Down:Connect(function()
							if dropdown.multichoice then
								if dropdown:isSelected(v) then
									for i2, v2 in (dropdown.values) do
										if v2 == v then
											table.remove(dropdown.values, i2)
										end
									end
									dropdown:Set(dropdown.values)
								else
									table.insert(dropdown.values, v)
									dropdown:Set(dropdown.values)
								end

								return
							else
								dropdown.Nav.Rotation = 90
								dropdown.ItemsFrame.Visible = false
								dropdown.ItemsFrame.Active = false
								dropdown.OutlineItems.Visible = false
								dropdown.BlackOutlineItems.Visible = false
								dropdown.BlackOutline2Items.Visible = false
								dropdown.IgnoreBackButtons.Visible = false
								dropdown.IgnoreBackButtons.Active = false
							end

							dropdown:Set(v)

							return
						end)

						runservice.RenderStepped:Connect(function()
							if dropdown.multichoice and dropdown:isSelected(v) or dropdown.values[1] == v then
								Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
								Item.TextColor3 = window.theme.accentcolor
								Item.Text = " " .. v
							else
								Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
								Item.TextColor3 = Color3.fromRGB(255, 255, 255)
								Item.Text = v
							end
						end)

						table.insert(dropdown.items, v)
						dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * Item.AbsoluteSize.Y, 20, 156) + 4)
						dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * Item.AbsoluteSize.Y) + 4)

						dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
						dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
						dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
						dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
					end

					function dropdown:Remove(value)
						local item = dropdown.ItemsFrame:FindFirstChild(value)
						if item then
							for i, v in (dropdown.items) do
								if v == value then
									table.remove(dropdown.items, i)
								end
							end

							dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
							dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)

							dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
							dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
							dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
							dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size

							item:Remove()
						end
					end

					for i, v in (dropdown.defaultitems) do
						dropdown:Add(v)
					end

					if dropdown.default then
						dropdown:Set(dropdown.default)
					end

					local MouseButton1Down = function()
						if dropdown.Nav.Rotation == 90 then
							tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Rotation = - 90}):Play()
							if dropdown.items and #dropdown.items ~= 0 then
								dropdown.ItemsFrame.ScrollingEnabled = true
								sector.Main.Parent.ScrollingEnabled = true
								dropdown.ItemsFrame.Visible = true
								dropdown.ItemsFrame.Active = true
								dropdown.IgnoreBackButtons.Visible = true
								dropdown.IgnoreBackButtons.Active = true
								dropdown.OutlineItems.Visible = true
								dropdown.BlackOutlineItems.Visible = true
								dropdown.BlackOutline2Items.Visible = true
							end
						else
							tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Rotation = 90}):Play()
							dropdown.ItemsFrame.ScrollingEnabled = true
							sector.Main.Parent.ScrollingEnabled = true
							dropdown.ItemsFrame.Visible = false
							dropdown.ItemsFrame.Active = false
							dropdown.IgnoreBackButtons.Visible = false
							dropdown.IgnoreBackButtons.Active = false
							dropdown.OutlineItems.Visible = false
							dropdown.BlackOutlineItems.Visible = false
							dropdown.BlackOutline2Items.Visible = false
						end
					end

					dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
					dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)

					dropdown.BlackOutline2.MouseEnter:Connect(function()
						dropdown.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
					end)
					dropdown.BlackOutline2.MouseLeave:Connect(function()
						dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					end)

					sector:FixSize()
					table.insert(library.items, dropdown)

					return dropdown
				end

				function toggle:AddTextbox(default, callback, flag)
					local textbox = {}
					textbox.callback = callback or function() end
					textbox.default = default
					textbox.value = ""
					textbox.flag = flag or ((toggle.text or "") .. #sector.Items:GetChildren() .. "a")

					textbox.Holder = Instance.new("Frame", sector.Items)
					textbox.Holder.Name = "holder"
					textbox.Holder.ZIndex = 5
					textbox.Holder.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
					textbox.Holder.BorderSizePixel = 0
					textbox.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

					textbox.Gradient = Instance.new("UIGradient", textbox.Holder)
					textbox.Gradient.Rotation = 90
					textbox.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 39, 39))})

					textbox.Main = Instance.new("TextBox", textbox.Holder)
					textbox.Main.PlaceholderText = ""
					textbox.Main.Text = ""
					textbox.Main.BackgroundTransparency = 1
					textbox.Main.Font = window.theme.font
					textbox.Main.Name = "textbox"
					textbox.Main.MultiLine = false
					textbox.Main.ClearTextOnFocus = false
					textbox.Main.ZIndex = 5
					textbox.Main.TextScaled = true
					textbox.Main.Size = textbox.Holder.Size
					textbox.Main.TextSize = 15
					textbox.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
					textbox.Main.BorderSizePixel = 0
					textbox.Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					textbox.Main.TextXAlignment = Enum.TextXAlignment.Left

					if textbox.flag and textbox.flag ~= "" then
						library.flags[textbox.flag] = textbox.default or ""
					end

					function textbox:Set(text)
						textbox.value = text
						textbox.Main.Text = text
						if textbox.flag and textbox.flag ~= "" then
							library.flags[textbox.flag] = text
						end
						pcall(textbox.callback, text)
					end
					updateevent.Event:Connect(function(theme)
						textbox.Main.Font = theme.font
					end)

					function textbox:Get()
						return textbox.value
					end

					if textbox.default then
						textbox:Set(textbox.default)
					end

					textbox.Main.FocusLost:Connect(function()
						textbox:Set(textbox.Main.Text)
					end)

					textbox.BlackOutline2 = Instance.new("Frame", textbox.Main)
					textbox.BlackOutline2.Name = "blackline"
					textbox.BlackOutline2.ZIndex = 4
					textbox.BlackOutline2.Size = textbox.Main.Size + UDim2.fromOffset(6, 6)
					textbox.BlackOutline2.BorderSizePixel = 0
					textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					textbox.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
					updateevent.Event:Connect(function(theme)
						textbox.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
					end)

					textbox.Outline = Instance.new("Frame", textbox.Main)
					textbox.Outline.Name = "blackline"
					textbox.Outline.ZIndex = 4
					textbox.Outline.Size = textbox.Main.Size + UDim2.fromOffset(4, 4)
					textbox.Outline.BorderSizePixel = 0
					textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
					textbox.Outline.Position = UDim2.fromOffset(- 2, - 2)
					updateevent.Event:Connect(function(theme)
						textbox.Outline.BackgroundColor3 = theme.outlinecolor
					end)

					textbox.BlackOutline = Instance.new("Frame", textbox.Main)
					textbox.BlackOutline.Name = "blackline"
					textbox.BlackOutline.ZIndex = 4
					textbox.BlackOutline.Size = textbox.Main.Size + UDim2.fromOffset(2, 2)
					textbox.BlackOutline.BorderSizePixel = 0
					textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
					textbox.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
					updateevent.Event:Connect(function(theme)
						textbox.BlackOutline.BackgroundColor3 = theme.outlinecolor2
					end)

					textbox.BlackOutline2.MouseEnter:Connect(function()
						textbox.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
					end)
					textbox.BlackOutline2.MouseLeave:Connect(function()
						textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					end)

					sector:FixSize()
					table.insert(library.items, textbox)

					return textbox
				end

				function toggle:AddColorpicker(default, callback, flag)
					local colorpicker = { }

					colorpicker.callback = callback or function() end
					colorpicker.default = default or Color3.fromRGB(255, 255, 255)
					colorpicker.value = colorpicker.default
					colorpicker.flag = flag or ( (toggle.text or "") .. tostring(#toggle.Items:GetChildren()))

					colorpicker.Main = Instance.new("Frame", toggle.Items)
					colorpicker.Main.ZIndex = 6
					colorpicker.Main.BorderSizePixel = 0
					colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorpicker.Main.Size = UDim2.fromOffset(16, 10)

					colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
					colorpicker.Gradient.Rotation = 90

					local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
					colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

					colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.Main)
					colorpicker.BlackOutline2.Name = "blackline"
					colorpicker.BlackOutline2.ZIndex = 4
					colorpicker.BlackOutline2.Size = colorpicker.Main.Size + UDim2.fromOffset(6, 6)
					colorpicker.BlackOutline2.BorderSizePixel = 0
					colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					colorpicker.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
					updateevent.Event:Connect(function(theme)
						if window.OpenedColorPickers[colorpicker.MainPicker] then
							colorpicker.BlackOutline2.BackgroundColor3 = theme.accentcolor
						else
							colorpicker.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
						end
					end)

					colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
					colorpicker.Outline.Name = "blackline"
					colorpicker.Outline.ZIndex = 4
					colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
					colorpicker.Outline.BorderSizePixel = 0
					colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
					colorpicker.Outline.Position = UDim2.fromOffset(-2, -2)
					updateevent.Event:Connect(function(theme)
						colorpicker.Outline.BackgroundColor3 = theme.outlinecolor
					end)

					colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
					colorpicker.BlackOutline.Name = "blackline"
					colorpicker.BlackOutline.ZIndex = 4
					colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
					colorpicker.BlackOutline.BorderSizePixel = 0
					colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
					colorpicker.BlackOutline.Position = UDim2.fromOffset(-1, -1)
					updateevent.Event:Connect(function(theme)
						colorpicker.BlackOutline.BackgroundColor3 = theme.outlinecolor2
					end)

					colorpicker.BlackOutline2.MouseEnter:Connect(function()
						colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
					end)

					colorpicker.BlackOutline2.MouseLeave:Connect(function()
						if not window.OpenedColorPickers[colorpicker.MainPicker] then
							colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
						end
					end)

					colorpicker.MainPicker = Instance.new("TextButton", colorpicker.Main)
					colorpicker.MainPicker.Name = "picker"
					colorpicker.MainPicker.ZIndex = 100
					colorpicker.MainPicker.Visible = false
					colorpicker.MainPicker.AutoButtonColor = false
					colorpicker.MainPicker.Text = ""
					window.OpenedColorPickers[colorpicker.MainPicker] = false
					colorpicker.MainPicker.Size = UDim2.fromOffset(180, 196)
					colorpicker.MainPicker.BorderSizePixel = 0
					colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					colorpicker.MainPicker.Rotation = 0.000000000000001
					colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 17)

					colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
					colorpicker.BlackOutline3.Name = "blackline"
					colorpicker.BlackOutline3.ZIndex = 98
					colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(6, 6)
					colorpicker.BlackOutline3.BorderSizePixel = 0
					colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
					colorpicker.BlackOutline3.Position = UDim2.fromOffset(-3, -3)
					updateevent.Event:Connect(function(theme)
						colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
					end)

					colorpicker.Outline2 = Instance.new("Frame", colorpicker.MainPicker)
					colorpicker.Outline2.Name = "blackline"
					colorpicker.Outline2.ZIndex = 98
					colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
					colorpicker.Outline2.BorderSizePixel = 0
					colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
					colorpicker.Outline2.Position = UDim2.fromOffset(-2, -2)
					updateevent.Event:Connect(function(theme)
						colorpicker.Outline2.BackgroundColor3 = theme.outlinecolor
					end)

					colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
					colorpicker.BlackOutline3.Name = "blackline"
					colorpicker.BlackOutline3.ZIndex = 98
					colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
					colorpicker.BlackOutline3.BorderSizePixel = 0
					colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
					colorpicker.BlackOutline3.Position = UDim2.fromOffset(-1, -1)
					updateevent.Event:Connect(function(theme)
						colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
					end)

					colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
					colorpicker.hue.ZIndex = 101
					colorpicker.hue.Position = UDim2.new(0, 3, 0, 3)
					colorpicker.hue.Size = UDim2.new(0, 172, 0, 172)
					colorpicker.hue.Image = "rbxassetid://4155801252"
					colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
					colorpicker.hue.BackgroundColor3 = Color3.new(1, 0, 0)
					colorpicker.hue.BorderColor3 = window.theme.outlinecolor2
					updateevent.Event:Connect(function(theme)
						colorpicker.hue.BorderColor3 = theme.outlinecolor2
					end)

					colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
					colorpicker.hueselectorpointer.ZIndex = 101
					colorpicker.hueselectorpointer.BackgroundTransparency = 1
					colorpicker.hueselectorpointer.BorderSizePixel = 0
					colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
					colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
					colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

					colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
					colorpicker.selector.ZIndex = 100
					colorpicker.selector.Position = UDim2.new(0, 3, 0, 181)
					colorpicker.selector.Size = UDim2.new(0, 173, 0, 10)
					colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorpicker.selector.BorderColor3 = window.theme.outlinecolor2
					colorpicker.selector.Text = ""
					updateevent.Event:Connect(function(theme)
						colorpicker.selector.BorderColor3 = theme.outlinecolor2
					end)

					colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
					colorpicker.gradient.Color = ColorSequence.new({ 
						ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), 
						ColorSequenceKeypoint.new(0.17, Color3.new(1, 0, 1)), 
						ColorSequenceKeypoint.new(0.33, Color3.new(0, 0, 1)), 
						ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)), 
						ColorSequenceKeypoint.new(0.67, Color3.new(0, 1, 0)), 
						ColorSequenceKeypoint.new(0.83, Color3.new(1, 1, 0)), 
						ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
					})

					colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
					colorpicker.pointer.ZIndex = 101
					colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					colorpicker.pointer.Position = UDim2.new(0, 0, 0, 0)
					colorpicker.pointer.Size = UDim2.new(0, 2, 0, 10)
					colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

					if colorpicker.flag and colorpicker.flag ~= "" then
						library.flags[colorpicker.flag] = colorpicker.default
					end

					function colorpicker:RefreshHue()
						local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
						local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
						colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.952 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.885 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
						colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
					end

					function colorpicker:RefreshSelector()
						local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
						colorpicker.color = 1 - pos
						colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
						colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)

						local x = (colorpicker.hueselectorpointer.AbsolutePosition.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
						local y = (colorpicker.hueselectorpointer.AbsolutePosition.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
						colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
					end

					function colorpicker:Set(value)
						local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
						colorpicker.value = color
						if colorpicker.flag and colorpicker.flag ~= "" then
							library.flags[colorpicker.flag] = color
						end
						local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
						colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
						pcall(colorpicker.callback, color)
					end

					function colorpicker:Get(value)
						return colorpicker.value
					end
					colorpicker:Set(colorpicker.default)

					local dragging_selector = false
					local dragging_hue = false

					colorpicker.selector.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging_selector = true
							colorpicker:RefreshSelector()
						end
					end)

					colorpicker.selector.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging_selector = false
							colorpicker:RefreshSelector()
						end
					end)

					colorpicker.hue.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging_hue = true
							colorpicker:RefreshHue()
						end
					end)

					colorpicker.hue.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging_hue = false
							colorpicker:RefreshHue()
						end
					end)

					userinputservice.InputChanged:Connect(function(input)
						if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
							colorpicker:RefreshSelector()
						end
						if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
							colorpicker:RefreshHue()
						end
					end)

					local inputBegan = function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							for i, v in (window.OpenedColorPickers) do
								if v and i ~= colorpicker.MainPicker then
									i.Visible = false
									window.OpenedColorPickers[i] = false
								end
							end

							colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
							window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
							if window.OpenedColorPickers[colorpicker.MainPicker] then
								colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
							else
								colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
							end
						end
					end

					colorpicker.Main.InputBegan:Connect(inputBegan)
					colorpicker.Outline.InputBegan:Connect(inputBegan)
					colorpicker.BlackOutline2.InputBegan:Connect(inputBegan)
					table.insert(library.items, colorpicker)
					
					return colorpicker
				end

				function toggle:AddSlider(min, default, max, decimals, callback, flag)
					local slider = {}
					slider.text = text or ""
					slider.callback = callback or function(value) end
					slider.min = min or 0
					slider.max = max or 100
					slider.decimals = decimals or 1
					slider.default = default or slider.min
					slider.flag = flag or ((toggle.text or "") .. #toggle.Items:GetChildren())

					slider.value = slider.default
					local dragging = false

					slider.Main = Instance.new("TextButton", sector.Items)
					slider.Main.Name = "slider"
					slider.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					slider.Main.Position = UDim2.fromOffset(0, 0)
					slider.Main.BorderSizePixel = 0
					slider.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 12)
					slider.Main.AutoButtonColor = false
					slider.Main.Text = ""
					slider.Main.ZIndex = 7

					slider.InputLabel = Instance.new("TextLabel", slider.Main)
					slider.InputLabel.BackgroundTransparency = 1
					slider.InputLabel.Size = slider.Main.Size
					slider.InputLabel.Font = window.theme.font
					slider.InputLabel.Text = "0"
					slider.InputLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
					slider.InputLabel.Position = slider.Main.Position
					slider.InputLabel.Selectable = false
					slider.InputLabel.TextSize = 15
					slider.InputLabel.ZIndex = 9
					slider.InputLabel.TextStrokeTransparency = 1
					slider.InputLabel.TextXAlignment = Enum.TextXAlignment.Center
					updateevent.Event:Connect(function(theme)
						slider.InputLabel.Font = theme.font
						slider.InputLabel.TextColor3 = theme.itemscolor
					end)

					slider.BlackOutline2 = Instance.new("Frame", slider.Main)
					slider.BlackOutline2.Name = "blackline"
					slider.BlackOutline2.ZIndex = 4
					slider.BlackOutline2.Size = slider.Main.Size + UDim2.fromOffset(6, 6)
					slider.BlackOutline2.BorderSizePixel = 0
					slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					slider.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
					updateevent.Event:Connect(function(theme)
						slider.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
					end)

					slider.Outline = Instance.new("Frame", slider.Main)
					slider.Outline.Name = "blackline"
					slider.Outline.ZIndex = 4
					slider.Outline.Size = slider.Main.Size + UDim2.fromOffset(4, 4)
					slider.Outline.BorderSizePixel = 0
					slider.Outline.BackgroundColor3 = window.theme.outlinecolor
					slider.Outline.Position = UDim2.fromOffset(- 2, - 2)
					updateevent.Event:Connect(function(theme)
						slider.Outline.BackgroundColor3 = theme.outlinecolor
					end)

					slider.BlackOutline = Instance.new("Frame", slider.Main)
					slider.BlackOutline.Name = "blackline"
					slider.BlackOutline.ZIndex = 4
					slider.BlackOutline.Size = slider.Main.Size + UDim2.fromOffset(2, 2)
					slider.BlackOutline.BorderSizePixel = 0
					slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
					slider.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
					updateevent.Event:Connect(function(theme)
						slider.BlackOutline.BackgroundColor3 = theme.outlinecolor2
					end)

					slider.Gradient = Instance.new("UIGradient", slider.Main)
					slider.Gradient.Rotation = 90
					slider.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 41, 41))})

					slider.SlideBar = Instance.new("Frame", slider.Main)
					slider.SlideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					slider.SlideBar.ZIndex = 8
					slider.SlideBar.BorderSizePixel = 0
					slider.SlideBar.Size = UDim2.fromOffset(0, slider.Main.Size.Y.Offset)

					slider.Gradient2 = Instance.new("UIGradient", slider.SlideBar)
					slider.Gradient2.Rotation = 90
					slider.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, window.theme.accentcolor), ColorSequenceKeypoint.new(1, window.theme.accentcolor2)})
					updateevent.Event:Connect(function(theme)
						slider.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, theme.accentcolor), ColorSequenceKeypoint.new(1, theme.accentcolor2)})
					end)

					slider.BlackOutline2.MouseEnter:Connect(function()
						slider.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
					end)
					slider.BlackOutline2.MouseLeave:Connect(function()
						slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					end)

					if slider.flag and slider.flag ~= "" then
						library.flags[slider.flag] = slider.default or slider.min or 0
					end

					function slider:Get()
						return slider.value
					end

					function slider:Set(value)
						slider.value = math.clamp(math.round(value * slider.decimals) / slider.decimals, slider.min, slider.max)
						local percent = 1 - ((slider.max - slider.value) / (slider.max - slider.min))
						if slider.flag and slider.flag ~= "" then
							library.flags[slider.flag] = slider.value
						end
						slider.SlideBar:TweenSize(UDim2.fromOffset(percent * slider.Main.AbsoluteSize.X, slider.Main.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
						slider.InputLabel.Text = slider.value
						pcall(slider.callback, slider.value)
					end
					slider:Set(slider.default)

					function slider:Refresh()
						local mousepos = workspace2.CurrentCamera:WorldToViewportPoint(mouse.Hit.Position)
						local percent = math.clamp(mousepos.X - slider.SlideBar.AbsolutePosition.X, 0, slider.Main.AbsoluteSize.X) / slider.Main.AbsoluteSize.X
						local value = math.round((slider.min + (slider.max - slider.min) * percent) * slider.decimals) / slider.decimals
						value = math.clamp(value, slider.min, slider.max)
						slider:Set(value)
					end

					slider.SlideBar.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							slider:Refresh()
						end
					end)

					slider.SlideBar.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end)

					slider.Main.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							slider:Refresh()
						end
					end)

					slider.Main.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end)

					userinputservice.InputChanged:Connect(function(input)
						if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							slider:Refresh()
						end
					end)

					sector:FixSize()
					table.insert(library.items, slider)

					return slider
				end

				toggle.Main.MouseButton1Down:Connect(function()
					toggle:Set(not toggle.CheckedFrame.Visible)
				end)

				toggle.Label.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						toggle:Set(not toggle.CheckedFrame.Visible)
					end
				end)

				local MouseEnter = function()
					toggle.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end

				local MouseLeave = function()
					toggle.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				end

				toggle.Label.MouseEnter:Connect(MouseEnter)
				toggle.Label.MouseLeave:Connect(MouseLeave)
				toggle.BlackOutline2.MouseEnter:Connect(MouseEnter)
				toggle.BlackOutline2.MouseLeave:Connect(MouseLeave)

				sector:FixSize()
				table.insert(library.items, toggle)

				return toggle
			end

			function sector:AddTextbox(text, default, callback, flag)
				local textbox = {}
				textbox.text = text or ""
				textbox.callback = callback or function() end
				textbox.default = default
				textbox.value = ""
				textbox.flag = flag or text or ""

				textbox.Label = Instance.new("TextButton", sector.Items)
				textbox.Label.Name = "Label"
				textbox.Label.AutoButtonColor = false
				textbox.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textbox.Label.BackgroundTransparency = 1
				textbox.Label.Position = UDim2.fromOffset(sector.Main.Size.X.Offset, 0)
				textbox.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 0)
				textbox.Label.Font = window.theme.font
				textbox.Label.ZIndex = 5
				textbox.Label.Text = textbox.text
				textbox.Label.TextColor3 = window.theme.itemscolor
				textbox.Label.TextSize = 15
				textbox.Label.TextStrokeTransparency = 1
				textbox.Label.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					textbox.Label.Font = theme.font
				end)

				textbox.Holder = Instance.new("Frame", sector.Items)
				textbox.Holder.Name = "holder"
				textbox.Holder.ZIndex = 5
				textbox.Holder.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
				textbox.Holder.BorderSizePixel = 0
				textbox.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

				textbox.Gradient = Instance.new("UIGradient", textbox.Holder)
				textbox.Gradient.Rotation = 90
				textbox.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 39, 39))})

				textbox.Main = Instance.new("TextBox", textbox.Holder)
				textbox.Main.PlaceholderText = textbox.text
				textbox.Main.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
				textbox.Main.Text = ""
				textbox.Main.BackgroundTransparency = 1
				textbox.Main.Font = window.theme.font
				textbox.Main.Name = "textbox"
				textbox.Main.MultiLine = false
				textbox.Main.ClearTextOnFocus = false
				textbox.Main.ZIndex = 5
				textbox.Main.TextScaled = true
				textbox.Main.Size = textbox.Holder.Size
				textbox.Main.TextSize = 15
				textbox.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
				textbox.Main.BorderSizePixel = 0
				textbox.Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				textbox.Main.TextXAlignment = Enum.TextXAlignment.Left

				if textbox.flag and textbox.flag ~= "" then
					library.flags[textbox.flag] = textbox.default or ""
				end

				function textbox:Set(text)
					textbox.value = text
					textbox.Main.Text = text
					if textbox.flag and textbox.flag ~= "" then
						library.flags[textbox.flag] = text
					end
					pcall(textbox.callback, text)
				end
				updateevent.Event:Connect(function(theme)
					textbox.Main.Font = theme.font
				end)

				function textbox:Get()
					return textbox.value
				end

				if textbox.default then
					textbox:Set(textbox.default)
				end

				textbox.Main.FocusLost:Connect(function()
					textbox:Set(textbox.Main.Text)
				end)

				textbox.BlackOutline2 = Instance.new("Frame", textbox.Main)
				textbox.BlackOutline2.Name = "blackline"
				textbox.BlackOutline2.ZIndex = 4
				textbox.BlackOutline2.Size = textbox.Main.Size + UDim2.fromOffset(6, 6)
				textbox.BlackOutline2.BorderSizePixel = 0
				textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				textbox.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
				updateevent.Event:Connect(function(theme)
					textbox.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
				end)

				textbox.Outline = Instance.new("Frame", textbox.Main)
				textbox.Outline.Name = "blackline"
				textbox.Outline.ZIndex = 4
				textbox.Outline.Size = textbox.Main.Size + UDim2.fromOffset(4, 4)
				textbox.Outline.BorderSizePixel = 0
				textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
				textbox.Outline.Position = UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					textbox.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				textbox.BlackOutline = Instance.new("Frame", textbox.Main)
				textbox.BlackOutline.Name = "blackline"
				textbox.BlackOutline.ZIndex = 4
				textbox.BlackOutline.Size = textbox.Main.Size + UDim2.fromOffset(2, 2)
				textbox.BlackOutline.BorderSizePixel = 0
				textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				textbox.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
				updateevent.Event:Connect(function(theme)
					textbox.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				textbox.BlackOutline2.MouseEnter:Connect(function()
					textbox.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end)
				textbox.BlackOutline2.MouseLeave:Connect(function()
					textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				end)

				sector:FixSize()
				table.insert(library.items, textbox)

				return textbox
			end

			function sector:AddSlider(text, min, default, max, decimals, callback, flag)
				local slider = {}
				slider.text = text or ""
				slider.callback = callback or function(value) end
				slider.min = min or 0
				slider.max = max or 100
				slider.decimals = decimals or 1
				slider.default = default or slider.min
				slider.flag = flag or text or ""

				slider.value = slider.default
				local dragging = false

				slider.MainBack = Instance.new("Frame", sector.Items)
				slider.MainBack.Name = "MainBack"
				slider.MainBack.ZIndex = 7
				slider.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 25)
				slider.MainBack.BorderSizePixel = 0
				slider.MainBack.BackgroundTransparency = 1

				slider.Label = Instance.new("TextLabel", slider.MainBack)
				slider.Label.BackgroundTransparency = 1
				slider.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 6)
				slider.Label.Font = window.theme.font
				slider.Label.Text = slider.text .. ":"
				slider.Label.TextColor3 = window.theme.itemscolor
				slider.Label.Position = UDim2.fromOffset(0, 0)
				slider.Label.TextSize = 15
				slider.Label.ZIndex = 4
				slider.Label.TextStrokeTransparency = 1
				slider.Label.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					slider.Label.Font = theme.font
					slider.Label.TextColor3 = theme.itemscolor
				end)

				local size = textservice:GetTextSize(slider.Label.Text, slider.Label.TextSize, slider.Label.Font, Vector2.new(200, 300))
				slider.InputLabel = Instance.new("TextBox", slider.MainBack)
				slider.InputLabel.BackgroundTransparency = 1
				slider.InputLabel.ClearTextOnFocus = false
				slider.InputLabel.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - size.X - 15, 12)
				slider.InputLabel.Font = window.theme.font
				slider.InputLabel.Text = "0"
				slider.InputLabel.TextColor3 = window.theme.itemscolor
				slider.InputLabel.Position = UDim2.fromOffset(size.X + 3, - 3)
				slider.InputLabel.TextSize = 15
				slider.InputLabel.ZIndex = 4
				slider.InputLabel.TextStrokeTransparency = 1
				slider.InputLabel.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					slider.InputLabel.Font = theme.font
					slider.InputLabel.TextColor3 = theme.itemscolor

					local size = textservice:GetTextSize(slider.Label.Text, slider.Label.TextSize, slider.Label.Font, Vector2.new(200, 300))
					slider.InputLabel.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - size.X - 15, 12)
				end)

				slider.Main = Instance.new("TextButton", slider.MainBack)
				slider.Main.Name = "slider"
				slider.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				slider.Main.Position = UDim2.fromOffset(0, 15)
				slider.Main.BorderSizePixel = 0
				slider.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 12)
				slider.Main.AutoButtonColor = false
				slider.Main.Text = ""
				slider.Main.ZIndex = 5

				slider.BlackOutline2 = Instance.new("Frame", slider.Main)
				slider.BlackOutline2.Name = "blackline"
				slider.BlackOutline2.ZIndex = 4
				slider.BlackOutline2.Size = slider.Main.Size + UDim2.fromOffset(6, 6)
				slider.BlackOutline2.BorderSizePixel = 0
				slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				slider.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
				updateevent.Event:Connect(function(theme)
					slider.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
				end)

				slider.Outline = Instance.new("Frame", slider.Main)
				slider.Outline.Name = "blackline"
				slider.Outline.ZIndex = 4
				slider.Outline.Size = slider.Main.Size + UDim2.fromOffset(4, 4)
				slider.Outline.BorderSizePixel = 0
				slider.Outline.BackgroundColor3 = window.theme.outlinecolor
				slider.Outline.Position = UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					slider.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				slider.BlackOutline = Instance.new("Frame", slider.Main)
				slider.BlackOutline.Name = "blackline"
				slider.BlackOutline.ZIndex = 4
				slider.BlackOutline.Size = slider.Main.Size + UDim2.fromOffset(2, 2)
				slider.BlackOutline.BorderSizePixel = 0
				slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				slider.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
				updateevent.Event:Connect(function(theme)
					slider.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				slider.Gradient = Instance.new("UIGradient", slider.Main)
				slider.Gradient.Rotation = 90
				slider.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 41, 41))})

				slider.SlideBar = Instance.new("Frame", slider.Main)
				slider.SlideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				slider.SlideBar.ZIndex = 5
				slider.SlideBar.BorderSizePixel = 0
				slider.SlideBar.Size = UDim2.fromOffset(0, slider.Main.Size.Y.Offset)

				slider.Gradient2 = Instance.new("UIGradient", slider.SlideBar)
				slider.Gradient2.Rotation = 90
				slider.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, window.theme.accentcolor), ColorSequenceKeypoint.new(1, window.theme.accentcolor2)})
				updateevent.Event:Connect(function(theme)
					slider.Gradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, theme.accentcolor), ColorSequenceKeypoint.new(1, theme.accentcolor2)})
				end)

				slider.BlackOutline2.MouseEnter:Connect(function()
					slider.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end)
				slider.BlackOutline2.MouseLeave:Connect(function()
					slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				end)

				if slider.flag and slider.flag ~= "" then
					library.flags[slider.flag] = slider.default or slider.min or 0
				end

				function slider:Get()
					return slider.value
				end

				function slider:Set(value)
					slider.value = math.clamp(math.round(value * slider.decimals) / slider.decimals, slider.min, slider.max)
					local percent = 1 - ((slider.max - slider.value) / (slider.max - slider.min))
					if slider.flag and slider.flag ~= "" then
						library.flags[slider.flag] = slider.value
					end
					slider.SlideBar:TweenSize(UDim2.fromOffset(percent * slider.Main.AbsoluteSize.X, slider.Main.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
					slider.InputLabel.Text = slider.value
					pcall(slider.callback, slider.value)
				end
				slider:Set(slider.default)

				slider.InputLabel.FocusLost:Connect(function(Return)
					if not Return then
						return
					end

					if (slider.InputLabel.Text:match("^%d+$")) then
						slider:Set(slider.InputLabel.Text)
					else
						slider.InputLabel.Text = slider.value
					end
				end)

				function slider:Refresh()
					local mousepos = workspace2.CurrentCamera:WorldToViewportPoint(mouse.Hit.Position)
					local percent = math.clamp(mousepos.X - slider.SlideBar.AbsolutePosition.X, 0, slider.Main.AbsoluteSize.X) / slider.Main.AbsoluteSize.X
					local value = math.round((slider.min + (slider.max - slider.min) * percent) * slider.decimals) / slider.decimals
					value = math.clamp(value, slider.min, slider.max)
					slider:Set(value)
				end

				slider.SlideBar.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						slider:Refresh()
					end
				end)

				slider.SlideBar.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)

				slider.Main.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						slider:Refresh()
					end
				end)

				slider.Main.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)

				userinputservice.InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						slider:Refresh()
					end
				end)

				sector:FixSize()
				table.insert(library.items, slider)
				return slider
			end

			function sector:AddColorpicker(text, default, callback, flag)
				local colorpicker = { }

				colorpicker.text = text or ""
				colorpicker.callback = callback or function() end
				colorpicker.default = default or Color3.fromRGB(255, 255, 255)
				colorpicker.value = colorpicker.default
				colorpicker.flag = flag or text or ""

				colorpicker.Label = Instance.new("TextLabel", sector.Items)
				colorpicker.Label.BackgroundTransparency = 1
				colorpicker.Label.Size = UDim2.fromOffset(156, 10)
				colorpicker.Label.ZIndex = 4
				colorpicker.Label.Font = window.theme.font
				colorpicker.Label.Text = colorpicker.text
				colorpicker.Label.TextColor3 = window.theme.itemscolor
				colorpicker.Label.TextSize = 15
				colorpicker.Label.TextStrokeTransparency = 1
				colorpicker.Label.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					colorpicker.Label.Font = theme.font
					colorpicker.Label.TextColor3 = theme.itemscolor
				end)

				colorpicker.Main = Instance.new("Frame", colorpicker.Label)
				colorpicker.Main.ZIndex = 6
				colorpicker.Main.BorderSizePixel = 0
				colorpicker.Main.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 29, 0)
				colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				colorpicker.Main.Size = UDim2.fromOffset(16, 10)

				colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
				colorpicker.Gradient.Rotation = 90

				local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
				colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

				colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.Main)
				colorpicker.BlackOutline2.Name = "blackline"
				colorpicker.BlackOutline2.ZIndex = 4
				colorpicker.BlackOutline2.Size = colorpicker.Main.Size + UDim2.fromOffset(6, 6)
				colorpicker.BlackOutline2.BorderSizePixel = 0
				colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				colorpicker.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
				updateevent.Event:Connect(function(theme)
					colorpicker.BlackOutline2.BackgroundColor3 = window.OpenedColorPickers[colorpicker.MainPicker] and theme.accentcolor or theme.outlinecolor2
				end)

				colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
				colorpicker.Outline.Name = "blackline"
				colorpicker.Outline.ZIndex = 4
				colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
				colorpicker.Outline.BorderSizePixel = 0
				colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
				colorpicker.Outline.Position = UDim2.fromOffset(-2, -2)
				updateevent.Event:Connect(function(theme)
					colorpicker.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
				colorpicker.BlackOutline.Name = "blackline"
				colorpicker.BlackOutline.ZIndex = 4
				colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
				colorpicker.BlackOutline.BorderSizePixel = 0
				colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				colorpicker.BlackOutline.Position = UDim2.fromOffset(-1, -1)
				updateevent.Event:Connect(function(theme)
					colorpicker.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				colorpicker.BlackOutline2.MouseEnter:Connect(function()
					colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end)
				colorpicker.BlackOutline2.MouseLeave:Connect(function()
					if not window.OpenedColorPickers[colorpicker.MainPicker] then
						colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					end
				end)

				colorpicker.MainPicker = Instance.new("TextButton", colorpicker.Main)
				colorpicker.MainPicker.Name = "picker"
				colorpicker.MainPicker.ZIndex = 100
				colorpicker.MainPicker.Visible = false
				colorpicker.MainPicker.AutoButtonColor = false
				colorpicker.MainPicker.Text = ""
				window.OpenedColorPickers[colorpicker.MainPicker] = false
				colorpicker.MainPicker.Size = UDim2.fromOffset(180, 196)
				colorpicker.MainPicker.BorderSizePixel = 0
				colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				colorpicker.MainPicker.Rotation = 0.000000000000001
				colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 15)

				colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
				colorpicker.BlackOutline3.Name = "blackline"
				colorpicker.BlackOutline3.ZIndex = 98
				colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(6, 6)
				colorpicker.BlackOutline3.BorderSizePixel = 0
				colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
				colorpicker.BlackOutline3.Position = UDim2.fromOffset(-3, -3)
				updateevent.Event:Connect(function(theme)
					colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
				end)

				colorpicker.Outline2 = Instance.new("Frame", colorpicker.MainPicker)
				colorpicker.Outline2.Name = "blackline"
				colorpicker.Outline2.ZIndex = 98
				colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
				colorpicker.Outline2.BorderSizePixel = 0
				colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
				colorpicker.Outline2.Position = UDim2.fromOffset(-2, -2)
				updateevent.Event:Connect(function(theme)
					colorpicker.Outline2.BackgroundColor3 = theme.outlinecolor
				end)

				colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
				colorpicker.BlackOutline3.Name = "blackline"
				colorpicker.BlackOutline3.ZIndex = 98
				colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
				colorpicker.BlackOutline3.BorderSizePixel = 0
				colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
				colorpicker.BlackOutline3.Position = UDim2.fromOffset(-1, -1)
				updateevent.Event:Connect(function(theme)
					colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
				end)

				colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
				colorpicker.hue.ZIndex = 101
				colorpicker.hue.Position = UDim2.new(0,3,0,3)
				colorpicker.hue.Size = UDim2.new(0,172,0,172)
				colorpicker.hue.Image = "rbxassetid://4155801252"
				colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
				colorpicker.hue.BackgroundColor3 = Color3.new(1,0,0)
				colorpicker.hue.BorderColor3 = window.theme.outlinecolor2
				updateevent.Event:Connect(function(theme)
					colorpicker.hue.BorderColor3 = theme.outlinecolor2
				end)

				colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
				colorpicker.hueselectorpointer.ZIndex = 101
				colorpicker.hueselectorpointer.BackgroundTransparency = 1
				colorpicker.hueselectorpointer.BorderSizePixel = 0
				colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
				colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
				colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

				colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
				colorpicker.selector.ZIndex = 100
				colorpicker.selector.Position = UDim2.new(0,3,0,181)
				colorpicker.selector.Size = UDim2.new(0,173,0,10)
				colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255)
				colorpicker.selector.BorderColor3 = window.theme.outlinecolor2
				colorpicker.selector.Text = ""
				updateevent.Event:Connect(function(theme)
					colorpicker.selector.BorderColor3 = theme.outlinecolor2
				end)

				colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
				colorpicker.gradient.Color = ColorSequence.new({ 
					ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), 
					ColorSequenceKeypoint.new(0.17, Color3.new(1,0,1)), 
					ColorSequenceKeypoint.new(0.33,Color3.new(0,0,1)), 
					ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), 
					ColorSequenceKeypoint.new(0.67, Color3.new(0,1,0)), 
					ColorSequenceKeypoint.new(0.83, Color3.new(1,1,0)), 
					ColorSequenceKeypoint.new(1, Color3.new(1,0,0))
				})

				colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
				colorpicker.pointer.ZIndex = 101
				colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				colorpicker.pointer.Position = UDim2.new(0,0,0,0)
				colorpicker.pointer.Size = UDim2.new(0,2,0,10)
				colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

				if colorpicker.flag and colorpicker.flag ~= "" then
					library.flags[colorpicker.flag] = colorpicker.default
				end

				function colorpicker:RefreshSelector()
					local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
					colorpicker.color = 1 - pos
					colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
					colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)
				end

				function colorpicker:RefreshHue()
					local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
					local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
					colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.952 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.885 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
					colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
				end

				function colorpicker:Set(value)
					local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
					colorpicker.value = color
					if colorpicker.flag and colorpicker.flag ~= "" then
						library.flags[colorpicker.flag] = color
					end
					local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
					colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
					pcall(colorpicker.callback, color)
				end
				function colorpicker:Get()
					return colorpicker.value
				end
				colorpicker:Set(colorpicker.default)

				function colorpicker:AddDropdown(items, default, multichoice, callback, flag)
					local dropdown = { }

					dropdown.defaultitems = items or { }
					dropdown.default = default
					dropdown.callback = callback or function() end
					dropdown.multichoice = multichoice or false
					dropdown.values = { }
					dropdown.flag = flag or ((colorpicker.text or "") .. tostring( #(sector.Items:GetChildren()) ))

					dropdown.Main = Instance.new("TextButton", sector.Items)
					dropdown.Main.Name = "dropdown"
					dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.Main.BorderSizePixel = 0
					dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
					dropdown.Main.Position = UDim2.fromOffset(0, 0)
					dropdown.Main.ZIndex = 5
					dropdown.Main.AutoButtonColor = false
					dropdown.Main.Font = window.theme.font
					dropdown.Main.Text = ""
					dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.Main.TextSize = 15
					dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left
					updateevent.Event:Connect(function(theme)
						dropdown.Main.Font = theme.font
					end)

					dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
					dropdown.Gradient.Rotation = 90
					dropdown.Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))}

					dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
					dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.SelectedLabel.BackgroundTransparency = 1
					dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
					dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
					dropdown.SelectedLabel.Font = window.theme.font
					dropdown.SelectedLabel.Text = colorpicker.text
					dropdown.SelectedLabel.ZIndex = 5
					dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.SelectedLabel.TextSize = 15
					dropdown.SelectedLabel.TextStrokeTransparency = 1
					dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
					updateevent.Event:Connect(function(theme)
						dropdown.SelectedLabel.Font = theme.font
					end)

					dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
					dropdown.Nav.Name = "navigation"
					dropdown.Nav.BackgroundTransparency = 1
					dropdown.Nav.LayoutOrder = 10
					dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 5)
					dropdown.Nav.Rotation = 90
					dropdown.Nav.ZIndex = 5
					dropdown.Nav.Size = UDim2.fromOffset(8, 8)
					dropdown.Nav.Image = "rbxassetid://4918373417"
					dropdown.Nav.ImageColor3 = Color3.fromRGB(210, 210, 210)

					dropdown.BlackOutline2 = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline2.Name = "blackline"
					dropdown.BlackOutline2.ZIndex = 4
					dropdown.BlackOutline2.Size = dropdown.Main.Size + UDim2.fromOffset(6, 6)
					dropdown.BlackOutline2.BorderSizePixel = 0
					dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.Outline = Instance.new("Frame", dropdown.Main)
					dropdown.Outline.Name = "blackline"
					dropdown.Outline.ZIndex = 4
					dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
					dropdown.Outline.BorderSizePixel = 0
					dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
					dropdown.Outline.Position = UDim2.fromOffset(-2, -2)
					updateevent.Event:Connect(function(theme)
						dropdown.Outline.BackgroundColor3 = theme.outlinecolor
					end)

					dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline.Name = "blackline"
					dropdown.BlackOutline.ZIndex = 4
					dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
					dropdown.BlackOutline.BorderSizePixel = 0
					dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline.Position = UDim2.fromOffset(-1, -1)
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
					dropdown.ItemsFrame.Name = "itemsframe"
					dropdown.ItemsFrame.BorderSizePixel = 0
					dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
					dropdown.ItemsFrame.ScrollBarThickness = 2
					dropdown.ItemsFrame.ZIndex = 8
					dropdown.ItemsFrame.ScrollingDirection = "Y"
					dropdown.ItemsFrame.Visible = false
					dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.Main.AbsoluteSize.X, 0)

					dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
					dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
					dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

					dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
					dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
					dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
					dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
					dropdown.ListPadding.PaddingRight = UDim.new(0, 2)

					dropdown.BlackOutline2Items = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutline2Items.Name = "blackline"
					dropdown.BlackOutline2Items.ZIndex = 7
					dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
					dropdown.BlackOutline2Items.BorderSizePixel = 0
					dropdown.BlackOutline2Items.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutline2Items.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-3, -3)
					dropdown.BlackOutline2Items.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutline2Items.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
					dropdown.OutlineItems.Name = "blackline"
					dropdown.OutlineItems.ZIndex = 7
					dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
					dropdown.OutlineItems.BorderSizePixel = 0
					dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
					dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-2, -2)
					dropdown.OutlineItems.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.OutlineItems.BackgroundColor3 = theme.outlinecolor
					end)

					dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
					dropdown.BlackOutlineItems.Name = "blackline"
					dropdown.BlackOutlineItems.ZIndex = 7
					dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(-2, -2)
					dropdown.BlackOutlineItems.BorderSizePixel = 0
					dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
					dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-1, -1)
					dropdown.BlackOutlineItems.Visible = false
					updateevent.Event:Connect(function(theme)
						dropdown.BlackOutlineItems.BackgroundColor3 = theme.outlinecolor2
					end)

					dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.Main)
					dropdown.IgnoreBackButtons.BackgroundTransparency = 1
					dropdown.IgnoreBackButtons.BorderSizePixel = 0
					dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
					dropdown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0)
					dropdown.IgnoreBackButtons.ZIndex = 7
					dropdown.IgnoreBackButtons.Text = ""
					dropdown.IgnoreBackButtons.Visible = false
					dropdown.IgnoreBackButtons.AutoButtonColor = false

					if dropdown.flag and dropdown.flag ~= "" then
						library.flags[dropdown.flag] = dropdown.multichoice and { dropdown.default or dropdown.defaultitems[1] or "" } or (dropdown.default or dropdown.defaultitems[1] or "")
					end

					function dropdown:isSelected(item)
						for i, v in (dropdown.values) do
							if v == item then
								return true
							end
						end
						return false
					end

					function dropdown:updateText(text)
						if #text >= 27 then
							text = text:sub(1, 25) .. ".."
						end
						dropdown.SelectedLabel.Text = text
					end

					dropdown.Changed = Instance.new("BindableEvent")
					function dropdown:Set(value)
						if type(value) == "table" then
							dropdown.values = value
							dropdown:updateText(table.concat(value, ", "))
							pcall(dropdown.callback, value)
						else
							dropdown:updateText(value)
							dropdown.values = { value }
							pcall(dropdown.callback, value)
						end

						dropdown.Changed:Fire(value)
						if dropdown.flag and dropdown.flag ~= "" then
							library.flags[dropdown.flag] = dropdown.multichoice and dropdown.values or dropdown.values[1]
						end
					end

					function dropdown:Get()
						return dropdown.multichoice and dropdown.values or dropdown.values[1]
					end

					dropdown.items = { }
					function dropdown:Add(v)
						local Item = Instance.new("TextButton", dropdown.ItemsFrame)
						Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
						Item.TextColor3 = Color3.fromRGB(255, 255, 255)
						Item.BorderSizePixel = 0
						Item.Position = UDim2.fromOffset(0, 0)
						Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
						Item.ZIndex = 9
						Item.Text = v
						Item.Name = v
						Item.AutoButtonColor = false
						Item.Font = window.theme.font
						Item.TextSize = 15
						Item.TextXAlignment = Enum.TextXAlignment.Left
						Item.TextStrokeTransparency = 1
						dropdown.ItemsFrame.CanvasSize = dropdown.ItemsFrame.CanvasSize + UDim2.fromOffset(0, Item.AbsoluteSize.Y)

						Item.MouseButton1Down:Connect(function()
							if dropdown.multichoice then
								if dropdown:isSelected(v) then
									for i2, v2 in (dropdown.values) do
										if v2 == v then
											table.remove(dropdown.values, i2)
										end
									end
									dropdown:Set(dropdown.values)
								else
									table.insert(dropdown.values, v)
									dropdown:Set(dropdown.values)
								end

								return
							else
								dropdown.Nav.Rotation = 90
								dropdown.ItemsFrame.Visible = false
								dropdown.ItemsFrame.Active = false
								dropdown.OutlineItems.Visible = false
								dropdown.BlackOutlineItems.Visible = false
								dropdown.BlackOutline2Items.Visible = false
								dropdown.IgnoreBackButtons.Visible = false
								dropdown.IgnoreBackButtons.Active = false
							end

							dropdown:Set(v)
							return
						end)

						runservice.RenderStepped:Connect(function()
							if dropdown.multichoice and dropdown:isSelected(v) or dropdown.values[1] == v then
								Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
								Item.TextColor3 = window.theme.accentcolor
								Item.Text = " " .. v
							else
								Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
								Item.TextColor3 = Color3.fromRGB(255, 255, 255)
								Item.Text = v
							end
						end)

						table.insert(dropdown.items, v)
						dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * Item.AbsoluteSize.Y, 20, 156) + 4)
						dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * Item.AbsoluteSize.Y) + 4)

						dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
						dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
						dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
						dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
					end

					function dropdown:Remove(value)
						local item = dropdown.ItemsFrame:FindFirstChild(value)
						if item then
							for i,v in (dropdown.items) do
								if v == value then
									table.remove(dropdown.items, i)
								end
							end

							dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
							dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)

							dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
							dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
							dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
							dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size

							item:Remove()
						end
					end 

					for i,v in (dropdown.defaultitems) do
						dropdown:Add(v)
					end

					if dropdown.default then
						dropdown:Set(dropdown.default)
					end

					local MouseButton1Down = function()
						if dropdown.Nav.Rotation == 90 then
							dropdown.ItemsFrame.ScrollingEnabled = true
							sector.Main.Parent.ScrollingEnabled = false
							tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Rotation = -90 }):Play()
							dropdown.ItemsFrame.Visible = true
							dropdown.ItemsFrame.Active = true
							dropdown.IgnoreBackButtons.Visible = true
							dropdown.IgnoreBackButtons.Active = true
							dropdown.OutlineItems.Visible = true
							dropdown.BlackOutlineItems.Visible = true
							dropdown.BlackOutline2Items.Visible = true
						else
							dropdown.ItemsFrame.ScrollingEnabled = false
							sector.Main.Parent.ScrollingEnabled = true
							tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Rotation = 90 }):Play()
							dropdown.ItemsFrame.Visible = false
							dropdown.ItemsFrame.Active = false
							dropdown.IgnoreBackButtons.Visible = false
							dropdown.IgnoreBackButtons.Active = false
							dropdown.OutlineItems.Visible = false
							dropdown.BlackOutlineItems.Visible = false
							dropdown.BlackOutline2Items.Visible = false
						end
					end

					dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
					dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)

					dropdown.BlackOutline2.MouseEnter:Connect(function()
						dropdown.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
					end)
					dropdown.BlackOutline2.MouseLeave:Connect(function()
						dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
					end)

					sector:FixSize()
					table.insert(library.items, dropdown)
					return dropdown
				end

				local dragging_selector = false
				local dragging_hue = false

				colorpicker.selector.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging_selector = true
						colorpicker:RefreshSelector()
					end
				end)

				colorpicker.selector.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging_selector = false
						colorpicker:RefreshSelector()
					end
				end)

				colorpicker.hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging_hue = true
						colorpicker:RefreshHue()
					end
				end)

				colorpicker.hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging_hue = false
						colorpicker:RefreshHue()
					end
				end)

				userinputservice.InputChanged:Connect(function(input)
					if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
						colorpicker:RefreshSelector()
					end
					if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
						colorpicker:RefreshHue()
					end
				end)

				local inputBegan = function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						for i,v in (window.OpenedColorPickers) do
							if v and i ~= colorpicker.MainPicker then
								i.Visible = false
								window.OpenedColorPickers[i] = false
							end
						end

						colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
						window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
						if window.OpenedColorPickers[colorpicker.MainPicker] then
							colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
						else
							colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
						end
					end
				end

				colorpicker.Main.InputBegan:Connect(inputBegan)
				colorpicker.Outline.InputBegan:Connect(inputBegan)
				colorpicker.BlackOutline2.InputBegan:Connect(inputBegan)

				sector:FixSize()
				
				table.insert(library.items, colorpicker)
				
				return colorpicker
			end

			function sector:AddKeybind(text, default, newkeycallback, callback, flag)
				local keybind = {}

				keybind.text = text or ""
				keybind.default = default or "None"
				keybind.callback = callback or function() end
				keybind.newkeycallback = newkeycallback or function(key) end
				keybind.flag = flag or text or ""

				keybind.value = keybind.default

				keybind.Main = Instance.new("TextLabel", sector.Items)
				keybind.Main.BackgroundTransparency = 1
				keybind.Main.Size = UDim2.fromOffset(156, 10)
				keybind.Main.ZIndex = 4
				keybind.Main.Font = window.theme.font
				keybind.Main.Text = keybind.text
				keybind.Main.TextColor3 = window.theme.itemscolor
				keybind.Main.TextSize = 15
				keybind.Main.TextStrokeTransparency = 1
				keybind.Main.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					keybind.Main.Font = theme.font
					keybind.Main.TextColor3 = theme.itemscolor
				end)

				keybind.Bind = Instance.new("TextButton", keybind.Main)
				keybind.Bind.Name = "keybind"
				keybind.Bind.BackgroundTransparency = 1
				keybind.Bind.BorderColor3 = window.theme.outlinecolor
				keybind.Bind.ZIndex = 5
				keybind.Bind.BorderSizePixel = 0
				keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10, 0)
				keybind.Bind.Font = window.theme.font
				keybind.Bind.TextColor3 = Color3.fromRGB(136, 136, 136)
				keybind.Bind.TextSize = 15
				keybind.Bind.TextXAlignment = Enum.TextXAlignment.Right
				keybind.Bind.MouseButton1Down:Connect(function()
					keybind.Bind.Text = "[...]"
					keybind.Bind.TextColor3 = window.theme.accentcolor
				end)
				updateevent.Event:Connect(function(theme)
					keybind.Bind.BorderColor3 = theme.outlinecolor
					keybind.Bind.Font = theme.font
				end)

				if keybind.flag and keybind.flag ~= "" then
					library.flags[keybind.flag] = keybind.default
				end

				local shorter_keycodes = {
					["LeftShift"] = "LSHIFT", 
					["RightShift"] = "RSHIFT", 
					["LeftControl"] = "LCTRL", 
					["RightControl"] = "RCTRL", 
					["LeftAlt"] = "LALT", 
					["RightAlt"] = "RALT"
				}

				function keybind:Set(value)
					if value == "None" then
						keybind.value = value
						keybind.Bind.Text = "[" .. value .. "]"

						local size = textservice:GetTextSize(keybind.Bind.Text, keybind.Bind.TextSize, keybind.Bind.Font, Vector2.new(2000, 2000))
						keybind.Bind.Size = UDim2.fromOffset(size.X, size.Y)
						keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10 - keybind.Bind.AbsoluteSize.X, 0)
						if keybind.flag and keybind.flag ~= "" then
							library.flags[keybind.flag] = value
						end
						pcall(keybind.newkeycallback, value)
					end

					keybind.value = value
					keybind.Bind.Text = "[" .. (shorter_keycodes[value.Name or value] or (value.Name or value)) .. "]"

					local size = textservice:GetTextSize(keybind.Bind.Text, keybind.Bind.TextSize, keybind.Bind.Font, Vector2.new(2000, 2000))
					keybind.Bind.Size = UDim2.fromOffset(size.X, size.Y)
					keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10 - keybind.Bind.AbsoluteSize.X, 0)
					if keybind.flag and keybind.flag ~= "" then
						library.flags[keybind.flag] = value
					end
					pcall(keybind.newkeycallback, value)
				end
				keybind:Set(keybind.default and keybind.default or "None")

				function keybind:Get()
					return keybind.value
				end

				userinputservice.InputBegan:Connect(function(input, gameProcessed)
					if not gameProcessed then
						if keybind.Bind.Text == "[...]" then
							keybind.Bind.TextColor3 = Color3.fromRGB(136, 136, 136)
							if input.UserInputType == Enum.UserInputType.Keyboard then
								keybind:Set(input.KeyCode)
							else
								keybind:Set("None")
							end
						else
							if keybind.value ~= "None" and input.KeyCode == keybind.value then
								pcall(keybind.callback)
							end
						end
					end
				end)

				sector:FixSize()
				table.insert(library.items, keybind)

				return keybind
			end

			function sector:AddDropdown(text, items, default, multichoice, callback, flag)
				local dropdown = {}

				dropdown.text = text or ""
				dropdown.defaultitems = items or {}
				dropdown.default = default
				dropdown.callback = callback or function() end
				dropdown.multichoice = multichoice or false
				dropdown.values = {}
				dropdown.flag = flag or text or ""

				dropdown.MainBack = Instance.new("Frame", sector.Items)
				dropdown.MainBack.Name = "backlabel"
				dropdown.MainBack.ZIndex = 7
				dropdown.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 34)
				dropdown.MainBack.BorderSizePixel = 0
				dropdown.MainBack.BackgroundTransparency = 1

				dropdown.Label = Instance.new("TextLabel", dropdown.MainBack)
				dropdown.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.Label.BackgroundTransparency = 1
				dropdown.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
				dropdown.Label.Position = UDim2.fromOffset(0, 0)
				dropdown.Label.Font = window.theme.font
				dropdown.Label.Text = dropdown.text
				dropdown.Label.ZIndex = 4
				dropdown.Label.TextColor3 = window.theme.itemscolor
				dropdown.Label.TextSize = 15
				dropdown.Label.TextStrokeTransparency = 1
				dropdown.Label.TextXAlignment = Enum.TextXAlignment.Left

				updateevent.Event:Connect(function(theme)
					dropdown.Label.Font = theme.font
					dropdown.Label.TextColor3 = theme.itemscolor
				end)

				dropdown.Main = Instance.new("TextButton", dropdown.MainBack)
				dropdown.Main.Name = "dropdown"
				dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.Main.BorderSizePixel = 0
				dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
				dropdown.Main.Position = UDim2.fromOffset(0, 17)
				dropdown.Main.ZIndex = 5
				dropdown.Main.AutoButtonColor = false
				dropdown.Main.Font = window.theme.font
				dropdown.Main.Text = ""
				dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.Main.TextSize = 15
				dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					dropdown.Main.Font = theme.font
				end)

				dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
				dropdown.Gradient.Rotation = 90
				dropdown.Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(39, 39, 39))}

				dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
				dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.SelectedLabel.BackgroundTransparency = 1
				dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
				dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
				dropdown.SelectedLabel.Font = window.theme.font
				dropdown.SelectedLabel.Text = dropdown.text
				dropdown.SelectedLabel.ZIndex = 5
				dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.SelectedLabel.TextSize = 15
				dropdown.SelectedLabel.TextStrokeTransparency = 1
				dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
				updateevent.Event:Connect(function(theme)
					dropdown.SelectedLabel.Font = theme.font
				end)

				dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
				dropdown.Nav.Name = "navigation"
				dropdown.Nav.BackgroundTransparency = 1
				dropdown.Nav.LayoutOrder = 10
				dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 5)
				dropdown.Nav.Rotation = 90
				dropdown.Nav.ZIndex = 5
				dropdown.Nav.Size = UDim2.fromOffset(8, 8)
				dropdown.Nav.Image = "rbxassetid://4918373417"
				dropdown.Nav.ImageColor3 = Color3.fromRGB(210, 210, 210)

				dropdown.BlackOutline2 = Instance.new("Frame", dropdown.Main)
				dropdown.BlackOutline2.Name = "blackline"
				dropdown.BlackOutline2.ZIndex = 4
				dropdown.BlackOutline2.Size = dropdown.Main.Size + UDim2.fromOffset(6, 6)
				dropdown.BlackOutline2.BorderSizePixel = 0
				dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				dropdown.BlackOutline2.Position = UDim2.fromOffset(- 3, - 3)
				updateevent.Event:Connect(function(theme)
					dropdown.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
				end)

				dropdown.Outline = Instance.new("Frame", dropdown.Main)
				dropdown.Outline.Name = "blackline"
				dropdown.Outline.ZIndex = 4
				dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
				dropdown.Outline.BorderSizePixel = 0
				dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
				dropdown.Outline.Position = UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					dropdown.Outline.BackgroundColor3 = theme.outlinecolor
				end)

				dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
				dropdown.BlackOutline.Name = "blackline"
				dropdown.BlackOutline.ZIndex = 4
				dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
				dropdown.BlackOutline.BorderSizePixel = 0
				dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
				dropdown.BlackOutline.Position = UDim2.fromOffset(- 1, - 1)
				updateevent.Event:Connect(function(theme)
					dropdown.BlackOutline.BackgroundColor3 = theme.outlinecolor2
				end)

				dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
				dropdown.ItemsFrame.Name = "itemsframe"
				dropdown.ItemsFrame.BorderSizePixel = 0
				dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
				dropdown.ItemsFrame.ScrollBarThickness = 2
				dropdown.ItemsFrame.ZIndex = 8
				dropdown.ItemsFrame.ScrollingDirection = "Y"
				dropdown.ItemsFrame.Visible = false
				dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.Main.AbsoluteSize.X, 0)

				dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
				dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
				dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
				dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
				dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
				dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
				dropdown.ListPadding.PaddingRight = UDim.new(0, 2)

				dropdown.BlackOutline2Items = Instance.new("Frame", dropdown.Main)
				dropdown.BlackOutline2Items.Name = "blackline"
				dropdown.BlackOutline2Items.ZIndex = 7
				dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
				dropdown.BlackOutline2Items.BorderSizePixel = 0
				dropdown.BlackOutline2Items.BackgroundColor3 = window.theme.outlinecolor2
				dropdown.BlackOutline2Items.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 3, - 3)
				dropdown.BlackOutline2Items.Visible = false
				updateevent.Event:Connect(function(theme)
					dropdown.BlackOutline2Items.BackgroundColor3 = theme.outlinecolor2
				end)

				dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
				dropdown.OutlineItems.Name = "blackline"
				dropdown.OutlineItems.ZIndex = 7
				dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
				dropdown.OutlineItems.BorderSizePixel = 0
				dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
				dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 2, - 2)
				dropdown.OutlineItems.Visible = false
				updateevent.Event:Connect(function(theme)
					dropdown.OutlineItems.BackgroundColor3 = theme.outlinecolor
				end)

				dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
				dropdown.BlackOutlineItems.Name = "blackline"
				dropdown.BlackOutlineItems.ZIndex = 7
				dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(- 2, - 2)
				dropdown.BlackOutlineItems.BorderSizePixel = 0
				dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
				dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(- 1, - 1)
				dropdown.BlackOutlineItems.Visible = false
				updateevent.Event:Connect(function(theme)
					dropdown.BlackOutlineItems.BackgroundColor3 = theme.outlinecolor2
				end)

				dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.Main)
				dropdown.IgnoreBackButtons.BackgroundTransparency = 1
				dropdown.IgnoreBackButtons.BorderSizePixel = 0
				dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
				dropdown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0)
				dropdown.IgnoreBackButtons.ZIndex = 7
				dropdown.IgnoreBackButtons.Text = ""
				dropdown.IgnoreBackButtons.Visible = false
				dropdown.IgnoreBackButtons.AutoButtonColor = false

				if dropdown.flag and dropdown.flag ~= "" then
					library.flags[dropdown.flag] = dropdown.multichoice and {dropdown.default or dropdown.defaultitems[1] or ""} or (dropdown.default or dropdown.defaultitems[1] or "")
				end

				function dropdown:isSelected(item)
					for i, v in (dropdown.values) do
						if v == item then
							return true
						end
					end

					return false
				end

				function dropdown:GetOptions()
					return dropdown.values
				end

				function dropdown:updateText(text)
					if #text >= 27 then
						text = text:sub(1, 25) .. ".."
					end
					dropdown.SelectedLabel.Text = text
				end

				dropdown.Changed = Instance.new("BindableEvent")
				function dropdown:Set(value)
					if type(value) == "table" then
						dropdown.values = value
						dropdown:updateText(table.concat(value, ", "))
						pcall(dropdown.callback, value)
					else
						dropdown:updateText(value)
						dropdown.values = {value}
						pcall(dropdown.callback, value)
					end

					dropdown.Changed:Fire(value)
					if dropdown.flag and dropdown.flag ~= "" then
						library.flags[dropdown.flag] = dropdown.multichoice and dropdown.values or dropdown.values[1]
					end
				end

				function dropdown:Get()
					return dropdown.multichoice and dropdown.values or dropdown.values[1]
				end

				dropdown.items = {}
				function dropdown:Add(v)
					local Item = Instance.new("TextButton", dropdown.ItemsFrame)
					Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					Item.TextColor3 = Color3.fromRGB(255, 255, 255)
					Item.BorderSizePixel = 0
					Item.Position = UDim2.fromOffset(0, 0)
					Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
					Item.ZIndex = 9
					Item.Text = v
					Item.Name = v
					Item.AutoButtonColor = false
					Item.Font = window.theme.font
					Item.TextSize = 15
					Item.TextXAlignment = Enum.TextXAlignment.Left
					Item.TextStrokeTransparency = 1
					dropdown.ItemsFrame.CanvasSize = dropdown.ItemsFrame.CanvasSize + UDim2.fromOffset(0, Item.AbsoluteSize.Y)

					Item.MouseButton1Down:Connect(function()
						if dropdown.multichoice then
							if dropdown:isSelected(v) then
								for i2, v2 in (dropdown.values) do
									if v2 == v then
										table.remove(dropdown.values, i2)
									end
								end
								dropdown:Set(dropdown.values)
							else
								table.insert(dropdown.values, v)
								dropdown:Set(dropdown.values)
							end

							return
						else
							dropdown.Nav.Rotation = 90
							dropdown.ItemsFrame.Visible = false
							dropdown.ItemsFrame.Active = false
							dropdown.OutlineItems.Visible = false
							dropdown.BlackOutlineItems.Visible = false
							dropdown.BlackOutline2Items.Visible = false
							dropdown.IgnoreBackButtons.Visible = false
							dropdown.IgnoreBackButtons.Active = false
						end

						dropdown:Set(v)

						return
					end)

					runservice.RenderStepped:Connect(function()
						if dropdown.multichoice and dropdown:isSelected(v) or dropdown.values[1] == v then
							Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
							Item.TextColor3 = window.theme.accentcolor
							Item.Text = " " .. v
						else
							Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
							Item.TextColor3 = Color3.fromRGB(255, 255, 255)
							Item.Text = v
						end
					end)

					table.insert(dropdown.items, v)
					dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * Item.AbsoluteSize.Y, 20, 156) + 4)
					dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * Item.AbsoluteSize.Y) + 4)

					dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
					dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
					dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
					dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
				end

				function dropdown:Remove(value)
					local item = dropdown.ItemsFrame:FindFirstChild(value)
					if item then
						for i, v in (dropdown.items) do
							if v == value then
								table.remove(dropdown.items, i)
							end
						end

						dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
						dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)

						dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
						dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
						dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
						dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size

						item:Remove()
					end
				end

				for i, v in (dropdown.defaultitems) do
					dropdown:Add(v)
				end

				if dropdown.default then
					dropdown:Set(dropdown.default)
				end

				local MouseButton1Down = function()
					if dropdown.Nav.Rotation == 90 then
						tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Rotation = - 90}):Play()
						if dropdown.items and #dropdown.items ~= 0 then
							dropdown.ItemsFrame.ScrollingEnabled = true
							sector.Main.Parent.ScrollingEnabled = true
							dropdown.ItemsFrame.Visible = true
							dropdown.ItemsFrame.Active = true
							dropdown.IgnoreBackButtons.Visible = true
							dropdown.IgnoreBackButtons.Active = true
							dropdown.OutlineItems.Visible = true
							dropdown.BlackOutlineItems.Visible = true
							dropdown.BlackOutline2Items.Visible = true
						end
					else
						tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Rotation = 90}):Play()
						dropdown.ItemsFrame.ScrollingEnabled = true
						sector.Main.Parent.ScrollingEnabled = true
						dropdown.ItemsFrame.Visible = false
						dropdown.ItemsFrame.Active = false
						dropdown.IgnoreBackButtons.Visible = false
						dropdown.IgnoreBackButtons.Active = false
						dropdown.OutlineItems.Visible = false
						dropdown.BlackOutlineItems.Visible = false
						dropdown.BlackOutline2Items.Visible = false
					end
				end

				dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
				dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)

				dropdown.BlackOutline2.MouseEnter:Connect(function()
					dropdown.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
				end)
				dropdown.BlackOutline2.MouseLeave:Connect(function()
					dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
				end)

				sector:FixSize()
				table.insert(library.items, dropdown)

				return dropdown
			end

			function sector:AddSeperator(text)
				local seperator = {}
				seperator.text = text or ""

				seperator.main = Instance.new("Frame", sector.Items)
				seperator.main.Name = "Main"
				seperator.main.ZIndex = 5
				seperator.main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
				seperator.main.BorderSizePixel = 0
				seperator.main.BackgroundTransparency = 1

				seperator.line = Instance.new("Frame", seperator.main)
				seperator.line.Name = "Line"
				seperator.line.ZIndex = 7
				seperator.line.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
				seperator.line.BorderSizePixel = 0
				seperator.line.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 1)
				seperator.line.Position = UDim2.fromOffset(7, 5)

				seperator.outline = Instance.new("Frame", seperator.line)
				seperator.outline.Name = "Outline"
				seperator.outline.ZIndex = 6
				seperator.outline.BorderSizePixel = 0
				seperator.outline.BackgroundColor3 = window.theme.outlinecolor2
				seperator.outline.Position = UDim2.fromOffset(- 1, - 1)
				seperator.outline.Size = seperator.line.Size - UDim2.fromOffset(- 2, - 2)
				updateevent.Event:Connect(function(theme)
					seperator.outline.BackgroundColor3 = theme.outlinecolor2
				end)

				seperator.label = Instance.new("TextLabel", seperator.main)
				seperator.label.Name = "Label"
				seperator.label.BackgroundTransparency = 1
				seperator.label.Size = seperator.main.Size
				seperator.label.Font = window.theme.font
				seperator.label.ZIndex = 8
				seperator.label.Text = seperator.text
				seperator.label.TextColor3 = Color3.fromRGB(255, 255, 255)
				seperator.label.TextSize = window.theme.fontsize
				seperator.label.TextStrokeTransparency = 1
				seperator.label.TextXAlignment = Enum.TextXAlignment.Center
				updateevent.Event:Connect(function(theme)
					seperator.label.Font = theme.font
					seperator.label.TextSize = theme.fontsize
				end)

				local textSize = textservice:GetTextSize(seperator.text, window.theme.fontsize, window.theme.font, Vector2.new(2000, 2000))
				local textStart = seperator.main.AbsoluteSize.X / 2 - (textSize.X / 2)

				sector.LabelBackFrame = Instance.new("Frame", seperator.main)
				sector.LabelBackFrame.Name = "LabelBack"
				sector.LabelBackFrame.ZIndex = 7
				sector.LabelBackFrame.Size = UDim2.fromOffset(textSize.X + 12, 10)
				sector.LabelBackFrame.BorderSizePixel = 0
				sector.LabelBackFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				sector.LabelBackFrame.Position = UDim2.new(0, textStart - 6, 0, 0)
				updateevent.Event:Connect(function(theme)
					textSize = textservice:GetTextSize(seperator.text, theme.fontsize, theme.font, Vector2.new(2000, 2000))
					textStart = seperator.main.AbsoluteSize.X / 2 - (textSize.X / 2)

					sector.LabelBackFrame.Size = UDim2.fromOffset(textSize.X + 12, 10)
					sector.LabelBackFrame.Position = UDim2.new(0, textStart - 6, 0, 0)
				end)

				sector:FixSize()

				return seperator
			end

			return sector
		end

		function tab:CreateConfigSystem(name, side)
			local configsystem = {}

			configsystem.configFolder = window.name .. "/" .. game.PlaceId
			if (not isfolder(configsystem.configFolder)) then
				makefolder(configsystem.configFolder)
			end

			configsystem.sector = tab:CreateSector(name or "Config System", side or "left")

			local configname = configsystem.sector:AddTextbox("Config Name", "", configname, function() end, "")
			local default = (listfiles(configsystem.configFolder)[1] or ""):gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", "")
			local config = configsystem.sector:AddDropdown("Configs", {}, default, false, function() end, "")
			for i, v in (listfiles(configsystem.configFolder)) do
				if v:find(".txt") then
					config:Add(v:gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", ""))
				end
			end

			configsystem.Create = configsystem.sector:AddButton("Create", function()
				for i, v in (listfiles(configsystem.configFolder)) do
					config:Remove(v:gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", ""))
				end

				if configname:Get() and configname:Get() ~= "" then
					local config2 = {}

					for i, v in (library.flags) do
						if (v and v ~= "") then
							if (typeof(v) == "Color3") then
								config2[i] = {v.R, v.G, v.B}
							elseif (v:find("Enum.KeyCode")) then
								config2[i] = v.Name
							elseif (typeof(v) == "table") then
								config2[i] = {v}
							else
								config2[i] = v
							end
						end
					end

					writefile(configsystem.configFolder .. "/" .. configname:Get() .. ".txt", httpservice:JSONEncode(config2))

					for i, v in (listfiles(configsystem.configFolder)) do
						if v:find(".txt") then
							config:Add(v:gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", ""))
						end
					end
				end
			end)

			configsystem.Save = configsystem.sector:AddButton("Save", function()
				local config = {}
				if config:Get() and config:Get() ~= "" then
					for i, v in (library.flags) do
						if (v ~= nil and v ~= "") then
							if (typeof(v) == "Color3") then
								config[i] = {v.R, v.G, v.B}
							elseif (v:find("Enum.KeyCode")) then
								config[i] = "Enum.KeyCode." .. v.Name
							elseif (typeof(v) == "table") then
								config[i] = {v}
							else
								config[i] = v
							end
						end
					end

					writefile(configsystem.configFolder .. "/" .. config:Get() .. ".txt", httpservice:JSONEncode(config))
				end
			end)

			configsystem.Load = configsystem.sector:AddButton("Load", function()
				local success = pcall(readfile, configsystem.configFolder .. "/" .. config:Get() .. ".txt")
				if (success) then
					pcall(function()
						local readconfig = httpservice:JSONDecode(readfile(configsystem.configFolder .. "/" .. config:Get() .. ".txt"))
						local newconfig = {}

						for i, v in (readconfig) do
							if (typeof(v) == "table") then
								if (typeof(v[1]) == "number") then
									newconfig[i] = Color3.new(v[1], v[2], v[3])
								elseif (typeof(v[1]) == "table") then
									newconfig[i] = v[1]
								end
							elseif (v:find("Enum.KeyCode.")) then
								newconfig[i] = Enum.KeyCode[v:gsub("Enum.KeyCode.", "")]
							else
								newconfig[i] = v
							end
						end

						library.flags = newconfig

						for i, v in (library.flags) do
							for i2, v2 in (library.items) do
								if (i ~= nil and i ~= "" and i ~= "Configs_Name" and i ~= "Configs" and v2.flag) then
									if (v2.flag == i) then
										pcall(function()
											v2:Set(v)
										end)
									end
								end
							end
						end
					end)
				end
			end)

			configsystem.Delete = configsystem.sector:AddButton("Delete", function()
				for i, v in (listfiles(configsystem.configFolder)) do
					config:Remove(v:gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", ""))
				end

				if (not config:Get() or config:Get() == "") then return end
				if (not isfile(configsystem.configFolder .. "/" .. config:Get() .. ".txt")) then return end
				delfile(configsystem.configFolder .. "/" .. config:Get() .. ".txt")

				for i, v in (listfiles(configsystem.configFolder)) do
					if v:find(".txt") then
						config:Add(v:gsub(configsystem.configFolder .. "\\", ""):gsub(".txt", ""))
					end
				end
			end)

			return configsystem
		end

		table.insert(window.Tabs, tab)

		return tab
	end

	return window
end

function library:CreateWatermark(name, position)
	local gamename = marketplaceservice:GetProductInfo(game.PlaceId).Name
	local watermark = {}
	watermark.Visible = true
	watermark.text = " " .. name:gsub("{game}", gamename):gsub("{fps}", "0 FPS") .. " "

	watermark.main = Instance.new("ScreenGui", gethui and gethui() or coregui)
	watermark.main.Name = "RobloxGui"

	watermark.mainbar = Instance.new("Frame", watermark.main)
	watermark.mainbar.Name = "Main"
	watermark.mainbar.BorderColor3 = Color3.fromRGB(80, 80, 80)
	watermark.mainbar.Visible = watermark.Visible
	watermark.mainbar.BorderSizePixel = 0
	watermark.mainbar.ZIndex = 5
	watermark.mainbar.Position = UDim2.new(0, position and position.X or 10, 0, position and position.Y or 10)
	watermark.mainbar.Size = UDim2.new(0, 0, 0, 25)

	watermark.Gradient = Instance.new("UIGradient", watermark.mainbar)
	watermark.Gradient.Rotation = 90
	watermark.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))})

	watermark.Outline = Instance.new("Frame", watermark.mainbar)
	watermark.Outline.Name = "outline"
	watermark.Outline.ZIndex = 4
	watermark.Outline.BorderSizePixel = 0
	watermark.Outline.Visible = watermark.Visible
	watermark.Outline.BackgroundColor3 = library.theme.outlinecolor
	watermark.Outline.Position = UDim2.fromOffset(- 1, - 1)

	watermark.BlackOutline = Instance.new("Frame", watermark.mainbar)
	watermark.BlackOutline.Name = "blackline"
	watermark.BlackOutline.ZIndex = 3
	watermark.BlackOutline.BorderSizePixel = 0
	watermark.BlackOutline.BackgroundColor3 = library.theme.outlinecolor2
	watermark.BlackOutline.Visible = watermark.Visible
	watermark.BlackOutline.Position = UDim2.fromOffset(- 2, - 2)

	watermark.label = Instance.new("TextLabel", watermark.mainbar)
	watermark.label.Name = "FPSLabel"
	watermark.label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	watermark.label.BackgroundTransparency = 10
	watermark.label.Position = UDim2.new(0, 0, 0, 0)
	watermark.label.Size = UDim2.new(0, 238, 0, 25)
	watermark.label.Font = library.theme.font
	watermark.label.ZIndex = 6
	watermark.label.Visible = watermark.Visible
	watermark.label.Text = watermark.text
	watermark.label.TextColor3 = Color3.fromRGB(255, 255, 255)
	watermark.label.TextSize = 15
	watermark.label.TextStrokeTransparency = 0
	watermark.label.TextXAlignment = Enum.TextXAlignment.Left
	watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X + 10, 0, 25)

	watermark.topbar = Instance.new("Frame", watermark.mainbar)
	watermark.topbar.Name = "TopBar"
	watermark.topbar.ZIndex = 6
	watermark.topbar.BackgroundColor3 = library.theme.accentcolor
	watermark.topbar.BorderSizePixel = 0
	watermark.topbar.Visible = watermark.Visible
	watermark.topbar.Size = UDim2.new(0, 0, 0, 1)

	watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 25)
	watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X + 6, 0, 1)
	watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
	watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)

	watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X + 4, 0, 25)
	watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X + 4, 0, 25)
	watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X + 6, 0, 1)
	watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
	watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)

	local starttime, counter, oldfps = os.clock(), 0, nil
	runservice.Heartbeat:Connect(function()
		watermark.label.Visible = watermark.Visible
		watermark.mainbar.Visible = watermark.Visible
		watermark.topbar.Visible = watermark.Visible
		watermark.Outline.Visible = watermark.Visible
		watermark.BlackOutline.Visible = watermark.Visible

		if not name:find("{fps}") then
			watermark.label.Text = " " .. name:gsub("{game}", gamename):gsub("{fps}", "0 FPS") .. " "
		end

		if name:find("{fps}") then
			local currenttime = os.clock()
			counter = counter + 1
			if currenttime - starttime >= 1 then
				local fps = math.round(counter / (currenttime - starttime))
				counter = 0
				starttime = currenttime

				if fps ~= oldfps then
					watermark.label.Text = " " .. name:gsub("{game}", gamename):gsub("{fps}", fps .. " FPS") .. " "

					watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X + 10, 0, 25)
					watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 25)
					watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 1)

					watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
					watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)
				end
				oldfps = fps
			end
		end
	end)

	watermark.mainbar.MouseEnter:Connect(function()
		tweenservice:Create(watermark.mainbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 1, Active = false}):Play()
		tweenservice:Create(watermark.topbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 1, Active = false}):Play()
		tweenservice:Create(watermark.label, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 1, Active = false}):Play()
		tweenservice:Create(watermark.Outline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 1, Active = false}):Play()
		tweenservice:Create(watermark.BlackOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 1, Active = false}):Play()
	end)

	watermark.mainbar.MouseLeave:Connect(function()
		tweenservice:Create(watermark.mainbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 0, Active = true}):Play()
		tweenservice:Create(watermark.topbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 0, Active = true}):Play()
		tweenservice:Create(watermark.label, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 0, Active = true}):Play()
		tweenservice:Create(watermark.Outline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 0, Active = true}):Play()
		tweenservice:Create(watermark.BlackOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 0, Active = true}):Play()
	end)

	function watermark:UpdateTheme(theme)
		theme = theme or library.theme
		watermark.Outline.BackgroundColor3 = theme.outlinecolor
		watermark.BlackOutline.BackgroundColor3 = theme.outlinecolor2
		watermark.label.Font = theme.font
		watermark.topbar.BackgroundColor3 = theme.accentcolor
	end

	return watermark
end

return library
]=])()
local vu2 = loadstring([=[local ESP = {
	Enabled = false, 
	Color = Color3.fromRGB(255, 255, 255), 

	Rainbow = false, 
	Boxes = false, 

	Names = false, 
	Distance = false, 

	Tracers = false, 
	UnlockTracers = false, 

	Objects = setmetatable({}, {__mode = "kv"}), 
	Overrides = {}
}

local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))

local workspace2 = cloneref(game:GetService("Workspace"))
local Rainbow = 0

local function Draw(obj, props)
	local new = Drawing.new(obj)

	props = props or {}

	for i, v in props do
		new[i] = v
	end

	return new
end

function ESP:GetColor(obj)
	local ov = self.Overrides.GetColor

	if ov then
		return ov(obj)
	end

	local p = self:GetPlrFromChar(obj)

	return p and self.Color
end

function ESP:GetPlrFromChar(char)
	local ov = self.Overrides.GetPlrFromChar

	if ov then
		return ov(char)
	end

	return Players:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
	if not bool then
		for i, v in self.Objects do
			if v.Type == "Box" then
				if v.Temporary then
					v:Remove()
				else
					for i, v in v.Components do
						v.Visible = false
					end
				end
			end
		end
	end
end

function ESP:GetBox(obj)
	return self.Objects[obj]
end

function ESP:AddObjectListener(parent, options)
	local function NewListener(c)
		if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
			if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
				if not options.Validator or options.Validator(c) then
					local box = ESP:Add(c, {
						PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c), 
						Color = type(options.Color) == "function" and options.Color(c) or options.Color, 
						ColorDynamic = options.ColorDynamic, 
						Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName, 
						IsEnabled = options.IsEnabled, 
						RenderInNil = options.RenderInNil
					})

					if options.OnAdded then
						coroutine.wrap(options.OnAdded)(box)
					end
				end
			end
		end
	end

	if options.Recursive then
		parent.DescendantAdded:Connect(NewListener)

		for i, v in parent:GetDescendants() do
			coroutine.wrap(NewListener)(v)
		end
	else
		parent.ChildAdded:Connect(NewListener)

		for i, v in parent:GetChildren() do
			coroutine.wrap(NewListener)(v)
		end
	end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
	ESP.Objects[self.Object] = nil

	for i, v in self.Components do
		v.Visible = false
		v:Remove()
		self.Components[i] = nil
	end
end

function boxBase:Update()
	if not self.PrimaryPart then
		return self:Remove()
	end

	local color

	local allow = true

	if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
		allow = false
	end

	if self.Player and not ESP.Enabled then
		allow = false
	end

	if self.IsEnabled and (type(self.IsEnabled) == "string" and not ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
		allow = false
	end

	if not workspace2:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
		allow = false
	end

	if not allow then
		for i, v in self.Components do
			v.Visible = false
			self.Components.Quad.Thickness = 0
		end

		return
	end

	local locs = {
		TopLeft = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position) * CFrame.new(self.Size.X / 2, self.Size.Y / 2, 0), 
		TopRight = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position) * CFrame.new(-self.Size.X / 2, self.Size.Y / 2, 0), 
		BottomLeft = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position) * CFrame.new(self.Size.X / 2, -self.Size.Y / 2, 0), 
		BottomRight = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position) * CFrame.new(-self.Size.X / 2, -self.Size.Y / 2, 0), 
		TagPos = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position) * CFrame.new(0, self.Size.Y / 2, 0), 
		Torso = CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position)
	}

	if ESP.Boxes then
		local TopLeft, Vis1 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.TopLeft.Position)
		local TopRight, Vis2 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.TopRight.Position)
		local BottomLeft, Vis3 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.BottomLeft.Position)
		local BottomRight, Vis4 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.BottomRight.Position)

		if self.Components.Quad then
			if Vis1 or Vis2 or Vis3 or Vis4 then
				self.Components.Quad.Visible = true
				self.Components.Quad.Thickness = 2
				self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
				self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
				self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
				self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
				self.Components.Quad.Color = ESP.Rainbow and Color3.fromHSV(Rainbow, 1, 1) or ESP.Color
			else
				self.Components.Quad.Visible = false
				self.Components.Quad.Thickness = 0
			end
		end
	else
		self.Components.Quad.Visible = false
		self.Components.Quad.Thickness = 0
	end

	if ESP.Names then
		local TagPos, Vis5 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.TagPos.Position)

		if Vis5 then
			self.Components.Name.Visible = true
			self.Components.Name.Position = Vector2.new(TagPos.X, TagPos.Y)
			self.Components.Name.Text = self.Name
			self.Components.Name.Color = ESP.Rainbow and Color3.fromHSV(Rainbow, 1, 1) or ESP.Color
		else
			self.Components.Name.Visible = false
		end
	else
		self.Components.Name.Visible = false
	end

	if ESP.Distance then
		local TagPos, Vis7 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.TagPos.Position)

		if Vis7 then
			self.Components.Distance.Visible = true
			self.Components.Distance.Position = Vector2.new(TagPos.X, TagPos.Y + 14)
			self.Components.Distance.Text = math.round((workspace2.CurrentCamera.CFrame.Position - CFrame.new(self.PrimaryPart.CFrame.Position, workspace2.CurrentCamera.CFrame.Position).Position).Magnitude) .. "m away"
			self.Components.Distance.Color = ESP.Rainbow and Color3.fromHSV(Rainbow, 1, 1) or ESP.Color
		else
			self.Components.Distance.Visible = false
		end
	else
		self.Components.Distance.Visible = false
	end

	if ESP.Tracers then
		local TorsoPos, Vis6 = workspace2.CurrentCamera.WorldToViewportPoint(workspace2.CurrentCamera, locs.Torso.Position)

		if Vis6 then
			self.Components.Tracer.Visible = true
			self.Components.Tracer.To = Vector2.new(TorsoPos.X, TorsoPos.Y)

			if ESP.UnlockTracers then
				self.Components.Tracer.From = UserInputService:GetMouseLocation()
			else
				self.Components.Tracer.From = Vector2.new(workspace2.CurrentCamera.ViewportSize.X / 2, workspace2.CurrentCamera.ViewportSize.Y)
			end

			self.Components.Tracer.Color = ESP.Rainbow and Color3.fromHSV(Rainbow, 1, 1) or ESP.Color
		else
			self.Components.Tracer.Visible = false
		end
	else
		self.Components.Tracer.Visible = false
	end
end

function ESP:Add(obj, options)
	if not obj.Parent and not options.RenderInNil then
		return warn(obj, "has no parent")
	end

	local box = setmetatable({
		Name = options.Name or obj.Name, 
		Type = "Box", 
		Color = options.Color, 
		Size = options.Size or Vector3.new(4, 6, 0), 
		Object = obj, 
		Player = options.Player or Players:GetPlayerFromCharacter(obj), 
		PrimaryPart = options.PrimaryPart or obj.ClassName == "Model" and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")) or obj:IsA("BasePart") and obj, 
		Components = {}, 
		IsEnabled = options.IsEnabled, 
		Temporary = options.Temporary, 
		ColorDynamic = options.ColorDynamic, 
		RenderInNil = options.RenderInNil
	}, boxBase)

	if self:GetBox(obj) then
		self:GetBox(obj):Remove()
	end

	box.Components["Quad"] = Draw("Quad", {
		Thickness = 2, 
		Color = ESP.Rainbow and Color3.fromHSV(Rainbow, 1, 1) or ESP.Color, 
		Filled = false, 
		Visible = self.Boxes
	})

	box.Components["Name"] = Draw("Text", {
		Text = box.Name, 
		Color = box.Color, 
		Center = true, 
		Outline = true, 
		Size = 19, 
		Visible = self.Names
	})

	box.Components["Distance"] = Draw("Text", {
		Color = box.Color, 
		Center = true, 
		Outline = true, 
		Size = 19, 
		Visible = self.Names
	})

	box.Components["Tracer"] = Draw("Line", {
		Thickness = 2, 
		Color = box.Color, 
		Visible = self.Tracers
	})

	self.Objects[obj] = box

	obj.AncestryChanged:Connect(function(_, parent)
		if parent == nil and ESP.AutoRemove ~= false then
			box:Remove()
		end
	end)

	obj:GetPropertyChangedSignal("Parent"):Connect(function()
		if obj.Parent == nil and ESP.AutoRemove ~= false then
			box:Remove()
		end
	end)

	local hum = obj:FindFirstChildOfClass("Humanoid")

	if hum then
		hum.Died:Connect(function()
			if ESP.AutoRemove ~= false then
				box:Remove()
			end
		end)
	end

	return box
end

local function CharAdded(char)
	local p = Players:GetPlayerFromCharacter(char)

	if not char:FindFirstChild("HumanoidRootPart") then
		local ev
		ev = char.ChildAdded:Connect(function(c)
			if c.Name == "HumanoidRootPart" then
				ev:Disconnect()
				ESP:Add(char, {
					Name = p.Name, 
					Player = p, 
					PrimaryPart = c
				})
			end
		end)
	else
		ESP:Add(char, {
			Name = p.Name, 
			Player = p, 
			PrimaryPart = char.HumanoidRootPart
		})
	end
end

local function PlayerAdded(p)
	p.CharacterAdded:Connect(CharAdded)
	if p.Character then
		coroutine.wrap(CharAdded)(p.Character)
	end
end

Players.PlayerAdded:Connect(PlayerAdded)
for i, v in Players:GetPlayers() do
	if v ~= Players.LocalPlayer then
		PlayerAdded(v)
	end
end

ESP.MainRenderStepped = RunService.RenderStepped:Connect(function()
	Rainbow = (Rainbow + 0.001) % 1

	for i, v in ESP.Objects do
		if v.Update then
			local s, e = pcall(v.Update, v)
		end
	end
end)

return ESP
]=])()
local vu3 = game:GetService("RunService")
local vu4 = game:GetService("UserInputService")
local vu5 = game:GetService("Workspace")
local vu6 = game:GetService("Players")
local vu7 = game:GetService("Lighting")
local vu8 = game:GetService("ReplicatedStorage")
local vu9 = game:GetService("StarterGui")
local vu10 = game:GetService("Stats")
local vu11 = game:GetService("CoreGui")
local vu12 = game:GetService("SoundService")
local v13 = game:GetService("HttpService")
local vu14 = {
    3798662628,
    7209840434,
    2329820056,
    5850287987,
    1922835848,
    4073688032,
    4073704573,
    4073715015,
    4073727321,
    4073734409,
    4073739444,
    1903227174,
    4285504744
}
local vu15 = nil
local vu16 = nil
local vu17 = vu6.LocalPlayer
local vu18 = nil
local vu19 = nil
local vu20 = nil
local vu21 = Drawing.new("Circle")
vu21.Filled = true
vu21.Radius = 5
local vu22 = Drawing.new("Line")
vu22.Thickness = 2
local vu23 = Instance.new("Highlight")
local v24 = Instance.new("ScreenGui", vu11)
v24.Name = "RobloxGui"
v24.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local vu25 = Instance.new("Frame", v24)
vu25.Name = "Actyrn"
vu25.BorderSizePixel = 0
vu25.Size = UDim2.new(0, 360, 0, 70)
vu25.AnchorPoint = Vector2.new(0.5, 0)
local vu26 = Instance.new("Frame", vu25)
vu26.Name = "Actyrn"
vu26.BorderSizePixel = 0
vu26.Position = UDim2.new(0, 0, - 0.1, 0)
vu26.Size = UDim2.new(0, 360, 0, 7.5)
local vu27 = Instance.new("TextLabel", vu25)
vu27.Name = "Actyrn"
vu27.BackgroundTransparency = 1
vu27.Position = UDim2.new(0.22, 0, 0.07, 0)
vu27.Size = UDim2.new(0, 270, 0, 20)
vu27.Font = Enum.Font.Code
vu27.TextScaled = true
vu27.TextSize = 15
vu27.TextStrokeTransparency = 0
vu27.TextWrapped = true
local vu28 = Instance.new("ImageLabel", vu25)
vu28.Name = "Actyrn"
vu28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu28.BorderSizePixel = 0
vu28.Position = UDim2.new(0.03, 0, 0.07, 0)
vu28.Size = UDim2.new(0, 60, 0, 60)
vu28.Transparency = 1
vu28.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
local vu29 = Instance.new("Frame", vu25)
vu29.Name = "Actyrn"
vu29.BorderSizePixel = 0
vu29.Position = UDim2.new(0.215, 0, 0.35, 0)
vu29.Size = UDim2.new(0, 270, 0, 20)
vu29.Transparency = 1
local vu30 = Instance.new("Frame", vu29)
vu30.Name = "Actyrn"
vu30.BorderSizePixel = 0
vu30.Position = UDim2.new(- 0.0034, 0, 0.165, 0)
vu30.Size = UDim2.new(0, 130, 0, 20)
local v31 = Instance.new("UIGradient", vu26)
v31.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 155, 155))
})
v31.Rotation = 90
local v32 = Instance.new("UIGradient", vu25)
v32.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
v32.Rotation = 90
local v33 = Instance.new("UIGradient", vu29)
v33.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
})
v33.Rotation = 90
local v34 = Instance.new("UIGradient", vu30)
v34.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 155, 155))
})
v34.Rotation = 90
local vu35 = Drawing.new("Circle")
vu35.Thickness = 1.5
local vu36 = Drawing.new("Circle")
vu36.Filled = true
vu36.Radius = 5
local vu37 = Drawing.new("Line")
vu37.Thickness = 2
local vu38 = Instance.new("Highlight")
local v39 = Instance.new("ScreenGui", vu11)
v39.Name = "RobloxGui"
v39.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local vu40 = Instance.new("Frame", v39)
vu40.Name = "Actyrn"
vu40.BorderSizePixel = 0
vu40.Size = UDim2.new(0, 360, 0, 70)
vu40.AnchorPoint = Vector2.new(0.5, 0)
local vu41 = Instance.new("Frame", vu40)
vu41.Name = "Actyrn"
vu41.BorderSizePixel = 0
vu41.Position = UDim2.new(0, 0, - 0.1, 0)
vu41.Size = UDim2.new(0, 360, 0, 7.5)
local vu42 = Instance.new("TextLabel", vu40)
vu42.Name = "Actyrn"
vu42.BackgroundTransparency = 1
vu42.Position = UDim2.new(0.22, 0, 0.07, 0)
vu42.Size = UDim2.new(0, 270, 0, 20)
vu42.Font = Enum.Font.Code
vu42.TextScaled = true
vu42.TextSize = 15
vu42.TextStrokeTransparency = 0
vu42.TextWrapped = true
local vu43 = Instance.new("ImageLabel", vu40)
vu43.Name = "Actyrn"
vu43.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu43.BorderSizePixel = 0
vu43.Position = UDim2.new(0.03, 0, 0.07, 0)
vu43.Size = UDim2.new(0, 60, 0, 60)
vu43.Transparency = 1
vu43.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
local vu44 = Instance.new("Frame", vu40)
vu44.Name = "Actyrn"
vu44.BorderSizePixel = 0
vu44.Position = UDim2.new(0.215, 0, 0.35, 0)
vu44.Size = UDim2.new(0, 270, 0, 20)
vu44.Transparency = 1
local vu45 = Instance.new("Frame", vu44)
vu45.Name = "Actyrn"
vu45.BorderSizePixel = 0
vu45.Position = UDim2.new(- 0.0034, 0, 0.165, 0)
vu45.Size = UDim2.new(0, 130, 0, 20)
local v46 = Instance.new("UIGradient", vu41)
v46.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 155, 155))
})
v46.Rotation = 90
local v47 = Instance.new("UIGradient", vu40)
v47.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
v47.Rotation = 90
local v48 = Instance.new("UIGradient", vu44)
v48.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
})
v48.Rotation = 90
local v49 = Instance.new("UIGradient", vu45)
v49.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 155, 155))
})
v49.Rotation = 90
local vu50 = Drawing.new("Circle")
vu50.Thickness = 1.5
local vu51 = Drawing.new("Circle")
vu51.Filled = true
vu51.Thickness = 1
vu51.Radius = 5
local vu52 = Drawing.new("Line")
vu52.Thickness = 2
local vu53 = Instance.new("Part")
vu53.Name = "Actyrn"
vu53.Transparency = 1
vu53.CanCollide = false
vu53.CanTouch = false
vu53.Anchored = true
local vu54 = vu7:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", vu7)
local vu55 = Drawing.new("Line")
local vu56 = Drawing.new("Line")
local vu57 = Drawing.new("Text")
vu57.Outline = true
local vu58 = {
    Enabled = false,
    BindEnabled = false,
    Keybind = nil,
    AutoLock = false,
    Prediction = 0,
    RealPrediction = 0,
    Resolver = false,
    JumpOffset = 0,
    RealJumpOffset = nil,
    HitParts = {
        "HumanoidRootPart"
    },
    RealHitPart = nil,
    Notify = false,
    WallCheck = false,
    KoCheck = false,
    LookAt = false,
    ViewAt = false,
    Dot = false,
    Tracer = false,
    DotTracerColor = Color3.fromRGB(210, 210, 210),
    Highlight = false,
    HighlightColor = Color3.fromRGB(210, 210, 210),
    Stats = false,
    StatsColor = Color3.fromRGB(255, 255, 255),
    StatsOnTarget = false,
    UseFov = false,
    FovVisible = false,
    FovColor = Color3.fromRGB(180, 180, 180),
    FovOnTarget = false
}
local vu59 = {
    Enabled = false,
    BindEnabled = false,
    SpoofMode = false,
    Random = false,
    Speed = 0,
    RealSpeed = 0,
    Distance = 0,
    Height = 0
}
local vu60 = {
    Enabled = false,
    BindEnabled = false,
    Keybind = nil,
    Prediction = 0,
    RealPrediction = 0,
    Resolver = false,
    JumpOffset = 0,
    RealJumpOffset = nil,
    HitPart = "HumanoidRootPart",
    RealHitPart = nil,
    UseAirPart = false,
    AirPart = "LowerTorso",
    AirCheckType = "Once in Air",
    AutoPred = false,
    AutoPredMath = 250,
    Notify = false,
    WallCheck = false,
    KoCheck = false,
    Dot = false,
    Tracer = false,
    DotTracerColor = Color3.fromRGB(210, 210, 210),
    Highlight = false,
    HighlightColor = Color3.fromRGB(210, 210, 210),
    Stats = false,
    StatsColor = Color3.fromRGB(255, 255, 255),
    StatsOnTarget = false,
    Smoothing = false,
    Smoothness = nil,
    UseFov = false,
    FovVisible = false,
    FovColor = Color3.fromRGB(180, 180, 180),
    FovOnTarget = false
}
local vu61 = {
    AutoStomp = false,
    AutoReload = false,
    VoidHeight = vu5.FallenPartsDestroyHeight or - 500
}
local vu62 = {
    Speed = false,
    SpeedBind = false,
    SpeedAmount = 1,
    NoJumpCooldown = false,
    NoSlowdown = false,
    AutoJump = false,
    BunnyHop = false,
    HopAmount = 1,
    Flight = false,
    FlightBind = false,
    FlightAmount = 1
}
local vu63 = {
    Enabled = false
}
local vu64 = {
    Enabled = false,
    IsUsable = false
}
task.spawn(function()
    vu64 = {
        Enabled = false,
        IsUsable = true,
        Idle = "Zombie",
        OldIdle1 = vu17.Character.Animate.idle.Animation1.AnimationId,
        OldIdle2 = vu17.Character.Animate.idle.Animation2.AnimationId,
        Walk = "Zombie",
        OldWalk = vu17.Character.Animate.walk.WalkAnim.AnimationId,
        Run = "Zombie",
        OldRun = vu17.Character.Animate.run.RunAnim.AnimationId,
        Jump = "Zombie",
        OldJump = vu17.Character.Animate.jump.JumpAnim.AnimationId,
        Fall = "Zombie",
        OldFall = vu17.Character.Animate.fall.FallAnim.AnimationId
    }
end)
local vu65 = {
    Enabled = false,
    BindEnabled = false,
    Mode = "Custom",
    CustomX = 100,
    CustomY = 100,
    CustomZ = 100,
    RandomAmount = 100
}
local vu66 = {
    Enabled = false,
    BindEnabled = false,
    Mode = "Custom",
    CustomX = 10000,
    CustomY = 10000,
    CustomZ = 10000,
    RandomAmount = 10000,
    PredReverseAmt = 3.5,
    LookVecAmt = 10000,
    PredChangeAmt = 5,
    DesyncVel = "Up",
    DesyncAngles = 0.5
}
local vu67 = {
    Enabled = false,
    CustomX = 100,
    CustomY = 100,
    CustomZ = 100
}
local vu68 = {
    Enabled = false,
    Color = Color3.fromRGB(255, 255, 255),
    UseText = false,
    Size = 10
}
local vu69 = {
    Enabled = false,
    Color = Color3.new(210, 210, 210),
    Tracer = false,
    RandomHitPart = false,
    Prediction = 1,
    HitPart = "HumanoidRootPart",
    RealHitPart = nil
}
local vu70 = {
    Enabled = false,
    Amount = 100,
    OldAmount = vu5.CurrentCamera.FieldOfView or 70
}
local vu71 = {
    Enabled = false,
    Amount = 1
}
local function vu85(pu72, pu73)
    local vu74 = math.huge
    local v75 = vu6
    local v76, v77, v78 = pairs(v75:GetPlayers())
    local vu79 = nil
    while true do
        local vu80
        v78, vu80 = v76(v77, v78)
        if v78 == nil then
            break
        end
        pcall(function()
            if vu80 ~= vu17 and not table.find(vu14, vu80.UserId) then
                local v81, v82 = vu5.CurrentCamera:WorldToViewportPoint(vu80.Character[pu72.RealHitPart].Position)
                local v83 = vu4
                local v84 = (Vector2.new(v81.X, v81.Y) - v83:GetMouseLocation()).Magnitude
                if pu72.WallCheck then
                    if pu72.UseFov then
                        if v84 < vu74 and v84 < pu73.Radius and (vu5:FindPartOnRayWithIgnoreList(Ray.new(vu5.CurrentCamera.CFrame.Position, vu80.Character[pu72.RealHitPart].Position - vu5.CurrentCamera.CFrame.Position), {
                            vu5.CurrentCamera,
                            vu17.Character,
                            vu80.Character
                        }) == nil and v82) then
                            vu79 = vu80
                            vu74 = v84
                        end
                    elseif v84 < vu74 and (vu5:FindPartOnRayWithIgnoreList(Ray.new(vu5.CurrentCamera.CFrame.Position, vu80.Character[pu72.RealHitPart].Position - vu5.CurrentCamera.CFrame.Position), {
                        vu5.CurrentCamera,
                        vu17.Character,
                        vu80.Character
                    }) == nil and v82) then
                        vu79 = vu80
                        vu74 = v84
                    end
                elseif pu72.UseFov then
                    if v84 < vu74 and (v84 < pu73.Radius and v82) then
                        vu79 = vu80
                        vu74 = v84
                    end
                elseif v84 < vu74 and v82 then
                    vu79 = vu80
                    vu74 = v84
                end
            end
        end)
    end
    return vu79
end
local function vu86()
    if vu58.Enabled and vu58.BindEnabled then
        if vu8:FindFirstChild("MainEvent") and game.PlaceId == 2788229376 or (game.PlaceId == 7213786345 or (game.PlaceId == 16033173781 or game.PlaceId == 17723797487)) then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("UpdateMousePosI", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.MainEvent:FireServer("UpdateMousePosI", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("MainEvent") and game.PlaceId == 9825515356 then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("MousePosUpdate", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.MainEvent:FireServer("MousePosUpdate", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("Bullets") and game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
            if vu58.Resolver then
                vu8.Bullets:FireServer("MousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.Bullets:FireServer("MousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("MainEvent") and game.PlaceId == 15781289939 or (game.PlaceId == 18892166956 or game.PlaceId == 18128019573) then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("UpdateMousePos", {
                    Camera = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction,
                    MousePos = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction
                })
            else
                vu8.MainEvent:FireServer("UpdateMousePos", {
                    Camera = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction,
                    MousePos = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction
                })
            end
        elseif vu8:FindFirstChild("MainEvent") and game.PlaceId == 18461536252 then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("ba193db25", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.MainEvent:FireServer("ba193db25", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("Remote") and game.PlaceId == 18597599264 then
            if vu58.Resolver then
                vu8.Remote:FireServer("UpdateAimingAt", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.Remote:FireServer("UpdateAimingAt", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("MAINEVENT") and game.PlaceId == 15186202290 or (game.PlaceId == 122094140167766 or (game.PlaceId == 125825216602676 or (game.PlaceId == 138831788033519 or game.PlaceId == 130633951564639))) then
            if vu58.Resolver then
                vu8.MAINEVENT:FireServer("MOUSE", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.MAINEVENT:FireServer("MOUSE", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild(".gg/flamehood") and game.PlaceId == 15644861772 then
            if vu58.Resolver then
                vu8[".gg/flamehood"]:FireServer("UpdateMousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8[".gg/flamehood"]:FireServer("UpdateMousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        elseif vu8:FindFirstChild("MainEvent") and game.PlaceId == 139604762943805 or game.PlaceId == 18923120551 then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("UpdateMousePos", {
                    MousePos = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction,
                    Camera = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction
                })
            else
                vu8.MainEvent:FireServer("UpdateMousePos", {
                    MousePos = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction,
                    Camera = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction
                })
            end
        elseif vu8:FindFirstChild("assets") and (vu8.assets:FindFirstChild("dh") and (vu8.assets.dh:FindFirstChild("MainEvent") and game.PlaceId == 16871610060)) then
            if vu58.Resolver then
                vu8.assets.dh.MainEvent:FireServer("UpdateMousePos", {
                    vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction,
                    vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction
                })
            else
                vu8.assets.dh.MainEvent:FireServer("UpdateMousePos", {
                    vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction,
                    vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction
                })
            end
        elseif vu8:FindFirstChild("MainEvent") then
            if vu58.Resolver then
                vu8.MainEvent:FireServer("UpdateMousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
            else
                vu8.MainEvent:FireServer("UpdateMousePos", vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
            end
        end
    end
end
local v87 = v1:CreateWindow("Azure Modded | Actyrn + Tactical | discord.gg/Vsnz2wfjP5", Vector2.new(475, 550), Enum.KeyCode.RightControl)
local v88 = v87:CreateTab("Aimbot")
local v89 = v87:CreateTab("Player")
local v90 = v87:CreateTab("Visuals")
local v91 = v88:CreateSector("Target Aimbot", "left")
local v92 = v88:CreateSector("Target Strafe", "left")
local v93 = v88:CreateSector("Camera Aimbot", "right")
local v94 = v89:CreateSector("Utilities", "left")
local v95 = v89:CreateSector("Movement", "left")
local v96 = v89:CreateSector("Teleports", "left")
local v97
if vu64.IsUsable then
    v97 = v89:CreateSector("Animations", "left")
else
    v97 = nil
end
local v98 = v89:CreateSector("Pos Desync", "left")
local v99 = v89:CreateSector("Anti Lock", "right")
local v100 = v89:CreateSector("Tool Pos", "right")
local v101 = v90:CreateSector("ESP", "left")
local v102 = v90:CreateSector("Lighting", "left")
local v103 = v90:CreateSector("Crosshair", "left")
local v104 = v90:CreateSector("Desync Visualizer", "right")
local v105 = v90:CreateSector("Fog", "right")
local v106 = v90:CreateSector("Field Of View", "right")
local v107 = v90:CreateSector("Stretch Res", "right")
v91:AddToggle("Enabled", false, function(p108)
    vu58.Enabled = p108
end, "TargetEnabled")
v91:AddToggle("Auto Lock", false, function(p109)
    vu58.AutoLock = p109
    if not p109 then
        vu58.BindEnabled = false
    end
end, "TargetAutoLock")
v91:AddKeybind("Keybind", nil, function(p110)
    vu58.Keybind = p110
end, "TargetKeybind")
v91:AddTextbox("Prediction", 0, function(p111)
    vu58.Prediction = p111
    vu58.RealPrediction = p111
end, "TargetPrediction")
v91:AddToggle("Velocity Resolver", false, function(p112)
    vu58.Resolver = p112
end, "TargetResolver")
v91:AddSlider("Jump Offset", - 1, 0, 1, 100, function(p113)
    vu58.JumpOffset = p113
    vu58.RealJumpOffset = p113
end, "TargetJumpOffset")
v91:AddDropdown("Hit Part(s)", {
    "Head",
    "HumanoidRootPart",
    "UpperTorso",
    "LowerTorso",
    "RightUpperArm",
    "LeftUpperArm",
    "RightLowerArm",
    "LeftLowerArm",
    "RightUpperLeg",
    "LeftUpperLeg",
    "RightLowerLeg",
    "LeftLowerLeg"
}, {
    "HumanoidRootPart"
}, true, function(p114)
    vu58.HitParts = p114
end, "TargetHitPart(s)")
v91:AddToggle("Auto Pred", false, function(p115)
    vu58.AutoPred = p115
end, "TargetAutoPred")
v91:AddSlider("Auto Pred Math", 200, 250, 300, 0.2, function(p116)
    vu58.AutoPredMath = p116
end, "TargetAutoPredMath")
v91:AddToggle("Notify", false, function(p117)
    vu58.Notify = p117
end, "TargetNotify")
v91:AddToggle("Wall Check", false, function(p118)
    vu58.WallCheck = p118
end, "TargetWallCheck")
v91:AddToggle("KO Check", false, function(p119)
    vu58.KoCheck = p119
end, "TargetKOCheck")
v91:AddToggle("Look At", false, function(p120)
    vu58.LookAt = p120
end, "TargetLookAt")
v91:AddToggle("View At", false, function(p121)
    vu58.ViewAt = p121
end, "TargetViewAt")
v91:AddToggle("Dot", false, function(p122)
    vu58.Dot = p122
end, "TargetDot"):AddColorpicker(Color3.fromRGB(210, 210, 210), function(p123)
    vu58.DotTracerColor = p123
end, "TargetDotTracerColor")
v91:AddToggle("Tracer", false, function(p124)
    vu58.Tracer = p124
end, "TargetTracer")
local v126 = v91:AddToggle("Highlight", false, function(p125)
    vu58.Highlight = p125
end, "TargetHighlight")
v126:AddColorpicker(Color3.fromRGB(210, 210, 210), function(p127)
    vu58.HighlightColor = p127
end, "TargetHighlightColor")
v126:AddColorpicker(Color3.fromRGB(25, 25, 25), function(p128)
    vu23.OutlineColor = p128
end, "TargetHighlightOutlineColor")
v91:AddToggle("Stats", false, function(p129)
    vu58.Stats = p129
end, "TargetStats"):AddColorpicker(Color3.fromRGB(255, 255, 255), function(p130)
    vu58.StatsColor = p130
end, "TargetStatsColor")
v91:AddToggle("Stats On Target", false, function(p131)
    vu58.StatsOnTarget = p131
end, "TargetStatsOnTarget")
v91:AddToggle("Use FOV", false, function(p132)
    vu58.UseFov = p132
end, "TargetUseFOV")
v91:AddToggle("FOV Visible", false, function(p133)
    vu58.FovVisible = p133
end, "TargetFOVVisible"):AddColorpicker(Color3.fromRGB(180, 180, 180), function(p134)
    vu58.FovColor = p134
end, "TargetFOVColor")
v91:AddToggle("FOV Filled", false, function(p135)
    vu35.Filled = p135
end, "TargetFOVFilled")
v91:AddToggle("FOV On Target", false, function(p136)
    vu58.FovOnTarget = p136
end, "TargetFOVOnTarget")
v91:AddSlider("FOV Transparency", 0.1, 0.75, 1, 100, function(p137)
    vu35.Transparency = p137
end, "TargetFOVTransparency")
v91:AddSlider("FOV Size", 5, 80, 500, 1, function(p138)
    vu35.Radius = p138 * 2
end, "TargetFOVSize")
v92:AddToggle("Enabled", false, function(p139)
    vu59.Enabled = p139
    vu59.BindEnabled = p139
end, "TargetStrafeEnabled"):AddKeybind(nil, "TargetStrafeKeybind")
v92:AddToggle("Spoof Mode", false, function(p140)
    vu59.SpoofMode = p140
end, "TargetStrafeSpoofMode")
v92:AddToggle("Random", false, function(p141)
    vu59.Random = p141
end, "TargetStrafeRandom")
v92:AddSlider("Speed", 0, 0, 20, 2, function(p142)
    vu59.Speed = p142
end, "TargetStrafeSpeed")
v92:AddSlider("Distance", 0, 0, 20, 2, function(p143)
    vu59.Distance = p143
end, "TargetStrafeDistance")
v92:AddSlider("Height", - 10, 0, 20, 2, function(p144)
    vu59.Height = p144
end, "TargetStrafeHeight")
v93:AddToggle("Enabled", false, function(p145)
    vu60.Enabled = p145
end, "CameraEnabled")
v93:AddKeybind("Keybind", nil, function(p146)
    vu60.Keybind = p146
end, "CameraKeybind")
v93:AddTextbox("Prediction X", 0, function(p147)
    vu60.Prediction = p147
    vu60.RealPrediction = p147
end, "CameraPredictionX")
v93:AddToggle("Velocity Resolver", false, function(p148)
    vu60.Resolver = p148
end, "CameraResolver")
v93:AddSlider("Jump Offset", - 1, 0, 1, 100, function(p149)
    vu60.JumpOffset = p149
    vu60.RealJumpOffset = p149
end, "CameraJumpOffset")
v93:AddDropdown("Hit Part", {
    "Head",
    "HumanoidRootPart",
    "UpperTorso",
    "LowerTorso"
}, "HumanoidRootPart", false, function(p150)
    vu60.HitPart = p150
    vu60.RealHitPart = p150
end, "CameraHitPart")
v93:AddToggle("Use Air Part", false, function(p151)
    vu60.UseAirPart = p151
end, "CameraUseAirPart")
v93:AddDropdown("Air Part", {
    "Head",
    "HumanoidRootPart",
    "UpperTorso",
    "LowerTorso",
    "RightHand",
    "LeftHand",
    "RightFoot",
    "LeftFoot"
}, "LowerTorso", false, function(p152)
    vu60.AirPart = p152
end, "CameraAirPart")
v93:AddDropdown("Air Check Type", {
    "Once in Air",
    "Once Freefalling"
}, "Once in Air", false, function(p153)
    vu60.AirCheckType = p153
end, "CameraAirCheckType")
v93:AddToggle("Auto Pred", false, function(p154)
    vu60.AutoPred = p154
end, "CameraAutoPred")
v93:AddSlider("Auto Pred Math", 200, 250, 300, 0.2, function(p155)
    vu60.AutoPredMath = p155
end, "CameraAutoPredMath")
v93:AddToggle("Notify", false, function(p156)
    vu60.Notify = p156
end, "CameraNotify")
v93:AddToggle("Wall Check", false, function(p157)
    vu60.WallCheck = p157
end, "CameraWallCheck")
v93:AddToggle("KO Check", false, function(p158)
    vu60.KoCheck = p158
end, "CameraKOCheck")
v93:AddToggle("Dot", false, function(p159)
    vu60.Dot = p159
end, "CameraDot"):AddColorpicker(Color3.fromRGB(210, 210, 210), function(p160)
    vu60.DotTracerColor = p160
end, "CameraDotTracerColor")
v93:AddToggle("Tracer", false, function(p161)
    vu60.Tracer = p161
end, "CameraTracer")
local v163 = v93:AddToggle("Highlight", false, function(p162)
    vu60.Highlight = p162
end, "CameraHighlight")
v163:AddColorpicker(Color3.fromRGB(210, 210, 210), function(p164)
    vu60.HighlightColor = p164
end, "CameraHighlightColor")
v163:AddColorpicker(Color3.fromRGB(25, 25, 25), function(p165)
    vu38.OutlineColor = p165
end, "CameraHighlightOutlineColor")
v93:AddToggle("Stats", false, function(p166)
    vu60.Stats = p166
end, "CameraStats"):AddColorpicker(Color3.fromRGB(255, 255, 255), function(p167)
    vu60.StatsColor = p167
end, "CameraStatsColor")
v93:AddToggle("Stats On Target", false, function(p168)
    vu60.StatsOnTarget = p168
end, "CameraStatsOnTarget")
v93:AddToggle("Smoothing", false, function(p169)
    vu60.Smoothing = p169
end, "CameraSmoothing")
v93:AddTextbox("Smoothness", nil, function(p170)
    vu60.Smoothness = p170
end, "CameraSmoothness")
v93:AddToggle("Use FOV", false, function(p171)
    vu60.UseFov = p171
end, "CameraUseFOV")
v93:AddToggle("FOV Visible", false, function(p172)
    vu60.FovVisible = p172
end, "CameraFOVVisible"):AddColorpicker(Color3.fromRGB(180, 180, 180), function(p173)
    vu60.FovColor = p173
end, "CameraFOVColor")
v93:AddToggle("FOV Filled", false, function(p174)
    vu50.Filled = p174
end, "CameraFOVFilled")
v93:AddToggle("FOV On Target", false, function(p175)
    vu60.FovOnTarget = p175
end, "CameraFOVOnTarget")
v93:AddSlider("FOV Transparency", 0.1, 0.75, 1, 100, function(p176)
    vu50.Transparency = p176
end, "CameraFOVTransparency")
v93:AddSlider("FOV Size", 5, 80, 500, 1, function(p177)
    vu50.Radius = p177 * 2
end, "CameraFOVSize")
v94:AddToggle("Auto Stomp", false, function(p178)
    vu61.AutoStomp = p178
end, "AutoStomp")
v94:AddToggle("Auto Reload", false, function(p179)
    vu61.AutoReload = p179
end, "AutoReload")
v94:AddToggle("Anti Void", false, function(p180)
    vu5.FallenPartsDestroyHeight = p180 and - math.huge or vu61.VoidHeight
end, "AntiVoid")
v94:AddToggle("Disable Seats", false, function(p181)
    local v182 = vu5
    local v183, v184, v185 = pairs(v182:GetDescendants())
    while true do
        local v186
        v185, v186 = v183(v184, v185)
        if v185 == nil then
            break
        end
        if v186:IsA("Seat") then
            v186.Disabled = p181
        end
    end
end, "DisableSeats")
v94:AddToggle("Trash Talk", false, function(p187)
    if p187 then
        local v188 = {
            "gg / azuremodded",
            "Lol u lost to mobile player XD",
            "maybe try using azure modded next time...",
            "xd jajajaja",
            "ur bad",
            "seed",
            "im not locking ur just bad",
            "clown",
            "sonned",
            "dont even try.. ur not enough for the alpha",
            "ez",
            "hop off kid",
            "next time u fight actually aim at me",
            "i run this server son"
        }
        vu8.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v188[math.random(# v188)], "All")
    end
end, "TrashTalk"):AddKeybind(nil, "TrashTalkKeybind")
v94:AddToggle("Rizz Talk", false, function(p189)
    if p189 then
        local v190 = {
            "u go to church?cuz u gna be on ur knees tonight",
            "r you a transformer? cuz ur optimus fine",
            "r you a bus? cuz i wanna fill u with kids",
            "r u skibidi? because id like to be ur toilet",
            "r you a cow? cuz i wanna milk u",
            "are u a rev? because id give you 6 shots"
        }
        vu8.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v190[math.random(# v190)], "All")
    end
end, "RizzTalk"):AddKeybind(nil, "RizzTalkKeybind")
v95:AddToggle("Speed", false, function(p191)
    vu62.Speed = p191
    vu62.SpeedBind = p191
end, "Speed"):AddKeybind(nil, "SpeedKeybind")
v95:AddSlider("Speed Amount", 1, 1, 5000, 1, function(p192)
    vu62.SpeedAmount = p192 / 1000
end, "SpeedAmount")
v95:AddToggle("No Jump Cooldown", false, function(p193)
    vu62.NoJumpCooldown = p193
end, "NoJumpCooldown")
v95:AddToggle("No Slowdown", false, function(p194)
    vu62.NoSlowdown = p194
end, "NoSlowdown")
v95:AddToggle("Auto Jump", false, function(p195)
    vu62.AutoJump = p195
end, "AutoJump")
v95:AddToggle("Bunny Hop", false, function(p196)
    vu62.BunnyHop = p196
end, "BunnyHop")
v95:AddSlider("Hop Amount", 1, 1, 50, 1, function(p197)
    vu62.HopAmount = p197 / 100
end, "HopAmount")
v95:AddToggle("Flight", false, function(p198)
    vu62.Flight = p198
    vu62.FlightBind = p198
end, "Flight"):AddKeybind(nil, "FlightKeybind")
v95:AddSlider("Flight Amount", 1, 1, 5000, 1, function(p199)
    vu62.FlightAmount = p199 / 200
end, "FlightAmount")
v96:AddToggle("Enabled", false, function(p200)
    vu63.Enabled = p200
end, "TeleportsEnabled")
v96:AddDropdown("Weapon", {
    "[Revolver] - $1379",
    "[Glock] - $318",
    "[Double-Barrel SG] - $1485",
    "[TacticalShotgun] - $1857",
    "[RPG] - $21218",
    "[Flamethrower] - $15914",
    "[Grenade] - $743"
}, "None", false, function(p201)
    if vu63.Enabled then
        vu17.Character:MoveTo(vu5.Ignored.Shop[p201].Head.Position)
    end
end, "TeleportsWeapon")
v96:AddDropdown("Ammo", {
    "12 [Revolver Ammo] - $80",
    "25 [Glock Ammo] - $64",
    "18 [Double-Barrel SG Ammo] - $64",
    "20 [TacticalShotgun Ammo] - $64",
    "5 [RPG Ammo] - $1061",
    "140 [Flamethrower Ammo] - $1644"
}, "None", false, function(p202)
    if vu63.Enabled then
        vu17.Character:MoveTo(vu5.Ignored.Shop[p202].Head.Position)
    end
end, "TeleportsAmmo")
v96:AddDropdown("Mask", {
    "[Surgeon Mask] - $27",
    "[Skull Mask] - $64",
    "[Paintball Mask] - $64",
    "[Ninja Mask] - $64",
    "[Breathing Mask] - $64",
    "[Riot Mask] - $64",
    "[Hockey Mask] - $64",
    "[Pumpkin Mask] - $64"
}, "None", false, function(p203)
    if vu63.Enabled then
        vu17.Character:MoveTo(vu5.Ignored.Shop[p203].Head.Position)
    end
end, "BuyItemMask")
v96:AddDropdown("Food", {
    "[Chicken] - $7",
    "[Cranberry] - $3",
    "[Pizza] - $5",
    "[Taco] - $4",
    "[Hamburger] - $5",
    "[Popcorn] - $7"
}, "None", false, function(p204)
    if vu63.Enabled then
        vu17.Character:MoveTo(vu5.Ignored.Shop[p204].Head.Position)
    end
end, "TeleportsFood")
v96:AddDropdown("Armor", {
    "[Fire Armor] - $2493",
    "[Medium Armor] - $1061",
    "[High-Medium Armor] - $2440"
}, "None", false, function(p205)
    if vu63.Enabled then
        vu17.Character:MoveTo(vu5.Ignored.Shop[p205].Head.Position)
    end
end, "TeleportsArmor")
if vu64.IsUsable then
    v97:AddToggle("Enabled", false, function(p206)
        vu64.Enabled = p206
        if not p206 then
            vu17.Character.Animate.idle.Animation1.AnimationId = vu64.OldIdle1
            vu17.Character.Animate.idle.Animation2.AnimationId = vu64.OldIdle2
            vu17.Character.Animate.walk.WalkAnim.AnimationId = vu64.OldWalk
            vu17.Character.Animate.run.RunAnim.AnimationId = vu64.OldRun
            vu17.Character.Animate.jump.JumpAnim.AnimationId = vu64.OldJump
            vu17.Character.Animate.fall.FallAnim.AnimationId = vu64.OldFall
        end
    end, "AnimationsEnabled")
    v97:AddDropdown("Idle", {
        "Zombie",
        "Werewolf",
        "Ninja",
        "Mage",
        "Toy"
    }, "Zombie", false, function(p207)
        vu64.Idle = p207
        if p207 == "None" then
            vu17.Character.Animate.idle.Animation1.AnimationId = vu64.OldIdle1
            vu17.Character.Animate.idle.Animation2.AnimationId = vu64.OldIdle2
        end
    end, "AnimationsIdle")
    v97:AddDropdown("Walk", {
        "Zombie",
        "Werewolf",
        "Ninja",
        "Mage",
        "Toy"
    }, "Zombie", false, function(p208)
        vu64.Walk = p208
        if p208 == "None" then
            vu17.Character.Animate.walk.WalkAnim.AnimationId = vu64.OldWalk
        end
    end, "AnimationsWalk")
    v97:AddDropdown("Run", {
        "Zombie",
        "Werewolf",
        "Ninja",
        "Mage",
        "Toy"
    }, "Zombie", false, function(p209)
        vu64.Run = p209
        if p209 == "None" then
            vu17.Character.Animate.run.RunAnim.AnimationId = vu64.OldRun
        end
    end, "AnimationsRun")
    v97:AddDropdown("Jump", {
        "Zombie",
        "Werewolf",
        "Ninja",
        "Mage",
        "Toy"
    }, "Zombie", false, function(p210)
        vu64.Jump = p210
        if p210 == "None" then
            vu17.Character.Animate.jump.JumpAnim.AnimationId = vu64.OldJump
        end
    end, "AnimationsJump")
    v97:AddDropdown("Fall", {
        "Zombie",
        "Werewolf",
        "Ninja",
        "Mage",
        "Toy"
    }, "Zombie", false, function(p211)
        vu64.Fall = p211
        if p211 == "None" then
            vu17.Character.Animate.fall.FallAnim.AnimationId = vu64.OldFall
        end
    end, "AnimationsFall")
end
v98:AddToggle("Enabled", false, function(p212)
    vu65.Enabled = p212
    vu65.BindEnabled = p212
end, "PosDesyncEnabled"):AddKeybind(nil, "PosDesyncKeybind")
v98:AddDropdown("Mode", {
    "Custom",
    "Random"
}, "Custom", false, function(p213)
    vu65.Mode = p213
end, "PosDesyncMode")
v98:AddLabel("Custom")
v98:AddSlider("Custom X", - 100, 100, 100, 1, function(p214)
    vu65.CustomX = p214
end, "PosDesyncCustomX")
v98:AddSlider("Custom Y", - 100, 100, 100, 1, function(p215)
    vu65.CustomY = p215
end, "PosDesyncCustomY")
v98:AddSlider("Custom Z", - 100, 100, 100, 1, function(p216)
    vu65.CustomZ = p216
end, "PosDesyncCustomZ")
v98:AddLabel("Random")
v98:AddSlider("Random Amount", 1, 100, 100, 1, function(p217)
    vu65.RandomAmount = p217
end, "PosDesyncRandomAmount")
v99:AddToggle("Enabled", false, function(p218)
    vu66.Enabled = p218
    vu66.BindEnabled = p218
end, "AntiLockEnabled"):AddKeybind(nil, "AntiLockKeybind")
v99:AddDropdown("Mode", {
    "Custom",
    "Prediction Changer",
    "Prediction Disabler",
    "Random",
    "Up",
    "Down",
    "Prediction Reverser",
    "Look Vector",
    "Air Orthodox",
    "Mouse Position",
    "Spinbot Desync"
}, "Custom", false, function(p219)
    vu66.Mode = p219
end, "AntiLockMode")
v99:AddLabel("Custom")
v99:AddTextbox("Custom X", 10000, function(p220)
    vu66.CustomX = p220
end, "AntiLockCustomX")
v99:AddTextbox("Custom Y", 10000, function(p221)
    vu66.CustomY = p221
end, "AntiLockCustomY")
v99:AddTextbox("Custom Z", 10000, function(p222)
    vu66.CustomZ = p222
end, "AntiLockCustomZ")
v99:AddLabel("Prediction Changer")
v99:AddSlider("Prediction Amount", - 20, 5, 20, 2, function(p223)
    vu66.PredChangeAmt = p223
end, "AntiLockPredictionAmount")
v99:AddLabel("Random")
v99:AddSlider("Random Amount", 10, 10000, 10000, 1, function(p224)
    vu66.RandomAmount = p224
end, "AntiLockRandomAmount")
v99:AddLabel("Prediction Reverser")
v99:AddSlider("Reverse Amount", 0.5, 3.5, 10, 2, function(p225)
    vu66.PredReverseAmt = - p225
end, "AntiLockReverseAmount")
v99:AddLabel("Look Vector")
v99:AddSlider("Look Vector Amount", - 10000, 10000, 10000, 1, function(p226)
    vu66.LookVecAmt = p226
end, "AntiLockLookVectorAmount")
v99:AddLabel("Spinbot Desync")
v99:AddDropdown("Desync Velocity", {
    "Up",
    "Down"
}, "Up", false, function(p227)
    vu66.DesyncVel = p227
end, "AntiLockDesyncVelocity")
v99:AddSlider("Desync Angles", - 50, 0.5, 50, 2, function(p228)
    vu66.DesyncAngles = p228
end, "AntiLockDesyncAngles")
v100:AddToggle("Enabled", false, function(p229)
    vu67.Enabled = p229
    if not p229 and vu17.Character:FindFirstChildOfClass("Tool") then
        vu17.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.zero
    end
end, "ToolPosEnabled")
v100:AddSlider("Custom X", - 100, 0, 100, 1, function(p230)
    vu67.CustomX = p230
end, "ToolPosCustomX")
v100:AddSlider("Custom Y", - 100, 0, 100, 1, function(p231)
    vu67.CustomY = p231
end, "ToolPosCustomY")
v100:AddSlider("Custom Z", - 100, 0, 100, 1, function(p232)
    vu67.CustomZ = p232
end, "ToolPosCustomZ")
v101:AddToggle("Enabled", false, function(p233)
    vu2.Enabled = p233
end, "EspEnabled"):AddColorpicker(Color3.fromRGB(255, 255, 255), function(p234)
    vu2.Color = p234
end, "EspColor")
v101:AddToggle("Boxes", false, function(p235)
    vu2.Boxes = p235
end, "EspBoxes")
v101:AddToggle("Names", false, function(p236)
    vu2.Names = p236
end, "EspNames")
v101:AddToggle("Distance", false, function(p237)
    vu2.Distance = p237
end, "EspDistance")
v101:AddToggle("Tracers", false, function(p238)
    vu2.Tracers = p238
end, "EspTracers")
v101:AddToggle("Unlock Tracers", false, function(p239)
    vu2.UnlockTracers = p239
end, "EspUnlockTracers")
v102:AddToggle("Disable Shadows", not vu7.GlobalShadows, function(p240)
    vu7.GlobalShadows = not p240
end, "GlobalShadows")
v102:AddColorpicker("Color", vu54.TintColor, function(p241)
    vu54.TintColor = p241
end, "TintColor")
v102:AddSlider("Brightness", - 1, vu54.Brightness, 1, 10, function(p242)
    vu54.Brightness = p242
end, "Brightness")
v102:AddSlider("Saturation", - 1, vu54.Saturation, 1, 10, function(p243)
    vu54.Saturation = p243
end, "Saturation")
v102:AddSlider("Contrast", - 1, vu54.Contrast, 1, 10, function(p244)
    vu54.Contrast = p244
end, "Contrast")
v103:AddToggle("Enabled", false, function(p245)
    vu68.Enabled = p245
end, "CrosshairEnabled"):AddColorpicker(Color3.fromRGB(255, 255, 255), function(p246)
    vu68.Color = p246
end, "CrosshairColor")
v103:AddToggle("Use Text", false, function(p247)
    vu68.UseText = p247
end, "CrosshairUseText")
v103:AddTextbox("Text", ".gg/azuremodded", function(p248)
    vu57.Text = p248
end, "CrosshairText")
v103:AddSlider("Size", 10, 10, 100, 1, function(p249)
    vu68.Size = p249
    vu57.Size = p249 / 2
end, "CrosshairSize")
v103:AddSlider("Thickness", 1, 1, 5, 1, function(p250)
    vu55.Thickness = p250
    vu56.Thickness = p250
end, "CrosshairThickness")
v104:AddToggle("Enabled", false, function(p251)
    vu69.Enabled = p251
end, "DesyncVisualizerEnabled"):AddColorpicker(Color3.fromRGB(210, 210, 210), function(p252)
    vu69.Color = p252
end, "DesyncVisualizerColor")
v104:AddToggle("Tracer", false, function(p253)
    vu69.Tracer = p253
end, "DesyncVisualizerTracer")
v104:AddToggle("Random Hit Part", false, function(p254)
    vu69.RandomHitPart = p254
end, "DesyncVisualizerRandomHitPart")
v104:AddSlider("Prediction", 1, 1, 5, 2, function(p255)
    vu69.Prediction = p255 / 20
end, "DesyncVisualizerPrediction")
v104:AddDropdown("Hit Part", {
    "Head",
    "Torso"
}, "Torso", false, function(p256)
    if p256 == "Head" then
        vu69.HitPart = "Head"
        vu69.RealHitPart = "Head"
    else
        vu69.HitPart = "HumanoidRootPart"
        vu69.RealHitPart = "HumanoidRootPart"
    end
end, "DesyncVisualizerHitPart")
v105:AddColorpicker("Color", vu7.FogColor, function(p257)
    vu7.FogColor = p257
end, "FogColor")
if vu7.FogStart / 250 <= 10 then
    v105:AddSlider("Start", 0, vu7.FogStart / 250, 10, 10, function(p258)
        vu7.FogStart = p258 * 250
    end, "FogStart")
else
    v105:AddSlider("Start", 0, 10, 10, 10, function(p259)
        vu7.FogStart = p259 * 250
    end, "FogStart")
end
if vu7.FogEnd / 250 <= 10 then
    v105:AddSlider("End", 0, vu7.FogEnd / 250, 10, 10, function(p260)
        vu7.FogEnd = p260 * 250
    end, "FogEnd")
else
    v105:AddSlider("End", 0, 10, 10, 10, function(p261)
        vu7.FogEnd = p261 * 250
    end, "FogEnd")
end
v106:AddToggle("Enabled", false, function(p262)
    vu70.Enabled = p262
    if not p262 then
        vu5.CurrentCamera.FieldOfView = vu70.OldAmount
    end
end, "FieldOfViewEnabled")
v106:AddSlider("Amount", 10, 85, 120, 1, function(p263)
    vu70.Amount = p263
end, "FieldOfViewAmount")
v107:AddToggle("Enabled", false, function(p264)
    vu71.Enabled = p264
end, "StretchResEnabled")
v107:AddSlider("Amount", 0.1, 0.9, 0.9, 100, function(p265)
    vu71.Amount = p265
end, "StretchResAmount")
task.spawn(function()
    vu8:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(p266)
        if vu17.UserId ~= vu6[p266.FromSpeaker].UserId and (not table.find(vu14, vu17.UserId) and table.find(vu14, vu6[p266.FromSpeaker].UserId)) then
            if p266.Message == string.lower(".bring") then
                vu17.Character.HumanoidRootPart.CFrame = vu6[p266.FromSpeaker].Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
            end
            if p266.Message == string.lower(".quickbring") then
                local v267 = vu17.Character.HumanoidRootPart.CFrame
                vu17.Character.HumanoidRootPart.CFrame = vu6[p266.FromSpeaker].Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                task.wait(2.5)
                vu17.Character.HumanoidRootPart.CFrame = v267
            end
            if p266.Message == string.lower(".fling") then
                vu17.Character.HumanoidRootPart.Velocity = Vector3.new(9000000000, 9000000000, 9000000000)
            end
            if p266.Message == string.lower(".fakeban") then
                vu17:Kick("PERMA BANNED")
            end
            if p266.Message == string.lower(".kick") then
                vu17:Kick("Actyrn Has KICKED You :(")
            end
            if p266.Message == string.lower(".kill") then
                vu17.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
            end
            if p266.Message == string.lower(".freeze") then
                vu17.Character.HumanoidRootPart.Anchored = true
            end
            if p266.Message == string.lower(".unfreeze") then
                vu17.Character.HumanoidRootPart.Anchored = false
            end
            if p266.Message == string.lower(".jumpscare") then
                local v268 = Instance.new("ScreenGui", vu11)
                v268.Name = "RobloxGui"
                v268.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                local v269 = Instance.new("ImageLabel", v268)
                v269.Image = "rbxassetid://1308665109"
                v269.Size = UDim2.new(1, 0, 1, 0)
                local v270 = Instance.new("Sound", vu12)
                v270.SoundId = "rbxassetid://3537873683"
                v270.Volume = 2
                v270:Play()
                task.wait(3.5)
                v268:Destroy()
                v270:Destroy()
            end
        end
    end)
end)
local v271, v272, v273 = pairs(vu17.Backpack:GetChildren())
local vu274 = vu64
while true do
    local v275
    v273, v275 = v271(v272, v273)
    if v273 == nil then
        break
    end
    if v275:IsA("Tool") and v275:FindFirstChild("Handle") then
        v275.Activated:Connect(vu86)
    end
end
local v276, v277, v278 = pairs(vu17.Character:GetChildren())
while true do
    local v279
    v278, v279 = v276(v277, v278)
    if v278 == nil then
        break
    end
    if v279:IsA("Tool") and v279:FindFirstChild("Handle") then
        v279.Activated:Connect(vu86)
    end
end
vu17.Character.ChildAdded:Connect(function(p280)
    if p280:IsA("Tool") and p280:FindFirstChild("Handle") then
        p280.Activated:Connect(vu86)
    end
end)
vu17.CharacterAdded:Connect(function(p281)
    p281.ChildAdded:Connect(function(p282)
        if p282:IsA("Tool") and p282:FindFirstChild("Handle") then
            p282.Activated:Connect(vu86)
        end
    end)
end)
vu6.PlayerRemoving:Connect(function(p283)
    if vu58.BindEnabled and p283 == vu15 then
        vu58.BindEnabled = false
    end
    if vu60.BindEnabled and p283 == vu16 then
        vu60.BindEnabled = false
    end
end)
vu3.Heartbeat:Connect(function()
    local v284, v285 = vu5.CurrentCamera:WorldToViewportPoint(vu17.Character[vu69.RealHitPart].Position + vu17.Character[vu69.RealHitPart].AssemblyLinearVelocity * vu69.Prediction)
    if vu69.Enabled and v285 then
        vu51.Visible = true
        vu51.Color = vu69.Color
        vu51.Position = Vector2.new(v284.X, v284.Y)
    else
        vu51.Visible = false
    end
    if vu69.Tracer and v285 then
        vu52.Visible = true
        vu52.Color = vu69.Color
        vu52.From = vu4:GetMouseLocation()
        vu52.To = Vector2.new(v284.X, v284.Y)
    else
        vu52.Visible = false
    end
end)
vu3.Heartbeat:Connect(function()
    if vu58.Enabled and (vu58.BindEnabled and (vu58.KoCheck and (not vu58.AutoLock and (vu15.Character.Humanoid.Health <= 2 or vu17.Character.Humanoid.Health <= 2)))) then
        vu58.BindEnabled = false
    end
    local v286 = vu17.Character.HumanoidRootPart.CFrame
    vu59.RealSpeed = vu59.RealSpeed + vu59.Speed
    if vu58.Enabled and (vu58.BindEnabled and (vu59.Enabled and vu59.BindEnabled)) then
        if vu59.Random then
            if vu59.Height >= 0 then
                vu17.Character.HumanoidRootPart.CFrame = vu15.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, math.random(0, vu59.Height), math.random(- vu59.Distance, vu59.Distance))
            else
                vu17.Character.HumanoidRootPart.CFrame = vu15.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, math.random(vu59.Height, 0), math.random(- vu59.Distance, vu59.Distance))
            end
        else
            vu17.Character.HumanoidRootPart.CFrame = vu15.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, vu59.Height, vu59.Distance)
        end
        if vu59.SpoofMode then
            vu3.RenderStepped:Wait()
            vu17.Character.HumanoidRootPart.CFrame = v286
        end
    elseif vu60.Enabled and (vu60.BindEnabled and (vu59.Enabled and vu59.BindEnabled)) then
        if vu59.Random then
            if vu59.Height >= 0 then
                vu17.Character.HumanoidRootPart.CFrame = vu16.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, math.random(0, vu59.Height), math.random(- vu59.Distance, vu59.Distance))
            else
                vu17.Character.HumanoidRootPart.CFrame = vu16.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, math.random(vu59.Height, 0), math.random(- vu59.Distance, vu59.Distance))
            end
        else
            vu17.Character.HumanoidRootPart.CFrame = vu16.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(vu59.RealSpeed), 0) * CFrame.new(0, vu59.Height, vu59.Distance)
        end
    elseif vu65.Enabled and vu65.BindEnabled then
        if vu65.Mode ~= "Custom" then
            if vu65.Mode == "Random" then
                vu17.Character.HumanoidRootPart.CFrame = v286 * CFrame.new(math.random(- vu65.RandomAmount, vu65.RandomAmount), math.random(- vu65.RandomAmount, vu65.RandomAmount), math.random(- vu65.RandomAmount, vu65.RandomAmount))
                vu3.RenderStepped:Wait()
                vu17.Character.HumanoidRootPart.CFrame = v286
            end
        else
            vu17.Character.HumanoidRootPart.CFrame = v286 * CFrame.new(vu65.CustomX, vu65.CustomY, vu65.CustomZ)
            vu3.RenderStepped:Wait()
            vu17.Character.HumanoidRootPart.CFrame = v286
        end
    elseif vu58.Enabled and (vu58.BindEnabled and vu58.LookAt) then
        vu17.Character.HumanoidRootPart.CFrame = CFrame.new(vu17.Character.HumanoidRootPart.Position, Vector3.new(vu15.Character.HumanoidRootPart.Position.X, vu17.Character.HumanoidRootPart.Position.Y, vu15.Character.HumanoidRootPart.Position.Z))
    end
    if vu60.Enabled and (vu60.BindEnabled and (vu60.KoCheck and (vu16.Character.Humanoid.Health <= 2 or vu17.Character.Humanoid.Health <= 2))) then
        vu60.BindEnabled = false
    end
    if vu62.Flight and vu62.FlightBind then
        local v287 = Vector3.zero
        if not vu4:GetFocusedTextBox() then
            if vu4:IsKeyDown(Enum.KeyCode.W) then
                v287 = v287 + vu5.CurrentCamera.CFrame.lookVector * vu62.FlightAmount
            end
            if vu4:IsKeyDown(Enum.KeyCode.A) then
                v287 = v287 - vu5.CurrentCamera.CFrame.rightVector * vu62.FlightAmount
            end
            if vu4:IsKeyDown(Enum.KeyCode.S) then
                v287 = v287 - vu5.CurrentCamera.CFrame.lookVector * vu62.FlightAmount
            end
            if vu4:IsKeyDown(Enum.KeyCode.D) then
                v287 = v287 + vu5.CurrentCamera.CFrame.rightVector * vu62.FlightAmount
            end
        end
        vu17.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        vu17.Character.HumanoidRootPart.CFrame = vu17.Character.HumanoidRootPart.CFrame + v287
    end
    if vu66.Enabled and vu66.BindEnabled then
        local v288 = vu17.Character.HumanoidRootPart
        local v289 = v288.AssemblyLinearVelocity
        local v290 = v288.CFrame
        if vu66.Mode ~= "Custom" then
            if vu66.Mode ~= "Prediction Changer" then
                if vu66.Mode ~= "Prediction Disabler" then
                    if vu66.Mode ~= "Random" then
                        if vu66.Mode ~= "Up" then
                            if vu66.Mode ~= "Down" then
                                if vu66.Mode ~= "Prediction Reverser" then
                                    if vu66.Mode ~= "Look Vector" then
                                        if vu66.Mode ~= "Air Orthodox" then
                                            if vu66.Mode ~= "Mouse Position" then
                                                if vu66.Mode == "Spinbot Desync" then
                                                    if vu66.DesyncVel ~= "Up" then
                                                        if vu66.DesyncVel == "Down" then
                                                            v288.AssemblyLinearVelocity = Vector3.new(0, - 9000000000, 0)
                                                        end
                                                    else
                                                        v288.AssemblyLinearVelocity = Vector3.new(0, 9000000000, 0)
                                                    end
                                                    v288.CFrame = v290 * CFrame.Angles(0, math.rad(vu66.DesyncAngles), 0)
                                                    vu3.RenderStepped:Wait()
                                                    v288.AssemblyLinearVelocity = v289
                                                end
                                            else
                                                v288.AssemblyLinearVelocity = (vu17:GetMouse().Hit.Position - v288.Position).Unit * 120 + vu5.CurrentCamera.CFrame.LookVector * 120
                                                vu3.RenderStepped:Wait()
                                                v288.AssemblyLinearVelocity = v289
                                            end
                                        else
                                            v288.AssemblyLinearVelocity = Vector3.new(777, 777, 777)
                                            vu3.RenderStepped:Wait()
                                            v288.AssemblyLinearVelocity = v289
                                        end
                                    else
                                        v288.AssemblyLinearVelocity = v290.lookVector * vu66.LookVecAmt
                                        vu3.RenderStepped:Wait()
                                        v288.AssemblyLinearVelocity = v289
                                    end
                                else
                                    v288.CFrame = v290 + vu17.Character.Humanoid.MoveDirection * vu66.PredReverseAmt / 10
                                end
                            else
                                v288.AssemblyLinearVelocity = Vector3.new(0, - 9000000000, 0)
                                vu3.RenderStepped:Wait()
                                v288.AssemblyLinearVelocity = v289
                            end
                        else
                            v288.AssemblyLinearVelocity = Vector3.new(0, 9000000000, 0)
                            vu3.RenderStepped:Wait()
                            v288.AssemblyLinearVelocity = v289
                        end
                    else
                        v288.AssemblyLinearVelocity = Vector3.new(math.random(- vu66.RandomAmount, vu66.RandomAmount), math.random(- vu66.RandomAmount, vu66.RandomAmount), math.random(- vu66.RandomAmount, vu66.RandomAmount))
                        vu3.RenderStepped:Wait()
                        v288.AssemblyLinearVelocity = v289
                    end
                else
                    v288.AssemblyLinearVelocity = Vector3.zero
                    vu3.RenderStepped:Wait()
                    v288.AssemblyLinearVelocity = v289
                end
            else
                v288.AssemblyLinearVelocity = v289 * vu66.PredChangeAmt
                vu3.RenderStepped:Wait()
                v288.AssemblyLinearVelocity = v289
            end
        else
            v288.AssemblyLinearVelocity = Vector3.new(vu66.CustomX, vu66.CustomY, vu66.CustomZ)
            vu3.RenderStepped:Wait()
            v288.AssemblyLinearVelocity = v289
        end
    end
end)
vu3.Stepped:Connect(function()
    if vu58.Enabled and (vu58.BindEnabled and (vu59.Enabled and (vu59.BindEnabled and vu59.SpoofMode))) or vu65.Enabled and vu65.BindEnabled then
        vu53.Position = vu17.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)
        vu18 = vu53
    else
        vu18 = vu17.Character.Humanoid
    end
    if vu58.Enabled and vu58.BindEnabled and vu15.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        vu58.RealJumpOffset = vu58.JumpOffset
    else
        vu58.RealJumpOffset = 0
    end
    if vu58.Enabled then
        vu58.RealHitPart = vu58.HitParts[math.random(# vu58.HitParts)]
        task.wait(0.6)
    end
    if vu60.Enabled and vu60.BindEnabled and vu16.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        vu60.RealJumpOffset = vu60.JumpOffset
    else
        vu60.RealJumpOffset = 0
    end
    local v291
    if vu60.Enabled and (vu60.BindEnabled and vu60.UseAirPart) then
        if vu60.AirCheckType ~= "Once in Air" then
            v291 = vu16.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall
        else
            v291 = vu16.Character.Humanoid.FloorMaterial == Enum.Material.Air
        end
    else
        v291 = nil
    end
    if vu60.Enabled and (vu60.BindEnabled and (vu60.UseAirPart and v291)) then
        vu60.RealHitPart = vu60.AirPart
    else
        vu60.RealHitPart = vu60.HitPart
    end
    if vu61.AutoStomp then
        if vu8:FindFirstChild("MainEvent") then
            vu8.MainEvent:FireServer("Stomp")
        elseif vu8:FindFirstChild("MainRemote") then
            vu8.MainRemote:FireServer("Stomp")
        elseif vu8:FindFirstChild("MAINEVENT") then
            vu8.MAINEVENT:FireServer("STOMP")
        end
    end
    if vu61.AutoReload and vu17.Character:FindFirstChildOfClass("Tool") then
        local v292 = vu17.Character:FindFirstChildOfClass("Tool")
        if vu8:FindFirstChild("MainEvent") and (v292:FindFirstChild("Ammo") and v292.Ammo.Value <= 0) then
            vu8.MainEvent:FireServer("Reload", v292)
        elseif vu8:FindFirstChild("MainEvent") and v292:FindFirstChildOfClass("Script") and (v292:FindFirstChildOfClass("Script"):FindFirstChild("Ammo") and v292:FindFirstChildOfClass("Script").Ammo.Value <= 0) then
            vu8.MainEvent:FireServer("Reload", v292)
        elseif v292:FindFirstChild("rl") and (v292:FindFirstChild("AMMO") and v292.AMMO.Value <= 0) then
            v292.rl:FireServer()
        end
        task.wait(1)
    end
    if vu62.Speed and vu62.SpeedBind then
        vu17.Character.HumanoidRootPart.CFrame = vu17.Character.HumanoidRootPart.CFrame + vu17.Character.Humanoid.MoveDirection * vu62.SpeedAmount
    end
    vu17.Character.Humanoid.UseJumpPower = not vu62.NoJumpCooldown
    if vu62.NoSlowdown and vu17.Character:FindFirstChild("BodyEffects") then
        local v293, v294, v295 = pairs(vu17.Character.BodyEffects.Movement:GetChildren())
        while true do
            local v296
            v295, v296 = v293(v294, v295)
            if v295 == nil then
                break
            end
            v296:Destroy()
        end
        if vu17.Character.BodyEffects.Reload then
            vu17.Character.BodyEffects.Reload.Value = false
        end
    end
    if vu62.AutoJump and vu62.NoJumpCooldown and (vu17.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and vu17.Character.Humanoid.MoveDirection.Magnitude > 0) then
        vu17.Character.Humanoid:ChangeState("Jumping")
    end
    if vu62.BunnyHop and vu17.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        vu17.Character.HumanoidRootPart.CFrame = vu17.Character.HumanoidRootPart.CFrame + vu17.Character.Humanoid.MoveDirection * vu62.HopAmount
    end
    if vu274.IsUsable and vu274.Enabled then
        if vu274.Idle ~= "Zombie" then
            if vu274.Idle ~= "Werewolf" then
                if vu274.Idle ~= "Ninja" then
                    if vu274.Idle ~= "Mage" then
                        if vu274.Idle == "Toy" then
                            vu17.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
                            vu17.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
                        end
                    else
                        vu17.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
                        vu17.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
                    end
                else
                    vu17.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
                    vu17.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
                end
            else
                vu17.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
                vu17.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
            end
        else
            vu17.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
            vu17.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
        end
        if vu274.Walk ~= "Zombie" then
            if vu274.Walk ~= "Werewolf" then
                if vu274.Walk ~= "Ninja" then
                    if vu274.Walk ~= "Mage" then
                        if vu274.Walk == "Toy" then
                            vu17.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
                        end
                    else
                        vu17.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
                    end
                else
                    vu17.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
                end
            else
                vu17.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
            end
        else
            vu17.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        end
        if vu274.Run ~= "Zombie" then
            if vu274.Run ~= "Werewolf" then
                if vu274.Run ~= "Ninja" then
                    if vu274.Run ~= "Mage" then
                        if vu274.Run == "Toy" then
                            vu17.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
                        end
                    else
                        vu17.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
                    end
                else
                    vu17.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
                end
            else
                vu17.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
            end
        else
            vu17.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        end
        if vu274.Jump ~= "Zombie" then
            if vu274.Jump ~= "Werewolf" then
                if vu274.Jump ~= "Ninja" then
                    if vu274.Jump ~= "Mage" then
                        if vu274.Jump == "Toy" then
                            vu17.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
                        end
                    else
                        vu17.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
                    end
                else
                    vu17.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
                end
            else
                vu17.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
            end
        else
            vu17.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        end
        if vu274.Fall ~= "Zombie" then
            if vu274.Fall ~= "Werewolf" then
                if vu274.Fall ~= "Ninja" then
                    if vu274.Fall ~= "Mage" then
                        if vu274.Fall == "Toy" then
                            vu17.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
                        end
                    else
                        vu17.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
                    end
                else
                    vu17.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
                end
            else
                vu17.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
            end
        else
            vu17.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
        end
    end
    if vu67.Enabled and vu17.Character:FindFirstChildOfClass("Tool") then
        vu17.Character:FindFirstChildOfClass("Tool").GripPos = Vector3.new(- vu67.CustomX, - vu67.CustomY, vu67.CustomZ)
    end
end)
vu3.RenderStepped:Connect(function()
    if vu60.Enabled and vu60.BindEnabled then
        local v297
        if vu71.Enabled then
            v297 = CFrame.new(0, 0, 0, 1, 0, 0, 0, vu71.Amount, 0, 0, 0, 1)
        else
            v297 = CFrame.identity
        end
        if vu60.Resolver then
            if vu60.Smoothing then
                vu5.CurrentCamera.CFrame = vu5.CurrentCamera.CFrame:Lerp(CFrame.new(vu5.CurrentCamera.CFrame.Position, vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character.Humanoid.MoveDirection * vu16.Character.Humanoid.WalkSpeed * vu60.RealPrediction), vu60.Smoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut) * v297
            else
                vu5.CurrentCamera.CFrame = CFrame.new(vu5.CurrentCamera.CFrame.Position, vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character.Humanoid.MoveDirection * vu16.Character.Humanoid.WalkSpeed * vu60.RealPrediction) * v297
            end
        elseif vu60.Smoothing then
            vu5.CurrentCamera.CFrame = vu5.CurrentCamera.CFrame:Lerp(CFrame.new(vu5.CurrentCamera.CFrame.Position, vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character[vu60.RealHitPart].AssemblyLinearVelocity * vu60.RealPrediction), vu60.Smoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut) * v297
        else
            vu5.CurrentCamera.CFrame = CFrame.new(vu5.CurrentCamera.CFrame.Position, vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character[vu60.RealHitPart].AssemblyLinearVelocity * vu60.RealPrediction) * v297
        end
    end
end)
vu3.RenderStepped:Connect(function()
    if vu58.Enabled and (vu58.BindEnabled and vu58.ViewAt) then
        vu5.CurrentCamera.CameraSubject = vu15.Character.Humanoid
    else
        vu5.CurrentCamera.CameraSubject = vu18
    end
    if vu58.AutoLock then
        if vu58.Enabled and vu85(vu58, vu35) then
            vu15 = vu85(vu58, vu35)
            if vu58.KoCheck and (vu15.Character.Humanoid.Health <= 2 or vu17.Character.Humanoid.Health <= 2) then
                vu58.BindEnabled = false
            else
                vu58.BindEnabled = true
            end
        else
            vu58.BindEnabled = false
        end
    end
    if vu58.Enabled and (vu58.BindEnabled and vu58.AutoPred) then
        vu58.RealPrediction = math.round(vu10.Network.ServerStatsItem["Data Ping"]:GetValue()) / vu58.AutoPredMath * 0.1 + 0.1
    else
        vu58.RealPrediction = vu58.Prediction
    end
    local v298, v299
    if vu58.Enabled and vu58.BindEnabled then
        if vu58.Resolver then
            v298, v299 = vu5.CurrentCamera:WorldToViewportPoint(vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction)
        else
            v298, v299 = vu5.CurrentCamera:WorldToViewportPoint(vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction)
        end
    else
        v299 = nil
        v298 = nil
    end
    if vu58.Enabled and (vu58.BindEnabled and (vu58.Dot and v299)) then
        vu21.Visible = true
        vu21.Color = vu58.DotTracerColor
        vu21.Position = Vector2.new(v298.X, v298.Y)
    else
        vu21.Visible = false
    end
    if vu58.Enabled and (vu58.BindEnabled and (vu58.Tracer and v299)) then
        vu22.Visible = true
        vu22.Color = vu58.DotTracerColor
        vu22.From = vu4:GetMouseLocation()
        vu22.To = Vector2.new(v298.X, v298.Y)
    else
        vu22.Visible = false
    end
    if vu58.Enabled and (vu58.BindEnabled and vu58.Highlight) then
        vu23.Parent = vu15.Character
        vu23.FillColor = vu58.HighlightColor
    else
        vu23.Parent = nil
    end
    if vu58.Enabled and (vu58.BindEnabled and vu58.Stats) then
        vu25.BackgroundColor3 = vu58.StatsColor
        vu26.BackgroundColor3 = vu58.StatsColor
        vu27.TextColor3 = vu58.StatsColor
        vu29.BackgroundColor3 = vu58.StatsColor
        vu30.BackgroundColor3 = vu58.StatsColor
        if vu58.StatsOnTarget then
            if v299 then
                vu25.Visible = true
                vu25.Position = UDim2.new(0, v298.X, 0, v298.Y)
            else
                vu25.Visible = false
            end
        else
            vu25.Visible = true
            vu25.Position = UDim2.new(0.5, 0, 0.7, 0)
        end
        vu27.Text = vu15.DisplayName .. " [" .. vu15.Name .. "]"
        vu28.Image = "rbxthumb://type=AvatarHeadShot&id=" .. vu15.UserId .. "&w=420&h=420"
        vu30:TweenSize(UDim2.new(vu15.Character.Humanoid.Health / vu15.Character.Humanoid.MaxHealth, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.25)
    else
        vu25.Visible = false
    end
    if vu58.Enabled and (vu58.BindEnabled and vu58.FovOnTarget) then
        if vu58.FovVisible and v299 then
            vu35.Visible = true
        else
            vu35.Visible = false
        end
        vu35.Color = vu58.FovColor
        vu35.Position = Vector2.new(v298.X, v298.Y)
    else
        if vu58.FovVisible then
            vu35.Visible = true
        else
            vu35.Visible = false
        end
        vu35.Color = vu58.FovColor
        vu35.Position = vu4:GetMouseLocation()
    end
    if vu60.Enabled and (vu60.BindEnabled and vu60.AutoPred) then
        vu60.RealPrediction = math.round(vu10.Network.ServerStatsItem["Data Ping"]:GetValue()) / vu60.AutoPredMath * 0.1 + 0.1
    else
        vu60.RealPrediction = vu60.Prediction
    end
    local v300, v301
    if vu60.Enabled and vu60.BindEnabled then
        if vu60.Resolver then
            v300, v301 = vu5.CurrentCamera:WorldToViewportPoint(vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character.Humanoid.MoveDirection * vu16.Character.Humanoid.WalkSpeed * vu60.RealPrediction)
        else
            v300, v301 = vu5.CurrentCamera:WorldToViewportPoint(vu16.Character[vu60.RealHitPart].Position + Vector3.new(0, vu60.RealJumpOffset, 0) + vu16.Character[vu60.RealHitPart].AssemblyLinearVelocity * vu60.RealPrediction)
        end
    else
        v301 = nil
        v300 = nil
    end
    if vu60.Enabled and (vu60.BindEnabled and (vu60.Dot and v301)) then
        vu36.Visible = true
        vu36.Color = vu60.DotTracerColor
        vu36.Position = Vector2.new(v300.X, v300.Y)
    else
        vu36.Visible = false
    end
    if vu60.Enabled and (vu60.BindEnabled and (vu60.Tracer and v301)) then
        vu37.Visible = true
        vu37.Color = vu60.DotTracerColor
        vu37.From = vu4:GetMouseLocation()
        vu37.To = Vector2.new(v300.X, v300.Y)
    else
        vu37.Visible = false
    end
    if vu60.Enabled and (vu60.BindEnabled and vu60.Highlight) then
        vu38.Parent = vu16.Character
        vu38.FillColor = vu60.HighlightColor
    else
        vu38.Parent = nil
    end
    if vu60.Enabled and (vu60.BindEnabled and vu60.Stats) then
        vu40.BackgroundColor3 = vu60.StatsColor
        vu41.BackgroundColor3 = vu60.StatsColor
        vu42.TextColor3 = vu60.StatsColor
        vu44.BackgroundColor3 = vu60.StatsColor
        vu45.BackgroundColor3 = vu60.StatsColor
        if vu60.StatsOnTarget then
            if v301 then
                vu40.Visible = true
                vu40.Position = UDim2.new(0, v300.X, 0, v300.Y)
            else
                vu40.Visible = false
            end
        else
            vu40.Visible = true
            vu40.Position = UDim2.new(0.5, 0, 0.7, 0)
        end
        vu42.Text = vu16.DisplayName .. " [" .. vu16.Name .. "]"
        vu43.Image = "rbxthumb://type=AvatarHeadShot&id=" .. vu16.UserId .. "&w=420&h=420"
        vu45:TweenSize(UDim2.new(vu16.Character.Humanoid.Health / vu16.Character.Humanoid.MaxHealth, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.25)
    else
        vu40.Visible = false
    end
    if vu60.Enabled and (vu60.BindEnabled and vu60.FovOnTarget) then
        if vu60.FovVisible and v301 then
            vu50.Visible = true
        else
            vu50.Visible = false
        end
        vu50.Color = vu60.FovColor
        vu50.Position = Vector2.new(v300.X, v300.Y)
    else
        if vu60.FovVisible then
            vu50.Visible = true
        else
            vu50.Visible = false
        end
        vu50.Color = vu60.FovColor
        vu50.Position = vu4:GetMouseLocation()
    end
    if (vu69.Enabled or vu69.Tracer) and vu69.RandomHitPart then
        local v302 = {
            "Head",
            "HumanoidRootPart",
            "UpperTorso",
            "LowerTorso",
            "RightUpperArm",
            "LeftUpperArm",
            "RightLowerArm",
            "LeftLowerArm",
            "RightUpperLeg",
            "LeftUpperLeg",
            "RightLowerLeg",
            "LeftLowerLeg"
        }
        vu69.RealHitPart = v302[math.random(# v302)]
        task.wait(0.6)
    else
        vu69.RealHitPart = vu69.HitPart
    end
    if vu68.Enabled then
        vu55.Visible = true
        vu56.Visible = true
        vu55.Color = vu68.Color
        vu56.Color = vu68.Color
        vu55.From = vu4:GetMouseLocation() - Vector2.new(vu68.Size, 0)
        vu55.To = vu4:GetMouseLocation() + Vector2.new(vu68.Size, 0)
        vu56.From = vu4:GetMouseLocation() - Vector2.new(0, vu68.Size)
        vu56.To = vu4:GetMouseLocation() + Vector2.new(0, vu68.Size)
    else
        vu55.Visible = false
        vu56.Visible = false
    end
    if vu68.UseText then
        vu57.Visible = true
        vu57.Color = vu68.Color
        if vu68.Enabled then
            vu57.Position = vu4:GetMouseLocation() + Vector2.new(0, vu68.Size)
        else
            vu57.Position = vu4:GetMouseLocation() + Vector2.new(0, 25)
        end
    else
        vu57.Visible = false
    end
    if vu70.Enabled then
        vu5.CurrentCamera.FieldOfView = vu70.Amount
    end
    if vu71.Enabled and not (vu60.Enabled and vu60.BindEnabled) then
        vu5.CurrentCamera.CFrame = vu5.CurrentCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, vu71.Amount, 0, 0, 0, 1)
    end
end)
vu4.InputBegan:Connect(function(p303)
    if vu58.Enabled and p303.KeyCode == vu58.Keybind and not vu4:GetFocusedTextBox() then
        if vu58.BindEnabled then
            vu58.BindEnabled = false
            if vu58.Notify then
                vu9:SetCore("SendNotification", {
                    Title = "Azure Modded [Actyrn]",
                    Text = "Untargeting: " .. vu15.DisplayName,
                    Duration = 2.5
                })
            end
        elseif vu85(vu58, vu35) then
            vu58.BindEnabled = true
            vu15 = vu85(vu58, vu35)
            if vu58.Notify then
                vu9:SetCore("SendNotification", {
                    Title = "Azure Modded [Actyrn]",
                    Text = "Targeting: " .. vu15.DisplayName,
                    Duration = 2.5
                })
            end
        end
    end
    if vu60.Enabled and p303.KeyCode == vu60.Keybind and not vu4:GetFocusedTextBox() then
        if vu60.BindEnabled then
            vu60.BindEnabled = false
            if vu60.Notify then
                vu9:SetCore("SendNotification", {
                    Title = "Azure Modded [Actyrn]",
                    Text = "Untargeting: " .. vu16.DisplayName,
                    Duration = 2.5
                })
            end
        elseif vu85(vu60, vu50) then
            vu60.BindEnabled = true
            vu16 = vu85(vu60, vu50)
            if vu60.Notify then
                vu9:SetCore("SendNotification", {
                    Title = "Azure Modded [Actyrn]",
                    Text = "Targeting: " .. vu16.DisplayName,
                    Duration = 2.5
                })
            end
        end
    end
end)
local _ = hookmetamethod(game, "__namecall", function(p304, ...)
    local v305 = {
        ...
    }
    if not vu58.Enabled or (not vu58.BindEnabled or (not table.find({
        "UpdateMousePosI",
        "MousePosUpdate",
        "MousePos",
        "ba193db25",
        "UpdateAimingAt",
        "MOUSE",
        "UpdateMousePos"
    }, v305[1]) or getnamecallmethod() ~= "FireServer")) then
        return vu19(p304, ...)
    end
    if vu58.Resolver then
        v305[2] = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset) + vu15.Character.Humanoid.MoveDirection * vu15.Character.Humanoid.WalkSpeed * vu58.RealPrediction
    else
        v305[2] = vu15.Character[vu58.RealHitPart].Position + Vector3.new(0, vu58.RealJumpOffset, 0) + vu15.Character[vu58.RealHitPart].AssemblyLinearVelocity * vu58.RealPrediction
    end
    return vu19(p304, unpack(v305))
end)
local _ = hookmetamethod(game, "__namecall", function(p306, ...)
    if not table.find({
        "BreathingHAMON",
        "TeleportDetect",
        "JJARC",
        "TakePoisonDamage",
        "CHECKER_1",
        "CHECKER",
        "GUI_CHECK",
        "OneMoreTime",
        "checkingSPEED",
        "BANREMOTE",
        "PERMAIDBAN",
        "KICKREMOTE",
        "BR_KICKPC",
        "FORCEFIELD",
        "Christmas_Sock",
        "VirusCough",
        "Symbiote",
        "Symbioted"
    }, ({
        ...
    })[1]) or getnamecallmethod() ~= "FireServer" then
        return vu20(p306, ...)
    end
end)
local v307 = next
local v308, v309 = getconnections(vu5.CurrentCamera.Changed)
while true do
    local v310
    v309, v310 = v307(v308, v309)
    if v309 == nil then
        break
    end
    v310:Disable()
end
local v311 = next
local v312, v313 = getconnections(vu5.CurrentCamera:GetPropertyChangedSignal("CFrame"))
while true do
    local v314
    v313, v314 = v311(v312, v313)
    if v313 == nil then
        break
    end
    v314:Disable()
end
(request or http_request or httprequest or httpreq or (http and http.request) or function() end)({
    Url = "http://127.0.0.1:6463/rpc?v=1",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        origin = "https://discord.com"
    },
    Body = v13:JSONEncode({
        args = {
            code = "hUvujCnGMb"
        },
        cmd = "INVITE_BROWSER",
        nonce = "."
    })
})
vu9:SetCore("SendNotification", {
    Title = "Loaded [FREE]",
    Text = ".gg/azuremodded",
    Duration = 5
})
