ALTER TABLE Payment
ADD CONSTRAINT check_payment_method
CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'PayPal'));