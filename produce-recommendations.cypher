MATCH (p1:Person)-[:FRIENDS*2..3]-(p2:Person) 
WHERE NOT (p1)-[:FRIENDS]-(p2) AND
id(p1) < id(p2) 
WITH distinct(p1), p2, algo.linkprediction.commonNeighbors(p1, p2, {}) as score 
WHERE score >= 2 
MERGE (r:Recommendation { 
    a: p1.name, 
    b: p2.name, 
    score: score
})
MERGE (p1)<-[:SHOULD_FRIEND]-(r)-[:SHOULD_FRIEND]->(p2)
RETURN count(r);
