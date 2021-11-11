import { GetAncestorsOptions } from "./GetAncestors"

export interface FindUpOptions extends GetAncestorsOptions {
  ignoreCase?: boolean
  className?: string
  isA?: string
  predicate?: (instance: Instance) => boolean
}

export function FindUpAll(
  self: Instance,
  name: string,
  options?: FindUpOptions
): Instance[]

export const DEFAULT_OPTIONS: FindUpOptions
export default FindUpAll
