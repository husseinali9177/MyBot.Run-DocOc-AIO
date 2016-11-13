; #FUNCTION# ====================================================================================================================
; Name ..........: GUIControl
; Description ...: This file contains all functions of GUIControl of the @RoroTiti's MOD
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

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
