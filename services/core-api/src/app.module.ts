import { Module } from "@nestjs/common";
import { HealthController } from "./health.controller";
import { ContextController } from "./context.controller";
import { IdentityModule } from "./modules/identity/identity.module";
import { DocumentsModule } from "./modules/documents/documents.module";
import { WorkModule } from "./modules/work/work.module";
import { WorkflowModule } from "./modules/workflow/workflow.module";

@Module({
  imports: [IdentityModule, DocumentsModule, WorkModule, WorkflowModule],
  controllers: [HealthController, ContextController]
})
export class AppModule {}
