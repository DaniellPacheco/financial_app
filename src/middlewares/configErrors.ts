import { Request, Response, NextFunction } from "express";
import { AppError } from "../utils/AppError";

export function configError(error: any, req: Request, res: Response, next: NextFunction) {

    if(error instanceof AppError) {
        return res.status(error.statusCode).json({
            status: 'error',
            message: error.message
        });
    }

    console.log(error);

    return res.status(500).json({
        status: "error",
        message: "Internal server error"
    });

}