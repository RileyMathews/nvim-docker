FROM python:3.11
WORKDIR /tmp
RUN apt-get update -y && apt-get install -y ninja-build gettext cmake unzip curl
RUN git clone https://github.com/neovim/neovim

WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install

RUN curl -sSL https://install.python-poetry.org | python - --version 1.5.1
ENV PATH="${PATH}:/root/.local/bin"
WORKDIR /code
COPY . .

CMD ["/bin/bash"]
