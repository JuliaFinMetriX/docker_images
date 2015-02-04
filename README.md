# Goal

The goal of this project is to make my complete and stable research
environment accessible to others, so that they are able to reproduce
my research with minimum hassle.

Keeping a complete image of all research software also provides some
additional benefits:
- maintaining **reproducability over time**: regularly testing old
  analysis against new software images allows detection of broken code
- **restoring environment**: in case that updates break code of
  current development steps the original environment can be retained
  easily
- **computer independence**: using a virtual environment allows
  switching between multiple computers while always working in the
  same software environment

# Current settings

The general idea of my current setting is to work with two docker
images:

## jfinm_stable

A **stable** version comprising current release versions of all of my
own Julia packages, together with some built-in research notebooks.
- **literate programming environment**: Jupyter
- **target**: allow to run my research notebooks without errors completely
  out of the box
- **access point**: through Jupyter notebooks
- **possible usage**: create notebook files using stable software
  components 
- **additional usage**: batch testing of older research files
- **additional languages**: only Jupyter base install - no additional R
  packages 

## jfinm_dev

A **development** version comprising

- **literate programming environment**: Jupyter
- **target**: development of Julia packages and notebook files requiring
  the latest versions of my packages
- **access point**: through emacs ESS or Jupyter notebooks
- **possible usage**: developing Julia packages, creating notebook files
  using the latest Julia packages or commonly relevant R packages
- **additional usage**: batch testing of latest research files
- **additional languages**: R packages relevant for financial
  econometrics 

## Usage

The most common operations are covered by the following bash aliases:

- **jup_stable**: starting **Jupyter** with **present working directory** mounted
````
docker run --rm -p 8888:8888 
    -v $PWD:/home/jovyan/mount 
    juliafinmetrix/jfinm_stable
````
- **jfinm_stable_pwd**: starting stable image in **terminal** with **present
  working directory** mounted (for example to run notebook files as
  batch jobs) 
````
docker run --rm -it 
    -v $PWD:/home/jovyan/mount
     juliafinmetrix/jfinm_stable bash
````

- **jfinm_dev**: starting development image in **terminal** with **graphics
  output** and **./julia** directory mounted
````
docker run -it --rm -e DISPLAY=$DISPLAY 
   -v /tmp/.X11-unix:/tmp/.X11-unix 
   -v $HOME/research/julia:/home/jovyan/research/julia 
   juliafinmetrix/jfinm_dev bash
````
- **jfinm_dev_pwd**: additionally mounts **present working directory**
````
docker run -it --rm -e DISPLAY=$DISPLAY 
    -v /tmp/.X11-unix:/tmp/.X11-unix 
    -v $HOME/research/julia:/home/jovyan/research/julia 
    -v $PWD:/home/jovyan/mount
    juliafinmetrix/jfinm_dev bash
````

- **jup_dev**: starting **Jupyter** with development image and **present
  working directory** and **./julia** directory mounted
````
docker run -p 8888:8888 --rm 
    -v $HOME/research/julia:/home/jovyan/research/julia 
    -v $PWD:/home/jovyan/mount 
    juliafinmetrix/jfinm_dev
````

### Package development / source file editing

For package development use **jfinm_dev**. This will mount **./julia**
directory and allow graphical output. In order to conveniently edit
files, use ESS:
- start shell in emacs
- start docker image: jfinm_dev
- fix terminal colors: TERM=dumb
- start julia
- connect with emacs: M-x ess-remote

Alternatively, using **jfinm_stable_pwd** or **jfinm_dev_pwd** also mounts
the current directory!


## Current literate programming environment: Jupyter

At the moment, I am using a demo docker image of
[Jupyter](http://jupyter.org/).

Jupyter allows to run multiple languages in a IPython notebook
environment.

### Disadvantages

- limited support for combination of multiple languages in single
  notebook:
  - no out of the box communication between individual kernels
  - only one running session allowed - switching kernel completely
    stops current session


# Literate programming 

Currently I know about the following literate programming
environments:
- [IPython](http://ipython.org/) / [Jupyter](http://jupyter.org/)
- [Beaker](http://beakernotebook.com/)
- [emacs + org-babel](http://orgmode.org/worg/org-contrib/babel/) 
- [JuliaBox](https://www.juliabox.org/)

In line with my own software preferences, the computing environment
ultimately should comprise support for the following technical
computing languages:
- R
- Julia
- Matlab

In addition, however, we still would like to be able to conveniently
edit and run source files as well, so that IPython / Beaker alone
would not be sufficient. For source file editing, I usually rely on
emacs.

## Obstacles: source file editing

One main obstacle is directly due to the nature of docker virtual
environments: there simply is a difference between installing and
especially USING interactive software on a desktop computer and a
virtual machine / server.

When installing a program with GUI at your desktop pc, you immediately
can use its GUI right away. Running the same software on a server,
however, requires you to explicitly deal with getting any output back
to the client computer where you actual want to see the results.
Hence, any picture output windows or browser tabs need to be forwarded
to the client. For some programs there exist simple extensions that
handle this problem for you: RStudio Server for RStudio or running an
IPython server. In all other cases, however, you still need to deal
with this problem on your own.


# docker

##### enable docker without sudo
````
sudo groupadd docker
sudo gpasswd -a ${USER} docker
````

According to [this
answer](http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo),
if you are adding the current logged in user, you will need to log out
and log back in again.

##### File ownership
by default, files within docker are owned by root?!

##### Remove containers
````
docker rm `docker ps --no-trunc -aq`
````

##### upload image
````
docker login
docker push juliafinmetrix/rfinm_deb
````


