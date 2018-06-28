echo off

taskkill /f /im opcview.exe
taskkill /f /im opcgate.exe

e:\IMSK\C++Builder\TESTOPC_GORIZONT_SERVER\GorizontServer_OPC_022018\\OPCGate.exe -u

rem %cd%\OPCGate.exe -u

pause