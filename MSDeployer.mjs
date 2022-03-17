import 'zx/globals'
$.verbose = false;
const network = 'http://localhost';
const networkName = 'rfld'

await $`everdev se reset &> /dev/null`
await $`everdev network default ${networkName}`

await $`everdev sol compile MS.sol`
await $`everdev js wrap MS.sol`
const { MSContract } = require("./MSContract")
await $`everdev sol compile MSDeployer.sol`
const MSDepoloyer = (await $`everdev c deploy MSDeployer.abi.json --value 1000000000000 --data msCode:${MSContract.code} | grep deployed | xargs`).stdout;
console.log(MSDepoloyer);
await $`everdev c r MSDeployer deployMS -i "amount:100000000000" --data msCode:${MSContract.code}`;
const msAddresses = (await $`everdev c l MSDeployer ms --data msCode:${MSContract.code}`).stdout.match(/"(0:[0-9abcdef]{64})/gm).map(a => a.replace('"', ''));
console.log('ms contracts deployed: \n' + msAddresses.join("\n"));

// while (true) {
//     const answer =  await question('Choose mode variable (mode1, mode2, log, exit): ', {
//         choices: [/*'mode0',*/ 'mode1', 'mode2', 'log', 'exit']
//       })
//     console.log(answer)
//     // if (answer == 'mode0') {
//     //     await $`tonos-cli --url ${network} call ${msAddresses[0]} mode0 '{}' --abi ./MS.abi.json`
//     // }
//     if (answer == 'mode1') {
//         await $`tonos-cli --url ${network} call ${msAddresses[0]} mode1 '{"_srcTime":0,"_srcShardNumber":0}' --abi ./MS.abi.json`
//     }
//     if (answer == 'mode2') {
//         await $`tonos-cli --url ${network} call ${msAddresses[0]} mode2 '{"_srcTime":0,"_srcShardNumber":0}' --abi ./MS.abi.json`
//     }
//     if (answer == 'log') {
//        console.log((await $`tonos-cli --url ${network} run ${msAddresses[0]} dbLog '{}' --abi ./MS.abi.json`).stdout)
//     }
//     if (answer == 'exit') {
//         break;
//     }
// }


//$`rm *.tvc *.abi.json`