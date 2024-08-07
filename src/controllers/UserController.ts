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

    async show(req: Request, res: Response) {
        const { id } = req.params;

        const userRepository = new UserRepository();
        const userService = new UserService(userRepository);

        const user = await userService.findById(parseInt(id));

        res.status(200).json(user);
    }

    async create(req: Request, res: Response) {
        const { email, name, password } = req.body;

        console.log( email, name, password);
        
        const userRepository = new UserRepository();
        const userService = new UserService(userRepository);

        const user = await userService.create(email, name, password);
        
        res.status(201).json({
            message: "User created successfully",
            user
        });
    }

}