# Advanced Statistics
UIBK, Winter 2022

Please see the [course web site](https://mtalluto.github.io/vu_advanced_statistics) for more information on the course.

## Software required
To participate in the course, you will need to bring a laptop with the following software packages. Install them in the order listed below!

* [R (version 4.2 or later)](https://cran.r-project.org)
* Developer tools for R (see below)
* [Rstudio](https://posit.co/downloads/) (recommended)
* [Stan](https://mc-stan.org) (installed via the `rstan` package, see below)

## R developer tools

We will use Stan for fitting some models, which requires a C++ compiler and other tools that can be accessed from within R. Follow the instructions below depending on what operating system you are using.

### Mac

1. The easiest way to get developer tools is to [install XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) (requires an Apple ID and installation through the Mac App Store). Warning: This is quite a large installation, requiring > 20 GB of disk space, and it takes hours to complete.
2. Once XCode is complete, launch the Terminal App (located in /Applications/Utilities/). Run the command `sudo xcode-select --install` <br/>This installation will also probably take some time to finsih.
3. Accept the XCode license: In the terminal, type `sudo xcodebuild -license accept`
4. Install `gfortran`: information [here](https://mac.r-project.org/tools/). You only need to follow the instructions under **GNU Fortran Compiler**.


### Windows

You will need to [install rtools](https://cran.r-project.org/bin/windows/Rtools/) for your version of R (either < 4.2 or >= 4.2)

### Linux

Be sure you have installed both the `r-base` and `r-base-dev` packages. Then follow [these instructions](https://github.com/stan-dev/rstan/wiki/Configuring-C-Toolchain-for-Linux) to configure your system for Stan.

## Installing rstan

### Windows users running R 4.2
There have been some issues with Windows, `rtools` and R 4.2. Please install stan with the following command:

`install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))`

Then proceed with testing the installation as written below.

### Everyone else
In most cases, after you install the developer tools above, installing Stan should be relatively simple. Simply run the command `install.packages('rstan')` from within R, then test the installation following [these instructions](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started#verifying-installation). If it works then you are good to go! If not, read through the [Stan installation guide](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) for troubleshooting steps.

