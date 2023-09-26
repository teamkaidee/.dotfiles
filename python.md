<!-- Based off the best readme template from https://github.com/othneildrew/Best-README-Template -->
<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

# Python

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#pyenv">Pyenv</a>
      <ul>
        <li><a href="#installing-additional-python-versions">Installing additional python versions</a></li>
        <li><a href="#choosing-python-version">Choosing Python version</a></li>
      </ul>
    </li>
    <li>
      <a href="#pipenv">Pipenv</a>
      <ul>
        <li><a href="#setting-up-local-dev-environment">Seting up Local Dev Environment</a></li>
        <li><a href="#updating-the-virtual-environment-in-each-repository">Updating the virtual environment in each repository</a></li>
            <ul>
                <li><a href="#adding-new-package-dependencies">Adding new package dependencies</a></li>
                <li><a href="#updating-requirements.txt">Updating requirements.txt</a></li>
                <li><a href="#removing-packages">Removing packages</a></li>
                <li><a href="#removing-unused-packages">Removing unused packages</a></li>
            </ul>
        <li><a href="#activating-the-virtual-environment-in-each-repository">Activating the virtual environment in each repository</a></li>
        <li><a href="#deactivating-virtual-environment">Deactivating virtual environment</a></li>
        <li><a href="#removing-existing-environment-in-each-repository">Removing existing environment in each repository</a></li>
        <li><a href="#to-check-if-there's-any-issue-with-environment">To check if there's any issue with environment</a></li>
      </ul>
    </li>
  </ol>
</details>

There's no `Virtualenv (venv)`!? This is by design. Python development should be switched to use `pipenv`.

This repo installed the following packages:

