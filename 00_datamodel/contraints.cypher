// Unique Node Properties
CREATE CONSTRAINT ON (sq:Squad) ASSERT sq.name IS UNIQUE;
CREATE CONSTRAINT ON (f:Focus) ASSERT f.area IS UNIQUE;
CREATE CONSTRAINT ON (p:Person) ASSERT p.lanID IS UNIQUE;
CREATE CONSTRAINT ON (p:Person) ASSERT p.email IS UNIQUE;
CREATE CONSTRAINT ON (c:Chapter) ASSERT c.shortName IS UNIQUE;
CREATE CONSTRAINT ON (c:Chapter) ASSERT c.name IS UNIQUE;
CREATE CONSTRAINT ON (sk:Skill) ASSERT sk.expertise IS UNIQUE;
CREATE CONSTRAINT ON (b:Badge) ASSERT b.name IS UNIQUE;
CREATE CONSTRAINT ON (t:Tag) ASSERT t.label IS UNIQUE;
CREATE CONSTRAINT ON (l:Location) ASSERT (l.city) IS UNIQUE;

// Node Properties Must exist (Requires Enterprise)
// CREATE CONSTRAINT ON (sq:Squad) ASSERT exists(sq.name);
// CREATE CONSTRAINT ON (f:Focus) ASSERT exists(f.area);
// CREATE CONSTRAINT ON (p:Person) ASSERT exists(p.lanID);
// CREATE CONSTRAINT ON (p:Person) ASSERT exists(p.lastName);
// CREATE CONSTRAINT ON (p:Person) ASSERT exists(p.email);
// CREATE CONSTRAINT ON (c:Chapter) ASSERT exists(c.shortName);
// CREATE CONSTRAINT ON (c:Chapter) ASSERT exists(c.name);
// CREATE CONSTRAINT ON (sk:Skill) ASSERT exists(sk.expertise);
// CREATE CONSTRAINT ON (b:Badge) ASSERT exists(b.name);
// CREATE CONSTRAINT ON (t:Tag) ASSERT exists(t.label);

// Relationship Properties Must Exist
// CREATE CONSTRAINT ON ()-[t:TPL_OF]-() ASSERT exists(t.active);
// CREATE CONSTRAINT ON ()-[t:TPL_OF]-() ASSERT exists(t.startDate);
// CREATE CONSTRAINT ON ()-[p:PO_OF]-() ASSERT exists(p.active);
// CREATE CONSTRAINT ON ()-[p:PO_OF]-() ASSERT exists(p.startDate);
// CREATE CONSTRAINT ON ()-[m:MEMBER_OF]-() ASSERT exists(m.active);
// CREATE CONSTRAINT ON ()-[m:MEMBER_OF]-() ASSERT exists(m.startDate);
// CREATE CONSTRAINT ON ()-[m:MEMBER_OF]-() ASSERT exists(m.allocation);