
local Toggled = true
local KeyCode = Enum.KeyCode.Z
local hip = 2.80
local val = -35

local function adjustVelocity()
    local player = game.Players.LocalPlayer
    local rootPart = player.Character.HumanoidRootPart
    local oldVelocity = rootPart.Velocity
    rootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
    player.Character.Humanoid.HipHeight = hip
end

local function onInputBegan(input)
    if input.KeyCode == KeyCode and not game:GetService('UserInputService'):GetFocusedTextBox() then
        Toggled = not Toggled
        if Toggled then
            while Toggled do
                adjustVelocity()
                task.wait()
            end
        else
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
        end
    end
end

game:GetService('UserInputService').InputBegan:Connect(onInputBegan)
