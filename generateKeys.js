const path = require('path');
const fs = require('fs');
const { TonClient } = require("@eversdk/core");
const { libNode } = require("@eversdk/lib-node");
TonClient.useBinaryLibrary(libNode);

// Generate Giver key pair
(async () => {
    const client = new TonClient();
    const { phrase } = await client.crypto.mnemonic_from_random({
        dictionary: 1,//english
        word_count: 12,
    });

    const keyPair = await client.crypto.mnemonic_derive_sign_keys({
        phrase,
        path: "m/44'/396'/0'/0/0",// See https://medium.com/myetherwallet/hd-wallets-and-derivation-paths-explained-865a643c7bf2
        dictionary: 1, //English
        word_count: 12,
    });
    fs.writeFileSync(path.join(__dirname, "GiverV2.keys.json"), JSON.stringify(keyPair, 0, 4));

    console.log(`Giver keyPair:`);
    console.log(keyPair);
    console.log("KeyPair saved to GiverV2.keys.json");
    client.close();
})()
