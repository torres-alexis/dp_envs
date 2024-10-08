# .gitpod.Dockerfile
FROM nfcore/gitpod:latest

# Switch to gitpod user
USER gitpod

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $HOME/miniconda && \
    rm ~/miniconda.sh

# Add Miniconda to PATH
ENV PATH="$HOME/miniconda/bin:$PATH"

# Initialize Conda in bash config files
RUN conda init bash

# Set up Conda channels
RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --set channel_priority strict

# Set libmamba as solver
RUN conda config --set solver libmamba

# Copy environment file
COPY environment.yml /tmp/environment.yml

# Create conda environment
RUN conda env create -f /tmp/environment.yml \
    && conda clean -afy

# Enable Jupyter extensions
RUN /bin/bash -c "source activate dp_processing \
    && jupyter contrib nbextension install --user \
    && jupyter nbextensions_configurator enable --user"

# Set the Python interpreter path for .vscode/settings.json
ENV PYTHON_INTERPRETER="$HOME/miniconda/bin/python"
ENV PYCHARM_PYTHON_PATH="${PYTHON_INTERPRETER}"