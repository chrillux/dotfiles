# Used by kube-ps1 to shorten cluster ARN to "region-clustername"
function get_cluster_short() {
  arn="$1"
  region=$(echo "$arn" | cut -d: -f4)
  clustername=$(echo "$arn" | cut -d/ -f2)
  echo "${region}-${clustername}"
}

function source_aws_creds() {
    aws_creds="${HOME}/.aws/credentials"
    AWS_ACCESS_KEY_ID="$(awk -F= '/aws_access_key_id/{print $2}' ${aws_creds} | head -1)"
    AWS_SECRET_ACCESS_KEY="$(awk -F= '/aws_secret_access_key/{print $2}' ${aws_creds} | head -1)"
    export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
}

function sshnode() {
    unset OPTIND pod_name node_name
    while getopts "n:p:" opt; do
        case ${opt} in
            p)
            pod_name=$OPTARG
            ;;
            n)
            node_name=$OPTARG
            ;;
            \?)
            echo "Invalid option: $OPTARG" 1>&2
            return
            ;;
            :)
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            return
            ;;
        esac
    done
    shift $((OPTIND -1))
    if [ -z "${pod_name}" ] && [ -z "${node_name}" ]; then
        echo "missing option (-p/-n)"
        return
    fi

    if [ -n "${pod_name}" ]; then
        node_name=$(kubectl get pod --all-namespaces -owide | grep "${pod_name}" | awk '{print $8}')
        if [ -z "${node_name}" ]; then
            echo "Could not find pod."
            return
        fi
    fi
    node_ip=$(kubectl get node -owide "${node_name}" | grep -v '^NAME' | awk '{print $6}')
    ssh -o ConnectTimeout=2 -i ~/Downloads/TheOneKey -lec2-user "${node_ip}"
}

function shellexec() {
    shell_namespace="tools"
    context=$(kubectl config current-context)
    target_context="arn:aws:eks:eu-central-1:488021763009:cluster/shared"
    if [ "${context}" != "${target_context}" ]; then
        echo -n "You are in the wrong Kubernetes context (${context}). Change it? (Y/n): "
        read yesno
        if [ "${yesno}" = "n" ]; then
            echo "Exiting."
            return
        fi
        kubectl config use-context "${target_context}"
    fi
    kubectl exec -n "${shell_namespace}" -it $(kubectl get -n "${shell_namespace}" pod -lapp=shell | grep -v NAME | awk '{print $1}') bash
}

function delbranch() {
    git branch -d "$(git branch --list | sed 's/  //' | fzf -m --height 40% --reverse --border)"
}

function apg() {
    length=${1:-30}
    openssl rand -base64 "${length}"
}

function servicespread() {
    kubectl get pod -lapp=$1 -owide | awk '{print $7}' | grep -v NODE | sort | uniq -c
}

function gcloud_decrypt() {
    base64 -d | \
    gcloud kms decrypt \
        --plaintext-file=- \
        --ciphertext-file=- \
        --location=global \
        --keyring=projects/quinyx-cloud-infrastructure/locations/global/keyRings/CloudBuilder \
        --key=projects/quinyx-cloud-infrastructure/locations/global/keyRings/CloudBuilder/cryptoKeys/CloudBuilder
}

function gcloud_encrypt() {
    gcloud kms encrypt \
        --plaintext-file=- \
        --ciphertext-file=- \
        --location=global \
        --keyring=projects/quinyx-cloud-infrastructure/locations/global/keyRings/CloudBuilder \
        --key=projects/quinyx-cloud-infrastructure/locations/global/keyRings/CloudBuilder/cryptoKeys/CloudBuilder
}

function gitstashpullpop() {
    if git status 2>/dev/null | grep -q "Changes not staged for commit"; then
        git stash
        git pull
        git stash pop
    else
        git pull
    fi
}

function sshq() {
    ssh -i ~/Downloads/TheOneKey -ladmin $1.quinyx.com
}

function file-to-clipboard() {
    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$@"
}

function ngrok-up() {
    ngrok http http://localhost:$1
}

function go-config-with-parameters() {
    environment=${environment:-test} AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-eu-central-1} AWS_DEFAULT_AZ=${AWS_DEFAULT_AZ:-${AWS_DEFAULT_REGION}a} go-config -print-mode $*
}

function show_ips_subnet() {
    subnetid=${1}
    region=${2:-eu-central-1}
    if [ -z "${subnetid}" ]; then
        echo "usage: $0 <subnetid> [region-code]"
        return
    fi
    ipsused=$(aws ec2 describe-network-interfaces --region ${region} --filters Name=subnet-id,Values=${subnetid} | jq -r '.NetworkInterfaces[].PrivateIpAddress' | wc -l)
    totalips=$(aws ec2 describe-subnets --region "${region}" --subnet-ids "${subnetid}" | jq -r '.Subnets[].AvailableIpAddressCount')
    ipsleft=$((totalips - ipsused))
    echo "Total IPs in subnet: ${totalips}"
    echo "Used IPs in subnet: $ipsused"
    echo "Remaining IPs in subnet: ${ipsleft}"
}

# Converted from broken aliases ($1/$2 don't expand in alias definitions)
function sjump() {
    ssh -lec2-user -i ~/Downloads/TheOnekey "$1" -J shell.quinyx.io
}

function debugpod() {
    # $1 = target pod, $2 = target container
    kubectl debug -it -c glitchguru --target="$2" --image=eu.gcr.io/quinyx-cloud-infrastructure/glitchguru:latest-develop "$1"
}

# From dotfiles default/.bashrc.d/jwtdecode
function jwtdecode() {
    echo "Paste your JWT"
    read -r j
    echo "${j}" | jq -R 'gsub("-"; "+") | gsub("_"; "/") | split(".") | .[1] | @base64d | fromjson'
}

# From dotfiles default/.bashrc.d/sshtry
function sshtry() {
    usage() { echo "Usage: sshtry <host> [-u <user>]" 1>&2; return 1; }

    local OPTIND=1 o hostname user
    hostname=$1
    shift

    while getopts "u:" o; do
        case ${o} in
        u)
            user=${OPTARG}
            ;;
        *)
            usage
            return 1
            ;;
        esac
    done
    shift "$((OPTIND-1))"

    if [ -z "${hostname}" ]; then
        usage
        return 1
    fi

    if [ -z "${user}" ]; then
        user="${USER}"
    fi

    echo -n "Trying ${hostname}"
    until nc -w 1 -vz ${hostname} 22 >/dev/null 2>&1; do
        echo -n "."
        sleep 1
    done
    echo
    ssh -l${user} ${hostname}
}

# From dotfiles envs/work/.bashrc.d/socks-proxy
function socks_proxy() {
    jumpserver=$1
    proxyserver=$2
    socks_proxy_port=1080

    pkill -f "ssh -4 -J ${jumpserver} -fND ${socks_proxy_port} ${proxyserver}"
    ssh -4 -J "${jumpserver}" -fND "${socks_proxy_port}" "${proxyserver}"
}
