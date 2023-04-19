----------
-- Step 0 - Create a Query 
----------
-- Query: Find a count of `toys` records that have a price greater than
    -- 55 and belong to a cat that has the color "Olive".

SELECT COUNT(toys.name) FROM toys
JOIN cat_toys ON cat_toys.toy_id = toys.id
JOIN cats ON cat_toys.cat_id = cats.id
WHERE cats.color = 'Olive' AND toys.price > 55;

----------
-- Step 1 - Analyze the Query
----------
-- Query:
EXPLAIN QUERY PLAN
SELECT COUNT(toys.name) FROM toys
JOIN cat_toys ON cat_toys.toy_id = toys.id
JOIN cats ON cat_toys.cat_id = cats.id
WHERE cats.color = 'Olive' AND toys.price > 55;

-- Was this a SEARCH or SCAN?
-- What does that mean?

----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):
.timer on
SELECT COUNT(toys.name) FROM toys
JOIN cat_toys ON cat_toys.toy_id = toys.id
JOIN cats ON cat_toys.cat_id = cats.id
WHERE cats.color = 'Olive' AND toys.price > 55;
.timer off
----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:
DROP INDEX IF EXISTS idx_cat_toy_catId;
DROP INDEX IF EXISTS idx_cat_toy_toyId;
DROP INDEX IF EXISTS idx_cat_color;
DROP INDEX IF EXISTS idx_toy_price;

CREATE INDEX idx_cat_toy_catId
ON cat_toys(cat_id);
CREATE INDEX idx_cat_toy_toyId
ON cat_toys(toy_id);
CREATE INDEX idx_cat_color
ON cats(color);
CREATE INDEX idx_toy_price
ON toys(price);

-- Analyze Results:
EXPLAIN QUERY PLAN
SELECT COUNT(toys.name) FROM toys
JOIN cat_toys ON cat_toys.toy_id = toys.id
JOIN cats ON cat_toys.cat_id = cats.id
WHERE cats.color = 'Olive' AND toys.price > 55;

-- Is the new index being applied in this query?


----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):
.timer on
SELECT COUNT(toys.name) FROM toys
JOIN cat_toys ON cat_toys.toy_id = toys.id
JOIN cats ON cat_toys.cat_id = cats.id
WHERE cats.color = 'Olive' AND toys.price > 55;
.timer off

    -- Are you still getting the correct query results?
    -- Did the execution time improve (decrease)?
    -- Do you see any other opportunities for making this query more efficient?
---------------------------------
-- Notes From Further Exploration
---------------------------------
