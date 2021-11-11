export interface GetAncestorsOptions {
  stopAt?: Instance
  includeSelf?: boolean
  includeStopAt?: boolean
}

export function GetAncestors(
  self: Instance,
  options?: GetAncestorsOptions
): Instance[]

export const DEFAULT_OPTIONS: GetAncestorsOptions
export default GetAncestors
