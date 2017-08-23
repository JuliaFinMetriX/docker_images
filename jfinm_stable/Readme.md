# JuliaFinMetriX stable image

## Description

The `juliafinmetrix/jfinm_stable` docker image is set up such that
`JuliaFinMetriX` packages are pre-installed in a stable version and
all `JuliaFinMetriX` notebooks should pass without problems. It
basically builds on the [jupyter
demo](https://github.com/jupyter/docker-demo-images/blob/master/Dockerfile)
image, which is the reason for the home directory being
`/home/jovyan`. The image is extended by `JuliaFinMetriX` packages and
notebook repositories that are installed in `HOME`. 

Hence, these notebooks can be interactively explored in jupyter with
````
docker run -p 8888:8888 juliafinmetrix/jfinm_stable 
````

If, however, changes to any notebook should not be temporarily only,
the notebook repository rather should be mounted into the mount
directory $HOME/mount in order to make changes available outside the
container as well. For example, you can easily mount the current
directory:

````
docker run -p 8888:8888 -v $PWD:/home/jovyan/mount/ \\
  juliafinmetrix/jfinm_stable 
````

## Test requirements

In order to ensure that all package unit tests and notebooks always
pass, the image needs to be tested before publishing.

So far, the following packages and repositories are tested:
- all JuliaFinMetriX package tests (except EconDatasets)
- all notebook files in
  [jfinmetrix_apps](https://github.com/JuliaFinMetriX/jfinmetrix_apps) 
- all notebook files in [ijuliaNb](https://github.com/cgroll/ijuliaNb)

Remark: Notebook testing is done against a LOCAL version of the
repositories, mounted into the container, in order to enable re-usage
of already downloaded data.

## Building

In order to re-build the image and run all required tests, simply call

````
make
````

in the image subdirectory. If no errors occur, the new image can be
published right away:

````
docker push -t juliafinmetrix/jfinm_stable
````

Sometimes the image needs to be re-built completely without caches of
prior attempts:

````
make rebuild
````

### Eliminating errors in notebooks

If errors occur during tests, they need to be fixed interactively.
Therefore the image gets built without testing:

````
make build
````

Now any notebook repository with testing errors can be mounted into
the docker container such that errors can be eliminated.

````
docker run -p 8888:8888 -v $PWD:/home/jovyan/mount/ juliafinmetrix/jfinm_stable
````

If all errors have been eliminated, interactively run the notebook in
order to show current output and version info.

Re-run the notebook tests:

````
make tests
````

Then, commit notebook changes to github so that the new version can be
included into the container.

### Eliminating errors in packages

Errors in package tests less easy to fix on short notice, since any
modifications need to be uploaded to the official julia repository
first. This depends on when the pull request is accepted. 

Hence, if testing issues arise for packages, I usually do rebuild the
`juliafinmetrix/jfinm_stable` only when the updates are included into
the official repository.

## Ensuring validity

Whenever new notebooks are added or old ones are updated, these
changes need to be tested against the `juliafinmetrix/jfinm_stable`
image as well. In order to do that, simply mount the respective folder
and interactively run the notebook. Once it works, the docker image
needs to be re-built in order to comprise the new notebook as well.
