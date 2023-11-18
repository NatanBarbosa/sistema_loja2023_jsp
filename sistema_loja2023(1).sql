-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/10/2023 às 20:29
-- Versão do servidor: 10.1.38-MariaDB
-- Versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_loja2023`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_compras`
--

CREATE TABLE `tb_compras` (
  `com_codigo` int(11) NOT NULL,
  `tpg_codigo` int(11) NOT NULL,
  `for_codigo` int(11) NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `com_datacompra` date NOT NULL,
  `com_valortotal` float(18,3) NOT NULL,
  `com_observacoes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_compras`
--

INSERT INTO `tb_compras` (`com_codigo`, `tpg_codigo`, `for_codigo`, `nf_codigo`, `com_datacompra`, `com_valortotal`, `com_observacoes`) VALUES
(22, 22, 40, 53214, '2023-10-07', 1500.000, 'Reestoque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contapagar`
--

CREATE TABLE `tb_contapagar` (
  `cp_codigo` int(11) NOT NULL,
  `cp_valorconta` float(18,4) NOT NULL,
  `cp_datavencimento` date NOT NULL,
  `cp_datapagamento` date NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `cp_observacoes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_contapagar`
--

INSERT INTO `tb_contapagar` (`cp_codigo`, `cp_valorconta`, `cp_datavencimento`, `cp_datapagamento`, `nf_codigo`, `cp_observacoes`) VALUES
(321, 250.0000, '2023-10-07', '2023-10-07', 53215, 'Compra eletrÃ´nicos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contareceber`
--

CREATE TABLE `tb_contareceber` (
  `cr_codigo` int(11) NOT NULL,
  `cr_valorconta` float(18,4) NOT NULL,
  `cr_datavencimento` date NOT NULL,
  `cr_datarecebimento` date NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `cr_observacoes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_contareceber`
--

INSERT INTO `tb_contareceber` (`cr_codigo`, `cr_valorconta`, `cr_datavencimento`, `cr_datarecebimento`, `nf_codigo`, `cr_observacoes`) VALUES
(111, 250.0000, '2023-10-07', '2023-10-07', 58411, 'Conta compra');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `for_codigo` int(11) NOT NULL,
  `for_nome` varchar(80) NOT NULL,
  `for_endereco` varchar(80) NOT NULL,
  `for_numero` varchar(20) NOT NULL,
  `for_bairro` varchar(80) NOT NULL,
  `for_cidade` varchar(80) NOT NULL,
  `for_uf` char(2) NOT NULL,
  `for_cnpjcpf` varchar(14) NOT NULL,
  `for_rgie` varchar(12) NOT NULL,
  `for_telefone` varchar(10) NOT NULL,
  `for_fax` varchar(10) NOT NULL,
  `for_celular` varchar(10) NOT NULL,
  `for_email` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_fornecedor`
--

INSERT INTO `tb_fornecedor` (`for_codigo`, `for_nome`, `for_endereco`, `for_numero`, `for_bairro`, `for_cidade`, `for_uf`, `for_cnpjcpf`, `for_rgie`, `for_telefone`, `for_fax`, `for_celular`, `for_email`) VALUES
(40, 'carlos Almeida', 'Rua das rosas', '195', 'Nova Jersey', 'SÃ£o Bernardo do Campo', 'SP', '68495732011', '683910274', '1193748392', '', '1199182545', 'carlos@ven');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `fun_codigo` int(11) NOT NULL,
  `fun_nome` varchar(80) NOT NULL,
  `fun_endereco` varchar(80) NOT NULL,
  `fun_numero` varchar(20) NOT NULL,
  `fun_complemento` varchar(50) NOT NULL,
  `fun_bairro` varchar(80) NOT NULL,
  `fun_cidade` varchar(80) NOT NULL,
  `fun_uf` char(2) NOT NULL,
  `fun_cnpjcpf` varchar(14) NOT NULL,
  `fun_rgie` varchar(12) NOT NULL,
  `fun_sexo` char(1) NOT NULL,
  `fun_nascimento` date NOT NULL,
  `fun_telefone` varchar(10) NOT NULL,
  `fun_celular` varchar(10) NOT NULL,
  `fun_email` varchar(80) NOT NULL,
  `fun_salario` float(18,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`fun_codigo`, `fun_nome`, `fun_endereco`, `fun_numero`, `fun_complemento`, `fun_bairro`, `fun_cidade`, `fun_uf`, `fun_cnpjcpf`, `fun_rgie`, `fun_sexo`, `fun_nascimento`, `fun_telefone`, `fun_celular`, `fun_email`, `fun_salario`) VALUES
(1, 'Jonas Campos', 'Rua alvÃ¡rio', '66', '', 'Honkong', 'Diadema', 'SP', '68492018272', '204852630', 'M', '2000-07-28', '1148573628', '', 'jonas@vendas.com', 3000.0000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itenscompra`
--

CREATE TABLE `tb_itenscompra` (
  `itc_codigo` int(11) NOT NULL,
  `com_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `tpp_codigo` int(11) NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `for_codigo` int(11) NOT NULL,
  `tpg_codigo` int(11) NOT NULL,
  `itc_embalagem` char(2) NOT NULL,
  `itc_qtde` float(15,3) NOT NULL,
  `itc_valorun` float(18,3) NOT NULL,
  `itc_desc` float(18,3) NOT NULL,
  `itc_valortotal` float(18,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_itenscompra`
--

INSERT INTO `tb_itenscompra` (`itc_codigo`, `com_codigo`, `pro_codigo`, `tpp_codigo`, `nf_codigo`, `for_codigo`, `tpg_codigo`, `itc_embalagem`, `itc_qtde`, `itc_valorun`, `itc_desc`, `itc_valortotal`) VALUES
(1, 22, 1, 22, 53214, 40, 22, 'Ca', 1.000, 1500.000, 0.000, 1500.000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itensvenda`
--

CREATE TABLE `tb_itensvenda` (
  `itv_codigo` int(11) NOT NULL,
  `ven_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `tpp_codigo` int(11) NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `tpg_codigo` int(11) NOT NULL,
  `fun_codigo` int(11) NOT NULL,
  `itv_embalagem` char(2) NOT NULL,
  `itv_qtde` float(15,3) NOT NULL,
  `itv_valorun` float(18,3) NOT NULL,
  `itv_desc` text NOT NULL,
  `itv_valortotal` float(18,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_itensvenda`
--

INSERT INTO `tb_itensvenda` (`itv_codigo`, `ven_codigo`, `pro_codigo`, `tpp_codigo`, `nf_codigo`, `tpg_codigo`, `fun_codigo`, `itv_embalagem`, `itv_qtde`, `itv_valorun`, `itv_desc`, `itv_valortotal`) VALUES
(1, 1, 1, 22, 53214, 22, 1, 'Ca', 5.000, 1000.000, '0.000', 5000.000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_notafiscal`
--

CREATE TABLE `tb_notafiscal` (
  `nf_codigo` int(11) NOT NULL,
  `nf_valornf` float(18,4) NOT NULL,
  `nf_taxaimpostonf` float(15,2) NOT NULL,
  `nf_valorimposto` float(18,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_notafiscal`
--

INSERT INTO `tb_notafiscal` (`nf_codigo`, `nf_valornf`, `nf_taxaimpostonf`, `nf_valorimposto`) VALUES
(53214, 353.0000, 1.00, 3.000),
(53215, 353.0000, 1.00, 3.000),
(58411, 250.0000, 10.00, 25.000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `pro_codigo` int(11) NOT NULL,
  `pro_descricao` varchar(60) NOT NULL,
  `tpp_codigo` int(11) NOT NULL,
  `pro_precocusto` float(18,4) NOT NULL,
  `pro_precovenda` float(18,4) NOT NULL,
  `pro_estoque` float(18,3) NOT NULL,
  `pro_embalagem` char(2) NOT NULL,
  `pro_ipi` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`pro_codigo`, `pro_descricao`, `tpp_codigo`, `pro_precocusto`, `pro_precovenda`, `pro_estoque`, `pro_embalagem`, `pro_ipi`) VALUES
(1, 'MÃ¡quina de lavar', 22, 2000.0000, 2500.0000, 10.000, '10', 50.00),
(2, 'Aspirador de pÃ³', 22, 300.0000, 275.0000, 5.000, '5', 5.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipopagto`
--

CREATE TABLE `tb_tipopagto` (
  `tpg_codigo` int(11) NOT NULL,
  `tpg_descricao` varchar(80) NOT NULL,
  `tpg_qtde` int(11) NOT NULL,
  `tpg_ativo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_tipopagto`
--

INSERT INTO `tb_tipopagto` (`tpg_codigo`, `tpg_descricao`, `tpg_qtde`, `tpg_ativo`) VALUES
(22, 'CartÃ£o de crÃ©dito', 1, 'S');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipoproduto`
--

CREATE TABLE `tb_tipoproduto` (
  `tpp_codigo` int(11) NOT NULL,
  `tpp_descricao` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_tipoproduto`
--

INSERT INTO `tb_tipoproduto` (`tpp_codigo`, `tpp_descricao`) VALUES
(22, 'EletrodomÃ©sticos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_vendas`
--

CREATE TABLE `tb_vendas` (
  `ven_codigo` int(11) NOT NULL,
  `fun_codigo` int(11) NOT NULL,
  `tpg_codigo` int(11) NOT NULL,
  `nf_codigo` int(11) NOT NULL,
  `ven_datavenda` date NOT NULL,
  `ven_valortotal` float(18,3) NOT NULL,
  `ven_observacoes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `tb_vendas`
--

INSERT INTO `tb_vendas` (`ven_codigo`, `fun_codigo`, `tpg_codigo`, `nf_codigo`, `ven_datavenda`, `ven_valortotal`, `ven_observacoes`) VALUES
(1, 1, 22, 53214, '2023-10-07', 5000.000, '');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tb_compras`
--
ALTER TABLE `tb_compras`
  ADD PRIMARY KEY (`com_codigo`),
  ADD KEY `nf_codigo` (`nf_codigo`),
  ADD KEY `tpg_codigo` (`tpg_codigo`),
  ADD KEY `for_codigo` (`for_codigo`);

--
-- Índices de tabela `tb_contapagar`
--
ALTER TABLE `tb_contapagar`
  ADD PRIMARY KEY (`cp_codigo`),
  ADD KEY `nf_codigo` (`nf_codigo`);

--
-- Índices de tabela `tb_contareceber`
--
ALTER TABLE `tb_contareceber`
  ADD PRIMARY KEY (`cr_codigo`),
  ADD KEY `nf_codigo` (`nf_codigo`);

--
-- Índices de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD PRIMARY KEY (`for_codigo`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`fun_codigo`);

--
-- Índices de tabela `tb_itenscompra`
--
ALTER TABLE `tb_itenscompra`
  ADD PRIMARY KEY (`itc_codigo`),
  ADD KEY `pro_codigo` (`pro_codigo`),
  ADD KEY `com_codigo` (`com_codigo`);

--
-- Índices de tabela `tb_itensvenda`
--
ALTER TABLE `tb_itensvenda`
  ADD PRIMARY KEY (`itv_codigo`),
  ADD KEY `pro_codigo` (`pro_codigo`),
  ADD KEY `ven_codigo` (`ven_codigo`);

--
-- Índices de tabela `tb_notafiscal`
--
ALTER TABLE `tb_notafiscal`
  ADD PRIMARY KEY (`nf_codigo`);

--
-- Índices de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`pro_codigo`),
  ADD KEY `tpp_codigo` (`tpp_codigo`);

--
-- Índices de tabela `tb_tipopagto`
--
ALTER TABLE `tb_tipopagto`
  ADD PRIMARY KEY (`tpg_codigo`);

--
-- Índices de tabela `tb_tipoproduto`
--
ALTER TABLE `tb_tipoproduto`
  ADD PRIMARY KEY (`tpp_codigo`);

--
-- Índices de tabela `tb_vendas`
--
ALTER TABLE `tb_vendas`
  ADD PRIMARY KEY (`ven_codigo`),
  ADD KEY `nf_codigo` (`nf_codigo`),
  ADD KEY `fun_codigo` (`fun_codigo`),
  ADD KEY `tpg_codigo` (`tpg_codigo`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `tb_compras`
--
ALTER TABLE `tb_compras`
  ADD CONSTRAINT `tb_compras_ibfk_1` FOREIGN KEY (`nf_codigo`) REFERENCES `tb_notafiscal` (`nf_codigo`),
  ADD CONSTRAINT `tb_compras_ibfk_2` FOREIGN KEY (`tpg_codigo`) REFERENCES `tb_tipopagto` (`tpg_codigo`),
  ADD CONSTRAINT `tb_compras_ibfk_3` FOREIGN KEY (`for_codigo`) REFERENCES `tb_fornecedor` (`for_codigo`);

--
-- Restrições para tabelas `tb_contapagar`
--
ALTER TABLE `tb_contapagar`
  ADD CONSTRAINT `tb_contapagar_ibfk_1` FOREIGN KEY (`nf_codigo`) REFERENCES `tb_notafiscal` (`nf_codigo`);

--
-- Restrições para tabelas `tb_contareceber`
--
ALTER TABLE `tb_contareceber`
  ADD CONSTRAINT `tb_contareceber_ibfk_1` FOREIGN KEY (`nf_codigo`) REFERENCES `tb_notafiscal` (`nf_codigo`),
  ADD CONSTRAINT `tb_contareceber_ibfk_2` FOREIGN KEY (`nf_codigo`) REFERENCES `tb_notafiscal` (`nf_codigo`);

--
-- Restrições para tabelas `tb_itenscompra`
--
ALTER TABLE `tb_itenscompra`
  ADD CONSTRAINT `tb_itenscompra_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `tb_produtos` (`pro_codigo`),
  ADD CONSTRAINT `tb_itenscompra_ibfk_2` FOREIGN KEY (`com_codigo`) REFERENCES `tb_compras` (`com_codigo`);

--
-- Restrições para tabelas `tb_itensvenda`
--
ALTER TABLE `tb_itensvenda`
  ADD CONSTRAINT `tb_itensvenda_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `tb_produtos` (`pro_codigo`),
  ADD CONSTRAINT `tb_itensvenda_ibfk_2` FOREIGN KEY (`ven_codigo`) REFERENCES `tb_vendas` (`ven_codigo`);

--
-- Restrições para tabelas `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD CONSTRAINT `tb_produtos_ibfk_1` FOREIGN KEY (`tpp_codigo`) REFERENCES `tb_tipoproduto` (`tpp_codigo`);

--
-- Restrições para tabelas `tb_vendas`
--
ALTER TABLE `tb_vendas`
  ADD CONSTRAINT `tb_vendas_ibfk_1` FOREIGN KEY (`nf_codigo`) REFERENCES `tb_notafiscal` (`nf_codigo`),
  ADD CONSTRAINT `tb_vendas_ibfk_2` FOREIGN KEY (`fun_codigo`) REFERENCES `tb_funcionario` (`fun_codigo`),
  ADD CONSTRAINT `tb_vendas_ibfk_3` FOREIGN KEY (`tpg_codigo`) REFERENCES `tb_tipopagto` (`tpg_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
