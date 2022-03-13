import 'zx/globals'
$.verbose = false;
const network = 'http://localhost';

await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile TrinityRoot.sol`
await $`everdev js wrap TrinityRoot.sol`
await $`everdev js wrap MS.sol`
const { MSContract } = require("./MSContract")
const { TrinityRootContract } = require("./TrinityRootContract")
console.log('TrinitiRoot ' + (await $`everdev c deploy TrinityRoot.abi.json --value 10000000000000 --data MSDeployerCode:${TrinityRootContract.code},MScode:${MSContract.code} | grep deployed | xargs`).stdout)

console.log('MSDeployer Contract is deployed at address: ' + (await $`everdev c r TrinityRoot deployMSDeployer -i "amount:100000000000" --data MSDeployerCode:${TrinityRootContract.code},MScode:${MSContract.code}`).stdout.match(/"(0:[0-9abcdef]{64})/gm)[1].replace('"',''))