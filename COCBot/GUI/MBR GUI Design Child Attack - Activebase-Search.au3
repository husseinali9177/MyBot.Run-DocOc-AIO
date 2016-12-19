; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Local $x = 5, $y = 25

	$grpABFilter = GUICtrlCreateGroup("Search Settings", $x, $y, 420, 75)

		$chkABActivateSearches = GUICtrlCreateCheckbox("Enable", $x + 15, $y + 20, 57, 17)
			$txtTip = GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,69, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1,$GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkABActivateSearches")
		$txtABSearchesMin = GUICtrlCreateInput("1", $x + 80, $y + 20, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,2, -1) & @CRLF & @CRLF & GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,69, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$lblABSearches = GUICtrlCreateLabel("-", $x + 131, $y + 25, 7, 17)
		$txtABSearchesMax = GUICtrlCreateInput("9999", $x + 140, $y + 20, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,3, -1) & @CRLF & @CRLF & GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,69,-1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABSearches = GUICtrlCreateIcon($pIconLib, $eIcnMagnifier, $x + 190, $y + 22, 16, 16)

		$chkABActivateTropies = GUICtrlCreateCheckbox("Trophies", $x + 15, $y + 45, 62, 17)
			$txtTip = GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,70,-1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABActivateTropies")
		$txtABTropiesMin = GUICtrlCreateInput("0", $x + 80, $y + 45, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			GUICtrlSetState(-1,$GUI_DISABLE)
			$txtTip = GetTranslated(625,5, -1) & @CRLF & @CRLF & GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,70,-1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$lblABTropies = GUICtrlCreateLabel("-", $x + 131, $y + 47, 7, 17)
			GUICtrlSetState(-1,$GUI_DISABLE)
		$txtABTropiesMax = GUICtrlCreateInput("6000", $x + 140, $y + 45, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			GUICtrlSetState(-1,$GUI_DISABLE)
			$txtTip = GetTranslated(625,6, -1) & @CRLF & @CRLF & GetTranslated(625,68, -1) & @CRLF & GetTranslated(625,70,-1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 190, $y + 47, 16, 16)

		$chkABActivateCamps = GUICtrlCreateCheckbox("Camps capacity >", $x + 230, $y + 20, 102, 17)
			$txtTip = GetTranslated(625,8, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABActivateCamps")
		$txtABArmyCamps = GUICtrlCreateInput("100", $x + 335, $y + 20, 41, 21, BitOR($ES_CENTER,$ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1,$GUI_DISABLE)
		$txtABArmyCampsPerc = GUICtrlCreateLabel("%", $x + 381, $y + 22, 12, 17)
			GUICtrlSetState(-1,$GUI_DISABLE)

		$chkABMeetOne = GUICtrlCreateCheckbox("If at least 1 condition met, attack", $x + 230, $y + 45, 177, 17)
			$txtTip = GetTranslated(625,41, -1)
			_GUICtrlSetTip(-1, $txtTip)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 5, $y = 105

	$grpABWaitFor = GUICtrlCreateGroup("Wait For", $x, $y, 420, 60)

		$IMGchkABKingWait = GUICtrlCreateIcon($pIconLib, $eIcnKing, $x + 5, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
		$IMGchkABKingSleepWait = GUICtrlCreateIcon($pIconLib, $eIcnSleepingKing, $x + 5, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1,$GUI_HIDE)
		$chkABKingWait = GUICtrlCreateCheckbox("", $x + 40, $y + 35, 17, 17)
			$txtTip = GetTranslated(625,10, -1) & @CRLF & GetTranslated(625, 50, -1) & @CRLF & GetTranslated(625, 65, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABKingWait")

		$IMGchkABQueenWait = GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x + 60, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
		$IMGchkABQueenSleepWait = GUICtrlCreateIcon($pIconLib, $eIcnSleepingQueen, $x + 60, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1,$GUI_HIDE)
		$chkABQueenWait = GUICtrlCreateCheckbox("", $x + 95, $y + 35, 17, 17)
			$txtTip = GetTranslated(625,12, -1) & @CRLF & GetTranslated(625, 50, -1) & @CRLF & GetTranslated(625, 66, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABQueenWait")

		$IMGchkABWardenWait = GUICtrlCreateIcon($pIconLib, $eIcnWarden, $x + 115, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
		$IMGchkABWardenSleepWait = GUICtrlCreateIcon($pIconLib, $eIcnSleepingWarden, $x + 115, $y + 20, 32, 32)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1,$GUI_HIDE)
		$chkABWardenWait = GUICtrlCreateCheckbox("", $x + 150, $y + 35, 17, 17)
			$txtTip = GetTranslated(625,13, -1) & @CRLF & GetTranslated(625, 50, -1) & @CRLF & GetTranslated(625, 67, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWardenWait")

		$IMGchkABLightSpellWait = GUICtrlCreateIcon($pIconLib, $eIcnSpellsGroup, $x + 170, $y + 20, 32, 32)
		$chkABSpellsWait = GUICtrlCreateCheckbox("", $x + 205, $y + 35, 17, 17)
			$txtTip = GetTranslated(625,100, -1) & @CRLF & _
			GetTranslated(625,101, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABSpellsWait")

		$imgABWaitForCastleTroops = GUICtrlCreateIcon($pIconLib, $eIcnCCTroops, $x + 225, $y + 20, 32, 32)
		$chkABWaitForCastleTroops = GUICtrlCreateCheckbox("", $x + 260, $y + 35, 17, 17)
			$txtTip = "Wait until your Clan Castle be Full"
			_GUICtrlSetTip(-1, $txtTip)

		$imgABWaitForCastleSpell = GUICtrlCreateIcon($pIconLib, $eIcnCCSpells, $x + 280, $y + 20, 32, 32)
		$chkABWaitForCastleSpell = GUICtrlCreateCheckbox("", $x + 315, $y + 35, 17, 17)
			$txtTip = "Wait until Someone Donate you an Spell"
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWaitForCCSpell")
		$cmbABWaitForCastleSpell = GUICtrlCreateCombo("Any", $x + 335, $y + 30, 80, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = "Wait until Someone Donate this Spell, Else remove other spells in Castle and Request AGAIN"
			GUICtrlSetData(-1, "Poison|EarthQuake|Haste|Skeleton")
			_GUICtrlSetTip(-1, $txtTip)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 5, $y = 170

	$grpABAttackIf = GUICtrlCreateGroup("Attack If", $x, $y, 420, 70)

		$cmbABMeetGE = GUICtrlCreateCombo("", $x + 10, $y + 27, 65, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,15, -1) & @CRLF & GetTranslated(625,16, -1) & @CRLF & GetTranslated(625,17, -1) & @CRLF & GetTranslated(625,18, -1)
			GUICtrlSetData(-1, GetTranslated(625,19, -1) &"|" & GetTranslated(625,20, -1) & "|" & GetTranslated(625,21, -1), GetTranslated(625,19, -1))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbABGoldElixir")
		$txtABMinGold = GUICtrlCreateInput("180000", $x + 80, $y + 15, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,23, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABMinGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 130, $y + 17, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
		$txtABMinElixir = GUICtrlCreateInput("180000", $x + 80, $y + 39, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,24, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABMinElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 130, $y + 41, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)

		$txtABMinGoldPlusElixir = GUICtrlCreateInput("200000", $x + 80, $y + 25, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,25, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGoldElixir, $x + 130, $y + 27, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)

		$chkABMeetDE = GUICtrlCreateCheckbox("Dark Elixir", $x + 155, $y + 17, 67, 17)
			$txtTip = GetTranslated(625,27, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetDE")
			_GUICtrlSetTip(-1, $txtTip)
		$txtABMinDarkElixir = GUICtrlCreateInput("0", $x + 225, $y + 15, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,28, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picABMinDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 275, $y + 17, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
		$chkABMeetTrophy = GUICtrlCreateCheckbox("Trophies", $x + 155, $y + 41, 67, 17)
			$txtTip = GetTranslated(625,29, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetTrophy")
			_GUICtrlSetTip(-1, $txtTip)
		$txtABMinTrophy = GUICtrlCreateInput("0", $x + 225, $y + 39, 46, 21, BitOR($ES_CENTER,$ES_NUMBER))
			$txtTip = GetTranslated(625,30, -1)
			_GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picABMinTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 275, $y + 42, 16, 16)
		$chkABMeetTH = GUICtrlCreateCheckbox("Max TH", $x + 300, $y + 17, 57, 17)
			$txtTip = GetTranslated(625,32, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetTH")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbABTH = GUICtrlCreateCombo("", $x + 360, $y + 15, 50, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,33, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetData(-1, "4-6|7|8|9|10|11", "4-6")
		$chkABMeetTHO = GUICtrlCreateCheckbox("External TH", $x + 300, $y + 41, 97, 17)
			$txtTip = GetTranslated(625,35, -1)
			_GUICtrlSetTip(-1, $txtTip)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 5, $y = 245

	$grpABWeakBase = GUICtrlCreateGroup("Weak Base", $x, $y, 420, 85)

		$chkMaxMortar[$LB] = GUICtrlCreateCheckbox("", $x + 30, $y + 25, 17, 17)
			$txtTip = GetTranslated(625,59, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakMortar[$LB] = GUICtrlCreateCombo("", $x + 50, $y + 23, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,38, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 5")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakMortar = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 115, $y + 20, 24, 24)
			_GUICtrlSetTip(-1, $txtTip)

		$chkMaxWizTower[$LB] = GUICtrlCreateCheckbox("", $x + 30, $y + 55, 17, 17)
			$txtTip = GetTranslated(625,60, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakWizTower[$LB] = GUICtrlCreateCombo("", $x + 50, $y + 53, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,39, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8|Lvl 9", "Lvl 4")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakWizTower = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 115, $y + 50, 24, 24)
			_GUICtrlSetTip(-1, $txtTip)

		$chkMaxAirDefense[$LB] = GUICtrlCreateCheckbox("", $x + 155, $y + 25, 17, 17)
			$txtTip = "Search for a base that has Air Defense below this level"
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakAirDefense[$LB] = GUICtrlCreateCombo("", $x + 175, $y + 23, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = "Set the Max. level of the Air Defense to search for on a village to attack."
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 7")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakAirDefense = GUICtrlCreateIcon($pIconLib, $eIcnAirDefense, $x + 240, $y + 20, 24, 24)
			_GUICtrlSetTip(-1, $txtTip)

		$chkMaxXBow[$LB] = GUICtrlCreateCheckbox("", $x + 155, $y + 55, 17, 17)
			$txtTip = GetTranslated(625,61, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakXBow[$LB] = GUICtrlCreateCombo("", $x + 175, $y + 53, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,51, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4", "Lvl 2")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakXBow = GUICtrlCreateIcon($pIconLib, $eIcnXBow3, $x + 240, $y + 50, 24, 24)
			_GUICtrlSetTip(-1, $txtTip)

		$chkMaxInferno[$LB] = GUICtrlCreateCheckbox("", $x + 280, $y + 25, 17, 17)
			$txtTip = GetTranslated(625,62, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakInferno[$LB] = GUICtrlCreateCombo("", $x + 300, $y + 23, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,52, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3", "Lvl 2")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakInferno = GUICtrlCreateIcon($pIconLib, $eIcnInferno4, $x + 365, $y + 20, 24, 24)

		$chkMaxEagle[$LB] = GUICtrlCreateCheckbox("", $x + 280, $y + 55, 17, 17)
			$txtTip = GetTranslated(625,63, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABWeakBase")
		$cmbWeakEagle[$LB] = GUICtrlCreateCombo("", $x + 300, $y + 53, 60, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(625,53, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2", "Lvl 1")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picABWeakEagle = GUICtrlCreateIcon($pIconLib, $eIcnEagleArt, $x + 365, $y + 50, 24, 24)
			_GUICtrlSetTip(-1, $txtTip)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
