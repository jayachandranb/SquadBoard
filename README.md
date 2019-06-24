# Instructions

## Bring up neo4j locally

```
cd 99_deployment
docker-compose up --build -d
```

Neo4j browser will be available at http://localhost:7474/browser/

## Bring up graphql API locally

```
cd 01_api
npm install -y
npm start
```

## Bring down neo4j

```
cd 99_deployment
docker-compose down
docker-compose down -v (If you are ready to loose data / you want to clear data)
```

## Bring down graphql API

```
^C
```

# TODO

The present version cannot be even called an alpha. In fact it took some courage to publish this.

- [ ] Better Documentation
- [x] Dockerise Neo4j
- [x] Neo4j docker-compose
- [x] Datamodel to be made point of truth
- [ ] Custom Resolvers to be added based on the workflow.
- [x] Dockerise the API
- [x] Include the API in the deployment docker-compose
- [ ] Openshift deployment specification from docker-compose
- [ ] Better password management than hardcoded values (note to self: https://www.vaultproject.io/ looks promising)
- [ ] Support API versions
- [ ] DB dump and import of test data
- [ ] Index & Constraints creation via script
- [ ] Add more items to this list