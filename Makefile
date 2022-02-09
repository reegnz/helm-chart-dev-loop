.PHONY: watch
watch: run
	watchman-make -p templates/* values.yaml values.testing.yaml -t run

.PHONY: run
run:
	mkdir -p out
	helm template --name-template my ./ -f values.testing.yaml > out/rendered-template.yaml
