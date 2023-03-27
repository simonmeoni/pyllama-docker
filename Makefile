docker-build:
	docker build -t llama .

docker-run:
	docker run -v $(PWD):/workspace/project -e MODELS=$(MODELS) --gpus all

