-- =======================================================
-- 1. PLATOBOOST YIĞIN KODU (EN ÜSTE YAPIŞTIR)
-- =======================================================
-- Platoboost'tan aldığın tüm Boost.lua kodunu buraya yapıştır:

-- -------------------------------------------------------------------------------
--! json library
--! cryptography library
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost library

--! configuration
local service = 31379;  -- your service id, this is used to identify your service.
local secret = "53bb7729-abe3-4bec-8436-458cefed648d";  -- make sure to obfuscate this if you want to ensure security.
local useNonce = true;  -- use a nonce to prevent replay attacks and request tampering.

--! callbacks
local onMessage = function(message) end;

--! wait for game to load
repeat task.wait(1) until game:IsLoaded();

--! functions
local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

--! pick host
local host = "https://api.platoboost.com";
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
});
if hostResponse.StatusCode ~= 200 or hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

--!optimize 2
function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({
                service = service,
                identifier = lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end

cacheLink();

--!optimize 2
local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

--!optimize 1
for _ = 1, 5 do
    local oNonce = generateNonce();
    task.wait(0.2)
    if generateNonce() == oNonce then
        local msg = "platoboost nonce error.";
        onMessage(msg);
        error(msg);
    end
end

--!optimize 2
local copyLink = function()
    local success, link = cacheLink();
    
    if success then
        fSetClipboard(link);
    end
end

--!optimize 2
local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end

--!optimize 2
local verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "KEY_" then
                    return redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end

--!optimize 2
local getFlag = function(name)
    local nonce = generateNonce();
    local endpoint = host .. "/public/flag/" .. fToString(service) .. "?name=" .. name;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if useNonce then
                if decoded.data.hash == lDigest(fToString(decoded.data.value) .. "-" .. nonce .. "-" .. secret) then
                    return decoded.data.value;
                else
                    onMessage("failed to verify integrity.");
                    return nil;
                end
            else
                return decoded.data.value;
            end
        else
            onMessage(decoded.message);
            return nil;
        end
    else
        return nil;
    end
end
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost usage documentation
-- copyLink() -> string
-- verifyKey(key: string) -> boolean
-- getFlag(name: string) -> boolean, string | boolean | number

-- use copyLink() to copy a link to the clipboard, in which the user will paste it into their browser and complete the keysystem.
-- use verifyKey(key) to verify a key, this will return a boolean value, true means the key was valid, false means it is invalid.
-- use getFlag(name) to get a flag from the server, this will return nil if an error occurs, if no error occurs, the value configured in the platoboost dashboard will be returned.

-- IMPORTANT: onMessage is a callback, it will be called upon status update, use it to provide information to user.
-- EXAMPLE: 
--[[
onMessage = function(message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Platoboost status",
        Text = message
    })
end
]]--

-- NOTE: PLACE THIS ENTIRE SCRIPT AT THE TOP OF YOUR SCRIPT, ADD THE LOGIC, THEN OBFUSCATE YOUR SCRIPT.

--! example usage
--[[
copyButton.MouseButton1Click:Connect(function()
    copyLink();
end)

verifyButton.MouseButton1Click:Connect(function()
    local key = keyBox.Text;
    local success = verifyKey(key);

    if success then
        print("key is valid.");
    else
        print("key is invalid.");
    end
end)

local flag = getFlag("example_flag");
if flag ~= nil then
    print("flag value: " .. flag);
else
    print("failed to get flag.");
end
]]--
-------------------------------------------------------------------------------

-- Global değişkene sabitliyoruz
_G.PlatoboostAPI = Platoboost or Boost or _G.Platoboost


-- [[ HYPER|HUB - 3D MASCOT INTRO (CLEANED & READY FOR HYPER|FPS) ]]
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

_G.HyperExecuteCount = _G.HyperExecuteCount or 0
_G.HyperInCooldown = _G.HyperInCooldown or false
_G.HyperPause = _G.HyperPause or false

-- SPAM / CEZA KONTROLÜ
if _G.HyperPetActive then
    if _G.HyperInCooldown then return end
    
    _G.HyperExecuteCount = _G.HyperExecuteCount + 1
    _G.HyperInCooldown = true
    _G.HyperPause = true

    task.spawn(function()
        if _G.HyperExecuteCount == 1 then
            if _G.HyperPetHead then Chat:Chat(_G.HyperPetHead, "Hey! I'm here no need to try again!", Enum.ChatColor.White) end
            if _G.TriggerBounceFunc then _G.TriggerBounceFunc() end
            task.wait(1.2)
        elseif _G.HyperExecuteCount == 2 then
            if _G.HyperPetHead then Chat:Chat(_G.HyperPetHead, "Didn't i said im here? No need to execute again!", Enum.ChatColor.White) end
            if _G.TriggerBounceFunc then _G.TriggerBounceFunc() end
            task.wait(1.2)
        elseif _G.HyperExecuteCount == 3 then
            if _G.HyperPetHead then Chat:Chat(_G.HyperPetHead, "do you even hear me?!", Enum.ChatColor.Red) end
            if _G.SetRedHornsFunc then _G.SetRedHornsFunc() end
            if _G.SetBloodEyesFunc then _G.SetBloodEyesFunc() end
            if _G.TriggerBounceFunc then _G.TriggerBounceFunc() end
            task.wait(1.2)
        elseif _G.HyperExecuteCount >= 4 then
            if _G.SetRedHornsFunc then _G.SetRedHornsFunc() end
            if _G.SetBloodEyesFunc then _G.SetBloodEyesFunc() end
            
            if _G.HyperPetHead then Chat:Chat(_G.HyperPetHead, "it was your last chance...", Enum.ChatColor.Red) end
            if _G.TriggerBounceFunc then _G.TriggerBounceFunc() end
            task.wait(1.5)

            pcall(function()
                Lighting.Ambient = Color3.fromRGB(200, 0, 0)
                Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
                Lighting.FogColor = Color3.fromRGB(15, 0, 0)
                Lighting.FogEnd = 60
                Lighting.FogStart = 0
                
                local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
                sky.SkyboxBk = "rbxassetid://2634494"
                sky.SkyboxDn = "rbxassetid://2634494"
                sky.SkyboxFt = "rbxassetid://2634494"
                sky.SkyboxLf = "rbxassetid://2634494"
                sky.SkyboxRt = "rbxassetid://2634494"
                sky.SkyboxUp = "rbxassetid://2634494"
            end)

            local staticSound = Instance.new("Sound")
            staticSound.SoundId = "rbxassetid://9114223178"
            staticSound.Volume = 4
            staticSound.Looped = true
            staticSound.Parent = SoundService
            staticSound:Play()

            local pGui = localPlayer:WaitForChild("PlayerGui")
            local punishGui = Instance.new("ScreenGui")
            punishGui.Name = "HyperPunishGui"
            punishGui.ResetOnSpawn = false
            punishGui.Parent = pGui

            local redOverlay = Instance.new("Frame")
            redOverlay.Size = UDim2.new(1, 0, 1, 0)
            redOverlay.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            redOverlay.BackgroundTransparency = 0.55
            redOverlay.Parent = punishGui

            local words = {"RUN", "HIDE", "ITS COMING", "PUNISHMENT", "IT'S TOO LATE"}
            local isPunishing = true

            task.spawn(function()
                while isPunishing do
                    local oof = Instance.new("Sound")
                    oof.SoundId = "rbxassetid://5143383166"
                    oof.Volume = 10
                    oof.Parent = SoundService
                    oof:Play()
                    game:GetService("Debris"):AddItem(oof, 1.5)
                    task.wait(0.09)
                end
            end)

            task.spawn(function()
                while isPunishing do
                    local txtLbl = Instance.new("TextLabel")
                    txtLbl.Size = UDim2.new(0, 250, 0, 60)
                    txtLbl.Position = UDim2.new(math.random(5, 75)/100, 0, math.random(5, 75)/100, 0)
                    txtLbl.BackgroundTransparency = 1
                    txtLbl.Font = Enum.Font.GothamBlack
                    txtLbl.Text = words[math.random(1, #words)]
                    txtLbl.TextColor3 = Color3.fromRGB(255, 0, 0)
                    txtLbl.TextSize = math.random(32, 55)
                    txtLbl.Parent = punishGui

                    local stroke = Instance.new("UIStroke", txtLbl)
                    stroke.Color = Color3.fromRGB(0, 0, 0)
                    stroke.Thickness = 3

                    task.spawn(function()
                        for i = 1, 10 do
                            txtLbl.Position = txtLbl.Position + UDim2.new(0, math.random(-10, 10), 0, math.random(-10, 10))
                            task.wait(0.03)
                        end
                        txtLbl:Destroy()
                    end)
                    task.wait(0.08)
                end
            end)

            task.wait(15)
            isPunishing = false
            localPlayer:Kick("YOU ARE PUNISHED")
        end
        
        _G.HyperInCooldown = false
        _G.HyperPause = false
    end)
    return
end

_G.HyperPetActive = true

-- MASKOT OLUŞTURMA
local petModel = Instance.new("Model")
petModel.Name = "HyperPet"
_G.HyperPetModel = petModel

local head = Instance.new("Part")
head.Name = "Head"
head.Shape = Enum.PartType.Ball
head.Size = Vector3.new(2.4, 2.4, 2.4)
head.Color = Color3.fromRGB(30, 30, 38)
head.Material = Enum.Material.Sand
head.CanCollide = false
head.Anchored = true
head.Parent = petModel
petModel.PrimaryPart = head

_G.HyperPetHead = head

local function createHornPart(size, color, mat)
    local p = Instance.new("WedgePart")
    p.Size = size
    p.Color = color
    p.Material = mat
    p.CanCollide = false
    p.Anchored = true
    p.Parent = petModel
    return p
end

local hBaseL = createHornPart(Vector3.new(0.3, 0.9, 0.6), Color3.fromRGB(0, 162, 255), Enum.Material.Glass)
local hTipL = createHornPart(Vector3.new(0.2, 0.7, 0.4), Color3.fromRGB(0, 215, 255), Enum.Material.Neon)
local hBaseR = createHornPart(Vector3.new(0.3, 0.9, 0.6), Color3.fromRGB(0, 162, 255), Enum.Material.Glass)
local hTipR = createHornPart(Vector3.new(0.2, 0.7, 0.4), Color3.fromRGB(0, 215, 255), Enum.Material.Neon)

_G.SetRedHornsFunc = function()
    hBaseL.Color = Color3.fromRGB(255, 0, 0)
    hTipL.Color = Color3.fromRGB(255, 50, 50)
    hBaseR.Color = Color3.fromRGB(255, 0, 0)
    hTipR.Color = Color3.fromRGB(255, 50, 50)
end

local eyeGUI = Instance.new("SurfaceGui")
eyeGUI.Face = Enum.NormalId.Front
eyeGUI.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
eyeGUI.PixelsPerStud = 50
eyeGUI.Parent = head

local eyeFrame = Instance.new("Frame")
eyeFrame.Size = UDim2.new(1, 0, 1, 0)
eyeFrame.BackgroundTransparency = 1
eyeFrame.Parent = eyeGUI

local eyeL, eyeR
local function createBigHappyEye(isLeft)
    local eye = Instance.new("Frame")
    eye.Size = UDim2.new(0, 34, 0, 20)
    eye.Position = isLeft and UDim2.new(0.18, 0, 0.35, 0) or UDim2.new(0.62, 0, 0.35, 0)
    eye.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    eye.BorderSizePixel = 0
    eye.Parent = eyeFrame
    Instance.new("UICorner", eye).CornerRadius = UDim.new(0.8, 0)
    return eye
end

eyeL = createBigHappyEye(true)
eyeR = createBigHappyEye(false)

_G.SetBloodEyesFunc = function()
    if eyeL and eyeR then
        eyeL.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        eyeR.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

local function updatePetCFrame(cf)
    head.CFrame = cf
    hBaseL.CFrame = cf * CFrame.new(-0.75, 0.95, 0.25) * CFrame.Angles(math.rad(-40), math.rad(-5), math.rad(-12))
    hTipL.CFrame = hBaseL.CFrame * CFrame.new(0, 0.6, 0.2) * CFrame.Angles(math.rad(-25), 0, 0)
    hBaseR.CFrame = cf * CFrame.new(0.75, 0.95, 0.25) * CFrame.Angles(math.rad(-40), math.rad(5), math.rad(12))
    hTipR.CFrame = hBaseR.CFrame * CFrame.new(0, 0.6, 0.2) * CFrame.Angles(math.rad(-25), 0, 0)
end

petModel.Parent = workspace

-- TAKİP SİSTEMİ
local isFollowing = true
local currentPetPos = hrp.Position + (hrp.CFrame.LookVector * 4.5) + Vector3.new(0, 1.2, 0)
local bounceOffsetY = 0

local followConn
followConn = RunService.RenderStepped:Connect(function()
    if not isFollowing or not hrp or not hrp.Parent then return end
    local targetPos = hrp.Position + (hrp.CFrame.LookVector * 4.5) + Vector3.new(0, 1.2, 0)
    currentPetPos = currentPetPos:Lerp(targetPos, 0.1)
    local lookCF = CFrame.new(currentPetPos + Vector3.new(0, bounceOffsetY, 0), hrp.Position)
    updatePetCFrame(lookCF)
end)

local function triggerSmoothBounce()
    task.spawn(function()
        task.wait(0.2)
        local startTime = os.clock()
        while os.clock() - startTime < 1.5 do
            local elapsed = os.clock() - startTime
            bounceOffsetY = math.abs(math.sin(elapsed * 7)) * 0.65
            task.wait(0.015)
        end
        local tweenVal = Instance.new("NumberValue")
        tweenVal.Value = bounceOffsetY
        tweenVal.Changed:Connect(function(val) bounceOffsetY = val end)
        local tw = TweenService:Create(tweenVal, TweenInfo.new(0.3), {Value = 0})
        tw:Play()
        tw.Completed:Wait()
        tweenVal:Destroy()
    end)
end

_G.TriggerBounceFunc = triggerSmoothBounce

local function waitUnpaused(duration)
    local timer = 0
    while timer < duration do
        if not _G.HyperPause then
            timer = timer + 0.1
        end
        task.wait(0.1)
    end
end

-- [[ SİNEMATİK AKIŞ ]] --
task.spawn(function()
    waitUnpaused(0.5)

    while _G.HyperPause do task.wait(0.1) end
    pcall(function() Chat:Chat(head, "hi, thank you for trying Hyper|FPS", Enum.ChatColor.White) end)
    triggerSmoothBounce()
    waitUnpaused(2.2)

    while _G.HyperPause do task.wait(0.1) end
    pcall(function() Chat:Chat(head, "i will need you to click anywhere on your screen now", Enum.ChatColor.White) end)
    triggerSmoothBounce()
    waitUnpaused(1.2)

    while _G.HyperPause do task.wait(0.1) end

    -- [[ DOKUNMA EKRANI ]] --
    local pGui = localPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HyperDynamicGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = pGui

    local overlay = Instance.new("TextButton")
    overlay.Size = UDim2.new(2, 0, 2, 0)
    overlay.Position = UDim2.new(-0.5, 0, -0.5, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.Text = ""
    overlay.Parent = screenGui

    local clickText = Instance.new("TextLabel")
    clickText.Size = UDim2.new(0.6, 0, 0, 50)
    clickText.Position = UDim2.new(0.2, 0, 0.65, 0)
    clickText.BackgroundTransparency = 1
    clickText.Font = Enum.Font.GothamBold
    clickText.Text = "click anywhere on your screen"
    clickText.TextColor3 = Color3.fromRGB(255, 255, 255)
    clickText.TextSize = 18
    clickText.TextTransparency = 1
    clickText.Parent = overlay

    TweenService:Create(overlay, TweenInfo.new(0.6), {BackgroundTransparency = 0.5}):Play()
    TweenService:Create(clickText, TweenInfo.new(0.6), {TextTransparency = 0}):Play()

    local canClick = true
    local pressStartTime = 0
    local startPressPos = Vector2.new()

    overlay.InputBegan:Connect(function(input)
        if not canClick then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            pressStartTime = os.clock()
            startPressPos = Vector2.new(input.Position.X, input.Position.Y)
        end
    end)

    overlay.Activated:Connect(function(inputObject)
        if not canClick then return end
        
        local pressDuration = os.clock() - pressStartTime
        local currentClickPos = inputObject and inputObject.Position or UserInputService:GetMouseLocation()
        local dragDistance = (Vector2.new(currentClickPos.X, currentClickPos.Y) - startPressPos).Magnitude

        if pressStartTime > 0 and (pressDuration > 0.4 or dragDistance > 30) then
            pressStartTime = 0
            return
        end

        canClick = false
        overlay:Destroy()

        -- [[ PLATOBOOST KONTROLÜ (AĞA ARTIK AYNI DOSYADA OLDUĞU İÇİN ANINDA BULUR) ]] --
        local api = _G.PlatoboostAPI or Platoboost or Boost

        -- 1. SENARYO: PLATOBOOST SİLİNMİŞ (BYPASS DENEMESİ)
        if not api then
            pcall(function() Chat:Chat(head, "hi, you tought that would work huh?", Enum.ChatColor.White) end)
            triggerSmoothBounce()
            waitUnpaused(1.3)

            pcall(function() Chat:Chat(head, "just get the key it takes like 2 minutes ._.", Enum.ChatColor.White) end)
            triggerSmoothBounce()
            waitUnpaused(2.5)

            -- Maskot kendini yok eder, Main.lua (21) kilitli kalır ve Hyper FPS AÇILMAZ!
            isFollowing = false
            if followConn then followConn:Disconnect() end
            for _, p in ipairs(petModel:GetDescendants()) do
                if p:IsA("BasePart") then TweenService:Create(p, TweenInfo.new(0.5), {Transparency = 1}):Play() end
            end
            task.wait(0.5)
            petModel:Destroy()
            return
        end

        -- 2. SENARYO: PLATOBOOST MEVCUT
        pcall(function() Chat:Chat(head, "it looks like hyper|fps requires key now", Enum.ChatColor.White) end)
        triggerSmoothBounce()
        waitUnpaused(1.3)

        pcall(function() Chat:Chat(head, "it only takes 2 minutes to get the key so it shoudl worth trying right? :D", Enum.ChatColor.White) end)
        triggerSmoothBounce()
        waitUnpaused(1.2)

        -- PLATOBOOST KEY MENÜSÜ/KONTROLÜ TETİKLENİR
        local isVerified = false
        pcall(function()
            if api.verify then
                isVerified = api:verify()
            elseif api.get_key then
                isVerified = api:get_key()
            end
        end)

        -- KEY BAŞARILIYSA HYPER FPS SİNYALİ VERİLİR
        if isVerified then
            _G.HyperMainStart = true
        end

        -- MASKOT YOK OLUR
        isFollowing = false
        if followConn then followConn:Disconnect() end
        for _, p in ipairs(petModel:GetDescendants()) do
            if p:IsA("BasePart") then TweenService:Create(p, TweenInfo.new(0.5), {Transparency = 1}):Play() end
        end
        task.wait(0.5)
        petModel:Destroy()
    end)
end)
