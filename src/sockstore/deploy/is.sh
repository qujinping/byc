# !/bin/bash

oc tag sockstore/rabbitmq:3 sockstore-prod/rabbitmq:3
oc tag sockstore/zipkin:latest sockstore-prod/zipkin:latest
oc tag sockstore/edge-router:latest sockstore-prod/edge-router:latest
oc tag sockstore/front-end:latest sockstore-prod/front-end:latest
oc tag sockstore/orders-db:latest sockstore-prod/orders-db:latest
oc tag sockstore/orders:latest sockstore-prod/orders:latest
oc tag sockstore/payment:latest sockstore-prod/payment:latest
oc tag sockstore/queue-master:latest sockstore-prod/queue-master:latest
oc tag sockstore/shipping:latest sockstore-prod/shipping:latest
oc tag sockstore/user:latest sockstore-prod/user:latest
oc tag sockstore/user-db:latest sockstore-prod/user-db:latest
oc tag sockstore/cart-db:latest sockstore-prod/cart-db:latest
oc tag sockstore/cart:latest sockstore-prod/cart:latest
oc tag sockstore/catalogue-db:latest sockstore-prod/catalogue-db:latest
oc tag sockstore/catalogue:latest sockstore-prod/catalogue:latest
