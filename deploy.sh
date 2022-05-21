#!/bin/bash
#

echo "deploy diagrams container"

kubectl apply -f deployment.yaml --namespace r-mordasiewicz

echo "kubectl exec --namespace r-mordasiewicz -it diagrams -c diagrams -- /bin/bash"
