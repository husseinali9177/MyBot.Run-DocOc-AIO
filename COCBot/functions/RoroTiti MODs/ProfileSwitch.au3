; #FUNCTION# ====================================================================================================================
; Name ..........: ProfileSwitch
; Description ...: This file contains all functions of ProfileSwitch feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: ---
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func ProfileSwitch()
	If $ichkGoldSwitchMax = 1 Or $ichkGoldSwitchMin = 1 Or $ichkElixirSwitchMax = 1 Or $ichkElixirSwitchMin = 1 Or _
			$ichkDESwitchMax = 1 Or $ichkDESwitchMin = 1 Or $ichkTrophySwitchMax = 1 Or $ichkTrophySwitchMin = 1 Then
		Local $SwitchtoProfile = ""
		While True
			If $ichkGoldSwitchMax = 1 Then
				If Number($g_iGoldCurrent[$CurrentAccount]) >= Number($itxtMaxGoldAmount) Then
					$SwitchtoProfile = $icmbGoldMaxProfile
					Setlog("Village Gold detected Above Gold Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkGoldSwitchMin = 1 Then
				If Number($g_iGoldCurrent[$CurrentAccount]) < Number($itxtMinGoldAmount) And Number($g_iGoldCurrent[$CurrentAccount]) > 1 Then
					$SwitchtoProfile = $icmbGoldMinProfile
					Setlog("Village Gold detected Below Gold Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkElixirSwitchMax = 1 Then
				If Number($g_iElixirCurrent[$CurrentAccount]) >= Number($itxtMaxElixirAmount) Then
					$SwitchtoProfile = $icmbElixirMaxProfile
					Setlog("Village Gold detected Above Elixir Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkElixirSwitchMin = 1 Then
				If Number($g_iElixirCurrent[$CurrentAccount]) < Number($itxtMinElixirAmount) And Number($g_iElixirCurrent[$CurrentAccount]) > 1 Then
					$SwitchtoProfile = $icmbElixirMinProfile
					Setlog("Village Gold detected Below Elixir Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkDESwitchMax = 1 Then
				If Number($g_iDarkCurrent[$CurrentAccount]) >= Number($itxtMaxDEAmount) Then
					$SwitchtoProfile = $icmbDEMaxProfile
					Setlog("Village Dark Elixir detected Above Dark Elixir Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkDESwitchMin = 1 Then
				If Number($g_iDarkCurrent[$CurrentAccount]) < Number($itxtMinDEAmount) And Number($g_iDarkCurrent[$CurrentAccount]) > 1 Then
					$SwitchtoProfile = $icmbDEMinProfile
					Setlog("Village Dark Elixir detected Below Dark Elixir Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkTrophySwitchMax = 1 Then
				If Number($g_iTrophyCurrent[$CurrentAccount]) >= Number($itxtMaxTrophyAmount) Then
					$SwitchtoProfile = $icmbTrophyMaxProfile
					Setlog("Village Trophies detected Above Throphy Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			If $ichkTrophySwitchMin = 1 Then
				If Number($g_iTrophyCurrent[$CurrentAccount]) < Number($itxtMinTrophyAmount) And Number($g_iTrophyCurrent[$CurrentAccount]) > 1 Then
					$SwitchtoProfile = $icmbTrophyMinProfile
					Setlog("Village Trophies detected Below Trophy Profile Switch Conditions")
					Setlog("It's time to switch profile")
					ExitLoop
				EndIf
			EndIf
			ExitLoop
		WEnd

		If $SwitchtoProfile <> "" Then
			TrayTip(" Profile Switch Village Report!", "Gold: " & _NumberFormat($g_iGoldCurrent[$CurrentAccount]) & "; Elixir: " & _NumberFormat($g_iElixirCurrent[$CurrentAccount]) & "; Dark: " & _NumberFormat($g_iDarkCurrent[$CurrentAccount]) & "; Trophy: " & _NumberFormat($g_iTrophyCurrent[$CurrentAccount]), "", 0)
			If FileExists(@ScriptDir & "\Audio\SwitchingProfiles.wav") Then
				SoundPlay(@ScriptDir & "\Audio\SwitchingProfiles.wav", 1)
			ElseIf FileExists(@WindowsDir & "\media\tada.wav") Then
				SoundPlay(@WindowsDir & "\media\tada.wav", 1)
			EndIf

			_GUICtrlComboBox_SetCurSel($cmbProfile, $SwitchtoProfile)
			cmbProfile()
			If _Sleep(2000) Then Return
			runBot()
		EndIf
	EndIf

EndFunc   ;==>ProfileSwitch
