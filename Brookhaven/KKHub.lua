-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")

local player = Players.LocalPlayer
local playerGui = game:GetService("CoreGui")

-- Criar GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.Parent = playerGui
-- Fundo preto transparente
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.5
background.Parent = screenGui

-- Círculo de carregamento
local circle = Instance.new("ImageLabel")
circle.Size = UDim2.new(0, 200, 0, 200)
circle.Position = UDim2.new(0.5, -100, 0.4, -100)
circle.Image = "rbxassetid://135195019288915"
circle.BackgroundTransparency = 1
circle.Parent = screenGui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(1, 0)
uicorner.Parent = circle

-- Texto de carregamento
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 400, 0, 50)
loadingText.Position = UDim2.new(0.5, -200, 0.7, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Carregando..."
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.Parent = screenGui

-- Função para rainbow suave
local function rainbowStep()
	local hue = 0
	while screenGui.Parent do
		hue = (hue + 0.005) % 1
		local color = Color3.fromHSV(hue, 1, 1)
		circle.ImageColor3 = color
		loadingText.TextColor3 = color
		wait(0.03)
	end
end

-- Rodar círculo
local function rotateCircle()
	while screenGui.Parent do
		circle.Rotation = circle.Rotation + 3
		wait(0.03)
	end
end

-- Animação gradual de carregamento
local messages = {
	"Carregando Discord...",
	"Carregando coisas do script... KK hub",
	"Carregando nome... KK hub"
}

spawn(rainbowStep)
spawn(rotateCircle)

for i, msg in ipairs(messages) do
	loadingText.Text = msg
	wait(1.5)
end

loadingText.Text = "Pronto, aproveite!"
wait(1.5)

-- Aplicar RP
RE:WaitForChild("1RPNam1eTex1t"):FireServer("RolePlayName", "KK HUB (User)")
RE:WaitForChild("1RPNam1eTex1t"):FireServer("RolePlayBio", "scripter")
RE:WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor", Color3.new(0, 1, 0.216))
RE:WaitForChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor", Color3.new(1, 0, 0.096))

-- Remover GUI depois de carregar
screenGui:Destroy()
-- Notificação Simples (7 segundos)

local function Notificar(titulo, descricao)
    -- Criar GUI
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "NotifGui"
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ResetOnSpawn = false

    -- Frame principal
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 300, 0, 90)
	Frame.Position = UDim2.new(0.5, -150, 0, -100)
	Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Frame.BackgroundTransparency = 0.2
	Frame.BorderSizePixel = 0
	Frame.Visible = false
	Frame.Parent = ScreenGui

    -- Título
	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -20, 0, 30)
	Title.Position = UDim2.new(0, 10, 0, 5)
	Title.BackgroundTransparency = 1
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 18
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Text = titulo
	Title.Parent = Frame

    -- Descrição
	local Desc = Instance.new("TextLabel")
	Desc.Size = UDim2.new(1, -20, 0, 30)
	Desc.Position = UDim2.new(0, 10, 0, 35)
	Desc.BackgroundTransparency = 1
	Desc.Font = Enum.Font.Gotham
	Desc.TextSize = 16
	Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextWrapped = true
	Desc.Text = descricao
	Desc.Parent = Frame

    -- Animação de aparecer
	Frame.Visible = true
	Frame.Position = UDim2.new(0.5, -150, 0, -120)
	Frame:TweenPosition(UDim2.new(0.5, -150, 0, 30), "Out", "Quad", 0.5, true)

    -- Esperar 7 segundos
	task.delay(7, function()
        -- Animação de sumir
		Frame:TweenPosition(UDim2.new(0.5, -150, 0, -120), "In", "Quad", 0.5, true)
		task.wait(0.5)
		ScreenGui:Destroy()
	end)
end

-- Exemplos:
Notificar("KK hub Executado", "O script foi carregado com sucesso!")
-- Notificar("Carregando", "Aguarde... iniciando módulos...")
-- Cole seu código Lua aqui--=========================--
--     CARREGAMENTO        --
--=========================--

--=========================--
--      REDZLIB V5         --
--=========================--
local redzlib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/V5/Source.lua"
))()

local Window = redzlib:MakeWindow({
	Title = "KK hub | Brookhaven 🏡",
	SubTitle = "by zerin24",
	SaveFolder = "KK_hub_studios"
})

