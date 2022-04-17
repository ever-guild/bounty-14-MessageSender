const { TonClient, AggregationFn } = require("@tonclient/core");
const { libWeb, libWebSetup } = require("@tonclient/lib-web");


libWebSetup({
    binaryURL: "./tonclient.wasm",
});

TonClient.useBinaryLibrary(libWeb);
const client = new TonClient({
    network: {
        server_address: "main.ton.dev",
    }
});

module.exports = {
    AggregationFn,
    client
}