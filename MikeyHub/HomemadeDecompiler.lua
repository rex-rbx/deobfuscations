local vu1 = loadstring(game:HttpGet("https://github.com/jensonhirst/Orion/raw/refs/heads/main/source"))()
local v2 = vu1
local v3 = vu1.MakeWindow(v2, {
    Name = "Homemade Decompiler",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = ""
})
local vu4 = {
    CopyToClipboard = false
}
local function vu9(p5, p6, p7, p8)
    if not tostring(p8):match("^rbxassetid://") then
        p8 = "rbxassetid://" .. tostring(p8)
    end
    vu1:MakeNotification({
        Name = tostring(p5),
        Content = tostring(p6),
        Image = p8,
        Time = p7
    })
end
local function vu15(p10)
    local v11, v12 = loadstring("return " .. p10)
    if v11 then
        local v13, v14 = pcall(v11)
        if v13 then
            return v14
        else
            return nil, v14
        end
    else
        return nil, v12
    end
end
local function vu33(p16, p17)
    local vu18 = ""
    local function vu20(p19)
        vu18 = vu18 .. p19 .. "\n"
    end
    vu20("Script Decompiled")
    vu20(string.rep("_", 50))
    local function vu32(p21, p22)
        local v23, v24, v25 = pairs(p21)
        while true do
            local v26
            v25, v26 = v23(v24, v25)
            if v25 == nil then
                break
            end
            if type(v26) ~= "table" then
                if type(v26) ~= "function" then
                    vu20(p22 .. tostring(v25) .. " = " .. tostring(v26))
                else
                    vu20(p22 .. tostring(v25) .. " = function() ... end")
                    local v27, v28 = pcall(v26)
                    if v27 then
                        vu20(p22 .. "  [result] " .. tostring(v28))
                    else
                        vu20(p22 .. "  [error] Could not call function: " .. tostring(v28))
                    end
                    for v29 = 1, debug.getinfo(v26).nups do
                        local v30, v31 = debug.getupvalue(v26, v29)
                        vu20(p22 .. "  [upvalue] " .. tostring(v30) .. " = " .. tostring(v31))
                    end
                end
            else
                vu20(p22 .. tostring(v25) .. " = {")
                vu32(v26, p22 .. "  ")
                vu20(p22 .. "}")
            end
        end
    end
    vu32(p16, p17 or "")
    vu20(string.rep("_", 50))
    if vu4.CopyToClipboard then
        setclipboard(vu18)
    else
        print(vu18)
    end
end
local vu34 = nil
local v35 = v3:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
v35:AddSection({
    Name = "Main"
})
v35:AddTextbox({
    Name = "Script Path",
    Default = "",
    TextDisappear = false,
    Callback = function(p36)
        vu34 = tostring(p36)
    end
})
v35:AddButton({
    Name = "Decompile Script",
    Callback = function()
        local v37 = vu34
        local v38, v39 = vu15(v37)
        if v38 then
            if v38:IsA("ModuleScript") then
                local v40, v41 = pcall(vu15, v37)
                if v40 then
                    local v42 = require(v41)
                    local v43 = tick()
                    vu33(v42)
                    local v44 = tick()
                    vu9("Success!", "Successfully Decompiled Script, Check Console To View Info!\n \nScript Type : ModuleScript\n \nTime To Decompile : " .. tostring(v44 - v43), 20, "rbxassetid://1202200125")
                else
                    vu9("Error Decompiling Script.", "Error: " .. v41 .. "\nScript Type : ModuleScript")
                end
            elseif v38:IsA("LocalScript") then
                local v45, v46 = pcall(vu15, v37)
                if v45 then
                    vu9("Coming Soon!", "LocalScript Decompiler Will Be Added Next Update, Until Then, Enjoy Our Module Decompiler!")
                else
                    vu9("Error Decompiling Script.", "Error: " .. v46 .. "\nScript Type : LocalScript")
                end
            else
                vu9("Script Not Valid", "The Script Must Be A LocalScript Or A ModuleScript.")
            end
        else
            vu9("Script Not Found", "Script : \n" .. tostring(v37) .. "\n \nError: " .. (v39 or "Unknown error"), 20, "rbxassetid://1202200125")
        end
    end
})
v35:AddSection({
    Name = "Settings"
})
v35:AddToggle({
    Name = "Copy To Clipboard",
    Default = false,
    Callback = function(p47)
        vu4.CopyToClipboard = p47
    end
})
v35:AddSection({
    Name = "Info"
})
v35:AddParagraph("Q: How Can I Use This?", "To decompile the script you want, first locate its path. You can find it by using DarkDex, right-clicking on the script, and selecting \"Copy Script Path.\", Enter the copied path into the \"Script Path\" input, and then press \"Decompile.\"")
v35:AddParagraph("Q: What Does \"Copy To Clipboard\" Setting Do? ", "A: It copys the decompiled script to your clipboard, useful if you can\'t access the roblox developer console.")
v35:AddParagraph("Q: Do You Have A Api For This MASTERPIECE? ", "A: ATM no, I plan to add it if this project does well.")
local v48 = v3:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
v48:AddSection({
    Name = "Main"
})
v48:AddParagraph("Credits : ", "Made By The MikeyHub Team. (just jakefromjakesfarm)\nIf You Want To See My Work, Press \"Open MikeyHub\"")
v48:AddButton({
    Name = "Open MikeyHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptHub/MikeyHub-V2/main/Loader/Main"))()
    end
})
