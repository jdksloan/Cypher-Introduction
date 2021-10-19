MATCH (karl:Person{name: 'Karl'})-->(tele:Organisation{name: 'TeleComms'})<--(p:Person)
RETURN karl, p

MATCH (karl:Person{name: 'Karl'})-->(tele:Organisation{name: 'TeleComms'})<--(p:Person)
RETURN karl{.*, works_with: COLLECT(p)}
