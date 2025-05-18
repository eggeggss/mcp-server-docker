# 使用官方 Python 執行環境作為基底映像檔
# FROM python:3.11
FROM node:24.0.2-bookworm


RUN apt-get update && apt-get install -y antiword


RUN export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
RUN apt-get update && apt-get install -y python3-pip curl
RUN npm install -g @modelcontextprotocol/inspector@0.12.0

# 設定工作目錄為 /app
WORKDIR /app

# 將當前目錄內容複製到容器中的 /app
COPY . /app
# RUN chmod +x /app/start.sh
# RUN ./installns.sh

# 安裝 requirements.txt 中列出的所有必要套件
RUN pip install --no-cache-dir -r  requirement.txt --break-system-packages


# # 設定環境變數
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# 容器啟動時執行 convert.py
# CMD ["python", "./main.py"]
CMD ["./start.sh"]
