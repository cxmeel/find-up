import type { FindUpAllOptions } from "./types"

export function FindUp<T = Instance>(
  self: Instance,
  name: string,
  options?: FindUpAllOptions
): T | undefined

export default FindUp
