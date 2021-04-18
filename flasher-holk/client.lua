ESX = nil
local rolling = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('flasher-holk:JointEffect')
AddEventHandler('flasher-holk:JointEffect', function()
    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
    
      RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK" ) 
      while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK" ) do
        Citizen.Wait(0)
      end    
      
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
      exports['progressBars']:startUI(30000, "Röker en fet.")
      Citizen.Wait(30000)
      ClearPedTasksImmediately(playerPed)
      SetTimecycleModifier("spectator6")
      SetPedMotionBlur(playerPed, true)
      SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@SLIGHTLYDRUNK" , true)
      SetPedIsDrunk(playerPed, true)
      AnimpostfxPlay("ChopVision", 10000001, true)
      ShakeGameplayCam("DRUNK_SHAKE", 1.0)
      
    SetEntityHealth(GetPlayerPed(-1), 200)
    --   SetPedArmour(PlayerPedId(), 50)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.5)

      Citizen.Wait(180000) -- time of effect

      SetPedMoveRateOverride(PlayerId(),1.0)
      SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
      SetPedIsDrunk(GetPlayerPed(-1), false)		
      SetPedMotionBlur(playerPed, false)
      ResetPedMovementClipset(GetPlayerPed(-1))
      AnimpostfxStopAll()
      ShakeGameplayCam("DRUNK_SHAKE", 0.0)
      SetTimecycleModifierStrength(0.0)
    

end)

RegisterNetEvent('flasher-holk:RollingJoint')
AddEventHandler('flasher-holk:RollingJoint', function()
    if rolling then
        return
      end
      rolling = true
      if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
          exports['progressBars']:startUI(15000, "Rullar fet holk..")
          Citizen.Wait(15000)
          FreezeEntityPosition(GetPlayerPed(-1), false)
          ClearPedTasks(PlayerPedId())
      else
          exports['progressBars']:startUI(15000, "Rullar fet holk..")
          Citizen.Wait(15000)
      end
      rolling = false
end)

