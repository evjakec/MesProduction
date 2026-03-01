select * from [Authorization].[User]
select * from [Authorization].[Role]
select * from [Authorization].[UserRole]
select * from [Authorization].[UserAttributeType]


USE [MesProduction]
GO

INSERT INTO [Authorization].[User]([LoginName],[FirstName],[LastName],[EmailAddress],[JobTitle],[IsActive])
VALUES ('jakcunni','Jake','Cunningham','jake.cunningham@gartner.com','Director Analyst',1)
GO

USE [MesProduction]
GO

INSERT INTO [Authorization].[UserRole] ([UserId] ,[RoleId])
VALUES (1,1)

USE [MesProduction]
GO

INSERT INTO [Authorization].[UserAttribute] ([UserId] ,[UserAttributeTypeId] ,[UserAttributeValue])
VALUES (1,1,'12345'),
(1,2,'+1 419-2450-9853')
GO

