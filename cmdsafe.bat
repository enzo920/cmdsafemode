@echo off
title Command Prompt (Safety Gear Mode)
echo To learn more about command prompt safe mode, type cmdsafehlp. Go online for more details.
ver
echo (c) Microsoft Corporation. All rights reserved.
goto start

:start
echo.
set /p command="%cd%>"
if /i "%command:~0,3%" == "del" goto warning
if /i "%command:~0,6%" == "icacls" goto warning
if /i "%command:~0,5%" == "start" goto warning
if /i "%command:~0,3%" == "ren" goto warning
if /i "%command:~0,8%" == "taskkill" goto warning
if /i "%command:~0,5%" == "rmdir" goto warning
if "%command%" == "cmdsafehelp" goto info

goto doit

:doit
%command%
goto start

:warning
echo.
echo WARNING! You are about to run "%command%". This is an dangerous command. Make sure that this is what you want to run. Confirm?
set /p choice="Enter your choice (0 = No, 1 = Yes): "
if "%choice%" == "0" goto start
if "%choice%" == "1" goto doit
goto warning

:info
echo Command Prompt Safe Mode helps users prevent harmful actions to your computer. It helps you protect this computer's operating system, your personal info, and much more by warning you if you do certain commands that can affect this computer and/or your data. To exit this mode, type "quitsafemode".
goto start
