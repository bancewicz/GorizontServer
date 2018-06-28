@echo off

rem register OPC server
rem Win Wista & Win 7 - start from superuser only!!!
e:\IMSK\C++Builder\TESTOPC_GORIZONT_SERVER\GorizontServer_OPC\OPCGate -r

rem start test application
start e:\IMSK\C++Builder\TESTOPC_GORIZONT_SERVER\GorizontServer_OPC\GorizontServer

rem refresh tags list
e:\IMSK\C++Builder\TESTOPC_GORIZONT_SERVER\GorizontServer_OPC\OPCGate -t

rem start OPC viewer
start e:\IMSK\C++Builder\TESTOPC_GORIZONT_SERVER\GorizontServer_OPC\OPCView OPC.OPCGate.Gorizon
