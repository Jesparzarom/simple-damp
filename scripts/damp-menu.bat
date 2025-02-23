@echo off
:menu
cls
echo ==================================
echo DAMP Enviroment
echo ==================================
echo 1. Iniciar servidor
echo 2. Detener servidor
echo 3. Reiniciar servidor
echo 4. Acceder a la terminal del servidor
echo 5. Acceder a la terminal de MySQL
echo 6. Acceder a phpMyAdmin
echo 7. Acceder a php info
echo 8. Salir
echo ==================================
set /p choice="Seleccione opcion: "

if "%choice%"=="1" goto start
if "%choice%"=="2" goto stop
if "%choice%"=="3" goto restart
if "%choice%"=="4" goto shell
if "%choice%"=="5" goto mysql
if "%choice%"=="6" goto phpmyadmin
if "%choice%"=="7" goto phpinfo
if "%choice%"=="8" exit
if "%choice%"=="exit" exit


:start
cd /d "%~dp0.."
docker-compose -f docker-compose.yml up -d
pause
goto menu

:stop
cd /d "%~dp0.."
docker-compose -f docker-compose.yml down
pause
goto menu

:restart
cd /d "%~dp0.."
docker-compose -f docker-compose.yml restart
pause
goto menu

:shell
echo ""
echo ===========================
echo PHP Apache Enviroment Shell
echo ===========================
echo Escribe 'exit' para salir
echo ""
docker exec -it php-apache bash
pause
goto menu

:mysql
echo ""
echo ======================
echo MySQL Enviroment Shell
echo =======================
echo Escribe 'exit' para salir
echo ""
docker exec -it mysql mysql -u root -p
pause
goto menu

:phpmyadmin
@echo off
start http://localhost:8081
pause
goto menu

:phpinfo
@echo off
start http://localhost:8080
pause
goto menu