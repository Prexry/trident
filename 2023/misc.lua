return {
    SoundService = game:GetService("SoundService"),
    sounds = {
        ["Default Headshot"] = "rbxassetid://9119561046",
        ["Default Body"] = "rbxassetid://9114487369",
        Neverlose = "rbxassetid://8726881116",
        Gamesense = "rbxassetid://4817809188",
        One = "rbxassetid://7380502345",
        Bell = "rbxassetid://6534947240",
        Rust = "rbxassetid://1255040462",
        TF2 = "rbxassetid://2868331684",
        Slime = "rbxassetid://6916371803",
        ["Among Us"] = "rbxassetid://5700183626",
        Minecraft = "rbxassetid://4018616850",
        ["CS:GO"] = "rbxassetid://6937353691",
        Saber = "rbxassetid://8415678813",
        Baimware = "rbxassetid://3124331820",
        Osu = "rbxassetid://7149255551",
        ["TF2 Critical"] = "rbxassetid://296102734",
        Bat = "rbxassetid://3333907347",
        ["Call of Duty"] = "rbxassetid://5952120301",
        Bubble = "rbxassetid://6534947588",
        Pick = "rbxassetid://1347140027",
        Pop = "rbxassetid://198598793",
        Bruh = "rbxassetid://4275842574",
        Bamboo = "rbxassetid://3769434519",
        Crowbar = "rbxassetid://546410481",
        Weeb = "rbxassetid://6442965016",
        Beep = "rbxassetid://8177256015",
        Bambi = "rbxassetid://8437203821",
        Stone = "rbxassetid://3581383408",
        ["Old Fatality"] = "rbxassetid://6607142036",
        Click = "rbxassetid://8053704437",
        Ding = "rbxassetid://7149516994",
        Snow = "rbxassetid://6455527632",
        Laser = "rbxassetid://7837461331",
        Mario = "rbxassetid://2815207981",
        Steve = "rbxassetid://4965083997",
    },
    currentSound = nil,
    ApplySound = function(self, assetId)
        if not self.SoundService:FindFirstChild("PlayerHitHeadshot") then return end
        local headshotSound = self.SoundService.PlayerHitHeadshot
        headshotSound.SoundId = assetId
        headshotSound.Volume = 5
        headshotSound.Pitch = 1
        local equalizer = headshotSound:FindFirstChildWhichIsA("EqualizerSoundEffect")
        if equalizer then equalizer.HighGain = -1.5 end
    end,
    ResetSound = function(self)
        if not self.SoundService:FindFirstChild("PlayerHitHeadshot") then return end
        local headshotSound = self.SoundService.PlayerHitHeadshot
        headshotSound.SoundId = "rbxassetid://9119561046"
        headshotSound.Volume = 1
        headshotSound.Pitch = 1
        local equalizer = headshotSound:FindFirstChildWhichIsA("EqualizerSoundEffect")
        if equalizer then equalizer.HighGain = 0 end
    end,
    Lighting = game:GetService("Lighting"),
    Sky = (function()
        local s = Instance.new("Sky")
        s.Name = "CustomSky"
        s.Parent = game:GetService("Lighting")
        return s
    end)(),
    SkyBoxes = {
        ["Standard"] = {
            SkyboxBk = nil, SkyboxDn = nil, SkyboxFt = nil,
            SkyboxLf = nil, SkyboxRt = nil, SkyboxUp = nil,
        },
        ["Among Us"] = {
            SkyboxBk = "rbxassetid://5752463190", SkyboxDn = "rbxassetid://5752463190",
            SkyboxFt = "rbxassetid://5752463190", SkyboxLf = "rbxassetid://5752463190",
            SkyboxRt = "rbxassetid://5752463190", SkyboxUp = "rbxassetid://5752463190"
        },
        ["Spongebob"] = {
            SkyboxBk = "rbxassetid://277099484", SkyboxDn = "rbxassetid://277099500",
            SkyboxFt = "rbxassetid://277099554", SkyboxLf = "rbxassetid://277099531",
            SkyboxRt = "rbxassetid://277099589", SkyboxUp = "rbxassetid://277101591"
        },
        ["Deep Space"] = {
            SkyboxBk = "rbxassetid://159248188", SkyboxDn = "rbxassetid://159248183",
            SkyboxFt = "rbxassetid://159248187", SkyboxLf = "rbxassetid://159248173",
            SkyboxRt = "rbxassetid://159248192", SkyboxUp = "rbxassetid://159248176"
        },
        ["Winter"] = {
            SkyboxBk = "rbxassetid://510645155", SkyboxDn = "rbxassetid://510645130",
            SkyboxFt = "rbxassetid://510645179", SkyboxLf = "rbxassetid://510645117",
            SkyboxRt = "rbxassetid://510645146", SkyboxUp = "rbxassetid://510645195"
        },
        ["Clouded Sky"] = {
            SkyboxBk = "rbxassetid://252760981", SkyboxDn = "rbxassetid://252763035",
            SkyboxFt = "rbxassetid://252761439", SkyboxLf = "rbxassetid://252760980",
            SkyboxRt = "rbxassetid://252760986", SkyboxUp = "rbxassetid://252762652"
        }
    },
    currentSky = nil,
    setSkybox = function(self, data)
        for face, id in pairs(data) do
            self.Sky[face] = id
        end
    end,
    AutoRunAndJumpCrouch = function(isAutoRunning, stopAutoRun)
        while isAutoRunning do
            if stopAutoRun then break end
            keypress(0x57)
            keypress(0x10)
            task.wait(0.05)
            keypress(0x43)
            keypress(0x20)
            keyrelease(0x20)
            task.wait(0.5)
            keyrelease(0x43)
            keyrelease(0x10)
            wait(1.2)
        end
    end,
    LootAll = function()
        for i = 1, 20 do
            game:GetService("Players").LocalPlayer.RemoteEvent:FireServer(12, i, true)
            wait(0.03)
        end
    end,
    DepositAll = function()
        for i = 1, 20 do
            game:GetService("Players").LocalPlayer.RemoteEvent:FireServer(12, i, false)
            wait(0.03)
        end
    end,
}
