create table cliente5
(cpf_clie number(11) primary key,
nm_clie varchar(200) not null,
email_clie varchar(200) not null)

create table funcionario5
(id_fun number(7) primary key,
nm_fun varchar(200) not null,
salario number(10,2) not null)

create table servico5
(id_servico number(7) primary key,
locar_serv varchar(200) not null,
dt_serv date not null)

create table quarto5
(id_quarto number(7) primary key,
diaria number(10,2) not null,
ds_quarto number(10,2) not null)

create table estadia5
(id_estadia number(7) primary key,
dt_entr date not null,
dt_said date not null)

CREATE TABLE pertence5 (
  id_pertence NUMBER(7) PRIMARY KEY,
  id_estadia NUMBER(7),
  id_quarto NUMBER(7),
  CONSTRAINT fk_estadia FOREIGN KEY (id_estadia) REFERENCES estadia5(id_estadia),
  CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quarto5(id_quarto)
);

CREATE TABLE Culinaria (
    Id_Culinaria NUMBER(2) CONSTRAINT PK_Culinaria PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
 
CREATE TABLE Categoria_Artigo (
    Id_CategoriaArtigo NUMBER(2) CONSTRAINT PK_CategoriaArtigo PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);
 
CREATE TABLE Praticas_Sustentaveis (
    Id_Praticas_Sustentaveis NUMBER(2) CONSTRAINT PK_PraticasSustentaveis PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(300) NOT NULL
);
 
CREATE TABLE Usuario (
    Id_Usuario NUMBER(4) CONSTRAINT PK_Usuario PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    TipoUsuario CHAR(1) NOT NULL
);
 
CREATE TABLE Restaurante (
    CNPJ NUMBER(14) CONSTRAINT PK_Restaurante PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(1000) NOT NULL,
    Fk_Id_Culinaria NUMBER(2) CONSTRAINT FK_Restaurante_Culinaria REFERENCES Culinaria
);
 
CREATE TABLE Unidade (
    Id_Unidade NUMBER(2) CONSTRAINT PK_Unidade PRIMARY KEY,
    Imagem VARCHAR(100) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Rua VARCHAR(150) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Fk_Restaurante NUMBER(14) CONSTRAINT FK_Unidade_Restaurante REFERENCES Restaurante
);
 
CREATE TABLE Avaliacao (
    Id_Avaliacao NUMBER(4) CONSTRAINT PK_Avaliacao PRIMARY KEY,
    Valor NUMBER(2) NOT NULL,
    Momento DATE NOT NULL,
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Avaliacao_Restaurante REFERENCES Restaurante,
    Fk_IdUsuario NUMBER(4) CONSTRAINT FK_Avaliacao_Usuario REFERENCES Usuario
);
 
CREATE TABLE Comentario_Restaurante (
    Id_Comentario_Restaurante NUMBER(4) CONSTRAINT PK_ComentarioRestaurante PRIMARY KEY,
    Texto VARCHAR(400) NOT NULL,
    Data DATE NOT NULL,
    Fk_IdUsuario NUMBER(4) CONSTRAINT FK_Comentario_Restaurante_Usuario REFERENCES Usuario,
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Comentario_Restaurante_Restaurante REFERENCES Restaurante
);
 
CREATE TABLE Artigo (
    Id_Artigo NUMBER(3) CONSTRAINT PK_Artigo PRIMARY KEY,
    Titulo VARCHAR(80) NOT NULL,
    Texto VARCHAR(4000) NOT NULL,
    Imagem VARCHAR(200) NOT NULL,
    Data DATE NOT NULL,
    Fk_Id_Categoria_Artigo NUMBER(2) CONSTRAINT FK_Artigo_Categoria_Artigo REFERENCES Categoria_Artigo
);
 
CREATE TABLE Comentario_Artigo (
    Id_Comentario_Artigo NUMBER(4) CONSTRAINT PK_ComentarioArtigo PRIMARY KEY,
    Texto VARCHAR(400) NOT NULL,
    Data DATE NOT NULL,
    Fk_Id_Usuario NUMBER(4) CONSTRAINT FK_Comentario_Artigo_Usuario REFERENCES Usuario,
    Fk_Id_Artigo NUMBER(3) CONSTRAINT FK_Comentario_Artigo_Artigo REFERENCES Artigo
);
 
CREATE TABLE Restaurante_PraticasSustentaveis (
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Restaurante_PraticasSustentaveis_Restaurante REFERENCES Restaurante,
    Fk_Id_Praticas_Sustentaveis NUMBER(2) CONSTRAINT FK_Restaurante_PraticasSustentaveis_PraticasSustentaveis REFERENCES Praticas_Sustentaveis
);
 
CREATE TABLE Curte (
    Fk_Id_Artigo NUMBER(3) CONSTRAINT FK_Curte_Artigo REFERENCES Artigo,
    Fk_Id_Usuario NUMBER(4) CONSTRAINT FK_Curte_Usuario REFERENCES Usuario
);
-- Populando a tabela Culinaria
INSERT INTO Culinaria VALUES (1, 'Italiana');
INSERT INTO Culinaria VALUES (2, 'Chinesa');
INSERT INTO Culinaria VALUES (3, 'Mexicana');
INSERT INTO Culinaria VALUES (4, 'Indiana');
INSERT INTO Culinaria VALUES (5, 'Japonesa');
INSERT INTO Culinaria VALUES (6, 'Francesa');
INSERT INTO Culinaria VALUES (7, 'Brasileira');
INSERT INTO Culinaria VALUES (8, 'Tailandesa');
INSERT INTO Culinaria VALUES (9, 'Grega');
INSERT INTO Culinaria VALUES (10, 'Turca');

-- Populando a tabela Categoria_Artigo
INSERT INTO Categoria_Artigo VALUES (1, 'Tecnologias inovadoras');
INSERT INTO Categoria_Artigo VALUES (2, 'Agricultura sustent�vel');
INSERT INTO Categoria_Artigo VALUES (3, 'Combate � fome mundial');
INSERT INTO Categoria_Artigo VALUES (4, 'Escassez de alimentos');
INSERT INTO Categoria_Artigo VALUES (5, 'IA generativa');
INSERT INTO Categoria_Artigo VALUES (6, 'Agricultura vertical');
INSERT INTO Categoria_Artigo VALUES (7, 'Aquaponia');
INSERT INTO Categoria_Artigo VALUES (8, 'Hidroponia');
INSERT INTO Categoria_Artigo VALUES (9, 'Distribui��o de alimentos');
INSERT INTO Categoria_Artigo VALUES (10, 'Melhorias na distribui��o de alimentos');

-- Populando a tabela Praticas_Sustentaveis
INSERT INTO Praticas_Sustentaveis VALUES (1, 'Compostagem', 'Pr�tica de reciclar res�duos org�nicos para produ��o de adubo natural.');
INSERT INTO Praticas_Sustentaveis VALUES (2, 'Economia de �gua', 'Uso consciente da �gua para evitar desperd�cios.');
INSERT INTO Praticas_Sustentaveis VALUES (3, 'Energia Renov�vel', 'Utiliza��o de fontes de energia limpa e renov�vel.');
INSERT INTO Praticas_Sustentaveis VALUES (4, 'Redu��o de Desperd�cio de Alimentos', 'Medidas para evitar o desperd�cio de alimentos.');
INSERT INTO Praticas_Sustentaveis VALUES (5, 'Produ��o Local', 'Prioriza��o de ingredientes e produtos locais.');
INSERT INTO Praticas_Sustentaveis VALUES (6, 'Uso de Embalagens Sustent�veis', 'Utiliza��o de embalagens biodegrad�veis ou recicl�veis.');
INSERT INTO Praticas_Sustentaveis VALUES (7, 'Transporte Sustent�vel', 'Op��es de transporte eco-friendly para entrega de produtos.');
INSERT INTO Praticas_Sustentaveis VALUES (8, 'Sourcing Respons�vel', 'Busca de fornecedores que adotem pr�ticas sustent�veis.');
INSERT INTO Praticas_Sustentaveis VALUES (9, 'Redu��o de Emiss�es de Carbono', 'Medidas para diminuir a pegada de carbono.');
INSERT INTO Praticas_Sustentaveis VALUES (10, 'Reutiliza��o de Materiais', 'Reutiliza��o de materiais para reduzir o consumo de recursos naturais.');

-- Populando a tabela Usuario
INSERT INTO Usuario VALUES (1, 'Arthur', 'senha123', 'arthur@gmail.com', 'A');
INSERT INTO Usuario VALUES (2, 'Ana', 'senha123', 'ana@gmail.com', 'A');
INSERT INTO Usuario VALUES (3, 'Alicia', 'senha123', 'alicia@gmail.com', 'A');
INSERT INTO Usuario VALUES (4, 'Larah', 'senha123', 'larah@gmail.com', 'A');
INSERT INTO Usuario VALUES (5, 'Carlos', 'senha123', 'carlos@gmail.com', 'C');
INSERT INTO Usuario VALUES (6, 'Mariana', 'senha123', 'mariana@gmail.com', 'C');
INSERT INTO Usuario VALUES (7, 'Fernando', 'senha123', 'fernando@gmail.com', 'C');
INSERT INTO Usuario VALUES (8, 'Laura', 'senha123', 'laura@gmail.com', 'C');
INSERT INTO Usuario VALUES (9, 'Rafael', 'senha123', 'rafael@gmail.com', 'C');
INSERT INTO Usuario VALUES (10, 'Gabriela', 'senha123', 'gabriela@gmail.com', 'C');

-- Populando a tabela Restaurante
INSERT INTO Restaurante VALUES (12345678901234, 'Restaurante A', 'Restaurante com comida italiana tradicional.', 1);
INSERT INTO Restaurante VALUES (23456789012345, 'Restaurante B', 'Restaurante especializado em culin�ria chinesa.', 2);
INSERT INTO Restaurante VALUES (34567890123456, 'Restaurante C', 'Restaurante com variedade de pratos mexicanos.', 3);
INSERT INTO Restaurante VALUES (45678901234567, 'Restaurante D', 'Restaurante indiano com op��es vegetarianas.', 4);
INSERT INTO Restaurante VALUES (56789012345678, 'Restaurante E', 'Restaurante japon�s com sushi e sashimi.', 5);
INSERT INTO Restaurante VALUES (67890123456789, 'Restaurante F', 'Restaurante com pratos franceses refinados.', 6);
INSERT INTO Restaurante VALUES (78901234567890, 'Restaurante G', 'Restaurante com buffet de comida brasileira.', 7);
INSERT INTO Restaurante VALUES (89012345678901, 'Restaurante H', 'Restaurante com sabores tailandeses aut�nticos.', 8);
INSERT INTO Restaurante VALUES (90123456789012, 'Restaurante I', 'Restaurante com especialidades gregas.', 9);
INSERT INTO Restaurante VALUES (01234567890123, 'Restaurante J', 'Restaurante com pratos turcos tradicionais.', 10);

-- Populando a tabela Unidade
INSERT INTO Unidade VALUES (1, 'imagem1.jpg', '12345678', 'Rua das Flores, 123', 'S�o Paulo', 'SP', 'Jardim Paulista', 12345678901234);
INSERT INTO Unidade VALUES (2, 'imagem2.jpg', '23456789', 'Avenida das Palmeiras, 456', 'Rio de Janeiro', 'RJ', 'Copacabana', 23456789012345);
INSERT INTO Unidade VALUES (3, 'imagem3.jpg', '34567890', 'Rua dos Girass�is, 789', 'Belo Horizonte', 'MG', 'Savassi', 34567890123456);
INSERT INTO Unidade VALUES (4, 'imagem4.jpg', '45678901', 'Rua das Ac�cias, 012', 'Curitiba', 'PR', 'Batel', 45678901234567);
INSERT INTO Unidade VALUES (5, 'imagem5.jpg', '56789012', 'Avenida das Rosas, 345', 'Porto Alegre', 'RS', 'Moinhos de Vento', 56789012345678);
INSERT INTO Unidade VALUES (6, 'imagem6.jpg', '67890123', 'Rua dos L�rios, 678', 'Salvador', 'BA', 'Barra', 67890123456789);
INSERT INTO Unidade VALUES (7, 'imagem7.jpg', '78901234', 'Avenida dos Cravos, 901', 'Fortaleza', 'CE', 'Meireles', 78901234567890);
INSERT INTO Unidade VALUES (8, 'imagem8.jpg', '89012345', 'Rua das Orqu�deas, 234', 'Recife', 'PE', 'Boa Viagem', 89012345678901);
INSERT INTO Unidade VALUES (9, 'imagem9.jpg', '90123456', 'Avenida das Violetas, 567', 'Manaus', 'AM', 'Adrian�polis', 90123456789012);
INSERT INTO Unidade VALUES (10, 'imagem10.jpg', '01234567', 'Rua dos Jasmins, 890', 'Florian�polis', 'SC', 'Centro', 01234567890123);

-- Populando a tabela Avaliacao
INSERT INTO Avaliacao VALUES (1, 5, '01/05/2023', 12345678901234, 1);
INSERT INTO Avaliacao VALUES (2, 4, '02/05/23', 12345678901234, 2);
INSERT INTO Avaliacao VALUES (3, 3, '03/05/23', 23456789012345, 3);
INSERT INTO Avaliacao VALUES (4, 5, '04/05/23', 23456789012345, 4);
INSERT INTO Avaliacao VALUES (5, 2, '05/05/23', 34567890123456, 5);
INSERT INTO Avaliacao VALUES (6, 4, '06/05/23', 34567890123456, 6);
INSERT INTO Avaliacao VALUES (7, 5, '07/05/23', 45678901234567, 7);
INSERT INTO Avaliacao VALUES (8, 4, '08/05/23', 45678901234567, 8);
INSERT INTO Avaliacao VALUES (9, 3, '09/05/23', 56789012345678, 9);
INSERT INTO Avaliacao VALUES (10, 2, '10/05/23', 56789012345678, 10);

-- Populando a tabela Comentario_Restaurante
INSERT INTO Comentario_Restaurante VALUES (1, '�timo restaurante!', '01/05/23', 1, 12345678901234);
INSERT INTO Comentario_Restaurante VALUES (2, 'Comida deliciosa!', '02/05/23', 2, 12345678901234);
INSERT INTO Comentario_Restaurante VALUES (3, 'Atendimento excelente!', '03/05/23', 3, 23456789012345);
INSERT INTO Comentario_Restaurante VALUES (4, 'Ambiente agrad�vel.', '04/05/23', 4, 23456789012345);
INSERT INTO Comentario_Restaurante VALUES (5, 'Recomendo a todos!', '05/05/23', 5, 34567890123456);
INSERT INTO Comentario_Restaurante VALUES (6, 'Pre�os justos.', '06/05/23', 6, 34567890123456);
INSERT INTO Comentario_Restaurante VALUES (7, 'Voltarei com certeza!', '07/05/23', 7, 45678901234567);
INSERT INTO Comentario_Restaurante VALUES (8, 'Menu diversificado.', '08/05/23', 8, 45678901234567);
INSERT INTO Comentario_Restaurante VALUES (9, 'Comida saud�vel e saborosa.', '09/05/23', 9, 56789012345678);
INSERT INTO Comentario_Restaurante VALUES (10, '�timo lugar para eventos.', '10/05/23', 10, 56789012345678);

-- Populando a tabela Artigo
INSERT INTO Artigo VALUES (1, 'O Futuro das Tecnologias Inovadoras', 'Este artigo explora como as tecnologias inovadoras est�o moldando nosso futuro. Com o advento de avan�os em intelig�ncia artificial (IA), Internet das Coisas (IoT), realidade virtual e aumentada, e blockchain, estamos vendo um mundo mais conectado e automatizado. A evolu��o tecnol�gica tem influenciado todos os aspectos da vida humana, desde a maneira como nos comunicamos at� a maneira como trabalhamos, aprendemos e nos divertimos.

A intelig�ncia artificial tem revolucionado v�rios setores, incluindo sa�de, educa��o, transporte, e finan�as. Com o poder de aprender e melhorar com a experi�ncia, a IA est� ajudando a tornar os sistemas mais eficientes e eficazes. Da detec��o de doen�as � personaliza��o do aprendizado, a IA est� se tornando uma parte integral de nossas vidas.

A Internet das Coisas, por outro lado, est� transformando objetos cotidianos em dispositivos inteligentes e conectados. Desde l�mpadas inteligentes at� carros aut�nomos, a IoT est� promovendo a efici�ncia e a conveni�ncia. A capacidade de coletar e analisar dados em tempo real est� levando a melhorias significativas na qualidade de vida e na tomada de decis�es.

A realidade virtual e aumentada est� criando experi�ncias imersivas e transformando a maneira como interagimos com o mundo digital. Seja em jogos, treinamento ou design, essas tecnologias est�o abrindo novos caminhos para a inova��o.

O blockchain est� oferecendo um novo n�vel de seguran�a e transpar�ncia para transa��es digitais. Ao descentralizar a verifica��o de transa��es, o blockchain tem o potencial de revolucionar setores como finan�as, cadeias de suprimentos e governo.

No entanto, enquanto nos maravilhamos com essas realiza��es, tamb�m devemos estar cientes dos desafios �ticos, legais e sociais que acompanham essa revolu��o tecnol�gica. Quest�es de privacidade, equidade, e regulamenta��o s�o cada vez mais importantes � medida que avan�amos para um futuro mais digital.

Este artigo busca discutir as tend�ncias atuais em tecnologias inovadoras, explorando suas aplica��es, benef�cios, desafios e poss�veis dire��es futuras. Conforme nos preparamos para um futuro incerto, � crucial que adotemos uma abordagem ponderada e inclusiva para a inova��o tecnol�gica. A tecnologia tem o potencial de transformar nosso mundo para melhor, mas somente se for usada com responsabilidade e considera��o por seu impacto em todas as pessoas.', 'img_innovative_tech.jpg', '28/05/23', 1);


INSERT INTO Artigo VALUES (2, 'A import�ncia da Agricultura Sustent�vel', 'A agricultura sustent�vel � uma abordagem de produ��o de alimentos que tem como objetivo ser ambientalmente saud�vel, economicamente rent�vel e socialmente respons�vel. Trata-se de um m�todo de produ��o que conserva a �gua, reduz o uso de fertilizantes e pesticidas, e promove a biodiversidade nos campos.

A agricultura sustent�vel pode tomar v�rias formas, desde pequenas hortas urbanas at� grandes fazendas comerciais. Algumas pr�ticas comuns de agricultura sustent�vel incluem rota��o de culturas, compostagem, cultivo consorciado, controle biol�gico de pragas, e manejo integrado de nutrientes.

A rota��o de culturas ajuda a manter a sa�de do solo e a reduzir a incid�ncia de pragas e doen�as. Alternar diferentes tipos de culturas ajuda a evitar a deple��o de nutrientes espec�ficos do solo e pode ajudar a quebrar os ciclos de pragas e doen�as.

A compostagem � outra pr�tica fundamental na agricultura sustent�vel. Ao converter res�duos org�nicos em um rico adubo, a compostagem ajuda a melhorar a fertilidade do solo e a reter umidade, o que pode ser especialmente �til em �reas propensas � seca.

O cultivo consorciado envolve o plantio de diferentes culturas pr�ximas umas das outras, de maneira que elas possam se beneficiar mutuamente. Por exemplo, uma planta pode ajudar a repelir pragas que afetam a outra, ou uma planta pode ajudar a fixar nitrog�nio no solo, beneficiando culturas que necessitam de muito nitrog�nio.

O controle biol�gico de pragas envolve o uso de organismos naturais, como insetos predadores ou pat�genos, para controlar pragas. Esta abordagem pode reduzir a necessidade de pesticidas qu�micos, que podem ter efeitos nocivos sobre o meio ambiente e a sa�de humana.

O manejo integrado de nutrientes procura otimizar o uso de recursos e minimizar a polui��o por nutrientes, equilibrando a necessidade de nutrientes das plantas com as entradas de nutrientes.

A agricultura sustent�vel n�o � apenas sobre pr�ticas de cultivo, no entanto. Ela tamb�m inclui aspectos sociais e econ�micos, como garantir condi��es de trabalho justas para os trabalhadores agr�colas, apoiar comunidades rurais, e promover a viabilidade econ�mica das fazendas.

A transi��o para uma agricultura mais sustent�vel � uma tarefa complexa que requer o envolvimento de muitos atores diferentes, incluindo agricultores, consumidores, pesquisadores, e pol�ticos. No entanto, a longo prazo, a agricultura sustent�vel tem o potencial de proporcionar benef�cios significativos, desde a prote��o do meio ambiente at� a promo��o da seguran�a alimentar e a melhoria da qualidade de vida das comunidades rurais.', 'img_sustainable_agriculture.jpg', '28/05/23', 2);


INSERT INTO Artigo VALUES (3, 'Estrat�gias Eficientes para o Combate � Fome Mundial', 'O combate � fome mundial � uma das quest�es mais urgentes da nossa era. Apesar do progresso significativo nas �ltimas d�cadas, ainda h� milh�es de pessoas em todo o mundo que sofrem de desnutri��o e inseguran�a alimentar. 

A fome � causada por uma s�rie de fatores inter-relacionados, incluindo a pobreza, os conflitos, a instabilidade pol�tica, as mudan�as clim�ticas e a falta de infraestrutura adequada para a produ��o e distribui��o de alimentos. Portanto, combater a fome requer uma abordagem multifacetada que aborda todas essas quest�es.

Uma estrat�gia crucial para combater a fome � melhorar a produtividade agr�cola. Isso pode ser feito atrav�s do desenvolvimento e difus�o de tecnologias agr�colas melhoradas, como sementes de alto rendimento e t�cnicas de irriga��o eficientes. Al�m disso, os agricultores precisam de acesso a cr�dito e a mercados para vender seus produtos, o que pode ser facilitado por pol�ticas governamentais adequadas e pela constru��o de infraestruturas de transporte e armazenamento.

Outra estrat�gia importante � aumentar a resili�ncia das comunidades rurais �s mudan�as clim�ticas e outras formas de choque. Isso pode envolver a promo��o de pr�ticas agr�colas sustent�veis que conservam os recursos naturais e protegem a biodiversidade, bem como a constru��o de sistemas de prote��o social que possam fornecer apoio em tempos de crise.

A promo��o da igualdade de g�nero na agricultura � outra medida fundamental. As mulheres desempenham um papel crucial na produ��o de alimentos em muitas partes do mundo, e garantir que elas tenham acesso a recursos, treinamento e oportunidades iguais pode ter um impacto significativo no combate � fome.

Por �ltimo, mas n�o menos importante, � essencial promover a paz e a estabilidade pol�tica, pois os conflitos e a instabilidade podem levar a crises de fome. Isso envolve a media��o de disputas, a promo��o da democracia e dos direitos humanos, e a preven��o de conflitos atrav�s da diplomacia e da constru��o da paz.

O combate � fome � uma tarefa complexa que requer a colabora��o de todos os segmentos da sociedade, desde governos e organiza��es internacionais at� empresas e indiv�duos. Cada um de n�s pode contribuir para esta causa de v�rias maneiras, seja atrav�s da doa��o para organiza��es de ajuda alimentar, da defesa de pol�ticas justas, ou simplesmente da conscientiza��o sobre a quest�o.', 'img_world_hunger.jpg', '28/05/23', 3);


INSERT INTO Artigo VALUES (4, 'Desafiando a Escassez de Alimentos no Mundo Moderno', 'A escassez de alimentos � uma crise crescente que amea�a muitas comunidades ao redor do mundo. Devido a fatores como crescimento populacional, mudan�as clim�ticas, instabilidade pol�tica e desigualdade econ�mica, muitas pessoas enfrentam dificuldades para acessar alimentos nutritivos e acess�veis.

A mudan�a clim�tica � uma das principais causas da escassez de alimentos. Inunda��es, secas, tempestades e mudan�as nas condi��es clim�ticas podem destruir colheitas e rebanhos, tornando dif�cil para os agricultores manter a produ��o de alimentos. Isso � especialmente problem�tico para os pequenos agricultores dos pa�ses em desenvolvimento, que muitas vezes carecem dos recursos para se adaptar a essas mudan�as.

O crescimento populacional � outro fator que contribui para a escassez de alimentos. � medida que a popula��o mundial continua a crescer, a demanda por alimentos aumenta. No entanto, o fornecimento de alimentos pode n�o conseguir acompanhar essa demanda, especialmente se as t�cnicas agr�colas atuais n�o se tornarem mais eficientes e sustent�veis.

A instabilidade pol�tica e a desigualdade econ�mica tamb�m podem levar � escassez de alimentos. Em regi�es afetadas por conflitos, a produ��o e a distribui��o de alimentos podem ser interrompidas, levando � fome. Al�m disso, a pobreza pode impedir que as pessoas acessem alimentos nutritivos, mesmo quando eles est�o dispon�veis.

Para enfrentar a escassez de alimentos, � necess�rio um esfor�o coordenado que envolva a implementa��o de estrat�gias de mitiga��o de longo prazo e a��o imediata para fornecer assist�ncia alimentar �s pessoas afetadas. As estrat�gias de longo prazo podem incluir a promo��o da agricultura sustent�vel, a melhoria da infraestrutura agr�cola e de transporte, e a implementa��o de pol�ticas para promover a seguran�a alimentar.

A pesquisa e a inova��o tecnol�gica tamb�m desempenham um papel crucial na luta contra a escassez de alimentos. Novas tecnologias, como a agricultura de precis�o e a edi��o de genes, podem ajudar a aumentar a produtividade agr�cola e a resist�ncia das plantas �s mudan�as clim�ticas.

Al�m disso, � crucial garantir que a ajuda alimentar chegue �queles que mais precisam dela. Isso envolve o trabalho de organiza��es humanit�rias e governos para distribuir alimentos em �reas de crise, bem como pol�ticas que promovam a igualdade econ�mica e o acesso a alimentos nutritivos.

Em conclus�o, a escassez de alimentos � um desafio complexo que exige uma abordagem multifacetada. Ao enfrentar as causas subjacentes e trabalhar para aumentar o acesso a alimentos nutritivos, podemos ajudar a aliviar a fome e a promover a seguran�a alimentar em todo o mundo.', 'img_food_scarcity.jpg', '28/05/23', 4);


INSERT INTO Artigo VALUES (5, 'Explorando as Possibilidades da IA Generativa', 'A Intelig�ncia Artificial (IA) tem se mostrado uma ferramenta incrivelmente poderosa em uma infinidade de aplica��es, desde o reconhecimento de fala at� a an�lise de dados. No entanto, uma das �reas mais promissoras e emocionantes da IA � a gera��o de conte�do, ou IA generativa.

A IA generativa se refere a algoritmos que podem criar algo novo, seja um texto, uma imagem, uma pe�a musical ou at� mesmo um design de produto. Esses algoritmos n�o apenas replicam ou classificam dados existentes, mas tamb�m geram novas cria��es a partir de um conjunto de regras ou par�metros.

Um exemplo bem conhecido de IA generativa s�o as Redes Adversariais Generativas (GANs). As GANs consistem em dois componentes principais: um gerador que cria novas inst�ncias, e um discriminador que tenta diferenciar entre inst�ncias reais e criadas. O gerador aprende a melhorar suas cria��es com base no feedback do discriminador.

A IA generativa tem uma variedade de aplica��es potenciais. No campo das artes, por exemplo, j� foi usada para criar novas pinturas, m�sicas e hist�rias. Na ind�stria, pode ser usada para criar designs de produtos ou para desenvolver novas solu��es para problemas complexos.

No entanto, a IA generativa tamb�m levanta quest�es importantes sobre autoria e �tica. Quem � o autor de uma obra de arte criada por uma IA? Como garantir que a IA generativa seja usada de maneira respons�vel e n�o seja usada para criar conte�do enganoso ou prejudicial?

Tamb�m h� desafios t�cnicos a serem superados. A IA generativa ainda est� em sua inf�ncia e muitas de suas cria��es s�o imperfeitas. Al�m disso, os algoritmos de IA generativa podem ser extremamente intensivos em termos de computa��o e requerer grandes quantidades de dados para treinamento.

Apesar desses desafios, a IA generativa tem um enorme potencial. � medida que a tecnologia avan�a, � prov�vel que vejamos cada vez mais aplica��es impressionantes dessa nova e emocionante �rea da IA.', 'img_generative_ai.jpg', '28/05/23', 5);


INSERT INTO Artigo VALUES (6, 'A Ascens�o da Agricultura Vertical: Perspectivas Futuras', 'A agricultura vertical � uma pr�tica inovadora que tem o potencial de transformar o modo como produzimos alimentos. Trata-se do cultivo de plantas em ambientes internos, em m�ltiplas camadas ou andares, em vez de em um �nico n�vel, como em um campo ou estufa tradicional.

A agricultura vertical oferece uma s�rie de vantagens em rela��o � agricultura tradicional. Por um lado, � extremamente eficiente em termos de espa�o. Em um ambiente vertical, � poss�vel cultivar muito mais alimentos por metro quadrado do que em um campo ou estufa. Al�m disso, a agricultura vertical pode ser praticada em �reas urbanas, reduzindo a necessidade de transporte e permitindo que os alimentos sejam cultivados mais perto de onde s�o consumidos.

Outra vantagem da agricultura vertical � que ela permite um controle preciso do ambiente de crescimento. Isso significa que as plantas podem ser cultivadas sob condi��es ideais durante todo o ano, independentemente do clima externo. Isso n�o apenas aumenta a produtividade, mas tamb�m reduz a necessidade de pesticidas e outros qu�micos.

Al�m disso, a agricultura vertical � altamente eficiente em termos de recursos. Ela usa significativamente menos �gua do que a agricultura tradicional e pode reciclar os nutrientes usados no processo de crescimento. Isso a torna uma op��o sustent�vel para a produ��o de alimentos.

No entanto, a agricultura vertical tamb�m enfrenta desafios. Por exemplo, o custo inicial de instala��o de uma fazenda vertical pode ser alto, e a energia necess�ria para ilumina��o e controle de temperatura pode ser significativa. Al�m disso, ainda h� quest�es a serem resolvidas sobre a melhor maneira de cultivar certos tipos de plantas em um ambiente vertical.

Apesar desses desafios, a agricultura vertical tem um grande potencial para o futuro. � medida que a popula��o mundial continua a crescer e o espa�o para a agricultura tradicional se torna cada vez mais escasso, a capacidade de produzir alimentos de maneira eficiente e sustent�vel em ambientes urbanos se tornar� cada vez mais importante. A agricultura vertical, com suas muitas vantagens, est� bem posicionada para desempenhar um papel importante nesse futuro.', 'img_vertical_farming.jpg', '28/05/23', 6);


INSERT INTO Artigo VALUES (7, 'Aquaponia: Uma Revolu��o na Agricultura Sustent�vel', 'A aquaponia � uma forma revolucion�ria de agricultura que combina a cria��o de peixes (aquicultura) com o cultivo de plantas em �gua (hidroponia) em um sistema integrado. Este m�todo inovador de produ��o de alimentos tem o potencial de tornar a agricultura mais sustent�vel e eficiente.

Na aquaponia, os peixes e as plantas coexistem em um sistema simbi�tico. Os peixes produzem res�duos que s�o convertidos por bact�rias em nutrientes para as plantas. Em troca, as plantas purificam a �gua, que � ent�o recirculada para o tanque de peixes. Este ciclo cont�nuo cria um sistema de produ��o de alimentos eficiente e autossustent�vel.

Existem v�rias vantagens na aquaponia. Em primeiro lugar, � um sistema extremamente eficiente em termos de �gua, pois a maior parte da �gua � reciclada. Isso � especialmente importante em regi�es onde a �gua � escassa. Al�m disso, a aquaponia n�o requer o uso de fertilizantes qu�micos, tornando-a uma op��o mais ecol�gica.

A aquaponia tamb�m � altamente produtiva. Devido � sua natureza simbi�tica, � poss�vel produzir uma grande quantidade de peixes e vegetais em um espa�o relativamente pequeno. Al�m disso, como a aquaponia pode ser praticada em ambientes fechados, ela permite a produ��o de alimentos durante todo o ano, independentemente das condi��es clim�ticas.

Apesar desses benef�cios, a aquaponia tamb�m apresenta desafios. A configura��o de um sistema aquap�nico pode ser complexa e requer um monitoramento cuidadoso para garantir o equil�brio entre peixes e plantas. Al�m disso, a energia necess�ria para manter o sistema em funcionamento pode ser significativa.

No entanto, o potencial da aquaponia para transformar a agricultura � imenso. � medida que enfrentamos os desafios da mudan�a clim�tica e do crescimento populacional, a aquaponia oferece uma forma de produzir alimentos de maneira sustent�vel e eficiente. Com pesquisa e desenvolvimento cont�nuos, a aquaponia pode desempenhar um papel importante na alimenta��o do mundo no futuro.', 'img_aquaponics.jpg', '28/05/23', 7);


INSERT INTO Artigo VALUES (8, 'Hidroponia: O Futuro da Agricultura Urbana', 'A hidroponia � uma forma inovadora de agricultura que envolve o cultivo de plantas sem solo. Em vez disso, as plantas s�o cultivadas em uma solu��o de �gua rica em nutrientes, permitindo-lhes absorver diretamente os nutrientes necess�rios para o crescimento. Esta abordagem tem v�rias vantagens e tem potencial para transformar a agricultura urbana.

A primeira vantagem da hidroponia � a efici�ncia do espa�o. Como as plantas n�o precisam de espa�o para crescer as ra�zes no solo, elas podem ser cultivadas muito mais densamente do que na agricultura tradicional. Isso torna a hidroponia uma op��o ideal para �reas urbanas, onde o espa�o � limitado.

Al�m disso, a hidroponia � incrivelmente eficiente em termos de �gua. Na agricultura tradicional, grande parte da �gua usada para irriga��o � perdida para a evapora��o ou � drenada para fora do solo. Na hidroponia, a �gua � recirculada, significando que muito menos �gua � necess�ria para cultivar as mesmas quantidades de alimentos.

A hidroponia tamb�m permite um controle preciso sobre as condi��es de crescimento. Os nutrientes, a temperatura e a luz podem ser ajustados para otimizar o crescimento das plantas. Isso pode resultar em maior produtividade e alimentos de melhor qualidade.

No entanto, a hidroponia tamb�m tem desafios. A configura��o e a manuten��o de um sistema hidrop�nico podem ser complexas e requerem conhecimento t�cnico. Al�m disso, a energia necess�ria para manter o sistema de ilumina��o e a bomba de �gua pode ser significativa.

Apesar desses desafios, a hidroponia tem um grande potencial para o futuro. � medida que a popula��o urbana continua a crescer e o espa�o para a agricultura tradicional se torna cada vez mais escasso, a capacidade de produzir alimentos de maneira eficiente em ambientes urbanos ser� cada vez mais importante. A hidroponia, com suas muitas vantagens, est� bem posicionada para desempenhar um papel importante nesse futuro.', 'img_hydroponics.jpg', '23/05/23', 8);


INSERT INTO Artigo VALUES 
(9, 'Desafios e Solu��es na Distribui��o de Alimentos', 'A distribui��o de alimentos � um elemento crucial da seguran�a alimentar, garantindo que os alimentos produzidos cheguem aos consumidores de maneira eficiente e segura. No entanto, a distribui��o de alimentos enfrenta uma s�rie de desafios, desde a infraestrutura inadequada at� a perda e desperd�cio de alimentos. 

A infraestrutura de transporte inadequada � um grande obst�culo para a distribui��o eficiente de alimentos. Em muitas partes do mundo, a falta de estradas, portos e armazenamento adequados dificulta a entrega de alimentos �s pessoas que deles necessitam. Al�m disso, a falta de refrigera��o ou instala��es de armazenamento adequadas pode levar � deteriora��o dos alimentos, resultando em perdas significativas.

Outro desafio � a perda e o desperd�cio de alimentos. Estima-se que um ter�o de todos os alimentos produzidos para consumo humano sejam perdidos ou desperdi�ados. Grande parte dessa perda ocorre na fase de distribui��o, quando os alimentos s�o danificados durante o transporte ou se deterioram antes de serem vendidos.

Para enfrentar esses desafios, s�o necess�rias solu��es inovadoras. Uma abordagem � o desenvolvimento de infraestrutura de transporte e armazenamento melhorada. Isso pode incluir o investimento em estradas e portos, bem como em tecnologia de refrigera��o e armazenamento.

Outra solu��o � a ado��o de pr�ticas que reduzam a perda e o desperd�cio de alimentos. Isso pode envolver o uso de embalagens apropriadas, o treinamento de manipuladores de alimentos e o incentivo aos consumidores a comprar alimentos de forma mais respons�vel.

Finalmente, � importante que a distribui��o de alimentos seja justa e equitativa. Isso significa garantir que todos, independentemente de onde vivem ou de sua renda, tenham acesso a alimentos nutritivos e acess�veis. Para isso, podem ser necess�rias pol�ticas que promovam a equidade na distribui��o de alimentos.', 'img_food_distribution.jpg', '28/05/23', 9);


INSERT INTO Artigo VALUES (10, 'Inova��es e Melhorias na Distribui��o de Alimentos', 'A distribui��o de alimentos � uma pe�a-chave na garantia da seguran�a alimentar global. No entanto, muitos desafios persistem, desde a perda de alimentos durante o transporte at� a inacessibilidade dos alimentos em �reas remotas. Felizmente, uma s�rie de inova��es e melhorias est�o sendo implementadas para superar esses obst�culos.

Um exemplo dessas inova��es � a digitaliza��o da cadeia de suprimentos de alimentos. Plataformas online est�o sendo desenvolvidas para conectar produtores diretamente com os consumidores, reduzindo a necessidade de intermedi�rios e tornando a distribui��o mais eficiente. Al�m disso, as tecnologias de rastreamento e rastreabilidade est�o sendo usadas para monitorar a jornada dos alimentos da fazenda para o garfo, permitindo que problemas sejam identificados e resolvidos mais rapidamente.

Outra inova��o importante � o desenvolvimento de tecnologias de armazenamento e transporte mais eficientes. Isso inclui avan�os na refrigera��o e preserva��o de alimentos, o que pode reduzir a quantidade de alimentos que s�o perdidos devido � deteriora��o. Al�m disso, est�o sendo desenvolvidos novos m�todos de embalagem que prolongam a vida �til dos alimentos e protegem-nos de danos durante o transporte.

Finalmente, est�o sendo tomadas medidas para tornar a distribui��o de alimentos mais equitativa. Isso inclui programas que visam a melhorar o acesso a alimentos em �reas rurais e remotas, bem como pol�ticas que promovem a justi�a na cadeia de suprimentos de alimentos.

Apesar dessas melhorias, ainda h� muito trabalho a ser feito para garantir que todos tenham acesso a alimentos seguros, nutritivos e acess�veis. � medida que avan�amos, ser� crucial continuar a inovar e a melhorar a maneira como distribu�mos alimentos em todo o mundo.', 'img_improving_food_distribution.jpg', '28/05/23', 10);


-- Populando a tabela Comentario_Artigo
INSERT INTO Comentario_Artigo VALUES (1, '�timo artigo!', '01/05/23', 1, 1);
INSERT INTO Comentario_Artigo VALUES (2, 'Gostei das dicas!', '02/05/23', 2, 2);
INSERT INTO Comentario_Artigo VALUES (3, 'Preciso visitar esses restaurantes!', '03/05/23', 3, 3);
INSERT INTO Comentario_Artigo VALUES (4, 'Nunca experimentei esses ingredientes.', '04/05/23', 4, 4);
INSERT INTO Comentario_Artigo VALUES (5, 'Adoro ficar por dentro das tend�ncias!', '05/05/23', 5, 5);
INSERT INTO Comentario_Artigo VALUES (6, 'Informa��es muito �teis!', '06/05/23', 6, 6);
INSERT INTO Comentario_Artigo VALUES (7, 'Que interessante!', '07/05/23', 7, 7);
INSERT INTO Comentario_Artigo VALUES (8, 'Vou marcar esses eventos no calend�rio.', '08/05/23', 8, 8);
INSERT INTO Comentario_Artigo VALUES (9, 'Gosto de conhecer a hist�ria da culin�ria.', '09/05/23', 9, 9);
INSERT INTO Comentario_Artigo VALUES (10, 'As receitas regionais s�o deliciosas!', '10/05/23', 10, 10);

-- Populando a tabela Restaurante_PraticasSustentaveis
INSERT INTO Restaurante_PraticasSustentaveis VALUES (12345678901234, 1);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (12345678901234, 2);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (23456789012345, 3);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (23456789012345, 4);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (34567890123456, 5);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (34567890123456, 6);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (45678901234567, 7);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (45678901234567, 8);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (56789012345678, 9);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (56789012345678, 10);

-- Populando a tabela Curte
INSERT INTO Curte VALUES (1, 1);
INSERT INTO Curte VALUES (1, 2);
INSERT INTO Curte VALUES (2, 3);
INSERT INTO Curte VALUES (2, 4);
INSERT INTO Curte VALUES (3, 5);
INSERT INTO Curte VALUES (3, 6);
INSERT INTO Curte VALUES (4, 7);
INSERT INTO Curte VALUES (4, 8);
INSERT INTO Curte VALUES (5, 9);
INSERT INTO Curte VALUES (5, 10);

COMMIT;


