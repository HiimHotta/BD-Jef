INSERT INTO public.paciente(
	id_paciente, cpf, nome, endereco, nascimento)
	VALUES 
	(01,'452.056.479-49' , 'Diogo Araujo'       , 'Rua Independência 527'    ,'12-10-77' ),
	(02,'986.978.571-98' , 'Breno Oliveira'     , '1127 Heavner Avenue'      ,'11-10-77' ),
	(01,'814.105.821-59' , 'Carlos Melo'        , 'Vila São Luís Gonzaga 338','11-11-77' ),
	(03,'209.173.116-12' , 'Emilly Pereira'     , 'Rua São Julião 1127'      ,'12-10-70' ),
	(04,'105.410.389-58' , 'Carla Henderson'    , 'Rua Santa Laura 1479'     ,'09-10-70' ),
	(05,'250.558.706-05' , 'Manuela Almeida'    , '1519 Reeves Street'       ,'09-11-71'  ),
	(06,'261.707.710-11' , 'Lucas Melo'         , '1197 Cost Avenue'         ,'11-08-79'  ),
	(07,'868.882.262-04' , 'Carla Silva'        , 'Avenida Itaité 1281'      ,'11-10-88'  ),
	(08,'322.555.141-58' ,'Gabrielle Rodrigues' , '326 Dogwood Lane'         ,'11-10-87' ),
	(09,'868.882.272-04' , 'Brandon Novak'      , 'Rua Carlos Roberto 1572'  ,'11-11-88' ),
	(10,'868.877.214-04' , 'Renan Cavalcanti'   , '2250 Stonecoal Road'      ,'08-10-88' ),
	(11,'140.456.654-20' , 'Linda Mendez'       , '2077 Holt Street'         ,'08-10-90' ),
	(12,'140.777.254-04' , 'Karen Miller'       , 'Beco Manoel Bandeira 1152','05-07-88' ),
	(13,'547.777.201-04' , 'Tiago Silva'        , 'Praça Doutor Xavier 1508' ,'04-05-78' ),
	(14,'547.877.214-04' , 'Manuela Ribeiro'    , '3100 Fleming Street'      ,'04-06-78' ),
	(15,'140.777.012-04' , 'Paul Ramsey'        , '464 Margaret Street'      ,'03-05-78' ),
	(16,'140.456.012-04',  'Kauê Martins'       , '1150 Counts Lane'         ,'02-05-79'),
	(17,'140.412.772-04', 'Caio Rodrigues'      , '4216 Godfrey Road'        ,'03-05-79' ),
	(18,'105.411.389-58', 'Willie Johnson'      , '464 Lonely Oak Drive'     ,'01-03-74' ),
	(19,'321.555.141-58', 'Blanche Petersen'    , 'Praça Montreal 1843'      ,'10-02-74' ),
	(20,'105.145.987-45', 'Alex Araujo'         , 'Rua Doce 653'             ,'10-07-74' ),
	(21,'175.411.389-58', 'Lara Ribeiro'        , '3640 Fleming Way'         ,'10-09-74' ),
	(22,'145.320.389-55', 'Danielle Rivera'     , '2216 Strother Street'     ,'05-02-74' ),
	(23,'185.411.389-58', 'Wayne Asencio'       , 'Rua Posto da Celpe 528'   ,'11-12-74'),
	(24,'541.411.256-58', 'Luís Silva'          , 'Avenida Visconde de  1001','11-02-62' ),
	(25,'175.711.389-58', 'Beatriz Carvalho'    , '4142 Fleming Street'      ,'10-02-62' ),
	(27,'457.124.389-58', 'Marvin Knowles'      , '4394 Late Avenue'         ,'10-02-64' ),
	(28,'155.555.389-58', 'Nicole Monn'         , 'Quadra Quarenta 1074'     ,'10-12-74' ),
	(29,'105.321.389-58', 'Emilly Barbosa'      , '3305 Harrison Street'     ,'10-11-74' ),
	(30,'654.411.514-58',  'Rebeca Araujo'      , '1670 Tree Top Lane'       ,'10-12-4' )
	on conflict (id_paciente) do nothing; 
	
INSERT INTO perfil (id_perfil,codigo,tipo)  
	VALUES
	(01,'1234566','Pesquisador'),
	(02,'1611612','Aluno'),
	(03,'2346122','Administrador'),
	(04,'4566122','Funcionario'),
	(05,'4523456','Professor')on conflict (id_perfil) do nothing;
	
