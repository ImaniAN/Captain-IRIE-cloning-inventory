-- insert data into seedbreedervendor table
insert into seedbreedervendor (vendorname)
values
    ('marijuanasouthafrica'),
    ('growweedafrica'),
    ('bagseeds');

-- insert data into geneticmarker table
insert into geneticmarker (genus, species)
values
    ('cannabis', 'sativa'),
    ('cannabis', 'indica'),
    ('cannabis', 'hybrid');

-- insert data into strain table
insert into strain (nickname, firstname, middlename, lastname, breedervendorid, geneticmarkerid) --mock data reflects 3 species from 3 "real seedbreedervendors"
values
    ('strain1', 'firsts', 'middlemsa', 'last1', 1, 1), -- strain1 is a sativa from marijuanasouthafrica
    ('strain2', 'firsts', 'middlegwa', 'last2', 2, 1), -- strain2 is a sativa from growweedafrica
    ('strain3', 'firsts', 'middlebs', 'last3', 3, 1), -- strain3 is a sativa from bagseeds
    ('strain4', 'firsti', 'middlemsa', 'last1', 1, 2), -- strain4 is a indica from marijuanasouthafrica
    ('strain5', 'firsti', 'middlegwa', 'last2', 2, 2), -- strain5 is a indica from growweedafrica
    ('strain6', 'firsti', 'middlebs', 'last3', 3, 2), -- strain6 is a indica from bagseeds
    ('strain7', 'firsth', 'middlemsa', 'last1', 1, 3), -- strain7 is a hybrid from marijuanasouthafrica
    ('strain8', 'firsth', 'middlegwa', 'last2', 2, 3), -- strain8 is a hybrid from growweedafrica
    ('strain9', 'firsth', 'middlebs', 'last3', 3, 3); -- strain9 is a hybrid from bagseeds

-- insert data into strainseedbag table
insert into strainseedbag (strainseedbagname, packageunits, datereceived, strainid)
values
    ('bagseeds1', 3, '2023-01-11', 1),  -- bagseeds1 is a sativa from marijuanasouthafrica
    ('bagseeds2', 3, '2023-01-11', 4),  -- bagseeds2 is an indica from marijuanasouthafrica
    ('bagseeds3', 3, '2023-01-11', 7),  -- bagseeds3 is a hybrid from marijuanasouthafrica
    ('seedpack1', 3, '2023-01-11', 2),  -- seedpack1 is a sativa from growweedafrica
    ('seedpack2', 3, '2023-01-11', 5),  -- seedpack2 is an indica from growweedafrica
    ('seedpack3', 3, '2023-01-11', 8),  -- seedpack3 is a hybrid from growweedafrica
    ('seedpack4', 3, '2023-02-15', 3),  -- seedpack4 is a sativa from bagseeds
    ('seedpack5', 3, '2023-02-15', 6),  -- seedpack5 is an indica from bagseeds
    ('seedpack6', 3, '2023-03-20', 9);  -- seedpack6 is a hybrid from bagseeds

-- insert data into seed table
insert into seed (strainseedbagid)
values
    -- for strainseedbag 1 (bagseeds1) has 3 entries for each seed in a bag
    (1),   -- seed 1
    (1),   -- seed 2
    (1),   -- seed 3
    -- for strainseedbag 2 (bagseeds2) has 3 entries for each seed in a bag
    (2),   -- seed 4
    (2),   -- seed 5
    (2),   -- seed 6
    -- for strainseedbag 3 (bagseeds3) has 3 entries for each seed in a bag
    (3),   -- seed 7
    (3),   -- seed 8
    (3),   -- seed 9
    -- for strainseedbag 4 (seedpack1) has 3 entries for each seed in a bag
    (4),   -- seed 10
    (4),   -- seed 11
    (4),   -- seed 12
    -- for strainseedbag 5 (seedpack2) has 3 entries for each seed in a bag
    (5),   -- seed 13
    (5),   -- seed 14
    (5),   -- seed 15
    -- for strainseedbag 6 (seedpack3) has 3 entries for each seed in a bag
    (6),   -- seed 16
    (6),   -- seed 17
    (6),   -- seed 18
    -- for strainseedbag 7 (seedpack4) has 3 entries for each seed in a bag
    (7),   -- seed 19
    (7),   -- seed 20
    (7),   -- seed 21
    -- for strainseedbag 8 (seedpack5) has 3 entries for each seed in a bag
    (8),   -- seed 22
    (8),   -- seed 23
    (8),   -- seed 24
    -- for strainseedbag 9 (seedpack6) has 3 entries for each seed in a bag
    (9),   -- seed 25
    (9),   -- seed 26
    (9);   -- seed 27

