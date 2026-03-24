FROM node:18

# Install Python + venv
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip

WORKDIR /app

# Copy all files
COPY . .

# Create virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies
RUN npm install
RUN pip install -r requirements_new.txt

# Start backend
CMD ["node", "src/server.js"]