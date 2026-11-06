from services.priority_rules import AccountCompromiseRule, PriorityRule

rule = AccountCompromiseRule()
print(rule.evaluate("Mi cuenta fue hackeada"))       # CRITICAL
print(rule.evaluate("Quiero actualizar mi correo"))  # None
print(rule.evaluate("Mi pago fue rechazado"))        # None

try:
    PriorityRule()
except TypeError as e:
    print("OK, la base es abstracta:", e)