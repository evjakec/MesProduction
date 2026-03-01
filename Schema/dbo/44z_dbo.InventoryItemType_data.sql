USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[InventoryItemType] ON

begin tran

SELECT * FROM [dbo].[InventoryItemType]

insert into dbo.InventoryItemType (InventoryItemTypeId, Name, Description)
values (0, 'Unknown','No item type has been set for this inventory item.'),
(1, 'Lot','The inventory item is a lot of the same material.'),
(2, 'Serial','The inventory item is an individual item, uniquely identified with a serial number.')

SELECT * FROM [dbo].[InventoryItemType]

--rollback
commit

SET IDENTITY_INSERT [dbo].[InventoryItemType] OFF

DBCC CHECKIDENT('dbo.InventoryItemType', RESEED,3)


