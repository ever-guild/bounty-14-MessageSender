set -o errexit
everdev se reset &> /dev/null
everdev network default se
everdev sol compile MSDeployer.sol

echo 'MSDeployer:'
everdev c deploy MSDeployer.abi.json --value 1000000000000 | grep deployed | xargs

everdev c r MSDeployer deployMS -i "amount:100000000000" | grep value0 | xargs
everdev c r MSDeployer calculateAddress | grep value0 | xargs

