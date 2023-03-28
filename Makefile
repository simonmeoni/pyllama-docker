docker-build:
	docker build -t llama .

docker-run:
	docker run -d --restart always -v /home/Simon/pyllama-docker:/workspace/project -e MODELS=$(MODELS) -e MAX_SEQ_LEN=$(MAX_SEQ_LEN) --gpus all -p 80:8080 llama
