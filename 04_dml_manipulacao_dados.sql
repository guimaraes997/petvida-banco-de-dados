-- 04_dml_manipulacao_dados.sql

-- =========================================================
-- COMANDOS UPDATE
-- =========================================================

-- UPDATE 1: Atualizar o telefone de um tutor (ID 3 - Carla Dias).
UPDATE TUTOR
SET telefone = '31955554444'
WHERE id_tutor = 3;

-- UPDATE 2: Ajustar o valor do procedimento 'Vacina V10' para um novo preço.
UPDATE PROCEDIMENTO
SET valor = 95.00
WHERE nome = 'Vacina V10';

-- UPDATE 3: Corrigir a especialidade do Veterinário Dr. Eduardo Rocha.
UPDATE VETERINARIO
SET especialidade = 'Clínica Geral e Cirurgia'
WHERE id_vet = 1;

-- =========================================================
-- COMANDOS DELETE
-- =========================================================

-- DELETE 1: Remover o registro de pagamento de uma consulta, assumindo que foi um estorno. (DELETE simples)
DELETE FROM PAGAMENTO
WHERE id_pagamento = 3; -- Remove o pagamento da consulta do Bolt.

-- DELETE 2: Remover a associação de um procedimento específico de uma consulta. (Respeita PK Composta)
DELETE FROM CONSULTA_PROCEDIMENTO
WHERE id_consulta = 1 AND id_proc = 1; -- Remove a Vacina V10 da primeira consulta.

-- DELETE 3: Remover um tutor que não possui mais animais cadastrados e não tem histórico de consultas diretas (Teste de Integridade Referencial).
-- Nota: Para este exemplo, precisamos garantir que o TUTOR 3 não possui animais.
-- Vamos deletar um registro 'de teste' recém-criado para garantir que não haja violação:
INSERT INTO TUTOR (nome, cpf) VALUES ('Tutor Teste Delete', '00000000000');
DELETE FROM TUTOR
WHERE nome = 'Tutor Teste Delete';
