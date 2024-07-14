@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem Inicializa os contadores
set corretas=0
set erradas=0

echo Bem-vindo ao jogo de multiplicação!
echo Insira "sair" para encerrar o programa a qualquer momento.
pause

:inicio
cls
rem Gera números aleatórios entre 0 e 10
set /a num1=%random% %% 11
set /a num2=%random% %% 11

rem Calcula o produto
set /a resultado=num1 * num2

rem Pergunta ao usuário
echo Qual é o resultado de %num1% x %num2%? (Digite 'sair' para encerrar)
set /p resposta=

rem Verifica se o usuário deseja sair
if /i "%resposta%"=="sair" (
    goto fim
)

rem Verifica se a resposta é um número
for /f "delims=0123456789" %%a in ("%resposta%") do (
    echo Entrada inválida! Por favor, insira um número.
    pause
    goto inicio
)

rem Verifica se a resposta está correta
if %resposta%==%resultado% (
    echo Correto!
    set /a corretas+=1
) else (
    echo Errado! A resposta correta é %resultado%.
    set /a erradas+=1
)

rem Mostra os contadores
echo.
echo Respostas corretas: %corretas%
echo Respostas erradas: %erradas%
echo.
pause

goto inicio

:fim
echo.
echo Jogo encerrado. 
echo Respostas corretas: %corretas%
echo Respostas erradas: %erradas%
echo.
pause
endlocal
exit
