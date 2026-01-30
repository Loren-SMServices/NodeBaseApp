import { Request, Response } from 'express';

export const getHealth = (req: Request, res: Response) => {
    res.status(200).json({
        status: 'success',
        message: 'Server is running',
        timestamp: new Date().toISOString(),
    });
};
