USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[InventoryLocationType] ON

begin tran

SELECT * FROM [dbo].[InventoryLocationType]

insert into dbo.InventoryLocationType (InventoryLocationTypeId, Name, Description)
values (0, 'Unknown','No location type has been set for this inventory.'),
(1, 'Receiving','The inventory has been received from the supplier and needs allocated to a warehouse.'),
(2, 'Warehouse','The inventory is in storage and can be allocated to an order.'),
(3, 'Production','The inventory has been allocated to an order to start production.'),
(4, 'Finished Goods','This is for finished goods that have been assembled on the factory floor and have passed validation.'),
(5, 'Shipping','This location is for finished goods that have been moved from the factory into the shipping area, and can now be allocated to a customer shipment.'),
(6, 'Hold','This location is for any inventory that has been put on hold due to quality concern or if an order is paused.')

SELECT * FROM [dbo].[InventoryLocationType]

--rollback
commit

SET IDENTITY_INSERT [dbo].[InventoryLocationType] OFF

DBCC CHECKIDENT('dbo.InventoryLocationType', RESEED,7)


