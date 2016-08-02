-- Insert SQL Rules Here 

-- Reduce initial yeild of fur (default is 2)
UPDATE Resource_YieldChanges Set Yield = 1 WHERE ResourceType = 'RESOURCE_FUR';

