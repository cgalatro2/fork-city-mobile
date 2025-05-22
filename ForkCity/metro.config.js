const path = require('path');
const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');

const projectRoot = __dirname;
const localPackagePath = path.resolve(
  projectRoot,
  '../packages/react-native-image-cache',
);
const rootNodeModules = path.resolve(projectRoot, '../node_modules');

const config = {
  watchFolders: [localPackagePath, rootNodeModules],
  resolver: {
    extraNodeModules: {
      'react-native-image-cache': localPackagePath,
      '@babel/runtime': path.join(rootNodeModules, '@babel/runtime'),
    },
  },
};

module.exports = mergeConfig(getDefaultConfig(projectRoot), config);
