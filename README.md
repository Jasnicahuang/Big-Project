# Big Project Cilsy
==================================================================================
1. Build Env based on IAAS => Using Terrafrom
   Infrastruktur yang di build :
   - EC2     => Sebagai Workspace KOPS & Control Planer untuk Jenkins, Terraform, Prometheus, Grafana, EFK
   - RDS     => Database yang akan di akses oleh App (Kubernetes Cluster)
   - S3      => Lokasi untuk menyimpan konfigurasi KOPS cluster
   - Route53 => Buat Subdomain-nya KOPS Cluster
===================================================================================
2. Kube-Blog-Cilsy
   Deploy blog yang di build dari image WordPress. 
   Ada 2 environment yang di deploy dan masing-masing sudah dibedakan namespace-nya : Staging & Production

   Untuk Deploy app ke Cluster, cukup run command berikut :
   - kubectl apply -f staging-blog-deploy.yaml -n staging
   - kubectl apply -f production-blog-deploy.yaml -n production

    Untuk Remove Deployment, cukup run command berikut :
   - kubectl delete ns <namespace> => Menhapus semua kind type (deploy, svc, ingress)
   - kubectl delete <kind type> -n <namesoace>  => Menghapus salah satu kind dari enviroment yg masih berjalan
====================================================================================
  3. Monitoring Server => Using Prometheus & Grafana 
     1. Deploy Prometheus 
     2. Deploy Kube-Metrics
     3. Deploy Grafana
     Cukup run ./install.sh => untuk deploy dan ./delete.sh untuk destroy
=====================================================================================
  4. Monitoring Log => Using EFK (Elastic, Filebeat, Kibana)
     Cukup run ./install.sh => untuk deploy dan ./delete.sh untuk destroy