-- insert data into seedling table
insert into seedling (seedid, sproutdate)
values
    -- for seed 1 (in strainseedbag 1)
    (1, '2023-01-07'),
    -- for seed 2 (in strainseedbag 1)
    (2, '2023-01-07'),
    -- for seed 3 (in strainseedbag 1)
    (3, '2023-01-07'),
    -- for seed 4 (in strainseedbag 2)
    (4, '2023-01-07'),
    -- for seed 5 (in strainseedbag 2)
    (5, '2023-01-07'),
    -- for seed 6 (in strainseedbag 2)
    (6, '2023-01-07'),
    -- for seed 7 (in strainseedbag 3)
    (7, '2023-01-07'),
    -- for seed 8 (in strainseedbag 3)
    (8, '2023-01-07'),
    -- for seed 9 (in strainseedbag 3)
    (9, '2023-01-07'),
    -- for seed 10 (in strainseedbag 4)
    (10, '2023-01-07'),
    -- for seed 11 (in strainseedbag 4)
    (11, '2023-01-07'),
    -- for seed 12 (in strainseedbag 4)
    (12, '2023-01-07'),
    -- for seed 13 (in strainseedbag 5)
    (13, '2023-01-07'),
    -- for seed 14 (in strainseedbag 5)
    (14, '2023-01-07'),
    -- for seed 15 (in strainseedbag 5)
    (15, '2023-01-07'),
    -- for seed 16 (in strainseedbag 6)
    (16, '2023-01-07'),
    -- for seed 17 (in strainseedbag 6)
    (17, '2023-01-07'),
    -- for seed 18 (in strainseedbag 6)
    (18, '2023-01-07'),
    -- for seed 19 (in strainseedbag 7)
    (19, '2023-01-07'),
    -- for seed 20 (in strainseedbag 7)
    (20, '2023-01-07'),
    -- for seed 21 (in strainseedbag 7)
    (21, '2023-01-07'),
    -- for seed 22 (in strainseedbag 8)
    (22, '2023-01-07'),
    -- for seed 23 (in strainseedbag 8)
    (23, '2023-01-07'),
    -- for seed 24 (in strainseedbag 8)
    (24, '2023-01-07'),
    -- for seed 25 (in strainseedbag 9)
    (25, '2023-01-07'),
    -- for seed 26 (in strainseedbag 9)
    (26, '2023-01-07'),
    -- for seed 27 (in strainseedbag 9)
    (27, '2023-01-07');

-- insert data into seedling table
insert into seedling (seedid, sproutdate)
values
    (1, '2023-01-07'),   -- seedling 1
    (2, '2023-01-07'),   -- seedling 2
    (3, '2023-01-07'),   -- seedling 3
    (4, '2023-01-07'),   -- seedling 4
    (5, '2023-01-07'),   -- seedling 5
    (6, '2023-01-07'),   -- seedling 6
    (7, '2023-01-07'),   -- seedling 7
    (8, '2023-01-07'),   -- seedling 8
    (9, '2023-01-07'),   -- seedling 9
    (10, '2023-01-07'),  -- seedling 10
    (11, '2023-01-07'),  -- seedling 11
    (12, '2023-01-07'),  -- seedling 12
    (13, '2023-01-07'),  -- seedling 13
    (14, '2023-01-07'),  -- seedling 14
    (15, '2023-01-07'),  -- seedling 15
    (16, '2023-01-07'),  -- seedling 16
    (17, '2023-01-07'),  -- seedling 17
    (18, '2023-01-07'),  -- seedling 18
    (19, '2023-01-07'),  -- seedling 19
    (20, '2023-01-07'),  -- seedling 20
    (21, '2023-01-07'),  -- seedling 21
    (22, '2023-01-07'),  -- seedling 22
    (23, '2023-01-07'),  -- seedling 23
    (24, '2023-01-07'),  -- seedling 24
    (25, '2023-01-07'),  -- seedling 25
    (26, '2023-01-07'),  -- seedling 26
    (27, '2023-01-07');  -- seedling 27

-- insert data into mothers table
-- sproutdate + (+-60 days) = datemothered (2023-02-07)
insert into mothers (seedlingid, datemothered)
values
    (1, '2023-02-07'),   -- mother 1
    (2, '2023-02-07'),   -- mother 2
    (3, '2023-02-07'),   -- mother 3
    (4, '2023-02-07'),   -- mother 4
    (5, '2023-02-07'),   -- mother 5
    (6, '2023-02-07'),   -- mother 6
    (7, '2023-02-07'),   -- mother 7
    (8, '2023-02-07'),   -- mother 8
    (9, '2023-02-07'),   -- mother 9
    (10, '2023-02-07'), -- mother 10
    (11, '2023-02-07'), -- mother 11
    (12, '2023-02-07'), -- mother 12
    (13, '2023-02-07'), -- mother 13
    (14, '2023-02-07'), -- mother 14
    (15, '2023-02-07'), -- mother 15
    (16, '2023-02-07'), -- mother 16
    (17, '2023-02-07'), -- mother 17
    (18, '2023-02-07'), -- mother 18
    (19, '2023-02-07'), -- mother 19
    (20, '2023-02-07'), -- mother 20
    (21, '2023-02-07'), -- mother 21
    (22, '2023-02-07'), -- mother 22
    (23, '2023-02-07'), -- mother 23
    (24, '2023-02-07'), -- mother 24
    (25, '2023-02-07'), -- mother 25
    (26, '2023-02-07'), -- mother 26
    (27, '2023-02-07'); -- mother 27


