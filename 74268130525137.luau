if game.GameId ~= 9113699321 then
    return
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer;
local UI = loadstring(game:HttpGet("https://xan.bar/init.lua"))()
local Window = UI.New({
	Title = "Steal FPS From Others",
	Theme = "Default",
	Size = UDim2.new(0, 580, 0, 420),
	ShowUserInfo = true,
	ShowActiveList = true
})
local Main = Window:AddTab("Main", UI.Icons.Home)
Main:AddButton("No-Lag", function()
	if not getgenv().NoLagEnabled then
		getgenv().NoLagEnabled = true;
		task.spawn(pcall, function()
			while task.wait() do
          pcall(function()
				    LocalPlayer.leaderstats.Fps.Value = 9e9
          end)
			end
		end)
		UI.Success("NOTIFICATION:", "No-Lag Enabled!")
	else
		UI.Error("ERROR:", "No-Lag already enabled!")
	end
end)
Main:AddButton("Damage All (HOLD SWORD OUT!!!)", function()
	table.foreachi(Players:GetPlayers(), function(_, v)
		pcall(function()
			if v ~= LocalPlayer then
				local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
				if tool then
					tool:Activate()
					firetouchinterest(v.Character.HumanoidRootPart, tool.Handle, 0)
					firetouchinterest(v.Character.HumanoidRootPart, tool.Handle, 1)
				end
			end
		end)
	end)
end)
Main:AddToggle("Infinite Jump (may cause tpback)", function(v)
	getgenv().InfiniteJumpEnabled = v
end)
UserInputService.JumpRequest:Connect(function()
	if getgenv().InfiniteJumpEnabled then
		pcall(function()
			local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
end)
local hitboxEnabled = false;
local hitbox_original_properties = {}
local hitboxSize = 21;
local defaultBodyParts = {
	"UpperTorso",
	"LowerTorso",
	"Torso",
	"Head",
	"HumanoidRootPart"
}
local function findExactPart(player, partName)
    if not player.Character then
        return nil
    end
    local targetNameLower = partName:lower()
    local result = nil
    table.foreachi(player.Character:GetChildren(), function(_, part)
        if part:IsA("BasePart") and part.Name:lower() == targetNameLower then
            result = part
            return
        end
    end)
    return result
end

local function savedPart(player, part)
	if not hitbox_original_properties[player] then
		hitbox_original_properties[player] = {}
	end;
	if not hitbox_original_properties[player][part.Name] then
		hitbox_original_properties[player][part.Name] = {
			CanCollide = part.CanCollide,
			Transparency = part.Transparency,
			Size = part.Size
		}
	end
end;
local function restoredPart(player)
    if hitbox_original_properties[player] then
        table.foreach(hitbox_original_properties[player], function(partName, props)
            local part = player.Character and player.Character:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                part.CanCollide = props.CanCollide
                part.Transparency = props.Transparency
                part.Size = props.Size
            end
        end)
    end
end
local function extendHitbox(player)
    table.foreachi(defaultBodyParts, function(_, partName)
        local part = findExactPart(player, partName)
        if part then
            savedPart(player, part)
            part.CanCollide = true
            part.Transparency = 1
            part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
        end
    end)
end
local function updateHitboxes()
    table.foreachi(Players:GetPlayers(), function(_, player)
        if player ~= LocalPlayer then
            extendHitbox(player)
        end
    end)
end
local function checkForDeadPlayers()
    table.foreach(hitbox_original_properties, function(player)
        if not player.Parent or not player.Character then
            restoredPart(player)
            hitbox_original_properties[player] = nil
        end
    end)
end
task.spawn(function()
    while true do
        if hitboxEnabled then
            updateHitboxes()
            checkForDeadPlayers()
        else
            table.foreachi(Players:GetPlayers(), function(_, player)
                restoredPart(player)
            end)
            hitbox_original_properties = {}
        end
        task.wait(0.05)
    end
end)
Main:AddToggle("Enable Hitbox", function(enabled)
    hitboxEnabled = enabled
end)
