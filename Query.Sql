

-- 2 inserts 
-- Before insert
Select * from Lot;

Insert into Lot values(6,187.50,'2021-05-17');

-- After insert
Select * from Lot;


-- Before insert
Select * from Supplier;

Insert into Supplier values(4785,'BBCW distributors',7030455528,'75 Ilchester Road');

-- After insert
Select * from Supplier;

-- 2 update
-- Before update 1
Select * from Raw_Material;


update Raw_Material
set Unit_Cost = 140
where Raw_Material_ID = 103;

-- After update
Select * from Raw_Material;


-- Before update 2
Select * from Supplier;


update Supplier
set Contact_Number = 793692942
where Supplier_ID = 1250;

-- After update
Select * from Supplier;


-- 1 delete 
--Before delete 
Select * from Raw_Material_Lot;


Delete from Raw_Material_Lot
where Lot_ID = 4; 


--After delete 
Select * from Raw_Material_Lot;


-- 1 Select from 1 table
Select Supplier_ID, Supplier_Name, Contact_Number, Address
from Supplier;

-- 2 Select using join 
Select l.Lot_ID, l.Cost, tp.Toy_Name, tp.Toy_description
from Lot l inner join Toys_Production tp
on l.Lot_ID = tp.Lot_ID;


Select rm.Material_Type, rml.Total_Unit
from Raw_Material rm inner join Raw_Material_Lot rml
on rm.Raw_Material_ID = rml.Raw_Material_ID;


-- 3 summary function queries
Select count(*) 'Count of raw material lot'
from Raw_Material_Lot;


Select min(Unit_Cost) 'Minimum material unit cost'
from Raw_material;


Select sum(Cost) 'Sum of lot cost'
from Lot;



-- 1 multi-table query 
Select s.Supplier_Name, s.Contact_Number, rm.Material_Type, rm.Unit_Cost,
rml.Total_Unit
from Supplier s, Raw_Material rm, Raw_Material_Lot rml
where s.Supplier_ID = rm.Supplier_ID
and rm.Raw_Material_ID = rml.Raw_Material_ID
and rml.Total_Unit > 30;

-- 1. 
-- Add a new column â€˜ENUMâ€™
-- Before alter 
desc Toys_Production;

alter table Toys_Production modify IsQualityTested ENUM('Yes','No') not null after Toy_Weight;

-- Alter alter 
desc Toys_Production;


-- 2. 
-- â€˜enumâ€™ value blank
-- Before insert
Select * from Toys_Production;

Insert into Toys_Production values(7,2,'Green Toys','Colorful, durable, and earth-friendly toys','10 inches',);

-- Alter insert
Select * from Toys_Production;


-- â€˜enumâ€™ value without blank
-- Before insert
Select * from Toys_Production;

Insert into Toys_Production values(7,2,'Green Toys','Colorful, durable, and earth-friendly toys','10 inches','Yes');

-- Alter insert
Select * from Toys_Production;


--4.
-- Before delete
Select * from Toys_Production;


Delete from Toys_Production
where Toy_Production_ID = 7;

-- After delete
Select * from Toys_Production;


-- 5. 
-- Before insert
Select * from Toys_Production;


alter table Toys_Production modify Toy_Production_ID INT not null AUTO_INCREMENT;


-- Alter insert
Select * from Lot;


-- 6.
-- Before insert
Select * from Raw_Material;


alter table Raw_Material alter column Material_Type set default 0;  

-- Alter insert
Select * from Raw_Material;

