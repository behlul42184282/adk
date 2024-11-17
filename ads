--does not use fuel! refueling usually creates a sizeable dent in your profits.

local boatType = "Alabama-class container ship"

local YourShitp = nil

local p = game:GetService("Players").LocalPlayer
local Character = p.Character
local UIS = game:GetService("UserInputService")
local CF = CFrame.new
local V3 = Vector3.new
for _,v in pairs(workspace:GetDescendants())do
   if v.Name == boatType and v:FindFirstChild("Regen") and v.Regen.Gunboat.VehicleSeat.ShipControl.OWNER.Value.Name == game:GetService("Players").LocalPlayer.Name then
       print("found boat")
       YourShitp = v
   end
end
local argsToStart = {
   [1] = "load",
   [2] = YourShitp,
   [3] = workspace.ContainerDock4
}
local argsToStop = {
   [1] = "sell",
   [2] = YourShitp,
   [3] = workspace.ContainerDock3
}

YourShitp.PrimaryPart = YourShitp.Regen.Gunboat.Base
local function MoveShitpTo(cfrm)
   YourShitp:SetPrimaryPartCFrame(CF(cfrm))
end
local function notify(texto)
   game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "DSS3 gaming autofarm",
Text = texto
})
end

UIS.InputBegan:Connect(function(key)
   if key.KeyCode == Enum.KeyCode.RightShift and YourShitp ~= nil then
       notify("began autofarming")
       while true do
       notify("cycle")
       MoveShitpTo(V3(-14376, 41, -43586))
       wait(5)
       workspace.HandleCargoEvent:FireServer(unpack(argsToStart))
       notify("picked up cargo")
       wait(300)
       MoveShitpTo(V3(-5978, 41, 26999))
       wait(5)
       workspace.HandleCargoEvent:FireServer(unpack(argsToStop))
       notify("sold cargo")
       wait(5)
       end
   end
end)
--workspace.Buildings["PuertoUshuaia"]:Destroy()

print("poopy")
