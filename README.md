# K8S Hands-On Lab

**This Lab deploys a sinatra application to a K8S cluster in the cloud.**

## Getting started

- [Running the Sinatra App locally](#running-the-sinatra-app-locally)
- [Running the Sinatra App in a local container](#running-the-sinatra-app-in-a-local-container)
- [Setting up Kubectl to connect to the cluster](#setting-up-kubectl-to-connect-to-the-cluster)
- [Deploy the Sinatra App image to a Kubernetes Cluster](#deploy-the-sinatra-app-image-to-a-kubernetes-cluster)

### Running the Sinatra App locally

Before you start, make sure you are using ruby version 3.1. You can check the version by running `ruby -v`.

1. Clone this repository:

   ```bash
    git clone git@github.com:HeitorMC/HandsOn-k8s.git
   ```

2. Change into the application directory:

   ```bash
    cd HandsOn-k8s
   ```

3. install the dependencies:

   ```bash
    bundle exec ruby app.rb
   ```

4. Run the app

   ```bash
    bundle exec ruby app.rb
   ```

5. The web application will be availabe at http://localhost:4567/

### Running the Sinatra App in a local container

1. Clone this repository:

   ```bash
    git clone git@github.com:HeitorMC/HandsOn-k8s.git
   ```

2. Change into the application directory:

   ```bash
    cd HandsOn-k8s
   ```

3. Build the app’s container image

   ```bash
    docker build -t sinatra-app .
   ```

4. Run the container

   ```bash
    docker run -p 4567:4567 sinatra-app
   ```

5. The web application will be availabe at http://localhost:4567/

### Setting up Kubectl to connect to the cluster

1. Download the latest release of kubectl with the command:

   ```bash
   curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
   ```

2. Install kubectl using the following command:

   ```bash
   chmod +x ./kubectl
   sudo mv ./kubectl /usr/local/bin/kubectl
   ```

3. Verify that kubectl is installed correctly by running the following command:

   ```bash
   kubectl version --client
   ```

4. Import your kubeconfig file and after that you can connect to the cluster using the following command:

   ```bash
   export KUBECONFIG=kubeconfig.yaml
   ```

### Deploy the Sinatra App image to a Kubernetes Cluster

1. Assuming your image is already available in the docker hub, you can run the following command to deploy the image to the cluster:

   ```bash
   kubectl run <pod-name> <image-name:tag> --port=4567
   ```

2. Run the following command to see the pods running in the cluster:

   ```bash
   kubectl get pods
   ```

   The pods will be running in the cluster. However, there is an better way to deploy the image to the cluster pod.

3. We will use a **K8S deployment** to deploy the image to the cluster. Create a deployment file, you can use `k8s-deployment.yaml.example` as an example or check this [link](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) and build your own deployment file.

After creating the deployment file, run:

```bash
kubectl apply -f <your-deployment-file.yaml>
```

Now run the following command to see the pods running in the cluster:

```bash
kubectl get pods
```

For a more detailed view, run the following command:

```bash
kubectl get pods -o wide
```

4. Now we'll set a **K8S Service** to expose the pods. Create a service file, you can use `k8s-service.yaml.example` as an example or check this [link](https://kubernetes.io/docs/concepts/services-networking/service/) and build your own service file.

After creating the service file, run:

```bash
kubectl apply -f <your-service-file.yaml>
```

And run the following command to see the service running in the cluster:

```bash
kubectl describe services
```

Finally, copy the external IP and paste it in your browser, you'll see the web application running in the cluster. 🎉🎉🎉
