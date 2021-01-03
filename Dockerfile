FROM ubuntu:18.04

# update
RUN apt-get -y update && apt-get install -y sudo wget vim nano

RUN apt-get install -y libgl1-mesa-dev libglib2.0-0 libsm6 libxrender1 libxext6

#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2019.10-Linux-x86_64.sh
# set path
ENV PATH /opt/anaconda3/bin:$PATH

# update pip and conda
RUN pip install --upgrade pip

# install opencv
RUN pip install opencv-python

WORKDIR /
RUN mkdir /work
# RUN chown root:docker -R /work
# RUN chmod 2775 -R /work

# RUN chown root:docker -R /media/docker_shared/mono_develop
# RUN chmod 2775 -R /media/docker_shared/mono_develop


CMD jupyter notebook --ip='*' --no-browser --allow-root --NotebookApp.token=''


# execute jupyter notebook as a default command
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
