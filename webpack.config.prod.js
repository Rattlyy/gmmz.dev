const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CopyPlugin = require('copy-webpack-plugin');

module.exports = merge(common, {
  mode: 'production',
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
    }),
    new CopyPlugin({
      patterns: [
        { from: 'src/css', to: 'css' },
        { from: 'src/img', to: 'img' },
        { from: 'src/js', to: 'js' },
        { from: 'src/static', to: 'static' },
      ],
    }),
  ],
});
