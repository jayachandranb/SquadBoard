// MERGE Chapters
MERGE (DL:Chapter {shortName: 'DL', name: 'Domain Lead'})
MERGE (TL:Chapter {shortName: 'TL', name: 'Tribe Lead'})
MERGE (TAL:Chapter {shortName: 'TAL', name: 'Tech Area Lead'})
MERGE (TPL:Chapter {shortName: 'TPL', name: 'Tribe Performance Lead'})
MERGE (TAA:Chapter {shortName: 'TAA', name: 'Tech Area Architect'})
MERGE (RL:Chapter {shortName: 'RL', name: 'Release Lead'})
MERGE (PO:Chapter {shortName: 'PO', name: 'Product Owner'})
MERGE (DSc:Chapter {shortName: 'DSc', name: 'Data Scientist'})
MERGE (Engg:Chapter {shortName: 'Engg', name: 'Engineer'})
MERGE (JE:Chapter {shortName: 'JE', name: 'Journey Expert'})
MERGE (An:Chapter {shortName: 'An', name: 'Analyst'})
MERGE (SM:Chapter {shortName: 'SM', name: 'Scrum Master'})

// MERGE Focus
MERGE (Platform:Focus {area: 'Platform'})

// MERGE Squads
MERGE (Pascals:Squad {name: 'Pascals', mission: 'Cloud, Automation and Insights'})
MERGE (Invictus:Squad {name: 'Invictus', mission: 'Reliability Engineering'})
MERGE (Pheonix:Squad {name: 'Pheonix', mission: 'Payments Services Platform'})

// MERGE Persons
MERGE (balachaj:Person {lanID: 'balachaj', firstName: 'Jayachandran', lastName: 'Balachandran', email: 'jayachandran.balachandran@anz.com', phone: '0416623344'})
MERGE (viswanaa:Person {lanID: 'viswanaa', firstName: 'Anil', lastName: 'Viswanadha', email: 'anil.viswanadha@anz.com', phone: '0416623344'})
MERGE (shanmugb:Person {lanID: 'shanmugb', firstName: 'Balamurugan', lastName: 'Shanmugan', email: 'balamurugan.shanmugam@anz.com', phone: '0416623344'})
MERGE (mparisek:Person {lanID: 'mparisek', firstName: 'Michael', lastName: 'Parisek', email: 'michael.parisek@anz.com', phone: '0416623344'})
MERGE (hek1:Person {lanID: 'hek1', firstName: 'Keren', lastName: 'He', email: 'keren.he@anz.com', phone: '0416623344'})
MERGE (ganapath:Person {lanID: 'ganapath', firstName: 'Hari Ganesh', lastName: 'Ganapath', email: 'hariganesh.ganapathi@anz.com', phone: '0416623344'})

// Assign Chapters To People
MERGE (balachaj)-[:PART_OF]->(PO)
MERGE (viswanaa)-[:PART_OF]->(PO)
MERGE (shanmugb)-[:PART_OF]->(TPL)
MERGE (mparisek)-[:PART_OF]->(DSc)
MERGE (hek1)-[:PART_OF]->(DSc)
MERGE (ganapath)-[:PART_OF]->(Engg)

// Assign Squads to Focus
MERGE (Pascals)-[:FOCUSSED_ON]->(Platform)
MERGE (Invictus)-[:FOCUSSED_ON]->(Platform)
MERGE (Pheonix)-[:FOCUSSED_ON]->(Platform)

