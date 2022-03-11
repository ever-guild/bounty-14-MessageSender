set -o errexit
everdev se reset &> /dev/null
everdev network default se
everdev sol compile TrinityRoot.sol

echo 'Trinity root:'
everdev c deploy TrinityRoot.abi.json --value 10000000000000 --data "salt:777" 

echo 'deployMSDeployer:'
everdev c r TrinityRoot deployMSDeployer -i "amount:1000000000000" --data "salt:777" 

#next use address
#tonos-cli --url http://localhost call 0:ed0eba49e29cc886f55cf83540e5b078106b979b4d4c503026b0ebc0dcdc4c1e deployMS '{"amount":100000000000}' --abi MSDeployer.abi.json