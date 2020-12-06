
# Docker - CAPA tool

CAPA is a tool developped by Fireeye to analyse binary.
source: https://www.fireeye.com/blog/threat-research/2020/07/capa-automatically-identify-malware-capabilities.html

## Build docker

```
cd docker-capa
docker build -t capa .
```

## Analyse binary

```
docker run -it -v $(pwd):/home/capa capa ./<binary.exe>
```
