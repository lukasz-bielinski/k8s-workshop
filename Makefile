containers:
	docker build -t app app
	docker build -t ctl .

app:
	docker run --rm -p 8080:8080 app

ctl:
	docker run -it --rm -v ~/.kube/config:/root/.kube/config -v ~/src/workshops/kubernetes:/res ctl
