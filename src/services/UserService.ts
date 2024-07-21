import { UserRepository } from "../repositories/UserRepository";

export class UserService {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    async findAll() {
        return await this.userRepository.findAll();
    }

    async findById(id: number) {
        return await this.userRepository.findById(id);
    }
}