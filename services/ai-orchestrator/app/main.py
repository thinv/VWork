from typing import Any, Literal
from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI(title="VWork AI Orchestrator", version="0.1.0")


class AIRequest(BaseModel):
    tenant_id: str
    membership_id: str | None = None
    use_case_code: str
    correlation_id: str
    source_refs: list[str] = Field(default_factory=list)
    prompt_version: str | None = None
    policy_version: str | None = None
    payload: dict[str, Any] = Field(default_factory=dict)


class AIResponse(BaseModel):
    status: Literal["NOT_CONFIGURED", "SUCCEEDED", "FAILED"]
    correlation_id: str
    output: dict[str, Any] = Field(default_factory=dict)


@app.get("/health/live")
def live() -> dict[str, Any]:
    return {"ok": True, "service": "ai-orchestrator", "status": "live"}


@app.get("/health/ready")
def ready() -> dict[str, Any]:
    return {"ok": True, "service": "ai-orchestrator", "status": "ready"}


@app.post("/v1/run", response_model=AIResponse)
def run(request: AIRequest) -> AIResponse:
    # Foundation mode deliberately does not invoke any external provider.
    return AIResponse(
        status="NOT_CONFIGURED",
        correlation_id=request.correlation_id,
        output={
            "message": "AI provider chưa được cấu hình.",
            "useCaseCode": request.use_case_code,
        },
    )
