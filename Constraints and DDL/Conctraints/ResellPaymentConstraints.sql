ALTER TABLE ResellPayment
ADD CONSTRAINT check_ResellDateOnOrAfterRegistrationDate
CHECK (ResellDate >= (SELECT RegistrationDate FROM Customer WHERE CustomerID = ResellPayment.BuyerCustomerID));
