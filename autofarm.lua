--
-- Protected with Roblox Script Obfuscator
-- Generated: 2026-11-19
-- This script has been obfuscated for distribution.
--

local _dxmrtTable = {["A"] = 0, ["B"] = 1, ["C"] = 2, ["D"] = 3, ["E"] = 4, ["F"] = 5, ["G"] = 6, ["H"] = 7, ["I"] = 8, ["J"] = 9, ["K"] = 10, ["L"] = 11, ["M"] = 12, ["N"] = 13, ["O"] = 14, ["P"] = 15, ["Q"] = 16, ["R"] = 17, ["S"] = 18, ["T"] = 19, ["U"] = 20, ["V"] = 21, ["W"] = 22, ["X"] = 23, ["Y"] = 24, ["Z"] = 25, ["a"] = 26, ["b"] = 27, ["c"] = 28, ["d"] = 29, ["e"] = 30, ["f"] = 31, ["g"] = 32, ["h"] = 33, ["i"] = 34, ["j"] = 35, ["k"] = 36, ["l"] = 37, ["m"] = 38, ["n"] = 39, ["o"] = 40, ["p"] = 41, ["q"] = 42, ["r"] = 43, ["s"] = 44, ["t"] = 45, ["u"] = 46, ["v"] = 47, ["w"] = 48, ["x"] = 49, ["y"] = 50, ["z"] = 51, ["0"] = 52, ["1"] = 53, ["2"] = 54, ["3"] = 55, ["4"] = 56, ["5"] = 57, ["6"] = 58, ["7"] = 59, ["8"] = 60, ["9"] = 61, ["+"] = 62, ["/"] = 63}
local function _dxmrt(s)
    local bytes = {}
    local buffer, bits = 0, 0
    for i = 1, #s do
        local ch = s:sub(i, i)
        if ch == "=" then break end
        local val = _dxmrtTable[ch]
        if val ~= nil then
            buffer = bit32.bor(bit32.lshift(buffer, 6), val)
            bits = bits + 6
            if bits >= 8 then
                bits = bits - 8
                bytes[#bytes + 1] = bit32.band(bit32.rshift(buffer, bits), 0xFF)
            end
        end
    end
    local key = "sxajsrlclmog"
    local out = {}
    for i = 1, #bytes do
        local k = key:byte(((i - 1) % #key) + 1)
        out[i] = string.char(bit32.bxor(bytes[i], k))
    end
    return table.concat(out)
end

local Players = game:GetService(_dxmrt("IxQAExYAHw=="))
local player = Players.LocalPlayer


local PICKUP_POS = Vector3.new(-23.03, 4.05, -455.71)
local SELL_POS = Vector3.new(48.94, 3.40, -471.67)


local WAIT_AFTER_TP = 0.15
local WAIT_AFTER_PICKUP = 0.25
local WAIT_AFTER_SELL = 0.3
local PROMPT_TIMEOUT = (3 - 1)
local running = false


local oldGui = player.PlayerGui:FindFirstChild(_dxmrt("MAoAHhYzGRcDCw4VHj8UAw=="))
if oldGui then
    oldGui:Destroy()
end


local gui = Instance.new(_dxmrt("IBsTDxYcKxYF"))
gui.Name = _dxmrt("MAoAHhYzGRcDCw4VHj8UAw==")
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local button = Instance.new(_dxmrt("Jx0ZHjEHGBcDAw=="))
button.Size = UDim2.new(0, (273 - 83), 0, (50 - 5))
button.Position = UDim2.new(0, (13 - 3), 0, (316 - 116))
button.BackgroundColor3 = Color3.fromRGB((73 - 28), (222 - 82), (109 - 34))
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = (29 - 14)
button.Font = Enum.Font.GothamBold
button.Text = _dxmrt("ke7XSqPTveG83b7novpBusOi3rLuvdG296jRu/Oi0LPc")
button.Parent = gui

Instance.new(_dxmrt("JjEiBQEcCRE="), button).CornerRadius = UDim.new(0, (14 - 6))


local function getHRP()
    local _v1 = player.Character or player.CharacterAdded:Wait()
    return _v1:WaitForChild(_dxmrt("Ow0MCx0dBQc+AgATIxkTHg=="))
end


local function teleport(_v2)
    local _v3 = getHRP()
    _v3.CFrame = CFrame.new(_v2 + Vector3.new(0, (3 - 1), 0))
    task.wait(WAIT_AFTER_TP)
end


local function findPrompt(_v4)
    local _v5 = nil
    local _v6 = math.huge

    for _, _v7 in ipairs(workspace:GetDescendants()) do
        if _v7:IsA(_dxmrt("IwoOEhofBRcVPR0IHggV")) and _v7.Enabled then
            local _v8 = _v7.Parent
            local _v9 = _v8:IsA(_dxmrt("MgwVCxAaAQYCGQ==")) and _v8.Parent or _v8

            if _v9 and _v9:IsA(_dxmrt("MRkSDyMTHhc=")) then
                local _va = (_v9.Position - _v4).Magnitude

                if _va < _v6 then
                    _v6 = _va
                    _v5 = _v7
                end
            end
        end
    end

    return _v5
end


local function activatePrompt(_vb)
    local _vc = os.clock()

    while running and os.clock() - _vc < PROMPT_TIMEOUT do
        local _vd = findPrompt(_vb)

        if _vd then
            if typeof(fireproximityprompt) == _dxmrt("FQ0PCQcbAw0=") then
                fireproximityprompt(_vd)
                task.wait(0.15)
                return true
            else
                warn(_dxmrt("FRETDwMAAxsFAAYTCggTBR4CGEO80L/SU6jeus2i2LPYvdq286jXusui3rPcvdq28angu/w="))
                return false
            end
        end

        task.wait(0.1)
    end

    warn(_dxmrt("IwoOEhofBRcVPR0IHggVSqPPvNZMvdK3w6jYusei2bPRV08=") .. tostring(_vb))
    return false
end


button.MouseButton1Click:Connect(function()
    running = not running

    if running then
        button.Text = _dxmrt("kffYSqPTveG807/YU6jRusGj7rPSvOu3w6nhus+i3A==")
        button.BackgroundColor3 = Color3.fromRGB((277 - 97), (72 - 17), (57 - 2))
    else
        button.Text = _dxmrt("ke7XSqPTveG83b7novpBusOi3rLuvdG296jRu/Oi0LPc")
        button.BackgroundColor3 = Color3.fromRGB((84 - 39), (264 - 124), (114 - 39))
    end
end)


task.spawn(function()
    while true do
        if running then
            
            teleport(PICKUP_POS)

            if not running then continue end

            local _ve = activatePrompt(PICKUP_POS)

            if _ve and running then
                task.wait(WAIT_AFTER_PICKUP)

                
                teleport(SELL_POS)

                if not running then continue end

                local _vf = activatePrompt(SELL_POS)

                if _vf then
                    task.wait(WAIT_AFTER_SELL)
                end
            end

            task.wait(0.1)
        else
            task.wait(0.2)
        end
    end
end)
