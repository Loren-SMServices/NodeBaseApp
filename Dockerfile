# Build stage
FROM node:lts-alpine as builder

WORKDIR /usr/src/app

COPY package*.json ./

# Install all dependencies (including devDependencies for building)
RUN npm install

COPY . .

# Build the TypeScript code
RUN npm run build

# Production stage
FROM node:lts-alpine

WORKDIR /usr/src/app

COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy built assets from builder stage
COPY --from=builder /usr/src/app/dist ./dist

EXPOSE 3000

CMD ["npm", "start"]
