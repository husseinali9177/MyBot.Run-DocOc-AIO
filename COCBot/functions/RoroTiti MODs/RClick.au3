; #FUNCTION# ====================================================================================================================
; Name ..........: Random Click
; Description ...: This file contains all functions of @RoroTiti's Random Click feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: 29/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
;				   Because this file is a part of an open-sourced project, I allow all MODders and DEVelopers to use these functions.
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

; ================================================== RANDOM CLICK PART ================================================== ;

Func Click($x, $y, $times = 1, $speed = 0, $debugtxt = "")

; !!! Not original function but randomization calculation which is linked to original function renamed FClick !!!
; !!! Still compatible with all original function parameters !!!

	$xmin = $x - 5
	$xmax = $x + 5
	$ymin = $y - 5
	$ymax = $y + 5
	$xclick = Random($xmin, $xmax)
	$yclick = Random($ymin, $ymax)
	If $xclick < 0 Or $xclick > 860 Then $xclick = $x ; Out Of Screen protection
	If $yclick < 0 Or $yclick > 680 + ($bottomOffsetY) Then $yclick = $y ; Out Of Screen protection
	FClick($xclick, $yclick, $times, $speed, $debugtxt)

EndFunc   ;==>Click

Func PureClick($x, $y, $times = 1, $speed = 0, $debugtxt = "")

; !!! Not original function but randomization calculation which is linked to original function renamed FPureClick !!!
; !!! Still compatible with all original function parameters !!!

	$xmin = $x - 5
	$xmax = $x + 5
	$ymin = $y - 5
	$ymax = $y + 5
	$xclick = Random($xmin, $xmax)
	$yclick = Random($ymin, $ymax)
	If $xclick < 0 Or $xclick > 860 Then $xclick = $x ; Out Of Screen protection
	If $yclick < 0 Or $yclick > 680 + ($bottomOffsetY) Then $yclick = $y ; Out Of Screen protection
	FPureClick($xclick, $yclick, $times, $speed, $debugtxt)

EndFunc   ;==>PureClick

Func GemClick($x, $y, $times = 1, $speed = 0, $debugtxt = "")

; !!! Not original function but randomization calculation which is linked to original function renamed FGemClick !!!
; !!! Still compatible with all original function parameters !!!

	$xmin = $x - 5
	$xmax = $x + 5
	$ymin = $y - 5
	$ymax = $y + 5
	$xclick = Random($xmin, $xmax)
	$yclick = Random($ymin, $ymax)
	If $xclick < 0 Or $xclick > 860 Then $xclick = $x ; Out Of Screen protection
	If $yclick < 0 Or $yclick > 680 + ($bottomOffsetY) Then $yclick = $y ; Out Of Screen protection
	FGemClick($xclick, $yclick, $times, $speed, $debugtxt)

EndFunc   ;==>GemClick

Func randomSleep($SleepTime, $Range = 0)

	If $Range = 0 Then $Range = Round($SleepTime / 5)
	$SleepMin = $SleepTime - $Range
	$SleepMax = $SleepTime + $Range
	$SleepTimeF = Random($SleepMin, $SleepMax)
	If $DebugClick = 1 Then Setlog("Default sleep : " & $SleepTime & " - Random sleep : " & $SleepTimeF, $COLOR_ORANGE)
	_Sleep($SleepTimeF)

EndFunc   ;==>randomSleep
