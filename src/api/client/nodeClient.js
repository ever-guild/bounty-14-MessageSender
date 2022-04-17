const { TonClient, AggregationFn } = require("@tonclient/core");
const { libNode } = require("@tonclient/lib-node");

TonClient.useBinaryLibrary(libNode)

const client = new TonClient({
    network: {
        server_address: "net.ton.dev",
    }
});

module.exports = {
    AggregationFn,
    client
}