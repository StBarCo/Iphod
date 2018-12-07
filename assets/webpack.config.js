const path = require('path');
const glob = require('glob');
const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const elmPath = path.resolve(__dirname, 'node_modules/.bin/elm');
const elmFolder = path.resolve(__dirname, 'src');

module.exports = (env, options) => ({
 optimization: {
   minimizer: [
     new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
     new OptimizeCSSAssetsPlugin({})
   ]
 },
 entry: {
     './js/app.js': ['./js/app.js'].concat(glob.sync('./vendor/**/*.js'))
 },
 output: {
   filename: 'app.js',
   path: path.resolve(__dirname, '../priv/static/js')
 },
 module: {
   rules: [
     {
       test: /\.js$/,
       exclude: /node_modules/,
       use: {
         loader: 'babel-loader'
       }
     },
     {
       test: /\.elm$/,
         exclude: [/elm-stuff/, /node_modules/],
         use: {
           loader: 'elm-webpack-loader',
           options: {
              pathToElm: elmPath, // don't use globally installed elm
              cwd: elmFolder,
              debug: options.mode === "development"
            }
         }
     },
     {
       test: /\.css$/,
       use: [MiniCssExtractPlugin.loader, "css-loader"]
     }
   ],
   noParse: [/\.elm$/]
 },
 plugins: [
   new MiniCssExtractPlugin({ filename: '../css/app.css' }),
   new CopyWebpackPlugin([{ from: 'static/', to: '../' }]),
   new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
 ]
});