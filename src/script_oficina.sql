-- Criação das Tabelas do Sistema de Oficina Mecânica

CREATE TABLE cliente (
                         id_cliente SERIAL PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         telefone VARCHAR(20) NOT NULL,
                         email VARCHAR(100) UNIQUE,
                         endereco VARCHAR(200)
);

CREATE TABLE veiculo (
                         id_veiculo SERIAL PRIMARY KEY,
                         placa VARCHAR(10) UNIQUE NOT NULL,
                         modelo VARCHAR(50) NOT NULL,
                         marca VARCHAR(50) NOT NULL,
                         ano INT,
                         id_cliente INT NOT NULL,
                         CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE mecanico (
                          id_mecanico SERIAL PRIMARY KEY,
                          nome VARCHAR(100) NOT NULL,
                          especialidade VARCHAR(50),
                          telefone VARCHAR(20)
);

CREATE TABLE servico (
                         id_servico SERIAL PRIMARY KEY,
                         descricao VARCHAR(100) NOT NULL,
                         valor_mao_obra DECIMAL(10,2) NOT NULL
);

CREATE TABLE peca (
                      id_peca SERIAL PRIMARY KEY,
                      nome_peca VARCHAR(100) NOT NULL,
                      valor_unitario DECIMAL(10,2) NOT NULL,
                      quantidade_estoque INT NOT NULL
);

CREATE TABLE ordem_servico (
                               id_os SERIAL PRIMARY KEY,
                               data_emissao DATE NOT NULL,
                               data_conclusao DATE,
                               status_os VARCHAR(30) NOT NULL,
                               valor_total DECIMAL(10,2),
                               id_veiculo INT NOT NULL,
                               id_mecanico INT NOT NULL,
                               CONSTRAINT fk_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
                               CONSTRAINT fk_mecanico FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico)
);

CREATE TABLE os_servico (
                            id_os INT NOT NULL,
                            id_servico INT NOT NULL,
                            quantidade INT NOT NULL DEFAULT 1,
                            PRIMARY KEY (id_os, id_servico),
                            CONSTRAINT fk_os_servico FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os) ON DELETE CASCADE,
                            CONSTRAINT fk_servico_os FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

CREATE TABLE os_peca (
                         id_os INT NOT NULL,
                         id_peca INT NOT NULL,
                         quantidade INT NOT NULL,
                         PRIMARY KEY (id_os, id_peca),
                         CONSTRAINT fk_os_peca FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os) ON DELETE CASCADE,
                         CONSTRAINT fk_peca_os FOREIGN KEY (id_peca) REFERENCES peca(id_peca)
);