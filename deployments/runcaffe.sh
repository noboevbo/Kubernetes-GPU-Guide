TODO: doesn't work like this, use caffe.yaml meanwhile

kubectl run -i --tty --rm caffetest --image=kaixhin/cuda-caffe:8.0 --restart=Never --overrides='
{
  "apiVersion": "extensions/v1beta1",
  "kind": "Deployment",
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "caffetest",
            "image": "kaixhin/cuda-caffe:8.0",
            "args": [
              "bash"
            ],
            "stdin": true,
            "stdinOnce": true,
            "tty": true,
            "volumeMounts": [{
              "mountPath": "/usr/local/nvidia",
              "name": "nvidia-driver"
            }]
          }
        ],
        "volumes": [{
          "name":"nvidia-driver",
          "hostPath":{
            "path":"/var/lib/nvidia-docker/volumes/nvidia_driver/375.82"
          }
        }]
      }
    }
  }
}
' -- bash