/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';

import {CacheManager} from 'react-native-image-cache';
import {Dirs} from 'react-native-file-access';

CacheManager.config = {
  baseDir: `${Dirs.CacheDir}/images_cache/`,
  blurRadius: 15,
  cacheLimit: 1024 * 1024 * 256, // 256MB
  maxRetries: 3,
  retryDelay: 3000,
  sourceAnimationDuration: 1000,
  thumbnailAnimationDuration: 1000,
  getCustomCacheKey: source =>
    source.includes('?') ? source.split('?')[0] : source,
};

AppRegistry.registerComponent(appName, () => App);
