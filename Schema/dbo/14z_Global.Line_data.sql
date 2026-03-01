USE [MesProduction]
GO

SET IDENTITY_INSERT Global.Line ON

begin tran

select * from Global.Line


INSERT INTO [Global].[Line]
           ([LineId]
		   ,[UnitId]
           ,[Name]
           ,[DisplayName])
     VALUES
           (1, 1, 'A', 'PHX11A'),
           (2, 1, 'B', 'PHX11B'),
           (3, 2, 'A', 'RWC11A')
GO



select * from Global.Line

--ROLLBACK
COMMIT

SET IDENTITY_INSERT Global.Line OFF


DBCC CHECKIDENT('Global.Line', RESEED,4)
