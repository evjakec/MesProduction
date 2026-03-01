USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[WorkElementTypeAttributeListItem] ON

begin tran

SELECT * FROM [dbo].[WorkElementTypeAttributeListItem]

insert into dbo.WorkElementTypeAttributeListItem (WorkElementTypeAttributeListItemId,WorkElementTypeAttributeId, Name, Description)
values 
(1, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'UE3.0','UE3.0'),
(2, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'UE3.3','UE3.3'),
(3, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'UE4.0','UE4.0'),
(4, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'D310','D310'),
(5, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'UE361:A2','UE361:A2'),
(6, (Select WorkElementTypeAttributeId FROM WorkElementTypeAttribute where Name = 'Active Layer Coater Recipe'), 'Other','Other')

SELECT * FROM [dbo].[WorkElementTypeAttributeListItem]

--rollback
commit

SET IDENTITY_INSERT [dbo].[WorkElementTypeAttributeListItem] OFF

DBCC CHECKIDENT('dbo.WorkElementTypeAttributeListItem', RESEED,7)


