import { PrismaClient } from '@prisma/client'

export class UserRepository {
    private prisma: PrismaClient;

    constructor() {
        this.prisma = new PrismaClient();
    }

    async findAll() {
        const allUsers = await this.prisma.user.findMany();
        return allUsers;
    }
    async findById(id: number) {
        return await this.prisma.user.findUnique({ where: { id }});
    }

    async create() {}

    async uppdate() {}

    async delete() {}
}