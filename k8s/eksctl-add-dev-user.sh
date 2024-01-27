#!/bin/bash

eksctl create iamidentitymapping \
    --cluster eks-demo \
    --region us-east-1 \
    --arn arn:aws:iam::<aws account with eks>:role/AWSReservedSSO_DeveloperAccess_c79fc333044c88c8 \
    --group developer \
    --no-duplicate-arns \
    --username <username>