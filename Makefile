
options:
	@echo Deployment options:
	@echo "HOME = ${HOME}"

custom:
	@echo Linking repository to user .bash_profile
	@mv ${HOME}/.bash_profile ${HOME}/.bash_profile.bak
	@ln -s `pwd`/bash_profile ${HOME}/.bash_profile
	bash -c "source ${HOME}/.bash_profile"
	@echo Done. To change settings use this repository.

link:
	@echo Linking repository to user .bash_profile
	@ln -s `pwd`/bash_profile ${HOME}/.bash_profile
	bash -c "source ${HOME}/.bash_profile"
	@echo Done. To change settings use this repository.

reload:
	@echo Reloading user .bash_profile
	bash -c "source ${HOME}/.bash_profile"
	@echo Done.

# fc-cache

.PHONY: options custom link reload all
