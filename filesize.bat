@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
REM Windows Batch Script file that checks for a non-empty file
REM Usage:
REM - Must be called from another batch program (numbrute.bat) with
REM   %1 (first parameter) contains the filename whose size is to be checked

set minbytesize=0

FOR %%A IN (%1) DO set size=%%~zA
if %size% GTR %minbytesize% (
	echo Filesize %size% bytes
) else (
	del %1
)
