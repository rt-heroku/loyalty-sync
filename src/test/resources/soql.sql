-- Get LoyaltyMemberTier

SELECT Name as Tier, LoyaltyMember.ContactID, LoyaltyMember.Contact.name, LoyaltyMember.Contact.Email, LoyaltyMember.Contact.phone,
LoyaltyMember.ProgramId, LoyaltyMember.MemberStatus, LoyaltyMember.MemberType, LoyaltyMember.MembershipNumber,	
LoyaltyMember.Points_Transfer_Target_Member__c,LoyaltyMember.Total_Redemption_Value__c, LoyaltyMember.GroupName, LoyaltyMember.External_ID__c, LoyaltyMember.EnrollmentDate, LoyaltyMember.EnrollmentChannel 
FROM LoyaltyMemberTier

-- Get Loyalty Member

SELECT ContactID, Contact.name, Contact.Email, Contact.phone,
ProgramId, MemberStatus, MemberType, MembershipNumber,	
Points_Transfer_Target_Member__c,Total_Redemption_Value__c, GroupName, External_ID__c, EnrollmentDate, EnrollmentChannel 
FROM LoyaltyProgramMember
WHERE 0lMHo000000xYHrMAM

-- Get Points
SELECT LoyaltyProgramCurrencyId , LoyaltyMemberId, External_ID__c, Name, PointsBalance, EscrowPointsBalance , ExpirablePoints, TotalPointsAccrued, TotalPointsExpired, TotalPointsRedeemed
FROM LoyaltyMemberCurrency where Name = 'Reward Points'


-- Get Transactions 
SELECT , MemberId, LoyaltyProgramId, LoyaltyProgram.Name, JournalTypeId, JournalType.Name, JournalSubTypeId, JournalSubType.Name, JournalReason, JournalDate, EscrowPointsCreditDate, Channel, Comment,
ProductId , Product.Name, ProductCategoryId , ProductCategory.Name, Brand, Points_to_Redeem__c , PaymentMethod , ActivityDate, Status, Reward_Catalog__c, Quantity, QuantityUnitOfMeasureId, Establishment
FROM TransactionJournal 

Create transaction


Program Member
Journal Type -- Redemption or Accrual
Journal SubType - Purchase, Redeem Reward
Activity Date-Time
Status - Pending
Loyalty Program - 0lpHo000000xTCMIA2
Channel - POS
Transaction Amount - $$$
Quantity - 1
Establishment - Store Name
Payment Method



0lMHo000000xYHrMAM

Category
	-------> ProductCatalog

-- ProductCatalog

select id, CatalogType, Code, Description, Name, External_ID__c 
from ProductCatalog


select id, name, CatalogType, Code, Description, EffectiveEndDate, EffectiveStartDate
from ProductCatalog

-- This is equivalent to Brand in POS.
Returns TUMI, where id = Carry=on
select id, CatalogType, Code, Description, Name, External_ID__c
from ProductCatalog
Where id = '0ZSHo000000ddOcOAI'

tumi = 0ZSHo000000ddOcOAI
CatalogType = 'Sales'


-- Categories

select id, name, ParentCategoryId, Code, CatalogId
from ProductCategory

Carry-on = 0ZGHo000000hpPdOAI
Parent = Null
CatalogId = 0ZSHo000000ddOcOAI

-- MAIN TABLE
ProductCategoryProduct
select id, name, ProductCategoryId, ProductCategory.name, ProductId , Product.Name, IsPrimaryCategory
from ProductCategoryProduct

select id, name, ProductCategoryId, ProductCategory.name, ProductId , Product.Name, IsPrimaryCategory
from ProductCategoryProduct
where ProductCategory.id = '0ZGHo000000hpPdOAI'

select id, name, ProductCategory.name, ProductId, IsPrimaryCategory
from ProductCategoryProduct
where ProductCategory.id = '0ZGHo000000hpPdOAI'

-- Returns All Tumi -> Carry-on Products
select id, name, ProductCategoryId, ProductId , ProductCategory.name, Product.Name
from ProductCategoryProduct
where ProductCategoryId = '0ZGHo000000hpPdOAI'
Carry-on = 0ZGHo000000hpPdOAI



Product catalog product




PRODUCT2
select FIELDS(ALL) from product2
where name ='Alpha Continental Carry-On'
LIMIT 1



STEP1 - Bring all Catalogs
select id, CatalogType, Code, Description, Name, External_ID__c from ProductCatalog

STEP2 - Bring all Categories for Selected Catalog
select id, name, ParentCategoryId, Code, CatalogId
from ProductCategory
where catalogid = '0ZSHo000000ddOcOAI'

STEP 3 - Bring all the Products by Category
select id, name, ProductCategoryId, ProductCategory.name,IsPrimaryCategory, ProductId , Product.Name, 
Product.Description,
Product.Image_URL__c,
Product.Warranty__c, 
Product.Item_Short_Description__c,
Product.External_ID__c,
Product.Inventory_Level__c,
(select unitprice from pricebookentry) as price
from ProductCategoryProduct
where ProductCategoryid in (
select id
from ProductCategory
where catalogid = '0ZSHo000000ddOcOAI'
)


PriceBook
select id, name, CurrencyIsoCode, Description, isStandard from pricebook2

WHERE Name = 'Standard Price Book'

PriceBookEntry
select id, name, unitprice, ProductCode, CurrencyIsoCode from PriceBookEntry

(select unitprice from pricebookentry)



SELECT 
  IsActive, UnitPrice, UseStandardPrice, 
  Pricebook2Id, Pricebook2.Name, Pricebook2.Description, Pricebook2.IsActive, Pricebook2.IsStandard, 
  Product2Id, Product2.Name, Product2.Description, Product2.Family, Product2.ProductCode, Product2.IsActive
FROM PricebookEntry
WHERE Product2.Id IN (
select ProductId
from ProductCategoryProduct
where ProductCategoryid in (
select id
from ProductCategory
where catalogid = '0ZSHo000000ddOcOAI'
)
)

