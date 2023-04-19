----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

SELECT name FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;
-- Paste your results below (as a comment):

----------
-- Step 1 - Analyze the Query
----------
-- Query:
EXPLAIN QUERY PLAN
SELECT name FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;

-- What do your results mean?
-- Was this a SEARCH or SCAN?
-- What does that mean?

----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):
.timer on
SELECT name FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;
.timer off
-- Paste your results below (as a comment):

----------
-- Step 3 - Add an index and analyze how the query is executing
----------
-- Create index:

DROP INDEX IF EXISTS idx_cat_toys;

CREATE INDEX idx_cat_toys
ON cat_toys(toy_id);

-- Analyze Query:
EXPLAIN QUERY PLAN
SELECT name FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;

-- Is the new index being applied in this query?

----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

.timer on
SELECT name FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;
.timer off

-- Are you still getting the correct query results?
-- Did the execution time improve (decrease)?
-- Do you see any other opportunities for making this query more efficient?

---------------------------------
-- Notes From Further Exploration
---------------------------------