

--CRIANDO O MODELO FISICO
CREATE TABLE IF NOT EXISTS  usuario (
    id_usuario    INT NOT NULL PRIMARY KEY,
    cpf    CHAR(20) NOT NULL,
    nome    VARCHAR(255) NOT NULL,
    area_de_pesquisa    VARCHAR(255),
    instituicao    VARCHAR(255),
    data_de_nascimento    DATE,
    login    VARCHAR(255) NOT NULL,
    senha    VARCHAR(255) NOT NULL,
    id_tutor   INT references usuario(id_usuario),
	UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS  perfil (
    id_perfil    INT NOT NULL PRIMARY KEY,
    codigo    VARCHAR(255) NOT NULL,
    tipo    VARCHAR(255),
	UNIQUE (codigo)
);

--Relacionamento possui
CREATE TABLE IF NOT EXISTS  possui (
    id_usuario    INT NOT NULL references usuario(id_usuario),
    id_perfil    INT NOT NULL references perfil(id_perfil), 
	UNIQUE (id_usuario, id_perfil)
);

CREATE TABLE IF NOT EXISTS  servico (
    id_servico    INT NOT NULL PRIMARY KEY,
    nome    VARCHAR(255) NOT NULL,
    classe    VARCHAR(255) NOT NULL CHECK (classe IN ('visualização', 'inserção', 'alteração', 'remoção')),
	UNIQUE (nome, classe)
);

--Relacionamento pertence
CREATE TABLE IF NOT EXISTS pertence (
    id_servico    INT NOT NULL references servico(id_servico),
    id_perfil    INT NOT NULL references perfil(id_perfil),
	UNIQUE (id_servico, id_perfil)
);

--Relacionamento tutelamento
CREATE TABLE IF NOT EXISTS tutelamento (
    id_usuario_tutelado    INT NOT NULL references usuario(id_usuario),
    id_tutor    INT NOT NULL references usuario(id_usuario),
    id_servico    INT NOT NULL references servico(id_servico),
    id_perfil    INT NOT NULL references perfil(id_perfil),
    data_de_inicio    DATE NOT NULL,
    data_de_termino    DATE,
	UNIQUE (id_usuario_tutelado, id_tutor, id_servico, id_perfil)
);

CREATE TABLE IF NOT EXISTS paciente (
    id_paciente    INT NOT NULL PRIMARY KEY,
    cpf    VARCHAR(20) NOT NULL,
    nome    VARCHAR(255) NOT NULL,
    endereco    VARCHAR(255) NOT NULL,
    nascimento    DATE NOT NULL,
	UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS exame (
    id_exame    INT NOT NULL PRIMARY KEY,
    tipo    VARCHAR(255) NOT NULL,
    virus    VARCHAR(255) NOT NULL,
	UNIQUE (tipo, virus)
);

--Relacionamento gerencia
CREATE TABLE IF NOT EXISTS gerencia (
    id_servico    INT NOT NULL references servico(id_servico),
    id_exame    INT NOT NULL references exame(id_exame),
	UNIQUE (id_servico, id_exame)
);

--Relacionamento realiza
CREATE TABLE IF NOT EXISTS realiza (
    id_paciente    INT NOT NULL references paciente(id_paciente),
    id_exame    INT NOT NULL references exame(id_exame),
    codigo_amostra    VARCHAR(255),
    data_de_realizacao TIMESTAMP,
	data_de_solicitacao TIMESTAMP,
	UNIQUE (id_paciente, id_exame, data_de_realizacao)
);

--Agregado amostra
CREATE TABLE IF NOT EXISTS amostra (
    id_paciente    INT NOT NULL references paciente(id_paciente),
    id_exame    INT NOT NULL references exame(id_exame),
    codigo_amostra    VARCHAR(255) NOT NULL,    
    metodo_de_coleta    VARCHAR(255) NOT NULL,
    material    VARCHAR(255) NOT NULL,
	UNIQUE (id_paciente, id_exame, codigo_amostra)
);

CREATE TABLE IF NOT EXISTS historico(
	id_usuario    INT NOT NULL references usuario(id_usuario),
	id_servico    INT NOT NULL references servico(id_servico),
	id_exame      INT NOT NULL references exame(id_exame),
	data_de_realizacao  TIMESTAMP NOT NULL,
	UNIQUE ( id_usuario, id_servico,id_exame )
);