-- insert data into maturity table
-- there are 27 mothers
-- (2023-02-10) = dateofmaturitycheck because each initial maturity check must happen within 3 days of being a mother for cutting.
-- every maturity check after must happen 3 weeks from that date
-- each mother will get 4 maturity checks each spaced out by 3 weeks (108 entries in total)
-- height = 70
-- numberofbranches = 18
-- leafcolour = green (dark)
-- insert data into maturity table
insert into maturity (motherid, dateofmaturitycheck, height, numberofbranches)
values
    -- mother 1 maturity checks
    (1, '2023-02-10', 70, 13),  -- entry 1
    (1, '2023-03-03', 85, 13),  -- entry 2
    (1, '2023-03-24', 102, 13),  -- entry 3

    -- mother 2 maturity checks
    (2, '2023-02-10', 40, 13),  -- entry 4
    (2, '2023-03-03', 48, 13),  -- entry 5
    (2, '2023-03-24', 58, 13),  -- entry 6

    -- mother 3 maturity checks
    (3, '2023-02-10', 50, 13),  -- entry 7
    (3, '2023-03-03', 60, 13),  -- entry 8
    (3, '2023-03-24', 63, 13),  -- entry 9

    -- mother 4 maturity checks
    (4, '2023-02-10', 70, 13),  -- entry 10
    (4, '2023-03-03', 85, 13),  -- entry 11
    (4, '2023-03-24', 102, 13),  -- entry 12

    -- mother 5 maturity checks
    (5, '2023-02-10', 70, 13),  -- entry 13
    (5, '2023-03-03', 85, 13),  -- entry 14
    (5, '2023-03-24', 102, 13),  -- entry 15

    -- mother 6 maturity checks
    (6, '2023-02-10', 70, 13),  -- entry 16
    (6, '2023-03-03', 85, 13),  -- entry 17
    (6, '2023-03-24', 102, 13),  -- entry 18

    -- mother 7 maturity checks
    (7, '2023-02-10', 70, 13),  -- entry 19
    (7, '2023-03-03', 85, 13),  -- entry 20
    (7, '2023-03-24', 102, 13),  -- entry 21

    -- mother 8 maturity checks
    (8, '2023-02-10', 70, 13),  -- entry 22
    (8, '2023-03-03', 85, 13),  -- entry 23
    (8, '2023-03-24', 102, 13),  -- entry 24

    -- mother 9 maturity checks
    (9, '2023-02-10', 70, 13),  -- entry 25
    (9, '2023-03-03', 85, 13),  -- entry 26
    (9, '2023-03-24', 102, 13),  -- entry 27

    -- mother 10 maturity checks
    (10, '2023-02-10', 70, 13),  -- entry 28
    (10, '2023-03-03', 85, 13),  -- entry 29
    (10, '2023-03-24', 102, 13),  -- entry 30

    -- mother 11 maturity checks
    (11, '2023-02-10', 70, 13),  -- entry 31
    (11, '2023-03-03', 85, 13),  -- entry 32
    (11, '2023-03-24', 102, 13),  -- entry 33

    -- mother 12 maturity checks
    (12, '2023-02-10', 70, 13),  -- entry 34
    (12, '2023-03-03', 85, 13),  -- entry 35
    (12, '2023-03-24', 102, 13),  -- entry 36

    -- mother 13 maturity checks
    (13, '2023-02-10', 70, 13),  -- entry 37
    (13, '2023-03-03', 85, 13),  -- entry 38
    (13, '2023-03-24', 102, 13),  -- entry 39

    -- mother 14 maturity checks
    (14, '2023-02-10', 70, 13),  -- entry 40
    (14, '2023-03-03', 85, 13),  -- entry 41
    (14, '2023-03-24', 102, 13),  -- entry 42

    -- mother 15 maturity checks
    (15, '2023-02-10', 70, 13),  -- entry 43
    (15, '2023-03-03', 85, 13),  -- entry 44
    (15, '2023-03-24', 102, 13),  -- entry 45

    -- mother 16 maturity checks
    (16, '2023-02-10', 70, 13),  -- entry 46
    (16, '2023-03-03', 85, 13),  -- entry 47
    (16, '2023-03-24', 102, 13),  -- entry 48

    -- mother 17 maturity checks
    (17, '2023-02-10', 70, 13),  -- entry 49
    (17, '2023-03-03', 85, 13),  -- entry 50
    (17, '2023-03-24', 102, 13),  -- entry 51

    -- mother 18 maturity checks
    (18, '2023-02-10', 70, 13),  -- entry 52
    (18, '2023-03-03', 85, 13),  -- entry 53
    (18, '2023-03-24', 102, 13),  -- entry 54

    -- mother 19 maturity checks
    (19, '2023-02-10', 70, 13),  -- entry 55
    (19, '2023-03-03', 85, 13),  -- entry 56
    (19, '2023-03-24', 102, 13),  -- entry 57

    -- mother 20 maturity checks
    (20, '2023-02-10', 70, 13),  -- entry 58
    (20, '2023-03-03', 85, 13),  -- entry 59
    (20, '2023-03-24', 102, 13),  -- entry 60

    -- mother 21 maturity checks
    (21, '2023-02-10', 70, 13),  -- entry 61
    (21, '2023-03-03', 85, 13),  -- entry 62
    (21, '2023-03-24', 102, 13),  -- entry 63

    -- mother 22 maturity checks
    (22, '2023-02-10', 70, 13),  -- entry 64
    (22, '2023-03-03', 85, 13),  -- entry 65
    (22, '2023-03-24', 102, 13),  -- entry 66

    -- mother 23 maturity checks
    (23, '2023-02-10', 70, 13),  -- entry 67
    (23, '2023-03-03', 85, 13),  -- entry 68
    (23, '2023-03-24', 102, 13),  -- entry 69

    -- mother 24 maturity checks
    (24, '2023-02-10', 70, 13),  -- entry 70
    (24, '2023-03-03', 85, 13),  -- entry 71
    (24, '2023-03-24', 102, 13),  -- entry 72

    -- mother 25 maturity checks
    (25, '2023-02-10', 70, 13),  -- entry 73
    (25, '2023-03-03', 85, 13),  -- entry 74
    (25, '2023-03-24', 102, 13),  -- entry 75

    -- mother 26 maturity checks
    (26, '2023-02-10', 70, 13),  -- entry 76
    (26, '2023-03-03', 85, 13),  -- entry 77
    (26, '2023-03-24', 102, 13),  -- entry 78

    -- mother 27 maturity checks
    (27, '2023-02-10', 70, 13),  -- entry 79
    (27, '2023-03-03', 85, 13),  -- entry 80
    (27, '2023-03-24', 102, 13);  -- entry 81

