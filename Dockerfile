FROM python:3.10-slim-buster


ENV CONDA_ENV_NAME=myenv
ENV PYTHON_VERSION=3.10


# Basic setup
RUN apt update
RUN apt install -y build-essential \
    git \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists

# Set working directory
WORKDIR /workspace/project


# Install Miniconda and create main env
ADD https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh miniconda3.sh
RUN bash miniconda3.sh -b -p /conda \
    && echo export PATH=/conda/bin:$PATH >> .zshrc \
    && rm miniconda3.sh
ENV PATH="/conda/bin:${PATH}"
RUN conda create -n ${CONDA_ENV_NAME} python=${PYTHON_VERSION}

# Switch to zsh shell
SHELL ["/bin/bash", "-c"]

# Install requirements
COPY pyproject.toml ./
COPY ./app.py ./app.py
RUN source activate ${CONDA_ENV_NAME} \
    && pip install poetry \
    && poetry install
CMD source activate ${CONDA_ENV_NAME} && python app.py --ckpt_dir /workspace/project/pyllama_data/${MODELS} --tokenizer_path /workspace/project/pyllama_data/tokenizer.model --max_seq_len ${MAX_SEQ_LEN}