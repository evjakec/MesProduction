USE [MesProduction]
GO

SET IDENTITY_INSERT dbo.PartType ON

BEGIN TRAN

select * from dbo.PartType

INSERT INTO dbo.PartType
           ([PartTypeId]
		   ,[Name]
           ,[Description])
     VALUES (0, 'Unknown', 'Unknown type of Part')
           ,(1, 'Raw Material', 'Supplied materials that are used in the manufacturing process')
           ,(2, 'SubAssembly', 'Multiple materials proceesed together to create a subassembly')
           ,(3, 'FinishedGood', 'All materials and subassemblies processed to complete a finished product')
GO

select * from dbo.PartType

SET IDENTITY_INSERT dbo.PartType OFF

--ROLLBACK
COMMIT

DBCC CHECKIDENT('dbo.PartType', RESEED,4)
