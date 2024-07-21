import express from 'express';
import 'express-async-errors';
import cors from 'cors';
import cookieParser from 'cookie-parser';

import { routes } from './routes/index';
import { configError } from './middlewares/configErrors';

const app = express();

app.use(express.json());

app.use(cookieParser());

app.use(cors({
  origin: ["http://localhost:5173"],
  credentials: true,
}));

app.use(routes);

app.use(configError);

const PORT = process.env.PORT || 3333;
app.listen(3333, () => console.log(`server running on http://localhost:${PORT}`));