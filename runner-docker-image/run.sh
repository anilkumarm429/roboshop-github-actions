#./config.sh --unattended --url https://github.com/anilkumarm429 --token AQ7WUZO4O5FOI6BWRRLNJ2DILAI2I --name container-1 --runnergroup default --work _work

if [ -z "${ORG}" ]; then echo Input ORG is missing ; exit 1 ; fi
if [ -z "${TOKEN}" ]; then echo Input TOKEN is missing ; exit 1 ; fi
if [ -z "${NAME}" ]; then echo Input NAME is missing ; exit 1 ; fi
./config.sh --unattended --url ${ORG} --token ${TOKEN} --name ${NAME} --runnergroup Default --work _work --replace
./run.sh