-- insert data into cutting table
insert into cutting (maturityid, numberofcuts, cutdate)
values
    -- mother 1 cutting entries
    (1, 5, '2023-02-10'),
    (1, 5, '2023-03-03'),
    (1, 5, '2023-03-24'),

    -- mother 2 cutting entries
    (2, 5, '2023-02-10'),
    (2, 5, '2023-03-03'),
    (2, 5, '2023-03-24'),

    -- mother 3 cutting entries
    (3, 5, '2023-02-10'),
    (3, 5, '2023-03-03'),
    (3, 5, '2023-03-24'),

    -- mother 4 cutting entries
    (4, 5, '2023-02-10'),
    (4, 5, '2023-03-03'),
    (4, 5, '2023-03-24'),

    -- mother 5 cutting entries
    (5, 5, '2023-02-10'),
    (5, 5, '2023-03-03'),
    (5, 5, '2023-03-24'),

    -- mother 6 cutting entries
    (6, 5, '2023-02-10'),
    (6, 5, '2023-03-03'),
    (6, 5, '2023-03-24'),

    -- mother 7 cutting entries
    (7, 5, '2023-02-10'),
    (7, 5, '2023-03-03'),
    (7, 5, '2023-03-24'),

    -- mother 8 cutting entries
    (8, 5, '2023-02-10'),
    (8, 5, '2023-03-03'),
    (8, 5, '2023-03-24'),

    -- mother 9 cutting entries
    (9, 5, '2023-02-10'),
    (9, 5, '2023-03-03'),
    (9, 5, '2023-03-24'),

    -- mother 10 cutting entries
    (10, 5, '2023-02-10'),
    (10, 5, '2023-03-03'),
    (10, 5, '2023-03-24'),

    -- mother 11 cutting entries
    (11, 5, '2023-02-10'),
    (11, 5, '2023-03-03'),
    (11, 5, '2023-03-24'),

    -- mother 12 cutting entries
    (12, 5, '2023-02-10'),
    (12, 5, '2023-03-03'),
    (12, 5, '2023-03-24'),

    -- mother 13 cutting entries
    (13, 5, '2023-02-10'),
    (13, 5, '2023-03-03'),
    (13, 5, '2023-03-24'),

    -- mother 14 cutting entries
    (14, 5, '2023-02-10'),
    (14, 5, '2023-03-03'),
    (14, 5, '2023-03-24'),

    -- mother 15 cutting entries
    (15, 5, '2023-02-10'),
    (15, 5, '2023-03-03'),
    (15, 5, '2023-03-24'),

    -- mother 16 cutting entries
    (16, 5, '2023-02-10'),
    (16, 5, '2023-03-03'),
    (16, 5, '2023-03-24'),

    -- mother 17 cutting entries
    (17, 5, '2023-02-10'),
    (17, 5, '2023-03-03'),
    (17, 5, '2023-03-24'),

    -- mother 18 cutting entries
    (18, 5, '2023-02-10'),
    (18, 5, '2023-03-03'),
    (18, 5, '2023-03-24'),

    -- mother 19 cutting entries
    (19, 5, '2023-02-10'),
    (19, 5, '2023-03-03'),
    (19, 5, '2023-03-24'),

    -- mother 20 cutting entries
    (20, 5, '2023-02-10'),
    (20, 5, '2023-03-03'),
    (20, 5, '2023-03-24'),

    -- mother 21 cutting entries
    (21, 5, '2023-02-10'),
    (21, 5, '2023-03-03'),
    (21, 5, '2023-03-24'),

    -- mother 22 cutting entries
    (22, 5, '2023-02-10'),
    (22, 5, '2023-03-03'),
    (22, 5, '2023-03-24'),

    -- mother 23 cutting entries
    (23, 5, '2023-02-10'),
    (23, 5, '2023-03-03'),
    (23, 5, '2023-03-24'),

    -- mother 24 cutting entries
    (24, 5, '2023-02-10'),
    (24, 5, '2023-03-03'),
    (24, 5, '2023-03-24'),

    -- mother 25 cutting entries
    (25, 5, '2023-02-10'),
    (25, 5, '2023-03-03'),
    (25, 5, '2023-03-24'),

    -- mother 26 cutting entries
    (26, 5, '2023-02-10'),
    (26, 5, '2023-03-03'),
    (26, 5, '2023-03-24'),

    -- mother 27 cutting entries
    (27, 5, '2023-02-10'),
    (27, 5, '2023-03-03'),
    (27, 5, '2023-03-24');

