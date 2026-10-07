import { Controller, Get } from "@nestjs/common";

@Controller("health")
export class HealthController {
  @Get("live")
  live() {
    return { ok: true, service: "core-api", status: "live" };
  }

  @Get("ready")
  ready() {
    return { ok: true, service: "core-api", status: "ready" };
  }
}
