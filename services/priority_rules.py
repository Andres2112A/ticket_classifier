from abc import ABC, abstractmethod


class PriorityRule(ABC):
    """Contrato común: cada regla evalúa un ticket y devuelve una prioridad o None."""

    @abstractmethod
    def evaluate(self, ticket: str) -> str | None:
        ...


class AccountCompromiseRule(PriorityRule):
    SIGNALS = (
        "hackeada",
        "hackearon",
        "sin autorización",
        "acceso no autorizado",
    )

    def evaluate(self, ticket: str) -> str | None:
        ticket_lower = ticket.lower()
        if any(signal in ticket_lower for signal in self.SIGNALS):
            return "CRITICAL"
        return None