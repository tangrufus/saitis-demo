COMPOSER_HOME ?= $(HOME)/.composer
HEROKU_APP_NAME ?= saitis-demo

.PHONY: satis
satis:
	docker run --rm --init -it --user $(shell id -u):$(shell id -g) --volume $(shell pwd):/build --volume ${COMPOSER_HOME}:/composer composer/satis build

.PHONY: push
push: satis
	heroku container:login
	heroku container:push web -a ${HEROKU_APP_NAME}

.PHONY: push
release: push
	heroku container:release web -a ${HEROKU_APP_NAME}
