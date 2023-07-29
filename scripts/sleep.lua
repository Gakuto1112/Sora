---@class Sleep ベッドで寝る時の挙動を制御するクラス
Sleep = {
}

---前チックに寝ていたかどうか
---@type boolean
local isSleepingPrev = false

---眠っている目になるまでのカウンター
---@type integer
local sleepEyeCount = 0

events.TICK:register(function()
	local isSleeping = player:getPose() == "SLEEPING"
	if isSleeping then
		if not isSleepingPrev then
			local facing = nil
			local playerPos = player:getPos():floor()
			local playerBlock = world.getBlockState(playerPos)
			if playerBlock.id:find("^minecraft:.+bed$") then
				facing = playerBlock.properties["facing"]
			end
			animations["models.main"]["sleep"]:play()
			Physics.EnablePyhsics = false
			Sleeve.Moving = false
			local firstPerson = renderer:isFirstPerson()
			if firstPerson then
				models.models.main.Avatar.Head:setVisible(false)
				renderer:setCameraRot(0, facing == "north" and 90 or (facing == "east" and 180 or (facing == "south" and -90 or 0)), 75)
			elseif renderer:isCameraBackwards() then
				renderer:setCameraRot(0, facing == "north" and -90 or (facing == "east" and 0 or (facing == "south" and 90 or 180)))
			else
				renderer:setCameraRot(0, facing == "north" and 90 or (facing == "east" and 180 or (facing == "south" and -90 or 0)))
			end
			sleepEyeCount = 0
		end
		if sleepEyeCount >= 40 then
			FaceParts.setEmotion("CLOSED", "CLOSED", "CLOSED", 1, false)
		end
		sleepEyeCount = sleepEyeCount + 1
	else
		if isSleepingPrev then
			models.models.main.Avatar.Head:setVisible(true)
			Physics.EnablePyhsics = true
			animations["models.main"]["sleep"]:stop()
			Sleeve.Moving = true
			renderer:setCameraRot()
		end
	end
	isSleepingPrev = isSleeping
end)

return Sleep