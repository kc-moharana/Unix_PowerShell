:: =========================================
:: This will combine all PDFs at commandline into a single PDF using Ghostscript 9.54.0 (2021-03-30).
:: =========================================

@echo off
if %~1 == -h goto usage
SET commandline=%* 
SET OUT_PDF=""
SET IN_PDF=""

for %%a in (%commandline%) do ( 
::   echo %%a       
	set /A length_argv=length_argv+1 
	Set OUT_PDF=%%a
)

IF %length_argv% LSS 3 ( 
 echo. 
 echo Error: Expected at least 3 input files, got %length_argv% 
 echo 'Use -h option to see usage!!'  
 exit 
)

set last=""
for %%a in (%commandline%) do (	
	SETLOCAL ENABLEDELAYEDEXPANSION	
	if %OUT_PDF% neq %%a (
	 set last=%%a
	 if !IN_PDF!=="" (set IN_PDF=!last!) else ( SET IN_PDF=!IN_PDF! !last! )	 
	)
)
ENDLOCAL & set "last=%last%" & set "IN_PDF=%IN_PDF%"

:: echo "-- %IN_PDF%"
::echo %length_argv%
echo. 
echo Inputs: %IN_PDF%
echo Output %OUT_PDF%
echo. 
IF EXIST %OUT_PDF%.pdf ( del %OUT_PDF%.pdf )
echo. 
echo gswin64c -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=%OUT_PDF%.pdf %IN_PDF%
gswin64c -dNumRenderingThreads=2 -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=%OUT_PDF%.pdf %IN_PDF%
exit


:usage
	echo Combine multiple PDFs at commandline into a single PDF using Ghostscript 9.54.0 (2021-03-30).
	echo Usage:: combinepdf IN_PDF_1 IN_PDF_2 IN_PDF_3...IN_PDF_N OUT_PDF_prefix
	exit
:tag1
	echo tag