INSERT INTO servico (id_servico,nome,classe)
	--(solicita exames, insere exames, consulta exames, entre outros)
	--(classe IN ('visualização', 'inserção', 'alteração', 'remoção')),
	VALUES
	--(01,'solicita exames',),
	(02,'insere exames'  ,'inserção'),
	(03,'consulta exames','visualização'),
	(04,'refazer exame'  ,'alteração'),
	(05,'descartar exame','remoção'),
	(06,'alterar exames','alteração')
	on conflict (id_servico) do nothing;	
	
	
INSERT INTO public.exame(
	id_exame, tipo, virus)
	VALUES 
	(01, 'exame sorológico ' ,'HIV'),
	(02, 'exame sorológico' ,' RNA '),
	(03, 'exame sorológico' ,'HSV-2 '),
	(04, 'Isolamento Viral' ,'CHIKUNGUNYA'),
	(05, 'Isolamento Viral' ,'Dengue'),
	(06, 'Isolamento Viral' ,'H1N1'),
	(07, 'Isolamento Viral' ,'HBV'), -- hepatite B
	(08, 'Isolamento Viral' ,'HCV'), --hepatite C
	(09, 'Isolamento Viral' ,'ZIKA')
	on conflict (id_exame) do nothing;	
	
INSERT INTO public.amostra(
	id_paciente, id_exame, codigo_amostra, metodo_de_coleta, material)
	VALUES 
	(1, 1, '00001', 'coleta de sangue', 'sangue' ),
	(2, 1, '00010', 'coleta de sangue', 'sangue' ),
	(3, 5, '00011', 'coleta de sangue', 'sangue' ),
	(4, 5, '00101', 'coleta de sangue',	'sangue' ),
	(5, 5, '00111', 'coleta de sangue', 'sangue' ),
	(6, 5, '01000', 'coleta de sangue', 'sangue' ),
	--(7, 2, null   , 'coleta de sangue', null ),
	--(8, 2, null   , 'coleta de sangue', null ),
	(9, 9, '01010', 'coleta de sangue', 'sangue' ),
	(10, 4,'01101', 'coleta de sangue', 'sangue' )
	on conflict (id_paciente, id_exame, codigo_amostra) do nothing;	
	
INSERT INTO public.gerencia(
	id_servico, id_exame)
	VALUES 
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(4, 8),
	(4, 9),
	(5, 1),
	(5, 2),
	(5, 3),
	(5, 4),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 9),
	(6, 1),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 8),
	(6, 9)
	on conflict(id_servico, id_exame) do nothing;	
	
INSERT INTO usuario (id_usuario, cpf, nome, area_de_pesquisa,instituicao,data_de_nascimento,login,senha,id_tutor) 
	VALUES 
	(01, 333445500, 'John','virologia','USP','12-10-77','JohnD@usp.br',45121346,NULL),
	(02, 333445555, 'Paulo','virologia','USP','12-02-77','Paulo@usp.br',1234566,01),
	(03, 43890050301, 'Isabela','virologia','USP','11-03-78','isabelacostac@sqlliusp.br',0211112366,01),
	(04, 333445550, 'Franklin','Biologia','USP','12-02-70','FranklinFFSilva@usp.br',45787899922,01),
	(05, 69378492223, 'Marisa Dias','Parasitologia','USP','12-02-99','MarisaDSolza@usp.br',51711,01),
	(06, 24305832593, 'Eduardo Santos','Nanotecnologia','USP','12-02-66','EduardoSS@usp.br',4929135,NULL),
	(07, 57971582137, 'Pedro Martins','Entomologia','USP','07-04-77','PedroMartins@usp.br',49146807,NULL),
	(08, 26484797161, 'Mariana Melo','farmacogenética','USP','09-05-88','MarianaMelo@usp.br',730964,NULL) 
	on conflict (id_usuario) do nothing;
	
	
INSERT INTO public.tutelamento(
	id_usuario_tutelado, id_tutor, id_servico, id_perfil, data_de_inicio, data_de_termino)
	VALUES
	(2, 1, 2, 1, '2019-01-22 01:10:11', '2020-05-22 01:10:11'),
	(3, 1, 2, 1, '2018-01-14 05:10:11', '2019-01-22 07:10:11'),
	(4, 1, 2, 1, '2018-04-22 07:10:11', '2020-07-22 11:10:11'),
	(5, 1, 2, 1, '2019-01-22 01:10:11', '2021-07-12 11:09:10')
	on conflict (id_usuario_tutelado, id_tutor, id_servico, id_perfil) do nothing;
	
