# Instructions

## Bring up neo4j and API locally

```
docker-compose up --build -d
```

Neo4j browser will be available at http://localhost:7474/browser/
API Playground will be available at http://localhost:3000


## Bring down neo4j and API

```
docker-compose down
docker-compose down -v (If you are ready to loose data / you want to clear data)
```

## Data Prep

### Add Constraints and Indexes

In Neo4j browser paste contents of 00_db/constraints.cypher and 00_db/indexes.cypher and execute them.

### Add Test Data (Optional / Only for Unit Testing)

Make sure neo4j and API containers are running.
```
cd 03_test_data && \
   docker cp squad.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp focus.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp person.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp chapter.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp location.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp organisation.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp skill.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp squad_tpl.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp squad_po.csv squadboard_db_1:/var/lib/neo4j/import/ && \
   docker cp squad_members.csv squadboard_db_1:/var/lib/neo4j/import/
```

In Neo4j browser paste contents of 03_test_data/load_data.cypher and execute it.


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