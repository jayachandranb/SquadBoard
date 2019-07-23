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

LOAD CSV WITH HEADERS FROM 'file:///pi.csv' AS row
CREATE (pi:ProgramIncrement)
SET pi=row, pi.startDate=date(row.startDate), pi.endDate=date(row.endDate), pi.isCurrent=toBoolean(row.isCurrent);

LOAD CSV WITH HEADERS FROM 'file:///sprint.csv' AS row
CREATE (s:Sprint)
SET s=row, s.startDate=date(row.startDate), s.endDate=date(row.endDate), s.isCurrent=toBoolean(row.isCurrent);

LOAD CSV WITH HEADERS FROM 'file:///graph.csv' AS row
CREATE (g:Graph)
SET g=row;

LOAD CSV WITH HEADERS FROM 'file:///feature.csv' AS row
CREATE (f:Feature)
SET f=row;

LOAD CSV WITH HEADERS FROM 'file:///epic.csv' AS row
CREATE (e:Epic)
SET e=row;

LOAD CSV WITH HEADERS FROM 'file:///story.csv' AS row
CREATE (s:Story)
SET s=row;

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

LOAD CSV WITH HEADERS FROM 'file:///squad_graph.csv' AS row
MATCH (s:Squad), (g:Graph)
WHERE s.squadID = row.squadID AND g.graphID = row.graphID
UNWIND split(row.values) AS value WITH toFloat(value) AS new_values
CREATE (s)-[rel:ANALYSED_ON]->(g)
SET rel.upToDate = toBoolean(row.upToDate), rel.analyseDate=date(row.analyseDate), rel.piNumber=toInt(row.piNumber), rel.values=split(row.values,','), rel.valuesMask=split(row.valuesMask,','), rel.valuesShape=split(row.valuesShape,','), rel.coordinates=split(row.coordinates,',');

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

MATCH (s:Sprint), (pi:ProgramIncrement)
WHERE s.piID = pi.piID
CREATE (s)-[:TOWARDS]->(pi);

MATCH (e:Epic), (f:Feature)
WHERE e.featureID = f.featureID
CREATE (e)-[:FULFILLS]->(f);

MATCH (e:Epic), (pi:ProgramIncrement)
WHERE e.executedPI = pi.piID
CREATE (e)-[:EXECUTED_IN]->(pi);

MATCH (e:Epic), (pi:ProgramIncrement)
WHERE e.scheduledPI = pi.piID
CREATE (e)-[:SCHEDULED_FOR]->(pi);

MATCH (e:Epic), (s:Squad)
WHERE e.squadID = s.squadID
CREATE (e)-[:ASSIGNED_TO]->(s);

MATCH (e:Epic), (es:Epic)
WHERE e.dependedOn = es.epicID
CREATE (e)-[:DEPENDED_ON]->(es);

MATCH (e:Epic), (es:Epic)
WHERE e.dependedBy = es.epicID
CREATE (es)-[:DEPENDED_BY]-> (e);

MATCH (s:Story), (sp: Sprint)
WHERE s.scheduledSprint = sp.sprintID
CREATE (s)-[:SCHEDULED_FOR]->(sp);

MATCH (s:Story), (sp: Sprint)
WHERE s.executedSprint = sp.sprintID
CREATE (s)-[:EXECUTED_IN]->(sp);

MATCH (s:Story), (e:Epic)
WHERE s.epicID = e.epicID
CREATE (s)-[:FULFILLS]->(e);

MATCH (s:Story), (p:Person)
WHERE s.assigneeID = p.personID
CREATE (s)-[:ASSIGNED_PERSON]->(p);

MATCH (s:Story), (ss:Story)
WHERE s.linkID = ss.storyID
CREATE (s)-[rel:LINKED_TO]->(ss)
SET rel.type = s.linkType;

MATCH (s:Squad) REMOVE s.focusID;
MATCH (p:Person) REMOVE p.chapterID,p.locationID,p.organisationID,p.skills;
MATCH (s:Sprint) REMOVE s.piID;
MATCH (e:Epic) REMOVE e.executedPI, e.scheduledPI, e.featureID, e.squadID, e.dependedBy, e.dependedOn;
MATCH (s:Story) REMOVE s.assigneeID, s.epicID, s.executedSprint, s.scheduledSprint, s.linkType, s.linkID;