--=========================--
--  BOTÃO DE MINIMIZAR     --
--=========================--
Window:AddMinimizeButton({
	Button = {
		Image = "rbxassetid://85773803825455",
		Size = UDim2.fromOffset(60, 60),
		BackgroundTransparency = 0
	},
	Corner = {
		CornerRadius = UDim.new(0, 6)
	}
})

--=========================--
--       SERVIÇOS          --
--=========================--
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--=========================--
--       ABA: CREDITS      --
--=========================--
local CREDITS = Window:MakeTab({
	"CREDITS",
	"alert"
})

CREDITS:AddDiscordInvite({
	Name = "King Hub Discord",
	Description = "Entre no Discord oficial do KK Hub",
	Logo = "rbxassetid://85773803825455",
	Invite = "https://discord.gg/Hmhw8WySW",
})

CREDITS:AddSection({
	"Criadores"
})
CREDITS:AddParagraph({
	"Kingblox"
})
CREDITS:AddParagraph({
	"duteuuty7"
})
CREDITS:AddParagraph({
	"rumullov12"
})

--=========================--
-- Ping em tempo real
--=========================--
local pingParagraph = CREDITS:AddParagraph({
	"Ping",
	"Calculando..."
})
task.spawn(function()
	while task.wait(1) do
		local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
		pingParagraph:SetDesc(ping .. " ms")
	end
end)

--=========================--
-- Informações do Jogador
--=========================--
CREDITS:AddSection({
	"Informações do Jogador"
})
CREDITS:AddParagraph({
	"Seu Nome",
	LocalPlayer.Name
})
CREDITS:AddParagraph({
	"Display Name",
	LocalPlayer.DisplayName
})

local userIdParagraph = CREDITS:AddParagraph({
	"User ID",
	tostring(LocalPlayer.UserId)
})

CREDITS:AddButton({
	Name = "📋 Copiar User ID",
	Callback = function()
		if setclipboard then
			setclipboard(tostring(LocalPlayer.UserId))
			redzlib:Notify({
				Title = "Copiado",
				Description = "User ID copiado com sucesso",
				Duration = 2
			})
		end
	end
})

--=========================--
-- Código do Jogo (PlaceId)
--=========================--
local placeIdParagraph = CREDITS:AddParagraph({
	"Código do Jogo",
	tostring(game.PlaceId)
})

CREDITS:AddButton({
	Name = "📋 Copiar Código do Jogo",
	Callback = function()
		if setclipboard then
			setclipboard(tostring(game.PlaceId))
			redzlib:Notify({
				Title = "Copiado",
				Description = "Código do jogo copiado",
				Duration = 2
			})
		end
	end
})

--=========================--
-- Sobre
--=========================--
CREDITS:AddSection({
	"Sobre"
})
CREDITS:AddParagraph({
	"Última Atualização",
	os.date("%d/%m/%Y")
})

