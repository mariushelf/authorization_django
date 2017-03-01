RM = rm -rf
.PHONY: release dist build test coverage clean distclean

release: clean test
	python setup.py sdist upload

dist: clean
	python setup.py sdist

build:
	python setup.py build

test:
	python setup.py test -a "-p no:cacheprovider --verbose ."

coverage:
	python setup.py test -a "-p no:cacheprovider --verbose --cov=authorization_django --cov-report=term --cov-config .coveragerc ."

clean:
	@$(RM) build/ *.egg-info/
	@find . \( \
		-iname "*.pyc" \
		-or -iname "*.pyo" \
		-or -iname "*.so" \
		-or -iname "*.o" \
		-or -iname "*~" \
		-or -iname "._*" \
		-or -iname "*.swp" \
		-or -iname "Desktop.ini" \
		-or -iname "Thumbs.db" \
		-or -iname "__MACOSX__" \
		-or -iname ".DS_Store" \
		\) -delete

distclean: clean
	@$(RM) \
		dist/ \
		bin/ \
		develop-eggs/ \
		eggs/ \
		parts/ \
		MANIFEST \
		htmlcov/ \
		.coverage \
		.installed.cfg
