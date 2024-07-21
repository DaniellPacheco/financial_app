import { hash } from "bcryptjs";
import { UserRepository } from "../repositories/UserRepository";
import { AppError } from "../utils/AppError";

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

    async create(email: string, name: string, password: string) {

        if(!email ||!name ||!password) {
            throw new Error('Missing required fields');
        }

        const checkUserExists = await this.userRepository.findByEmail(email);

        if(checkUserExists) {
            // throw new Error('User already exists');
            throw new AppError('User already exists', 409);
        }

        const hashedPassword = await hash(password, 8);

        const userCreated = await this.userRepository.create(email, name, hashedPassword);

        return userCreated;
    }
}