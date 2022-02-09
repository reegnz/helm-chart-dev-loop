.PHONY: watchman 
watchman: run
	watchman-make -p '**/*' -t run

.PHONY: watchexec
watchexec:
	watchexec -i out -- make run

.PHONY: run
run:
	mkdir -p out
	helm template --name-template my ./ -f values.testing.yaml > out/rendered-template.yaml