-- insert data into transplant table -- 3 cuttings * 16 cuts * 27 mothers = 1296transplat entries 
-- transplantdate = cutdate + 13 days
-- 27 mothers
-- 16 cuts per marutity check
-- 3 matruity checks per mother
insert into transplant (cutid, transplantdate)
values
    -- transplants from first cutting on mother 1
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),
    (1, '2023-02-26'),

    -- transplants from second cutting on mother 1
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),
    (2, '2023-03-11'),

    -- transplants from third cutting on mother 1
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),
    (3, '2023-03-24'),

    -- transplants from first cutting on mother 2
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),
    (4, '2023-02-26'),

    -- transplants from second cutting on mother 2
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),
    (5, '2023-03-11'),

    -- transplants from third cutting on mother 2
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),
    (6, '2023-03-24'),

    -- transplants from first cutting on mother 3
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),
    (7, '2023-02-26'),

    -- transplants from second cutting on mother 3
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),
    (8, '2023-03-11'),

    -- transplants from third cutting on mother 3
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),
    (9, '2023-03-24'),

    -- transplants from first cutting on mother 4
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),
    (10, '2023-02-26'),

    -- transplants from second cutting on mother 4
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),
    (11, '2023-03-11'),

    -- transplants from third cutting on mother 4
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),
    (12, '2023-03-24'),

    -- transplants from first cutting on mother 5
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),
    (13, '2023-02-26'),

    -- transplants from second cutting on mother 5
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),
    (14, '2023-03-11'),

    -- transplants from third cutting on mother 5
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),
    (15, '2023-03-24'),

    -- transplants from first cutting on mother 6
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),
    (16, '2023-02-26'),

    -- transplants from second cutting on mother 6
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),
    (17, '2023-03-11'),

    -- transplants from third cutting on mother 6
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),
    (18, '2023-03-24'),

    -- transplants from first cutting on mother 7
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),
    (19, '2023-02-26'),

    -- transplants from second cutting on mother 7
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),
    (20, '2023-03-11'),

    -- transplants from third cutting on mother 7
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),
    (21, '2023-03-24'),

    -- transplants from first cutting on mother 8
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),
    (22, '2023-02-26'),

    -- transplants from second cutting on mother 8
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),
    (23, '2023-03-11'),

    -- transplants from third cutting on mother 8
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),
    (24, '2023-03-24'),

    -- transplants from first cutting on mother 9
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),
    (25, '2023-02-26'),

    -- transplants from second cutting on mother 9
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),
    (26, '2023-03-11'),

    -- transplants from third cutting on mother 9
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),
    (27, '2023-03-24'),

    -- transplants from first cutting on mother 10
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),
    (28, '2023-02-26'),

    -- transplants from second cutting on mother 10
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),
    (29, '2023-03-11'),

    -- transplants from third cutting on mother 10
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),
    (30, '2023-03-24'),

    -- transplants from first cutting on mother 11
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),
    (31, '2023-02-26'),

    -- transplants from second cutting on mother 11
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),
    (32, '2023-03-11'),

    -- transplants from third cutting on mother 11
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),
    (33, '2023-03-24'),

    -- transplants from first cutting on mother 12
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),
    (34, '2023-02-26'),

    -- transplants from second cutting on mother 12
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),
    (35, '2023-03-11'),

    -- transplants from third cutting on mother 12
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),
    (36, '2023-03-24'),

    -- transplants from first cutting on mother 13
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),
    (37, '2023-02-26'),

    -- transplants from second cutting on mother 13
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),
    (38, '2023-03-11'),

    -- transplants from third cutting on mother 13
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),
    (39, '2023-03-24'),

    -- transplants from first cutting on mother 14
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),
    (40, '2023-02-26'),

    -- transplants from second cutting on mother 14
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),
    (41, '2023-03-11'),

    -- transplants from third cutting on mother 14
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),
    (42, '2023-03-24'),

    -- transplants from first cutting on mother 15
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),
    (43, '2023-02-26'),

    -- transplants from second cutting on mother 15
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),
    (44, '2023-03-11'),

    -- transplants from third cutting on mother 15
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),
    (45, '2023-03-24'),

    -- transplants from first cutting on mother 16
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),
    (46, '2023-02-26'),

    -- transplants from second cutting on mother 16
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),
    (47, '2023-03-11'),

    -- transplants from third cutting on mother 16
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),
    (48, '2023-03-24'),

    -- transplants from first cutting on mother 17
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),
    (49, '2023-02-26'),

    -- transplants from second cutting on mother 17
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),
    (50, '2023-03-11'),

    -- transplants from third cutting on mother 17
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),
    (51, '2023-03-24'),

    -- transplants from first cutting on mother 18
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),
    (52, '2023-02-26'),

    -- transplants from second cutting on mother 18
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),
    (53, '2023-03-11'),

    -- transplants from third cutting on mother 18
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),
    (54, '2023-03-24'),

    -- transplants from first cutting on mother 19
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),
    (55, '2023-02-26'),

    -- transplants from second cutting on mother 19
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),
    (56, '2023-03-11'),

    -- transplants from third cutting on mother 19
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),
    (57, '2023-03-24'),

    -- transplants from first cutting on mother 20
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),
    (58, '2023-02-26'),

    -- transplants from second cutting on mother 20
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),
    (59, '2023-03-11'),

    -- transplants from third cutting on mother 20
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),
    (60, '2023-03-24'),

    -- transplants from first cutting on mother 21
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),
    (61, '2023-02-26'),

    -- transplants from second cutting on mother 21
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),
    (62, '2023-03-11'),

    -- transplants from third cutting on mother 21
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),
    (63, '2023-03-24'),

    -- transplants from first cutting on mother 22
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),
    (64, '2023-02-26'),

    -- transplants from second cutting on mother 22
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),
    (65, '2023-03-11'),

    -- transplants from third cutting on mother 22
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),
    (66, '2023-03-24'),

    -- transplants from first cutting on mother 23
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),
    (67, '2023-02-26'),

    -- transplants from second cutting on mother 23
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),
    (68, '2023-03-11'),

    -- transplants from third cutting on mother 23
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),
    (69, '2023-03-24'),

    -- transplants from first cutting on mother 24
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),
    (70, '2023-02-26'),

    -- transplants from second cutting on mother 24
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),
    (71, '2023-03-11'),

    -- transplants from third cutting on mother 24
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),
    (72, '2023-03-24'),

    -- transplants from first cutting on mother 25
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),
    (73, '2023-02-26'),

    -- transplants from second cutting on mother 25
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),
    (74, '2023-03-11'),

    -- transplants from third cutting on mother 25
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),
    (75, '2023-03-24'),

    -- transplants from first cutting on mother 26
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),
    (76, '2023-02-26'),

    -- transplants from second cutting on mother 26
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),
    (77, '2023-03-11'),

    -- transplants from third cutting on mother 26
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),
    (78, '2023-03-24'),

    -- transplants from first cutting on mother 27
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),
    (79, '2023-02-26'),

    -- transplants from second cutting on mother 27
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),
    (80, '2023-03-11'),

    -- transplants from third cutting on mother 27
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24'),
    (81, '2023-03-24');