* [pyenv](https://github.com/pyenv/pyenv); Simple Python Version Management
    - Allows installation of multiple Python versions on the machine.
* [pipenv](https://pipenv.readthedocs.io/en/latest/); Pipenv: Python Development Workflow for Humans
    - Simplify usage of virtual environment and dependency management.

## Pyenv

* `pyenv` allows us to maintain / use separate python versions on the same machine.
* [Their repository](https://github.com/pyenv/pyenv)'s readme is very detailed and provides a lot of information on how to use the tool.
* We will not attempt to summarize it, but instead we will cover how we will use `pyenv`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Installing additional python versions

* To view all available python versions to `pyenv`, run the list command.
    - Note that there's a lot of versions. if you're looking for a specific version piping it to `grep <version>` would make more sense.
    ```zsh
    pyenv install -l

    pyenv install -l | grep <python version you want to find here>
    ```
* To install a particular python version:
    ```zsh
    pyenv install <python version>
    ```
* To see installed python versions:
    ```zsh
    pyenv versions
    ```
    - This outputs a list of python versions that are currently installed into the system.
    - The version that's currently used will have a `*` placed beside it.
    - Note that there's a special python version labelled `system` which refers to the python binary that's found in $PATH

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Choosing Python version

* To use a particular version of python in a directory (and all its subdirectory), simply go to that directory, and run
    ```zsh
    pyenv local <version>
    ```
    - This is the command that we will use most of the time.
    - On each repository, we should run this at least once, to "fix" the python version that should be used in each service
* To set a python as the default for the shell, run
    ```zsh
    pyenv shell <version>
    ```
    - This will set the python version as the default for current shell session only
    - exiting the session will render this setting useless
* To set a python version as the "default" for the user, run
    ```zsh
    pyenv global <version
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Pipenv

* `pipenv` allows us to maintain isolated python environments. It operates by creating `Pipfile` (and `Pipfile.lock`) which contain project configurations and dependencies for that project.
* This allows us to isolate the python packages of each repository. This is used in conjuction with our `requirements.txt` files in each repository.
* Again, [their official documentation]((https://pipenv.readthedocs.io/en/latest/)) has clear explanations on installation steps. Please follow from their readme to get it properly installed on your machine.
* Some useful pages from the documentation also are
    - [CLI Reference page](https://pipenv.pypa.io/en/latest/cli/) contains the available commands and what they're for
    - [Workflows page](https://pipenv.pypa.io/en/latest/workflows/) shows steps to take for common scenarios
    - [Specifiers page](https://pipenv.pypa.io/en/latest/specifiers/) explains how to specify things such as the package version or basically anything in `Pipfile` / `Pipfile.lock`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Setting up pipenv in each repository

* If the repository already has a `Pipfile.lock`, which should be the case unless you're creating a new repository, run
    ```zsh
    pipenv sync -d
    ```
    - This will read the contents of `Pipfile.lock` and create a virtual environment based on it
* If the repository does not have a `Pipfile.lock`, but has a `Pipfile`, run
  ```zsh
  pipenv install -d
  ```
* If the repository is new or has not been initialised with pipenv (does not have `Pipfile` and `Pipfile.lock`), run
    ```zsh
    pipenv install --python <python version> -r dependencies/requirements-dev.txt
    ```
    - **Note that the <python version> here must be the current active python version set by pyenv.**
    - This is because pipenv can only use a python version that can be found on the $PATH. So even if you have the desired version installed, but it's not selected / activated by `pyenv`, it wouldn't be found.
    - Note that if you have Oh my zsh, you can simply use the `pipenv` plugin, which auto activates the virtual environment on entry to the repo. It also auto deactivates when you try to navigate out of the repository. (But not if u directly navigate into another repo that has `Pipfile`)
    - The `-r` flag tells pipenv to read the dependencies required from a `requirements.txt` file. In most, if not all, repositories, this file is nested within the dependencies folder, and usually for local we have a `requirements-dev` file.
    - The installation command will then create said python "virtual environment" and also register all the information in the aforementined `Pipfile`.
    - However this step is unable to separate prod and dev packages, and manual updates to the `Pipfile` need to be done.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Updating the virtual environment in each repository

#### Adding new package dependencies

* As dependency is now being handled in `Pipfile`, `pip` is no longer being used by itself to install them.
* To install dependencies `pipenv` is using `pip` format of the command.
    ```zsh
    pipenv installl flask==1.0.0
    ```
    - The above command will install Flask version 1.0.0. Without the version, it will install the latest version available in public.
* Installing pre-release version of the dependency is done with `--pre` parameter
    ```zsh
    pipenv install --pre sanic-cors
    ```
* For development dependency use `--dev` or `-d` parameter.
    ```zsh
    pipenv install --dev -r requirements.txt
    ```
* Also remember to update the virtual environment for your other fellow developers
    ```zsh
    pipenv lock
    ```
    - This updates the `Pipfile.lock` file, so that other developers can see the new packages you've installed

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### Updating requirements.txt

* As part of our existing CI/CD pipeline, we still need to maintain `requirements.txt`
* Using the above `pipenv` method to install packages will not update the `requirements.txt` file.
* The easiest way to manage this would be to go into `Pipfile`, copy the new lines of packages defined, and paste it into `dependencies/requirements.txt` files.
* Note that there's a slight syntax difference for both files, simply remove the additional `=` and quotes `"`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### Removing packages

* Sometimes packages are no longer required and need to be removed, simply run
    ```zsh
    pipenv uninstall <package_name>
    ```
* **This will remove the specified package only. Dependencies will still be in the virtual environment, but not in the `Pipfile` nor `Pipfile.lock`**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### Removing unused packages

* This scenario commonly occurs from running `pipenv uninstall` to remove a package and leaving some dependency packages behind. Simply run
    ```zsh
    pipenv clean
    ```
* This command will uninstall *all* packages and reinstall only those specified in `Pipfile.lock`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Activating the virtual environment in each repository

* To be able to use the installed packages, you need to run the following command
    ```zsh
    pipenv shell
    ```
    - This is actually an alias, but just know that it will spawn a shell.
    - If you do not modify your shell prompt, it will prepend your prompt with the name of the virtual environment.
    - It's recommended to simply use the Oh My Zsh pipenv plugin
* You can now run python in the repository with all the required dependencies.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Deactivating virtual environment

* remember to run either of the following commands to exit from the virtualenvironment when you're done working with the repo.
This is extremely important when you need to switch repositories (and likely into a different environment)
    ```zsh
    deactivate
    ```
    ```zsh
    exit
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Removing existing environment in each repository

* This step may be needed if you want to recreate your environment from scratch.
* At the root directory of the repository, run the following command to remove the environment created with `pipenv`
    ```zsh
    pipenv --rm
    ```
* This will only destroy the virtual environment, but preserve the created `Pipfile` and `Pipfile.lock` files
* If the repository you're working on is still using `requirements.txt` and you need to create an environment from scratch using the dependencies listed in it, remove all `Pipfile`s first
    ```zsh
    rm Pipfile*
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### To check if there's any issue with environment

* At the root directory of the repository, run the following command
    ```zsh
    pipenv check
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
