ALTER TABLE "Order"
ADD CONSTRAINT check_OrderDateAfterRegistration
CHECK (OrderDate >= (SELECT RegistrationDate FROM Customer WHERE CustomerID = "Order".CustomerID));
