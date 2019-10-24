#our base image
FROM julia:1.0.3

#install required packages
#RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#    apt-utils gcc cmake build-essential
#RUN apt-get clean

# install julia packages
#RUN julia -e 'using Pkg; Pkg.add("Distributions"); Pkg.add("Distributed"); Pkg.add("Genie")'

# install julia dependencies
COPY deps.jl /usr/src/app/

RUN julia /usr/src/app/deps.jl

# copy files required for the app to run
COPY app.jl /usr/src/app/

# run the application
CMD ["julia", "/usr/src/app/app.jl"]


