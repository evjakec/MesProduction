USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[WorkElementType] ON

begin tran

SELECT * FROM [dbo].[WorkElementType]

insert into dbo.WorkElementType (WorkElementTypeId, Name, Description)
values (1, 'Text','Text instructions are displayed to the user.  Also supports HTML.'),
(2, 'Image','Similar to text, but also includes an option for 1 image to display instructions graphically'),
(3, 'Data Collection','One to many process data points can be collected by the user'),
(4, 'Consumption','A part, lot or subassembly will be scanned into the order item')

SELECT * FROM [dbo].[WorkElementType]

--rollback
commit

SET IDENTITY_INSERT [dbo].[WorkElementType] OFF

DBCC CHECKIDENT('dbo.WorkElementType', RESEED,5)


