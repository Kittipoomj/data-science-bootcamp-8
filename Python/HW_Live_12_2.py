## HW02 - Class ATM [At least 5 method]

class ATM:
    """This class represents an ATM."""

    def __init__(self, balance):
        """Initialize the ATM with the given balance."""
        self.balance = balance

    def deposit(self, amount):
        """Deposit the given amount into the ATM."""
        self.balance += amount

    def withdraw(self, amount):
        """Withdraw the given amount from the ATM."""
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount

    def transfer(self, to_atm, amount):
        """Transfer the given amount from this ATM to the other ATM."""
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        to_atm.balance += amount

    def get_balance(self):
        """Get the current balance of the ATM."""
        return self.balance

    def change_pin(self, old_pin, new_pin):
        """Change the ATM's PIN."""
        if self.check_pin(old_pin):
            self.pin = new_pin
        else:
            raise ValueError("Incorrect PIN")
