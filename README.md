# qa-test

**Kubernetes Deployment:**
1. Run minikube start
2. Verify it is running by kubectl get nodes
3. Go to the Backend Folder and in DockerFile, type the correct working Directory name
4. Go to the deployment Dir. and in backend-deployment.yaml, edit the image name and the port (eg. 3000)
5. Run the following commmands in the Backend Folder
   docker build -t ansh28mittal/backend:latest .
   docker run -p 3000:3000 ansh28mittal/backend:latest
   docker push ansh28mittal/backend:latest

6. Now go again to Deployment Folder and run

   kubectl apply -f .\backend-deployment.yaml
   kubectl get deployments (To check the status)

7. Run the following commmands in the Frontend Folder
   docker build -t ansh28mittal/frontend:latest .
   docker run -p 8080:8080 ansh28mittal/frontend:latest
   docker push ansh28mittal/frontend:latest

8. Now go again to Deployment Folder and run

   kubectl apply -f .\frontend-deployment.yaml
   kubectl get deployments (To check the status)

Note: Make sure your docker is logged in (use command "docker login" to check )
9. Run minikube service frontend-service

Your setup is up and the message is visible 


**Verification:**
1. Check for the service is up -> correct message from backend visible
2. Check for service is down, error in console and only hello world is visible

**Automated Testing:**
1. Now go to the Automated Testing Directory
2. Change the URL in FrontendBackendTest.java
3. Run the Test as TestNG Test


**Deliverables:**
1. Github Repo - 
2. Automation Testing Foder - > accuknox_project/Automated_testing
3. Readme File -> accuknox_project/README.md