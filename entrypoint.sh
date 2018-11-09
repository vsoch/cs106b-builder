#!/bin/bash

usage () {

    echo "Usage:

         singularity run --bind $PWD/Tiles:/code/Project <container> [build|run]

         Commands:

                build: build your project
                run: run your program
         
          * You are required to bind the present working directory with your
            extracted project folder (e.g., Ngrams, Wordladder, Tiles) to 
            /code/Project in the container. There should only be one .pro
            file in the container.

         Options [build|run]:

                -b: The volume to bind, should be the directory with
                    project subfolder to the /code folder in the container.

         Examples:

           singularity run --bind $PWD/Tiles:/code/Project <container> build
           singularity run --bind $PWD/Tiles:/code/Project <container> run
           singularity run --bind $PWD/Tiles:/code/Project <container> build run
         "
}

if [ $# -eq 0 ]; then
    usage
    exit
fi

PROJECT_RUN="no";
PROJECT_BUILD="no";

while true; do
    case ${1:-} in
        -h|--help|help)
            usage
            exit
        ;;
        build)
            PROJECT_BUILD="yes"
            shift
        ;;
        run)
            PROJECT_RUN="yes"
            shift
        ;;

        -*)
            echo "Unknown option: ${1:-}"
            exit 1
        ;;
        *)
            break
        ;;
    esac
done

# First try build

if [ "${PROJECT_BUILD}" == "yes" ]; then

    /bin/bash /code/build.sh
    retval=$?
    if [ "${retval}" -ne "0" ]; then
        PROJECT_RUN="no";
        echo "Project build not successful, debug above starting at the top.";
    fi
fi

# Next run

if [ "${PROJECT_RUN}" == "yes" ]; then
    /bin/bash /code/run.sh
fi
