##########################
# Helping commands - Helm
##########################
alias helmdelpurge="helm delete --purge"

##########################
# Helping commands - Kubectl
##########################
alias kcdelpo="kc delete po $@"
alias kcdelpof="kc delete po --force --grace-period 0 $@"
alias kcdelnsf="kubectl delete ns --grace-period=0 --force $@"
alias kcdelns="kubectl delete ns $@"


##########################
# Delete namespace
#   that contains "pdm" word
##########################
kcdelnspdm () {
  kubectl delete ns $(kubectl get ns -o name | grep pdm | cut -d '/' -f 2- | tr '\n' ' ')
}

##########################
# Force delete namespace
#   that contains "pdm" word
##########################
kcdelnspdmf () {
  kubectl delete ns --grace-period=0 --force $(kubectl get ns -o name | grep pdm | cut -d '/' -f 2- | tr '\n' ' ')
}

##########################
# Purge all releases
#   that contains "pdm" word
##########################
helmpurgepdm () {
  while read -r release; do
    helm delete --purge ${release}
  done < <(helm list -q | grep "pdm")
}

##########################
# Patch deployment to redeploy
#  And badge event on graphite
##########################
ts_host="graphite"
kcpredeploy () {
  while read -r app; do
    kubectl rollout restart deploy ${app}
    curl -s -X POST https://${ts_host}/events/ \
      -d "{ \"what\": \"Deploy ${app} version \", \"data\": \"URL: \", \"tags\": \"redeploy ${app} manual\" }"
  done < <(echo "$@" | tr ' ' '\n')
}

##########################
# Curl as interval
##########################
curlloop () {
  local sleeptime=${2:-2}
  while true; do date;curl $1 -I -s -o /dev/null -w "%{http_code}\n"; sleep $sleeptime; done
}

##########################
# Export helm environment
#   for using internal helm charts
##########################
export-aws-helm () {
  export AWS_PROFILE=helm
}
##########################
# Export kaidee-prd environment
#   called by terraform
##########################
export-aws-prd () {
  export AWS_PROFILE=kaidee-prd
}
##########################
# Export kaidee-uat environment
#   called by terraform
##########################
export-aws-uat () {
  export AWS_PROFILE=kaidee-uat
}

##########################
# Encode base64
##########################
encode64() {
  echo -n "$1" | base64
}

##########################
# Decode base64
##########################
decode64(){
  echo "$1" | base64 -D
}
