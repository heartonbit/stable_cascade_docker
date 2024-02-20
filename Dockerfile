# FROM nvcr.io/nvidia/pytorch:23.10-py3
FROM nvcr.io/nvidia/pytorch:24.01-py3

RUN git clone https://github.com/Stability-AI/StableCascade.git && \
    cd StableCascade && \
    git reset --hard 7a7d341f729ccaa042920a1fac3e7b9326079aca

# DEBUG : https://github.com/opencv/opencv-python/issues/884
RUN apt-get -y update && apt-get install -y libgl1-mesa-glx
RUN pip uninstall -y opencv opencv-python-headless opencv-python && \
    rm -rf /usr/local/lib/python3.10/dist-packages/cv2

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

WORKDIR /workspace/StableCascade

# RUN Jupyter
# CMD ["sh", "-c", "jupyter lab --ip 0.0.0.0 --no-browser --allow-root"]

# RUN Gradio
# ENV PYTHONPATH=./ 
# CMD ["sh","-c","python3 gradio_app/app.py"]