FROM python:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y upgrade

RUN apt-get install git && \
    git clone https://github.com/sdwalker62/SIGILYolov5.git

RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install -r ./SIGILYolov5/requirements.txt

CMD python ./SIGILYolov5/detect.py \
    --weights ./SIGILYolov5/weights/red_and_black_stapler.pt \
    --source /images \
    --project /images