// Initial Graph Migration

// Create is the building block of cypher query language
CREATE(global:Organisation{name: 'Acme Global'})
CREATE(acme:Organisation{name: 'Acme Netherlands'})
CREATE(bonx:Organisation{name: 'Bonx.io'})
CREATE(gad:Organisation{name: 'Go Acme Data'})
CREATE(max:Organisation{name: 'Max'})
WITH *

// We can create nodes and relationships
// Uppercase relationships are the cypher recommended naming convention
// https://neo4j.com/docs/cypher-manual/current/syntax/naming/
CREATE (global)-[:OWNS]->(acme)
CREATE (global)-[:OWNS]->(bonx)
CREATE (global)-[:OWNS]->(gad)
CREATE (global)-[:OWNS]->(max)

// WITH is used as a filter to remove unused variables, it also is the exit for some search patterns
WITH acme, bonx, gad, max, global

// MERGE is like CREATE but does an upsert, has additional keywords to add triggers for on create and on update
// ACME
MERGE (kate:Person{name: 'Kate'})-[:WORKS_AT{role: 'CEO', since: date('2015-06-01')}]->(acme)
MERGE (karl:Person{name: 'Karl'})-[:WORKS_AT{role: 'Consultant', since: date('2018-01-01')}]->(acme)
MERGE (tom:Person{name: 'Thomas'})-[:WORKS_AT{role: 'Accountant', since: date('2020-07-14')}]->(acme)
MERGE (lotje:Person{name: 'Lotje'})-[:WORKS_AT{role: 'Consultant', since: date('2015-06-24')}]->(acme)

// GAD
MERGE (mark:Person{name: 'Mark'})-[:WORKS_AT{role: 'CEO', since: date('2012-09-01')}]->(gad)
MERGE (steph:Person{name: 'Stephanie'})-[:WORKS_AT{role: 'HR', since: date('2019-11-01')}]->(gad)
MERGE (tim:Person{name: 'Tim'})-[:WORKS_AT{role: 'Consultant', since: date('2020-08-22')}]->(gad)
MERGE (stacy:Person{name: 'Stacy'})-[:WORKS_AT{role: 'Consultant', since: date('2018-04-01')}]->(gad)

RETURN *
