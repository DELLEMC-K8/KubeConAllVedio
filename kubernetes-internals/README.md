# Kubernetes Internals
A collection of resources that discuss the inner workings of [Kubernetes](https://kubernetes.io/).

Please note that this material _may not_ be relevant if you're looking to operate Kubernetes. This is aimed at folks curious about how Kubernetes works and does things internally.

## Blog Posts

### Architecture
- [What happens when k8s](https://github.com/jamiehannaford/what-happens-when-k8s)

### Networking
- [Kubernetes 101 - Networking](http://www.dasblinkenlichten.com/kubernetes-101-networking/)
- [Understanding kubernetes networking: pods](https://medium.com/google-cloud/understanding-kubernetes-networking-pods-7117dd28727)
- [Understanding kubernetes networking: services](https://medium.com/google-cloud/understanding-kubernetes-networking-services-f0cb48e4cc82)
- [Understanding kubernetes networking: ingress](https://medium.com/google-cloud/understanding-kubernetes-networking-ingress-1bc341c84078)

### Scheduler
- [How does the Kubernetes scheduler work](https://jvns.ca/blog/2017/07/27/how-does-the-kubernetes-scheduler-work/)
- [Scheduling in Kubernetes](http://alexandrutopliceanu.ro/post/scheduling-in-kubernetes/)
- [Implementing Advanced Scheduling Techniques with Kubernetes](https://thenewstack.io/implementing-advanced-scheduling-techniques-with-kubernetes/)

### API Server
- [Kubernetes deep dive: API Server – part 1](https://blog.openshift.com/kubernetes-deep-dive-api-server-part-1/)
- [Kubernetes deep dive: API Server – part 2](https://blog.openshift.com/kubernetes-deep-dive-api-server-part-2/)
- [Kubernetes deep dive: API Server – part 3a](https://blog.openshift.com/kubernetes-deep-dive-api-server-part-3a/)

## Talks

### Networking
- [The ins and outs of networking in Google Container Engine and Kubernetes](https://www.youtube.com/watch?v=y2bhV81MfKQ)
- [Deep-dive on Kubernetes networking](https://skillsmatter.com/skillscasts/10466-deep-dive-on-kubernetes-networking)
- [Life of a Packet](https://www.youtube.com/watch?v=0Omvgd7Hg1I)

### API server
- [Life of a Kubernetes API request](https://www.youtube.com/watch?v=ryeINNfVOi8)

### Storage
- [How Kubernetes storage works](https://docs.google.com/presentation/d/1Yl5JKifcncn0gSZf3e1dWspd8iFaWObLm9LxCaXZJIk/edit?usp=sharing)(slides only)

### Scheduler
- [SIG Deep Dive](https://www.youtube.com/watch?v=_fja_lLFpfc)

### Resource Management
- [Everything You Ever Wanted to Know About Resource Scheduling, But Were Afraid to Ask by Tim Hockin](https://www.youtube.com/watch?v=nWGkvrIPqJ4)
- [Inside Kubernetes Resource Management (QoS) – Mechanics and Lessons from the Field - Michael Gasch](https://www.youtube.com/watch?v=8-apJyr2gi0) ([Slides](https://schd.ws/hosted_files/kccnceu18/33/Inside%20Kubernetes%20QoS%20M.%20Gasch%20KubeCon%20EU%20FINAL.pdf))

## Docs/Design Proposals
Please be aware that the design proposals may not mirror the implementation exactly but convey the basic idea of the design.

### Architecture
- [Architecture overview](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/architecture/architecture.md)

### Networking
- [GKE Networking Overview](https://cloud.google.com/kubernetes-engine/docs/concepts/network-overview)
(Useful resource for understanding networking in general)
- [Networking model](https://git.k8s.io/community/contributors/design-proposals/network/networking.md)
- [Design Proposals](https://github.com/kubernetes/community/tree/master/contributors/design-proposals/network)

### Scheduler
- [Sheduling algorithms](https://github.com/kubernetes/community/blob/master/contributors/devel/scheduler_algorithm.md)
- [Scheduler overview](https://github.com/kubernetes/community/blob/master/contributors/devel/scheduler.md)
- [Design Proposals](https://github.com/kubernetes/community/tree/master/contributors/design-proposals/scheduling)

### Storage
- [Design Proposals](https://github.com/kubernetes/community/tree/master/contributors/design-proposals/storage)

KubeCon Seattle 2018: Recap 

https://kccna18.sched.com/

https://kccna18.sched.com/list/descriptions/

https://www.youtube.com/playlist?list=PLj6h78yzYM2PZf9eA7bhWnIh_mK1vyOfU


Operator Framework

https://github.com/operator-framework

https://developers.redhat.com/blog/2018/12/18/kubernetes-operators-in-depth/

Helm Basics

https://docs.helm.sh/using_helm/
https://codeengineered.com/blog/2018/kubernetes-helm-related-tools/

Kustomize

https://Kustomize.io/
https://kubernetes.io/blog/2018/05/29/introducing-kustomize-template-free-configuration-customization-for-kubernetes/
https://github.com/kubernetes-sigs/kustomize
https://kccna18.sched.com/event/GrSn/kustomize-deploy-your-app-with-template-free-yaml-ryan-cox-lyft


Cloud Native Application Bundle

Introducing CNAB: a cloud-agnostic format for packaging and running distributed applications
https://cnab.io/
https://github.com/docker/app
https://duffle.sh
https://github.com/deislabs/cnab-spec
https://github.com/garethr/docker-app-cnab-examples


K8 Application Deployment


https://www.replicated.com/ship

https://argoproj/argo-cd

https://github.com/docker/app

https://github.com/maestrosdk/maestro

https://www.habitat.sh/

https://draft.sh/

https://github.com/metaparticle-io/

https://github.com/GoogleContainerTools/skaffold

https://kubeapps.com

https://github.com/hasura/gitkube

https://github.com/ksonnet

https://github.com/ksonnet/kubecfg

https://kubepack.com

https://github.com/GoogleContainerTools/krew

http://kompose.io/

http://kedgeproject.org/

https://kubernetes.io/docs/tutorials/kubernetes-basics/deploy-app/deploy-interactive/




