@echo off
setlocal enabledelayedexpansion
rem Sobe um commit numerado com todas as alteracoes do repositorio desta pasta.
cd /d "%~dp0"

rem Sem alteracoes: nao cria commit nem consome numero
set "ALTERADO="
for /f "delims=" %%i in ('git status --porcelain') do set "ALTERADO=1"
if not defined ALTERADO (
    echo Nenhuma alteracao para commitar.
    echo.
    pause
    exit /b 0
)

rem Numero do commit = total de commits atuais + 1
set "TOTAL=0"
for /f %%i in ('git rev-list --count HEAD 2^>nul') do set "TOTAL=%%i"
set /a NUM=TOTAL+1

git add .
git commit -m "indexador de commit !NUM!"
git push

echo.
pause
