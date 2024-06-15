--  Constants  --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer

--  Functions  --
local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacterFindFirstChild(HumanoidRootPart)
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAddedWait())
   Player.CharacterAddedConnect(CharacterAdded)
   Services.RunService.HeartbeatConnect(function()
       if (Character and CharacterIsDescendantOf(workspace)) and (PrimaryPart and PrimaryPartIsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude  50 or PrimaryPart.AssemblyLinearVelocity.Magnitude  100 then
               if Detected == false then
                   game.StarterGuiSetCore(ChatMakeSystemMessage, {
                       Text = Fling Exploit detected, Player  .. tostring(Player);
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(CharacterGetDescendants()) do
                   if vIsA(BasePart) then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

--  Event Listeners  --
for i,v in ipairs(Services.PlayersGetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAddedConnect(PlayerAdded)

local LastPosition = nil
Services.RunService.HeartbeatConnect(function()
   pcall(function()
       local PrimaryPart = LocalPlayer.Character.PrimaryPart
       if PrimaryPart.AssemblyLinearVelocity.Magnitude  250 or PrimaryPart.AssemblyAngularVelocity.Magnitude  250 then
           PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.CFrame = LastPosition

           game.StarterGuiSetCore(ChatMakeSystemMessage, {
               Text = You were flung. Neutralizing velocity.;
               Color = Color3.fromRGB(255, 0, 0);
           })
       elseif PrimaryPart.AssemblyLinearVelocity.Magnitude  50 or PrimaryPart.AssemblyAngularVelocity.Magnitude  50 then
           LastPosition = PrimaryPart.CFrame
       end
   end)
end)
