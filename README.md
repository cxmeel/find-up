<!-- Project Link References -->

[latest release]: https://github.com/csqrl/find-up/releases/latest
[library url]: https://www.roblox.com/library/7959218626
[npm package]: https://npmjs.com/package/@rbxts/find-up

<!-- Articles -->

[rojo]: https://rojo.space
[wally]: https://github.com/upliftgames/wally
[roblox-ts]: https://roblox-ts.com

<!-- Images -->

[shield gh release]: https://img.shields.io/github/v/release/csqrl/find-up?label=latest+release&style=flat
[shield npm release]: https://img.shields.io/npm/v/@rbxts/find-up?style=flat
[shield wally release]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/find-up&color=blue&label=wally&style=flat

# FindUp

[![GitHub release (latest by date)][shield gh release]][latest release]
[![NPM release (latest)][shield npm release]][npm package]
[![Wally release (latest)][shield wally release]][latest release]

Find an Instance by walking up ancestors.

```lua
local humanoid = FindUp(script, "Humanoid", {
    className = "Humanoid",
})

local roact = FindUp(script, "Roact", {
    className = "ModuleScript",
})
```

## Installation

### [Wally][wally]

Add `find-up` to your `wally.toml` and run `wally install`

```toml
# wally.toml
[dependencies]
FindUp = "csqrl/find-up@1.1.0"
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

# Documentation

Documentation can be found at https://csqrl.github.io/find-up.
