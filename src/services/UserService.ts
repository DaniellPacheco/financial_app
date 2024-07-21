import { UserRepository } from "../repositories/UserRepository";

export class UserService {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    async findAll() {
        const users = await this.userRepository.findAll();
        return users;
    }
}