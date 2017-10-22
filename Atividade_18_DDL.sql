CREATE TABLE JOG_JOGO (
	JOG_NOME NVARCHAR2 (30),
	JOG_VERSAO NUMBER (10),
	JOG_TIPO CHAR(5) NOT NULL,
	JOG_DESCRICAO NVARCHAR2 (200) NOT NULL,
	JOG_QNT_JOGADORES NUMBER (2) NOT NULL,
	JOG_PRECO NUMBER (6, 2),
	JOG_DURACAO NUMBER (2) NOT NULL,
	CONSTRAINT JOG_PK PRIMARY KEY (JOG_NOME, JOG_VERSAO)
	);

CREATE TABLE COM_COMPONENTE (
	COM_NOME NVARCHAR2 (20),
	COM_MATERIAL CHAR (20) NOT NULL,
	CONSTRAINT COM_PK PRIMARY KEY (COM_NOME)
	);

CREATE TABLE CLI_CLIENTE (
	CLI_CPF CHAR (20),
	CLI_NOME NVARCHAR2 (50) NOT NULL,
	CLI_TELEFONE NUMBER (10) NOT NULL,
	CLI_DATA_NASC DATE NOT NULL,
	CONSTRAINT CLI_PK PRIMARY KEY (CLI_CPF)
	);

CREATE TABLE CJO_COMPONENTE_JOGO (
	JOG_NOME NVARCHAR2 (30),
	JOG_VERSAO NUMBER(10),
	COM_NOME NVARCHAR2 (20),
	CJO_QUANTIDADE NUMBER (3) NOT NULL,
	CONSTRAINT CJO_PK PRIMARY KEY (JOG_NOME, JOG_VERSAO, COM_NOME)
	);

CREATE TABLE REG_REGISTRO (
	JOG_NOME NVARCHAR2 (30),
	JOG_VERSAO NUMBER (10),
	CLI_CPF CHAR (20),
	REG_DATA DATE,
	CONSTRAINT REG_PK PRIMARY KEY (JOG_NOME, JOG_VERSAO, CLI_CPF, REG_DATA),
	CONSTRAINT REG_JOG_NOME_V_FK FOREIGN KEY (JOG_NOME, JOG_VERSAO) REFERENCES JOG_JOGO (JOG_NOME, JOG_VERSAO),
	CONSTRAINT REG_CLI_CPF_FK FOREIGN KEY (CLI_CPF) REFERENCES CLI_CLIENTE (CLI_CPF)
	);

ALTER TABLE CJO_COMPONENTE_JOGO ADD CONSTRAINT CJO_JOG_NOME_V_FK FOREIGN KEY (JOG_NOME, JOG_VERSAO) REFERENCES JOG_JOGO (JOG_NOME, JOG_VERSAO);
ALTER TABLE CJO_COMPONENTE_JOGO ADD CONSTRAINT CJO_COM_NOME_FK FOREIGN KEY (COM_NOME) REFERENCES COM_COMPONENTE (COM_NOME);
