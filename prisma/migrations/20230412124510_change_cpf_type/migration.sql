/*
  Warnings:

  - The primary key for the `cliente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `compra` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `gerencia_c` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `compra` DROP FOREIGN KEY `fk_Produto_has_Cliente_Cliente1`;

-- DropForeignKey
ALTER TABLE `gerencia_c` DROP FOREIGN KEY `fk_Cliente_has_Administrador_Cliente1`;

-- AlterTable
ALTER TABLE `cliente` DROP PRIMARY KEY,
    MODIFY `CPF` BIGINT NOT NULL,
    ADD PRIMARY KEY (`CPF`);

-- AlterTable
ALTER TABLE `compra` DROP PRIMARY KEY,
    MODIFY `Cliente_CPF` BIGINT NOT NULL,
    ADD PRIMARY KEY (`Produto_idProduto`, `Cliente_CPF`);

-- AlterTable
ALTER TABLE `gerencia_c` DROP PRIMARY KEY,
    MODIFY `Cliente_CPF` BIGINT NOT NULL,
    ADD PRIMARY KEY (`Cliente_CPF`, `Administrador_idAdministrador`);

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `fk_Produto_has_Cliente_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente`(`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gerencia_c` ADD CONSTRAINT `fk_Cliente_has_Administrador_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente`(`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;
