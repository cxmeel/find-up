import type { WaitForSiblingOptions } from "./types"

export function WaitForSibling<T = Instance>(
  self: Instance,
  name: string,
  options?: WaitForSiblingOptions
): T | undefined

export default WaitForSibling
