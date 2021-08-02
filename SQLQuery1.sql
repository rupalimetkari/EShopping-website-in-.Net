create table SubCategory
(
  SubCatID int identity(1,1) primary key,
  SubCatName nvarchar(MAX),
  MainCatID int null,
  Constraint [FK_SubCategory_Category] FOREIGN KEY ([MainCatID]) REFERENCES [Category] ([CatID])
)

create table Gender
(
 GenderID int identity(1,1) primary key,
  GenderName nvarchar(MAX),
  
)

create table Sizes
(
 SizeID int identity(1,1) primary key,
  SizeName binary(50),
  BrandID int,
  CategoryID int,
  SubCategoryID int,
  GenderID int,
  Constraint [FK_Sizes_ToBrand] FOREIGN KEY ([BrandID]) REFERENCES [Brands] ([BrandID]),
    Constraint [FK_Sizes_ToCat] FOREIGN KEY ([CategoryID]) REFERENCES [Category] ([CatID]),
	    Constraint [FK_Sizes_SubCat] FOREIGN KEY ([SubCategoryID]) REFERENCES [SubCategory] ([SubCatID]),
			    Constraint [FK_Sizes_Gender] FOREIGN KEY ([GenderID]) REFERENCES [Gender] ([GenderID])



  
)

create table Products
(
 PID int identity(1,1) primary key,
  PName nvarchar(MAX),
  PPrice money,
  PSelPrice money,
  PBrandID int,
  PCategoryID int,
  PSubCatID int,
  PGender int,
  PSizesID int,
  PDescription nvarchar(MAX),
  PProductsDetails nvarchar(MAX),
  PMaterialCare nvarchar(MAX),

  FreeDelivery int,
  [30DAyRet] int,
  COD int,

    Constraint [FK_Products_ToTable] FOREIGN KEY ([PBrandID]) REFERENCES [Brands] ([BrandID]),
	    Constraint [FK_Products_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [Category] ([CatID]),
	    Constraint [FK_Products_ToTable2] FOREIGN KEY ([PSubCatID]) REFERENCES [SubCategory] ([SubCatID]),
		Constraint [FK_Products_ToTable3] FOREIGN KEY ([PGender]) REFERENCES [Gender] ([GenderID]),
		Constraint [FK_Products_ToTable4] FOREIGN KEY ([PSizesID]) REFERENCES [Sizes] ([SizeID]),
)

Create table ProductImages
(
  PIMGID int identity(1,1) primary key,
  PID int,
  Name nvarchar(MAX),
  Extension nvarchar(500),
  Constraint [FK_ProductImages_ToTable] FOREIGN KEY ([PID]) REFERENCES [Products] ([PID])
)

Create table ProductSizeQuantity
(
  PrdSizeQuantID int identity(1,1) primary key,
  PID int,
  SizeID int,
  Quantity int,
  Constraint [FK_ProductSizeQuantity_ToTable] FOREIGN KEY ([PID]) REFERENCES [Products] ([PID]),
    Constraint [FK_ProductSizeQuantity_ToTable1] FOREIGN KEY ([SizeID]) REFERENCES [Sizes] ([SizeID]
)

 Sub categories === select A.*,B.* from SubCategory A inner join Category B on B.CatID = A.MainCatID


 add size ====select A.*,B.*,C.*,D.*,E.* from Sizes A inner join Category B on B.CatID = a.CategoryID inner join Brands C on C.BrandID =A.BrandID inner join 
 SubCategory D on D.SubCatID =A.SubCategoryID inner join Gender E on E.GenderID = A.GenderID  
 
 
 <---Stored Procedure-->
 

create procedure sp_InserProduct
(
 @PName nvarchar(MAX),
 @PPrice money,
 @PSelPrice money,
 @PBrandID int,
 @PCategoryID int,
 @PSubCategoryID int,
 @PGender int,
 @PDescription nvarchar(MAX),
 @PProductsDetails nvarchar(MAX),
 @PMaterialCare nvarchar(MAX),
 @FreeDelivery int ,
 @30DAyRet int,
 @COD int
)
as
insert into Products values(@PName,@PPrice,@PSelPrice,@PBrandID,@PCategoryID,@PSubCategoryID,
@PGender,@PDescription,@PProductsDetails,@PMaterialCare,@FreeDelivery,@30DAyRet,@COD)

select SCOPE_IDENTITY()

RETURN
<----sp-->

<--sp---BindProducts-->
ALTER procedure [dbo].[procBindAllProducts]
as
select A.*,B.*,C.Name,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName,C.Name as BrandName from Products A
inner join Brands C on C.BrandID = A.PBrandID
cross apply(

select top 1* from ProductImages B where B.PID = A.PID order by B.PID desc
)B
order by A.PID desc	

Return 0

<--sp---BindProducts end -->



<--function---BindCart Start -->

      create function getSizeName
(
  @SizeID int

)
RETURNS Nvarchar(10)
as
Begin

Declare @SizeName nvarchar(10)
select @SizeName = SizeName from Sizes where SizeID = @SizeID
RETURN @SizeName

End 

<--function---BindCart Start -->



Pattern - Solid Men’s Plan Shirts  

Fit Type: Regular Fit  Collar style - Classic; Cuff style - Single cuff

Machine wash warm, wash dark colors separately
