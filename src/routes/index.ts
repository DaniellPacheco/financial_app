import { Router, Request, Response } from 'express';

import { userRoutes } from './users.routes';

const routes = Router();

routes.get('/', (req: Request, res: Response) => {
    res.json({ message: 'hello world with Typescript' })
});

routes.use('/users', userRoutes);

export { routes };