@ECHO OFF
SETLOCAL

SET "MAVEN_PROJECTBASEDIR=%~dp0"
IF "%MAVEN_PROJECTBASEDIR:~-1%"=="\" SET "MAVEN_PROJECTBASEDIR=%MAVEN_PROJECTBASEDIR:~0,-1%"

SET "MAVEN_HOME=%MAVEN_PROJECTBASEDIR%\.mvn\maven-3.9.6"
SET "MAVEN_BIN=%MAVEN_HOME%\bin\mvn.cmd"
SET "MAVEN_ZIP=%TEMP%\apache-maven-3.9.6-bin.zip"

IF NOT EXIST "%MAVEN_BIN%" (
  ECHO Downloading Maven 3.9.6...
  IF NOT EXIST "%MAVEN_HOME%" MKDIR "%MAVEN_HOME%"

  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.6/apache-maven-3.9.6-bin.zip' -OutFile '%MAVEN_ZIP%'"
  IF ERRORLEVEL 1 (
    ECHO Failed to download Maven distribution.
    EXIT /B 1
  )

  powershell -NoProfile -ExecutionPolicy Bypass -Command "$dest='%MAVEN_HOME%'; $zip='%MAVEN_ZIP%'; $tmp=Join-Path $env:TEMP ('maven-unzip-' + [guid]::NewGuid().ToString()); Expand-Archive -Path $zip -DestinationPath $tmp -Force; $src=Get-ChildItem -Path $tmp -Directory | Select-Object -First 1; if (-not $src) { throw 'Maven archive extraction failed.' }; Copy-Item -Path (Join-Path $src.FullName '*') -Destination $dest -Recurse -Force; Remove-Item -Path $tmp -Recurse -Force"
  IF ERRORLEVEL 1 (
    ECHO Failed to extract Maven distribution.
    EXIT /B 1
  )
)

CALL "%MAVEN_BIN%" %*
EXIT /B %ERRORLEVEL%
