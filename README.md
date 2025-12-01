# petvida-banco-de-dados
Implementação e manipulação SQL do Minimundo PetVida

# petvida-banco-de-dados
Implementação e manipulação SQL do Minimundo PetVida
#  Sistema de Gestão da Clínica Veterinária PetVida

Projeto de implementação e manipulação de dados em SQL, referente à Experiência Prática IV, baseado no Modelo Lógico desenvolvido.

##  Configuração e Execução

Este projeto utiliza a linguagem **SQL** padrão e pode ser executado em SGBDs como PostgreSQL (preferencial) ou MySQL.

### Pré-requisitos
- SGBD instalado (PostgreSQL, MySQL, etc.)
- Ferramenta de gerenciamento (PGAdmin, MySQL Workbench ou DBeaver).

### Passos de Execução

1. **Criação do Banco de Dados:** Crie um novo banco de dados (ex: `petvida_db`).
2. **Execução do DDL:** Execute o script `01_ddl_criacao_tabelas.sql` para criar todas as tabelas e definir as chaves primárias e estrangeiras.
3. **Inserção de Dados:** Execute o script `02_dml_insercao_dados.sql` para popular as tabelas com dados de exemplo.
4. **Testes de Manipulação:** Execute os scripts `03_dml_consultas_select.sql` e `04_dml_manipulacao_dados.sql` para testar as consultas e comandos de atualização e exclusão.

##  Modelo Lógico Implementado

O modelo contém as tabelas: TUTOR, ANIMAL, VETERINARIO, CONSULTA, PROCEDIMENTO, PAGAMENTO e CONSULTA_PROCEDIMENTO (Tabela Associativa).
