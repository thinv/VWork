from abc import ABC, abstractmethod
from typing import Any


class AIProvider(ABC):
    """Provider-neutral interface. Business services must not depend on vendor payloads."""

    @abstractmethod
    async def generate(self, request: dict[str, Any]) -> dict[str, Any]:
        raise NotImplementedError

    @abstractmethod
    async def health(self) -> dict[str, Any]:
        raise NotImplementedError
