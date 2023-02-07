-- // For learning purposes. GitHub: PewCracks
local Key = ("a"):rep(32);

local Folder = "ExtremeHUB"
local File = Folder .. "/Key.txt";
if not isfolder(Folder) then makefolder(Folder)end;
if not isfile(File) then writefile(File, Key)end;

local Get, index = game["HttpGet"];
local Http = newcclosure(function(self, Url)
    if tostring(Url) == "https://extremehub.xyz/check/" .. Key then 
        return tostring(Key);
    else
        return Get(self, Url)
    end;
end)

index = hookmetamethod(game, "__index", function(self, Key)
    if checkcaller() then
        if self == game and Key == "HttpGet" then
            return Http;
        end;
    end;
    return index(self, Key)
end)
wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/KeySystemUI-Obfuscated.lua"))()
