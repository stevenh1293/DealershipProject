use Dealerships

-- Create tables for each dealership
CREATE TABLE Raw_Tampa_Honda (
  ScrapeDate Date,
  StoreName nvarchar(200),
  StoreAddress1 nvarchar(200),
  StoreAddress2 nvarchar(200),
  Make nvarchar(200),
  VIN nvarchar(200),
  Year INT,
  Model nvarchar(200),
  ExteriorColor nvarchar(200),
  InteriorColor nvarchar(200),
  MSRP nvarchar(200),
  DealerPrice1 nvarchar(200),
  DealerPrice2 nvarchar(200),
  CarURL nvarchar(max),
)

    
CREATE TABLE Raw_Brandon_Honda (
  ScrapeDate Date,
  StoreName nvarchar(200),
  StoreAddress1 nvarchar(200),
  StoreAddress2 nvarchar(200),
  Make nvarchar(200),
  VIN nvarchar(200),
  Year INT,
  Model nvarchar(200),
  ExteriorColor nvarchar(200),
  InteriorColor nvarchar(200),
  MSRP nvarchar(200),
  DealerPrice nvarchar(200),
  CarURL nvarchar(max),
)

    
CREATE TABLE Raw_Westshore_Honda (
  ScrapeDate Date,
  StoreName nvarchar(200),
  StoreAddress1 nvarchar(200),
  StoreAddress2 nvarchar(200),
  Make nvarchar(200),
  VIN nvarchar(200),
  Year INT,
  Model nvarchar(200),
  ExteriorColor nvarchar(200),
  InteriorColor nvarchar(200),
  MSRP nvarchar(200),
  DealerPrice1 nvarchar(200),
  DealerPrice2 nvarchar(200),
  CarURL nvarchar(max),
)