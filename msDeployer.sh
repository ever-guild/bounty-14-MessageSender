set -o errexit
everdev se reset &> /dev/null
everdev network default se
everdev sol compile MSDeployer.sol

echo 'MSDeployer:'
everdev c deploy MSDeployer.abi.json --value 1000000000000 --data "salt:0" | grep deployed | xargs

everdev c r MSDeployer deployMS -i "amount:100000000000"  --data "salt:0" | grep value0 | xargs
everdev c l MSDeployer ms  --data "salt:0" 
