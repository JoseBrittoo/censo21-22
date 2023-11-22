
select 123 - 96;

SELECT
	*
from 
	information_schema.columns
WHERE
	table_schema = 'educacao'
	AND table_name = 'censo22infra';


with c21 as ( -- 96
	SELECT
		column_name as coluna, data_type 
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo21infra'), 
c22 as ( -- 123
	SELECT
		column_name as coluna, data_type 
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo22infra'),
c2122_i as ( -- 65
	select coluna from c21
	intersect
	select coluna from c22	
),
c2122_u as ( -- 154
	select coluna, data_type from c21
	union
	select coluna, data_type from c22	
),
c2221_d as ( -- 58
	select coluna from c22
	except
	select coluna from c21	
),
c2122_d as ( -- 31
	select coluna from c21
	except
	select coluna from c22	
)
select concat(coluna, ' ', data_type, ' null,') from c2122_u;

select * from (
	select *, '21' as ano from c2122_d
	union
	select *, '22' from c2221_d
) as t
order by 	
	t.coluna, ano;

CREATE TABLE educacao.censo_infra (
	acessibilidade_inexistente character varying null,
	agua_inexistente character varying null,
	agua_potavel character varying null,
	agua_rede_publica character varying null,
	almoxarifado character varying null,
	antena_parabolica character varying null,
	aparelho_som character varying null,
	area_verde character varying null,
	auditorio character varying null,
	banheiro character varying null,
	banheiro_chuveiro character varying null,
	banheiro_edu_infantil character varying null,
	banheiro_funcionarios character varying null,
	banheiro_portador_necessidades_especiais character varying null,
	biblioteca character varying null,
	biblioteca_sala_leitura character varying null,
	cacimba character varying null,
	computador character varying null,
	computador_portatil character varying null,
	corrimao character varying null,
	cozinha character varying null,
	datashow character varying null,
	dependencia_administrativa character varying null,
	descarta_outra_area character varying null,
	desktop character varying null,
	despensa character varying null,
	destino_final_publico character varying null,
	dormitorio_aluno character varying null,
	dormitorio_professor character varying null,
	dvd character varying null,
	educacao_indigena character varying null,
	elevador character varying null,
	energia_inexistente character varying null,
	energia_rede_publica character varying null,
	energia_renovavel character varying null,
	enterra character varying null,
	escola character varying null,
	esgoto_inexistente character varying null,
	esgoto_rede_publica character varying null,
	fonte_rio character varying null,
	fossa character varying null,
	fossa_comum character varying null,
	fossa_septica character varying null,
	galpao character varying null,
	gerador_fossil character varying null,
	impressora character varying null,
	impressora_multiuso character varying null,
	inep_escola integer null,
	interior_capital character varying null,
	internet_administrativo character varying null,
	internet_comunidade character varying null,
	internet_ensino_aprendizagem character varying null,
	internet_uso_aluno character varying null,
	lab_ciencias character varying null,
	lab_edu_profissional character varying null,
	lab_informatica character varying null,
	localizacao character varying null,
	localizacao_diferenciada character varying null,
	lousa_digital character varying null,
	municipio character varying null,
	nenhum_equipamento character varying null,
	outras_dependencias character varying null,
	outros character varying null,
	parque_infantil character varying null,
	patio_coberto character varying null,
	patio_descoberto character varying null,
	pisca character varying null,
	piscina character varying null,
	pisos_tateis character varying null,
	poco_artesiano character varying null,
	possui_acesso_internet character varying null,
	possui_banda_larga character varying null,
	predio_compartilhado_outra_escola character varying null,
	predio_escolar character varying null,
	qtd_computador_portatil integer null,
	qtd_datashow integer null,
	qtd_desktop integer null,
	qtd_dvds integer null,
	qtd_lousa_digital integer null,
	qtd_som integer null,
	qtd_tablet integer null,
	qtd_tv integer null,
	quadra_esporte character varying null,
	quadra_esporte_coberta character varying null,
	quadra_esporte_descoberta character varying null,
	queima character varying null,
	rampas character varying null,
	reciclagem character varying null,
	refeitorio character varying null,
	reutiliza character varying null,
	salas_outras_escolas character varying null,
	scanner character varying null,
	separacao character varying null,
	servico_coleta character varying null,
	sinal_sonoro character varying null,
	sinal_tatil character varying null,
	sinal_visual character varying null,
	sl_acessiveis integer null,
	sl_atelie_arte character varying null,
	sl_climatizadas integer null,
	sl_dentro_predio integer null,
	sl_diretoria character varying null,
	sl_fora_predio integer null,
	sl_leitura character varying null,
	sl_multiuso character varying null,
	sl_musica_coral character varying null,
	sl_oficina_edu_profissional character varying null,
	sl_professor character varying null,
	sl_recurso_aee character varying null,
	sl_repouso_aluno character varying null,
	sl_secretaria character varying null,
	sl_studio_danca character varying null,
	socioeducativo character varying null,
	tablet character varying null,
	terreirao character varying null,
	total_sl_utilizadas integer null,
	tp_ocupacao_galpao character varying null,
	tp_ocupacao_predio_escolar character varying null,
	tp_rede_local character varying null,
	tratamento_inexistente character varying null,
	tv character varying null,
	unidade_prisio_socio character varying null,
	unidade_prisional character varying null,
	vao_livre character varying null,
	viveiro character varying null
);


alter table educacao.censo21infra rename column agua_inexisente to agua_inexistente;
alter table educacao.censo21infra rename column banheiro_funcionario to banheiro_funcionarios;
alter table educacao.censo21infra rename column banheiro_pne to banheiro_portador_necessidades_especiais;
alter table educacao.censo21infra rename column biblioteca_sl_leitura to biblioteca_sala_leitura;
alter table educacao.censo21infra rename column descarta_outro to descarta_outra_area;
alter table educacao.censo21infra rename column destino_final to destino_final_publico;
alter table educacao.censo22infra rename column fossa_septca to fossa_septica;
alter table educacao.censo21infra rename column dentro_predio to sl_dentro_predio;
alter table educacao.censo21infra rename column fora_predio to sl_fora_predio;
alter table educacao.censo22infra rename column sl_dentro_pedrio to sl_dentro_predio;
alter table educacao.censo22infra rename column educacao_indigina to educacao_indigena;
alter table educacao.censo22infra rename column galpao_rancho to galpao;
alter table educacao.censo21infra rename column ine_escola to inep_escola;
alter table educacao.censo21infra rename column "patio-coberto" to patio_coberto;
alter table educacao.censo21infra rename column piso_tateis to pisos_tateis;
alter table educacao.censo22infra rename column internet_adiministrativo to internet_administrativo;
alter table educacao.censo21infra rename column acesso_banda_larga to possui_banda_larga;
alter table educacao.censo22infra rename column internet_alunos to internet_uso_aluno;
alter table educacao.censo22infra rename column possui_internet to possui_acesso_internet;
alter table educacao.censo21infra rename column unid_prisional to unidade_prisional;
alter table educacao.censo21infra rename column tp_ocupacao to tp_ocupacao_predio_escolar;
alter table educacao.censo21infra rename column tp_ocupacao_1 to tp_ocupacao_galpao;
alter table educacao.censo22infra rename column tipo_ocupacao_predio_escolar to tp_ocupacao_predio_escolar;
alter table educacao.censo21infra rename column total_salas to total_sl_utilizadas;
alter table educacao.censo21infra rename column tp_rede to tp_rede_local;
alter table educacao.censo21infra rename column secretaria to sl_secretaria;
alter table educacao.censo22infra rename column sl_professoress to sl_professor;
alter table educacao.censo21infra rename column sl_acessibilidade to sl_acessiveis;
alter table educacao.censo22infra rename column tatamento_inexistente to tratamento_inexistente;
alter table educacao.censo21infra rename column sl_estudio_danca to sl_studio_danca;
alter table educacao.censo21infra rename column sl_atemdimento_especial to sl_recurso_aee;
alter table educacao.censo21infra rename column "local" to interior_capital;


-- carga dos dados do censo infra de 2021 e 2022

with c21 as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo21infra'), 
c22 as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo22infra'), 		
ci as ( 
	SELECT
		column_name as coluna
	FROM
		information_schema.columns
	WHERE
		table_schema = 'educacao'
		AND table_name = 'censo_infra')
select string_agg(t.coluna, ',' order by coluna)  from ( 
select coluna from c22
intersect
select coluna from ci) as t;

select count(*) from educacao.censo21infra ci; -- 5409
select count(*) from educacao.censo22infra ci; -- 5463

select count(*), 5409 + 5463 from educacao.censo_infra;

--delete from educacao.censo_infra;
select * from educacao.censo_infra;

-- adicionamos coluna data_censo para separar os dados de 2021 e 2022
alter table educacao.censo_infra add column data_censo date;

-- carga de censo_infra 2021
INSERT INTO educacao.censo_infra
(data_censo, acessibilidade_inexistente,agua_inexistente,agua_potavel,agua_rede_publica,almoxarifado,area_verde,auditorio,banheiro,banheiro_chuveiro,banheiro_edu_infantil,banheiro_funcionarios,banheiro_portador_necessidades_especiais,biblioteca,biblioteca_sala_leitura,cacimba,corrimao,cozinha,dependencia_administrativa,descarta_outra_area,despensa,destino_final_publico,dormitorio_aluno,dormitorio_professor,elevador,energia_inexistente,energia_rede_publica,energia_renovavel,enterra,escola,esgoto_inexistente,esgoto_rede_publica,fonte_rio,fossa,fossa_comum,fossa_septica,galpao,gerador_fossil,inep_escola,interior_capital,internet_administrativo,internet_comunidade,internet_ensino_aprendizagem,internet_uso_aluno,lab_ciencias,lab_informatica,localizacao,localizacao_diferenciada,municipio,outras_dependencias,outros,parque_infantil,patio_coberto,patio_descoberto,pisca,pisos_tateis,poco_artesiano,possui_acesso_internet,possui_banda_larga,predio_escolar,quadra_esporte,quadra_esporte_coberta,quadra_esporte_descoberta,queima,rampas,reciclagem,refeitorio,reutiliza,separacao,servico_coleta,sinal_sonoro,sinal_tatil,sinal_visual,sl_acessiveis,sl_atelie_arte,sl_climatizadas,sl_dentro_predio,sl_diretoria,sl_fora_predio,sl_leitura,sl_multiuso,sl_musica_coral,sl_professor,sl_recurso_aee,sl_repouso_aluno,sl_secretaria,sl_studio_danca,socioeducativo,terreirao,total_sl_utilizadas,tp_ocupacao_galpao,tp_ocupacao_predio_escolar,tp_rede_local,tratamento_inexistente,unidade_prisional,vao_livre,viveiro)
select '2021-01-01'::date, acessibilidade_inexistente,agua_inexistente,agua_potavel,agua_rede_publica,almoxarifado,area_verde,auditorio,banheiro,banheiro_chuveiro,banheiro_edu_infantil,banheiro_funcionarios,banheiro_portador_necessidades_especiais,biblioteca,biblioteca_sala_leitura,cacimba,corrimao,cozinha,dependencia_administrativa,descarta_outra_area,despensa,destino_final_publico,dormitorio_aluno,dormitorio_professor,elevador,energia_inexistente,energia_rede_publica,energia_renovavel,enterra,escola,esgoto_inexistente,esgoto_rede_publica,fonte_rio,fossa,fossa_comum,fossa_septica,galpao,gerador_fossil,inep_escola,interior_capital,internet_administrativo,internet_comunidade,internet_ensino_aprendizagem,internet_uso_aluno,lab_ciencias,lab_informatica,localizacao,localizacao_diferenciada,municipio,outras_dependencias,outros,parque_infantil,patio_coberto,patio_descoberto,pisca,pisos_tateis,poco_artesiano,possui_acesso_internet,possui_banda_larga,predio_escolar,quadra_esporte,quadra_esporte_coberta,quadra_esporte_descoberta,queima,rampas,reciclagem,refeitorio,reutiliza,separacao,servico_coleta,sinal_sonoro,sinal_tatil,sinal_visual,sl_acessiveis,sl_atelie_arte,sl_climatizadas,sl_dentro_predio,sl_diretoria,sl_fora_predio,sl_leitura,sl_multiuso,sl_musica_coral,sl_professor,sl_recurso_aee,sl_repouso_aluno,sl_secretaria,sl_studio_danca,socioeducativo,terreirao,total_sl_utilizadas,tp_ocupacao_galpao,tp_ocupacao_predio_escolar,tp_rede_local,tratamento_inexistente,unidade_prisional,vao_livre,viveiro
from educacao.censo21infra ci;

-- carga censo_infra de 2022
INSERT INTO educacao.censo_infra
(data_censo, acessibilidade_inexistente,agua_inexistente,agua_potavel,agua_rede_publica,almoxarifado,antena_parabolica,aparelho_som,area_verde,auditorio,banheiro,banheiro_chuveiro,banheiro_edu_infantil,banheiro_funcionarios,banheiro_portador_necessidades_especiais,biblioteca,biblioteca_sala_leitura,cacimba,computador,computador_portatil,corrimao,cozinha,datashow,dependencia_administrativa,descarta_outra_area,desktop,despensa,destino_final_publico,dormitorio_aluno,dormitorio_professor,dvd,educacao_indigena,elevador,energia_inexistente,energia_rede_publica,energia_renovavel,enterra,escola,esgoto_inexistente,esgoto_rede_publica,fonte_rio,fossa,fossa_comum,fossa_septica,galpao,gerador_fossil,impressora,impressora_multiuso,inep_escola,internet_administrativo,internet_comunidade,internet_ensino_aprendizagem,internet_uso_aluno,lab_ciencias,lab_edu_profissional,lab_informatica,localizacao,localizacao_diferenciada,lousa_digital,municipio,nenhum_equipamento,outras_dependencias,outros,parque_infantil,patio_coberto,patio_descoberto,piscina,pisos_tateis,poco_artesiano,possui_acesso_internet,possui_banda_larga,predio_compartilhado_outra_escola,predio_escolar,qtd_computador_portatil,qtd_datashow,qtd_desktop,qtd_dvds,qtd_lousa_digital,qtd_som,qtd_tablet,qtd_tv,quadra_esporte,quadra_esporte_coberta,quadra_esporte_descoberta,queima,rampas,reciclagem,refeitorio,reutiliza,salas_outras_escolas,scanner,separacao,servico_coleta,sinal_sonoro,sinal_tatil,sinal_visual,sl_acessiveis,sl_atelie_arte,sl_climatizadas,sl_dentro_predio,sl_diretoria,sl_fora_predio,sl_leitura,sl_multiuso,sl_musica_coral,sl_oficina_edu_profissional,sl_professor,sl_recurso_aee,sl_repouso_aluno,sl_secretaria,sl_studio_danca,socioeducativo,tablet,terreirao,total_sl_utilizadas,tp_ocupacao_galpao,tp_ocupacao_predio_escolar,tp_rede_local,tratamento_inexistente,tv,unidade_prisio_socio,unidade_prisional,vao_livre,viveiro)
select '2022-01-01'::date, acessibilidade_inexistente,agua_inexistente,agua_potavel,agua_rede_publica,almoxarifado,antena_parabolica,aparelho_som,area_verde,auditorio,banheiro,banheiro_chuveiro,banheiro_edu_infantil,banheiro_funcionarios,banheiro_portador_necessidades_especiais,biblioteca,biblioteca_sala_leitura,cacimba,computador,computador_portatil,corrimao,cozinha,datashow,dependencia_administrativa,descarta_outra_area,desktop,despensa,destino_final_publico,dormitorio_aluno,dormitorio_professor,dvd,educacao_indigena,elevador,energia_inexistente,energia_rede_publica,energia_renovavel,enterra,escola,esgoto_inexistente,esgoto_rede_publica,fonte_rio,fossa,fossa_comum,fossa_septica,galpao,gerador_fossil,impressora,impressora_multiuso,inep_escola,internet_administrativo,internet_comunidade,internet_ensino_aprendizagem,internet_uso_aluno,lab_ciencias,lab_edu_profissional,lab_informatica,localizacao,localizacao_diferenciada,lousa_digital,municipio,nenhum_equipamento,outras_dependencias,outros,parque_infantil,patio_coberto,patio_descoberto,piscina,pisos_tateis,poco_artesiano,possui_acesso_internet,possui_banda_larga,predio_compartilhado_outra_escola,predio_escolar,qtd_computador_portatil,qtd_datashow,qtd_desktop,qtd_dvds,qtd_lousa_digital,qtd_som,qtd_tablet,qtd_tv,quadra_esporte,quadra_esporte_coberta,quadra_esporte_descoberta,queima,rampas,reciclagem,refeitorio,reutiliza,salas_outras_escolas,scanner,separacao,servico_coleta,sinal_sonoro,sinal_tatil,sinal_visual,sl_acessiveis,sl_atelie_arte,sl_climatizadas,sl_dentro_predio,sl_diretoria,sl_fora_predio,sl_leitura,sl_multiuso,sl_musica_coral,sl_oficina_edu_profissional,sl_professor,sl_recurso_aee,sl_repouso_aluno,sl_secretaria,sl_studio_danca,socioeducativo,tablet,terreirao,total_sl_utilizadas,tp_ocupacao_galpao,tp_ocupacao_predio_escolar,tp_rede_local,tratamento_inexistente,tv,unidade_prisio_socio,unidade_prisional,vao_livre,viveiro
from educacao.censo22infra ci;

select destino_final from educacao.censo21infra ci;
select destino_final_publico from educacao.censo22infra ci;


select * from c21, c22 where c21.coluna = c22.coluna;


alter table educacao.censo_infra add column pontuacao int;
-- soma a pontuação de cada escola. 
UPDATE educacao.censo_infra
SET pontuacao = (
    (CASE WHEN acessibilidade_inexistente = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN agua_inexistente = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN agua_potavel = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN agua_rede_publica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN almoxarifado = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN aparelho_som = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN antena_parabolica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN area_verde = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN auditorio = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN banheiro = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN banheiro_chuveiro = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN banheiro_edu_infantil = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN banheiro_funcionarios = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN banheiro_portador_necessidades_especiais = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN biblioteca = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN biblioteca_sala_leitura = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN cacimba = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN computador = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN computador_portatil = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN corrimao = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN cozinha = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN datashow = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN dependencia_administrativa = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN descarta_outra_area = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN desktop = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN despensa = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN destino_final_publico = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN dormitorio_aluno = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN dormitorio_professor = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN dvd = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN educacao_indigena = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN elevador = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN energia_inexistente = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN energia_rede_publica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN energia_renovavel = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN enterra = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN esgoto_inexistente = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN esgoto_rede_publica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN fonte_rio = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN fossa = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN fossa_comum = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN fossa_septica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN galpao = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN gerador_fossil = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN impressora = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN impressora_multiuso = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN internet_administrativo = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN internet_comunidade = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN internet_ensino_aprendizagem = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN internet_uso_aluno = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN lab_ciencias = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN lab_edu_profissional = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN lab_informatica = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN lousa_digital = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN nenhum_equipamento = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN outras_dependencias = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN outros = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN parque_infantil = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN patio_coberto = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN patio_descoberto = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN pisca = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN piscina = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN pisos_tateis = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN poco_artesiano = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN possui_acesso_internet = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN possui_banda_larga = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN predio_compartilhado_outra_escola = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN predio_escolar = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN quadra_esporte = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN quadra_esporte_coberta = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN quadra_esporte_descoberta = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN queima = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN rampas = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN reciclagem = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN refeitorio = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN reutiliza = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN salas_outras_escolas = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN scanner = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN separacao = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN servico_coleta = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sinal_sonoro = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sinal_tatil = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sinal_visual = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_atelie_arte = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_diretoria = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_leitura = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_multiuso = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_musica_coral = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_oficina_edu_profissional = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_professor = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_recurso_aee = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_repouso_aluno = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_secretaria = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN sl_studio_danca = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN socioeducativo = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN tablet = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN terreirao = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN tratamento_inexistente = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN tv = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN unidade_prisio_socio = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN unidade_prisional = 'SIM' THEN 1 ELSE 0 END) +
    (CASE WHEN vao_livre = 'SIM' THEN 1 ELSE 0 END)
  );
   
 
 
 -- União das duas tabelas para uma tabela escola
 
 create table educacao.escola as
 select distinct inep_escola, escola from educacao.censo_infra ci
 union
 select distinct inep_escola, escola from educacao.censo_matricula cm
 
 
 select * from educacao.escola;
 
 select data_censo, inep_escola, count(*) over() as total_linhas from educacao.censo_matricula cm
 
 select distinct dependencia_administrativa, data_censo, inep_escola from educacao.censo_matricula cm where data_censo = '2021-01-01'; -- 5357
 select distinct dependencia_administrativa, data_censo, inep_escola from educacao.censo_matricula cm where data_censo = '2022-01-01'; -- 5402
 
 select count(inep_escola) from educacao.escola e; -- 5549 escolas distintas
 
 -- retirar inpep duplicados e escolher um nome de escola
with e as (
	 select inep_escola, string_agg(distinct e.escola,',') as lista_nomes from educacao.escola e group by inep_escola)
select * from e where lista_nomes ilike '%,%';

 -- selecionar inpep duplicados e escolher o nome de escola com o maior tamanho de caracteres
with e as (
	 select inep_escola, escola, row_number() over(partition by inep_escola order by length(escola)) as indice, count(*) over(partition by inep_escola) as total_repeticoes, length(escola) as tam_nome_escola from educacao.escola e)
select * from e where e.total_repeticoes > 1  -- and indice = 2
order by inep_escola;

 -- retirar inpep duplicados e deletar o nome de escola com o menor tamanho de caracteres
create table educacao.tmp_escola_removidas as
with e as (
	select
		inep_escola,
		escola,
		row_number() over(partition by inep_escola
	order by
		length(escola)) as indice,
		count(*) over(partition by inep_escola) as total_repeticoes,
		length(escola) as tam_nome_escola
	from
		educacao.escola)
select
	e.inep_escola,
	e.escola
from
	e
where
	e.total_repeticoes > 1
	and indice = 1;

delete from educacao.escola e where (e.inep_escola, e.escola) in (select * from educacao.tmp_escola_removidas);
 
select * from educacao.escola e where e.escola ilike '%¬%';
delete from educacao.escola e where e.escola ilike '%¬%';

select inep_escola, escola from educacao.censo_infra ci where not exists (select 1 from educacao.escola e where e.inep_escola = ci.inep_escola and e.escola = ci.escola);
select inep_escola, escola from educacao.censo_matricula cm where not exists (select 1 from educacao.escola e where e.inep_escola = cm.inep_escola and e.escola = cm.escola);

select
	e.inep_escola,
	e.escola,
	ci.inep_escola,
	ci.escola
from
	educacao.censo_infra ci
	left join educacao.escola e on	e.inep_escola = ci.inep_escola -- and e.escola = ci.escola
where
	e.inep_escola is null;

select
	e.inep_escola,
	e.escola,
	cm.inep_escola,
	cm.escola
from
	educacao.censo_matricula cm
	left join educacao.escola e on	e.inep_escola = cm.inep_escola -- and e.escola = cm.escola
where
	e.inep_escola is null;

select * from educacao.escola e where e.inep_escola in (13031368,13097490,13007572);


insert into educacao.escola (inep_escola, escola) 
select
	cm.inep_escola,
	cm.escola
from
	educacao.censo_matricula cm
	left join educacao.escola e on	e.inep_escola = cm.inep_escola -- and e.escola = cm.escola
where
	e.inep_escola is null;




-- recu

alter table educacao.censo_matricula add constraint constraint_pk primary key (inep_escola, data_censo)
   
alter table educacao.escola add column dependencia_administrativa varchar;

-- atualizando depois de comparar as dependencias administrativas das duas tabelas infra e matricula, escolhemos a dep da tabela matricula porque estava mais organizada
update educacao.escola e set dependencia_administrativa = t.cm_dep from (
	select
		distinct 
		ci.inep_escola,
		--ci.dependencia_administrativa as ci_dep,
		cm.dependencia_administrativa as cm_dep
	from
		educacao.censo_infra ci
		join educacao.censo_matricula cm on	ci.inep_escola = cm.inep_escola and cm.data_censo = ci.data_censo) as t
where e.inep_escola = t.inep_escola
/*
where 
	ci.dependencia_administrativa not ilike '%' || cm.dependencia_administrativa || '%';
	--ci.dependencia_administrativa <> cm.dependencia_administrativa;
*/


select distinct e.dependencia_administrativa from educacao.escola e;

select inep_escola from educacao.escola e where e.dependencia_administrativa is null;

select dependencia_administrativa from educacao.censo_matricula cm where cm.inep_escola in
(select inep_escola from educacao.escola e where e.dependencia_administrativa is null);
   
with t as 
(select ci.inep_escola, dependencia_administrativa, row_number() over(partition by ci.inep_escola order by length(ci.dependencia_administrativa)) as indice from educacao.censo_infra ci where ci.inep_escola in
(select inep_escola from educacao.escola e where e.dependencia_administrativa is null) order by ci.inep_escola)
update educacao.escola e set dependencia_administrativa = t.dependencia_administrativa from t where t.indice = 1 and t.inep_escola = e.inep_escola;

update educacao.escola set dependencia_administrativa = 'PRIVADA' where dependencia_administrativa = '4 - PRIVADA';
update educacao.escola set dependencia_administrativa = 'MUNICIPAL' where dependencia_administrativa = '3 - MUNICIPAL';
   
   
 
 --  função pra remover os acentos(ela está no: spede->public->funções)
 select distinct municipio, upper (public.fc_utils_string_normalize(municipio)) from educacao.censo_infra ci order by 1 
 
 
 -- atualiza na tabela para remover os acentos e duplicados
 update  educacao.censo_infra set municipio = upper (public.fc_utils_string_normalize(municipio));
 
 
select count(almoxarifado) from educacao.censo_infra ci where almoxarifado = 'NÃO' and data_censo = '2021-01-01'


select count(almoxarifado) from educacao.censo_infra ci2 

select count(distinct escola) from educacao.censo_infra ci where ci.data_censo = '2021-01-01' and municipio = 'LABREA' and dependencia_administrativa = 'MUNICIPAL'

select escola, inep_escola from educacao.censo_infra ci where ci.data_censo = '2021-01-01' and municipio = 'LABREA' and dependencia_administrativa = 'MUNICIPAL' order by 1;


select count(escola) from educacao.censo_matricula cm where cm.data_censo = '2021-01-01'

select * from educacao.censo_matricula cm where cm.inep_escola = 13105760;
select * from educacao.censo_matricula cm where cm.escola ilike '%LABREA%';

select * from educacao.censo21matricula cm where cm.inep_escola = 13105760;
select * from educacao.censo21matricula cm where cm.escola ilike '%LABREA%';


CENTRO ESPERANCA DE LABREA 13105760

select escola, inep_escola, esgoto_rede_publica from educacao.censo_infra ci where municipio = 'HUMAITA' and dependencia_administrativa = 'MUNICIPAL' and data_censo = '2021-01-01'


select count(inep_escola) from educacao.censo_infra ci where municipio = 'HUMAITA' and dependencia_administrativa = 'MUNICIPAL' and data_censo = '2021-01-01' and localizacao in ('RURAL', 'URBANA')

   





