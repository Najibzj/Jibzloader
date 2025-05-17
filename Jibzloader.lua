
local validKey = "123456"  -- Key yang bisa divalidasi lebih lanjut (misal: key per device)
local userId = tostring(game.Players.LocalPlayer.UserId)  -- Mengambil User ID untuk membuat key unik
local hash = game:GetService("Hashing"):MD5(userId)  -- Menggunakan hashing untuk menghasilkan key berbasis user

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
