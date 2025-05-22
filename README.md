# mobile-mono AKA ForkCity

A sandbox monorepo for hacking on React Native libraries.
Fork, patch, and test third-party packages in a local mobile app.

## 📦 Structure

```
mobile-monorepo/
├── ForkCity/                     # React Native app (bare workflow)
├── packages/
│   └── react-native-image-cache/ # Forked mobile library
├── pnpm-workspace.yaml
├── metro.config.js
└── package.json
```

## ✅ Features

- Built with `pnpm` workspaces
- Forked libraries live in `packages/`
- App consumes local packages via relative paths
- Supports native modules and Metro overrides
- Expo not required — bare RN for full native control

## 🚀 Getting Started

### 1. Install dependencies

```sh
pnpm install
```

### 2. Build the library

```sh
cd packages/react-native-image-cache
pnpm build
```

### 3. Run the app

```sh
cd ../../ForkCity
npx react-native run-ios
# or
npx react-native run-android
```

## 🔁 Use Case

This repo is intended for:

- Debugging native module integration
- Experimenting with Metro and TS configs
- Issuing PRs to 3rd-party libraries
- Learning how peer dependencies affect native builds

## 🧐 Why This Exists

I wanted a stable way to:

> Patch React Native libraries and validate the changes without publishing or linking globally.

## 📌 Notes

- Be sure to **build the library first** (`pnpm build`) before running the app.
- Metro can be fragile — clear its cache with:

  ```sh
  rm -rf /tmp/metro-* && watchman watch-del-all
  ```

## 💠 Tech Stack

- React Native `0.79`
- Metro
- TypeScript
- PNPM Monorepo
- React Native Builder Bob (`bob build`)

---

MIT License © 2025
