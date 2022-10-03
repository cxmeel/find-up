--!strict

export type GetAncestorsOptions = {
	stopAt: Instance?,
	includeSelf: boolean?,
	includeStopAt: boolean?,
}

export type FindUpAllOptions = GetAncestorsOptions & {
	ignoreCase: boolean?,
	className: string?,
	isA: string?,
	predicate: ((instance: Instance) -> boolean)?,
}

export type WaitForSiblingOptions = FindUpAllOptions & {
	timeout: number?,
}

return nil
