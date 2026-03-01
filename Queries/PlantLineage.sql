select SiteId, Name, DisplayName from Global.Site
select PlantId, SiteId, Name, DisplayName from Global.Plant
select UnitId, PlantId, Name, DisplayName from Global.Unit
select LineId,UnitId, Name, DisplayName from Global.Line
select Name, Number from Global.Process

select EquipmentId, e.Name as EquipmentName, p.Name as ProcessName, 
	l.Name as LineName, u.Name as UnitName, pl.Name as PlantName, s.DisplayName as SiteName
from Global.Equipment as e
	inner join global.Line as l on e.LineId = l.LineId
	inner join global.Process as p on e.ProcessId = p.ProcessId
	inner join global.Unit as u on l.UnitId = u.UnitId
	inner join global.Plant as pl on u.PlantId = pl.PlantId
	inner join Global.Site as s on pl.SiteId = s.SiteId
where e.Name = 'PHX11A-ACTIVE_LAYER_COATER'
