ALTER TABLE Payment
ADD CONSTRAINT check_payment_method
CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'PayPal'));

ALTER TABLE Payment
ADD CONSTRAINT check_PaymentDateAfterRegistration
CHECK (PaymentDate >= (SELECT RegistrationDate FROM Customer WHERE CustomerID = Payment.CustomerID));

ALTER TABLE Payment
ADD CONSTRAINT check_PaymentDateOnSameDateAsOrderDate
CHECK (PaymentDate = (SELECT OrderDate FROM "Order" WHERE OrderID = Payment.OrderOrderID));

