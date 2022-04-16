const { Account } = require("@tonclient/appkit");
const { TonClient, signerKeys } = require("@eversdk/core");
const { libNode } = require("@eversdk/lib-node");

TonClient.useBinaryLibrary(libNode);

const { TrinityRootContract } = require("./artifacts/TrinityRootContract.js");
const { MSDeployerContract } = require("./artifacts/MSDeployerContract.js");
const { MSContract } = require("./artifacts/MSContract.js");

const {GetGiverAddress} = require("./giver.js");

const config = require("./config.json");

const KeyPair = require("./GiverV2.keys.json");
const endpoint = config.endpoint;

async function main(client) {
  try {
    const giverAddress = await GetGiverAddress(client);
    const trinityRoot = new Account(TrinityRootContract, {
      signer: signerKeys(KeyPair),
      client,
      initData: {
        MSCode: MSContract.code,
        MSDeployerCode: MSDeployerContract.code,
        salt: 0
      }
    });
    await trinityRoot.run('withdraw', {_to: giverAddress}, {});

    console.log('Withdraw successful')
  } catch (e) {
    console.error(e);
  }
}

(async () => {
  const client = new TonClient({
    network: {
      endpoints: [ endpoint ]
    }
  });
  try {
    console.log("Hello TON!", endpoint);
    await main(client);
    process.exit(0);
  } catch (error) {
    if (error.code === 504) {
      console.error(`Network is inaccessible. You have to start TON OS SE using \`tondev se start\`.\n If you run SE on another port or ip, replace http://localhost endpoint with http://localhost:port or http://ip:port in index.js file.`);
    } else {
      console.error(error);
    }
  }
  client.close();
})();

function sleep(seconds) {
  return new Promise(function (resolve) {
    setTimeout(resolve, seconds * 1000);
  })
};

function assert(condition, error) {
  if (!condition) {
    throw new Error(error);
  }
}


