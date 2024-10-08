# .gitpod.Dockerfile
FROM gitpod/workspace-base:latest


# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> $HOME/.bashrc

ENV PATH="$HOME/miniconda/bin:$PATH"