.PHONY: install uninstall deb

install:
	cp etc/bash_completion.d/nuxeoctl-bash-completion.bash /etc/bash_completion.d/nuxeoctl-bash-completion.bash

uninstall:
	rm /etc/bash_completion.d/nuxeoctl-bash-completion.bash

deb:
	dpkg-deb -z8 -Zgzip --build ../nuxeoctl-bash-completion
