---@class Language アバターの表示言語を管理するクラス
---@field LanguageData { [string]: { [string]: string } } 言語データ
Language = {
	LanguageData = {
		en_us = {
			key_name__jerk_ears = "Jerk ears",
			key_name__wag_tail = "Wag tails",
			key_name__emote_keys__up = "Emote (up)",
			key_name__emote_keys__right = "Emote (right)",
			key_name__emote_keys__down = "Emote (down)",
			key_name__emote_keys__left = "Emote (left)",
			action_wheel__toggle_off = "§coff",
			action_wheel__toggle_on = "§aon",
			action_wheel__main__action_1__title = "Sit down",
			action_wheel__main__action_2__title = "Change display name",
			action_wheel__main__action_3__title = "Show armor: ",
			action_wheel__main__action_4__title = "Show fox fires in first person: ",
			action_wheel__main__action_5__title = "Umbrella sound: ",
			action_wheel__main__action_6__title = "Always use umbrella: ",
			action_wheel__main__action_7__title = "Show messages: "
		},
		ja_jp = {
			key_name__jerk_ears = "耳を動かす",
			key_name__wag_tail = "尻尾を振る",
			key_name__emote_keys__up = "エモート（上）",
			key_name__emote_keys__right = "エモート（右）",
			key_name__emote_keys__down = "エモート（下）",
			key_name__emote_keys__left = "エモート（左）",
			action_wheel__toggle_off = "§cオフ",
			action_wheel__toggle_on = "§aオン",
			action_wheel__main__action_1__title = "お座り",
			action_wheel__main__action_2__title = "表示名の変更",
			action_wheel__main__action_3__title = "防具の表示：",
			action_wheel__main__action_4__title = "一人称視点での狐火の表示：",
			action_wheel__main__action_5__title = "傘の開閉音：",
			action_wheel__main__action_6__title = "常に傘をさす：",
			action_wheel__main__action_7__title = "メッセージの表示："
		}
	},

	---翻訳キーに対する訳文を返す。設定言語が存在しない場合は英語の文が返される。また、指定したキーの訳が無い場合は英語->キーそのままが返される。
	---@param keyName string 翻訳キー
	---@return string translatedString 翻訳キーに対する翻訳データ。設定言語での翻訳が存在しない場合は英文が返される。英文すら存在しない場合は翻訳キーがそのまま返される。
	getTranslate = function(keyName)
		local activeLanguage = client:getActiveLang()
		return (Language.LanguageData[activeLanguage] and Language.LanguageData[activeLanguage][keyName]) and Language.LanguageData[activeLanguage][keyName] or (Language.LanguageData["en_us"][keyName] and Language.LanguageData["en_us"][keyName] or keyName)
	end
}

return Language