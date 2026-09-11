Add-Type -AssemblyName System.Drawing

$src = 'C:\Users\Pc\AppData\Local\Temp\codex-clipboard-cb289593-523d-4801-bee9-81bb08d62f68.png'
$dst = 'C:\Users\Pc\Documents\volverAaprender\codex-voice-button-annotated.png'

$img = [System.Drawing.Image]::FromFile($src)
$g = [System.Drawing.Graphics]::FromImage($img)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$red = [System.Drawing.Color]::FromArgb(255, 255, 55, 55)
$pen = New-Object System.Drawing.Pen($red, 6)
$g.DrawRectangle($pen, 292, 38, 180, 40)

$arrowPen = New-Object System.Drawing.Pen($red, 8)
$arrowPen.EndCap = [System.Drawing.Drawing2D.LineCap]::ArrowAnchor
$g.DrawLine($arrowPen, 650, 145, 475, 70)

$font = New-Object System.Drawing.Font('Arial', 26, [System.Drawing.FontStyle]::Bold)
$brush = New-Object System.Drawing.SolidBrush($red)
$g.FillRectangle($brush, 650, 128, 180, 46)
$white = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$g.DrawString('HAZ CLIC AQUI', $font, $white, 660, 135)

$img.Save($dst, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $img.Dispose(); $pen.Dispose(); $arrowPen.Dispose(); $font.Dispose(); $brush.Dispose(); $white.Dispose()
Write-Output $dst
