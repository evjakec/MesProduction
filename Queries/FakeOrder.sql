use MesProduction

begin tran

select * from Customer

insert into Customer(Name, Address, PostalCode, City, StateOrProvince, Country, PhoneNumber, EmailAddress, ContactName, IsActive)
Values ('Window World', '123 Any Street', '43551', 'Perrysburg','OH','United States of America', '419-874-1234', 'receiving@windowworld.com', 'John Smith', 1)

select * from Customer

rollback

select * from Part

begin tran

select * from [Order]
select * from OrderItem
select * from OrderItemAttribute

insert into [Order] (Number, OrderStateId, CustomerId)
values ('ORD000001',4,(Select CustomerId from Customer where Name = 'Window World'))

insert into OrderItem (OrderId, FinishedPartId, Quantity)
values ((Select OrderId from [Order] where Number = 'ORD000001'), (Select PartId from Part where PartNumber = 'PT0300001'), 100)

insert into OrderItemAttribute (OrderItemId, ItemAttributeTypeId, AttributeValue)
Values 
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'Height (mm)'), '600'),
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'Width (mm)'), '400'),
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'Thickness (mm)'), '6'),
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'Scribe Orientation'), 'Vertical'),
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'IGU Step'), '0'),
	((Select OrderItemId from [OrderItem] where OrderId = (Select OrderId from [Order] where Number = 'ORD000001')), (select ItemAttributeTypeId from ItemAttributeType where Name = 'IGU Type'), 'double')

select * from [Order]
select * from OrderItem
select * from OrderItemAttribute

rollback