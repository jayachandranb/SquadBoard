import { makeAugmentedSchema } from 'neo4j-graphql-js';
import { ApolloServer } from 'apollo-server';
import { v1 as neo4j } from 'neo4j-driver';
import dotenv from "dotenv";
import fs from "fs";

// set environment variables from ../.env
dotenv.config();

const typeDefs = fs.readFileSync("model/schema.graphql", "utf8").toString();
const schema = makeAugmentedSchema({ typeDefs });

const driver = neo4j.driver(
  process.env.NEO4J_URI || 'bolt://localhost:7687',
  neo4j.auth.basic(
    process.env.NEO4J_USER || 'neo4j',
    process.env.NEO4J_PASSWORD || 'passw0rd'
  )
);

const server = new ApolloServer({ schema, context: { driver } });

server.listen(3000, '0.0.0.0').then(({ url }) => {
  console.log(`GraphQL API ready at ${url}`);
});