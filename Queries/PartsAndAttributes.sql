















use MesProduction

select p.PartId, p.PartNumber, p.PartRevision, p.Description, pt.Name as PartTypeName, uom.Name as UnitOfMeasureName, uom.ShortName as UnitOfMeasureShortName, iat.Name as PartAttributeName, iat.Description as PartAttributeDescription, piat.IsRequired
from Part as p
	inner join PartType as pt on p.PartTypeId = pt.PartTypeId
	inner join UnitOfMeasure as uom on p.UnitOfMeasureId = uom.UnitOfMeasureId
	inner join PartItemAttributeType as piat on p.PartId = piat.PartId
	inner join ItemAttributeType as iat on piat.ItemAttributeTypeId = iat.ItemAttributeTypeId
