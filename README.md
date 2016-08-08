# docker-leanote
docker-leanote

1,

git clone https://github.com/xiongbilin/docker-leanote.git

cd docker-leanote

docker build --tag='leanote:2.0.0' .

2,

docker run -v /home/app/leanote/leanote_data:/root/notedata -v /home/app/leanote/leanote_conf:/root/leanote/conf -p 8001:80 -d --name leanote leanote:2.0.0

