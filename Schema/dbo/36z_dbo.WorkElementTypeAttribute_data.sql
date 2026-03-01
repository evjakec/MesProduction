use MesProduction

begin tran

select * from WorkElementTypeAttribute

insert into WorkElementTypeAttribute(WorkElementTypeId, Name, IsRequiredAtSetup,IsRequiredAtRun)
VALUES 
(1, 'Work Element Text', 1,1),
(2, 'Work Element Text', 1,1),
(2, 'Work Element Image', 1,1),
(3, 'Work Element Text', 1,1),
(3, 'P1 Scribe Width mm', 0,1),
(3, 'P1 Scribe Spacing mm', 0,1),
(3, 'P1 Scribe Laser Power watts', 0,1),
(3, 'Active Layer Coater Recipe', 0,1),
(4, 'Work Element Text', 1,1),
(4, 'Consumed Part ID', 1,1)

select * from WorkElementTypeAttribute

--rollback
commit
