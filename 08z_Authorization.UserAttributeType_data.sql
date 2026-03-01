USE [MesProduction]
GO

SET IDENTITY_INSERT [Authorization].UserAttributeType ON

begin tran

select * from [Authorization].UserAttributeType

INSERT INTO [Authorization].[UserAttributeType]
           ([UserAttributeTypeId]
		   ,[Name]
           ,[Description])
     VALUES
           (1, 'BadgeId','RFID Badge ID Number which is used to authorize users through a badge scan'),
           (2, 'PhoneNumber','Used for sending text alerts if desired')
           
select * from [Authorization].UserAttributeType

--ROLLBACK
COMMIT
SET IDENTITY_INSERT [Authorization].UserAttributeType OFF


DBCC CHECKIDENT('Authorization.UserAttributeType', RESEED,3)