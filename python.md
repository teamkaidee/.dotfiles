# Python

There's no `Virtualenv (venv)`!? This is by design. Python development should be switched to use `pipenv`.

This repo installed the following packages:

- [pyenv](https://github.com/pyenv/pyenv); Simple Python Version Management
    - Allows installation of multiple Python versions on the machine.
- [pipenv](https://pipenv.readthedocs.io/en/latest/); Pipenv: Python Development Workflow for Humans
    - Simplify usage of virtual environment and dependency management.

# Usage

## Pyenv

* `pyenv` allows us to maintain / use separate python versions on the same machine.
* [Their repository](https://github.com/pyenv/pyenv)'s readme is very detailed and provides a lot of information on how to use the tool.
* We will not attempt to summarize it, but instead we will cover how we will use pyenv.


### Installing additional python versions

* To view all available python versions to pyenv, run the list command.
    - Note that there's a lot of versions, and you should hardly need to tun this command.
    ```bash
    pyenv install -l
    ```
* To install a particular python version:
    ```bash
    pyenv install <python version>
    ```
* To see installed python versions:
    ```bash
    pyenv versions
    ```
    - This outputs a list of python versions that are currently installed into the system.
    - The version that's currently used will have a `*` placed beside it.
    - Note that there's a special python version labelled `system` which refers to the python binary that's found in $PATH

### Choosing Python version

* To use a particular version of python in a directory (and all its subdirectory), simply go to that directory, and run
    ```bash
    pyenv local <version>
    ```
    - This is the command that we will use most of the time.
    - On each repository, we should run this at least once, to "fix" the python version that should be used in each service

## Pipenv

* `pipenv` allows us to maintain isolated python environments. It operates by creating Pipfile (and Pipfile.lock) which contain project configurations and dependencies for that project.
* This allows us to isolate the python packages of each repository. This is used in conjuction with our requirements.txt files in each repository.
* Again, [their repository]((https://pipenv.readthedocs.io/en/latest/))'s readme has clear explanations on installation steps. Please follow from their readme to get it properly installed on your machine.

### Setting up pipenv in each repository

* In each repository, run:
    ```bash
    pipenv install --python <python version> -r dependencies/requirements-dev.txt
    ```
    - **Note that the <python version> here must be the current active python version set by pyenv.**
    - This is because pipenv can only use a python version that can be found on the $PATH. So even if you have the desired version installed, but it's not selected / activated by pyenv, it wouldn't be found.
    - Note that if you have Oh my zsh, you can simply use the `pipenv` plugin, which auto activates the virtual environment on entry to the repo. It also auto deactivates when you try to navigate out of the repository. (But not if u directly navigate into another repo that has pipfile)
    - The `-r` flag tells pipenv to read the dependencies required from a requirements.txt file. In most, if not all, repositories, this file is nested within the dependencies folder, and usually for local we have a `requirements-dev` file.
* The installation command will then create said python "virtual environment" and also register all the information in the aforementined pipfile.

### Activating the virtual environment in each repository

* To be able to use the installed packages, you need to run the following command
    ```bash
    pipenv shell
    ```
    - This is actually an alias, but just know that it will spawn a shell.
    - If you do not modify your shell prompt, it will prepend your prompt with the name of the virtual environment.
* You can now run python in the repository with all the required dependencies.

### Deactivating virtual environment

* remember to run either of the following commands to exit from the virtualenvironment when you're done working with the repo.
This is extremely important when you need to switch repositories (and likely into a different environment)
    ```bash
    deactivate
    ```
    ```bash
    exit
    ```

### Installing dependencies manually

* As dependency is now being handled in Pipfile, `pip` is no longer being used by itself to install them.
* To install dependencies `pipenv` is using `pip` format of the command.
    ```bash
    pipenv installl flask==1.0.0
    ```
    - The above command will install Flask version 1.0.0. Without the version, it will install the latest version available in public.
* Installing pre-release version of the dependency is done with `--pre` parameter
    ```bash
    pipenv install --pre sanic-cors
    ```
* For development dependency use `--dev` parameter.
    ```bash
    pipenv install --dev -r requirements.txt
    ```
