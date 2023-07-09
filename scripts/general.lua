---@alias ConditionLevel
---| "LOW"
---| "MEDIUM"
---| "HIGH"

--[[
	## General.playerConditionの値
	- 凍えている時は常に"LOW"
	- クリエイティブモードとスペクテイターモードでは常に"HIGH"
	┌───────────┬───────────────────┬───────────────┐
	│ 値		│ 体力H				| 満腹度S		 |
	╞═══════════╪═══════════════════╪═══════════════╡
	│ "HIGH"	│ 50% < H			│ 30% < S		│
	├───────────┼───────────────────┼───────────────┤
	│ "MEDIUM"	│ 20% < H <= 50%	│ 0% < S <= 30%	│
	├───────────┼───────────────────┼───────────────┤
	│ "LOW"		│ H <= 50%			│ 0% = S		│
	└───────────┴───────────────────┴───────────────┘
]]

---@class General 他の複数のクラスが参照するフィールドや関数を定義するクラス
---@field PlayerCondition ConditionLevel プレイヤーの体力・満腹度の度合い
General = {
	PlayerCondition = "HIGH",
}

events.TICK:register(function ()
	local gamemode = player:getGamemode()
	local healthPercent = player:getHealth() / player:getMaxHealth()
	local satisfactionPercent = player:getFood() / 20
	General.PlayerCondition = player:getFrozenTicks() == 140 and "LOW" or (((healthPercent > 0.5 and satisfactionPercent > 0.3) or (gamemode == "CREATIVE" or gamemode == "SPECTATOR")) and "HIGH" or ((healthPercent > 0.2 and satisfactionPercent > 0) and "MEDIUM" or "LOW"))
end)

return General