CREATE TABLE paises (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE empresas (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES paises(id)
);

CREATE TABLE tecnologias (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);


CREATE TABLE categorias_tecnologias(
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE tecnologia_categoria (
    tecnologia_id INT,
    categoria_id INT,
    PRIMARY KEY (tecnologia_id, categoria_id),
    FOREIGN KEY (tecnologia_id) REFERENCES tecnologias(id),
    FOREIGN KEY (categoria_id)  REFERENCES categorias_tecnologias(id)
);

CREATE TABLE fases_corrida (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
);

CREATE TABLE participacao_fases (
    empresa_id INT,
    fase_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (empresa_id, fase_id),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    FOREIGN KEY (fase_id) REFERENCES fases_corrida(id)
);

CREATE TABLE projetos (
    id INT PRIMARY KEY,
    empresa_id INT,
    nome VARCHAR(255) NOT NULL,
    budget INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);

CREATE TABLE eventos (
    id INT PRIMARY KEY,
    id_projeto INT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_projeto) REFERENCES projetos(id) 
);

CREATE TABLE colaboradores (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    posicao VARCHAR(255),
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);



CREATE TABLE colaboradores_projeto(
    colaborador_id INT,
    projeto_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (colaborador_id, projeto_id),
    FOREIGN KEY (colaborador_id) REFERENCES colaboradores(id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);

CREATE TABLE metricas_performance(
    id INT PRIMARY KEY,
    projeto_id INT,
    nome_metrica VARCHAR(255) NOT NULL,
    valor_metrica DECIMAL(10,2),
    data_registro DATE,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);

CREATE TABLE patentes (
    id INT PRIMARY KEY,
    empresa_id INT,
    titulo VARCHAR(255) NOT NULL,
    data_pedido DATE,
    status_patente VARCHAR(255),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);


CREATE TABLE parceiros_pesquisa (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255)
);

CREATE TABLE colaboracao_pesquisa (
    empresa_id INT,
    parceiro_id INT,
    projeto_id INT,
    tipo VARCHAR(255),
    PRIMARY KEY (empresa_id, parceiro_id, projeto_id),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    FOREIGN KEY (parceiro_id) REFERENCES parceiros_pesquisa(id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);


CREATE TABLE licenciamento (
    id INT PRIMARY KEY,
    empresa_id INT,
    entidade_licenciamento VARCHAR(255) NOT NULL,
    tecnologia_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    FOREIGN KEY (tecnologia_id) REFERENCES tecnologias(id)
);



INSERT INTO paises (id, nome) VALUES
(1, 'USA'),
(2, 'China'),
(3, 'Germany'),
(4, 'Japan'),
(5, 'UK');

INSERT INTO empresas (id, nome, pais_id) VALUES
(1, 'AlphaTech', 1),
(2, 'InnoCorp', 2),
(3, 'TechCom', 3),
(4, 'FutureAI', 4),
(5, 'QuantumTech', 5);

INSERT INTO tecnologias (id, nome) VALUES
(1, 'Machine Learning'),
(2, 'Natural Language Processing'),
(3, 'Computer Vision'),
(4, 'Robotics'),
(5, 'Autonomous Vehicles');

INSERT INTO categorias_tecnologias (id, nome) VALUES
(1, 'Inteligência Artificial'),
(2, 'Automação');

INSERT INTO tecnologia_categoria (tecnologia_id, categoria_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

INSERT INTO projetos (id, empresa_id, nome, budget, start_date, end_date) VALUES
(1, 1, 'Projeto Alpha', 1000000, '2021-01-15', '2022-01-15'),
(2, 2, 'InnoAI Research', 2000000, '2021-05-01', '2022-05-01'),
(3, 3, 'TechCom Vision', 1500000, '2021-08-20', '2022-08-20'),
(4, 4, 'FutureAI Robotics', 1200000, '2021-10-05', '2022-10-05'),
(5, 5, 'QuantumTech NLP', 1800000, '2021-12-15', '2022-12-15');


INSERT INTO eventos (id, id_projeto, nome, descricao) VALUES
(1, 1,'Lançamento de Tecnologia', 'AlphaTech lança nova tecnologia de IA para a saúde.'),
(2, 2,'Parceria', 'InnoCorp faz parceria com universidades para pesquisa em IA.'),
(3, 3,'Resultado de Competição', 'TechCom vence competição de IA em robótica.'),
(4, 4,'Aquisição', 'FutureAI adquire startup de IA especializada em visão computacional.'),
(5, 5,'Publicação', 'QuantumTech publica avanço em IA na compreensão de linguagem natural.');

INSERT INTO fases_corrida (id, nome, descricao) VALUES
(1, 'Prototipagem', 'Fase inicial de prototipagem de soluções.'),
(2, 'Desenvolvimento', 'Desenvolvimento de soluções de IA.'),
(3, 'Validação', 'Validação dos resultados em cenários reais.'),
(4, 'Implementação', 'Implementação em escala comercial.');


INSERT INTO participacao_fases (empresa_id, fase_id, start_date, end_date) VALUES
(1, 1, '2020-04-01', '2020-05-30'),
(1, 2, '2020-06-15', '2020-08-30'),
(1, 3, '2020-09-05', '2020-12-01'),
(1, 4, '2021-01-01', '2021-02-28'),
(2, 1, '2020-02-10', '2020-03-15'),
(2, 2, '2020-05-01', '2020-07-15'),
(2, 3, '2020-08-10', '2020-11-01'),
(2, 4, '2021-01-10', '2021-02-20'),
(3, 1, '2020-03-20', '2020-04-30'),
(3, 2, '2020-06-05', '2020-09-01'),
(3, 3, '2020-10-10', '2021-01-05'),
(3, 4, '2021-02-01', '2021-03-20'),
(4, 1, '2020-01-15', '2020-02-15'),
(4, 2, '2020-03-01', '2020-04-10'),
(4, 3, '2020-05-05', '2020-08-30'),
(4, 4, '2021-01-15', '2021-02-28'),
(5, 1, '2020-06-25', '2020-08-10'),
(5, 2, '2020-09-01', '2020-10-15'),
(5, 3, '2020-11-10', '2021-01-05'),
(5, 4, '2021-03-01', '2021-04-20');



INSERT INTO colaboradores (id, nome, posicao, empresa_id) VALUES
(1, 'John Doe', 'Engenheiro', 1),
(2, 'Jane Smith', 'Pesquisador', 2),
(3, 'Alice Johnson', 'Gerente de Projeto', 3),
(4, 'Robert Brown', 'Desenvolvedor', 4),
(5, 'Emily Davis', 'Analista', 5);


INSERT INTO colaboradores_projeto (colaborador_id, projeto_id, start_date, end_date) VALUES
(1, 1, '2021-02-01', '2021-03-01'),
(2, 2, '2021-05-15', '2021-06-15'),
(3, 3, '2021-08-20', '2021-09-20'),
(4, 4, '2021-11-05', '2021-12-05'),
(5, 5, '2022-01-01', '2022-02-01');


INSERT INTO metricas_performance (id, projeto_id, nome_metrica, valor_metrica, data_registro) VALUES
(1, 1, 'Precisão', 0.95, '2022-01-20'),
(2, 2, 'Velocidade', 0.89, '2022-05-05'),
(3, 3, 'Eficiência', 0.92, '2022-08-25'),
(4, 4, 'Escalabilidade', 0.88, '2022-10-10'),
(5, 5, 'Confiabilidade', 0.93, '2022-12-20');

INSERT INTO patentes (id, empresa_id, titulo, data_pedido, status_patente) VALUES
(1, 1, 'Patente Alpha', '2021-02-10', 'Aprovada'),
(2, 2, 'InnoAI Patent', '2021-06-12', 'Pendente'),
(3, 3, 'TechCom Vision Patent', '2021-09-18', 'Aprovada'),
(4, 4, 'FutureAI Robotics Patent', '2021-11-22', 'Pendente'),
(5, 5, 'QuantumTech NLP Patent', '2022-01-15', 'Aprovada');

INSERT INTO parceiros_pesquisa (id, nome, tipo) VALUES
(1, 'Harvard', 'Universidade'),
(2, 'MIT', 'Universidade'),
(3, 'Stanford', 'Universidade'),
(4, 'Oxford', 'Universidade'),
(5, 'Cambridge', 'Universidade');

INSERT INTO colaboracao_pesquisa (empresa_id, parceiro_id, projeto_id, tipo) VALUES
(1, 1, 1, 'Pesquisa'),
(2, 2, 2, 'Pesquisa'),
(3, 3, 3, 'Pesquisa'),
(4, 4, 4, 'Pesquisa'),
(5, 5, 5, 'Pesquisa');

INSERT INTO licenciamento (id, empresa_id, entidade_licenciamento, tecnologia_id, start_date, end_date) VALUES
(1, 1, 'TechCom', 1, '2021-03-01', '2022-03-01'),
(2, 2, 'InnoCorp', 2, '2021-06-15', '2022-06-15'),
(3, 3, 'AlphaTech', 3, '2021-09-30', '2022-09-30'),
(4, 4, 'QuantumTech', 4, '2021-12-01', '2022-12-01'),
(5, 5, 'FutureAI', 5, '2022-01-10', '2023-01-10');
