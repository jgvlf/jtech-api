/*
  Warnings:

  - You are about to drop the column `nascimento` on the `cliente` table. All the data in the column will be lost.
  - Added the required column `ano_nascimento` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dia_nascimento` to the `cliente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mes_nascimento` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `cliente` DROP COLUMN `nascimento`,
    ADD COLUMN `ano_nascimento` INTEGER NOT NULL,
    ADD COLUMN `dia_nascimento` INTEGER NOT NULL,
    ADD COLUMN `mes_nascimento` INTEGER NOT NULL;
