AIMessageErrorIsFull = {
	name = "CP_ERROR_FULL"
}
local AIMessageErrorIsFull_mt = Class(AIMessageErrorIsFull, AIMessage)

function AIMessageErrorIsFull.new(customMt)
	local self = AIMessage.new(customMt or AIMessageErrorIsFull_mt)

	return self
end

function AIMessageErrorIsFull:getMessage()
	return g_i18n:getText("CP_ai_messageErrorIsFull")
end

AIMessageCpError = {
	name = "CP_ERROR"
}
local AIMessageCpError_mt = Class(AIMessageCpError, AIMessage)

function AIMessageCpError.new(customMt)
	local self = AIMessage.new(customMt or AIMessageCpError_mt)

	return self
end

function AIMessageCpError:getMessage()
	return g_i18n:getText("CP_ai_messageError")
end

AIMessageCpErrorNoPathFound = {
	name = "CP_ERROR_NO_PATH_FOUND"
}
local AIMessageCpErrorNoPathFound_mt = Class(AIMessageCpErrorNoPathFound, AIMessage)

function AIMessageCpErrorNoPathFound.new(customMt)
	local self = AIMessage.new(customMt or AIMessageCpErrorNoPathFound_mt)

	return self
end

function AIMessageCpErrorNoPathFound:getMessage()
	return g_i18n:getText("CP_ai_messageErrorNoPathFound")
end


AIMessageErrorWrongBaleWrapType = {
	name = "CP_ERROR_WRONG_WRAP_TYPE"
}
local AIMessageErrorWrongBaleWrapType_mt = Class(AIMessageErrorWrongBaleWrapType, AIMessage)

function AIMessageErrorWrongBaleWrapType.new(customMt)
	local self = AIMessage.new(customMt or AIMessageErrorWrongBaleWrapType_mt)

	return self
end

function AIMessageErrorWrongBaleWrapType:getMessage()
	return g_i18n:getText("CP_ai_messageErrorWrongBaleWrapType")
end

AIMessageErrorGroundUnloadNotSupported = {
	name = "CP_ERROR_GROUND_UNLOAD_NOT_SUPPORTED"
}

local AIMessageErrorGroundUnloadNotSupported_mt = Class(AIMessageErrorGroundUnloadNotSupported, AIMessage)

function AIMessageErrorGroundUnloadNotSupported.new(customMt)
	local self = AIMessage.new(customMt or AIMessageErrorGroundUnloadNotSupported_mt)

	return self
end

function AIMessageErrorGroundUnloadNotSupported:getMessage()
	return g_i18n:getText("CP_ai_messageErrorGroundUnloadNotSupported")
end

AIMessageErrorCutterNotSupported = {
	name = "CP_ERROR_CUTTER_NOT_SUPPORTED"
}
local AIMessageErrorCutterNotSupported_mt = Class(AIMessageErrorCutterNotSupported, AIMessage)

function AIMessageErrorCutterNotSupported.new(customMt)
	local self = AIMessage.new(customMt or AIMessageErrorCutterNotSupported_mt)

	return self
end

function AIMessageErrorCutterNotSupported:getMessage()
	return g_i18n:getText("CP_ai_messageErrorCutterNotSupported")
end

AIMessageErrorAutomaticCutterAttachNotActive = {
	name = "CP_ERROR_AUTOMATIC_CUTTER_ATTACH_NOT_ACTIVE"
}
local AIMessageErrorAutomaticCutterAttachNotActive_mt = Class(AIMessageErrorAutomaticCutterAttachNotActive, AIMessage)

function AIMessageErrorAutomaticCutterAttachNotActive.new(customMt)
	local self = AIMessage.new(customMt or AIMessageErrorAutomaticCutterAttachNotActive_mt)

	return self
end

function AIMessageErrorAutomaticCutterAttachNotActive:getMessage()
	return g_i18n:getText("CP_ai_messageErrorAutomaticCutterAttachNotActive")
end

CpAIMessages = {}

function CpAIMessages.register()
	local function register(messageClass)
		g_currentMission.aiMessageManager:registerMessage(messageClass.name, messageClass)
	end
	register(AIMessageErrorIsFull)
	register(AIMessageCpError)
	register(AIMessageCpErrorNoPathFound)
	register(AIMessageErrorWrongBaleWrapType)
	register(AIMessageErrorGroundUnloadNotSupported)
	register(AIMessageErrorCutterNotSupported)
	register(AIMessageErrorAutomaticCutterAttachNotActive)
end

--- Another ugly hack, as the giants code to get the message index in mp isn't working ..
local function getMessageIndex(aiMessageManager, superFunc, messageObject, ...)
	local ix = superFunc(aiMessageManager, messageObject, ...)
	if ix == nil then 
		return aiMessageManager.nameToIndex[messageObject.name]
	end
	return ix
end
AIMessageManager.getMessageIndex = Utils.overwrittenFunction(AIMessageManager.getMessageIndex, getMessageIndex)
