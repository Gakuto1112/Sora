---@class Config アバター設定を管理するクラス
---@field DefaultValues table<any> 読み込んだ値のデフォルト値を保持するテーブル
---@field IsSynced boolean アバターの設定がホストと同期されたかどうか
---@field NextSyncCount integer 次の同期pingまでのカウンター
Config = {
	DefaultValues = {},
	IsSynced = host:isHost(),
	NextSyncCount = 0,

	---設定を読み出す
	---@param keyName string 読み出す設定の名前
	---@param defaultValue any 該当の設定が無い場合や、ホスト外での実行の場合はこの値が返される。
	---@return any data 読み出した値
	loadConfig = function (keyName, defaultValue)
		if host:isHost() then
			local data = config:load(keyName)
			Config.DefaultValues[keyName] = defaultValue
			if data ~= nil then
				return data
			else
				return defaultValue
			end
		else
			return defaultValue
		end
	end,

	---設定を保存する
	---@param keyName string 保存する設定の名前
	---@param value any 保存する値
	saveConfig = function (keyName, value)
		if host:isHost() then
			if Config.DefaultValues[keyName] == value then
				config:save(keyName, nil)
			else
				config:save(keyName, value)
			end
		end
	end
}

--ping関数

events.TICK:register(function ()
	if Config.NextSyncCount == 0 then
		Config.NextSyncCount = 300
	else
		Config.NextSyncCount = Config.NextSyncCount - 1
	end
end)

if host:isHost() then
	config:name("Sora")
end

return Config