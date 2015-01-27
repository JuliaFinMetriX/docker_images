# Beaker

docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v $HOME/research/julia/:/home/jovyan/research/julia juliafinmetrix/jupyter bash

In order to build beaker image:
````
docker build -t juliafinmetrix/beaker .
````
Or, without cached layers:
````
docker build -t juliafinmetrix/beaker -no-cache .
````

Then, run it from terminal
````
docker run -it -v ~/research/julia/:~/research/julia juliafinmetrix/beaker bash
```

Run in browser:
````
docker run -p 8800:8800 -v ~/research/julia/:~/research/julia juliafinmetrix/beaker bash
```

Or, in order to mount current directory:
````
docker run -p 8800:8800 -v $HOME/research/julia/:/home/beaker/research/julia -v $PWD:/home/beaker/mount/ juliafinmetrix/beaker
```

docker run -p 8888:8888 -v $HOME/research/julia/:/home/jovyan/research/julia -v $PWD:/home/jovyan/mount/ juliafinmetrix/jupyter

docker run -it -v $HOME/research/julia/:/home/jovyan/research/julia -v $PWD:/home/jovyan/mount/ juliafinmetrix/jupyter bash
# Jupyter

Running docker container with Julia inside of emacs:
````
docker run -it juliafinmetrix/jupyter bash
TERM=dumb julia --color=no
````


# JuliaBox


Goal
====

The goal of this project is to create a nice literate programming
environment that allows intermixing of code of different technical
computing languages with markdown text and rich media output.

Although I did not yet succeed in setting up such an environment
completely as desired, I still will always make my current settings
available to others via [docker](www.docker.com). This way, you can
re-use and further customize my software development environment with
minimal effort.

In line with my own software preferences, the computing environment
ultimately should comprise support for the following technical
computing languages:
- R
- Julia
- Matlab

Currently, I know about three different environments for literate
programming that could be used to achieve a literate programming
environment: 
- [IPython](http://ipython.org/)
- [Beaker](http://beakernotebook.com/)
- [emacs + org-babel](http://orgmode.org/worg/org-contrib/babel/) 

In addition, however, we still would like to be able to conveniently
edit and run source files as well, so that IPython / Beaker alone
would not be sufficient. For source file editing, I usually rely on
emacs.

Obstacles
---------

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

In addition, there currently exist some further problems with
individual software components, and they will be listed below. 

IPython
=======

Allow to start notebook with multiple languages using respective
IPython magics:
- [rpy2](http://rpy.sourceforge.net/): seems to work
- [pyjulia](https://github.com/JuliaLang/pyjulia):
  - according to
    [this](http://blog.leahhanson.us/julia-calling-python-calling-julia.html)
    blog post, calling Julia from Python should be able in principle, but:
    - commands need to be called within function `j.run("x = 5")`
    - code did originally reside in IJulia package, but seems to be
      broke after moving to pyjulia
  - according to
    [this](http://stackoverflow.com/questions/24091373/best-way-to-run-julia-code-in-an-ipython-notebook-or-python-code-in-an-ijulia-n)
    page, Julia magics should be running with some minor tweaks, but:
    - code blocks do not print standard output for cells
      (e.g. println("hello world"))
- [pymatbridge](http://arokem.github.io/python-matlab-bridge/):
  - according to
    [this](http://nbviewer.ipython.org/gist/anonymous/8940322)
    notebook, Matlab magics should be able in IPython, but:
    - I could not get Matlab to start

In principle, IPython magics should work. Still, however, it would
require to put a `%%language` tag at the beginning of each cell. This,
however, could be fixed in IPython3.0, as different kernels could be
selected within the [notebook user
interface](http://ipython.org/ipython-doc/dev/whatsnew/development.html).
On resources for adding new kernels take a look at [this
description](http://ipython.org/ipython-doc/dev/development/kernels.html)
and [these notes](https://github.com/takluyver/IRkernel) on using an R
kernel.

An alternative interface for interweaving of several software kernels
could be the [jupyter project](http://jupyter.org/), which is also
built on IPython. For a first step in setting this up for multiple
kernels take a look at [these
slides](http://heike.github.io/stat590f/ijulia/#/7), or at
[this](https://ocefpaf.github.io/python4oceanographers/blog/2014/09/01/ipython_kernel/)
blog post about setting up bash scripting with Jupyter.



Beaker
======

- based on Ubuntu (opposed to Rocker images)
- for built it requires files in github folder
- currently building does work, but I can not connect to server of own
  built image
- but: running image from
  [hub.docker](https://registry.hub.docker.com/u/beakernotebook/beaker/)
  does work 

````
docker run -p 8800:8800 -t beakernotebook/beaker
````

R only
========

Even if we do not succeed in setting up a joint environment for both R
and Julia, hosting our pure R environment through docker already
provides us with some advantages:
- same R environment on multiple computers with individually updating
  / installing packages on each
- R environment also could be used on servers where some components
  are lacking and can not be installed due to missing rights
- if code of some required packages breaks, environment easily can be
  set back to last working state
- dependency on well hosted R core will allow to make use of superior
  administrative knowledge of rocker maintainers

R Debian
--------

Rocker images are built on Debian, so that they probably should be
ported to Ubuntu in order to make them work with Julia, IPython and
beaker. However, if you only want to work with R itself, you can
easily make use of the respective
[rocker](https://github.com/rocker-org/rocker/wiki) image. 

In my case, this amounts to loading the hadleyverse image, which
already builds upon the [rstudio
image](https://github.com/rocker-org/hadleyverse/blob/master/Dockerfile).
I then only need to customize the installed packages to comprise the
ones that I need - the respective Dockerfile is added in the r_debian
subdirectory. 

##### build debian image


````
docker build -t juliafinmetrix/rfinm_deb .
````

##### run RStudio

````
docker run -d -p 8787:8787 juliafinmetrix/rfinm_deb rstudiostart
````

##### run console with graphics windows 

Code is largely taken from [this
answer](http://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers).

With emacs:
- start shell in emacs
- start container:
````
docker run -it --rm -e DISPLAY=$DISPLAY -u docker -v /tmp/.X11-unix:/tmp/.X11-unix --name="rfinm_deb" juliafinmetrix/rfinm_deb bash
````
or with home directory mounted:
````
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v $PWD:/home/docker/ --name="rfinm_deb" juliafinmetrix/rfinm_deb bash
````
- M-x ess-remote


##### run terminal within container

````
docker run --rm -it juliafinmetrix/rfinm_deb bash
````

R Ubuntu 
--------

In the long run, R probably needs to be ported to Ubuntu in order to
use it with beaker and Julia. Some first attempts already can be found
in the ubuntu subdirectory.

##### build commands

````
docker build -t juliafinmetrix/rbase_ubuntu .
docker build -t juliafinmetrix/rstudio_ubuntu .
docker build -t juliafinmetrix/rhadley_ubuntu .
docker build -t juliafinmetrix/rfinm_ub .
````

Julia
=====

As long as source file editing is not yet solved, it is not possible
for me to completely switch to fully docker hosted Julia environment.
Even without support for Julia and R jointly this would already be an
improvement due to the same reasons that also justify a pure R
environment. 

Setting up Julia itself seems to be
[trivially](https://registry.hub.docker.com/u/dockerfile/julia/dockerfile/).
Still, however, this does not offer little benefit, as long as there
are no convenient interfaces implemented. For source file editing,
there are two possible ways:
- with emacs ess-remote: not working
- JuliaStudio server: not yet developed

For literate programming, setting up an IJulia server in docker should
be possible, but does not add benefits as long as source file editing
is not solved yet. 

An alternative to setting up an IJulia server on your own could be to
use an already maintained docker container through
[JuliaBox](https://juliabox.org/).

Notes:
- directly working in terminal: 
  - using Winston throws error if X11 forwarding is not activated

Beaker
======
````
docker build -t juliafinmetrix/beaker_ubuntu .
docker build -t juliafinmetrix/beaker .
````


docker
======

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


