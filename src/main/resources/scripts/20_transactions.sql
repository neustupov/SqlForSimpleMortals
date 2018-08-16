-- Start transaction

BEGIN;

-- Create save points

SAVEPOINT one;

-- Cancellation

ROLLBACK TO one;

-- Forced commit changes

COMMIT ;
