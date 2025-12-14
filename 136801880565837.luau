-- original post(er): https://scriptblox.com/u/CorgScientist
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local Camera = workspace.Camera

local Window = Rayfield:CreateWindow({
	Name = "BlueCorgi99's Flick GUI",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Flick GUI",
	LoadingSubtitle = "by BlueCorgi99",
	ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
	Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "bc99flickgui"
	},

	Discord = {
		Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "https://discord.gg/H42YuMFBbr", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},

	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

Rayfield:Notify({
	Title = "Flick GUI by BlueCorgi99",
	Content = "Happy exploiting!",
	Duration = 6.5,
	Image = 4483362458,
})

local vars = {
	dragging=false;
	framepos=nil;
	esp=false;
	noclip=false;
	aimlock=false;
	infjump=false;
	fly=true;--keep this at true, we will be using this boolean a different way from the others stored in this table
	unlockfps=false;
	triggerbot=false;
	fov=95;
	
	AimlockMisc={ -- mainly for aimlock and other complex scripts
		locking=false;--aimlocking boolean
		target=nil;
		radius=150;--size of aimlock circle
		--aimlockkey = Enum.UserInputType.MouseButton2;
		rainbowcircle=false;
		hue=0;
		headshots=true;
		input = Enum.KeyCode.E
	};
	KnifeMisc={
		rainbow=false;
	};
	FPSUnlocker={--we will be saving part names here :D
		decals={};
		baseparts={};
	};
	espMisc={
		espColor=Color3.fromRGB(255,0,0);
		transparency=50;
		rainbowESP=false;
		hue=0;
	};
	
	ws=16;
	jp=50;
}

local circle = Drawing.new("Circle")--please make sure that your exploit supports this drawing lib
circle.Radius=vars.AimlockMisc.radius;
circle.Thickness=2;--i did not need all of these semicolons, but it's aight
circle.filled=false
circle.Color =Color3.fromRGB(255,0,0)
circle.Transparency=1;
circle.Visible=false;

--functions
local FindAimbotVictim = function()
	local screenCenter = Camera.ViewportSize/2
	local closest=nil;
	local shortest=vars.AimlockMisc.radius;

	for i,x in pairs(Players:GetPlayers()) do
		if x~=LocalPlayer and x.Character and x.Character:FindFirstChild("HumanoidRootPart") then
			
			local hrp=x.Character.HumanoidRootPart
			
			if vars.AimlockMisc.headshots then
				hrp=x.Character.Head
			end
			local screenPos,visible = Camera:WorldToViewportPoint(hrp.Position)

			if visible then
				local distance=(Vector2.new(screenPos.X, screenPos.Y)-screenCenter).Magnitude;
				if distance <= shortest then
					shortest=distance;
					closest=x;
				end
			end
		end
	end

	return closest--returns the value of the player closest to the middle of the circle
end
---------

local AimlockTab = Window:CreateTab("Aimlock", 4483362458) -- Title, Image

local AimlockToggle = AimlockTab:CreateToggle({
	Name = "Aimlock",
	CurrentValue = false,
	Flag = "aimlockToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.aimlock=not vars.aimlock;
		circle.Visible=vars.aimlock;
	end,
})

local AimlockSizeSlider = AimlockTab:CreateSlider({
	Name = "Circle Size",
	Range = {10, 500},
	Increment = 10,
	Suffix = "AS",
	CurrentValue = vars.AimlockMisc.radius,
	Flag = "CS", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.AimlockMisc.radius=Value;
		circle.Radius=Value;
		print(tostring(Value))
	end,
})

local AimlockHeadShot = AimlockTab:CreateToggle({
	Name = "Headshots Only",
	CurrentValue = true,
	Flag = "AHO", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.AimlockMisc.headshots=Value;
	end,
})

local AimlockInput = AimlockTab:CreateInput({
	Name = "Aimlock Input",
	CurrentValue = "E",
	PlaceholderText = "Input your letter/input type here!",
	RemoveTextAfterFocusLost = false,
	Flag = "AI1",
	Callback = function(Text)
		local keybind = Enum.KeyCode[Text]
		
		if keybind then
			vars.AimlockMisc.input=keybind;
		end
		print(tostring(vars.AimlockMisc.input))
	end,
})

local AimlockColorDropdown = AimlockTab:CreateDropdown({
	Name = "Circle Color",
	Options = {"Red","Blue","White","Black","Orange","Green","Purple","Yellow","Rainbow"},
	CurrentOption = {"Red"},
	MultipleOptions = false,
	Flag = "CC", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Options)
		if Options[1]=="Red" then
			circle.Color=Color3.fromRGB(255,0,0)
		elseif Options[1]=="Blue"then
			circle.Color=Color3.fromRGB(26, 95, 255)
		elseif Options[1]=="Green" then
			circle.Color=Color3.fromRGB(0,255,0)
		elseif Options[1]=="Purple" then
			circle.Color=Color3.fromRGB(128,0,128)
		elseif Options[1]=="White"then
			circle.Color=Color3.fromRGB(255,255,255)
		elseif Options[1]=="Black" then
			circle.Color=Color3.fromRGB(0,0,0)
		elseif Options[1]=="Orange" then
			circle.Color=Color3.fromRGB(255,128,0)
		elseif Options[1]=="Yellow" then
			circle.Color=Color3.fromRGB(255,255,0)
		end
		
		if Options[1]=="Rainbow" then
			vars.AimlockMisc.rainbowcircle=true;
		else
			vars.AimlockMisc.rainbowcircle=false;
		end
	end,
})

