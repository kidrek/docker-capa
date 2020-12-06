FROM python:2-slim
LABEL maintainer "kidrek"


RUN apt-get update \
  && apt-get install -y curl git jq unzip wget \
  && wget $(curl -sL https://api.github.com/repos/fireeye/capa/releases/latest | jq -r '.assets[].browser_download_url' | grep -i linux) \
  && unzip capa-*-linux.zip \
  && git clone --branch=master --depth=1 https://github.com/fireeye/capa-rules.git \
  && rm -rf /capa-rules/.git \
  && apt-get purge -y git \
  && useradd -m capa

USER capa
WORKDIR /home/capa
ENTRYPOINT ["/capa", "-r", "/capa-rules"]
CMD ["--help"]
