@echo off
REM ---------------------------------------------------------
REM Brute Force Numeric Password cracker
REM ++++++++++++++++++++++++++++++++++++
REM https://github.com/thecodeisclear/numeric-brute-7z
REM This code is provided as-is without any warranty. While
REM sufficient testing has been done on the piece of code
REM it is advised to backup any data prior to execution
REM ---------------------------------------------------------
setlocal enableDelayedExpansion


set starttime=%date%_%time%
REM change the path to the location of 7z.exe. Below path is an example
REM from the 7zip portable app
set PATH=D:\Prog\7z\App\7-Zip;%PATH%
REM change the archive name to point to the file of your choice
set archive=sample.7z
REM change the file2xtr to a sample file from the input archive
REM by attempting to extract only 1 file, the process is much faster
REM if the input file is within a folder in the archive, include it 
REM in the folder variable and the filename in file2xtr
set file2xtr=sample.txt
REM folder will be blank unless the sample file to extract lies within
REM a folder of the archive ending with a \
set "folder="
REM starting counter for the script
set strtNum=0
REM ending counter for the script
set endNum=999

REM -----------------
REM Do not edit below
REM -----------------


for /L %%X in (%strtNum%, 1, %endNum%) do (

	7Z E %archive% %folder%%file2xtr% -P%%X >nul 2>&1
	if exist %file2xtr% (
		call filesize.bat %file2xtr% %%X
		if exist %file2xtr% (
			echo .
			echo - - - - - - - - - - - - - Password found: %%X
			echo .
			goto END
		)
	)
	
)
echo : : : : : : : : : : : : : Password not found. Please try with a different range
echo .
:END
echo Started @ %starttime%
echo Finished @ %date%_%time%
