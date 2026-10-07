from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_live() -> None:
    response = client.get("/health/live")
    assert response.status_code == 200
    assert response.json()["ok"] is True

def test_foundation_run_does_not_call_provider() -> None:
    response = client.post(
        "/v1/run",
        json={
            "tenant_id": "tenant-test",
            "membership_id": "member-test",
            "use_case_code": "FOUNDATION",
            "correlation_id": "corr-test"
        },
    )
    assert response.status_code == 200
    assert response.json()["status"] == "NOT_CONFIGURED"
