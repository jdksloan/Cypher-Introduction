// Clients Migration
// MATCH is how you find nodes based on properties, labels, and patterns

MATCH(karl:Person{name: 'Karl'})
MATCH(tom:Person{name: 'Thomas'})
MATCH(tim:Person{name: 'Tim'})
MATCH(stacy:Person{name: 'Stacy'})
WITH *

MERGE (karl)-[:CONSULTS_AT]->(tele:Organisation{name: 'TeleComms'})
MERGE (tom)-[:CONSULTS_AT]->(tele)
MERGE (tim)-[:CONSULTS_AT]->(media:Organisation{name: 'MediaHouse'})
MERGE (stacy)-[:CONSULTS_AT]->(tele)

RETURN *
