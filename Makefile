docker-build:
	docker build -t llama .

docker-run:
	docker run -d --restart-always -v /home/Simon/pyllama-docker:/workspace/project -e MODELS=$(MODELS) --gpus all -p 80:8080 llama
