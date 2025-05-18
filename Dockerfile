FROM node:24.0.2-bookworm

RUN apt-get update && apt-get install -y antiword

RUN apt-get update && apt-get install -y python3-pip curl
RUN npm install -g @modelcontextprotocol/inspector@0.12.0

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r  requirement.txt --break-system-packages

CMD ["./start.sh"]
