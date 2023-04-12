-- AlterTable
ALTER TABLE `cliente` MODIFY `fk_idConta` VARCHAR(255) NULL,
    MODIFY `fk_idContato` VARCHAR(255) NULL,
    MODIFY `fk_idEndereco` INTEGER NULL;
