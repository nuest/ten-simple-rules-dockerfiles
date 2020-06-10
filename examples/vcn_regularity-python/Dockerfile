FROM docker.io/jupyter/scipy-notebook:82b978b3ceeb

# Copy notebooks and data into the image and set permissions
# N.B. Mount arguments can not be used with Binder so all necessary files must
# be included in the image build process
USER root
COPY ./ /home/jovyan/
RUN chown -R jovyan /home/jovyan
# Switch back to unprivileged user and set working directory
USER jovyan
WORKDIR $HOME

RUN conda config --add channels brian-team
RUN conda remove --yes -n root ipaddress jupyterhub
RUN conda env update -v -n root -f environment.yml

# Install and configure nbextensions
RUN jupyter nbextension enable --py widgetsnbextension
RUN conda install --quiet --yes jupyter_contrib_nbextensions==0.3.3
RUN jupyter nbextension enable hide_input_all/main

# Trust notebooks
RUN find "$HOME/" -name '*.ipynb' -exec jupyter trust {} \;

# Set matplotlib backend
RUN mkdir -p "/home/${NB_USER}/.config/matplotlib"
RUN echo "backend : Agg" > "/home/${NB_USER}/.config/matplotlib/matplotlibrc"

# Fix matplotlib font cache
RUN rm -rf /home/main/.matplolib
RUN rm -rf /home/main/.cache/matplolib
RUN rm -rf /home/main/.cache/fontconfig
RUN python -c "import matplotlib.pyplot as plt"

# --- Usage instructions ---
# The Dockerfile is designed to run on the Binder service which can be 
# launched by navigating to the following address in a browser: 
# https://mybinder.org/v2/gh/neural-reckoning/vcn_regularity/master?filepath=index.ipynb

## Build the image locally
# As an alternative to using Binder, the image can be built locally:
# $ docker build --tag vcn-regularity .

## Run the image for interactive UI
# $ docker run -it -p 8888:8888 vcn-regularity
# Next, open a browser at http://localhost:8888 or click on the login link shown in the console.
# It will show the Jupyter notebook start page and you can now open index.ipynb from the list.
