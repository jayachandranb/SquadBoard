import { neo4jgraphql } from 'neo4j-graphql-js';

export const typeDefs = `
# Neo4j GraphQL JS doesn't support @unique. Instead we add an ID to each node.
# This has to be copied from ../00_datamodel/schema.graphql

type Squad {
    squadID: ID!
    name: String!
    mission: String
    focus: Focus @relation(name:"FOCUSSED_ON", direction:OUT)
    tpl: SquadTPL
    po: SquadPO
    members: [SquadMembers]
    badges: [Badge] @relation(name:"ACHIEVED", direction:OUT)
    tags: [Tag] @relation(name:"TAGGED_AS", direction:OUT)
}

type Focus {
    focusID:ID!
    area: String!
    description: String
    squads:[Squad] @relation(name:"FOCUSSED_ON", direction:IN)
}

type Person {
    personID: ID!
    lanID: String!
    firstName: String
    middleName: String
    lastName: String!
    email: String!
    phone: String
    chapter: Chapter @relation(name:"PART_OF", direction:OUT)
    isChapterLead: Boolean
    skills:[Skill] @relation(name:"SKILLED_AT", direction:OUT)
    tplOf:[Squad]
    productOwnerOf: [SquadPO]
    memberOf: [SquadMembers]
    badges:[Badge] @relation(name:"WAS_AWARDED", direction:OUT)
}

type Chapter {
    chapterID: ID!
    shortName: String!
    name: String!
    members: [Person] @relation(name:"PART_OF", direction:IN)
}

type Skill {
    skillID: ID!
    expertise: String!
    description: String
    people: [Person] @relation(name:"SKILLED_AT", direction:IN)
}

type Badge {
    badgeID: ID!
    name: String!
    version: String
    description: String
    squads: [Squad] @relation(name:"ACHIEVED", direction:IN)
    people: [Person] @relation(name:"WAS_AWARDED", direction:IN)
}

type Tag {
    tagID: ID!
    label: String!
    squads: [Squad] @relation(name:"TAGGED_AS", direction:IN)
}

type SquadTPL @relation(name:"TPL_OF") {
    from: Person
    to: Squad
    active: Boolean
    startDate: DateTime
    endDate: DateTime
}

type SquadPO @relation(name:"PO_OF") {
    from: Person
    to: Squad
    active: Boolean
    startDate: DateTime
    endDate: DateTime
}

type SquadMembers @relation(name:"MEMBER_OF") {
    from: Person
    to: Squad
    roles: [String]
    allocation: Float!
    active: Boolean
    startDate: DateTime
    endDate: DateTime
}`;