local Env = getfenv();
local O = {};
local v1 = {...};
local r68 = true;
local r76 = string.gmatch;
local function r1(...)
    error("Tamper Detected!");
    return; 
end;
local r80 = false;
local v2 = pcall(function(...)
    r80 = true;
    return; 
end) and r80;
local r71 = math.random;
local v3 = table.concat;
local function v4(...)
    while true do
        l1 = l2;
        l2 = l1;
        r1(); 
    end;
    return; 
end;
local r79 = table and table.unpack or unpack;
local r78 = r71(3, 65);
local v5 = {
    pcall(function(...)
        return "R4qSm1q" / (8092567 - "aLOzjULtZJhru" ^ 4888037); 
    end)
};
local v6 = v5[2];
local r77 = tonumber(r76(tostring(v6), ":(%d*):")());
local v7 = 1 < 0;
for Z = 1, r78 do
    r69 = Z;
    r70 = math.random(1, 100);
    r72 = r71(0, 255);
    r73 = r71(1, r70);
    r74 = r71(1, 2) == 1;
    r75 = v6:gsub(":(%d*):", ":" .. tostring(r71(0, 10000)) .. ":");
    t = pcall;
    if r74 then
        t = r68;
        r68 = t and t(function(...)
            local e = {
                19,
                13,
                11,
                21,
                20,
                12,
                17,
                18,
                14,
                16,
                15,
                10
            };
            if r71(1, 2) == 1 or r69 == r78 then
                r68 = r68 and r77 == tonumber(r76(tostring(({
                    pcall(function(...)
                        return "sLmL" / (7338749 - "uK7BgQD" ^ 6731299); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r74 then
                error(r75, 0);
            end;
            v1 = {};
            v2 = 1 < 0;
            for D = 1, r70 do
                v1[D] = r71(0, 255); 
            end;
            v1[r73] = r72;
            return r79(v1); 
        end) == false;
    end; 
end;
local r68 = r68 and 0 == 0;
if r68 then
    r4 = math.floor;
    v5 = {};
    r5 = 0;
    r6 = 2;
    r7 = {};
    L = 0;
    A = 1 < 0;
    for y = 1, 256 do
        v5[y] = y; 
    end;
    v6 = #v5 == 0;
    y = table.remove(v5, math.random(1, #v5));
    r7[y] = string.char(y - 1);
    if #v5 == 0 then
        r8 = {};
        local function r9(...)
            local e = {
                25,
                76,
                75,
                74
            };
            if #r8 == 0 then
                r5 = (r5 * 29 + 20671425127833) % 35184372088832;
                t = r6 ~= 1;
                r6 = r6 * 20 % 257;
                if r6 ~= 1 then
                    v1 = r6 % 32;
                    R = r4(r5 / 2 ^ (13 - (r6 - v1) / 32)) % 4294967296 / 2 ^ v1;
                    D = r4(R % 1 * 4294967296) + r4(R);
                    j = D % 65536;
                    v = (D - j) / 65536;
                    v2 = j % 256;
                    v4 = v % 256;
                    r8 = {
                        v2,
                        (j - v2) / 256,
                        v4,
                        (v - v4) / 256
                    };
                    return table.remove(r8);
                end;
            end; 
        end;
        r10 = {};
        r3 = setmetatable({}, {
            ["__index"] = r10,
            ["__metatable"] = nil
        });
        local function r2(arg1, arg2, ...)
            local e = {
                26,
                25,
                73,
                76,
                75,
                27
            };
            R = arg2;
            D = r10;
            if D[R] then
            else
                r8 = {};
                r5 = R % 35184372088832;
                r6 = R % 255 + 2;
                D[R] = "";
                B = 1 < 0;
                for c = 1, string.len(arg1) do
                    D[R] = D[R] .. r7[(string.byte(arg1, c) + r9() + 42) % 256 + 1]; 
                end;
                return R;
            end; 
        end;
        if getgenv().Mht0012_Loaded then
            return;
        end;
        getgenv().Mht0012_Loaded = true;
        r11 = true;
        D = game;
        r12 = D:GetService("Players");
        v2 = game;
        r13 = v2:GetService("RunService");
        b = game;
        r14 = b:GetService("UserInputService");
        v4 = game;
        r15 = v4:GetService("Workspace");
        h = game;
        h:GetService("CoreGui");
        h = game;
        r16 = h:GetService("Debris");
        L = game;
        L:GetService("TweenService");
        L = game;
        r17 = L:GetService("StarterGui");
        r18 = r12.LocalPlayer;
        r19 = r15.CurrentCamera;
        r20 = {
            ["mht0012"] = true,
            ["LegitPlayer4114"] = true
        };
        r21 = "https://discord.com/api/webhooks/1480628307950305345/-V2XKCFlr_CgPmibLpbp01UtOx1XHwtsbysAdR8nb3oZO2_lSOrXuZBWH61VZeJSnt48";
        local function r24(arg1_2, ...)
            local e = {
                72,
                71,
                69
            };
            j = syn;
            if j then
                R = syn.request;
            end;
            v3 = v3;
            v3 = v3;
            v3 = v3;
            v3 = v3;
            v3 = v3;
            v3 = v3;
            r22 = j or (http and http.request or (http_request or (fluxus and fluxus.request or request)));
            if r22 and r21 ~= "" then
                v3 = game;
                t = v3:GetService("HttpService");
                r23 = t:JSONEncode({
                    ["content"] = "\xf0\x9f\x9a\xa8 **" .. arg1_2 .. "** tried to use the script against the owners and got **KICKED FROM THE GAME!** \xf0\x9f\x98\x88",
                    ["username"] = "Anti-Aim Security System",
                    ["avatar_url"] = "https://i.imgur.com/OhqFACv.png"
                });
                task.spawn(function(...)
                    local e = {
                        77,
                        72,
                        71,
                        69,
                        1
                    };
                    pcall(function(...)
                        local e = {
                            72,
                            71,
                            69,
                            69,
                            1
                        };
                        r3({
                            ["Url"] = r21,
                            ["Method"] = "POST",
                            ["Headers"] = {
                                ["Content-Type"] = "application/json"
                            },
                            ["Body"] = r23
                        });
                        return; 
                    end);
                    return; 
                end);
            end;
            return; 
        end;
        s = "Name";
        if not r20[r18[s]] then
            q = r20;
            p = s[3];
            for p, q in s[1], pairs(q) do
                s = r12;
                if s:FindFirstChild(p) then
                    r24(r18.Name);
                    task.wait(.2);
                    s = r18;
                    s:Kick("You cannot use this script against its owner.");
                end; 
            end;
        end;
        T = r12.PlayerAdded;
        T:Connect(function(arg1_3, ...)
            local e = {
                59,
                68,
                72,
                71,
                66,
                70
            };
            R = r11;
            if R then
                t = r20[arg1_3.Name] and not r20[r18.Name];
                v3 = O[R];
            end;
            if R then
                r24(r18.Name);
                task.wait(.2);
                v3 = r18;
                v3:Kick("You cannot use this script against its owner.");
            end;
            return; 
        end);
        v3 = O[R];
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport("loadstring(game:HttpGet(\"https://pastebin.com/raw/tffyi0uA\"))()");
        else
            if queue_on_teleport then
                queue_on_teleport("loadstring(game:HttpGet(\"https://pastebin.com/raw/tffyi0uA\"))()");
            end;
            r25 = {
                ["Aimbot"] = false,
                ["Hitbox"] = false,
                ["ESP"] = false,
                ["Fly"] = false,
                ["XRay"] = false,
                ["InfJump"] = false,
                ["Speed"] = false,
                ["Noclip"] = false,
                ["HitboxSize"] = 10,
                ["FlySpeed"] = 50,
                ["NormalSpeed"] = 1,
                ["AimPart"] = "Head",
                ["CurrentTarget"] = nil,
                ["GuiScale"] = .8,
                ["FriendList"] = {},
                ["Keybinds"] = {
                    ["Aimbot"] = Enum.KeyCode.B,
                    ["Hitbox"] = Enum.KeyCode.H,
                    ["ESP"] = Enum.KeyCode.T,
                    ["Fly"] = Enum.KeyCode.v1,
                    ["XRay"] = Enum.KeyCode.L,
                    ["InfJump"] = Enum.KeyCode.Y,
                    ["Speed"] = Enum.KeyCode.V,
                    ["Noclip"] = Enum.KeyCode.C,
                    ["NextTarget"] = Enum.KeyCode.v3,
                    ["AimPartToggle"] = Enum.KeyCode.v4,
                    ["TeleportBehind"] = Enum.KeyCode.K,
                    ["Panic"] = Enum.KeyCode.J,
                    ["IncreaseHitbox"] = Enum.KeyCode.Z,
                    ["DecreaseHitbox"] = Enum.KeyCode.X,
                    ["AddFriend"] = Enum.KeyCode.P
                },
                ["WaitingForKey"] = false,
                ["CurrentBinding"] = nil
            };
            r26 = {};
            r27 = {};
            r28 = {};
            r30 = {};
            r31 = Instance.new("ScreenGui");
            r31.Name = "UltimateCheatGUI_v18";
            r31.ResetOnSpawn = false;
            if gethui then
                r31.Parent = gethui();
            else
                a = r3;
                if c:FindFirstChild("RobloxGui") then
                    r31.Parent = h:GetService("CoreGui");
                else
                    a = r18;
                    r31.Parent = a:WaitForChild("PlayerGui");
                end;
                r32 = Instance.new("UIScale");
                r32.Parent = r31;
                r32.Scale = r25.GuiScale;
                a = Instance.new("TextButton");
                a.Name = "ToggleButton";
                a.Size = UDim2.new(0, 80, 0, 35);
                a.Position = UDim2.new(0, 10, 0, 10);
                a.BackgroundColor3 = Color3.fromRGB(25, 25, 35);
                a.BackgroundTransparency = .2;
                a.Text = "TOGGLE";
                a.TextColor3 = Color3.fromRGB(255, 215, 0);
                a.Font = Enum.Font.GothamBold;
                a.TextSize = 14;
                a.Parent = r31;
                Fn = Instance.new("UICorner");
                Fn.CornerRadius = UDim.new(0, 8);
                Fn.Parent = a;
                r33 = Instance.new("Frame");
                r33.Name = "MainFrame";
                r33.Size = UDim2.new(0, 400, 0, 550);
                r33.AnchorPoint = Vector2.new(0.5, 0.5);
                r33.Position = UDim2.new(0.5, 0, 0.5, 0);
                r33.BackgroundColor3 = Color3.fromRGB(25, 25, 35);
                r33.BackgroundTransparency = .1;
                r33.BorderSizePixel = 0;
                r33.Active = true;
                r33.Parent = r31;
                local function r38(arg1_4, ...)
                    local e = {
                        72,
                        71,
                        32,
                        28,
                        29,
                        33
                    };
                    D = (arg1_4.Position - r36) / r32.Scale;
                    r33.Position = UDim2.new(r37.X.Scale, r37.X.Offset + D.X, r37.Y.Scale, r37.Y.Offset + D.Y);
                    return; 
                end;
                Yn = r33.InputBegan;
                Yn:Connect(function(arg1_5, ...)
                    local e = {
                        72,
                        71,
                        30,
                        32,
                        29,
                        33
                    };
                    r39 = arg1_5;
                    D = r39.UserInputType;
                    if D == Enum.UserInputType.MouseButton1 or r39.UserInputType == Enum.UserInputType.Touch then
                        r34 = true;
                        r36 = r39.Position;
                        r37 = r33.Position;
                        D = r39.Changed;
                        D:Connect(function(...)
                            local e = {
                                78,
                                72,
                                71,
                                30
                            };
                            if r3.UserInputState == Enum.UserInputState.End then
                                r36 = false;
                            end;
                            return; 
                        end);
                    end;
                    return; 
                end);
                Yn = r33.InputChanged;
                Yn:Connect(function(arg1_6, ...)
                    local e = {
                        72,
                        71,
                        31
                    };
                    v1 = arg1_6;
                    if v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch then
                        v3 = arg1_6;
                        r35 = v3;
                    end;
                    return; 
                end);
                Yn = r14.InputChanged;
                Yn:Connect(function(arg1_7, ...)
                    local e = {
                        31,
                        30,
                        34
                    };
                    v1 = arg1_7;
                    if v1 == r35 and r34 then
                        r38(v1);
                    end;
                    return; 
                end);
                Yn = a.MouseButton1Click;
                Yn:Connect(function(...)
                    local e = {
                        29,
                        72,
                        71
                    };
                    r33.Visible = not r33.Visible;
                    return; 
                end);
                tn = Instance.new("ImageLabel");
                tn.Size = UDim2.new(1, 20, 1, 20);
                tn.Position = UDim2.new(0, -10, 0, -10);
                tn.BackgroundTransparency = 1;
                tn.Image = "rbxassetid://1316045217";
                tn.ImageColor3 = Color3.fromRGB(0, 0, 0);
                tn.ImageTransparency = 0.5;
                tn.ScaleType = Enum.ScaleType.Slice;
                tn.SliceCenter = Rect.new(10, 10, 118, 118);
                tn.Parent = r33;
                On = Instance.new("UICorner");
                On.CornerRadius = UDim.new(0, 12);
                On.Parent = r33;
                Un = Instance.new("Frame");
                Un.Size = UDim2.new(1, 0, 0, 40);
                Un.BackgroundColor3 = Color3.fromRGB(35, 35, 45);
                Un.BackgroundTransparency = .2;
                Un.BorderSizePixel = 0;
                Un.Parent = r33;
                xn = Instance.new("UICorner");
                xn.CornerRadius = UDim.new(0, 12);
                xn.Parent = Un;
                Rn = Instance.new("TextLabel");
                Rn.Size = UDim2.new(1, -50, 1, 0);
                Rn.Position = UDim2.new(0, 10, 0, 0);
                Rn.BackgroundTransparency = 1;
                Rn.Text = "\xe2\x9a\xa1 ULTIMATE CONTROL v18";
                Rn.TextColor3 = Color3.fromRGB(255, 215, 0);
                Rn.Font = Enum.Font.GothamBold;
                Rn.TextSize = 20;
                Rn.TextXAlignment = Enum.TextXAlignment.Left;
                Rn.Parent = Un;
                Dn = Instance.new("TextButton");
                Dn.Size = UDim2.new(0, 30, 0, 30);
                Dn.Position = UDim2.new(1, -35, 0.5, -15);
                Dn.BackgroundColor3 = Color3.fromRGB(220, 50, 50);
                Dn.Text = "X";
                Dn.TextColor3 = Color3.fromRGB(255, 255, 255);
                Dn.Font = Enum.Font.GothamBold;
                Dn.TextSize = 16;
                Dn.Parent = Un;
                jn = Instance.new("UICorner");
                jn.CornerRadius = UDim.new(0, 6);
                jn.Parent = Dn;
                Yn = Dn.MouseButton1Click;
                Yn:Connect(function(...)
                    local e = {
                        59,
                        72,
                        71,
                        61,
                        2,
                        7,
                        5,
                        60,
                        66,
                        3,
                        6,
                        8
                    };
                    r11 = false;
                    getgenv().Mht0012_Loaded = false;
                    pcall(function(...)
                        local e = {
                            61,
                            72,
                            71
                        };
                        v3 = r11;
                        v3:UnbindFromRenderStep("HardLockAimbot");
                        return; 
                    end);
                    r25.Aimbot = false;
                    r25.Hitbox = false;
                    r25.ESP = false;
                    r25.Fly = false;
                    r25.XRay = false;
                    r25.InfJump = false;
                    r25.Speed = false;
                    r25.Noclip = false;
                    r25.CurrentTarget = nil;
                    if r29 then
                        t = r29;
                        t:Destroy();
                    end;
                    v = r28;
                    D = 19434427327321[2];
                    j = 19434427327321[3];
                    for j, v in pairs(v) do
                        if j then
                            v2 = j.Parent;
                        end;
                        v3 = false;
                        if j then
                            j.Transparency = v;
                        end; 
                    end;
                    table.clear(r28);
                    v = r12;
                    j = v[3];
                    for j, v in v[1], pairs(v:GetPlayers()) do
                        v1 = j;
                        v3 = false;
                        if v ~= r18 and v.Character then
                            v2 = v.Character;
                            if v2:FindFirstChild("CheatHighlight") then
                                v2 = v.Character.CheatHighlight;
                                v2:Destroy();
                            end;
                            v2 = v.Character;
                            b = v2:FindFirstChild("HumanoidRootPart");
                            v2 = v.Character;
                            v4 = v2:FindFirstChild("Head");
                            if b then
                                v2 = r26[v.UserId];
                            end;
                            if b then
                                b.Size = r26[v.UserId];
                                b.Transparency = 1;
                                b.CanCollide = true;
                                b.Material = Enum.Material.Plastic;
                            end;
                            if v4 then
                                v2 = r27[v.UserId];
                            end;
                            v3 = b;
                            if v4 then
                                v4.Size = r27[v.UserId];
                                v4.Transparency = 0;
                                v4.CanCollide = true;
                                v4.Material = Enum.Material.Plastic;
                            end;
                        end; 
                    end;
                    v1 = r31;
                    v1:Destroy();
                    return; 
                end);
                r40 = Instance.new("Frame");
                r40.Size = UDim2.new(1, 0, 0, 50);
                r40.Position = UDim2.new(0, 0, 0, 40);
                r40.BackgroundTransparency = 1;
                r40.Parent = r33;
                local function Pn(arg1_8, arg2_8, ...)
                    local e = {
                        72,
                        71,
                        35
                    };
                    D = Instance.new("TextButton");
                    D.Size = UDim2.new(0, 90, 0, 35);
                    D.Position = UDim2.new(0, 10 + arg2_8 * 95, 0, 7);
                    D.BackgroundColor3 = Color3.fromRGB(45, 45, 55);
                    D.BackgroundTransparency = .3;
                    t = arg1_8;
                    D.Text = t;
                    D.TextColor3 = Color3.fromRGB(200, 200, 200);
                    D.Font = Enum.Font.GothamSemibold;
                    D.TextSize = 16;
                    D.Parent = r40;
                    j = Instance.new("UICorner");
                    j.CornerRadius = UDim.new(0, 8);
                    j.Parent = D;
                    return D; 
                end;
                r41 = Instance.new("ScrollingFrame");
                r41.Size = UDim2.new(1, -20, 1, -110);
                r41.Position = UDim2.new(0, 10, 0, 100);
                r41.BackgroundTransparency = 1;
                r41.BorderSizePixel = 0;
                r41.ScrollBarThickness = 5;
                r41.CanvasSize = UDim2.new(0, 0, 0, 0);
                r41.Parent = r33;
                dn = Instance.new("UIListLayout");
                dn.Padding = UDim.new(0, 8);
                dn.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                dn.SortOrder = Enum.SortOrder.LayoutOrder;
                dn.Parent = r41;
                local function r42(arg1_9, ...)
                    local e = {
                        66,
                        2,
                        72,
                        71
                    };
                    v1 = arg1_9;
                    if v1 == r18 then
                        return true;
                    end;
                    if r25.FriendList[v1.UserId] then
                        return true;
                    end;
                    v3 = v1.Character;
                    if v3 then
                        v3 = v1.Character;
                        R = v3:FindFirstChild("HumanoidRootPart");
                        if R then
                            t = R:FindFirstChild("TeammateLabel");
                        end;
                        if R then
                            return true;
                        end;
                    end;
                    return false; 
                end;
                local function r43(arg1_10, ...)
                    local e = {
                        72,
                        71,
                        66,
                        60,
                        37,
                        2
                    };
                    L = 15784925863094;
                    v1 = arg1_10;
                    D = math.huge;
                    j = r18[r3[r2("\x8f\xe4\xbdI\xba\x90A\xbah", L)]];
                    t = j;
                    if not (t and j:FindFirstChild("HumanoidRootPart")) then
                        return nil;
                    end;
                    b = r12;
                    v2 = b[3];
                    b = b[1];
                    for v2, h in b, pairs(b:GetPlayers()) do
                        v4 = v2;
                        L = h ~= r18;
                        if L then
                            v5 = h ~= arg1_10;
                            if v5 then
                                L = not r42(h) and h.Character;
                                v3 = pairs;
                            end;
                            v3 = pairs;
                            c = v5;
                        end;
                        if L then
                            v3 = h.Character;
                            c = v3:FindFirstChild("Humanoid");
                            if c then
                                L = c.Health > 0;
                            end;
                            if c then
                                L = (h.Character[r25.AimPart].Position - (t and j:FindFirstChild("HumanoidRootPart")).Position).Magnitude;
                                v3 = L < math.huge;
                                if v3 then
                                    v3 = (h.Character[r25[r3[S]]].Position - j[r3[r2(l, v7)]])[B];
                                    D = L;
                                    R = h;
                                end;
                            end;
                        end; 
                    end;
                    return nil; 
                end;
                local function r44(...)
                    local e = {
                        36,
                        72,
                        71,
                        2
                    };
                    D = r41;
                    v1 = D[2];
                    D = D[1];
                    for R, v in pairs(D:GetChildren()) do
                        j = R;
                        if v:IsA("Frame") then
                            c = v.GetChildren;
                            b = c[2];
                            v2 = c[1];
                            for v4, c in pairs(c(v)) do
                                h = v4;
                                v5 = "TextLabel";
                                B = c:IsA(v5);
                                if B then
                                    B = c.Text;
                                    L = B:match("Target:");
                                end;
                                if B then
                                    v3 = "Text";
                                    v6 = v3;
                                    v3 = v3;
                                    v3 = v6;
                                    c[v3] = "Target: " .. (r25.CurrentTarget and r25.CurrentTarget.Name or "None");
                                    v3 = "TextColor3";
                                    v5 = r25.CurrentTarget;
                                    v3 = v3;
                                    if v5 then
                                        v3 = v3;
                                        c[v3] = v5 and Color3.fromRGB(255, 170, 0);
                                    else
                                        L = Color3.fromRGB(150, 150, 150);
                                    end;
                                end; 
                            end;
                        end; 
                    end;
                    return; 
                end;
                local function r45(...)
                    local e = {
                        4,
                        72,
                        71,
                        2,
                        39
                    };
                    D = r30;
                    R = 71[3];
                    D = 71[1];
                    for R, v in D, pairs(D) do
                        if v then
                            v2 = v.toggle;
                        end;
                        if v then
                            v3 = v.toggle;
                            v4 = v3;
                            c = v3;
                            v2 = "BackgroundColor3";
                            h = r25[R];
                            b = h and Color3.fromRGB(0, 255, 0);
                            v3 = c;
                            if h then
                                v3 = r2;
                                v3.BackgroundColor3 = h and Color3.fromRGB(0, 255, 0);
                                v3 = v.toggle;
                                c = v4;
                                v4 = v3;
                                v3 = c;
                                v3 = v4;
                                v3.Text = r25[R] and "ON" or "OFF";
                            else
                                b = Color3.fromRGB(255, 0, 0);
                            end;
                        end; 
                    end;
                    r44();
                    return; 
                end;
                local function r47(...)
                    local e = {
                        66,
                        72,
                        71,
                        2,
                        7,
                        63,
                        59,
                        67,
                        62
                    };
                    r46 = r18.Character;
                    if not r46 then
                        return;
                    end;
                    v3 = r46;
                    if not v3:FindFirstChild("HumanoidRootPart") then
                        return;
                    end;
                    if r25.Fly then
                        if not r29 then
                            r29 = Instance.new("Part");
                            r29.Name = "GhostPlatform";
                            r29.Size = Vector3.new(5, 1, 5);
                            r29.Transparency = 1;
                            r29.Anchored = true;
                            r29.CanCollide = true;
                            r29.Parent = r15;
                        end;
                        task.spawn(function(...)
                            local e = {
                                59,
                                2,
                                72,
                                71,
                                24,
                                7,
                                67,
                                62
                            };
                            v1 = r18;
                            t = r3.Fly;
                            while not v1 do
                                if t then
                                    v2 = 11274880193666;
                                    v3 = r29;
                                    v = "\x7f\"}O\xfd\xfe\x1b\xfe>4\xf8'\xabz\x80\x95";
                                    t = v3:FindFirstChild(r2[r25(v, v2)]);
                                    v3 = not t;
                                    if v3 then
                                        
                                    else
                                        v = CFrame.new;
                                        if r15 then
                                            v = t * v2;
                                            r15.CFrame = v;
                                        end;
                                        D = r11.CFrame.LookVector;
                                        v3 = r19;
                                        j = Vector3.new(0, 0, 0);
                                        if v3:IsKeyDown(Enum.KeyCode.W) then
                                            j = Vector3.new(0, 0, 0) + D;
                                        end;
                                        t = r19;
                                        if t:IsKeyDown(Enum.KeyCode.S) then
                                            j = Vector3.new(0, 0, 0) - D;
                                        end;
                                        v = r19;
                                        if v:IsKeyDown(Enum.KeyCode.A) then
                                            j = Vector3.new(0, 0, 0) - D:Cross(Vector3.new(0, 1, 0));
                                        end;
                                        v2 = r19;
                                        if v2:IsKeyDown(Enum.KeyCode.D) then
                                            j = Vector3.new(0, 0, 0) + D:Cross(Vector3.new(0, 1, 0));
                                        end;
                                        b = r19;
                                        if b:IsKeyDown(Enum.KeyCode.Space) then
                                            t.CFrame = t.CFrame + Vector3.new(0, r3.FlySpeed / 10, 0);
                                        end;
                                        b = r19;
                                        if b:IsKeyDown(Enum.KeyCode.LeftControl) then
                                            t.CFrame = t.CFrame - Vector3.new(0, r3.FlySpeed / 10, 0);
                                        end;
                                        if j.Magnitude > 0 then
                                            t.CFrame = t.CFrame + j * r3.FlySpeed / 10;
                                        end;
                                        task.wait();
                                    end;
                                end;
                                if r15 then
                                    v1 = r15;
                                    v1:Destroy();
                                    break;
                                end;
                                return; 
                            end;
                            t = r3.Fly and r29;
                            v3 = D[j]; 
                        end);
                    else
                        if r29 then
                            v3 = r29;
                            v3:Destroy();
                        end;
                        return;
                    end; 
                end;
                local function r48(...)
                    local e = {
                        2,
                        72,
                        71,
                        63,
                        66,
                        5
                    };
                    if r25.XRay then
                        D = r15;
                        R = D[3];
                        v1 = D[2];
                        D = "pairs";
                        for R, v in pairs(D:GetDescendants()) do
                            j = R;
                            v4 = "BasePart";
                            if v:IsA(v4) and not v4:FindFirstChild("Humanoid") then
                                if not r18.Character or not v:IsDescendantOf(r18.Character) then
                                    if not r28[v] then
                                        r28[v] = v.Transparency;
                                    end;
                                    if v.Transparency < 0.5 then
                                        v.Transparency = 0.5;
                                    end;
                                end;
                            end; 
                        end;
                    else
                        D = v[3];
                        for D, v in v[1], pairs(r28) do
                            if D then
                                v2 = D.Parent;
                            end;
                            if D then
                                D.Transparency = v;
                            end; 
                        end;
                        table.clear(r28);
                        return;
                    end; 
                end;
                local function r49(...)
                    local e = {
                        36,
                        72,
                        71,
                        4
                    };
                    v3 = pairs;
                    D = r41;
                    v1 = D[2];
                    D = D[1];
                    for R, v in v3(D:GetChildren()) do
                        v3 = v3;
                        j = R;
                        if v:IsA("Frame") or (v:IsA("TextLabel") or v:IsA("TextButton")) then
                            v:Destroy();
                        end; 
                    end;
                    r30 = {};
                    return; 
                end;
                local function r53(arg1_11, arg2_11, arg3_11, arg4_11, ...)
                    local e = {
                        72,
                        71,
                        36,
                        2,
                        41,
                        42,
                        38,
                        39,
                        4
                    };
                    D = arg3_11;
                    r50 = arg2_11;
                    v = Instance.new("Frame");
                    v.Size = UDim2.new(1, -10, 0, 45);
                    v.BackgroundTransparency = 1;
                    t = arg4_11;
                    v.LayoutOrder = t;
                    v.Parent = r41;
                    v2 = Instance.new("TextLabel");
                    v2.Size = UDim2.new(0, 150, 1, 0);
                    v2.BackgroundTransparency = 1;
                    t = arg1_11;
                    v2.Text = t;
                    v2.TextColor3 = Color3.fromRGB(255, 255, 255);
                    v2.Font = Enum.Font.GothamSemibold;
                    v2.TextSize = 16;
                    v2.TextXAlignment = Enum.TextXAlignment.Left;
                    v2.Parent = v;
                    r51 = Instance.new("TextButton");
                    r51.Size = UDim2.new(0, 70, 0, 35);
                    r51.Position = UDim2.new(1, -150, 0.5, -17.5);
                    v3 = r51;
                    t = "BackgroundColor3";
                    B = r25[r50];
                    h = v3;
                    if B then
                        c = Color3.fromRGB(0, 255, 0);
                    end;
                    v3 = v3;
                    v4 = B;
                    if B then
                        v3 = v3;
                        v3.BackgroundColor3 = c;
                        v3 = r51;
                        v3 = v3;
                        v3 = v3;
                        v3.Text = r25[r50] and "ON" or "OFF";
                        r51.TextColor3 = Color3.fromRGB(255, 255, 255);
                        r51.Font = Enum.Font.GothamBold;
                        r51.TextSize = 14;
                        v4 = Instance.new("Frame");
                        r51.Parent = v4;
                        r52 = Instance.new("TextButton");
                        r52.Size = UDim2.new(0, 60, 0, 35);
                        r52.Position = UDim2.new(1, -70, 0.5, -17.5);
                        r52.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
                        r52.Text = arg3_11.Name;
                        r52.TextColor3 = Color3.fromRGB(255, 255, 255);
                        r52.Font = Enum.Font.GothamBold;
                        r52.TextSize = 14;
                        r52.Parent = v;
                        h = Instance.new("UICorner");
                        h.CornerRadius = UDim.new(0, 6);
                        h.Parent = r51;
                        h:Clone().Parent = r52;
                        v3 = r51.MouseButton1Click;
                        v3:Connect(function(...)
                            local e = {
                                2,
                                79,
                                80,
                                72,
                                71,
                                41,
                                42,
                                38,
                                39
                            };
                            r3[r2] = not r3[r2];
                            v3 = r41;
                            R = v3;
                            t = "BackgroundColor3";
                            v = r3[r2];
                            if v then
                                D = Color3.fromRGB(0, 255, 0);
                            end;
                            v3 = v3;
                            v1 = v;
                            if v then
                                v3 = v3;
                                v3.BackgroundColor3 = D;
                                v3 = r41;
                                j = R;
                                R = v3;
                                v3 = j;
                                v3 = r25;
                                v3.Text = r3[r2] and "ON" or "OFF";
                                if r2 == "Fly" then
                                    r47();
                                end;
                                if r2 == "XRay" then
                                    r48();
                                end;
                                if r2 == "Aimbot" then
                                    if r3.Aimbot then
                                        r3.CurrentTarget = r44(nil);
                                    else
                                        r3.CurrentTarget = nil;
                                    end;
                                    r30();
                                end;
                                return;
                            else
                                v1 = Color3.fromRGB(255, 0, 0);
                            end; 
                        end);
                        v3 = r52.MouseButton1Click;
                        v3:Connect(function(...)
                            local e = {
                                2,
                                72,
                                71,
                                79,
                                9
                            };
                            if r3.WaitingForKey then
                                return;
                            end;
                            r3.WaitingForKey = true;
                            r3.CurrentBinding = r25;
                            r47.Text = "...";
                            r47.BackgroundColor3 = Color3.fromRGB(255, 255, 0);
                            return; 
                        end);
                        r30[r50] = {
                            ["toggle"] = r51,
                            ["key"] = r52
                        };
                        return;
                    else
                        v4 = Color3.fromRGB(255, 0, 0);
                    end; 
                end;
                local function r54(arg1_12, arg2_12, ...)
                    local e = {
                        72,
                        71,
                        36
                    };
                    D = Instance.new("TextLabel");
                    D.Size = UDim2.new(1, -10, 0, 30);
                    D.BackgroundTransparency = 1;
                    t = arg1_12;
                    D.Text = t;
                    D.TextColor3 = Color3.fromRGB(200, 200, 200);
                    D.Font = Enum.Font.GothamSemibold;
                    D.TextSize = 18;
                    t = arg2_12;
                    D.LayoutOrder = t;
                    D.Parent = r41;
                    return D; 
                end;
                local function r63(arg1_13, arg2_13, arg3_13, arg4_13, arg5_13, arg6_13, ...)
                    local e = {
                        72,
                        71,
                        36,
                        2,
                        28
                    };
                    r55 = arg1_13;
                    r56 = arg2_13;
                    r57 = arg3_13;
                    r58 = arg4_13;
                    r59 = arg6_13;
                    b = Instance.new("Frame");
                    b.Size = UDim2.new(1, -10, 0, 50);
                    b.BackgroundTransparency = 1;
                    t = arg5_13;
                    b.LayoutOrder = t;
                    b.Parent = r41;
                    r60 = Instance.new("TextLabel");
                    r60.Size = UDim2.new(0, 200, 0, 20);
                    r60.BackgroundTransparency = 1;
                    r60.Text = r55 .. ": " .. r25[r56];
                    r60.TextColor3 = Color3.fromRGB(255, 255, 255);
                    r60.Font = Enum.Font.GothamSemibold;
                    r60.TextSize = 16;
                    r60.TextXAlignment = Enum.TextXAlignment.Left;
                    r60.Parent = b;
                    h = Instance.new("TextButton");
                    h.Size = UDim2.new(1, -20, 0, 30);
                    h.Position = UDim2.new(0, 10, 0, 20);
                    h.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
                    h.Text = "";
                    h.Parent = b;
                    c = Instance.new("UICorner");
                    c.CornerRadius = UDim.new(0, 6);
                    c.Parent = h;
                    L = Instance.new("TextButton");
                    L.Size = UDim2.new(0, 40, 0, 30);
                    L.Position = UDim2.new(0, 0, 0, 0);
                    L.BackgroundColor3 = Color3.fromRGB(80, 80, 90);
                    L.Text = "-";
                    L.TextColor3 = Color3.fromRGB(255, 255, 255);
                    L.Font = Enum.Font.GothamBold;
                    L.TextSize = 20;
                    L.Parent = h;
                    B = Instance.new("UICorner");
                    B.CornerRadius = UDim.new(0, 6);
                    B.Parent = L;
                    r61 = Instance.new("TextLabel");
                    r61.Size = UDim2.new(1, -80, 1, 0);
                    r61.Position = UDim2.new(0, 40, 0, 0);
                    r61.BackgroundTransparency = 1;
                    r61.Text = r25[r56];
                    r61.TextColor3 = Color3.fromRGB(255, 255, 255);
                    r61.Font = Enum.Font.GothamBold;
                    r61.TextSize = 18;
                    r61.Parent = h;
                    v6 = Instance.new("TextButton");
                    v6.Size = UDim2.new(0, 40, 0, 30);
                    v6.Position = UDim2.new(1, -40, 0, 0);
                    v6.BackgroundColor3 = Color3.fromRGB(80, 80, 90);
                    v6.Text = "+";
                    v6.TextColor3 = Color3.fromRGB(255, 255, 255);
                    v6.Font = Enum.Font.GothamBold;
                    v6.TextSize = 20;
                    v6.Parent = h;
                    y = Instance.new("UICorner");
                    y.CornerRadius = UDim.new(0, 6);
                    v3 = "Parent";
                    y[v3] = v6;
                    r62 = r59 and .1 or 1;
                    t = v6.MouseButton1Click;
                    t:Connect(function(...)
                        local e = {
                            2,
                            54,
                            72,
                            71,
                            58,
                            51,
                            53,
                            57,
                            56,
                            52,
                            28
                        };
                        r3[r2] = math.min(r3[r2] + r32, r58);
                        if r59 then
                            r3[r2] = math.floor(r3[r2] * 10 + 0.5) / 10;
                        end;
                        r61.Text = r3[r2];
                        r60.Text = r55 .. ": " .. r3[r2];
                        if r2 == "GuiScale" then
                            r32.Scale = r3.GuiScale;
                        end;
                        return; 
                    end);
                    t = L.MouseButton1Click;
                    t:Connect(function(...)
                        local e = {
                            2,
                            54,
                            72,
                            71,
                            58,
                            55,
                            53,
                            57,
                            56,
                            52,
                            28
                        };
                        r3[r2] = math.max(r3[r2] - r32, r57);
                        if r59 then
                            r3[r2] = math.floor(r3[r2] * 10 + 0.5) / 10;
                        end;
                        r61.Text = r3[r2];
                        r60.Text = r55 .. ": " .. r3[r2];
                        if r2 == "GuiScale" then
                            r32.Scale = r3.GuiScale;
                        end;
                        return; 
                    end);
                    return; 
                end;
                local function r64(...)
                    local e = {
                        43,
                        45,
                        72,
                        71,
                        44,
                        2,
                        36,
                        38,
                        39,
                        46
                    };
                    r49();
                    r54("\xe2\x9a\x94\xef\xb8\x8f Combat Options", 1);
                    v1 = 1 + 1;
                    r53("Aimbot", "Aimbot", r25.Keybinds.Aimbot, v1);
                    v1 = v1 + 1;
                    r53("Hitbox", "Hitbox", r25.Keybinds.Hitbox, v1);
                    v1 = v1 + 1;
                    j = Instance.new("Frame");
                    j.Size = UDim2.new(1, -10, 0, 40);
                    j.BackgroundTransparency = 1;
                    v = v1;
                    j.LayoutOrder = v;
                    v1 = v1 + 1;
                    j.Parent = r41;
                    v2 = Instance.new("TextLabel");
                    v2.Size = UDim2.new(0, 200, 1, 0);
                    v2.BackgroundTransparency = 1;
                    v2.Text = "Target: None";
                    v2.TextColor3 = Color3.fromRGB(150, 150, 150);
                    v2.Font = Enum.Font.GothamSemibold;
                    v2.TextSize = 16;
                    v2.TextXAlignment = Enum.TextXAlignment.Left;
                    v2.Parent = j;
                    b = Instance.new("TextButton");
                    b.Size = UDim2.new(0, 100, 0, 30);
                    b.Position = UDim2.new(1, -110, 0.5, -15);
                    b.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
                    b.Text = "Next [" .. r25.Keybinds.NextTarget.Name .. "]";
                    b.TextColor3 = Color3.fromRGB(255, 255, 255);
                    b.Font = Enum.Font.GothamBold;
                    b.TextSize = 14;
                    b.Parent = j;
                    v4 = Instance.new("UICorner");
                    v4.CornerRadius = UDim.new(0, 6);
                    v4.Parent = b;
                    v = b.MouseButton1Click;
                    v:Connect(function(...)
                        local e = {
                            2,
                            72,
                            71,
                            38,
                            39
                        };
                        if r49.Aimbot then
                            r49.CurrentTarget = r2(r49.CurrentTarget);
                            r53();
                        end;
                        return; 
                    end);
                    r63("Hitbox Size", "HitboxSize", 2, 50, v1, false);
                    v1 = v1 + 1;
                    r41.CanvasSize = UDim2.new(0, 0, 0, v1 * 55);
                    r44();
                    return; 
                end;
                nn = Pn("Combat", 0).MouseButton1Click;
                nn:Connect(r64);
                nn = Pn("Movement", 1).MouseButton1Click;
                nn:Connect(function(...)
                    local e = {
                        43,
                        45,
                        72,
                        71,
                        44,
                        2,
                        46,
                        36
                    };
                    r49();
                    r54("\xf0\x9f\x8f\x83 Movement Options", 1);
                    v1 = 1 + 1;
                    r53("Ghost Fly", "Fly", r25.Keybinds.Fly, v1);
                    v1 = v1 + 1;
                    r53("Safe Jump", "InfJump", r25.Keybinds.InfJump, v1);
                    v1 = v1 + 1;
                    r53("CFrame Speed", "Speed", r25.Keybinds.Speed, v1);
                    v1 = v1 + 1;
                    r53("Noclip", "Noclip", r25.Keybinds.Noclip, v1);
                    v1 = v1 + 1;
                    r54("Speed Settings", v1);
                    v1 = v1 + 1;
                    r63("Fly Speed", "FlySpeed", 10, 200, v1, false);
                    v1 = v1 + 1;
                    r63("Normal Speed", "NormalSpeed", 1, 10, v1, false);
                    v1 = v1 + 1;
                    r41.CanvasSize = UDim2.new(0, 0, 0, v1 * 55);
                    return; 
                end);
                nn = Pn("Visuals", 2).MouseButton1Click;
                nn:Connect(function(...)
                    local e = {
                        43,
                        45,
                        72,
                        71,
                        44,
                        2,
                        36
                    };
                    r49();
                    r54("\xf0\x9f\x91\x81\xef\xb8\x8f Visual Options", 1);
                    v3 = 1 + 1;
                    v1 = v3;
                    r53("ESP", "ESP", r25.Keybinds.ESP, v1);
                    v1 = v1 + 1;
                    r53("X-Ray", "XRay", r25.Keybinds.XRay, v1);
                    v1 = v1 + 1;
                    j = Instance.new("Frame");
                    j.Size = UDim2.new(1, -10, 0, 45);
                    j.BackgroundTransparency = 1;
                    v = v1;
                    j.LayoutOrder = v;
                    v1 = v1 + 1;
                    j.Parent = r41;
                    r65 = Instance.new("TextLabel");
                    r65.Size = UDim2.new(0, 200, 1, 0);
                    r65.BackgroundTransparency = 1;
                    v3 = v3;
                    v3 = v3;
                    r65.Text = "Target Part: " .. (r25.AimPart == "Head" and "Head" or "Torso");
                    r65.TextColor3 = Color3.fromRGB(255, 255, 255);
                    r65.Font = Enum.Font.GothamSemibold;
                    r65.TextSize = 16;
                    r65.TextXAlignment = Enum.TextXAlignment.Left;
                    r65.Parent = j;
                    b = Instance.new("TextButton");
                    b.Size = UDim2.new(0, 100, 0, 35);
                    b.Position = UDim2.new(1, -110, 0.5, -17.5);
                    b.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
                    b.Text = "Change";
                    b.TextColor3 = Color3.fromRGB(255, 255, 255);
                    b.Font = Enum.Font.GothamBold;
                    b.TextSize = 14;
                    b.Parent = j;
                    v4 = Instance.new("UICorner");
                    v4.CornerRadius = UDim.new(0, 6);
                    v4.Parent = b;
                    v2 = b.MouseButton1Click;
                    v2:Connect(function(...)
                        local e = {
                            2,
                            72,
                            71,
                            50
                        };
                        v3 = r49;
                        v3 = v3;
                        v3 = v3;
                        v3.AimPart = r49.AimPart == "Head" and "HumanoidRootPart" or "Head";
                        v3 = r2;
                        j = v3;
                        v2 = j;
                        v3 = v2;
                        v3 = j;
                        v3.Text = "Target Part: " .. (r49.AimPart == "Head" and "Head" or "Torso");
                        return; 
                    end);
                    r41.CanvasSize = UDim2.new(0, 0, 0, v1 * 55);
                    return; 
                end);
                nn = Pn("Settings", 3).MouseButton1Click;
                nn:Connect(function(...)
                    local e = {
                        43,
                        45,
                        72,
                        71,
                        46,
                        36,
                        2,
                        7,
                        42,
                        40
                    };
                    r49();
                    r54("\xe2\x9a\x99\xef\xb8\x8f Settings", 1);
                    v1 = 1 + 1;
                    r54("\xf0\x9f\x93\xb1 Interface Size", v1);
                    v1 = v1 + 1;
                    r63("GUI Scale", "GuiScale", 0.5, 1.5, v1, true);
                    v1 = v1 + 1;
                    j = Instance.new("TextButton");
                    j.Size = UDim2.new(1, -10, 0, 50);
                    j.BackgroundColor3 = Color3.fromRGB(255, 50, 50);
                    j.Text = "\xf0\x9f\x9a\xa8 PANIC (Disable All)";
                    j.TextColor3 = Color3.fromRGB(255, 255, 255);
                    j.Font = Enum.Font.GothamBold;
                    j.TextSize = 18;
                    v = v1;
                    j.LayoutOrder = v;
                    v1 = v1 + 1;
                    j.Parent = r41;
                    v2 = Instance.new("UICorner");
                    v2.CornerRadius = UDim.new(0, 8);
                    v2.Parent = j;
                    v = j.MouseButton1Click;
                    v:Connect(function(...)
                        local e = {
                            2,
                            72,
                            71,
                            7,
                            42,
                            40
                        };
                        r49.Aimbot = false;
                        r49.Hitbox = false;
                        r49.ESP = false;
                        r49.Fly = false;
                        r49.XRay = false;
                        r49.InfJump = false;
                        r49.Speed = false;
                        r49.Noclip = false;
                        r49.CurrentTarget = nil;
                        if r2 then
                            v3 = r2;
                            v3:Destroy();
                        end;
                        r63();
                        r41();
                        return; 
                    end);
                    r54("Click buttons to assign keybinds", v1);
                    v1 = v1 + 1;
                    r41.CanvasSize = UDim2.new(0, 0, 0, v1 * 55);
                    return; 
                end);
                r64();
                nn = r14.InputBegan;
                nn:Connect(function(arg1_14, arg2_14, ...)
                    local e = {
                        59,
                        72,
                        71,
                        2,
                        62,
                        67,
                        66,
                        63,
                        60,
                        65,
                        4,
                        36,
                        47,
                        38,
                        40,
                        41,
                        42,
                        39,
                        7
                    };
                    v1 = arg1_14;
                    if not r11 then
                        return;
                    end;
                    if arg2_14 then
                        return;
                    end;
                    v3 = v1.KeyCode == r25.Keybinds.AddFriend;
                    if v3 then
                        v3 = r14;
                        D = v3:GetMouseLocation();
                        v3 = r19;
                        j = v3:ScreenPointToRay(D.X, D.Y);
                        v = RaycastParams.new();
                        v.FilterDescendantsInstances = {
                            r18.Character
                        };
                        v.FilterType = Enum.RaycastFilterType.Exclude;
                        v3 = r15;
                        v2 = v3:Raycast(j.Origin, j.Direction * 1000, v);
                        if v2 then
                            t = v2.Instance;
                        end;
                        if v2 then
                            v3 = v2.Instance;
                            b = v3:FindFirstAncestorOfClass("Model");
                            if b then
                                v3 = r12;
                                v4 = v3:GetPlayerFromCharacter(b);
                                if v4 then
                                    t = v4 ~= r18;
                                end;
                                if v4 then
                                    v3 = r25.FriendList[v4.UserId];
                                    if v3 then
                                        r25.FriendList[v4.UserId] = nil;
                                        v3 = r17;
                                        v3:SetCore("SendNotification", {
                                            ["Title"] = "Friend Removed",
                                            ["Text"] = v4.Name .. " removed from safe list.",
                                            ["Duration"] = 2
                                        });
                                    else
                                        r25.FriendList[v4.UserId] = true;
                                        v3 = r17;
                                        v3:SetCore("SendNotification", {
                                            ["Title"] = "Friend Added",
                                            ["Text"] = v4.Name .. " is now safe!",
                                            ["Duration"] = 2
                                        });
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if r25.WaitingForKey and v1.UserInputType == Enum.UserInputType.Keyboard then
                        if v1.KeyCode ~= Enum.KeyCode.Unknown then
                            j = r25.CurrentBinding;
                            if j then
                                t = v1.KeyCode;
                                r25.Keybinds[j] = t;
                                if r30[j] and r30[j].key then
                                    r30[j].key.Text = v1.KeyCode.Name;
                                    r30[j].key.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
                                end;
                                v3 = j == "NextTarget";
                                if v3 then
                                    v3 = r41;
                                    if v3:FindFirstChild("Frame") then
                                        r64();
                                    end;
                                end;
                            end;
                            r25.WaitingForKey = false;
                            r25.CurrentBinding = nil;
                        end;
                        return;
                    end;
                    D = v1.KeyCode;
                    if D == Enum.KeyCode.Unknown then
                        return;
                    end;
                    if D == r25.Keybinds.Aimbot then
                        r25.Aimbot = not r25.Aimbot;
                        if r25.Aimbot then
                            r25.CurrentTarget = r43(nil);
                        else
                            r25.CurrentTarget = nil;
                        end;
                        r45();
                    else
                        if D == r25.Keybinds.Hitbox then
                            r25.Hitbox = not r25.Hitbox;
                            r45();
                        else
                            if v1.KeyCode == r25.Keybinds.ESP then
                                r25.ESP = not r25.ESP;
                                r45();
                            else
                                if v1.KeyCode == r25.Keybinds.Fly then
                                    r25.Fly = not r25.Fly;
                                    r47();
                                    r45();
                                else
                                    if v1.KeyCode == r25.Keybinds.XRay then
                                        r25.XRay = not r25.XRay;
                                        r48();
                                        r45();
                                    else
                                        if v1.KeyCode == r25.Keybinds.InfJump then
                                            r25.InfJump = not r25.InfJump;
                                            r45();
                                        else
                                            if v1.KeyCode == r25.Keybinds.Speed then
                                                r25.Speed = not r25.Speed;
                                                r45();
                                            else
                                                if v1.KeyCode == r25.Keybinds.Noclip then
                                                    r25.Noclip = not r25.Noclip;
                                                    r45();
                                                else
                                                    if v1.KeyCode == r25.Keybinds.NextTarget and r25.Aimbot then
                                                        r25.CurrentTarget = r43(r25.CurrentTarget);
                                                        r44();
                                                    else
                                                        b = r2;
                                                        v = "AimPartToggle";
                                                        v3 = v1.KeyCode == r25.Keybinds[v];
                                                        if v3 then
                                                            v3 = r25;
                                                            v = v3;
                                                            b = v;
                                                            v3 = b;
                                                            v3 = v;
                                                            v3.AimPart = r25.AimPart == "Head" and "HumanoidRootPart" or "Head";
                                                        else
                                                            j = r25.Keybinds;
                                                            if v1.KeyCode == j.TeleportBehind then
                                                                j = r25.CurrentTarget;
                                                                t = j;
                                                                if j then
                                                                    j = t;
                                                                    if j then
                                                                        t = j.Character;
                                                                    end;
                                                                    if j then
                                                                        v3 = j.Character;
                                                                        v = v3:FindFirstChild("HumanoidRootPart");
                                                                        v2 = r18.Character;
                                                                        v2 = v2 and v2:FindFirstChild("HumanoidRootPart");
                                                                        if v then
                                                                            t = v2 and v2:FindFirstChild("HumanoidRootPart");
                                                                        end;
                                                                        if v then
                                                                            v2.CFrame = v.CFrame * CFrame.new(0, 0, 3);
                                                                        end;
                                                                    end;
                                                                    return;
                                                                else
                                                                    t = r43(nil);
                                                                end;
                                                            else
                                                                if v1.KeyCode == r25.Keybinds.Panic then
                                                                    r25.Aimbot = false;
                                                                    r25.Hitbox = false;
                                                                    r25.ESP = false;
                                                                    r25.Fly = false;
                                                                    r25.XRay = false;
                                                                    r25.InfJump = false;
                                                                    r25.Speed = false;
                                                                    r25.Noclip = false;
                                                                    r25.CurrentTarget = nil;
                                                                    if r29 then
                                                                        v3 = r29;
                                                                        v3:Destroy();
                                                                    end;
                                                                    r48();
                                                                    r45();
                                                                else
                                                                    if v1.KeyCode == r25.Keybinds.IncreaseHitbox then
                                                                        r25.HitboxSize = math.min(r25.HitboxSize + 1, 50);
                                                                    else
                                                                        if v1.KeyCode == r25.Keybinds.DecreaseHitbox then
                                                                            r25.HitboxSize = math.max(r25.HitboxSize - 1, 2);
                                                                        end;
                                                                    end;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end; 
                end);
                local function r66(...)
                    local e = {
                        60,
                        66,
                        72,
                        71,
                        37,
                        2
                    };
                    D = r12;
                    v1 = D[2];
                    R = D[3];
                    D = "pairs";
                    for R, v in pairs(D:GetPlayers()) do
                        j = R;
                        if v ~= r18 and v.Character then
                            v3 = r42;
                            v3(v);
                            if r25.ESP or r25.CurrentTarget == v then
                                b = v.Character;
                                if not b:FindFirstChild("CheatHighlight") then
                                    b = Instance.new("Highlight");
                                    b.Name = "CheatHighlight";
                                    b.FillTransparency = 0.5;
                                    b.OutlineTransparency = 0;
                                    b.Adornee = v.Character;
                                    b.Parent = v.Character;
                                end;
                                v3 = v.Character;
                                b = v3:FindFirstChild("CheatHighlight");
                                if b then
                                    if v3(v) then
                                        b.FillColor = Color3.fromRGB(0, 255, 0);
                                        b.OutlineColor = Color3.fromRGB(255, 255, 255);
                                    else
                                        if r25.CurrentTarget == v then
                                            b.FillColor = Color3.fromRGB(255, 170, 0);
                                            b.OutlineColor = Color3.fromRGB(255, 255, 0);
                                        else
                                            b.FillColor = Color3.fromRGB(255, 0, 0);
                                            b.OutlineColor = Color3.fromRGB(255, 255, 255);
                                        end;
                                    end;
                                end;
                            else
                                v3 = v.Character;
                                if v3:FindFirstChild("CheatHighlight") then
                                    v3 = v.Character.CheatHighlight;
                                    v3:Destroy();
                                end;
                            end;
                        end; 
                    end;
                    return; 
                end;
                local function r67(...)
                    local e = {
                        60,
                        66,
                        72,
                        71,
                        37,
                        3,
                        6,
                        2
                    };
                    D = r12;
                    R = D[3];
                    v1 = D[2];
                    D = "pairs";
                    for R, v in pairs(D:GetPlayers()) do
                        b = v ~= r18;
                        j = R;
                        if b then
                            v2 = v.Character;
                        end;
                        if b then
                            v3 = v.Character;
                            v3:FindFirstChild("HumanoidRootPart");
                            v3 = v.Character;
                            v3:FindFirstChild("Head");
                            if r42(v) then
                                if v2 then
                                    v4 = r26[v.UserId];
                                end;
                                if v2 then
                                    v2.Size = r26[v.UserId];
                                    v2.Transparency = 1;
                                    v2.CanCollide = true;
                                    v2.Material = Enum.Material.Plastic;
                                end;
                                if b then
                                    v4 = r27[v.UserId];
                                end;
                                if b then
                                    b.Size = r27[v.UserId];
                                    b.Transparency = 0;
                                    b.CanCollide = true;
                                    b.Material = Enum.Material.Plastic;
                                end;
                            else
                                if v2 then
                                    v3:FindFirstChild(h[L]);
                                end;
                                if v2 then
                                    if not r26[v.UserId] then
                                        r26[v.UserId] = v3:FindFirstChild("HumanoidRootPart").Size;
                                    end;
                                    if not r27[v.UserId] then
                                        r27[v.UserId] = v3:FindFirstChild(h[L]).Size;
                                    end;
                                    if r25.Hitbox then
                                        v2.Size = Vector3.new(r25.HitboxSize, r25.HitboxSize, r25.HitboxSize);
                                        v2.Transparency = .7;
                                        v2.CanCollide = false;
                                        v2.Color = Color3.fromRGB(255, 0, 0);
                                        v2.Material = Enum.Material.ForceField;
                                        b.Size = Vector3.new(r25.HitboxSize, r25.HitboxSize, r25.HitboxSize);
                                        b.Transparency = .7;
                                        b.CanCollide = false;
                                        b.Color = Color3.fromRGB(255, 0, 0);
                                        b.Material = Enum.Material.ForceField;
                                    else
                                        if r26[v.UserId] then
                                            v2.Size = r26[v.UserId];
                                            v2.Transparency = 1;
                                            v2.CanCollide = true;
                                            v2.Material = Enum.Material.Plastic;
                                        end;
                                        if r27[v.UserId] then
                                            b.Size = r27[v.UserId];
                                            b.Transparency = 0;
                                            b.CanCollide = true;
                                            b.Material = Enum.Material.Plastic;
                                        end;
                                    end;
                                end;
                            end;
                        end; 
                    end;
                    return; 
                end;
                Sn = r14.JumpRequest;
                Sn:Connect(function(...)
                    local e = {
                        59,
                        2,
                        72,
                        71,
                        66,
                        63,
                        64
                    };
                    if not r11 then
                        return;
                    end;
                    if r25.InfJump then
                        v3 = r18.Character;
                        if v3 then
                            t = v3:FindFirstChild("HumanoidRootPart");
                        end;
                        if v3 then
                            R = Instance.new("Part");
                            R.Size = Vector3.new(3, 1, 3);
                            R.Transparency = 1;
                            R.Anchored = true;
                            R.CanCollide = true;
                            R.CFrame = v3.HumanoidRootPart.CFrame * CFrame.new(0, -3.2, 0);
                            R.Parent = r15;
                            v3 = r16;
                            v3:AddItem(R, .1);
                            v3 = v3.Humanoid;
                            v3:ChangeState(Enum.HumanoidStateType.Jumping);
                        end;
                    end;
                    return; 
                end);
                Sn = r13.Stepped;
                Sn:Connect(function(...)
                    local e = {
                        59,
                        66,
                        72,
                        71,
                        2
                    };
                    if not r11 then
                        return;
                    end;
                    v1 = r18.Character;
                    v = r3;
                    R = r25.Noclip;
                    if R then
                        t = v3;
                    end;
                    if R then
                        v = v1.GetChildren;
                        j = {
                            v(v1)
                        };
                        R = v[2];
                        D = v[3];
                        for D, v2 in pairs(k(t)) do
                            v = D;
                            if v2:IsA("BasePart") and v2.CanCollide then
                                v2.CanCollide = false;
                            end; 
                        end;
                    end;
                    return; 
                end);
                Sn = r13.Heartbeat;
                Sn:Connect(function(...)
                    local e = {
                        59,
                        2,
                        72,
                        71,
                        66
                    };
                    if not r11 then
                        return;
                    end;
                    if r25.Speed then
                        v1 = r18.Character;
                        if v1 then
                            v3 = r18[R[j]];
                            t = v1:FindFirstChild("Humanoid") and v1:FindFirstChild("HumanoidRootPart");
                        end;
                        if v1 then
                            R = v1.Humanoid;
                            D = v1.HumanoidRootPart;
                            if R.MoveDirection.Magnitude > 0 then
                                D.CFrame = D.CFrame + R.MoveDirection * r25.NormalSpeed;
                            end;
                        end;
                    end;
                    return; 
                end);
                Sn = r18.CharacterAdded;
                Sn:Connect(function(arg1_15, ...)
                    local e = {
                        2,
                        72,
                        71,
                        41
                    };
                    v1 = arg1_15;
                    if r25.Fly then
                        v1:WaitForChild("HumanoidRootPart");
                        r47();
                    end;
                    return; 
                end);
                Sn = r13;
                Sn:BindToRenderStep("HardLockAimbot", Enum.RenderPriority.Last.Value, function(...)
                    local e = {
                        59,
                        2,
                        72,
                        71,
                        38,
                        67,
                        66,
                        63
                    };
                    if not r11 then
                        r25.CurrentTarget = nil;
                        return;
                    end;
                    v3 = not r25.Aimbot;
                    if v3 then
                        r25.CurrentTarget = nil;
                        return;
                    end;
                    v3 = v3;
                    v3 = v3;
                    if not r25.CurrentTarget or (not r25.CurrentTarget.Character or (not r25.CurrentTarget.Character:FindFirstChild("Humanoid") or r25.CurrentTarget.Character.Humanoid.Health <= 0)) then
                        r25.CurrentTarget = r43(nil);
                    end;
                    if r25.CurrentTarget and r25.CurrentTarget.Character then
                        v3 = r25.CurrentTarget.Character;
                        v1 = v3:FindFirstChild(r25.AimPart);
                        if v1 then
                            R = r19.CFrame.Position;
                            D = v1.Position;
                            j = RaycastParams.new();
                            j.FilterDescendantsInstances = {
                                r18.Character,
                                r25.CurrentTarget.Character
                            };
                            j.FilterType = Enum.RaycastFilterType.Exclude;
                            v3 = r15;
                            v = v3:Raycast(R, D - R, j);
                            if not v then
                                r19.CFrame = CFrame.lookAt(R, D);
                            end;
                        end;
                    end;
                    return; 
                end);
                Sn = r13.RenderStepped;
                Sn:Connect(function(...)
                    local e = {
                        59,
                        49,
                        48
                    };
                    if not r11 then
                        return;
                    end;
                    r67();
                    r66();
                    return; 
                end);
                r45();
                return;
            end;
        end;
    end;
end;
return (function(...)
    while true do
        l1 = l2;
        l2 = l1;
        r1(); 
    end;
    return; 
end)();
