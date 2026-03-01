USE [MesProduction]
GO

SET IDENTITY_INSERT dbo.OrderState ON

BEGIN TRAN

select * from dbo.OrderState

INSERT INTO dbo.OrderState
           ([OrderStateId]
		   ,[Name]
           ,[Description])
     VALUES (0, 'Unknown', 'Unknown order state')
           ,(1, 'Created', 'A new order has been created in the system')
		   ,(2, 'Hold', 'An order is on hold and cannot be run')
		   ,(3, 'Released', 'An order has been confirmed and is released to production')
		   ,(4, 'Started', 'An order has started processing on the line')
		   ,(5, 'Complete', 'An order has completed, but can still be updated if needed')  -- maybe never used
		   ,(6, 'Closed', 'An order has completed and is now closed for any further processing')
GO

select * from dbo.OrderState

SET IDENTITY_INSERT dbo.OrderState OFF

--ROLLBACK
COMMIT

DBCC CHECKIDENT('dbo.OrderState', RESEED,7)
