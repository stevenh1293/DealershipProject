CREATE TABLE Dealerships (
  dDealershipID int IDENTITY(1,1) NOT NULL,
  RawStoreName nvarchar(200),
  RawStoreAddress1 nvarchar(200),
  RawStoreAddress2 nvarchar(200),
  dDealershipName nvarchar(200),
  dAddressLine nvarchar(200),
  dCity nvarchar(200),
  dState nvarchar(2),
  dZipcode int,
  dDealershipURL nvarchar(200)
  CONSTRAINT PK_Dealerships PRIMARY KEY (dDealershipID)
)
