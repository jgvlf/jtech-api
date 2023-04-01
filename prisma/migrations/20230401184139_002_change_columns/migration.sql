/*
  Warnings:

  - You are about to drop the column `idConta` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `idContato` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `idEndereco` on the `cliente` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[fk_idContato]` on the table `cliente` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[fk_idConta]` on the table `cliente` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[fk_idEndereco]` on the table `cliente` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `fk_idConta` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fk_idContato` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fk_idEndereco` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `cliente` DROP FOREIGN KEY `email`;

-- DropForeignKey
ALTER TABLE `cliente` DROP FOREIGN KEY `id`;

-- DropForeignKey
ALTER TABLE `cliente` DROP FOREIGN KEY `nome_usuario`;

-- AlterTable
ALTER TABLE `cliente` DROP COLUMN `idConta`,
    DROP COLUMN `idContato`,
    DROP COLUMN `idEndereco`,
    ADD COLUMN `fk_idConta` VARCHAR(255) NOT NULL,
    ADD COLUMN `fk_idContato` VARCHAR(255) NOT NULL,
    ADD COLUMN `fk_idEndereco` INTEGER NOT NULL,
    MODIFY `fk_idPedido` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `fk_idContato_UNIQUE` ON `cliente`(`fk_idContato`);

-- CreateIndex
CREATE UNIQUE INDEX `Conta_nome_usuario_UNIQUE` ON `cliente`(`fk_idConta`);

-- CreateIndex
CREATE UNIQUE INDEX `Endereco_id_UNIQUE` ON `cliente`(`fk_idEndereco`);

-- CreateIndex
CREATE INDEX `fk_Cliente_Conta1_idx` ON `cliente`(`fk_idConta`);

-- CreateIndex
CREATE INDEX `fk_Cliente_Contato1_idx` ON `cliente`(`fk_idContato`);

-- CreateIndex
CREATE INDEX `fk_Cliente_Endereco1_idx` ON `cliente`(`fk_idEndereco`);

-- CreateIndex
CREATE INDEX `fk_Cliente_Pedido1_idx` ON `cliente`(`fk_idPedido`);

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `fk_Cliente_Conta` FOREIGN KEY (`fk_idConta`) REFERENCES `conta`(`nome_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `fk_Cliente_Contato` FOREIGN KEY (`fk_idContato`) REFERENCES `contato`(`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `fk_Cliente_Endereco` FOREIGN KEY (`fk_idEndereco`) REFERENCES `endereco`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- RenameIndex
ALTER TABLE `cliente` RENAME INDEX `idPedido_UNIQUE` TO `fk_idPedido_UNIQUE`;
