import { Request, Response, NextFunction } from 'express';

export interface AppError extends Error {
    status?: number;
}

const errorHandler = (err: AppError, req: Request, res: Response, next: NextFunction) => {
    console.error(err.stack);

    const status = err.status || 500;
    const message = err.message || 'Internal Server Error';

    res.status(status).json({
        error: {
            message,
            status,
        },
    });
};

export default errorHandler;
