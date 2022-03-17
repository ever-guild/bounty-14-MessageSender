const TrinityRootContract = {
    abi: {
        "ABI version": 2,
        "version": "2.2",
        "header": [
            "time"
        ],
        "functions": [
            {
                "name": "deployMSDeployer",
                "inputs": [
                    {
                        "name": "amount",
                        "type": "uint128"
                    }
                ],
                "outputs": [
                    {
                        "name": "value0",
                        "type": "address"
                    }
                ]
            },
            {
                "name": "constructor",
                "inputs": [],
                "outputs": []
            }
        ],
        "data": [
            {
                "key": 1,
                "name": "MSDeployerCode",
                "type": "cell"
            },
            {
                "key": 2,
                "name": "MScode",
                "type": "cell"
            }
        ],
        "events": [],
        "fields": [
            {
                "name": "_pubkey",
                "type": "uint256"
            },
            {
                "name": "_timestamp",
                "type": "uint64"
            },
            {
                "name": "_constructorFlag",
                "type": "bool"
            },
            {
                "name": "MSDeployerCode",
                "type": "cell"
            },
            {
                "name": "MScode",
                "type": "cell"
            }
        ]
    },
    tvc: "te6ccgECFQEAAi4AAgE0AwEBAcACAEPQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgBCSK7VMg4wMgwP/jAiDA/uMC8gsSBQQUAoTtRNDXScMB+GYh2zzTAAGfgQIA1xgg+QFY+EL5EPKo3tM/AfhDIbnytCD4I4ED6KiCCBt3QKC58rT4Y9MfAds88jwJBgNK7UTQ10nDAfhmItDXCwOpOADcIccA4wIh1w0f8rwh4wMB2zzyPBERBgIoIIIQW1sqJrrjAiCCEGi1Xz+64wIMBwIiMPhCbuMA+Ebyc9H4ANs88gAJCAAo+Ev4SvhD+ELIy//LP8+DzMzJ7VQCFu1E0NdJwgGOgOMNChACVHDtRND0BXEhgED0D46A33IigED0D46A3/hr+GqAQPQO8r3XC//4YnD4YwsLAQKIFANyMPhG8uBM+EJu4wDTf9HbPCGOHyPQ0wH6QDAxyM+HIM5xzwthAcjPk21sqJrOzclw+wCRMOLjAPIAEA4NACjtRNDT/9M/MfhDWMjL/8s/zsntVAGa+ABwyMv/cG2AQPRD+EtxWIBA9BfI9ADJ+ErIz4SA9AD0AM+BySD5AMjPigBAy//J0AIiyM+FiM4B+gJzzwtqIds8zM+Q0Wq+f8lw+wAPADTQ0gABk9IEMd7SAAGT0gEx3vQE9AT0BNFfAwAq7UTQ0//TP9MAMdTU0fhr+Gr4Y/hiAAr4RvLgTAIK9KQg9KEUEwAUc29sIDAuNTguMQAA",
    code: "te6ccgECEgEAAgEABCSK7VMg4wMgwP/jAiDA/uMC8gsPAgERAoTtRNDXScMB+GYh2zzTAAGfgQIA1xgg+QFY+EL5EPKo3tM/AfhDIbnytCD4I4ED6KiCCBt3QKC58rT4Y9MfAds88jwGAwNK7UTQ10nDAfhmItDXCwOpOADcIccA4wIh1w0f8rwh4wMB2zzyPA4OAwIoIIIQW1sqJrrjAiCCEGi1Xz+64wIJBAIiMPhCbuMA+Ebyc9H4ANs88gAGBQAo+Ev4SvhD+ELIy//LP8+DzMzJ7VQCFu1E0NdJwgGOgOMNBw0CVHDtRND0BXEhgED0D46A33IigED0D46A3/hr+GqAQPQO8r3XC//4YnD4YwgIAQKIEQNyMPhG8uBM+EJu4wDTf9HbPCGOHyPQ0wH6QDAxyM+HIM5xzwthAcjPk21sqJrOzclw+wCRMOLjAPIADQsKACjtRNDT/9M/MfhDWMjL/8s/zsntVAGa+ABwyMv/cG2AQPRD+EtxWIBA9BfI9ADJ+ErIz4SA9AD0AM+BySD5AMjPigBAy//J0AIiyM+FiM4B+gJzzwtqIds8zM+Q0Wq+f8lw+wAMADTQ0gABk9IEMd7SAAGT0gEx3vQE9AT0BNFfAwAq7UTQ0//TP9MAMdTU0fhr+Gr4Y/hiAAr4RvLgTAIK9KQg9KEREAAUc29sIDAuNTguMQAA",
    codeHash: "f61df76cb7a3b744548dad5a50fe93df7372390442d3461f8edc57ea343f8f1b",
};
module.exports = { TrinityRootContract };