const { TonClient, AggregationFn } = require("@tonclient/core");
const { libWeb, libWebSetup } = require("@tonclient/lib-web");
const config = require("../../config");

libWebSetup({
    binaryURL: "./tonclient.wasm",
});

TonClient.useBinaryLibrary(libWeb);
const client = new TonClient({
    network: {
        server_address: config.network,
    }
});

module.exports = {
    AggregationFn,
    client
}