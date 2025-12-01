-- 01_ddl_criacao_tabelas.sql

-- Criação da Tabela TUTOR
CREATE TABLE TUTOR (
    id_tutor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- Criação da Tabela VETERINARIO
CREATE TABLE VETERINARIO (
    id_vet SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    crmv VARCHAR(20) UNIQUE NOT NULL
);

-- Criação da Tabela PROCEDIMENTO
CREATE TABLE PROCEDIMENTO (
    id_proc SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor DECIMAL(10, 2) NOT NULL CHECK (valor > 0),
    descricao TEXT
);

-- Criação da Tabela ANIMAL (Com FK para TUTOR)
CREATE TABLE ANIMAL (
    id_animal SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    data_nascimento DATE,
    id_tutor INT NOT NULL,
    CONSTRAINT fk_animal_tutor FOREIGN KEY (id_tutor)
        REFERENCES TUTOR (id_tutor)
        ON DELETE CASCADE -- Se o tutor for deletado, seus animais são deletados.
);

-- Criação da Tabela CONSULTA (Com FKs para ANIMAL e VETERINARIO)
CREATE TABLE CONSULTA (
    id_consulta SERIAL PRIMARY KEY,
    data_consulta TIMESTAMP NOT NULL,
    motivo TEXT,
    id_animal INT NOT NULL,
    id_vet INT NOT NULL,
    CONSTRAINT fk_consulta_animal FOREIGN KEY (id_animal)
        REFERENCES ANIMAL (id_animal)
        ON DELETE RESTRICT, -- Não permite deletar animal com consultas ativas.
    CONSTRAINT fk_consulta_vet FOREIGN KEY (id_vet)
        REFERENCES VETERINARIO (id_vet)
        ON DELETE RESTRICT -- Não permite deletar vet com histórico de consultas.
);

-- Criação da Tabela PAGAMENTO (Com FK UNIQUE para CONSULTA - Relacionamento 1:1)
CREATE TABLE PAGAMENTO (
    id_pagamento SERIAL PRIMARY KEY,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    id_consulta INT UNIQUE NOT NULL,
    CONSTRAINT fk_pagamento_consulta FOREIGN KEY (id_consulta)
        REFERENCES CONSULTA (id_consulta)
        ON DELETE CASCADE -- Se a consulta for deletada, o pagamento é deletado.
);

-- Criação da Tabela CONSULTA_PROCEDIMENTO (Tabela Associativa N:N)
CREATE TABLE CONSULTA_PROCEDIMENTO (
    id_consulta INT NOT NULL,
    id_proc INT NOT NULL,
    PRIMARY KEY (id_consulta, id_proc),
    CONSTRAINT fk_cp_consulta FOREIGN KEY (id_consulta)
        REFERENCES CONSULTA (id_consulta)
        ON DELETE CASCADE, -- Se a consulta é deletada, seus procedimentos associados também são.
    CONSTRAINT fk_cp_procedimento FOREIGN KEY (id_proc)
        REFERENCES PROCEDIMENTO (id_proc)
        ON DELETE RESTRICT -- Não permite deletar procedimento que está associado a alguma consulta.
);
