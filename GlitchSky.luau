-- original post: https://scriptblox.com/script/Universal-Script-Skybox-layer-74902
-- original post(er): https://scriptblox.com/u/HACKRaw
-- this annoying blivering idiot keeps posting useless shit, so i deob it anyway 💀
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local limit = 50000;
local YPos = 2500;
local WaitTimePosition = 0.02 + 0;
local WaitTimeRandomizeSkybox = 877.05 - (877)
local Sky = Instance.new("Sky", Lighting)
Sky.Name = "GlitchSky"
local assets = {
	"rbxassetid://18074559",
	"rbxassetid://18986263",
	"rbxassetid://18689350",
	"rbxassetid://18986145",
	"rbxassetid://18986180"
}
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
local BlurEffect = Instance.new("BlurEffect", Lighting)
ColorCorrectionEffect.Contrast = 1;
ColorCorrectionEffect.Saturation = 1;
BlurEffect.Size = 24;
task.spawn(function()
	while HumanoidRootPart.Position.Y < limit do
		if (HumanoidRootPart and HumanoidRootPart.Parent) then
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, YPos, 0)
		end;
		task.wait(WaitTimePosition)
	end
end)
task.spawn(function()
	while true do
		local rand = assets[math.random(#assets)]
		Sky.SkyboxBk = rand;
		Sky.SkyboxDn = rand;
		Sky.SkyboxFt = rand;
		Sky.SkyboxLf = rand;
		Sky.SkyboxRt = rand;
		Sky.SkyboxUp = rand;
		ColorCorrectionEffect.TintColor = Color3.fromHSV(math.random(), 1, 1)
		ColorCorrectionEffect.Brightness = math.random(-3, 3) / (10)
		BlurEffect.Size = math.random(10, 50)
		task.wait(WaitTimeRandomizeSkybox)
	end
end)
RunService.RenderStepped:Connect(function()
	workspace.CurrentCamera.CFrame *= CFrame.Angles(math.rad(math.random(-1, 1)), math.rad(math.random(-1, 1)), 0)
end)
