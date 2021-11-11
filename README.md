<!-- Project Link References -->

[ci status]: https://github.com/csqrl/find-up/actions
[latest release]: https://github.com/csqrl/find-up/releases/latest
[library url]: https://www.roblox.com/library/7959218626
[npm package]: https://npmjs.com/package/@rbxts/find-up

<!-- Articles -->

[rojo]: https://rojo.space
[wally]: https://github.com/upliftgames/wally
[roblox-ts]: https://roblox-ts.com

<!-- Images -->

[shield ci]: https://github.com/csqrl/find-up/actions/workflows/unit-tests.yml/badge.svg
[shield gh release]: https://img.shields.io/github/v/release/csqrl/find-up?label=latest+release&style=flat
[shield npm release]: https://img.shields.io/npm/v/@rbxts/find-up?style=flat
[shield wally release]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/find-up&color=blue&label=wally&style=flat

# FindUp

[![CI][shield ci]][ci status]
[![GitHub release (latest by date)][shield gh release]][latest release]
[![NPM release (latest)][shield npm release]][npm package]
[![Wally release (latest)][shield wally release]][latest release]

Find an Instance by walking up ancestors.

## Installation

### [Wally][wally]

Add `find-up` to your `wally.toml` and run `wally install`

```toml
# wally.toml
[dependencies]
FindUp = "csqrl/find-up@^1.0.0"
```

```sh
$ wally install
```

### [Roblox-TS][roblox-ts]

Install the [`@rbxts/find-up`][npm package] package using npm or yarn.

```sh
$ npm i @rbxts/find-up
$ yarn add @rbxts/find-up
$ pnpm i @rbxts/find-up
```

### [Rojo][rojo]

You can use git submodules to clone this repo into your project's packages directory:

```sh
$ git submodule add https://github.com/csqrl/find-up packages/find-up
```

Once added, simply sync into Studio using the [Rojo][rojo] plugin.

#### 0.5.x

Download/clone this repo on to your device, and copy the `/src` directory into your packages directory.

### Manual Installation

Grab a copy [from the Roblox Library (Toolbox)][library url], or download the latest `.rbxm/.rbxmx` file from [the releases page][latest release] and drop it into Studio.

# Documentation

## FindUp

```lua
local FindUp = require(path.to.FindUp.FindUp)

local object = FindUp(script, "SomeObject")

print(object) -- SomeObject
```

## FindUpAll

```lua
local FindUpAll = require(path.to.FindUp.FindUpAll)

local objects = FindUpAll(script, "SomeObject")

print(objects) -- { SomeObject, SomeObject }
```

## GetAncestors

```lua
local GetAncestors = require(path.to.FindUp.GetAncestors)

local ancestors = GetAncestors(script)

print(ancestors) -- { Script, Folder, ReplicatedStorage, DataModel }
```

## Interfaces

_Luau+TypeScript types included._

```ts
interface GetAncestorsOptions {
  stopAt?: Instance // nil
  includeSelf?: boolean // false
  includeStopAt?: boolean // false
}

interface FindUpOptions extends GetAncestorsOptions {
  ignoreCase?: boolean // false
  className?: string // nil
  isA?: string // nil
  predicate?: (instance: Instance) -> boolean // nil
}
```
