-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 04/12/2023 às 20:38
-- Versão do servidor: 10.4.25-MariaDB
-- Versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `JubilaMassas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL,
  `cpf` char(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomeCompleto` varchar(255) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `dtNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Cliente`
--

INSERT INTO `Cliente` (`idCliente`, `cpf`, `email`, `nomeCompleto`, `senha`, `dtNascimento`) VALUES
(1, '276.919.180-20', 'gabrielfvs91@gmail.com', 'Gabriel Franco Ventura Santos', 'MTAyOTM4', '1991-12-21'),
(2, '009.897.980-97', 'ana@gmail.com', 'Ana Correia', 'MTAyOTM4Cg==', '1981-11-01'),
(3, '693.640.020-59', 'alfredo@gmail.com', 'Alfredo Dos Santos', 'MTAyOTM4Cg==', '2001-06-01'),
(8, '123.456.789-00', 'aldo@testando.com', 'Aldo Testando', 'MTIz', '2023-12-13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `EnderecoCliente`
--

CREATE TABLE `EnderecoCliente` (
  `idCliente` int(11) NOT NULL,
  `nmEndereco` varchar(255) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(24) NOT NULL,
  `cep` char(9) NOT NULL,
  `flEnderecoEscolhido` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `EnderecoCliente`
--

INSERT INTO `EnderecoCliente` (`idCliente`, `nmEndereco`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `flEnderecoEscolhido`) VALUES
(1, 'Casa', 'Rua Francisco Acquarone', 59, 'Apt. 112 - Bloco B', 'Freguesia', 'Rio de Janeiro', 'RJ', '22755-170', 1),
(1, 'Trabalho', 'Rua Francisca Sales', 1002, 'Sala 2', 'Freguesia', 'Rio de Janeiro', 'RJ', '22755-172', 0),
(2, 'Casa da Namorada', 'Praça Monsenhor Domingos E. Pinheiro', 23, 'Apt. 203', 'Centro', 'Lavras', 'MG', '37200-203', 1),
(3, 'Casa dos Pais', 'Praça Monsenhor Domingos E. Pinheiro', 59, '', 'Centro', 'Lavras', 'MG', '37200-203', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `HoraFuncionamentoLoja`
--

CREATE TABLE `HoraFuncionamentoLoja` (
  `idLoja` int(11) NOT NULL,
  `horaFuncionamentoInicio` time NOT NULL,
  `horaFuncionamentoFim` time NOT NULL,
  `diaFuncionamento` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `HoraFuncionamentoLoja`
--

INSERT INTO `HoraFuncionamentoLoja` (`idLoja`, `horaFuncionamentoInicio`, `horaFuncionamentoFim`, `diaFuncionamento`) VALUES
(1, '12:00:00', '22:00:00', 'Dom'),
(1, '12:00:00', '22:00:00', 'Qua'),
(1, '12:00:00', '24:00:00', 'Qui'),
(1, '12:00:00', '22:00:00', 'Sáb'),
(1, '12:00:00', '16:00:00', 'Seg'),
(1, '12:00:00', '24:00:00', 'Sex'),
(1, '12:00:00', '22:00:00', 'Ter'),
(2, '12:00:00', '24:00:00', 'Dom'),
(2, '12:00:00', '24:00:00', 'Qua'),
(2, '12:00:00', '24:00:00', 'Qui'),
(2, '12:00:00', '24:00:00', 'Sáb'),
(2, '12:00:00', '20:00:00', 'Seg'),
(2, '12:00:00', '24:00:00', 'Sex'),
(2, '12:00:00', '24:00:00', 'Ter');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Ingrediente`
--

CREATE TABLE `Ingrediente` (
  `idIngrediente` int(11) NOT NULL,
  `nmIngrediente` varchar(255) NOT NULL,
  `flDoce` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Ingrediente`
--

INSERT INTO `Ingrediente` (`idIngrediente`, `nmIngrediente`, `flDoce`) VALUES
(1, 'Frango', 0),
(2, 'Muçarela', 0),
(3, 'Parmesão', 0),
(4, 'Catupiry', 0),
(5, 'Requeijão', 0),
(6, 'Cream Cheese', 0),
(7, 'Bacon', 0),
(8, 'Abobrinha', 0),
(9, 'Calabresa', 0),
(10, 'Ovos', 0),
(11, 'Cebola', 0),
(12, 'Pimenta', 0),
(13, 'Chocolate', 1),
(14, 'Chocolate Branco', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `IngredientePizza`
--

CREATE TABLE `IngredientePizza` (
  `idIngrediente` int(11) NOT NULL,
  `idPizza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `IngredientePizza`
--

INSERT INTO `IngredientePizza` (`idIngrediente`, `idPizza`) VALUES
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(9, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Loja`
--

CREATE TABLE `Loja` (
  `idLoja` int(11) NOT NULL,
  `nmLoja` varchar(255) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Loja`
--

INSERT INTO `Loja` (`idLoja`, `nmLoja`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 'JubilaMassas - Lavras', 'Av. Dr. Sílvio Menicucci', 1222, 'Sala 1', 'Artur Bernades', 'Lavras', 'MG', '37200-203'),
(2, 'JubilaMassas - BarraShopping', 'Av. das Américas', 5000, 'Loja 123', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '22631-004');

-- --------------------------------------------------------

--
-- Estrutura para tabela `LojaPedidoPizza`
--

CREATE TABLE `LojaPedidoPizza` (
  `idPedido` int(11) NOT NULL,
  `idPizza` int(11) NOT NULL,
  `idLoja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `LojaPedidoPizza`
--

INSERT INTO `LojaPedidoPizza` (`idPedido`, `idPizza`, `idLoja`) VALUES
(1, 1, 2),
(1, 2, 2),
(2, 2, 1),
(3, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pedido`
--

CREATE TABLE `Pedido` (
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `taxaEntrega` decimal(10,0) DEFAULT NULL,
  `nrEstrelas` int(10) UNSIGNED DEFAULT NULL,
  `stPedido` int(10) UNSIGNED NOT NULL,
  `dtEnvio` datetime DEFAULT current_timestamp(),
  `dtConfirmacao` datetime DEFAULT NULL,
  `dtPreparoPronto` datetime DEFAULT NULL,
  `dtEntrega` datetime DEFAULT NULL,
  `dtFinalizacao` datetime DEFAULT NULL,
  `tpFormaPagamento` int(10) UNSIGNED NOT NULL,
  `vlTroco` decimal(10,0) DEFAULT NULL,
  `tpBandeira` int(10) UNSIGNED DEFAULT NULL,
  `tpCartao` int(10) UNSIGNED DEFAULT NULL,
  `idIngredienteSaborRecheio` int(11) DEFAULT NULL,
  `flBordaRecheada` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Pedido`
--

INSERT INTO `Pedido` (`idPedido`, `idCliente`, `taxaEntrega`, `nrEstrelas`, `stPedido`, `dtEnvio`, `dtConfirmacao`, `dtPreparoPronto`, `dtEntrega`, `dtFinalizacao`, `tpFormaPagamento`, `vlTroco`, `tpBandeira`, `tpCartao`, `idIngredienteSaborRecheio`, `flBordaRecheada`) VALUES
(1, 3, '4', 3, 1, '2023-10-02 21:12:49', '2023-10-02 21:13:05', '2023-10-02 22:14:13', '2023-10-02 22:19:25', '2023-10-02 22:19:52', 1, '0', 1, 1, NULL, 0),
(2, 3, '7', 4, 1, '2023-10-02 21:40:28', '2023-10-02 21:41:01', '2023-10-02 22:25:13', '2023-10-02 22:30:28', '2023-10-02 22:31:02', 1, '0', 1, 1, NULL, 0),
(3, 3, '5', 5, 1, '2023-08-02 19:20:28', '2023-08-02 19:20:48', '2023-08-02 20:05:13', '2023-08-02 20:10:12', '2023-08-02 20:10:58', 1, '0', 1, 1, 13, 1),
(4, 2, '12', 2, 1, '2023-01-02 19:44:11', '2023-01-02 19:44:32', '2023-01-02 20:42:13', '2023-01-02 21:02:01', '2023-01-02 21:05:58', 2, '50', NULL, NULL, NULL, 0),
(5, 1, '12', 2, 1, '2023-01-01 19:55:23', '2023-01-01 19:55:55', '2023-01-01 20:35:13', '2023-01-01 20:55:01', '2023-01-01 21:00:02', 1, '0', 2, 2, NULL, 0),
(6, 1, '7', NULL, 1, '2023-10-05 21:12:49', '2023-10-05 21:12:55', NULL, NULL, '2023-10-05 21:15:25', 1, '0', 1, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pizza`
--

CREATE TABLE `Pizza` (
  `idPizza` int(11) NOT NULL,
  `nmPizza` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tpSabor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Pizza`
--

INSERT INTO `Pizza` (`idPizza`, `nmPizza`, `valor`, `tpSabor`) VALUES
(1, 'Quatro Queijos', '59.99', 0),
(2, 'Calabresa', '39.99', 0),
(3, 'Chocolate', '49.99', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Promo`
--

CREATE TABLE `Promo` (
  `idPromo` int(11) NOT NULL,
  `nmPromo` varchar(255) NOT NULL,
  `dtValidadeInicio` date NOT NULL,
  `dtValidadeFim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TelefoneLoja`
--

CREATE TABLE `TelefoneLoja` (
  `idLoja` int(11) NOT NULL,
  `telefone` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `TelefoneLoja`
--

INSERT INTO `TelefoneLoja` (`idLoja`, `telefone`) VALUES
(1, '(35) 99440-4568'),
(1, '(35) 99440-4569'),
(2, '(21) 93452-8133'),
(2, '(21) 93452-8134');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`);

--
-- Índices de tabela `EnderecoCliente`
--
ALTER TABLE `EnderecoCliente`
  ADD PRIMARY KEY (`idCliente`,`nmEndereco`);

--
-- Índices de tabela `HoraFuncionamentoLoja`
--
ALTER TABLE `HoraFuncionamentoLoja`
  ADD PRIMARY KEY (`idLoja`,`diaFuncionamento`);

--
-- Índices de tabela `Ingrediente`
--
ALTER TABLE `Ingrediente`
  ADD PRIMARY KEY (`idIngrediente`),
  ADD UNIQUE KEY `nmIngrediente_UNIQUE` (`nmIngrediente`),
  ADD UNIQUE KEY `idIngrediente_UNIQUE` (`idIngrediente`);

--
-- Índices de tabela `IngredientePizza`
--
ALTER TABLE `IngredientePizza`
  ADD PRIMARY KEY (`idIngrediente`,`idPizza`),
  ADD KEY `idPizza_idx` (`idPizza`);

--
-- Índices de tabela `Loja`
--
ALTER TABLE `Loja`
  ADD PRIMARY KEY (`idLoja`),
  ADD UNIQUE KEY `idLoja_UNIQUE` (`idLoja`),
  ADD UNIQUE KEY `nomeLoja_UNIQUE` (`nmLoja`);

--
-- Índices de tabela `LojaPedidoPizza`
--
ALTER TABLE `LojaPedidoPizza`
  ADD PRIMARY KEY (`idPedido`,`idPizza`,`idLoja`),
  ADD KEY `idPizza_idx` (`idPizza`),
  ADD KEY `idLoja_idx` (`idLoja`);

--
-- Índices de tabela `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  ADD KEY `idCliente_idx` (`idCliente`),
  ADD KEY `idSaborRecheio_idx` (`idIngredienteSaborRecheio`);

--
-- Índices de tabela `Pizza`
--
ALTER TABLE `Pizza`
  ADD PRIMARY KEY (`idPizza`),
  ADD UNIQUE KEY `idPizza_UNIQUE` (`idPizza`),
  ADD UNIQUE KEY `nomePizza_UNIQUE` (`nmPizza`);

--
-- Índices de tabela `Promo`
--
ALTER TABLE `Promo`
  ADD PRIMARY KEY (`idPromo`),
  ADD UNIQUE KEY `idPromo_UNIQUE` (`idPromo`),
  ADD UNIQUE KEY `nmPromo_UNIQUE` (`nmPromo`);

--
-- Índices de tabela `TelefoneLoja`
--
ALTER TABLE `TelefoneLoja`
  ADD PRIMARY KEY (`idLoja`,`telefone`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `Ingrediente`
--
ALTER TABLE `Ingrediente`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `Loja`
--
ALTER TABLE `Loja`
  MODIFY `idLoja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `Pizza`
--
ALTER TABLE `Pizza`
  MODIFY `idPizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `EnderecoCliente`
--
ALTER TABLE `EnderecoCliente`
  ADD CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `HoraFuncionamentoLoja`
--
ALTER TABLE `HoraFuncionamentoLoja`
  ADD CONSTRAINT `idLoja` FOREIGN KEY (`idLoja`) REFERENCES `Loja` (`idLoja`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `IngredientePizza`
--
ALTER TABLE `IngredientePizza`
  ADD CONSTRAINT `idIngrediente` FOREIGN KEY (`idIngrediente`) REFERENCES `Ingrediente` (`idIngrediente`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPizza` FOREIGN KEY (`idPizza`) REFERENCES `Pizza` (`idPizza`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `LojaPedidoPizza`
--
ALTER TABLE `LojaPedidoPizza`
  ADD CONSTRAINT `idLoja1` FOREIGN KEY (`idLoja`) REFERENCES `Loja` (`idLoja`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPedido0` FOREIGN KEY (`idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPizza0` FOREIGN KEY (`idPizza`) REFERENCES `Pizza` (`idPizza`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `idCliente0` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `idSaborRecheio` FOREIGN KEY (`idIngredienteSaborRecheio`) REFERENCES `Ingrediente` (`idIngrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `TelefoneLoja`
--
ALTER TABLE `TelefoneLoja`
  ADD CONSTRAINT `idLoja0` FOREIGN KEY (`idLoja`) REFERENCES `Loja` (`idLoja`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
