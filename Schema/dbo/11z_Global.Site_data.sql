USE [MesProduction]
GO

SET IDENTITY_INSERT Global.Site ON

begin tran

select * from Global.Site

INSERT INTO [Global].[Site]
           ([SiteId]
		   ,[Name]
           ,[DisplayName])
     VALUES
           (1, 'Phoenix, AZ USA', 'PHX'),
		   (2, 'Redwood City, CA USA', 'RWC')

select * from Global.Site

--ROLLBACK
COMMIT
SET IDENTITY_INSERT Global.Site OFF


DBCC CHECKIDENT('Global.Site', RESEED,3)