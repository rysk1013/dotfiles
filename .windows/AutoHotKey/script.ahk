#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 修飾シンボルメモ
; +	Shift
; ^	Control
; !	Alt
; #	Windowsロゴキー

; 矢印キー(vim)
F13 & H::Send,{Blind}{Left}
F13 & L::Send,{Blind}{Right}
F13 & K::Send,{Blind}{Up}
F13 & J::Send,{Blind}{Down}

; ホームページ表示（ブラウザ）
F13 & M::Send,!{Home}

; Everythingの起動
^+E::Run C:\Program Files\Everything\Everything.exe
