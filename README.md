## Get sorce
    alias git="docker run -ti --rm -v $(pwd):/git bwits/docker-git-alpine"
    git clone http://github.com/emersonmatsumoto/samba.git

## Create image
    cd samba
    docker build -t emersonmatsumoto/samba .

## Run container    
    docker run -it --name samba -p 139:139 -p 445:445 -v /home/rancher/shared:/shared -d emersonmatsumoto/samba

## Stop container
    docker stop samba

## Remove container
    docker rm -v samba

## Remove image
    docker rmi emersonmatsumoto/samba

    ifconfig
        

