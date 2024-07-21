import { Router, Request, Response } from "express";

import { UserController } from "../controllers/UserController";

const userRoutes = Router();

const userController = new UserController();

userRoutes.get('/', userController.index);

export { userRoutes };