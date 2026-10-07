export type JobStatus = "QUEUED" | "RUNNING" | "RETRYING" | "SUCCEEDED" | "FAILED" | "CANCELLED" | "DEAD_LETTER";

export interface AsyncJobRef { jobId: string; status: JobStatus; statusUrl?: string; }
export interface CurrentUserContext { tenantId: string; userId: string; membershipId: string; roles: string[]; }
export interface ApiError { code: string; message: string; correlationId: string; details?: Record<string, unknown>[]; }
export interface TenantScopedRequestContext { tenantId: string; membershipId?: string; correlationId: string; }
