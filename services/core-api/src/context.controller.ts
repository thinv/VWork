import { Controller, Get, Headers, UnauthorizedException } from "@nestjs/common";

@Controller()
export class ContextController {
  @Get("me")
  me(@Headers("x-vwork-tenant") tenantId?: string) {
    if (!tenantId) {
      throw new UnauthorizedException("Tenant context is required in foundation mode");
    }
    return {
      tenantId,
      userId: "foundation-user",
      membershipId: "foundation-membership",
      roles: ["FOUNDATION"]
    };
  }
}
