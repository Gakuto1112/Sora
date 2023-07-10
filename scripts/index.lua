events.ENTITY_INIT:register(function ()
	--クラスのインスタンス化
	General = require("scripts.general")
	Config = require("scripts.config")
	Language = require("scripts.language")
	KeyManager = require("scripts.key_manager")

	--抽象クラス
	EmotionAction = require("scripts.actions.emotion_action")

	--パーツ別クラス
	require("scripts.vanilla_model")
	Arms = require("scripts.arms")
	Sleeve = require("scripts.sleeve")
	Hem = require("scripts.hem")
	FaceParts = require("scripts.face_parts")
	Physics = require("scripts.physics")
	Tail = require("scripts.tail")
	Ears = require("scripts.ears")
	Naginata = require("scripts.naginata")
	Umbrella = require("scripts.umbrella")

	--機能別クラス
	Hurt = require("scripts.hurt")
	ActionManager = require("scripts.action_manager")
	require("scripts.emote_keys")
	KeyEmoteUp = require("scripts.actions.key_emote_up")
	KeyEmoteRight = require("scripts.actions.key_emote_right")
	KeyEmoteDown = require("scripts.actions.key_emote_down")
	KeyEmoteLeft = require("scripts.actions.key_emote_left")

end)