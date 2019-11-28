# Use the latest ubuntu image as base for the new image
# ubuntu is the image name and latest is a tag that 
# references a particular version of the image.
# In this case latest is always the latest LTS image
# at the time of writing this, it's 16.04.
FROM ubuntu:latest

# Run a system update to get it up to speed
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