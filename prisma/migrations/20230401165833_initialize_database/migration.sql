-- CreateTable
CREATE TABLE `administrador` (
    `idAdministrador` INTEGER NOT NULL AUTO_INCREMENT,
    `primiero_nome` VARCHAR(255) NOT NULL,
    `ultimo_nome` VARCHAR(255) NOT NULL,
    `idConta` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `idAdministrador_UNIQUE`(`idAdministrador`),
    UNIQUE INDEX `idConta_UNIQUE`(`idConta`),
    PRIMARY KEY (`idAdministrador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `atualiza` (
    `Funcionario_idFuncionario` INTEGER NOT NULL,
    `Produto_idProduto` INTEGER NOT NULL,

    INDEX `fk_Funcionario_has_Produto_Funcionario1_idx`(`Funcionario_idFuncionario`),
    INDEX `fk_Funcionario_has_Produto_Produto1_idx`(`Produto_idProduto`),
    PRIMARY KEY (`Funcionario_idFuncionario`, `Produto_idProduto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cliente` (
    `CPF` INTEGER NOT NULL,
    `CNPJ` INTEGER NULL,
    `primeiro_nome` VARCHAR(255) NOT NULL,
    `ultimo_nome` VARCHAR(255) NOT NULL,
    `nascimento` DATE NOT NULL,
    `idConta` VARCHAR(255) NOT NULL,
    `idEndereco` INTEGER NOT NULL,
    `idContato` VARCHAR(255) NOT NULL,
    `fk_idPedido` INTEGER NOT NULL,

    UNIQUE INDEX `CPF_UNIQUE`(`CPF`),
    UNIQUE INDEX `CNPJ_UNIQUE`(`CNPJ`),
    UNIQUE INDEX `idConta_UNIQUE`(`idConta`),
    UNIQUE INDEX `idEndereco_UNIQUE`(`idEndereco`),
    UNIQUE INDEX `idContato_UNIQUE`(`idContato`),
    UNIQUE INDEX `idPedido_UNIQUE`(`fk_idPedido`),
    PRIMARY KEY (`CPF`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `compra` (
    `Produto_idProduto` INTEGER NOT NULL,
    `Cliente_CPF` INTEGER NOT NULL,

    INDEX `fk_Produto_has_Cliente_Cliente1_idx`(`Cliente_CPF`),
    INDEX `fk_Produto_has_Cliente_Produto1_idx`(`Produto_idProduto`),
    PRIMARY KEY (`Produto_idProduto`, `Cliente_CPF`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `conta` (
    `nome_usuario` VARCHAR(255) NOT NULL,
    `senha` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `nome_usuário_UNIQUE`(`nome_usuario`),
    PRIMARY KEY (`nome_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contato` (
    `email` VARCHAR(255) NOT NULL,
    `DDI_telefone` INTEGER NULL,
    `DDD_telefone` INTEGER NULL,
    `telefone` INTEGER NULL,
    `DDI_celular` INTEGER NOT NULL,
    `DDD_celular` INTEGER NOT NULL,
    `celular` VARCHAR(45) NOT NULL,

    UNIQUE INDEX `email_UNIQUE`(`email`),
    UNIQUE INDEX `telefone_UNIQUE`(`telefone`),
    UNIQUE INDEX `celular_UNIQUE`(`celular`),
    PRIMARY KEY (`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contem` (
    `Produto_idProduto` INTEGER NOT NULL,
    `Pedido_idPedido` INTEGER NOT NULL,

    INDEX `fk_Produto_has_Pedido_Pedido1_idx`(`Pedido_idPedido`),
    INDEX `fk_Produto_has_Pedido_Produto1_idx`(`Produto_idProduto`),
    PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `endereco` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Rua` VARCHAR(255) NOT NULL,
    `Bairro` VARCHAR(255) NOT NULL,
    `numero_casa` INTEGER NOT NULL,
    `complemento` VARCHAR(255) NULL,
    `CEP` INTEGER NOT NULL,
    `Cidade` VARCHAR(255) NOT NULL,
    `Estado` VARCHAR(255) NOT NULL,
    `Pais` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `id_UNIQUE`(`id`),
    UNIQUE INDEX `complemento_UNIQUE`(`complemento`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `funcionario` (
    `idFuncionario` INTEGER NOT NULL,
    `primeiro_nome` VARCHAR(255) NOT NULL,
    `ultimo_nome` VARCHAR(255) NOT NULL,
    `idConta` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `idFuncionario_UNIQUE`(`idFuncionario`),
    UNIQUE INDEX `idConta_UNIQUE`(`idConta`),
    PRIMARY KEY (`idFuncionario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gerencia_c` (
    `Cliente_CPF` INTEGER NOT NULL,
    `Administrador_idAdministrador` INTEGER NOT NULL,

    INDEX `fk_Cliente_has_Administrador_Administrador1_idx`(`Administrador_idAdministrador`),
    INDEX `fk_Cliente_has_Administrador_Cliente1_idx`(`Cliente_CPF`),
    PRIMARY KEY (`Cliente_CPF`, `Administrador_idAdministrador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gerencia_f` (
    `Administrador_idAdministrador` INTEGER NOT NULL,
    `Funcionario_idFuncionario` INTEGER NOT NULL,

    INDEX `fk_Administrador_has_Funcionario_Administrador1_idx`(`Administrador_idAdministrador`),
    INDEX `fk_Administrador_has_Funcionario_Funcionario1_idx`(`Funcionario_idFuncionario`),
    PRIMARY KEY (`Administrador_idAdministrador`, `Funcionario_idFuncionario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pedido` (
    `idPedido` INTEGER NOT NULL AUTO_INCREMENT,
    `data_entrega` DATE NOT NULL,
    `quantidade` INTEGER NOT NULL,

    PRIMARY KEY (`idPedido`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produto` (
    `idProduto` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `marca` VARCHAR(255) NOT NULL,
    `modelo` VARCHAR(255) NOT NULL,
    `preco` DECIMAL(8, 2) NOT NULL,
    `qtd_disponivel` INTEGER NOT NULL,

    UNIQUE INDEX `idProduto_UNIQUE`(`idProduto`),
    PRIMARY KEY (`idProduto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `administrador` ADD CONSTRAINT `nome_usuario_a` FOREIGN KEY (`idConta`) REFERENCES `conta`(`nome_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `atualiza` ADD CONSTRAINT `fk_Funcionario_has_Produto_Funcionario1` FOREIGN KEY (`Funcionario_idFuncionario`) REFERENCES `funcionario`(`idFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `atualiza` ADD CONSTRAINT `fk_Funcionario_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto`(`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `email` FOREIGN KEY (`idContato`) REFERENCES `contato`(`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `id` FOREIGN KEY (`idEndereco`) REFERENCES `endereco`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `idPedido` FOREIGN KEY (`fk_idPedido`) REFERENCES `pedido`(`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `nome_usuario` FOREIGN KEY (`idConta`) REFERENCES `conta`(`nome_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `fk_Produto_has_Cliente_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente`(`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `fk_Produto_has_Cliente_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto`(`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `contem` ADD CONSTRAINT `fk_Produto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido`(`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `contem` ADD CONSTRAINT `fk_Produto_has_Pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto`(`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `funcionario` ADD CONSTRAINT `nome_usuario_f` FOREIGN KEY (`idConta`) REFERENCES `conta`(`nome_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gerencia_c` ADD CONSTRAINT `fk_Cliente_has_Administrador_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador`(`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gerencia_c` ADD CONSTRAINT `fk_Cliente_has_Administrador_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente`(`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gerencia_f` ADD CONSTRAINT `fk_Administrador_has_Funcionario_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador`(`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gerencia_f` ADD CONSTRAINT `fk_Administrador_has_Funcionario_Funcionario1` FOREIGN KEY (`Funcionario_idFuncionario`) REFERENCES `funcionario`(`idFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
