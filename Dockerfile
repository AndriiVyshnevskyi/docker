# Используем базовый образ Ubuntu 20.04
FROM ubuntu:20.04

# Устанавливаем необходимые утилиты и программы
RUN apt update && apt upgrade -y && \
    apt install -y git curl wget jq vim nano && \
    apt clean

# Устанавливаем Docker CLI
RUN apt install -y docker.io

# Устанавливаем kubectl для работы с Kubernetes
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Задаем рабочую директорию
WORKDIR /workspace

# Запускаем оболочку при старте контейнера
CMD ["/bin/bash"]
