REPO=robrohan
APP=bash-ping

test:
	@echo "Starting server on 9323..."
	@echo "prom file wont update unless you run ping.sh yourself..."
	./server.sh 9323 0

build:
	docker build -t $(REPO)/$(APP) .

test_docker:
	docker run --rm -p 9323:9323 $(REPO)/$(APP)

push:
	docker push $(REPO)/$(APP)
