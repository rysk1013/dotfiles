; 修飾シンボルメモ
; +	(Shift)
; ^	(Control)
; !	(Alt)
; #	(Windowsロゴキー)

; 矢印キー(vim)
F13 & H::Send,{Blind}{Left}
F13 & L::Send,{Blind}{Right}
F13 & K::Send,{Blind}{Up}
F13 & J::Send,{Blind}{Down}

; move home screen
F13 & M::Send,!{Home}

; bitwarden(shift + F13 + B)
F13 & B::
  if GetKeyState("Shift") {
    Run "C:\Users\{user name}\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
    return
  }

; brave(F13 + B)
; F13 & B::
Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
return

; docker
F13 & D::Run "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe"
return

; notion
F13 & N::Run "C:\Users\{user name}\AppData\Local\Programs\Notion\Notion.exe"
return

; spark
F13 & S::Run "C:\Users\{user name}\AppData\Local\Programs\SparkDesktop\Spark Desktop.exe"
return

; windows terminal
F13 & T::Run "C:\Users\{user name}\AppData\Local\Microsoft\WindowsApps\wt.exe"
return

; vscode
F13 & V::Run "C:\Users\{user name}\AppData\Local\Programs\Microsoft VS Code\Code.exe"
return

; Everything
^+E::Run "C:\Program Files\Everything\Everything.exe"
return
