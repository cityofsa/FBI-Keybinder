CanUseKeybinds()
{
	if (isInChat() || KeybinderState == 0)
		return false
	
	return true
}

AddChatMessageEx(text)
{
	addChatMessage("• {ffba00}[FBI] {ffffff}" text)
}