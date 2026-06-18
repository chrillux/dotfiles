alias ls='gls --color'
alias python='python3'
alias cd='cd -P'
alias cloudcrypt='gpg -aer 7C947989'
alias saltcrypt='gpg -aer EF214876'
alias swagger="docker run --rm -it -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $HOME quay.io/goswagger/swagger"
alias dsa='docker container stop $(docker container ps -q -a)'
alias gcm='git checkout master'
alias buildcrypt='base64 | gpg -aer 7C947989'
alias dockerstopall='docker container stop $(docker container ps -q)'

# terraform shortcuts
alias tfpeu="tfplan eu-central-1"
alias tfpus="tfplan us-east-1"

# concrete-standalone documentdb
alias dbflpstest="mongosh mongodb://root:3WOZKshkTQGrabnAFIyz4Ksrile9a1aM@concrete-standalone-docdb-test.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&retryWrites=false"
alias dbflpsstaging="mongosh mongodb://root:Mktn4LfTkBYeE0m3R1R7bfGhOkldOuB8@concrete-standalone-docdb-staging.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&retryWrites=false"
alias dbflpspreprod="mongosh mongodb+srv://api:2cFQyyUWDZsnpwE9@preprod-multiregion-clu.rgoce.gcp.mongodb.net/api"
alias dbflpsprod="mongosh mongodb+srv://api:S4q823nv6hpEqD6J@prod-multiregion-cluster-xzjca.gcp.mongodb.net/api"

# frontline portal documentdb
alias dbfrontlinetesteu="mongosh mongodb://root:xelGJ68dJaM26pFlhMkHGaesfTx3OnGa@frontline-docdb-test.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlinetestus="mongosh mongodb://root:Md3k9yyyq94ogcy9n6VUSjhhgkVmVHUV@frontline-docdb-test.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlinestaging="mongosh mongodb://root:zgvQ13yOCeWp2BrQnt8WW9flMHjMvNYC@frontline-docdb-staging.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlineqdaily="mongosh mongodb://root:ftiv2jw0F1SazZNb4qBeWn3uGM7g8Qm6@writer.frontline-docdb.qdaily.eu-central-1.docdb.quinyx.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlineprodeu="mongosh mongodb://root:mAeiZwveOQ84yJdt7CiGSDuTvGncU9ex@frontline-docdb-prod.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlineprodus="mongosh mongodb://root:LrCh9M6Sz6pWFfZSp7bxY93jubu5M9bq@frontline-docdb-prod.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlinepreprodus="mongosh mongodb://root:mVBwRbHex3D0VrUIW6ZWLxmwVZ7GZAeL@frontline-docdb-preprod.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlinerceu="mongosh mongodb://root:zldNGWXGR4PrZgjAVGBKFHtYlQwIFV2X@frontline-docdb-rc.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"
alias dbfrontlinercus="mongosh mongodb://root:AW8tchbksNVmXCeBKbuFoqwAJL37IDHW@frontline-docdb-rc.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017/\?ssl=true\&tlsAllowInvalidCertificates=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false"

# shifts
alias shiftstesteu="mongosh 'mongodb://root:I7Aop8l44m8CHStC5syn48wfvfnXwTYO@shifts-test.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"
alias shiftsstagingeu="mongosh 'mongodb://root:sPX5XKYbCQ6Am72OMY3ry4wwG8S1MU5H@shifts-staging.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"
alias shiftsrceu="mongosh 'mongodb://root:QtbDWG0mW3LTXEnPxUGsDDAcYqfHm52F@shifts-rc.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"
alias shiftsrcus="mongosh 'mongodb://root:uZCn1BcAVpoaCs7mAeW2p4hjfIwz40Jt@shifts-rc.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"

# schedule-availability
alias sarceu="mongosh 'mongodb://schedule-availability:nJkJQe5KcdlXn87pGgjbeb8dgx9FBEez@schedule-availability-rc-20241211155950.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"
alias sarceunew="mongosh 'mongodb://schedule-availability:nJkJQe5KcdlXn87pGgjbeb8dgx9FBEez@schedule-availability-rc-20250203113016.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017/?ssl=true&tlsAllowInvalidCertificates=true&retryWrites=false'"

# baseschedule
alias bsprodeu="mongo mongodb://baseschedule-prod.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017 -u root -p yDBg454ETUrF0tu5ma5DsGCUXiWQ0Thb --ssl --tlsAllowInvalidCertificates"
alias bsrceu="mongo mongodb://baseschedule-rc.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com:27017 -u root -p Yy5BvRpxdkDUXRIsaQrPC1MpUwE6HUsl --ssl --tlsAllowInvalidCertificates"
alias bsprodus="mongo mongodb://baseschedule-prod.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017 -u root -p FwHblLjL9UJLCWzUp3XZeV8vXsMuytfa --ssl --tlsAllowInvalidCertificates"
alias bsrcus="mongo mongodb://baseschedule-rc.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com:27017 -u root -pUaDtmRz3qVTUhXEeYvkF1pVcDbkhm1DY --ssl --tlsAllowInvalidCertificates"

# partner-integration
alias pirceu="mongosh mongodb://partner-integration-docdb-rc.cluster-cgfbrywuhilj.eu-central-1.docdb.amazonaws.com -u root -p 2VdLRjI5sAkGbzamjLuTOMqP0c1OKOhu --ssl --tlsAllowInvalidCertificates"
alias pircus="mongosh mongodb://partner-integration-docdb-rc.cluster-celsrjqfu0kz.us-east-1.docdb.amazonaws.com -u root -p XMl8bsNK0fZSINyvCjEtcFC0yXC01HtE --ssl --tlsAllowInvalidCertificates"
