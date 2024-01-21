ARG GOARCH=adm64
FROM registry.cn-qingdao.aliyuncs.com/fs_lee/fs:1.20 as builder
  
WORKDIR /app  
  
COPY requirements.txt requirements.txt  
  
RUN python -m venv venv  
ENV PATH="/app/venv/bin:$PATH"  
  
RUN apt-get update && \  
    apt-get install -y --no-install-recommends build-essential libffi-dev cmake libcurl4-openssl-dev && \  
    pip3 install --no-cache-dir -r requirements.txt  
  
COPY . .  
  
RUN chmod -R 777 translations  
  
CMD ["python3", "./run.py"]  
