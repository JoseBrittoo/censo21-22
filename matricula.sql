
--23 interseções
select  
	column_name 
from 
	information_schema.columns
where 
	table_schema = 'educacao'
	and table_name = 'censo21matricula'
intersect
select 
	column_name as coluna 
from 
	information_schema.columns
where 
	table_schema = 'educacao'
	and table_name = 'censo22matricula'; 
	
--verificar tipo de coluna e qtd.
select  
	*
from 
	information_schema.columns
where 
	table_schema = 'educacao'
	and table_name = 'censo22matricula'


	
	
with c21 as ( 
	select  
		column_name as coluna, data_type 
	from 
		information_schema.columns
	where 
		table_schema = 'educacao'
		and table_name = 'censo21matricula'),
c22 as (
	select 
		column_name as coluna, data_type 
	from 
		information_schema.columns
	where 
		table_schema = 'educacao'
		and table_name = 'censo22matricula'), 
c2122_i as ( -- 
	select coluna from c21
	intersect
	select coluna from c22	
),
c2122_u as ( -- 
	select coluna, data_type from c21
	union
	select coluna, data_type from c22	
),
c2221_d as ( -- 
	select coluna from c22
	except
	select coluna from c21	
),
c2122_d as ( -- 
	select coluna from c21
	except
	select coluna from c22	
)
select concat(coluna, ' ', data_type, ' null,') from c2122_u;


--select * from c2122_d; 
select * from (
	select *, '21' as ano from c2122_d
	union
	select *, '22' from c2221_d
) as t
order by 	
	t.coluna, ano;

alter table educacao.censo22matricula rename column complemeto to complemento;
alter table educacao.censo22matricula rename column cheche to creche;
alter table educacao.censo22matricula rename column dependencia_adiministrativa to dependencia_administrativa;
alter table educacao.censo21matricula rename column total_matriculas to total_matricula;
alter table educacao.censo22matricula rename column anos_finais to anos_finais_fund;
alter table educacao.censo22matricula rename column anos_inicias to anos_inicias_fund;



-- carga dos dados do censo matricula de 2021 e 2022

with c21 as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo21matricula'), 
/*c22 as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo22infra'), 	*/	
ci as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo_matricula')
select string_agg(t.coluna, ',' order by coluna) from ( 
select coluna from c22
intersect
select coluna from c21 as t;


 select distinct municipio from educacao.censo_matricula cm order by 1 

  --  função pra remover os acentos(ela está no: spede->public->funções)
 select distinct municipio, upper (public.fc_utils_string_normalize(municipio)) from educacao.censo_matricula cm order by 1 
 
 -- atualiza na tabela para remover os acentos e duplicados
 update educacao.censo_matricula set municipio = upper (public.fc_utils_string_normalize(municipio));