local ESPTab = Window:CreateTab("ESP", 4483362458) -- Title, Image

local ESPToggle = ESPTab:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "espToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.esp=Value;
	end,
})

local ESPColorDropdown = ESPTab:CreateDropdown({
	Name = "ESP Color",
	Options = {"Red","Blue","White","Black","Orange","Green","Purple","Yellow","Rainbow"},
	CurrentOption = {"Red"},
	MultipleOptions = false,
	Flag = "EC", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Options)
		if Options[1]=="Red" then
			vars.espMisc.espColor=Color3.fromRGB(255,0,0)
		elseif Options[1]=="Blue"then
			vars.espMisc.espColor=Color3.fromRGB(26, 95, 255)
		elseif Options[1]=="Green" then
			vars.espMisc.espColor=Color3.fromRGB(0,255,0)
		elseif Options[1]=="Purple" then
			vars.espMisc.espColor=Color3.fromRGB(128,0,128)
		elseif Options[1]=="White"then
			vars.espMisc.espColor=Color3.fromRGB(255,255,255)
		elseif Options[1]=="Black" then
			vars.espMisc.espColor=Color3.fromRGB(0,0,0)
		elseif Options[1]=="Orange" then
			vars.espMisc.espColor=Color3.fromRGB(255,128,0)
		elseif Options[1]=="Yellow" then
			vars.espMisc.espColor=Color3.fromRGB(255,255,0)
		end
		
		if Options[1]=="Rainbow"then
			vars.espMisc.rainbowESP=true
		else
			vars.espMisc.rainbowESP=false
		end
		
		print(vars.espMisc.rainbowESP)
	end,
})

local ESPTransSlider = ESPTab:CreateSlider({
	Name = "ESP Transparency",
	Range = {0, 100},
	Increment = 10,
	Suffix = "ET",
	CurrentValue = 50,
	Flag = "espTrans", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.espMisc.transparency=Value;
	end,
})

local UniversalTab = Window:CreateTab("Universal", 4483362458) -- Title, Image

local WSSlider = UniversalTab:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 125},
	Increment = 1,
	Suffix = "WS",
	CurrentValue = 16,
	Flag = "WS", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.ws=Value
	end,
})

local JPSlider = UniversalTab:CreateSlider({
	Name = "JumpPower",
	Range = {50, 500},
	Increment = 10,
	Suffix = "JP",
	CurrentValue = 50,
	Flag = "JP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.jp=Value
	end,
})

local FOVSlider = UniversalTab:CreateSlider({
	Name = "Field Of View",
	Range = {25, 125},
	Increment = 5,
	Suffix = "FV",
	CurrentValue = 25,
	Flag = "FOV", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		vars.fov=Value
	end,
})


--shit to put at the end
UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode==vars.AimlockMisc.input then
		vars.AimlockMisc.target = FindAimbotVictim();
		vars.AimlockMisc.locking=vars.AimlockMisc.target~=nil
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode==vars.AimlockMisc.input then
		vars.AimlockMisc.locking=false;
		vars.AimlockMisc.target=nil;--reset everything back to the default settings when you release the rightclick mouse button
	end
end)

RunService.RenderStepped:Connect(function()
	local sS = Camera.ViewportSize
	circle.Position = Vector2.new(sS.X/2,sS.Y/2)--screen size x and y size divided into a half

	if vars.aimlock and vars.AimlockMisc.locking and vars.AimlockMisc.target and vars.AimlockMisc.target.Character and vars.AimlockMisc.target.Character:FindFirstChild("HumanoidRootPart") then
		--i am sorry for such a long line, you have to check alot though :D
		
		local pos = vars.AimlockMisc.target.Character.HumanoidRootPart.Position
		if vars.AimlockMisc.headshots then
			pos = vars.AimlockMisc.target.Character.Head.Position
		end
		
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, pos)
	end
end)

RunService.RenderStepped:Connect(function(deltaTime)
	vars.AimlockMisc.hue=(vars.AimlockMisc.hue+deltaTime*0.2)%1;
	vars.espMisc.hue=(vars.AimlockMisc.hue+deltaTime*0.2)%1
	
	local rainbowColor = Color3.fromHSV(vars.AimlockMisc.hue,1,1)
	if (vars.AimlockMisc.rainbowcircle) then
		circle.Color = rainbowColor;
	end
end)

RunService.RenderStepped:Connect(function()
	for i,x in pairs(Players:GetPlayers()) do
		local char = x.Character -- do not use CharacterAdded:Wait in here

		if char then
			local xy:Highlight = char:FindFirstChild("ESPLight")--yea, I put xy as my variable name, cry about it

			if xy then
				local rainbowColor = Color3.fromHSV(vars.espMisc.hue,1,1)
				
				xy.Enabled = vars.esp
				xy.FillColor = vars.espMisc.espColor
				xy.FillTransparency=vars.espMisc.transparency/100;
				
				if vars.espMisc.rainbowESP then
					xy.FillColor = rainbowColor
				else
					xy.FillColor = vars.espMisc.espColor
				end
			else
				xy = Instance.new("Highlight",char)
				xy.Enabled=vars.esp
				xy.Name='ESPLight'
			end
		end
	end
end)

RunService.RenderStepped:Connect(function()
	workspace.Camera.FieldOfView=vars.fov

	if not LocalPlayer.Character then return end;
	if not LocalPlayer.Character:FindFirstChild("Humanoid") then return end
	
	LocalPlayer.Character.Humanoid.WalkSpeed = vars.ws
	LocalPlayer.Character.Humanoid.JumpPower = vars.jp
end)
