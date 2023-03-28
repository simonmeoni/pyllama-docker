🦙 Pyllama-docker

a containerized llama for GPU.
I use pyllama to download and run model.

see https://github.com/juncongmoo/pyllama/tree/main#-community-way to download model.
I use these scripts to run llama 8b model on single GPU: https://github.com/juncongmoo/pyllama/tree/main/apps/flask

to run it: 

1. make docker-build
2. make docker-run MODELS=7B
