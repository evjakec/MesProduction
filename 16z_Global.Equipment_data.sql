USE [MesProduction]
GO

-- This script will use a tool count to determine how many lines per process. 
-- At the moment, the tool count is a hack CASE statement in the temp table.
begin tran

--select * from global.Equipment

DECLARE @ProcessAndCount TABLE (GlobalProcessId INT, ProcessNumber VARCHAR(10), ProcessName VARCHAR(50), ToolCount INT)
INSERT INTO @ProcessAndCount (GlobalProcessId, ProcessNumber, ProcessName, ToolCount)
SELECT ProcessId,  Number, Name, 
	CASE 
		WHEN Number in ('10165','10170','69915','69910','70005','70010','79915','79920') THEN 2 
		ELSE 1 
	END 
FROM Global.Process

; with LinesAndOrder AS
(select LineId as GlobalLineId, l.Name, ROW_NUMBER() OVER (Partition by s.Name ORDER BY l.Name) as LineRowOrder 
	from global.Line as l 
		inner join global.Unit as u on l.UnitId = u.UnitId
		inner join global.Plant as p on u.PlantId = p.PlantId
		inner join global.Site as s on p.SiteId = s.SiteId
)
, EquipmentNamesWithLabSeparates AS 
(
	--SELECT GlobalLineId, GlobalProcessId, l.DisplayName + '-' + pc.ProcessName as GlobalEquipmentName, pc.ProcessNumber
	--from @ProcessAndCount as pc
	--	inner join LinesAndOrder as lo on pc.ToolCount >= lo.LineRowOrder
	--	inner join global.Line as l on lo.GlobalLineId = l.LineId
	--where pc.ProcessName like 'LAB%'
	--	and l.DisplayName like 'RWC%'
	--UNION ALL (
		SELECT GlobalLineId, GlobalProcessId, l.DisplayName + '-' + pc.ProcessName as GlobalEquipmentName, pc.ProcessNumber
	from @ProcessAndCount as pc
		inner join LinesAndOrder as lo on pc.ToolCount >= lo.LineRowOrder
		inner join global.Line as l on lo.GlobalLineId = l.LineId
	--where l.DisplayName NOT like 'RWC%'
	where pc.ProcessName NOT like 'LAB%'
		--and l.DisplayName NOT like 'RWC%'
		and l.DisplayName NOT like 'PHX%'
		--and l.DisplayName like 'STM%'
	--)
)

INSERT INTO Global.Equipment(LineId, ProcessId, Name)
select GlobalLineId, GlobalProcessId, GlobalEquipmentName from EquipmentNamesWithLabSeparates order by ProcessNumber

select * from global.Equipment

--ROLLBACK
COMMIT