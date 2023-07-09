---@class EmotionAction 表情のアニメーションの抽象クラス
EmotionAction = {
    ---コンストラクタ
	---@param rightEye FaceParts.EyeType 右目の名前（"NONE"にすると変更されない）
	---@param leftEye FaceParts.EyeType 左目の名前（"NONE"にすると変更されない）
	---@param tiredRightEye FaceParts.EyeType 疲弊時の右目の名前（"NONE"にすると変更されない）
	---@param tiredLeftEye FaceParts.EyeType 疲弊時の左目の名前（"NONE"にすると変更されない）
	---@param mouth FaceParts.MouthType 口の名前（"NONE"にすると変更されない）
    ---@param animationCount integer 表情を継続する時間
    new = function (rightEye, leftEye, tiredRightEye, tiredLeftEye, mouth, animationCount)
        local instance = {}
		instance.CanPlayAnimation = false --アニメーションが再生可能かどうか
		instance.AnimationChecked = false --このチックでアニメーションが再生可能かどうかを確認したかどうか
		instance.IsAnimationPlaying = false --アニメーションが再生中かどうか
		instance.AnimationCount = -1 --アニメーションのタイミングを計るカウンター
		instance.AnimationLength = animationCount
        instance.RightEye = rightEye
        instance.LeftEye = leftEye
        instance.TiredRightEye = tiredRightEye
        instance.TiredLeftEye = tiredLeftEye
        instance.Mouth = mouth
        events.TICK:register(function ()
			instance:onTickEvent()
		end)
        return instance
    end,

    ---コンストラクタでtickイベントに登録される関数
	onTickEvent = function (self)
		if self.IsAnimationPlaying then
			self:onAnimationTick()
		end
		self.AnimationChecked = false
	end,

    ---表情アクションを再生する。
    play = function (self)
        if General.PlayerCondition == "LOW" then
            FaceParts.setEmotion(self.TiredRightEye, self.TiredLeftEye, self.Mouth, self.AnimationCount, true)
        else
            FaceParts.setEmotion(self.RightEye, self.LeftEye, self.Mouth, self.AnimationCount, true)
        end
		self.IsAnimationPlaying = true
        ActionManager.IsAnimationPlaying = true
		self.AnimationCount = self.AnimationLength
    end,

    ---表情アクションを停止する。
    stop = function (self)
		FaceParts.resetEmotion()
		self.IsAnimationPlaying = false
        ActionManager.IsAnimationPlaying = false
		self.AnimationCount = -1
    end,

    ---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		if self.AnimationCount == 0 then
			self:stop()
		end
		self.AnimationCount = (self.AnimationCount > 0 and not client:isPaused()) and self.AnimationCount - 1 or self.AnimationCount
	end
}

return EmotionAction