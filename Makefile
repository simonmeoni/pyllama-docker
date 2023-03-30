docker-build:
	docker build -t llama .

docker-run:
	docker run -d --restart always -v /home/Simon/pyllama-docker:/workspace/project -e MAX_SEQ_LEN=1048 --gpus all -p 80:8042 llama
	#docker run -d --restart always -v /home/Simon/pyllama-docker:/workspace/project -e MAX_SEQ_LEN=1048 --gpus all -p 80:8080 llama
