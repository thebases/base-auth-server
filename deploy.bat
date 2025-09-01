@ECHO OFF
SET SERVICE_NAME="base_cas_auth"
SET SERVER_NAME="base_40"
SET DEPLOY_PATH="/opt/base_cas_auth"
SET SERVICE_USER="thebase"
ssh %SERVER_NAME% "service %SERVICE_NAME% stop"
scp base_cas.tar %SERVER_NAME%:/opt/
ssh %SERVER_NAME% "cd /opt &&  tar -xvf base_cas.tar && sudo chmod +x %DEPLOY_PATH%/base_cas_auth_linux && sudo chown %SERVICE_USER%:%SERVICE_USER% %DEPLOY_PATH% -R"
ssh %SERVER_NAME% "service %SERVICE_NAME% restart && journalctl -f -u %SERVICE_NAME%"
