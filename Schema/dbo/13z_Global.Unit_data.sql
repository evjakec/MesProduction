USE [MesProduction]
GO

SET IDENTITY_INSERT Global.Unit ON

begin tran

select * from Global.Unit


INSERT INTO [Global].[Unit]
           ([UnitId]
		   ,[PlantId]
           ,[Name]
           ,[DisplayName])
     VALUES
           (1, 1, '1', 'PHX11'),
           (2, 2, '1', 'RWC11')
GO



select * from Global.Unit

--ROLLBACK
COMMIT

SET IDENTITY_INSERT Global.Unit OFF


DBCC CHECKIDENT('Global.Unit', RESEED,3)
