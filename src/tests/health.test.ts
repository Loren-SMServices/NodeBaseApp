import request from 'supertest';
import app from '../app';

describe('Health Check', () => {
    it('should return 200 OK', async () => {
        const response = await request(app).get('/api/health');
        expect(response.status).toBe(200);
        // Assuming the controller returns a message like { message: 'OK' } or similar
        // I will verify the basic status first.
    });
});
