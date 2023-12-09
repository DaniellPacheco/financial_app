/*
  Warnings:

  - Added the required column `managerId` to the `UserManagement` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "UserManagement_managedId_key";

-- AlterTable
ALTER TABLE "UserManagement" ADD COLUMN     "managerId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "UserManagement" ADD CONSTRAINT "UserManagement_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
