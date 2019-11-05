FROM nvcr.io/nvidia/pytorch:19.10-py3 

RUN /opt/conda/bin/conda install -y nodejs Cython tensorflow pandas scikit-learn matplotlib seaborn jupyter jupyterlab && \
    /opt/conda/bin/conda install -c conda-forge tensorboardx && \
    /opt/conda/bin/conda clean -ya

RUN jupyter labextension install jupyterlab_tensorboard

RUN pip install jupyter_tensorboard torchvision scikit-image

RUN mkdir -p /home/me && chmod 1777 /home/me

ENV HOME /home/me

# tensorboard
EXPOSE 6006
# jupyter notebook
EXPOSE 8888

COPY start.sh /

CMD ["/start.sh"]