-- insert data into daughter table
insert into daughter (transplantid, price, datedaughtered, A1Healthy, fate)
values
    -- daughters from first cutting on mother 1
    (1, 100, '2023-03-07', true, 'kept'),
    (2, 100, '2023-03-07', true, 'sold'),
    (3, 100, '2023-03-07', false, 'destroyed'),
    (4, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 1
    (6, 100, '2023-03-28', true, 'kept'),
    (7, 100, '2023-03-28', true, 'sold'),
    (8, 100, '2023-03-28', false, 'destroyed'),
    (9, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 1
    (11, 100, '2023-04-18', true, 'kept'),
    (12, 100, '2023-04-18', true, 'sold'),
    (13, 100, '2023-04-18', false, 'destroyed'),
    (14, 100, '2023-04-18', true, 'donated'),

    -- daughters from first cutting on mother 2
    (16, 100, '2023-03-07', true, 'kept'),
    (17, 100, '2023-03-07', true, 'sold'),
    (18, 100, '2023-03-07', false, 'destroyed'),
    (19, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 2
    (21, 100, '2023-03-28', true, 'kept'),
    (22, 100, '2023-03-28', true, 'sold'),
    (23, 100, '2023-03-28', false, 'destroyed'),
    (24, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 2
    (26, 100, '2023-04-18', true, 'kept'),
    (27, 100, '2023-04-18', true, 'sold'),
    (28, 100, '2023-04-18', false, 'destroyed'),
    (29, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 3
    (31, 100, '2023-03-07', true, 'kept'),
    (32, 100, '2023-03-07', true, 'sold'),
    (33, 100, '2023-03-07', false, 'destroyed'),
    (34, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 3
    (36, 100, '2023-03-28', true, 'kept'),
    (37, 100, '2023-03-28', true, 'sold'),
    (38, 100, '2023-03-28', false, 'destroyed'),
    (39, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 3
    (41, 100, '2023-04-18', true, 'kept'),
    (42, 100, '2023-04-18', true, 'sold'),
    (43, 100, '2023-04-18', false, 'destroyed'),
    (44, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 4
    (46, 100, '2023-03-07', true, 'kept'),
    (47, 100, '2023-03-07', true, 'sold'),
    (48, 100, '2023-03-07', false, 'destroyed'),
    (49, 100, '2023-03-07', true, 'donated'), --Transplant IDCheckeced

    -- daughters from second cutting on mother 4
    (51, 100, '2023-03-28', true, 'kept'),
    (52, 100, '2023-03-28', true, 'sold'),
    (53, 100, '2023-03-28', false, 'destroyed'),
    (54, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 4
    (56, 100, '2023-04-18', true, 'kept'),
    (57, 100, '2023-04-18', true, 'sold'),
    (58, 100, '2023-04-18', false, 'destroyed'),
    (59, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 5
    (61, 100, '2023-03-07', true, 'kept'),
    (62, 100, '2023-03-07', true, 'sold'),
    (63, 100, '2023-03-07', false, 'destroyed'),
    (64, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 5
    (66, 100, '2023-03-28', true, 'kept'),
    (67, 100, '2023-03-28', true, 'sold'),
    (68, 100, '2023-03-28', false, 'destroyed'),
    (69, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 5
    (71, 100, '2023-04-18', true, 'kept'),
    (72, 100, '2023-04-18', true, 'sold'),
    (73, 100, '2023-04-18', false, 'destroyed'),
    (74, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 6
    (76, 100, '2023-03-07', true, 'kept'),
    (77, 100, '2023-03-07', true, 'sold'),
    (78, 100, '2023-03-07', false, 'destroyed'),
    (79, 100, '2023-03-07', true, 'donated'), --Transplant IDCheckeced

    -- daughters from second cutting on mother 6
    (81, 100, '2023-03-28', true, 'kept'),
    (82, 100, '2023-03-28', true, 'sold'),
    (83, 100, '2023-03-28', false, 'destroyed'),
    (84, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 6
    (86, 100, '2023-04-18', true, 'kept'),
    (87, 100, '2023-04-18', true, 'sold'),
    (88, 100, '2023-04-18', false, 'destroyed'),
    (89, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 7
    (91, 100, '2023-03-07', true, 'kept'),
    (92, 100, '2023-03-07', true, 'sold'),
    (93, 100, '2023-03-07', false, 'destroyed'),
    (94, 100, '2023-03-07', true, 'donated'), --Transplant IDCheckeced

    -- daughters from second cutting on mother 7
    (96, 100, '2023-03-28', true, 'kept'),
    (97, 100, '2023-03-28', true, 'sold'),
    (98, 100, '2023-03-28', false, 'destroyed'),
    (99, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 7
    (101, 100, '2023-04-18', true, 'kept'),
    (102, 100, '2023-04-18', true, 'sold'),
    (103, 100, '2023-04-18', false, 'destroyed'),
    (104, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 8
    (106, 100, '2023-03-07', true, 'kept'),
    (107, 100, '2023-03-07', true, 'sold'),
    (108, 100, '2023-03-07', false, 'destroyed'),
    (109, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 8
    (111, 100, '2023-03-28', true, 'kept'),
    (112, 100, '2023-03-28', true, 'sold'),
    (113, 100, '2023-03-28', false, 'destroyed'),
    (114, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 8
    (116, 100, '2023-04-18', true, 'kept'),
    (117, 100, '2023-04-18', true, 'sold'),
    (118, 100, '2023-04-18', false, 'destroyed'),
    (119, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 9
    (121, 100, '2023-03-07', true, 'kept'),
    (122, 100, '2023-03-07', true, 'sold'),
    (123, 100, '2023-03-07', false, 'destroyed'),
    (124, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 9
    (126, 100, '2023-03-28', true, 'kept'),
    (127, 100, '2023-03-28', true, 'sold'),
    (128, 100, '2023-03-28', false, 'destroyed'),
    (129, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 9
    (131, 100, '2023-04-18', true, 'kept'),
    (132, 100, '2023-04-18', true, 'sold'),
    (133, 100, '2023-04-18', false, 'destroyed'),
    (134, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 10
    (136, 100, '2023-03-07', true, 'kept'),
    (137, 100, '2023-03-07', true, 'sold'),
    (138, 100, '2023-03-07', false, 'destroyed'),
    (139, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 10
    (141, 100, '2023-03-28', true, 'kept'),
    (142, 100, '2023-03-28', true, 'sold'),
    (143, 100, '2023-03-28', false, 'destroyed'),
    (144, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 10
    (146, 100, '2023-04-18', true, 'kept'),
    (147, 100, '2023-04-18', true, 'sold'),
    (148, 100, '2023-04-18', false, 'destroyed'),
    (149, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 11
    (151, 100, '2023-03-07', true, 'kept'),
    (152, 100, '2023-03-07', true, 'sold'),
    (153, 100, '2023-03-07', false, 'destroyed'),
    (154, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 11
    (156, 100, '2023-03-28', true, 'kept'),
    (157, 100, '2023-03-28', true, 'sold'),
    (158, 100, '2023-03-28', false, 'destroyed'),
    (159, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 11
    (161, 100, '2023-04-18', true, 'kept'),
    (162, 100, '2023-04-18', true, 'sold'),
    (163, 100, '2023-04-18', false, 'destroyed'),
    (164, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 12
    (166, 100, '2023-03-07', true, 'kept'),
    (167, 100, '2023-03-07', true, 'sold'),
    (168, 100, '2023-03-07', false, 'destroyed'),
    (169, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 12
    (171, 100, '2023-03-28', true, 'kept'),
    (172, 100, '2023-03-28', true, 'sold'),
    (173, 100, '2023-03-28', false, 'destroyed'),
    (174, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 12
    (176, 100, '2023-04-18', true, 'kept'),
    (177, 100, '2023-04-18', true, 'sold'),
    (178, 100, '2023-04-18', false, 'destroyed'),
    (179, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 13
    (181, 100, '2023-03-07', true, 'kept'),
    (182, 100, '2023-03-07', true, 'sold'),
    (183, 100, '2023-03-07', false, 'destroyed'),
    (184, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 13
    (186, 100, '2023-03-28', true, 'kept'),
    (187, 100, '2023-03-28', true, 'sold'),
    (188, 100, '2023-03-28', false, 'destroyed'),
    (189, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 13
    (191, 100, '2023-04-18', true, 'kept'),
    (192, 100, '2023-04-18', true, 'sold'),
    (193, 100, '2023-04-18', false, 'destroyed'),
    (194, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 14
    (196, 100, '2023-03-07', true, 'kept'),
    (197, 100, '2023-03-07', true, 'sold'),
    (198, 100, '2023-03-07', false, 'destroyed'),
    (199, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 14
    (201, 100, '2023-03-28', true, 'kept'),
    (202, 100, '2023-03-28', true, 'sold'),
    (203, 100, '2023-03-28', false, 'destroyed'),
    (204, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 14
    (206, 100, '2023-04-18', true, 'kept'),
    (207, 100, '2023-04-18', true, 'sold'),
    (208, 100, '2023-04-18', false, 'destroyed'),
    (209, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 15
    (211, 100, '2023-03-07', true, 'kept'),
    (212, 100, '2023-03-07', true, 'sold'),
    (213, 100, '2023-03-07', false, 'destroyed'),
    (214, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 15
    (216, 100, '2023-03-28', true, 'kept'),
    (217, 100, '2023-03-28', true, 'sold'),
    (218, 100, '2023-03-28', false, 'destroyed'),
    (219, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 15
    (221, 100, '2023-04-18', true, 'kept'),
    (222, 100, '2023-04-18', true, 'sold'),
    (223, 100, '2023-04-18', false, 'destroyed'),
    (224, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 16
    (226, 100, '2023-03-07', true, 'kept'),
    (227, 100, '2023-03-07', true, 'sold'),
    (228, 100, '2023-03-07', false, 'destroyed'),
    (229, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 16
    (231, 100, '2023-03-28', true, 'kept'),
    (232, 100, '2023-03-28', true, 'sold'),
    (233, 100, '2023-03-28', false, 'destroyed'),
    (234, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 16
    (236, 100, '2023-04-18', true, 'kept'),
    (237, 100, '2023-04-18', true, 'sold'),
    (238, 100, '2023-04-18', false, 'destroyed'),
    (239, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 17
    (241, 100, '2023-03-07', true, 'kept'),
    (242, 100, '2023-03-07', true, 'sold'),
    (243, 100, '2023-03-07', false, 'destroyed'),
    (244, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 17
    (246, 100, '2023-03-28', true, 'kept'),
    (247, 100, '2023-03-28', true, 'sold'),
    (248, 100, '2023-03-28', false, 'destroyed'),
    (249, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 17
    (251, 100, '2023-04-18', true, 'kept'),
    (252, 100, '2023-04-18', true, 'sold'),
    (253, 100, '2023-04-18', false, 'destroyed'),
    (254, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 18
    (256, 100, '2023-03-07', true, 'kept'),
    (257, 100, '2023-03-07', true, 'sold'),
    (258, 100, '2023-03-07', false, 'destroyed'),
    (259, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 18
    (261, 100, '2023-03-28', true, 'kept'),
    (262, 100, '2023-03-28', true, 'sold'),
    (263, 100, '2023-03-28', false, 'destroyed'),
    (264, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 18
    (266, 100, '2023-04-18', true, 'kept'),
    (267, 100, '2023-04-18', true, 'sold'),
    (268, 100, '2023-04-18', false, 'destroyed'),
    (269, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 19
    (271, 100, '2023-03-07', true, 'kept'),
    (272, 100, '2023-03-07', true, 'sold'),
    (273, 100, '2023-03-07', false, 'destroyed'),
    (274, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 19
    (276, 100, '2023-03-28', true, 'kept'),
    (277, 100, '2023-03-28', true, 'sold'),
    (278, 100, '2023-03-28', false, 'destroyed'),
    (279, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 19
    (281, 100, '2023-04-18', true, 'kept'),
    (282, 100, '2023-04-18', true, 'sold'),
    (283, 100, '2023-04-18', false, 'destroyed'),
    (284, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 20
    (286, 100, '2023-03-07', true, 'kept'),
    (287, 100, '2023-03-07', true, 'sold'),
    (288, 100, '2023-03-07', false, 'destroyed'),
    (289, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 20
    (291, 100, '2023-03-28', true, 'kept'),
    (292, 100, '2023-03-28', true, 'sold'),
    (293, 100, '2023-03-28', false, 'destroyed'),
    (294, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 20
    (296, 100, '2023-04-18', true, 'kept'),
    (297, 100, '2023-04-18', true, 'sold'),
    (298, 100, '2023-04-18', false, 'destroyed'),
    (299, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 21
    (301, 100, '2023-03-07', true, 'kept'),
    (302, 100, '2023-03-07', true, 'sold'),
    (303, 100, '2023-03-07', false, 'destroyed'),
    (304, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 21
    (306, 100, '2023-03-28', true, 'kept'),
    (307, 100, '2023-03-28', true, 'sold'),
    (308, 100, '2023-03-28', false, 'destroyed'),
    (309, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 21
    (311, 100, '2023-04-18', true, 'kept'),
    (312, 100, '2023-04-18', true, 'sold'),
    (313, 100, '2023-04-18', false, 'destroyed'),
    (314, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 22
    (316, 100, '2023-03-07', true, 'kept'),
    (317, 100, '2023-03-07', true, 'sold'),
    (318, 100, '2023-03-07', false, 'destroyed'),
    (319, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 22
    (321, 100, '2023-03-28', true, 'kept'),
    (322, 100, '2023-03-28', true, 'sold'),
    (323, 100, '2023-03-28', false, 'destroyed'),
    (324, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 22
    (326, 100, '2023-04-18', true, 'kept'),
    (327, 100, '2023-04-18', true, 'sold'),
    (328, 100, '2023-04-18', false, 'destroyed'),
    (329, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 23
    (331, 100, '2023-03-07', true, 'kept'),
    (332, 100, '2023-03-07', true, 'sold'),
    (333, 100, '2023-03-07', false, 'destroyed'),
    (334, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 23
    (336, 100, '2023-03-28', true, 'kept'),
    (337, 100, '2023-03-28', true, 'sold'),
    (238, 100, '2023-03-28', false, 'destroyed'),
    (339, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 23
    (341, 100, '2023-04-18', true, 'kept'),
    (342, 100, '2023-04-18', true, 'sold'),
    (343, 100, '2023-04-18', false, 'destroyed'),
    (344, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 24
    (346, 100, '2023-03-07', true, 'kept'),
    (347, 100, '2023-03-07', true, 'sold'),
    (348, 100, '2023-03-07', false, 'destroyed'),
    (349, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 24
    (351, 100, '2023-03-28', true, 'kept'),
    (352, 100, '2023-03-28', true, 'sold'),
    (353, 100, '2023-03-28', false, 'destroyed'),
    (354, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 24
    (356, 100, '2023-04-18', true, 'kept'),
    (357, 100, '2023-04-18', true, 'sold'),
    (358, 100, '2023-04-18', false, 'destroyed'),
    (359, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 25
    (361, 100, '2023-03-07', true, 'kept'),
    (362, 100, '2023-03-07', true, 'sold'),
    (363, 100, '2023-03-07', false, 'destroyed'),
    (364, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 25
    (366, 100, '2023-03-28', true, 'kept'),
    (367, 100, '2023-03-28', true, 'sold'),
    (368, 100, '2023-03-28', false, 'destroyed'),
    (369, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 25
    (371, 100, '2023-04-18', true, 'kept'),
    (372, 100, '2023-04-18', true, 'sold'),
    (373, 100, '2023-04-18', false, 'destroyed'),
    (374, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 26
    (376, 100, '2023-03-07', true, 'kept'),
    (377, 100, '2023-03-07', true, 'sold'),
    (378, 100, '2023-03-07', false, 'destroyed'),
    (379, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 26
    (381, 100, '2023-03-28', true, 'kept'),
    (382, 100, '2023-03-28', true, 'sold'),
    (383, 100, '2023-03-28', false, 'destroyed'),
    (384, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 26
    (386, 100, '2023-04-18', true, 'kept'),
    (387, 100, '2023-04-18', true, 'sold'),
    (388, 100, '2023-04-18', false, 'destroyed'),
    (389, 100, '2023-04-18', true, 'donated'),

        -- daughters from first cutting on mother 27
    (391, 100, '2023-03-07', true, 'kept'),
    (392, 100, '2023-03-07', true, 'sold'),
    (393, 100, '2023-03-07', false, 'destroyed'),
    (394, 100, '2023-03-07', true, 'donated'),

    -- daughters from second cutting on mother 27
    (396, 100, '2023-03-28', true, 'kept'),
    (397, 100, '2023-03-28', true, 'sold'),
    (398, 100, '2023-03-28', false, 'destroyed'),
    (399, 100, '2023-03-28', true, 'donated'),

    -- daughters from third cutting on mother 27
    (401, 100, '2023-04-18', true, 'kept'),
    (402, 100, '2023-04-18', true, 'sold'),
    (403, 100, '2023-04-18', false, 'destroyed'),
    (404, 100, '2023-04-18', true, 'donated');

-- create constraints, triggers, and other database-specific configurations as required.
-- ensure data types, default values, and cascading actions are appropriately defined.

-- continue creating tables and defining constraints and indexes for the remaining tables in your schema.
