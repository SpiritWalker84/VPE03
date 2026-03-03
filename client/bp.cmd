@echo off
setlocal

rem Default values
set "REGISTRY=85.198.96.71:5000"
set "IMAGE_NAME=fastapi-demo"
set "TAG=latest"

rem Allow overriding IMAGE_NAME and TAG via arguments
if not "%~1"=="" set "IMAGE_NAME=%~1"
if not "%~2"=="" set "TAG=%~2"

set "IMAGE=%REGISTRY%/%IMAGE_NAME%:%TAG%"

echo Building image %IMAGE% ...
docker build -t %IMAGE% .
if errorlevel 1 (
  echo Docker build failed.
  exit /b 1
)

echo Logging in to registry %REGISTRY% ...
docker login %REGISTRY%
if errorlevel 1 (
  echo Docker login failed.
  exit /b 1
)

echo Pushing image %IMAGE% ...
docker push %IMAGE%
if errorlevel 1 (
  echo Docker push failed.
  exit /b 1
)

echo Done.

endlocal

