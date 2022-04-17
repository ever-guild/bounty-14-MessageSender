const CopyPlugin = require('copy-webpack-plugin');

module.exports = {
    configureWebpack: {
        plugins: [
            new CopyPlugin(
                [
                    {
                        from: 'node_modules/@tonclient/lib-web/tonclient.wasm',
                        to: './'
                    }
                ],
            )
        ]
    },
    publicPath: process.env.NODE_ENV === 'production' ? './' : '/'
}