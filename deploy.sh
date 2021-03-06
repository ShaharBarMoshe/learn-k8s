docker build -t stephengrider/multi-client:latest -t stephengrider/multi-client -f ./client/Dockerfile ./client
docker build -t stephengrider/multi-server:latest -t stephengrider/multi-server -f ./server/Dockerfile ./server
docker build -t stephengrider/multi-worker:latest -t stephengrider/multi-worker -f ./worker/Dockerfile ./worker

docker push stephengrider/multi-client:latest
docker push stephengrider/multi-server:latest
docker push stephengrider/multi-worker:latest

docker push stephengrider/multi-client
docker push stephengrider/multi-server
docker push stephengrider/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server
kubectl set image deployments/client-deployment client=stephengrider/multi-client
kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker