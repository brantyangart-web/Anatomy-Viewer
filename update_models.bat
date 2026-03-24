@echo off
:: Make sure the script runs exactly in the folder it is located in
cd /d "%~dp0"

echo Generating models_list.js...
powershell -NoProfile -Command "$files = Get-ChildItem -Path 'models' -File | Where-Object { $_.Extension -match '\.gl(?:b|tf)$' } | Select-Object -ExpandProperty Name; if ($files -eq $null) { $files = @() } elseif ($files -is [string]) { $files = @($files) }; $filesString = $files | ConvertTo-Json -Compress; Out-File -FilePath 'models\models_list.js' -InputObject ('window.MODELS_LIST = ' + $filesString + ';') -Encoding utf8"
echo Done! Models list successfully updated.
pause
