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

; Classic Four Finger
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

; CSV Deploy Speed
Func sldSelectedSpeedDB()
	$isldSelectedCSVSpeed[$DB] = GUICtrlRead($sldSelectedSpeedDB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$DB]] & "x";
	IF $isldSelectedCSVSpeed[$DB] = 4 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedDB, $speedText & " speed")
EndFunc   ;==>sldSelectedSpeedDB

Func sldSelectedSpeedAB()
	$isldSelectedCSVSpeed[$LB] = GUICtrlRead($sldSelectedSpeedAB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$LB]] & "x";
	IF $isldSelectedCSVSpeed[$LB] = 4 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedAB, $speedText & " speed")
EndFunc   ;==>sldSelectedSpeedAB

; Attack Now Button
Func AttackNowLB()
	Setlog("Begin Live Base Attack TEST")
	$iMatchMode = $LB			; Select Live Base As Attack Type
	$iAtkAlgorithm[$LB] = 1			; Select Scripted Attack
	$scmbABScriptName = GuiCtrlRead($cmbScriptNameAB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 1			; Select Live Base As Attack Type
	$RunState = True

	ForceCaptureRegion()
	_CaptureRegion2()

	If CheckZoomOut("VillageSearch", True, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($iDelayPrepareSearch3) Then Return ; wait 500 ms
			ForceCaptureRegion()
			$bMeasured = CheckZoomOut("VillageSearch", $i < 2, True)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then Return ; exit func
	EndIf

	PrepareAttack($iMatchMode)			; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack()			; Fire xD
	Setlog("End Live Base Attack TEST")
EndFunc   ;==>AttackNowLB

Func AttackNowDB()
	Setlog("Begin Dead Base Attack TEST")
	$iMatchMode = $DB			; Select Dead Base As Attack Type
	$iAtkAlgorithm[$DB] = 1			; Select Scripted Attack
	$scmbABScriptName = GuiCtrlRead($cmbScriptNameDB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 0			; Select Dead Base As Attack Type
	$RunState = True
	ForceCaptureRegion()
	_CaptureRegion2()

	If CheckZoomOut("VillageSearch", True, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($iDelayPrepareSearch3) Then Return ; wait 500 ms
			ForceCaptureRegion()
			$bMeasured = CheckZoomOut("VillageSearch", $i < 2, True)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then Return ; exit func
	EndIf

	PrepareAttack($iMatchMode)			; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack()			; Fire xD
	Setlog("End Dead Base Attack TEST")
EndFunc   ;==>AttackNowLB

; Auto Hide
Func chkAutoHide()
	If GUICtrlRead($chkAutoHide) = $GUI_CHECKED Then
		GUICtrlSetState($txtAutohideDelay, $GUI_ENABLE)
	Else
		GUICtrlSetState($txtAutohideDelay, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkAutoHide

; Color Shield Android
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

; Switch Profiles
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

	For $x = 0 To 8
		GUICtrlSetData($cmbAccount[$x], "", "")
	Next

	For $x = 0 To 8
		GUICtrlSetData($cmbAccount[$x], $profileString, "<No Profiles>")
	Next
EndFunc   ;==>setupProfileComboBoxswitch

; CoC Stats
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

; Forecast
Func cmbSwLang();Added Multi Switch Language by rulesss and kychera
 Switch GUICtrlRead($cmbSwLang)
	Case "EN"
		setForecast2()
	Case "RU"
		setForecast3()
	Case "FR"
		setForecast4()
	Case "DE"
		setForecast5()
	Case "ES"
		setForecast6()
	Case "IT"
		setForecast7()
	Case "PT"
		setForecast8()
	Case "IN"
		setForecast9()
 EndSwitch
EndFunc

; GUI Control for SimpleQuickTrain - Added by NguyenAnhHD
Global Const $grpTrainTroops2=$grpTrainTroopsGUI&"#"&$icnBarb&"#"&$txtLevBarb&"#"&$icnArch&"#"&$txtLevArch&"#"&$icnGiant&"#"&$txtLevGiant&"#"&$icnGobl&"#"&$txtLevGobl&"#"&$icnWall&"#"&$txtLevWall&"#"&$icnBall&"#"&$txtLevBall&"#"&$icnWiza&"#"&$txtLevWiza&"#"&$icnHeal&"#"&$txtLevHeal&"#"&$icnDrag&"#"&$txtLevDrag&"#"&$icnPekk&"#"&$txtLevPekk&"#"&$icnBabyD&"#"&$txtLevBabyD&"#"&$icnMine&"#"&$txtLevMine&"#"&$icnMini&"#"&$txtLevMini&"#"&$icnHogs&"#"&$txtLevHogs&"#"&$icnValk&"#"&$txtLevValk&"#"&$icnGole&"#"&$txtLevGole&"#"&$icnWitc&"#"&$txtLevWitc&"#"&$icnLava&"#"&$txtLevLava&"#"&$icnBowl&"#"&$txtLevBowl
Global Const $grpSimpleQT=$grpSimpleQuickTrain&"#"&$chkSimpleQuickTrain&"#"&$chkFillArcher&"#"&$txtFillArcher&"#"&$chkFillEQ&"#"&$chkTrainDonated
Func GUIControlForSimpleQTrain()
	If GUICtrlRead($hChk_UseQTrain) = $GUI_CHECKED Then
		_GUI_Value_STATE("SHOW", $hRadio_Army12 & "#" & $hRadio_Army123 & "#" & $grpSimpleQT)
		_GUI_Value_STATE("ENABLE", $hRadio_Army12 & "#" & $hRadio_Army123)
		_GUI_Value_STATE("HIDE", $LblRemovecamp & "#" & $icnRemovecamp & "#" & $grpTrainTroops & "#" & $grpTrainTroops2)
		_GUI_Value_STATE("ENABLE", $chkSimpleQuickTrain & "#" & $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
		chkSimpleQuickTrain()
	Else
		_GUI_Value_STATE("DISABLE", $hRadio_Army12 & "#" & $hRadio_Army123)
		_GUI_Value_STATE("HIDE", $hRadio_Army12 & "#" & $hRadio_Army123 & "#" & $grpSimpleQT)
		_GUI_Value_STATE("SHOW", $LblRemovecamp & "#" &  $icnRemovecamp & "#" & $grpTrainTroops & "#" & $grpTrainTroops2)
		_GUI_Value_STATE("DISABLE", $chkSimpleQuickTrain & "#" & $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
	EndIf
EndFunc		;==>GUIControlForSimpleQTrain - additional Control to Func chkUseQTrain()

Func chkSimpleQuickTrain()
	If GUICtrlRead($chkSimpleQuickTrain) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)

	Else
		_GUI_Value_STATE("DISABLE", $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
		_GUI_Value_STATE("UNCHECKED", $chkFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)

	EndIf
EndFunc   ;==>chkSimpleQuickTrain
; ======================== SimpleQuickTrain ========================

