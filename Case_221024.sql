use ContosoRetailDW

select * from DimCustomer
select 
 CustomerKey,
 FirstName,
 Gender,
	case
		when Gender = 'M' then 'Masculino'
		else 'Feminino'		
	end as 'Sexo'
from DimCustomer

select 
 CustomerKey,
 FirstName,
 Gender,
	case
		when Gender = 'M' then 'Masculino'
		when Gender = 'F' then 'Feminino'
		else 'PJ'		
	end as 'Sexo'
from DimCustomer