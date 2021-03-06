LOAD CSV WITH HEADERS FROM 'file:///squad.csv' AS row
CREATE (sq:Squad)
SET sq=row, sq.health=toFloat(row.health);

LOAD CSV WITH HEADERS FROM 'file:///focus.csv' AS row
CREATE (f:Focus)
SET f=row;

LOAD CSV WITH HEADERS FROM 'file:///person.csv' AS row
CREATE (p:Person)
SET p=row, p.isChapterLead=toBoolean(row.isChapterLead), p.skills=split(row.skills,";");

LOAD CSV WITH HEADERS FROM 'file:///chapter.csv' AS row
CREATE (c:Chapter)
SET c=row;

LOAD CSV WITH HEADERS FROM 'file:///location.csv' AS row
CREATE (l:Location)
SET l=row;

LOAD CSV WITH HEADERS FROM 'file:///organisation.csv' AS row
CREATE (o:Organisation)
SET o=row;

LOAD CSV WITH HEADERS FROM 'file:///skill.csv' AS row
CREATE (sk:Skill)
SET sk=row;

LOAD CSV WITH HEADERS FROM 'file:///squad_tpl.csv' AS row 
MATCH (p:Person), (sq:Squad)
WHERE sq.squadID = row.squadID AND p.personID = row.personID
CREATE (p)-[rel:TPL_OF]->(sq)
SET rel.active = toBoolean(row.active), rel.startDate = date(row.startDate), rel.endDate = date(row.endDate);

LOAD CSV WITH HEADERS FROM 'file:///squad_po.csv' AS row 
MATCH (p:Person), (sq:Squad)
WHERE sq.squadID = row.squadID AND p.personID = row.personID
CREATE (p)-[rel:PO_OF]->(sq)
SET rel.active = toBoolean(row.active), rel.startDate = date(row.startDate), rel.endDate = date(row.endDate);

LOAD CSV WITH HEADERS FROM 'file:///squad_members.csv' AS row 
MATCH (p:Person), (sq:Squad)
WHERE sq.squadID = row.squadID AND p.personID = row.personID
CREATE (p)-[rel:MEMBER_OF]->(sq)
SET rel.active = toBoolean(row.active), rel.startDate = date(row.startDate), rel.endDate = date(row.endDate), rel.allocation = toFloat(row.allocation), rel.roles = split(row.roles,";");

MATCH (sq:Squad), (f:Focus)
WHERE sq.focusID = f.focusID
CREATE (sq)-[:FOCUSSED_ON]->(f);

MATCH (p:Person), (c:Chapter)
WHERE p.chapterID = c.chapterID
CREATE (p)-[:PART_OF]->(c);

MATCH (p:Person), (l:Location)
WHERE p.locationID = l.locationID
CREATE (p)-[:BASED_IN]->(l);

MATCH (p:Person), (o:Organisation)
WHERE p.organisationID = o.organisationID
CREATE (p)-[:EMPLOYEE_OF]->(o);

MATCH (p:Person), (sk:Skill)
WHERE sk.skillID IN p.skills
CREATE (p)-[:SKILLED_AT]->(sk);



MATCH(s:Squad) REMOVE s.focusID;
MATCH(p:Person) REMOVE p.chapterID;
MATCH(p:Person) REMOVE p.locationID;
MATCH(p:Person) REMOVE p.organisationID;
MATCH(p:Person) REMOVE p.skills;