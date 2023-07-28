---@class ActionWheel アクションホイールを制御するクラス
---@field MainPage Page アクションホイールのメインページ
---@field IsAnimationPlaying boolean アニメーションが再生中かどうか
ActionWheel = {
    MainPage = action_wheel:newPage();
    IsAnimationPlaying = false,

    ---立ち上がった時に呼ばれる関数（SitDownから呼び出し）
	onStandUp = function ()
		if host:isHost() then
			ActionWheel.MainPage:getAction(1):toggled(false)
		end
	end,

}

---ping関数
function pings.main_action1_toggle()
	SitDown:play()
end

function pings.main_action1_untoggle()
	SitDown:stop()
end

events.TICK:register(function ()
    if host:isHost() then
		local isOpenActionWheel = action_wheel:isEnabled()
        if isOpenActionWheel then
            if not ActionWheel.IsAnimationPlaying and SitDown:checkAction() then
                ActionWheel.MainPage:getAction(1):title(Language.getTranslate("action_wheel__main__action_1__title")):color(0.91, 0.67, 0.27):hoverColor(1, 1, 1)
            else
                ActionWheel.MainPage:getAction(1):title("§7"..Language.getTranslate("action_wheel__main__action_1__title")):color(0.16, 0.16, 0.16):hoverColor(1, 0.33, 0.33)
            end
        end
    end
end)


if host:isHost() then
    --メインページのアクション設定
    --アクション1-1. 座る
    ActionWheel.MainPage:newAction(1):toggleColor(0.91, 0.67, 0.27):item("oak_stairs"):onToggle(function(_, action)
		if not ActionWheel.IsAnimationPlaying then
			if SitDown:checkAction() then
				pings.main_action1_toggle()
			else print(Language.getTranslate("action_wheel__main__action_1__unavailable"))
				action:toggled(false)
			end
		else
			action:toggled(false)
		end
    end):onUntoggle(function ()
		pings.main_action1_untoggle()
    end)

    --アクション1-2. 名前変更
	ActionWheel.MainPage:newAction(2):title(Language.getTranslate("action_wheel__main__action_2__title")):color(0.91, 0.67, 0.27):hoverColor(1, 1, 1):item("name_tag"):color(0.78, 0.78, 0.78):hoverColor(1, 1, 1)

    --アクション1-3. 防具の表示
	ActionWheel.MainPage:newAction(3):title(Language.getTranslate("action_wheel__main__action_3__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_3__title")..Language.getTranslate("action_wheel__toggle_on")):item("iron_chestplate"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33)

    --アクション1-4. 一人称視点での狐火の表示
    ActionWheel.MainPage:newAction(4):title(Language.getTranslate("action_wheel__main__action_4__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_4__title")..Language.getTranslate("action_wheel__toggle_on")):item("soul_torch"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-5. 傘の開閉音
	ActionWheel.MainPage:newAction(5):title(Language.getTranslate("action_wheel__main__action_5__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_5__title")..Language.getTranslate("action_wheel__toggle_on")):item("note_block"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-6. 常に傘をさす
	ActionWheel.MainPage:newAction(6):title(Language.getTranslate("action_wheel__main__action_6__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_6__title")..Language.getTranslate("action_wheel__toggle_on")):item("red_carpet"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-7. 頻出メッセージの表示
	ActionWheel.MainPage:newAction(7):title(Language.getTranslate("action_wheel__main__action_7__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_7__title")..Language.getTranslate("action_wheel__toggle_on")):item("cake"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    action_wheel:setPage(ActionWheel.MainPage)
end

return ActionWheel