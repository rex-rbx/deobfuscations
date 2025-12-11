-- patched i think
for l, j in ipairs(game.Workspace.Lobby.GloveStands:GetChildren()) do
        for i, v in ipairs(game.ReplicatedStorage._NETWORK:GetChildren()) do if v.ClassName == "RemoteEvent" then
            v:FireServer(j.Name)
        end
    end
end
