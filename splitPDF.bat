:: =========================================
:: This will split PDF at commandline into a multiple PDFs using Ghostscript 9.54.0 (2021-03-30).
:: =========================================


@echo off
chcp 65001
setlocal enabledelayedexpansion

:start

echo Splitting "%~n1%~x1" into standalone single pages...
cd %~d1%~p1
rem getting number of pages of PDF with GhostScript
for /f "usebackq delims=" %%a in (`gswin64c.exe -q -dNODISPLAY -dNOSAFER --permit-file-read="%~n1%~x1" -c "(%~n1%~x1) (r) file runpdfbegin pdfpagecount = quit"`) do set "numpages=%%a"

for /L %%n in (1,1,%numpages%) do (
echo Extracting page %%n of %numpages%...
set "x=00%%n"
set "x=!x:~-3!"
gswin64c.exe -dNumRenderingThreads=2 -dBATCH -dNOPAUSE -dQUIET -dFirstPage=%%n -dLastPage=%%n -sDEVICE=pdfwrite -sOutputFile="%~d1%~p1%~n1-!x!.pdf" "%1"
)

shift
if NOT x%1==x goto start

pause
