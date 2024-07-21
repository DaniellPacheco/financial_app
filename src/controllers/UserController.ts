import { Request, Response } from 'express';
import { UserRepository } from "../repositories/UserRepository";
import { UserService } from "../services/UserService";

export class UserController {

    async index(req: Request, res: Response) {

        const userRepository = new UserRepository();
        const userService = new UserService(userRepository);

        const users = await userService.findAll();

        res.status(200).json(users);

    }

}