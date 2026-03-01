USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[ContainerType] ON

begin tran

SELECT * FROM [dbo].[ContainerType]

insert into dbo.ContainerType (ContainerTypeId, Name, Description)
values (0, 'Unknown','No type has been set for this container.'),
(1, 'A Rack','Finished product is loaded on both sides of an "A" shaped metal rack and then strapped down.'),
(2, 'L Rack','Finished product is stacked on to a "L" shaped metal rack and then strapped down.'),
(3, 'Harp Rack','Finished product is loaded into dedicated slots, separated by wires, and then strapped down on the edge.')

SELECT * FROM [dbo].[ContainerType]

--rollback
commit

SET IDENTITY_INSERT [dbo].[ContainerType] OFF

DBCC CHECKIDENT('dbo.ContainerType', RESEED,4)


