@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem Inicializa os contadores
set corretas=0
set erradas=0

:inicio
cls
rem Gera números aleatórios entre 0 e 10
set /a num1=%random% %% 11
set /a num2=%random% %% 11

rem Calcula o produto
set /a resultado=num1 * num2

rem Pergunta ao usuário
echo Qual é o resultado de %num1% x %num2%?
set /p resposta=

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
