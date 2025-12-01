-- 02_dml_insercao_dados.sql

-- 1. Inserção em TUTOR
INSERT INTO TUTOR (nome, cpf, telefone, email) VALUES
('Ana Clara Mendes', '11122233344', '11988887777', 'ana.mendes@email.com'),
('Bruno Felipe Souza', '55566677788', '21977776666', 'bruno.souza@email.com'),
('Carla Dias', '99900011122', '31966665555', 'carla.dias@email.com');

-- 2. Inserção em VETERINARIO
INSERT INTO VETERINARIO (nome, especialidade, crmv) VALUES
('Dr. Eduardo Rocha', 'Clínica Geral', 'CRMV/SP 12345'),
('Dra. Fernanda Lima', 'Ortopedia', 'CRMV/RJ 67890');

-- 3. Inserção em PROCEDIMENTO
INSERT INTO PROCEDIMENTO (nome, valor, descricao) VALUES
('Vacina V10', 85.00, 'Vacina polivalente anual para cães.'),
('Consulta de Rotina', 120.00, 'Avaliação geral e check-up.'),
('Hemograma Completo', 60.00, 'Exame laboratorial de sangue.'),
('Internação Diária', 150.00, 'Cuidado intensivo e monitoramento.');

-- 4. Inserção em ANIMAL (Referencia TUTORs 1 e 2)
INSERT INTO ANIMAL (nome, especie, raca, data_nascimento, id_tutor) VALUES
('Rex', 'Cachorro', 'Golden Retriever', '2020-05-15', 1),
('Mia', 'Gato', 'Siamês', '2021-08-20', 1),
('Bolt', 'Cachorro', 'Poodle', '2019-01-01', 2);

-- 5. Inserção em CONSULTA (Referencia ANIMALs e VETERINARIOs)
INSERT INTO CONSULTA (data_consulta, motivo, id_animal, id_vet) VALUES
('2024-03-10 10:00:00', 'Check-up anual e vacinação.', 1, 1), -- Rex (1), Dr. Eduardo (1)
('2024-04-05 14:30:00', 'Vômito e diarreia.', 2, 1), -- Mia (2), Dr. Eduardo (1)
('2024-05-20 09:00:00', 'Avaliação ortopédica.', 3, 2); -- Bolt (3), Dra. Fernanda (2)

-- 6. Inserção em PAGAMENTO (Referencia CONSULTAs 1, 2 e 3)
INSERT INTO PAGAMENTO (forma_pagamento, valor_total, data_pagamento, id_consulta) VALUES
('Cartão de Crédito', 205.00, '2024-03-10', 1),
('Pix', 180.00, '2024-04-05', 2),
('Dinheiro', 120.00, '2024-05-20', 3);

-- 7. Inserção em CONSULTA_PROCEDIMENTO (Relaciona Consultas e Procedimentos)
INSERT INTO CONSULTA_PROCEDIMENTO (id_consulta, id_proc) VALUES
(1, 1), -- Consulta 1 (Rex): Vacina V10
(1, 2), -- Consulta 1 (Rex): Consulta de Rotina
(2, 2), -- Consulta 2 (Mia): Consulta de Rotina
(2, 3), -- Consulta 2 (Mia): Hemograma Completo
(3, 2); -- Consulta 3 (Bolt): Consulta de Rotina
