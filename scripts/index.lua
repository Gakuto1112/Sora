events.ENTITY_INIT:register(function ()
	--クラスのインスタンス化
	General = require("scripts.general")

	--抽象クラス

	--パーツ別クラス
	require("scripts.vanilla_model")
	Sleeve = require("scripts.sleeve")
	Physics = require("scripts.physics")

	--機能別クラス

end)