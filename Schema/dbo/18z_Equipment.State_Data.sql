USE [MesProduction]
GO

BEGIN TRAN

select * from Equipment.State

INSERT INTO [Equipment].[State]
           ([StateId]
		   ,[Name]
           ,[ShortName])
     VALUES (0, 'Unknown', 'UNK')
           ,(1, 'Productive', 'PRD')
		   ,(2, 'Standby', 'SBY')
		   ,(4, 'Engineering Time', 'ENG')
		   ,(8, 'Scheduled Downtime', 'SDT')
		   ,(16, 'Unscheduled Downtime', 'UDT')
		   ,(32, 'Non-Scheduled Time', 'NST')
GO

select * from Equipment.State

--ROLLBACK
COMMIT
