MATCH (p1:Person)-[:FRIENDS*2..3]-(p2:Person) 
WHERE NOT (p1)-[:FRIENDS]-(p2) AND
id(p1) < id(p2) 
WITH distinct(p1), p2 
RETURN p1.name, p2.name, algo.linkprediction.commonNeighbors(p1, p2, {}) as score
ORDER BY score DESC;
