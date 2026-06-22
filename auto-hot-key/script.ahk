; 修飾シンボルメモ
; +	(Shift)
; ^	(Control)
; !	(Alt)
; #	(Windowsロゴキー)
; key codeメモ
; SC07B （無変換）
; SC029（変換）

; 矢印キー(vim)
F13 & H::Send,{Blind}{Left}
F13 & L::Send,{Blind}{Right}
F13 & K::Send,{Blind}{Up}
F13 & J::Send,{Blind}{Down}

; かな切り替え（F13 + 無変換キー）
F13 & SC07B::SC029

; move home screen
^+H::Send,!{Home}

; AttacheCase
F13 & A::Run "C:\Program Files (x86)\AttacheCase4\AttacheCase.exe"

; bitwarden(shift + F13 + B)
F13 & B::
  if GetKeyState("Shift") {
    Run "C:\Users\rhoso\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
    return
  }

; brave(F13 + B)
; F13 & B::
Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
return

; docker
F13 & D::Run "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe"
return

; Everything
^+E::Run "C:\Program Files\Everything\Everything.exe"
return

; monitoring
F13 & M::Run "C:\Users\rhoso\Akabei Monitor\akamoni.exe"
return

; notion
F13 & N::Run "C:\Users\rhoso\AppData\Local\Programs\Notion\Notion.exe"
return

; spark
F13 & S::Run "C:\Users\rhoso\AppData\Local\Programs\SparkDesktop\Spark Desktop.exe"
return

; vscode
F13 & V::Run "C:\Users\rhoso\AppData\Local\Programs\Microsoft VS Code\Code.exe"
return

; windows terminal
F13 & T::Run "C:\Users\rhoso\AppData\Local\Microsoft\WindowsApps\wt.exe"
return
