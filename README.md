# 📌 Projeto de Modelagem de Banco de Dados - Oficina Mecânica

## 📋 Descrição do Cenário
Sistema para gerenciamento de uma oficina mecânica, controlando clientes, veículos cadastrados, ordens de serviço, mecânicos responsáveis, além do controle de serviços prestados e peças utilizadas.

---

## 🗂️ Lista de Entidades e Atributos

### 1. Cliente (Entidade Forte)
* `id_cliente` (PK - INT)
* `nome` (VARCHAR(100) - NOT NULL)
* `telefone` (VARCHAR(20) - NOT NULL)
* `email` (VARCHAR(100) - UNIQUE)
* `endereco` (VARCHAR(200))

### 2. Veiculo (Entidade Forte)
* `id_veiculo` (PK - INT)
* `placa` (VARCHAR(10) - UNIQUE - NOT NULL)
* `modelo` (VARCHAR(50) - NOT NULL)
* `marca` (VARCHAR(50) - NOT NULL)
* `ano` (INT)
* `id_cliente` (FK - INT - NOT NULL)

### 3. Mecanico (Entidade Forte)
* `id_mecanico` (PK - INT)
* `nome` (VARCHAR(100) - NOT NULL)
* `especialidade` (VARCHAR(50))
* `telefone` (VARCHAR(20))

### 4. Servico (Entidade Forte)
* `id_servico` (PK - INT)
* `descricao` (VARCHAR(100) - NOT NULL)
* `valor_mao_obra` (DECIMAL(10,2) - NOT NULL)

### 5. Peca (Entidade Forte)
* `id_peca` (PK - INT)
* `nome_peca` (VARCHAR(100) - NOT NULL)
* `valor_unitario` (DECIMAL(10,2) - NOT NULL)
* `quantidade_estoque` (INT - NOT NULL)

### 6. OrdemServico (Entidade Forte/Principal)
* `id_os` (PK - INT)
* `data_emissao` (DATE - NOT NULL)
* `data_conclusao` (DATE)
* `status_os` (VARCHAR(30) - NOT NULL)
* `valor_total` (DECIMAL(10,2))
* `id_veiculo` (FK - INT - NOT NULL)
* `id_mecanico` (FK - INT - NOT NULL)

### 7. OS_Servico (Tabela Associativa - N:N)
* `id_os` (PK/FK - INT)
* `id_servico` (PK/FK - INT)
* `quantidade` (INT - NOT NULL)

### 8. OS_Peca (Tabela Associativa - N:N)
* `id_os` (PK/FK - INT)
* `id_peca` (PK/FK - INT)
* `quantidade` (INT - NOT NULL)

---

## 🔗 Relacionamentos e Cardinalidades
* **Cliente 1:N Veiculo**: Um cliente pode ter vários veículos, mas um veículo pertence a apenas um cliente.
* **Veiculo 1:N OrdemServico**: Um veículo pode ter várias ordens de serviço, mas cada OS pertence a um único veículo.
* **Mecanico 1:N OrdemServico**: Um mecânico pode ser responsável por várias ordens de serviço.
* **OrdemServico N:N Servico**: Uma OS pode conter vários serviços e um serviço pode estar em várias OS (tabela `OS_Servico`).
* **OrdemServico N:N Peca**: Uma OS pode utilizar várias peças e uma peça pode ser usada em várias OS (tabela `OS_Peca`).