--=========================--
-- FPS real (sem bug)
--=========================--
local fpsParagraph = CREDITS:AddParagraph({
	"FPS",
	"Calculando..."
})
task.spawn(function()
	local last = tick()
	while task.wait(0.3) do
		local now = tick()
		local fps = math.floor(1 / (now - last))
		last = now
		fpsParagraph:SetDesc(fps .. " FPS")
	end
end)
--=========================--
--      ABA: RAINBOW       --
--=========================--
local RainbowTab = Window:MakeTab({
	"RGB",
	"brush"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local RE = ReplicatedStorage:WaitForChild("RE")

local Rainbow = {
	Name = false,
	Bio = false,
	Hair = false,
	Body = false,
	Head = false,
	Speed = 1
}

RainbowTab:AddSection({
	"RGB Brookhaven"
})

--=========================--
-- Toggles
--=========================--
RainbowTab:AddToggle({
	Name = "Nome RGB (RP Name)",
	Default = false,
	Callback = function(v)
		Rainbow.Name = v
	end
})

RainbowTab:AddToggle({
	Name = "Bio RGB",
	Default = false,
	Callback = function(v)
		Rainbow.Bio = v
	end
})

RainbowTab:AddToggle({
	Name = "Cabelo RGB",
	Default = false,
	Callback = function(v)
		Rainbow.Hair = v
	end
})

RainbowTab:AddToggle({
	Name = "Corpo RGB",
	Default = false,
	Callback = function(v)
		Rainbow.Body = v
	end
})

RainbowTab:AddToggle({
	Name = "Cabeça RGB",
	Default = false,
	Callback = function(v)
		Rainbow.Head = v
	end
})

--=========================--
-- Velocidade
--=========================--
RainbowTab:AddSlider({
	Name = "Velocidade do Rainbow",
	Min = 0.5,
	Max = 10,
	Default = 1,
	Decimal = 1,
	Callback = function(v)
		Rainbow.Speed = v
	end
})

--=========================--
-- Loop RGB
--=========================--
task.spawn(function()
	local hue = 0
	while true do
		RunService.Heartbeat:Wait()
		hue = (hue + 0.003 * Rainbow.Speed) % 1
		local color = Color3.fromHSV(hue, 1, 1)

        -- Nome / Bio (Brookhaven)
		if Rainbow.Name and RE:FindFirstChild("1RPNam1eColo1r") then
			RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", color)
		end
		if Rainbow.Bio and RE:FindFirstChild("1RPNam1eColo1r") then
			RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", color)
		end

        -- Personagem
		if LocalPlayer.Character then
			for _, v in ipairs(LocalPlayer.Character:GetChildren()) do
				if Rainbow.Body and v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
					v.Color = color
				end
				if Rainbow.Head and v.Name == "Head" then
					v.Color = color
				end
				if Rainbow.Hair and v:IsA("Accessory") and v:FindFirstChild("Handle") then
					v.Handle.Color = color
				end
			end
		end
	end
end)

RainbowTab:AddSection({
	"Info"
})
RainbowTab:AddParagraph({
	"Modo RGB",
	"Funciona para todos verem (Brookhaven RP)"
})
--=========================--
--   ABA: TELEPORTES       --
--=========================--
local Fun = Window:MakeTab({
	"TELEPORTES",
	"fun"
})
Fun:AddParagraph({
	"LUGARES DO BROOKHAVEN",
	"Lista completa dos locais para teleporte"
})

local teleportList = {
	{
		Name = "Início",
		Position = Vector3.new(0, 5, 0)
	},
	{
		Name = "Esconderijo",
		Position = Vector3.new(457.5, -72.5, 112.7)
	},
	{
		Name = "Mecânica",
		Position = Vector3.new(-41.2, 2.6, -376.8)
	},
	{
		Name = "Esconderijo Agency do Posto",
		Position = Vector3.new(182.6, 2.5, -412.1)
	},
	{
		Name = "Posto",
		Position = Vector3.new(130.5, 2.5, -328.0)
	},
	{
		Name = "Shopping",
		Position = Vector3.new(154.1, 2.7, -145.4)
	},
	{
		Name = "Super Mercado",
		Position = Vector3.new(5.7, 2.6, -117.0)
	},
	{
		Name = "Escola",
		Position = Vector3.new(-291.4, 5.8, 216.7)
	}
}

local SelectedTeleport = teleportList[1].Name
Fun:AddDropdown({
	Name = "Selecionar Local",
	Options = (function()
		local t = {}
		for _, v in ipairs(teleportList) do
			table.insert(t, v.Name)
		end
		return t
	end)(),
	Default = SelectedTeleport,
	Callback = function(v)
		SelectedTeleport = v
	end
})

Fun:AddButton({
	"Teleportar",
	function()
		local lp = game.Players.LocalPlayer
		local targetData
		for _, v in ipairs(teleportList) do
			if v.Name == SelectedTeleport then
				targetData = v
				break
			end
		end
		if targetData and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
			lp.Character.HumanoidRootPart.CFrame = CFrame.new(targetData.Position)
			redzlib:Notification({
				Title = "Teleport",
				Description = "Você foi teleportado para: " .. targetData.Name,
				Duration = 3
			})
		end
	end
})

--=========================--
--   ABA TROLL COMPLETA    --
--=========================--
local Troll = Window:MakeTab({
	"TROLL",
	"rbxassetid://140731226103831"
})
Troll:AddSection({
	"Jogadores do servidor"
})

local lp = game.Players.LocalPlayer

local function getPlayers()
	local list = {}
	for _, p in ipairs(game.Players:GetPlayers()) do
		table.insert(list, p.Name)
	end
	return list
end

local SelectedPlayer = nil
local PlayerDropdown = Troll:AddDropdown({
	Name = "Selecione um jogador",
	Options = getPlayers(),
	Default = getPlayers()[1],
	Callback = function(v)
		SelectedPlayer = v
	end
})

local function refreshPlayers()
	local players = getPlayers()
	PlayerDropdown:Refresh(players, true)
	SelectedPlayer = players[1]
end

Troll:AddButton({
	"Atualizar lista",
	refreshPlayers
})
game.Players.PlayerAdded:Connect(refreshPlayers)
game.Players.PlayerRemoving:Connect(refreshPlayers)

-- Spectar jogador
Troll:AddButton({
	"Spectar Jogador",
	function()
		if not SelectedPlayer then
			return
		end
		local plr = game.Players:FindFirstChild(SelectedPlayer)
		if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
			workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
		end
	end
})

-- Parar Spectar
Troll:AddButton({
	"Parar Spectar",
	function()
		if lp.Character and lp.Character:FindFirstChild("Humanoid") then
			workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
		end
	end
})

-- Teleportar até jogador
Troll:AddButton({
	"Teleportar até jogador",
	function()
		if not SelectedPlayer then
			return
		end
		local plr = game.Players:FindFirstChild(SelectedPlayer)
		if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and lp.Character then
			lp.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
		end
	end
})

-- Get Sofá
Troll:AddButton({
	"Get Sofá",
	function()
		if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
			lp.Character.HumanoidRootPart.CFrame = CFrame.new(-82.4, 21, -129.4)
			redzlib:Notification({
				Title = "Get Sofá",
				Description = "Você foi teleportado para o sofá!",
				Duration = 3
			})
		end
	end
})

-- Seguir jogador
local FollowEnabled = false
Troll:AddToggle({
	Name = "Seguir jogador",
	Default = false,
	Callback = function(v)
		FollowEnabled = v
		task.spawn(function()
			while FollowEnabled do
				if SelectedPlayer then
					local plr = game.Players:FindFirstChild(SelectedPlayer)
					if plr and plr.Character and lp.Character then
						local myHRP = lp.Character:FindFirstChild("HumanoidRootPart")
						local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
						if myHRP and targetHRP then
							myHRP.CFrame = targetHRP.CFrame * CFrame.new(1.3, 0, 0)
						end
					end
				end
				task.wait(0.05)
			end
		end)
	end
})

-- Sliders
local flingPower = 200
Troll:AddSlider({
	Name = "Potência Fling",
	Min = 50,
	Max = 1000,
	Default = flingPower,
	Decimal = 0,
	Callback = function(v)
		flingPower = v
	end
})
local superBugPower = 50
Troll:AddSlider({
	Name = "Força Super Bug",
	Min = 10,
	Max = 500,
	Default = superBugPower,
	Decimal = 0,
	Callback = function(v)
		superBugPower = v
	end
})

-- Super Bug Troll
local GuardarEnabled = false
local spinningForce, moveForce
Troll:AddToggle({
	Name = "Super Bug Troll",
	Default = false,
	Callback = function(v)
		GuardarEnabled = v
		if not v then
			if spinningForce then
				spinningForce:Destroy()
			end
			if moveForce then
				moveForce:Destroy()
			end
			return
		end
		task.spawn(function()
			local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then
				return
			end
			spinningForce = Instance.new("BodyAngularVelocity")
			spinningForce.AngularVelocity = Vector3.new(0, superBugPower, 0)
			spinningForce.MaxTorque = Vector3.new(1, 1, 1)
			spinningForce.Parent = hrp
			moveForce = Instance.new("BodyVelocity")
			moveForce.MaxForce = Vector3.new(1, 1, 1)
			moveForce.Parent = hrp
			while GuardarEnabled do
				moveForce.Velocity = Vector3.new(math.random(-superBugPower, superBugPower),
                                            math.random(-superBugPower, superBugPower),
                                            math.random(-superBugPower, superBugPower))
				task.wait(0.1)
			end
		end)
	end
})

-- Fling Jogador
local FlingEnabled = false
Troll:AddToggle({
	Name = "Fling Jogador",
	Default = false,
	Callback = function(state)
		FlingEnabled = state
		task.spawn(function()
			while FlingEnabled do
				if SelectedPlayer then
					local plr = game.Players:FindFirstChild(SelectedPlayer)
					if plr and plr.Character and lp.Character then
						local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
						local myHRP = lp.Character:FindFirstChild("HumanoidRootPart")
						if targetHRP and myHRP then
							local bv = Instance.new("BodyVelocity")
							bv.MaxForce = Vector3.new(1, 1, 1)
							bv.Velocity = (targetHRP.Position - myHRP.Position).Unit * flingPower
							bv.Parent = myHRP
							task.wait(0.1)
							bv:Destroy()
						end
					end
				end
				task.wait(0.1)
			end
		end)
	end
})

-- Bring ao sentar
local BringEnabled = false
Troll:AddToggle({
	Name = "Bring ao Sentar",
	Default = false,
	Callback = function(state)
		BringEnabled = state
		task.spawn(function()
			while BringEnabled do
				if SelectedPlayer then
					local plr = game.Players:FindFirstChild(SelectedPlayer)
					if plr and plr.Character and lp.Character then
						local targetHumanoid = plr.Character:FindFirstChild("Humanoid")
						local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
						local myHRP = lp.Character:FindFirstChild("HumanoidRootPart")
						if targetHumanoid and targetHRP and myHRP and targetHumanoid.Sit then
							targetHRP.CFrame = myHRP.CFrame
						end
					end
				end
				task.wait(0.1)
			end
		end)
	end
})

-- SitHead Troll
Troll:AddButton({
	"SitHead",
	function()
		if not SelectedPlayer then
			return
		end
		local plr = game.Players:FindFirstChild(SelectedPlayer)
		if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") then
			local hrp = plr.Character.HumanoidRootPart
			local head = plr.Character.Head
			hrp.CFrame = CFrame.new(hrp.Position.X, hrp.Position.Y - 2, hrp.Position.Z)
			head.CFrame = hrp.CFrame * CFrame.new(0, -1, 0)
			redzlib:Notification({
				Title = "SitHead",
				Description = "Cabeça do jogador abaixada!",
				Duration = 3
			})
		end
	end
})

local Tab = Window:MakeTab({
	"Script",
	"paper"
})

Tab:AddButton({
	Name = "fly v1",
	Callback = function()
		local main = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local up = Instance.new("TextButton")
		local down = Instance.new("TextButton")
		local onof = Instance.new("TextButton")
		local TextLabel = Instance.new("TextLabel")
		local speaker = game:GetService("Players").LocalPlayer
		main.Name = "main"
		main.Parent = game:GetService("CoreGui")
		main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame.Parent = main
		Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
		Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
		Frame.Position = UDim2.new(0.141942367, 0, 0.379746825, 0)
		Frame.Size = UDim2.new(0, 151, 0, 57)
		up.Name = "up"
		up.Parent = Frame
		up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
		up.Size = UDim2.new(0, 51, 0, 28)
		up.Font = Enum.Font.SourceSans
		up.Text = "UP"
		up.TextColor3 = Color3.fromRGB(0, 0, 0)
		up.TextSize = 14.000
		down.Name = "down"
		down.Parent = Frame
		down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
		down.Position = UDim2.new(0, 0, 0.491228074, 0)
		down.Size = UDim2.new(0, 51, 0, 28)
		down.Font = Enum.Font.SourceSans
		down.Text = "DOWN"
		down.TextColor3 = Color3.fromRGB(0, 0, 0)
		down.TextSize = 14.000
		onof.Name = "onof"
		onof.Parent = Frame
		onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
		onof.Position = UDim2.new(0.629139066, 0, 0.491228074, 0)
		onof.Size = UDim2.new(0, 56, 0, 28)
		onof.Font = Enum.Font.SourceSans
		onof.Text = "fly"
		onof.TextColor3 = Color3.fromRGB(0, 0, 0)
		onof.TextSize = 14.000
		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
		TextLabel.Position = UDim2.new(0.337748349, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 100, 0, 28)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = "gui by me_ozoneYT"
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		local chr = game.Players.LocalPlayer.Character
		local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
		nowe = false
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "GO SUB TO HIM";
			Text = "fly gui by me_ozoneYT";
			Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
		})
		Duration = 16;
		Frame.Active = true
		Frame.Draggable = true
		onof.MouseButton1Down:connect(function()
			if nowe == true then
				nowe = false
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
				speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
			else
				nowe = true
				spawn(function()
					local hb = game:GetService("RunService").Heartbeat
					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end
				end)
				game.Players.LocalPlayer.Character.Animate.Disabled = true
				local Char = game.Players.LocalPlayer.Character
				local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
				for i, v in next, Hum:GetPlayingAnimationTracks() do
					v:AdjustSpeed(0)
				end
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
				speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
				speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
				local plr = game.Players.LocalPlayer
				local torso = plr.Character.Torso
				local flying = true
				local deb = true
				local ctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				local lastctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				local maxspeed = 50
				local speed = 0
				local bg = Instance.new("BodyGyro", torso)
				bg.P = 6561
				bg.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				bg.cframe = torso.CFrame
				local bv = Instance.new("BodyVelocity", torso)
				bv.velocity = Vector3.new(0, 0.1, 0)
				bv.maxForce = Vector3.new(387420489, 387420489, 387420489)
				if nowe == true then
					plr.Character.Humanoid.PlatformStand = true
				end
				while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
					wait()
					if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
						speed = speed + .5 + (speed / maxspeed)
						if speed > maxspeed then
							speed = maxspeed
						end
					elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
						speed = speed - 1
						if speed < 0 then
							speed = 0
						end
					end
					if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
						lastctrl = {
							f = ctrl.f,
							b = ctrl.b,
							l = ctrl.l,
							r = ctrl.r
						}
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
					else
						bv.velocity = Vector3.new(0, 0, 0)
					end
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
				end
				ctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				lastctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				speed = 0
				bg:Destroy()
				bv:Destroy()
				plr.Character.Humanoid.PlatformStand = false
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				tpwalking = false
			else
				local plr = game.Players.LocalPlayer
				local UpperTorso = plr.Character.UpperTorso
				local flying = true
				local deb = true
				local ctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				local lastctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				local maxspeed = 50
				local speed = 0
				local bg = Instance.new("BodyGyro", UpperTorso)
				bg.P = 6561
				bg.maxTorque = Vector3.new(387420489, 387420489, 387420489)
				bg.cframe = UpperTorso.CFrame
				local bv = Instance.new("BodyVelocity", UpperTorso)
				bv.velocity = Vector3.new(0, 0.1, 0)
				bv.maxForce = Vector3.new(387420489, 387420489, 387420489)
				if nowe == true then
					plr.Character.Humanoid.PlatformStand = true
				end
				while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
					wait()
					if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
						speed = speed + .5 + (speed / maxspeed)
						if speed > maxspeed then
							speed = maxspeed
						end
					elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
						speed = speed - 1
						if speed < 0 then
							speed = 0
						end
					end
					if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
						lastctrl = {
							f = ctrl.f,
							b = ctrl.b,
							l = ctrl.l,
							r = ctrl.r
						}
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
					else
						bv.velocity = Vector3.new(0, 0, 0)
					end
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
				end
				ctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				lastctrl = {
					f = 0,
					b = 0,
					l = 0,
					r = 0
				}
				speed = 0
				bg:Destroy()
				bv:Destroy()
				plr.Character.Humanoid.PlatformStand = false
				game.Players.LocalPlayer.Character.Animate.Disabled = false
				tpwalking = false
			end
		end)
		up.MouseButton1Down:connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
		end)
		down.MouseButton1Down:connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
		end)
		game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
			wait(0.7)
			game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
			game.Players.LocalPlayer.Character.Animate.Disabled = false
		end)
	end
}) 

local OP = Window:MakeTab({
	"OP",
	"disc"
})

OP:AddSection({
	Name = "Player"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- SPEED
OP:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 190,
	Default = 16,
	Increment = 1,
	Callback = function(v)
		local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = v
		end
	end
})

-- JUMP
OP:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 190,
	Default = 50,
	Increment = 1,
	Callback = function(v)
		local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.JumpPower = v
		end
	end
})

--=========================
-- NOCLIP (SEM LOOP BUG)
--=========================
local Noclip = false
OP:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(v)
		Noclip = v
	end
})

RunService.Stepped:Connect(function()
	if Noclip and lp.Character then
		for _, p in pairs(lp.Character:GetDescendants()) do
			if p:IsA("BasePart") then
				p.CanCollide = false
			end
		end
	end
end)

--=========================
-- INFINITY JUMP
--=========================
local InfJump = false
OP:AddToggle({
	Name = "Infinity Jump",
	Default = false,
	Callback = function(v)
		InfJump = v
	end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
	if InfJump and lp.Character then
		local hum = lp.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

OP:AddSection({
	Name = "🚧 Mais em breve..."
})
OP:AddSection({
	Name = "❓ Em desenvolvimento"
})
