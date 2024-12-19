DROP TABLE assinaturas, cargos, empresas_parceiras, funcionarios, metodo_pagamento, pagamentos, periodicidade, plano_parcerias, planos, status_assinatura, status_pagamento, usuarios;

-- Código de criação das tabelas:

CREATE TABLE usuarios (
	id_usuario SERIAL NOT NULL PRIMARY KEY,
	login VARCHAR(50) NOT NULL UNIQUE,
	senha VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	verif_email BOOLEAN NOT NULL DEFAULT FALSE,
	nome VARCHAR(50) NOT NULL,
 	telefone CHAR(9),
 	img_perfil VARCHAR(1024),
  	criado_em DATE NOT NULL
);

CREATE TABLE periodicidade (
    id_periodicidade SERIAL NOT NULL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    quantidade CHAR(2) NOT NULL
);

CREATE TABLE planos (
	id_plano SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    periodicidade INTEGER NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (periodicidade) REFERENCES periodicidade(id_periodicidade)
);

CREATE TABLE status_pagamento (
    id_status SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE metodo_pagamento (
    id_pagamento SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE pagamentos (
    id_pagamento SERIAL NOT NULL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    status INTEGER NOT NULL,
    metodo INTEGER NOT NULL,
    FOREIGN KEY (status) REFERENCES status_pagamento(id_status),
    FOREIGN KEY (metodo) REFERENCES metodo_pagamento(id_pagamento)
);

CREATE TABLE status_assinatura (
    id_status SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE assinaturas (
    id_assinatura SERIAL NOT NULL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_plano INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status INTEGER NOT NULL,
    id_pagamento INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano),
    FOREIGN KEY (status) REFERENCES status_assinatura(id_status),
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento)
);

CREATE TABLE empresas_parceiras (
    id_parceiras SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE cargos (
    id_cargo SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL,
    id_cargo INTEGER NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

CREATE TABLE plano_parcerias (
    id_plano_parcerias SERIAL NOT NULL PRIMARY KEY,
    id_plano INTEGER NOT NULL,
    id_parceiras INTEGER NOT NULL,
    responsavel_interno INTEGER NOT NULL,
    responsavel_parceira VARCHAR(50) NOT NULL,
    comissao_parceira DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano),
    FOREIGN KEY (id_parceiras) REFERENCES empresas_parceiras(id_parceiras),
    FOREIGN KEY (responsavel_interno) REFERENCES funcionarios(id_funcionario)
);

-- Código dos Inserts na tabela
INSERT INTO usuarios (login, senha, email, verif_email, nome, telefone, img_perfil, criado_em)
VALUES
('user1', 'senha123', 'user1@email.com', TRUE, 'João Siqueira', '123456789', 'https://avatarfiles.alphacoders.com/174/thumb-1920-174649.jpg', '2024-01-01'),
('user2', 'senha456', 'user2@email.com', TRUE, 'Maria Vitória', '234567890', 'https://steamuserimages-a.akamaihd.net/ugc/2054253104253001427/63E652752CF6AB331F8825AEF046C0E818AF877E/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false', '2024-02-15'),
('user3', 'senha789', 'user3@email.com', TRUE, 'Carlos Santos', '345678901', 'https://wallpapers.com/images/hd/xbox-pfp-bubble-n1st6itb1n6zb2cf.jpg', '2024-03-10'),
('user4', 'senha012', 'user4@email.com', TRUE, 'Ana Costa', '456789012', 'https://cdn.pfps.gg/pfps/9200-billie-eilish-1.png', '2024-04-05'),
('user5', 'senha345', 'user5@email.com', TRUE, 'Pedro Lima', '567890123', NULL, '2024-05-10'),
('user6', 'senha678', 'user6@email.com', TRUE, 'Cláudia Pereira', NULL, NULL, '2024-06-01'),
('user7', 'senha901', 'user7@email.com', TRUE, 'Ricardo Almeida', NULL, NULL, '2024-07-15'),
('user8', 'senha234', 'user8@email.com', FALSE, 'Juliana Costa', NULL, NULL, '2024-08-20'),
('user9', 'senha567', 'user9@email.com', FALSE,'Roberto Silva', '901234567', NULL, '2024-09-10'),
('user10', 'senha458', 'user10@email.com', FALSE,'Roberto Silva', '654721234', NULL, '2024-10-09');

INSERT INTO periodicidade (tipo, quantidade)
VALUES
('MENSAL', '01'),
('MENSAL', '04'),
('SEMANAL', '02'),
('ANUAL', '1'),
('ANUAL', '2');

INSERT INTO planos (nome, preco, periodicidade, status)
VALUES
('Plano Padrão', 29.99, 1, TRUE),
('Plano Premium', 49.99, 1, TRUE),
('Plano Básico', 19.99, 2, TRUE),
('Plano Corporativo', 99.99, 5, TRUE),
('Plano Avançado', 69.99, 2, TRUE);

INSERT INTO status_pagamento (nome)
VALUES
('Pago'),
('Pendente'),
('Cancelado');

INSERT INTO metodo_pagamento (nome)
VALUES
('Cartão de Crédito'),
('Boleto'),
('Transferência Bancária');


INSERT INTO pagamentos (data, valor, status, metodo)
VALUES
('2024-01-01 10:00:00', 29.99, 1, 1),
('2024-01-15 11:00:00', 49.99, 1, 2),
('2024-02-01 12:00:00', 19.99, 1, 1),
('2024-02-10 14:00:00', 99.99, 1, 3),
('2024-03-01 09:00:00', 69.99, 1, 1),
('2024-03-15 16:00:00', 29.99, 1, 2),
('2024-04-01 18:00:00', 49.99, 1, 3),
('2024-04-20 20:00:00', 19.99, 1, 1),
('2024-05-01 10:30:00', 29.99, 1, 2),
('2024-05-10 15:30:00', 69.99, 1, 3),
('2024-06-01 11:00:00', 49.99, 1, 1),
('2024-06-20 16:00:00', 19.99, 1, 2),
('2024-07-01 14:00:00', 29.99, 1, 3),
('2024-07-15 13:00:00', 99.99, 1, 1),
('2024-08-10 17:00:00', 49.99, 1, 2);

INSERT INTO status_assinatura (nome)
VALUES
('Ativa'),
('Cancelada'),
('Finalizada'),
('Atualizada');

INSERT INTO assinaturas (id_usuario, id_plano, data_inicio, data_fim, status, id_pagamento)
VALUES
(1, 1, '2024-01-01', '2024-02-01', 3, 1),
(1, 3, '2024-11-05', '2025-03-05', 1, 11),
(2, 1, '2024-02-15', '2024-03-15', 3, 2),
(3, 2, '2024-03-01', '2024-04-01', 2, 3),
(4, 3, '2024-04-10', '2024-08-10', 3, 4),
(4, 2, '2024-09-05', '2024-10-05', 3, 15),
(5, 4, '2024-05-20', '2026-05-20', 3, 5),
(5, 4, '2024-12-01', '2026-12-01', 1, 12),
(6, 2, '2024-06-15', '2024-07-15', 3, 6),
(7, 3, '2024-07-01', '2024-11-01', 3, 7),
(8, 1, '2024-11-15', '2024-12-15', 4, 14), 
(8, 5, '2024-08-25', '2024-12-25', 1, 8), 
(9, 1, '2024-09-10', '2024-10-10', 3, 9),
(10, 2, '2024-10-01', '2024-11-01', 2, 10);

INSERT INTO empresas_parceiras (nome)
VALUES
('TradingView'),
('IQ Option'),
('All Game Comedy 4');

INSERT INTO cargos (nome)
VALUES
('CEO'),
('Gerente'),
('Assistente'),
('Suporte');

INSERT INTO funcionarios (nome, status, id_cargo)
VALUES
('João Henrique', TRUE, 1),
('Eliandro Gomes', TRUE, 2),
('Isaque Xavier', TRUE, 2),
('Lucas Martins', TRUE, 3),
('Fernanda Alves', TRUE, 4),
('Ana Paula', TRUE, 3),
('Marcos Vinícius', TRUE, 4),
('Bruna Silva', FALSE, 4),
('Roberto Costa', FALSE, 3),
('Juliana Souza', TRUE, 3);

INSERT INTO plano_parcerias (id_plano, id_parceiras, responsavel_interno, responsavel_parceira, comissao_parceira)
VALUES
(1, 1, 3, 'Carlos Mendes', 10.00),
(2, 2, 4, 'Fernanda Melo', 12.50),
(3, 1, 5, 'Luís Eduardo', 15.00),
(4, 3, 3, 'Mariana Costa', 20.00),
(5, 2, 5, 'Alberto Santos', 18.00);

-- Relatórios

-- Select de usuários
SELECT 
    id_usuario AS "ID do Usuário",
    login AS "Login",
    email AS "Email",
    CASE
        WHEN verif_email THEN 'Sim' 
        ELSE 'Não' 
    END AS "Email Verificado",
    nome AS "Nome Completo",
    telefone AS "Telefone",
    COALESCE(img_perfil, 'Sem imagem') AS "Imagem de Perfil",
    TO_CHAR(criado_em, 'DD/MM/YYYY') AS "Data de Criação"
FROM 
    usuarios
ORDER BY 
    criado_em DESC;

-- Relatório por popularidade de plano
SELECT p.nome AS plano, COUNT(a.id_assinatura) AS total_assinaturas,
p.preco FROM planos p LEFT JOIN assinaturas a ON p.id_plano = a.id_plano
GROUP BY p.nome, p.preco
ORDER BY total_assinaturas DESC;

-- Relatório de assinaturas por usuário
SELECT u.nome AS usuario, p.nome AS plano, a.data_inicio, a.data_fim, sa.nome AS status
FROM assinaturas a
JOIN usuarios u ON a.id_usuario = u.id_usuario
JOIN planos p ON a.id_plano = p.id_plano
JOIN status_assinatura sa ON a.status = sa.id_status;

-- Relatório de receita por período
SELECT EXTRACT(MONTH FROM p.data) AS mes, EXTRACT(YEAR FROM p.data) AS ano,
       SUM(p.valor) AS total_recebido
FROM pagamentos p
WHERE p.status = 1
GROUP BY EXTRACT(MONTH FROM p.data), EXTRACT(YEAR FROM p.data)
ORDER BY ano, mes;

-- Relatório de pagamentos
SELECT p.id_pagamento AS "ID do Pagamento", u.id_usuario AS "ID do Pagador",
TO_CHAR(p.data, 'DD/MM/YYYY HH24:MI:SS') AS "Data do Pagamento",
p.valor AS "Valor (R$)", mp.nome AS "Método de Pagamento",
sp.nome AS "Status do Pagamento"
FROM pagamentos p
JOIN assinaturas a ON p.id_pagamento = a.id_pagamento
JOIN usuarios u ON a.id_usuario = u.id_usuario
JOIN metodo_pagamento mp ON p.metodo = mp.id_pagamento
JOIN status_pagamento sp ON p.status = sp.id_status
ORDER BY 
    p.data DESC;

-- Relatório dos métodos de pagamento
SELECT  mp.nome AS "Método de Pagamento",
COUNT(p.id_pagamento) AS "Quantidade de Pagamentos", SUM(p.valor) AS "Total Recebido (R$)"
FROM pagamentos p
JOIN metodo_pagamento mp ON p.metodo = mp.id_pagamento
WHERE p.status = 1 -- Apenas pagamentos com status 'Pago'
GROUP BY mp.nome
ORDER BY "Total Recebido (R$)" DESC;
	
select * from usuarios