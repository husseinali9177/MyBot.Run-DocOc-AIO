; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design - SmartSwitchAccount (v1)
; Description ...: This is a part of MBR GUI Design Child Attack - Troops
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: RoroTiti
; Modified ......: 01/10/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Local $x = 10, $z = 189, $w = 357, $y = 85

	GUICtrlCreateGroup(GetTranslated(673,1, "Smart Switch Accounts"), $x, $y, 430, 295)

		$x += 10
		$y += 20

			$chkEnableSwitchAccount = GUICtrlCreateCheckbox(GetTranslated(673,2, "Use Smart Switch Accounts"), $x, $y, 152, 17)
				GUICtrlSetOnEvent(-1, "chkSwitchAccount")

			$lblNB = GUICtrlCreateLabel(GetTranslated(673,3, "Number of accounts on Emulator :"), $x + 195, $y + 2, 165, 17)
			$cmbAccountsQuantity = GUICtrlCreateCombo("", $x + 365, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				GUICtrlSetOnEvent(-1, "cmbAccountsQuantity")
				GUICtrlSetData(-1, "2|3|4|5|6|7|8", "2")

		$y += 35

			$chkCanUse[1] = GUICtrlCreateCheckbox(GetTranslated(673,4, "Use Account 1 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[1] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[1] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[2] = GUICtrlCreateCheckbox(GetTranslated(673,6, "Use Account 2 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[2] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[2] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[3] = GUICtrlCreateCheckbox(GetTranslated(673,7, "Use Account 3 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[3] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[3] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[4] = GUICtrlCreateCheckbox(GetTranslated(673,8, "Use Account 4 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[4] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[4] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[5] = GUICtrlCreateCheckbox(GetTranslated(673,9, "Use Account 5 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[5] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[5] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[6] = GUICtrlCreateCheckbox(GetTranslated(673,10, "Use Account 6 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[6] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[6] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[7] = GUICtrlCreateCheckbox(GetTranslated(673,11, "Use Account 7 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[7] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[7] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[8] = GUICtrlCreateCheckbox(GetTranslated(673,12, "Use Account 8 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[8] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[8] = GUICtrlCreateCheckbox(GetTranslated(673,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
