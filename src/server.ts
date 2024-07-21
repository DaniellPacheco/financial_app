import express from 'express';
import cors from 'cors';

import { routes } from './routes/index';

const app = express();
app.use(cors({
  origin: ["http://localhost:5173"],
  credentials: true,
}));

app.use(routes);

app.use(express.json());

const PORT = process.env.PORT || 3333;
app.listen(3333, () => console.log(`server running on http://localhost:${PORT}`));