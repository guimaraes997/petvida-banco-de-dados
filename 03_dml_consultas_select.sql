-- 03_dml_consultas_select.sql

-- CONSULTA 1: Listar todas as consultas, mostrando o nome do animal, o nome do tutor e o veterinário responsável. (Uso de JOINs)
SELECT
    C.data_consulta,
    A.nome AS nome_animal,
    T.nome AS nome_tutor,
    V.nome AS nome_veterinario
FROM CONSULTA C
JOIN ANIMAL A ON C.id_animal = A.id_animal
JOIN TUTOR T ON A.id_tutor = T.id_tutor
JOIN VETERINARIO V ON C.id_vet = V.id_vet
ORDER BY C.data_consulta DESC;

-- CONSULTA 2: Mostrar o total gasto por cada animal, somando os pagamentos. (Uso de JOIN, SUM e GROUP BY)
SELECT
    A.nome AS nome_animal,
    T.nome AS nome_tutor,
    SUM(P.valor_total) AS total_gasto
FROM PAGAMENTO P
JOIN CONSULTA C ON P.id_consulta = C.id_consulta
JOIN ANIMAL A ON C.id_animal = A.id_animal
JOIN TUTOR T ON A.id_tutor = T.id_tutor
GROUP BY A.nome, T.nome
ORDER BY total_gasto DESC;

-- CONSULTA 3: Listar todos os procedimentos realizados em uma consulta específica (ID 2), detalhando o nome do procedimento e seu valor. (Uso de JOIN e WHERE)
SELECT
    C.data_consulta,
    A.nome AS nome_animal,
    P.nome AS nome_procedimento,
    P.valor
FROM CONSULTA_PROCEDIMENTO CP
JOIN CONSULTA C ON CP.id_consulta = C.id_consulta
JOIN ANIMAL A ON C.id_animal = A.id_animal
JOIN PROCEDIMENTO P ON CP.id_proc = P.id_proc
WHERE C.id_consulta = 2;

-- CONSULTA 4: Encontrar os 2 veterinários mais experientes/ativos (mais consultas). (Uso de COUNT e LIMIT)
SELECT
    V.nome AS nome_veterinario,
    V.especialidade,
    COUNT(C.id_consulta) AS numero_consultas
FROM VETERINARIO V
JOIN CONSULTA C ON V.id_vet = C.id_vet
GROUP BY V.nome, V.especialidade
ORDER BY numero_consultas DESC
LIMIT 2;
