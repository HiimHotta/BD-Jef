-- 4.1) 
-- Liste todos os exames realizados, com seus respectivos tipos, bem como
-- os seus pacientes com suas respectivas datas de solicitação e execução.

SELECT nome, tipo, realiza.data_de_solicitacao, realiza.data_de_realizacao
FROM realiza, paciente, exame
WHERE paciente.id_paciente = realiza.id_paciente AND
      exame.id_exame = realiza.id_exame;


--Consulta 4.2) Liste os 5 exames realizados com maior eficiência 
--(diferença entre data de execução e data de solicitação)

SELECT exame.id_exame, tipo,data_de_realizacao, data_de_solicitacao
FROM realiza, exame
WHERE realiza.id_exame = exame.id_exame
ORDER BY data_de_realizacao - data_de_solicitacao
LIMIT 5;


-- 4.3) Liste os serviços que podem ser utilizados pelos os usuários.

(SELECT usuario.nome, servico.nome
FROM usuario,possui, pertence, servico
WHERE usuario.id_usuario  = possui.id_usuario  AND
      possui.id_perfil    = pertence.id_perfil AND 
      pertence.id_servico = servico.id_servico)
UNION
(SELECT DISTINCT usuario.nome, servico.nome
FROM usuario, servico, tutelamento
WHERE  tutelamento.id_tutor   = usuario.id_tutor AND
       tutelamento.id_servico = servico.id_servico);




--4.4) Liste os serviços que podem ser utilizados por usuários tutelados
-- (dependentes)

SELECT DISTINCT usuario.nome, servico.nome
FROM usuario, servico, tutelamento
WHERE  tutelamento.id_tutor = usuario.id_tutor AND
       tutelamento.id_servico = servico.id_servico;

--4.5) Liste em ordem crescente o total de serviços utilizados agrupados
-- pelos tipos de serviços disponíveis e pelo perfil dos usuários.

SELECT DISTINCT perfil.tipo, count (servico.nome) AS countService, servico.nome
FROM servico, perfil, usuario, historico, possui
WHERE historico.id_servico = servico.id_servico AND 
	  historico.id_usuario = usuario.id_usuario AND
	  historico.id_usuario = possui.id_usuario  AND
	  perfil.id_perfil = possui.id_perfil
GROUP BY perfil.tipo, servico.nome

