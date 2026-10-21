FROM node:26.12-alpine3.23

# Create a non-root user
RUN addgroup -S app && adduser -S -G app app

# Set the working directory
WORKDIR /app

# Give the app user ownership of the working directory
RUN chown app:app /app

# Copy package files with the correct ownership
COPY --chown=app:app package*.json ./

# Switch to the non-root user
USER app

# Install dependencies
RUN npm install

# Copy the remaining application files
COPY --chown=app:app . .

# Set environment variable
ENV API_URL=http://api.myapp.com


# Expose the Vite development server port
EXPOSE 5173


# Start Vite and allow access from outside the container
CMD ["npm", "start", "--", "--host", "0.0.0.0"]