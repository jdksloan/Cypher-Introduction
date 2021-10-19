MERGE (suzy:Person {name: 'Suzy'})
ON CREATE
  SET suzy.created = timestamp()
ON MATCH
  SET suzy.lastSeen = timestamp()
RETURN suzy.name, suzy.created, suzy.lastSeen
