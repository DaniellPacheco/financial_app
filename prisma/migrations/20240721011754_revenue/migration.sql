/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `FinancialAccountType` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "Revenue" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "value" DECIMAL(65,30) NOT NULL,
    "recurrent" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Revenue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RevenueCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RevenueCategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RevenueCategory_name_key" ON "RevenueCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "FinancialAccountType_name_key" ON "FinancialAccountType"("name");

-- AddForeignKey
ALTER TABLE "Revenue" ADD CONSTRAINT "Revenue_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Revenue" ADD CONSTRAINT "Revenue_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "RevenueCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