INSERT INTO public.pertence(
	id_servico, id_perfil)
	VALUES 
	(2, 1), -- insere   , pesquisador
	(3, 1), -- consulta ,  ''
	(4, 1), -- refazer  ,  ''
	(5, 1), -- descartar,  ''
	(6, 1), -- alterar  ,  ''
	(3, 2), -- consulta ,  'aluno'
	(2, 3), -- insere   ,  'adm' 
	(3, 3), -- consulta ,  ''
	(4, 3), -- refazer  ,  ''
	(5, 3), -- descartar,  ''
	(6, 3), -- alterar  ,  ''
	(2, 4), -- insere   ,  funcionario
	(3, 5), -- consulta ,  'professor'
	(6, 5) -- alterar  ,  'professor'
	on conflict (id_servico,id_perfil) do nothing;
	
INSERT INTO public.possui(id_usuario, id_perfil)
	VALUES 
	(1, 1), --John    ,Pesq
	(2, 2), --Paulo   ,aluno
	(3, 2), --Isabela ,aluno
	(4, 2), --Franklin,aluno
	(5, 2), --Marisa  ,aluno
	(6, 3), --Eduardo ,Adm
	(7, 4), --Pedro   ,funcionario
	(8, 4), --Mariana ,funcionario
	(7, 5), --Pedro   ,professor
	(8, 5)  --Mariana ,professor
	on conflict (id_usuario, id_perfil) do nothing;
	
INSERT INTO public.historico(
	id_usuario, id_servico, id_exame, data_de_realizacao)
	VALUES
	(1, 2, 1, '2016-06-21 14:10:22'),
	(1, 2, 1, '2019-07-21 17:10:21'),
	(1, 2, 5, '2020-02-21 19:10:20'),
	(1, 2, 5, '2020-02-09 11:10:25'),
	(1, 2, 5, '2020-03-10 08:10:10'),
	(1, 2, 5, '2020-03-20 11:10:12'),
	(1, 2, 1, '2020-05-22 01:10:11'), --John  	 (Pesq)	,....
	(2, 3, 1, '2020-05-02 01:10:11'), --Paulo    (aluno)	,
	(3, 3, 5, '2020-05-19 01:10:11'), --Isabela  (aluno)	,
	(4, 3, 5, '2020-05-20 01:10:11'), --Franklin (aluno)	,
	(5, 3, 5, '2020-05-22 01:10:11'), --Marisa   (aluno)	,
	(6, 3, 5, '2020-05-30 00:10:11'), --Eduardo  (Adm)		,
	(7, 2, 9, '2020-02-11 11:10:11'), --Pedro    (funcionario),
	(8, 2, 4, '2020-02-11 12:10:11'), --Mariana  (funcionario),
	(7, 3, 2, '2020-05-11 05:10:11'), --Pedro    (professor)	,
	(8, 3, 2, '2020-05-22 01:10:11')  --Mariana (professor)	,
	on conflict (id_usuario, id_servico, id_exame) do nothing;
	
INSERT INTO realiza( id_paciente, id_exame, codigo_amostra, data_de_realizacao,data_de_solicitacao)
	VALUES 
	(1, 1, '00001','2016-06-22 19:10:22','2016-06-21 14:10:22'),
	(2, 1, '00010','2019-07-22 19:10:21','2019-07-21 17:10:21'),
	(3, 5, '00011','2020-02-22 19:10:20','2020-02-21 19:10:20'),
	(4, 5, '00101','2020-02-11 11:10:25','2020-02-09 11:10:25'),
	(5, 5, '00111','2020-03-10 09:10:10','2020-03-10 08:10:10'),
	(6, 5, '01000','2020-04-25 11:10:12','2020-03-20 11:10:12'),
	(7, 2,  null  ,'2020-02-11 11:10:11','2020-02-10 09:10:11'),
	(8, 2,  null  ,'2020-05-26 15:09:11','2020-05-20 09:09:11'),
	(9, 9, '01010','2020-01-11 05:10:11','2020-01-10 00:09:11'),
	(10,4, '01101','2020-04-22 01:10:11','2020-02-22 00:10:11')
	on conflict (id_paciente, id_exame, data_de_realizacao) do nothing;
