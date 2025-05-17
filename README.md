HttpGet("https://raw.githubusercontent.com/PerdHub/Blosfruitscript/main/PerdLoader"))()

local validKey = "123456"  
local userId = tostring(game.Players.LocalPlayer.UserId)  
local hash = game:GetService("Hashing"):MD5(userId)  
local function verifyKey(inputKey)
    return inputKey == hash
end


local encryptedScript = "B1tRAn5foRmEdScR1pt==Encrypted" 


local function decryptAndRunScript(encrypted)
    if verifyKey(validKey) then
        local decryptedScript = game:GetService("HttpService"):JSONDecode(encrypted)  
        loadstring(decryptedScript)()  
    else
        print("Invalid key!")
    end
end


decryptAndRunScript(encryptedScript)