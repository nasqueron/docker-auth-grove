all: setup-nodesource-deb

setup-nodesource-deb:
	wget -O setup-nodesource-deb https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_6.x
	chmod +x setup-nodesource-deb

clean:
	rm -f setup-nodesource-deb

