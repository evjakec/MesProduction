USE [MesProduction]
GO

SET IDENTITY_INSERT dbo.UnitOfMeasure ON

BEGIN TRAN

select * from dbo.UnitOfMeasure

INSERT INTO dbo.UnitOfMeasure
           ([UnitOfMeasureId]
		   ,[Name]
		   ,[ShortName])
     VALUES (0, 'Unknown','NA')
           ,(1, 'Millimeter', 'mm')
           ,(2, 'Inch', 'in')
           ,(3, 'Piece', 'pc')
GO

select * from dbo.UnitOfMeasure

SET IDENTITY_INSERT dbo.UnitOfMeasure OFF

--ROLLBACK
COMMIT

DBCC CHECKIDENT('dbo.UnitOfMeasure', RESEED,4)
