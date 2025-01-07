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

; 矢印キー(Mac)
; F13 & B::Send,{Blind}{Left}
; F13 & F::Send,{Blind}{Right}
; F13 & P::Send,{Blind}{Up}
; F13 & N::Send,{Blind}{Down}

; backspaceキー(sc027=セミコロン)
F13 & sc027::Send,{Backspace}

; alt + homeキー
F13 & M::Send,!{Home}

; 半角全角切り替え
; F13 & F::Send,{vkF3sc029}

; Raptureの起動・終了
; Alt+QにRaptureの呼び出し割り当て
!q::run "C:\Users\0829r\AppData\Local\rapture-2.4.1\rapture.exe"
Return

; Raptureが起動している間、Escを2回押したら無効化する
#IfWinActive ahk_exe rapture.exe
  Esc::
    Keywait, Esc, U
    Keywait, Esc, D T0.2
    If (ErrorLevel=0)
    {
      WinClose ahk_exe rapture.exe
    }
  Return
#IfWinActive

; Everythingの起動
^+E::Run C:\Program Files\Everything\Everything.exe

; PatchMyPCの起動
; ^+P::Run C:\Users\0829r\PatchMyPC\patch-my-pc-4-5-0-4.exe
