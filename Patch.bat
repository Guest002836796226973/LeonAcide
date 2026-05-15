@echo off
chcp 65001>nul
color 60

title Léon Acide [EXP 2.0 ADDICTION]

:Chrome
color 60
echo.
echo =================================================================
echo          Patch pour navigateur Chrome et logs
echo.
echo   Un navigateur en roue libre !
echo   Réduction des caches et sans hameçonnage.
echo.
echo =================================================================
echo.
echo   [A] Activer le patch, [D] Désactiver :(
set /P Temps=• [A/D] :
if /I "%Temps%"=="A" goto patch_activer
if /I "%Temps%"=="D" goto patch_desactiver
goto invalidchoice

:patch_activer
color 47
takeown /F "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\*" /R /SKIPSL
takeown /F "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Content.IE5" /R /SKIPSL
takeown /F "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache" /R /SKIPSL
takeown /F "C:\Windows\Logs" /R /SKIPSL
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\*" /inheritance:R /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\BrowserMetrics-spare.pma" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Code Cache\js" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\CacheStorage" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\ScriptCache" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\GrShaderCache" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Content.IE5" /inheritance:D /T /Q
icacls "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache" /inheritance:D /T /Q
icacls "C:\Windows\Logs" /inheritance:R /T /Q
echo.
echo   ScriptCache Utilisateur
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\ScriptCache" /grant "BUILTIN\Users:(F)" /T /Q
echo.
echo   Patch activé.
echo.
echo   ^< Appuyez sur n'importe quelle touche ^>
pause>nul
goto Chrome

:patch_desactiver
color 47
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\BrowserMetrics" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\BrowserMetrics-spare.pma" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Code Cache\js" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\CacheStorage" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\ScriptCache" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\GrShaderCache" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\Content.IE5" /reset /T /Q
icacls "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache" /reset /T /Q
icacls "C:\Windows\Logs" /reset /T /Q
echo.
echo   Pacth désactivé.
echo.
echo   ^< Appuyez sur n'importe quelle touche ^>
pause>nul
goto Chrome

:invalidchoice
echo.
echo   ^< Numéro non valide, appuyez sur n'importe quelle touche ^>
pause>nul
goto Chrome
