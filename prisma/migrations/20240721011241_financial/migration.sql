-- CreateTable
CREATE TABLE "FinancialAccount" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "institutionName" TEXT NOT NULL,
    "financialAccountTypeId" INTEGER NOT NULL,
    "balance" DECIMAL(65,30) NOT NULL,
    "coinTypeId" INTEGER NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "creditLimit" DECIMAL(65,30) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FinancialAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FinancialAccountType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FinancialAccountType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoinType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "currentValue" DECIMAL(65,30) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CoinType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CoinType_name_key" ON "CoinType"("name");

-- AddForeignKey
ALTER TABLE "FinancialAccount" ADD CONSTRAINT "FinancialAccount_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FinancialAccount" ADD CONSTRAINT "FinancialAccount_financialAccountTypeId_fkey" FOREIGN KEY ("financialAccountTypeId") REFERENCES "FinancialAccountType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FinancialAccount" ADD CONSTRAINT "FinancialAccount_coinTypeId_fkey" FOREIGN KEY ("coinTypeId") REFERENCES "CoinType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
