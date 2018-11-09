# CS106B-Builder

This is the CS106B-Builder - you can build a container and then use it to compile
and run a local project directory, without QT-Creator. We are using
a Singularity container instead of DOcker so that we can more seamlessly use our
system display.

## 0. Install Singularity

You should first install Singularity. I recommend the verison 2.6 for a much
simpler install routine. Here is the [guide](https://www.sylabs.io/guides/2.6/user-guide/quick_start.html#quick-installation-steps), and instructions:

You'll need these dependencies

```bash
sudo apt-get update && \
    sudo apt-get install \
    python \
    dh-autoreconf \
    build-essential \
    libarchive-dev
```
and then to install:

```bash
git clone https://github.com/sylabs/singularity.git
cd singularity
git fetch --all
git checkout 2.6.0
./autogen.sh
./configure --prefix=/usr/local
make
sudo make install
```

## 1. Build the Container
You can use the container from Docker Hub, or build locally. To use from Docker
Hub, skip this step and it will pull automatically.

```bash
sudo singularity build cs106b-builder Singularity
```

## 2. Extract your project

You will need to extract your project in the present working directory, or the
directory where you want to run your container. Usually this means unzipping
a project file to generate a subfolder. For example:

```bash
unzip cs106b-Pancakes.zip .
```
would create a folder with the name "Pancakes' - (or your project name)

## 3. Run the container
Next, you should run the container and bind the project folder (with the .pro
files) inside. You can choose to build, run, or build and run. Note that if you
choose to build and run, it will only run after build given a successful build
(without errors). Here is how to ask for help:

```bash
singularity run cs106b-builder --help
```

To build the current folder:

```bash
singularity run --bind $PWD/Tiles:/code/Project cs106b-builder build
```

To then run! 

```bash
singularity run --bind $PWD/Tiles:/code/Project cs106b-builder run
```

Or build and run:

```bash
singularity run --bind $PWD/Tiles:/code/Project cs106b-builder build run
```
