events.ENTITY_INIT:register(function ()
	--クラスのインスタンス化
	General = require("scripts.general")
	Config = require("scripts.config")
	Language = require("scripts.language")
	KeyManager = require("scripts.key_manager")

	--抽象クラス

	--パーツ別クラス
	require("scripts.vanilla_model")
	Sleeve = require("scripts.sleeve")
	Hem = require("scripts.hem")
	FaceParts = require("scripts.face_parts")
	Physics = require("scripts.physics")
	Tail = require("scripts.tail")
	Ears = require("scripts.ears")

	--機能別クラス
	Hurt = require("scripts.hurt")

end)