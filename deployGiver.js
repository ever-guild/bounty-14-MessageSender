const { Account } = require("@tonclient/appkit");
const { TonClient, signerKeys, abiContract } = require("@eversdk/core");
const { libNode } = require("@eversdk/lib-node");
TonClient.useBinaryLibrary(libNode);

const endpoint = "https://rfld-dapp01.ds1.itgold.io";
const giverKeyPair = require('./GiverV2.keys.json');

const DefaultGiverContract = {
  abi: {
    "ABI version": 2,
    header: ["time", "expire"],
    functions: [
      {
        name: "sendTransaction",
        inputs: [
          {
            "name": "dest",
            "type": "address",
          },
          {
            "name": "value",
            "type": "uint128",
          },
          {
            "name": "bounce",
            "type": "bool",
          },
        ],
        outputs: [],
      },
      {
        name: "getMessages",
        inputs: [],
        outputs: [
          {
            components: [
              {
                name: "hash",
                type: "uint256",
              },
              {
                name: "expireAt",
                type: "uint64",
              },
            ],
            name: "messages",
            type: "tuple[]",
          },
        ],
      },
      {
        name: "upgrade",
        inputs: [
          {
            name: "newcode",
            type: "cell",
          },
        ],
        outputs: [],
      },
      {
        name: "constructor",
        inputs: [],
        outputs: [],
      },
    ],
    data: [],
    events: [],
  },
  tvc: "te6ccgECGgEAA9sAAgE0BgEBAcACAgPPIAUDAQHeBAAD0CAAQdgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAIm/wD0pCAiwAGS9KDhiu1TWDD0oQkHAQr0pCD0oQgAAAIBIAwKAfz/fyHtRNAg10nCAZ/T/9MA9AX4an/4Yfhm+GKOG/QFbfhqcAGAQPQO8r3XC//4YnD4Y3D4Zn/4YeLTAAGOEoECANcYIPkBWPhCIPhl+RDyqN4j+EL4RSBukjBw3rry4GUh0z/THzQx+CMhAb7yuSH5ACD4SoEBAPQOIJEx3rMLAE7y4Gb4ACH4SiIBVQHIyz9ZgQEA9EP4aiMEXwTTHwHwAfhHbpLyPN4CASASDQIBWBEOAQm46Jj8UA8B/vhBbo4S7UTQ0//TAPQF+Gp/+GH4Zvhi3tFwbW8C+EqBAQD0hpUB1ws/f5NwcHDikSCONyMjI28CbyLIIs8L/yHPCz8xMQFvIiGkA1mAIPRDbwI0IvhKgQEA9HyVAdcLP3+TcHBw4gI1MzHoXwPIghB3RMfighCAAAAAsc8LHyEQAKJvIgLLH/QAyIJYYAAAAAAAAAAAAAAAAM8LZoEDmCLPMQG5lnHPQCHPF5Vxz0EhzeIgyXH7AFswwP+OEvhCyMv/+EbPCwD4SgH0AMntVN5/+GcAxbkWq+f/CC3Rxt2omgQa6ThAM/p/+mAegL8NT/8MPwzfDFHDfoCtvw1OADAIHoHeV7rhf/8MTh8Mbh8Mz/8MPFvfCNJeRnJuPwzcXwAaPwhZGX//CNnhYB8JQD6AGT2qj/8M8AIBIBUTAde7Fe+TX4QW6OEu1E0NP/0wD0Bfhqf/hh+Gb4Yt76QNcNf5XU0dDTf9/XDACV1NHQ0gDf0SIiInPIcc8LASLPCgBzz0AkzxYj+gKAac9Acs9AIMki+wBfBfhKgQEA9IaVAdcLP3+TcHBw4pEggUAJKOLfgjIgG7n/hKIwEhAYEBAPRbMDH4at4i+EqBAQD0fJUB1ws/f5NwcHDiAjUzMehfA18D+ELIy//4Rs8LAPhKAfQAye1Uf/hnAgEgFxYAx7jkYYdfCC3Rwl2omhp/+mAegL8NT/8MPwzfDFvamj8IXwikDdJGDhvXXlwMvwAfCFkZf/8I2eFgHwlAPoAZPaqfAeQfYIQaHaPdqn4ARh8IWRl//wjZ4WAfCUA+gBk9qo//DPACAtoZGAAtr4QsjL//hGzwsA+EoB9ADJ7VT4D/IAgAdacCHHAJ0i0HPXIdcLAMABkJDi4CHXDR+S8jzhUxHAAJDgwQMighD////9vLGS8jzgAfAB+EdukvI83o",
};


async function main(client) {
  try {
    const giverContract = new Account(DefaultGiverContract, {
      signer: signerKeys(giverKeyPair),
      client,
      initData: {}
    });
    console.log('giver address', await giverContract.getAddress());
    console.log(await giverContract.deploy({ useGiver: false }));
  } catch (e) {
    console.log(e);
  }
  process.exit(0);
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
