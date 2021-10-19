PROFILE MATCH (karl{name: 'Karl'})-->(r)<--(p)
WHERE "Person" in LABELS(karl) or (p)-[:WORKS_AT]->(:Organisation)
RETURN karl{.*, works_with: COLLECT(p)}
