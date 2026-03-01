USE [MesProduction]
GO

begin tran

select c.Number, e.Name 
from Global.Coater as c
	inner join global.Equipment as e on c.EquipmentId = e.EquipmentId

INSERT INTO [Global].Coater
           ([EquipmentId]
           ,[Number])
select e.EquipmentId, ROW_NUMBER() over (order by p.number)
FROM Global.Equipment as e
	inner join global.Process as p on e.ProcessId = p.ProcessId
--where p.Name LIKE 'LAB%COATER%'
--where p.Name in ('ACTIVE_LAYER_COATER','TOP_ELECTRODE_COATER','ALD_COATER')
where p.Name in ('ACTIVE_LAYER_COATER')

select c.Number, e.Name 
from Global.Coater as c
	inner join global.Equipment as e on c.EquipmentId = e.EquipmentId

--ROLLBACK
COMMIT
