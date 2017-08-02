# !/bin/bash

oc import-image mysql:5.7 --from=mysql:5.7 --confirm
oc import-image mongo:3 --from=mongo:3 --confirm
oc import-image orders-db --from=mongo:3 --confirm
oc import-image cart-db --from=mongo:3 --confirm
oc import-image rabbitmq:3 --from=rabbitmq:3 --confirm
oc import-image zipkin --from=openzipkin/zipkin --confirm
