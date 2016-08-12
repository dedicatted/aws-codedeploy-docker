#!/usr/bin/env bash
set -o xtrace

source ./.env

mkdir -p ./dist 
rm -rf ./dist/* 

docker stop $NAME || true
docker rm -f $NAME -f || true
docker rmi $NAME:$VERSION || true

echo 'Login to registry'
eval "$(aws ecr get-login --region us-east-1)"

docker build -t $NAME:$VERSION docker
docker tag $NAME:$VERSION $REPOSITORY/$NAME:$VERSION
docker push $REPOSITORY/$NAME:$VERSION

sed -e "s;%VERSION%;${VERSION};g;s;%NAME%;${NAME};g;s;%REPOSITORY%;${REPOSITORY};g" start.sh.template > dist/start.sh
cp appspec.yml dist
DIST_NAME=$NAME-deploy-$VERSION.tar.gz
tar -zcvf dist/${DIST_NAME} -C dist .
aws s3 cp dist/${DIST_NAME} s3://codedeploy-hello-world/${DIST_NAME}

aws deploy create-deployment --application-name ${CODE_DEPLOY_APPLICATION_NAME} \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name ${CODE_DEPLOY_DEPLOYMENT_GROUP_NAME} \
--description "Application ${NAME} version ${VERSION}" \
--s3-location bucket=${S3_BUCKET},bundleType=tgz,key=${DIST_NAME}