const path = require('path');
const merge = require('webpack-merge');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const UglifyJsPlugin = require('webpack/lib/optimize/UglifyJsPlugin');

module.exports = function (options) {
  const commonConfig = require('./webpack.common')(options);

  return merge(commonConfig, {
    devtool: 'source-map',

    plugins: [
      new CopyWebpackPlugin([{
        from: path.join(options.paths.src, 'img'),
        to: 'img',
      }]),

      new UglifyJsPlugin({
        minimize: true,
        compressor: { warnings: false },
        mangle: true,
      }),
    ],
  });
};
