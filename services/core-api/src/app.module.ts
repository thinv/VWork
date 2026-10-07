import { Module } from "@nestjs/common";
import { HealthController } from "./health.controller";
import { ContextController } from "./context.controller";

@Module({
  controllers: [HealthController, ContextController]
})
export class AppModule {}
