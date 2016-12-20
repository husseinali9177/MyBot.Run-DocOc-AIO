; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015), kaganus (August-2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; GUI Control for Classic FourFinger Attack - DEMEN
Func cmbDeployAB() ; avoid conflict between FourFinger and SmartAttack - DEMEN
	If _GUICtrlComboBox_GetCurSel($cmbDeployAB) = 4 Or _GUICtrlComboBox_GetCurSel($cmbDeployAB) = 5 Then
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_UNCHECKED)
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_DISABLE)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_ENABLE)
	EndIf
	chkSmartAttackRedAreaAB()
EndFunc   ;==>cmbDeployAB

Func cmbDeployDB() ; avoid conflict between FourFinger and SmartAttack - DEMEN
	If _GUICtrlComboBox_GetCurSel($cmbDeployDB) = 4 Or _GUICtrlComboBox_GetCurSel($cmbDeployDB) = 5 Then
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_UNCHECKED)
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_DISABLE)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_ENABLE)
	EndIf
	chkSmartAttackRedAreaDB()
EndFunc   ;==>cmbDeployDB
; ============= Classic FourFinger Attack ============ - DEMEN

; GUI Control for Multi Finger Attack
Func Bridge()
	cmbDeployDB()
	cmbDBMultiFinger()
EndFunc   ;==>Bridge
; GUI Control for Multi Finger Attack

Func cmbCSVSpeed()

	Switch _GUICtrlComboBox_GetCurSel($cmbCSVSpeed[$iMatchMode])
		Case 0
			$Divider = 0.5
		Case 1
			$Divider = 0.75
		Case 2
			$Divider = 1
		Case 3
			$Divider = 1.25
		Case 4
			$Divider = 1.5
		Case 5
			$Divider = 2
		Case 6
			$Divider = 3
	EndSwitch

EndFunc   ;==>cmbCSVSpeed

Func AttackNowLB()
	Setlog("Begin Live Base Attack TEST")
	$iMatchMode = $LB ; Select Live Base As Attack Type
	$iAtkAlgorithm[$LB] = 1 ; Select Scripted Attack
	$scmbABScriptName = GUICtrlRead($cmbScriptNameAB) ; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 1 ; Select Live Base As Attack Type
	$RunState = True
	PrepareAttack($iMatchMode) ; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack() ; Fire xD
	Setlog("End Live Base Attack TEST")
EndFunc   ;==>AttackNowLB

Func AttackNowDB()
	Setlog("Begin Dead Base Attack TEST")
	$iMatchMode = $DB ; Select Dead Base As Attack Type
	$iAtkAlgorithm[$DB] = 1 ; Select Scripted Attack
	$scmbABScriptName = GUICtrlRead($cmbScriptNameDB) ; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 0 ; Select Dead Base As Attack Type
	$RunState = True
	PrepareAttack($iMatchMode) ; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack() ; Fire xD
	Setlog("End Dead Base Attack TEST")
EndFunc   ;==>AttackNowDB

Func chkAutoHide()
	If GUICtrlRead($chkAutoHide) = $GUI_CHECKED Then
		GUICtrlSetState($txtAutohideDelay, $GUI_ENABLE)
	Else
		GUICtrlSetState($txtAutohideDelay, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkAutoHide

Func btnColorShield()
	$sSelectedColor = _ChooseColor(2, 0xFFFFFF, 2, $frmBot)
	If $sSelectedColor <> -1 Then
		$sSelectedColor = StringTrimLeft($sSelectedColor, 2)
		$AndroidShieldColor = Dec($sSelectedColor)
		SetLog("Shield color successfully chosen! Will be used now", $COLOR_INFO)
	Else
		SetLog("Shield color selection stopped, keeping the old one!", $COLOR_INFO)
	EndIf
EndFunc   ;==>btnColorShield

Func sldrTransparancyShield()
	$ReadTransparancyShield = GUICtrlRead($sldrTransparancyShield)
	$AndroidShieldTransparency = Int($ReadTransparancyShield)
EndFunc   ;==>sldrTransparancyShield

Func btnColorIdleShield()
	$sSelectedColor = _ChooseColor(2, 0xFFFFFF, 2, $frmBot)
	If $sSelectedColor <> -1 Then
		$sSelectedColor = StringTrimLeft($sSelectedColor, 2)
		$AndroidInactiveColor = Dec($sSelectedColor)
		SetLog("Idle Shield color successfully chosen! Will be used now", $COLOR_INFO)
	Else
		SetLog("Idle Shield color selection stopped, keeping the old one!", $COLOR_INFO)
	EndIf
EndFunc   ;==>btnColorIdleShield

Func sldrTransparancyIdleShield()
	$ReadTransparancyIdle = GUICtrlRead($sldrTransparancyIdleShield)
	$AndroidInactiveTransparency = Int($ReadTransparancyIdle)

EndFunc   ;==>sldrTransparancyIdleShield

Func btnRecycle()
	FileDelete($config)
	SaveConfig()
	SetLog("Profile " & $sCurrProfile & " was recycled with success", $COLOR_GREEN)
	SetLog("All unused settings were removed", $COLOR_GREEN)
EndFunc   ;==>btnRecycle

Func setupProfileComboBoxswitch()
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMinProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMaxProfile, $profileString, "<No Profiles>")
	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMinProfile, $profileString, "<No Profiles>")

	For $x = 0 To 5
		GUICtrlSetData($cmbAccount[$x], "", "")
	Next

	For $x = 0 To 5
		GUICtrlSetData($cmbAccount[$x], $profileString, "<No Profiles>")
	Next
EndFunc   ;==>setupProfileComboBoxswitch

Func chkCoCStats()
	If GUICtrlRead($chkCoCStats) = $GUI_CHECKED Then
		$ichkCoCStats = 1
		GUICtrlSetState($txtAPIKey, $GUI_ENABLE)
	Else
		$ichkCoCStats = 0
		GUICtrlSetState($txtAPIKey, $GUI_DISABLE)
	EndIf
	IniWrite($config, "Stats", "chkCoCStats", $ichkCoCStats)
EndFunc   ;==>chkCoCStats
