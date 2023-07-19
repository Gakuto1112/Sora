---@class ActionWheel アクションホイールを制御するクラス
---@field IsAnimationPlaying boolean アニメーションが再生中かどうか
ActionWheel = {
    IsAnimationPlaying = false
}

---アクションホイールのページの配列
---@type Page
local page = action_wheel:newPage()

if host:isHost() then
    --メインページのアクション設定
    --アクション1-1. 座る
    page:newAction(1):title(Language.getTranslate("action_wheel__main__action_1__title")):color(0.91, 0.67, 0.27):hoverColor(1, 1, 1):toggleColor(0.91, 0.67, 0.27):item("oak_stairs")

    --アクション1-2. 名前変更
	page:newAction(2):title(Language.getTranslate("action_wheel__main__action_2__title")):color(0.91, 0.67, 0.27):hoverColor(1, 1, 1):item("name_tag"):color(0.78, 0.78, 0.78):hoverColor(1, 1, 1)

    --アクション1-3. 防具の表示
	page:newAction(3):title(Language.getTranslate("action_wheel__main__action_3__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_3__title")..Language.getTranslate("action_wheel__toggle_on")):item("iron_chestplate"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33)

    --アクション1-4. 一人称視点での狐火の表示
    page:newAction(4):title(Language.getTranslate("action_wheel__main__action_4__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_4__title")..Language.getTranslate("action_wheel__toggle_on")):item("soul_torch"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-5. 傘の開閉音
	page:newAction(5):title(Language.getTranslate("action_wheel__main__action_5__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_5__title")..Language.getTranslate("action_wheel__toggle_on")):item("note_block"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-6. 常に傘をさす
	page:newAction(6):title(Language.getTranslate("action_wheel__main__action_6__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_6__title")..Language.getTranslate("action_wheel__toggle_on")):item("red_carpet"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    --アクション1-7. 頻出メッセージの表示
	page:newAction(7):title(Language.getTranslate("action_wheel__main__action_7__title")..Language.getTranslate("action_wheel__toggle_off")):toggleTitle(Language.getTranslate("action_wheel__main__action_7__title")..Language.getTranslate("action_wheel__toggle_on")):item("cake"):color(0.67, 0, 0):hoverColor(1, 0.33, 0.33):toggleColor(0, 0.67, 0)

    action_wheel:setPage(page)
end

return ActionWheel