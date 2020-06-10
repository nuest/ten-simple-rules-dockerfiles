FROM jupyter/scipy-notebook:82b978b3ceeb

USER root
#ADD * /home/jovyan/
ADD ./ /home/jovyan/
RUN chown -R jovyan /home/jovyan
USER jovyan
WORKDIR $HOME

RUN conda config --add channels brian-team
RUN conda remove --yes -n root ipaddress jupyterhub
RUN conda env update -v -n root -f environment.yml

# Install and configure nbextensions
RUN jupyter nbextension enable --py widgetsnbextension
RUN conda install --quiet --yes jupyter_contrib_nbextensions==0.3.3
#RUN jupyter nbextension enable init_cell/main
RUN jupyter nbextension enable hide_input_all/main

# Trust notebooks
RUN find $HOME/ -name '*.ipynb' -exec jupyter trust {} \;

# Set matplotlib backend
RUN mkdir -p /home/${NB_USER}/.config/matplotlib
RUN echo "backend : Agg" > /home/${NB_USER}/.config/matplotlib/matplotlibrc

# Fix matplotlib font cache
RUN rm -rf /home/main/.matplolib
RUN rm -rf /home/main/.cache/matplolib
RUN rm -rf /home/main/.cache/fontconfig
RUN python -c "import matplotlib.pyplot as plt"