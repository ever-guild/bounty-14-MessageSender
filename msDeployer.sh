set -o errexit
everdev se reset &> /dev/null
everdev network default se
everdev sol compile MSDeployer.sol

echo 'MSDeployer:'
everdev c deploy MSDeployer.abi.json --value 1000000000000 --data "salt:0" | grep deployed | xargs

everdev c r MSDeployer deployMS -i "amount:100000000000"  --data "salt:0" | grep value0 | xargs
everdev c l MSDeployer ms --data "salt:0"  
everdev c l MSDeployer s --data "salt:0"   

#how to run
#tonos-cli --url http://localhost  call 0:3b1ed523fa9f3aa28ecf02566f23fcd857752617dc4f8b244925b46e789c53af mode1 '{}' --abi MS.abi.json
