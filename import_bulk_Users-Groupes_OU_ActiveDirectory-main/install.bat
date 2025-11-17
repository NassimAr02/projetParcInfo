@echo off
cls
mkdir c:\scripts
copy *.* c:\scripts
cd .. 
cd c:\scripts
start powershell
rem ls
rem @rd /s /q %userprofile%\import_bulk_Users-Groupes_OU_ActiveDirectory
