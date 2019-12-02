# Ubuntu base
FROM ubuntu:18.04

# Update Ubuntu
# Then install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
    python3-pip

# Install jupyter
RUN pip3 install jupyter

# Install matplotlib
RUN pip3 install matplotlib

# Install pandas
RUN pip3 install pandas

# Create a new system user
RUN useradd -ms /bin/bash jupyter

# Copy files
COPY ./water_data/* /home/jupyter/water_data/
COPY ./hydrograph_example.ipynb /home/jupyter/.

# Change to this new user
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter

# Start the jupyter notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=*"]
