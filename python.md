# Python

There's no `Virtualenv (venv)`!? This is by designed. Python development should be switched to use `pipenv`. 

This repo installed the following packages:

- [pipenv](https://pipenv.readthedocs.io/en/latest/); Pipenv: Python Development Workflow for Humans
    - Simplify usage of virtual environment and dependency management.
- [pyenv](https://github.com/pyenv/pyenv); Simple Python Version Management
    - Allows installation of multiple Python versions on the machine.

## Usage

`Pipenv` operate by creating Pipfile (and Pipfile.lock) which contain project configurations and dependencies for that project.

### Choosing Python version

Python version is installed via `pyenv`, this is completely transparent to you as both `pipenv` and `pyenv` have been configured to work together.

Go into the project repository then type

```
pipenv --python 3.7.0
```

This only effect the virtual environment of that repository.

### Virtual Environment

Virtual Environment is automatically created with running pipenv for the first time `pipenv` is run. You will not need to specify environment name as this is handled automatically.

Activating Virtual Environment is done by running

```
pipenv shell
```

If you want to run arbitary command in virtual environment

### Installing dependencies

As dependency is now being handled in Pipfile, `pip` is no longer being used by itself to install them.

To install dependencies `pipenv` is using `pip` format of the command.

```
pipenv installl flask==1.0.0
```

The above command will install Flask version 1.0.0. Without the version, it will install the latest version available in public.

Installing pre-release version of the dependency is done with `--pre` parameter

```
pipenv install --pre sanic-cors
```

Most of the existing project will most likely have requirements file of sort(requirements.txt, production.txt, development.txt, etc). 

To migrate from the requirements, use `-r` parameter.

```
pipenv install -r requirements.txt
```

For development dependency use `--dev` parameter.

```
pipenv install --dev -r requirements.txt
```

NOTE: Currently `Pipenv` is having dependency graph bug which cause the dependency requirement to mess up and could not resolve the requirement. This can be mitigate by **skipping locking mechanism** by using `--ship-lock` argument.