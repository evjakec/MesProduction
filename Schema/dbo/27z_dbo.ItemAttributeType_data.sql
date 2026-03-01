USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[ItemAttributeType] ON

begin tran

SELECT * FROM [dbo].[ItemAttributeType]

insert into dbo.ItemAttributeType (ItemAttributeTypeId, Name, Description)
values (1, 'Height (mm)','Measured height of the order item'),
(2, 'Width (mm)','Measured width of the order item'),
(3, 'Thickness (mm)','Measured thickness of the order item'),
(4, 'Scribe Orientation','How the scribes appear when the unit is installed, horizontal or vertical'),
(5, 'IGU Step','An IGU can be inset on the inner lite for various product needs.  The number of sides inset is the IGU step (1,2,3,4)'),
(6, 'IGU Type','The construction of the IGU, i.e. double, triple, VIG, etc.')

SELECT * FROM [dbo].[ItemAttributeType]

--rollback
commit

SET IDENTITY_INSERT [dbo].[ItemAttributeType] OFF

DBCC CHECKIDENT('dbo.ItemAttributeType', RESEED,7)


