import type { FindUpAllOptions } from "./types"

export function FindFirstSibling<T = Instance>(
  self: Instance,
  name: string,
  options?: FindUpAllOptions
): T | undefined

export default FindFirstSibling
