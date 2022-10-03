export interface GetAncestorsOptions {
  stopAt?: Instance
  includeSelf?: boolean
  includeStopAt?: boolean
}

export interface FindUpAllOptions extends GetAncestorsOptions {
  ignoreCase?: boolean
  className?: string
  isA?: string
  predicate?: (instance: Instance) => boolean
}

export interface WaitForSiblingOptions extends FindUpAllOptions {
  timeout?: number
}
