local AceGUI = LibStub("AceGUI-3.0")

function WoWGoldGambler:drawUi()
    -- Create the frame container
    local container = AceGUI:Create("Frame")
    container:SetTitle("WoWGoldGambler")
    container:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
    container:SetWidth(335)
    container:SetHeight(200)
    container:EnableResize(false)
    container:SetLayout("Flow")

    local wagerEditBox = AceGUI:Create("EditBox")
    wagerEditBox:SetText(self.db.global.game.wager)
    wagerEditBox:SetLabel("Wager Amount")
    wagerEditBox.label:SetJustifyH("CENTER")
    wagerEditBox:SetWidth(300)
    wagerEditBox.editbox:SetJustifyH("CENTER")
    wagerEditBox:SetCallback("OnTextChanged", function(container, event, text) self:setWager(text) end)
    wagerEditBox:DisableButton(true)
    container:AddChild(wagerEditBox)

    local startGameButton = AceGUI:Create("Button")
    startGameButton:SetText("Start Game")
    startGameButton:SetWidth(150)
    startGameButton:SetCallback("OnClick", function() self:startGame() end)
    container:AddChild(startGameButton)

    local joinButton = AceGUI:Create("Button")
    joinButton:SetText("Join Game")
    joinButton:SetWidth(150)
    joinButton:SetCallback("OnClick", function() self:enterMe() end)
    container:AddChild(joinButton)

    local lastCallButton = AceGUI:Create("Button")
    lastCallButton:SetText("Last Call")
    lastCallButton:SetWidth(150)
    lastCallButton:SetCallback("OnClick", function() SendChatMessage("Last Call to join!", self.db.global.game.chatChannel) end)
    container:AddChild(lastCallButton)

    local rollButton = AceGUI:Create("Button")
    rollButton:SetText("Roll For Me")
    rollButton:SetWidth(150)
    rollButton:SetCallback("OnClick", function() self:rollMe() end)
    container:AddChild(rollButton)

    local startRollButton = AceGUI:Create("Button")
    startRollButton:SetText("Start Rolls")
    startRollButton:SetWidth(150)
    startRollButton:SetCallback("OnClick", function() self:startRolls() end)
    container:AddChild(startRollButton)

    local cancelGameButton = AceGUI:Create("Button")
    cancelGameButton:SetText("Cancel Game")
    cancelGameButton:SetWidth(150)
    cancelGameButton:SetCallback("OnClick", function() self:cancelGame() end)
    container:AddChild(cancelGameButton)
end