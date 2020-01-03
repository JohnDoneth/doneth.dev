const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');

module.exports = {
    entry: './src/index.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    module: {
        rules: [
            // Elm    
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: {
                    loader: 'elm-webpack-loader',
                    options: {
                        optimize: true
                    }
                }
            },
            // CSS 
            {
                test: /\.css$/,
                use: ['style-loader', 'postcss-loader']
            }
        ]
    },
    plugins: [
        new CopyPlugin([
            { from: 'public', to: '.' },
        ])
    ]
};