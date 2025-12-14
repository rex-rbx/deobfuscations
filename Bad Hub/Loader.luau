local PlaceId = game.PlaceId
local ScriptUrls = {
    [73197780555018] = "https://badhubz.pages.dev/script/main/Jump/script.lua",
    [17321628486] = "https://badhubz.pages.dev/script/main/No Jump/script.lua",
    universal = "https://badhubz.pages.dev/script/main/universal/script.lua",
    [95525734724032] = "https://badhubz.pages.dev/script/main/Age/script.lua"
}
print("================================")
print("Bad Hub Loader")
print("================================")
local ExecutorName = (identifyexecutor or getexecutorname or getexecutor or function() return "Unknown" end)()
print("[EXECUTOR] Detected: " .. ExecutorName)
local CapabilityResults = (function()
    local FunctionChecks = {
        loadstring = type(loadstring) == "function",
        game_HttpGet = type(game.HttpGet) == "function",
        task_spawn = type(task) == "table" and type(task.spawn) == "function",
        task_wait = type(task) == "table" and type(task.wait) == "function",
        pcall = type(pcall) == "function"
    }
    local CapabilityChecks = {
        required = FunctionChecks,
        optional = {
            getexecutor = type(getexecutor) == "function",
            isfolder = type(isfolder) == "function",
            readfile = type(readfile) == "function"
        }
    }
    local LoadCapability = FunctionChecks.loadstring and (FunctionChecks.game_HttpGet and FunctionChecks.task_spawn)
    if LoadCapability then
        LoadCapability = FunctionChecks.pcall
    end
    CapabilityChecks.allRequired = LoadCapability
    return CapabilityChecks
end)()
print("[CAPABILITIES] Checking executor functions...")
print("  - loadstring: " .. tostring(CapabilityResults.required.loadstring))
print("  - game:HttpGet: " .. tostring(CapabilityResults.required.game_HttpGet))
print("  - task.spawn: " .. tostring(CapabilityResults.required.task_spawn))
print("  - pcall: " .. tostring(CapabilityResults.required.pcall))
if CapabilityResults.allRequired then
    print("[SUCCESS] Executor has all required capabilities!")
    print("[GAME] Place ID: " .. PlaceId)
    if ScriptUrls[PlaceId] then
        local SelectedScriptUrl = ScriptUrls[PlaceId]
        print("[GAME] Found script for Place ID: " .. PlaceId)
        print("[LOADER] Attempting to load script...")
        local LoadError, LoadResult = pcall(function()
            loadstring(game:HttpGet(SelectedScriptUrl))()
        end)
        if LoadError then
            print("[SUCCESS] Script loaded successfully!")
            print("================================")
        else
            print("[ERROR] Failed to load script: " .. tostring(LoadResult))
            print("================================")
        end
    else
        print("[WARNING] No specific script for Place ID: " .. PlaceId)
        print("[LOADER] Loading universal script instead...")
        local UniversalScriptUrl = ScriptUrls.universal
        local UniversalLoadError, UniversalLoadResult = pcall(function()
            loadstring(game:HttpGet(UniversalScriptUrl))()
        end)
        if UniversalLoadError then
            print("[SUCCESS] Universal script loaded successfully!")
            print("================================")
        else
            print("[ERROR] Failed to load universal script: " .. tostring(UniversalLoadResult))
            print("================================")
        end
    end
else
    print("[ERROR] Executor missing required functions!")
    print("[ERROR] This script requires: loadstring, game:HttpGet, task.spawn, and pcall")
end
