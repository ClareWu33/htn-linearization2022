;; #state features
92
+ontable[shaker1]
+ontable[shot1]
+ontable[shot2]
+ontable[shot3]
+ontable[shot4]
+clean[shaker1]
+clean[shot1]
+clean[shot2]
+clean[shot3]
+clean[shot4]
+empty[shaker1]
+empty[shot1]
+empty[shot2]
+empty[shot3]
+empty[shot4]
+handEmpty[left]
+handEmpty[right]
-contains[shot1,cocktail3]
-contains[shot2,cocktail1]
-contains[shot3,cocktail2]
-contains[shot1,ingredient1]
-contains[shot1,ingredient2]
-contains[shot1,ingredient3]
-contains[shot2,ingredient1]
-contains[shot2,ingredient2]
-contains[shot2,ingredient3]
-contains[shot3,ingredient1]
-contains[shot3,ingredient2]
-contains[shot3,ingredient3]
-contains[shot4,ingredient1]
-contains[shot4,ingredient2]
-contains[shot4,ingredient3]
-holding[left,shaker1]
-holding[left,shot1]
-holding[left,shot2]
-holding[left,shot3]
-holding[left,shot4]
-holding[right,shaker1]
-holding[right,shot1]
-holding[right,shot2]
-holding[right,shot3]
-holding[right,shot4]
+holding[left,shaker1]
+holding[left,shot1]
+holding[left,shot2]
+holding[left,shot3]
+holding[left,shot4]
+holding[right,shaker1]
+holding[right,shot1]
+holding[right,shot2]
+holding[right,shot3]
+holding[right,shot4]
+contains[shot1,ingredient1]
+used[shot1,ingredient1]
+contains[shot1,ingredient2]
+used[shot1,ingredient2]
+contains[shot1,ingredient3]
+used[shot1,ingredient3]
+contains[shot2,ingredient1]
+used[shot2,ingredient1]
+contains[shot2,ingredient2]
+used[shot2,ingredient2]
+contains[shot2,ingredient3]
+used[shot2,ingredient3]
+contains[shot3,ingredient1]
+used[shot3,ingredient1]
+contains[shot3,ingredient2]
+used[shot3,ingredient2]
+contains[shot3,ingredient3]
+used[shot3,ingredient3]
+contains[shot4,ingredient1]
+used[shot4,ingredient1]
+contains[shot4,ingredient2]
+used[shot4,ingredient2]
+contains[shot4,ingredient3]
+used[shot4,ingredient3]
+contains[shaker1,ingredient1]
+unshaked[shaker1]
-clean[shaker1]
-empty[shaker1]
+contains[shaker1,ingredient2]
+contains[shaker1,ingredient3]
+shaked[shaker1]
+contains[shaker1,cocktail1]
+contains[shaker1,cocktail2]
+contains[shaker1,cocktail3]
+contains[shot2,cocktail1]
+used[shot2,cocktail1]
+contains[shot3,cocktail2]
+used[shot3,cocktail2]
+contains[shot1,cocktail3]
+used[shot1,cocktail3]

;; Mutex Groups
92
0 0 +ontable[shaker1]
1 1 +ontable[shot1]
2 2 +ontable[shot2]
3 3 +ontable[shot3]
4 4 +ontable[shot4]
5 5 +clean[shaker1]
6 6 +clean[shot1]
7 7 +clean[shot2]
8 8 +clean[shot3]
9 9 +clean[shot4]
10 10 +empty[shaker1]
11 11 +empty[shot1]
12 12 +empty[shot2]
13 13 +empty[shot3]
14 14 +empty[shot4]
15 15 +handEmpty[left]
16 16 +handEmpty[right]
17 17 -contains[shot1,cocktail3]
18 18 -contains[shot2,cocktail1]
19 19 -contains[shot3,cocktail2]
20 20 -contains[shot1,ingredient1]
21 21 -contains[shot1,ingredient2]
22 22 -contains[shot1,ingredient3]
23 23 -contains[shot2,ingredient1]
24 24 -contains[shot2,ingredient2]
25 25 -contains[shot2,ingredient3]
26 26 -contains[shot3,ingredient1]
27 27 -contains[shot3,ingredient2]
28 28 -contains[shot3,ingredient3]
29 29 -contains[shot4,ingredient1]
30 30 -contains[shot4,ingredient2]
31 31 -contains[shot4,ingredient3]
32 32 -holding[left,shaker1]
33 33 -holding[left,shot1]
34 34 -holding[left,shot2]
35 35 -holding[left,shot3]
36 36 -holding[left,shot4]
37 37 -holding[right,shaker1]
38 38 -holding[right,shot1]
39 39 -holding[right,shot2]
40 40 -holding[right,shot3]
41 41 -holding[right,shot4]
42 42 +holding[left,shaker1]
43 43 +holding[left,shot1]
44 44 +holding[left,shot2]
45 45 +holding[left,shot3]
46 46 +holding[left,shot4]
47 47 +holding[right,shaker1]
48 48 +holding[right,shot1]
49 49 +holding[right,shot2]
50 50 +holding[right,shot3]
51 51 +holding[right,shot4]
52 52 +contains[shot1,ingredient1]
53 53 +used[shot1,ingredient1]
54 54 +contains[shot1,ingredient2]
55 55 +used[shot1,ingredient2]
56 56 +contains[shot1,ingredient3]
57 57 +used[shot1,ingredient3]
58 58 +contains[shot2,ingredient1]
59 59 +used[shot2,ingredient1]
60 60 +contains[shot2,ingredient2]
61 61 +used[shot2,ingredient2]
62 62 +contains[shot2,ingredient3]
63 63 +used[shot2,ingredient3]
64 64 +contains[shot3,ingredient1]
65 65 +used[shot3,ingredient1]
66 66 +contains[shot3,ingredient2]
67 67 +used[shot3,ingredient2]
68 68 +contains[shot3,ingredient3]
69 69 +used[shot3,ingredient3]
70 70 +contains[shot4,ingredient1]
71 71 +used[shot4,ingredient1]
72 72 +contains[shot4,ingredient2]
73 73 +used[shot4,ingredient2]
74 74 +contains[shot4,ingredient3]
75 75 +used[shot4,ingredient3]
76 76 +contains[shaker1,ingredient1]
77 77 +unshaked[shaker1]
78 78 -clean[shaker1]
79 79 -empty[shaker1]
80 80 +contains[shaker1,ingredient2]
81 81 +contains[shaker1,ingredient3]
82 82 +shaked[shaker1]
83 83 +contains[shaker1,cocktail1]
84 84 +contains[shaker1,cocktail2]
85 85 +contains[shaker1,cocktail3]
86 86 +contains[shot2,cocktail1]
87 87 +used[shot2,cocktail1]
88 88 +contains[shot3,cocktail2]
89 89 +used[shot3,cocktail2]
90 90 +contains[shot1,cocktail3]
91 91 +used[shot1,cocktail3]

;; further strict Mutex Groups
0

;; further non strict Mutex Groups
0

;; known invariants
0

;; Actions
269
0
90 -1
-1
-1
0
6 11 85 42 82 -1
-1
-1
1
11 6 82 42 85 -1
0 91  0 90  -1
0 17  0 11  0 6  -1
0
6 11 85 47 82 -1
-1
-1
1
11 6 82 47 85 -1
0 91  0 90  -1
0 17  0 11  0 6  -1
0
17 -1
-1
-1
0
85 -1
-1
-1
1
81 77 47 15 80 -1
0 85  0 82  -1
0 81  0 77  0 80  -1
0
43 -1
-1
-1
1
43 -1
0 33  0 1  0 15  -1
0 43  -1
0
44 -1
-1
-1
1
44 -1
0 34  0 2  0 15  -1
0 44  -1
0
45 -1
-1
-1
1
45 -1
0 3  0 35  0 15  -1
0 45  -1
0
46 -1
-1
-1
1
46 -1
0 36  0 4  0 15  -1
0 46  -1
0
42 -1
-1
-1
1
42 -1
0 32  0 0  0 15  -1
0 42  -1
0
16 -1
-1
-1
0
15 -1
-1
-1
0
47 -1
-1
-1
0
37 -1
-1
-1
1
0 16 -1
0 47  -1
0 0  0 37  0 16  -1
1
47 -1
0 37  0 0  0 16  -1
0 47  -1
0
0 -1
-1
-1
0
49 -1
-1
-1
1
49 -1
0 39  0 2  0 16  -1
0 49  -1
0
51 -1
-1
-1
1
51 -1
0 4  0 41  0 16  -1
0 51  -1
0
50 -1
-1
-1
1
50 -1
0 40  0 3  0 16  -1
0 50  -1
0
48 -1
-1
-1
1
48 -1
0 38  0 1  0 16  -1
0 48  -1
1
16 81 77 42 80 -1
0 85  0 82  -1
0 81  0 77  0 80  -1
0
32 -1
-1
-1
1
0 15 -1
0 42  -1
0 32  0 0  0 15  -1
0
81 -1
-1
-1
1
5 10 56 48 -1
0 81  0 22  0 77  0 11  0 78  0 79  -1
0 56  0 5  0 10  -1
0
38 -1
-1
-1
1
1 16 -1
0 48  -1
0 38  0 1  0 16  -1
0
1 -1
-1
-1
1
5 10 56 43 -1
0 81  0 22  0 77  0 11  0 78  0 79  -1
0 56  0 5  0 10  -1
0
33 -1
-1
-1
1
1 15 -1
0 43  -1
0 1  0 33  0 15  -1
0
56 -1
-1
-1
1
43 6 11 16 -1
0 57  0 56  -1
0 22  0 11  0 6  -1
1
6 11 48 15 -1
0 57  0 56  -1
0 22  0 11  0 6  -1
0
22 -1
-1
-1
0
6 -1
-1
-1
1
11 15 48 53 -1
0 6  -1
0 53  -1
1
52 48 -1
0 20  0 11  -1
0 52  -1
1
11 16 43 53 -1
0 6  -1
0 53  -1
1
52 43 -1
0 20  0 11  -1
0 52  -1
0
52 -1
-1
-1
1
11 48 15 55 -1
0 6  -1
0 55  -1
1
54 48 -1
0 21  0 11  -1
0 54  -1
1
11 16 43 55 -1
0 6  -1
0 55  -1
1
54 43 -1
0 21  0 11  -1
0 54  -1
0
54 -1
-1
-1
1
11 15 48 57 -1
0 6  -1
0 57  -1
1
56 48 -1
0 22  0 11  -1
0 56  -1
1
11 16 43 57 -1
0 6  -1
0 57  -1
1
56 43 -1
0 22  0 11  -1
0 56  -1
1
15 48 11 91 -1
0 6  -1
0 91  -1
1
90 48 -1
0 17  0 11  -1
0 90  -1
1
43 11 16 91 -1
0 6  -1
0 91  -1
1
90 43 -1
0 17  0 11  -1
0 90  -1
0
55 -1
-1
-1
0
91 -1
-1
-1
0
53 -1
-1
-1
0
57 -1
-1
-1
0
11 -1
-1
-1
1
68 5 10 45 -1
0 28  0 77  0 81  0 78  0 13  0 79  -1
0 68  0 5  0 10  -1
0
35 -1
-1
-1
1
3 15 -1
0 45  -1
0 3  0 35  0 15  -1
0
3 -1
-1
-1
1
68 5 10 50 -1
0 28  0 77  0 81  0 78  0 13  0 79  -1
0 68  0 5  0 10  -1
0
40 -1
-1
-1
1
3 16 -1
0 50  -1
0 3  0 40  0 16  -1
0
68 -1
-1
-1
1
8 13 45 16 -1
0 69  0 68  -1
0 13  0 28  0 8  -1
1
8 13 50 15 -1
0 69  0 68  -1
0 13  0 28  0 8  -1
0
28 -1
-1
-1
0
8 -1
-1
-1
1
13 15 50 65 -1
0 8  -1
0 65  -1
1
64 50 -1
0 26  0 13  -1
0 64  -1
1
13 16 45 65 -1
0 8  -1
0 65  -1
1
64 45 -1
0 26  0 13  -1
0 64  -1
0
64 -1
-1
-1
1
13 15 50 89 -1
0 8  -1
0 89  -1
1
88 50 -1
0 19  0 13  -1
0 88  -1
1
13 16 45 89 -1
0 8  -1
0 89  -1
1
88 45 -1
0 19  0 13  -1
0 88  -1
0
88 -1
-1
-1
1
13 15 50 67 -1
0 8  -1
0 67  -1
1
66 50 -1
0 27  0 13  -1
0 66  -1
1
13 16 45 67 -1
0 8  -1
0 67  -1
1
66 45 -1
0 27  0 13  -1
0 66  -1
0
66 -1
-1
-1
1
13 15 50 69 -1
0 8  -1
0 69  -1
1
68 50 -1
0 28  0 13  -1
0 68  -1
1
13 16 45 69 -1
0 8  -1
0 69  -1
1
68 45 -1
0 28  0 13  -1
0 68  -1
0
89 -1
-1
-1
0
65 -1
-1
-1
0
67 -1
-1
-1
0
69 -1
-1
-1
0
13 -1
-1
-1
1
5 10 74 46 -1
0 31  0 77  0 81  0 14  0 79  0 78  -1
0 74  0 5  0 10  -1
0
36 -1
-1
-1
1
4 15 -1
0 46  -1
0 4  0 36  0 15  -1
0
4 -1
-1
-1
1
5 10 74 51 -1
0 31  0 77  0 81  0 14  0 79  0 78  -1
0 74  0 5  0 10  -1
0
41 -1
-1
-1
1
4 16 -1
0 51  -1
0 4  0 41  0 16  -1
0
74 -1
-1
-1
1
9 14 51 15 -1
0 75  0 74  -1
0 31  0 14  0 9  -1
1
9 14 46 16 -1
0 75  0 74  -1
0 31  0 14  0 9  -1
0
31 -1
-1
-1
0
9 -1
-1
-1
1
14 15 51 73 -1
0 9  -1
0 73  -1
1
72 51 -1
0 30  0 14  -1
0 72  -1
1
14 16 46 73 -1
0 9  -1
0 73  -1
1
72 46 -1
0 30  0 14  -1
0 72  -1
0
72 -1
-1
-1
1
14 51 15 75 -1
0 9  -1
0 75  -1
1
74 51 -1
0 31  0 14  -1
0 74  -1
1
14 16 46 75 -1
0 9  -1
0 75  -1
1
74 46 -1
0 31  0 14  -1
0 74  -1
1
14 15 51 71 -1
0 9  -1
0 71  -1
1
70 51 -1
0 29  0 14  -1
0 70  -1
1
14 16 46 71 -1
0 9  -1
0 71  -1
1
70 46 -1
0 29  0 14  -1
0 70  -1
0
70 -1
-1
-1
0
71 -1
-1
-1
0
73 -1
-1
-1
0
75 -1
-1
-1
0
14 -1
-1
-1
1
5 10 62 49 -1
0 25  0 77  0 81  0 12  0 78  0 79  -1
0 62  0 5  0 10  -1
0
39 -1
-1
-1
1
2 16 -1
0 49  -1
0 2  0 39  0 16  -1
0
2 -1
-1
-1
1
5 10 62 44 -1
0 25  0 77  0 81  0 12  0 78  0 79  -1
0 62  0 5  0 10  -1
0
34 -1
-1
-1
1
2 15 -1
0 44  -1
0 2  0 34  0 15  -1
0
62 -1
-1
-1
1
7 12 44 16 -1
0 63  0 62  -1
0 25  0 12  0 7  -1
1
7 12 49 15 -1
0 63  0 62  -1
0 25  0 12  0 7  -1
0
25 -1
-1
-1
0
7 -1
-1
-1
1
12 15 49 59 -1
0 7  -1
0 59  -1
1
58 49 -1
0 23  0 12  -1
0 58  -1
1
12 16 44 59 -1
0 7  -1
0 59  -1
1
58 44 -1
0 23  0 12  -1
0 58  -1
0
58 -1
-1
-1
1
12 15 49 61 -1
0 7  -1
0 61  -1
1
60 49 -1
0 24  0 12  -1
0 60  -1
1
12 44 16 61 -1
0 7  -1
0 61  -1
1
60 44 -1
0 24  0 12  -1
0 60  -1
0
60 -1
-1
-1
1
12 15 49 63 -1
0 7  -1
0 63  -1
1
62 49 -1
0 25  0 12  -1
0 62  -1
1
12 16 44 63 -1
0 7  -1
0 63  -1
1
62 44 -1
0 25  0 12  -1
0 62  -1
1
15 49 12 87 -1
0 7  -1
0 87  -1
1
86 49 -1
0 18  0 12  -1
0 86  -1
1
16 44 12 87 -1
0 7  -1
0 87  -1
1
86 44 -1
0 18  0 12  -1
0 86  -1
0
86 -1
-1
-1
0
87 -1
-1
-1
0
63 -1
-1
-1
0
59 -1
-1
-1
0
61 -1
-1
-1
0
12 -1
-1
-1
0
5 10 -1
-1
-1
1
48 56 77 -1
0 22  0 81  0 11  -1
0 56  -1
1
43 56 77 -1
0 22  0 81  0 11  -1
0 56  -1
1
45 68 77 -1
0 81  0 28  0 13  -1
0 68  -1
1
50 68 77 -1
0 81  0 28  0 13  -1
0 68  -1
1
46 74 77 -1
0 31  0 81  0 14  -1
0 74  -1
1
51 74 77 -1
0 31  0 81  0 14  -1
0 74  -1
1
49 62 77 -1
0 25  0 81  0 12  -1
0 62  -1
1
44 62 77 -1
0 25  0 81  0 12  -1
0 62  -1
0
79 -1
-1
-1
0
80 -1
-1
-1
1
5 10 54 48 -1
0 21  0 80  0 77  0 11  0 78  0 79  -1
0 54  0 5  0 10  -1
1
5 10 54 43 -1
0 21  0 80  0 77  0 11  0 78  0 79  -1
0 54  0 5  0 10  -1
1
43 6 11 16 -1
0 55  0 54  -1
0 11  0 21  0 6  -1
1
6 11 48 15 -1
0 55  0 54  -1
0 11  0 21  0 6  -1
0
21 -1
-1
-1
1
66 5 10 45 -1
0 27  0 77  0 80  0 78  0 13  0 79  -1
0 66  0 5  0 10  -1
1
66 5 10 50 -1
0 27  0 77  0 80  0 78  0 13  0 79  -1
0 66  0 5  0 10  -1
1
8 13 45 16 -1
0 67  0 66  -1
0 27  0 13  0 8  -1
1
8 13 50 15 -1
0 67  0 66  -1
0 27  0 13  0 8  -1
0
27 -1
-1
-1
1
5 10 72 46 -1
0 30  0 77  0 80  0 14  0 79  0 78  -1
0 72  0 5  0 10  -1
1
5 10 72 51 -1
0 30  0 77  0 80  0 14  0 79  0 78  -1
0 72  0 5  0 10  -1
1
9 14 51 15 -1
0 73  0 72  -1
0 30  0 14  0 9  -1
1
9 14 46 16 -1
0 73  0 72  -1
0 30  0 14  0 9  -1
0
30 -1
-1
-1
1
5 10 60 49 -1
0 77  0 80  0 12  0 78  0 24  0 79  -1
0 60  0 5  0 10  -1
1
5 10 60 44 -1
0 77  0 80  0 12  0 78  0 24  0 79  -1
0 60  0 5  0 10  -1
1
7 12 44 16 -1
0 61  0 60  -1
0 24  0 12  0 7  -1
1
7 12 49 15 -1
0 61  0 60  -1
0 24  0 12  0 7  -1
0
24 -1
-1
-1
1
48 54 77 -1
0 80  0 21  0 11  -1
0 54  -1
1
43 54 77 -1
0 80  0 21  0 11  -1
0 54  -1
1
45 66 77 -1
0 27  0 80  0 13  -1
0 66  -1
1
50 66 77 -1
0 27  0 80  0 13  -1
0 66  -1
1
46 72 77 -1
0 30  0 80  0 14  -1
0 72  -1
1
51 72 77 -1
0 30  0 80  0 14  -1
0 72  -1
1
49 60 77 -1
0 24  0 80  0 12  -1
0 60  -1
1
44 60 77 -1
0 24  0 80  0 12  -1
0 60  -1
0
5 -1
-1
-1
1
47 10 15 -1
0 5  -1
0 78  -1
1
10 42 16 -1
0 5  -1
0 78  -1
0
10 78 -1
-1
-1
1
82 47 83 -1
0 77  0 10  -1
0 82  0 79  0 83  -1
0
83 -1
-1
-1
1
82 47 84 -1
0 77  0 10  -1
0 82  0 79  0 84  -1
0
84 -1
-1
-1
1
82 47 85 -1
0 77  0 10  -1
0 82  0 79  0 85  -1
1
82 42 83 -1
0 77  0 10  -1
0 82  0 79  0 83  -1
1
82 42 84 -1
0 77  0 10  -1
0 82  0 79  0 84  -1
1
82 42 85 -1
0 77  0 10  -1
0 82  0 79  0 85  -1
0
82 -1
-1
-1
0
8 13 84 42 82 -1
-1
-1
1
13 8 82 42 84 -1
0 89  0 88  -1
0 19  0 13  0 8  -1
0
8 13 84 47 82 -1
-1
-1
1
13 8 82 47 84 -1
0 89  0 88  -1
0 19  0 13  0 8  -1
0
19 -1
-1
-1
1
15 77 47 81 76 -1
0 84  0 82  -1
0 77  0 81  0 76  -1
1
77 42 16 81 76 -1
0 84  0 82  -1
0 77  0 81  0 76  -1
0
76 -1
-1
-1
1
5 10 52 48 -1
0 20  0 76  0 77  0 11  0 78  0 79  -1
0 52  0 5  0 10  -1
1
5 10 52 43 -1
0 20  0 76  0 77  0 11  0 78  0 79  -1
0 52  0 5  0 10  -1
1
43 6 11 16 -1
0 53  0 52  -1
0 20  0 11  0 6  -1
1
6 11 48 15 -1
0 53  0 52  -1
0 20  0 11  0 6  -1
0
20 -1
-1
-1
1
64 5 10 45 -1
0 26  0 77  0 76  0 78  0 13  0 79  -1
0 64  0 5  0 10  -1
1
64 5 10 50 -1
0 26  0 77  0 76  0 78  0 13  0 79  -1
0 64  0 5  0 10  -1
1
8 13 45 16 -1
0 65  0 64  -1
0 26  0 13  0 8  -1
1
8 13 50 15 -1
0 65  0 64  -1
0 26  0 13  0 8  -1
0
26 -1
-1
-1
1
5 10 70 46 -1
0 29  0 77  0 76  0 14  0 79  0 78  -1
0 70  0 5  0 10  -1
1
5 10 70 51 -1
0 29  0 77  0 76  0 14  0 79  0 78  -1
0 70  0 5  0 10  -1
1
9 14 51 15 -1
0 71  0 70  -1
0 14  0 29  0 9  -1
1
9 14 46 16 -1
0 71  0 70  -1
0 14  0 29  0 9  -1
0
29 -1
-1
-1
1
5 10 58 49 -1
0 77  0 76  0 23  0 12  0 78  0 79  -1
0 58  0 5  0 10  -1
1
5 10 58 44 -1
0 77  0 76  0 23  0 12  0 78  0 79  -1
0 58  0 5  0 10  -1
1
7 12 44 16 -1
0 59  0 58  -1
0 23  0 12  0 7  -1
1
7 12 49 15 -1
0 59  0 58  -1
0 23  0 12  0 7  -1
0
23 -1
-1
-1
1
48 52 77 -1
0 20  0 76  0 11  -1
0 52  -1
1
43 52 77 -1
0 20  0 76  0 11  -1
0 52  -1
1
45 64 77 -1
0 26  0 76  0 13  -1
0 64  -1
1
50 64 77 -1
0 26  0 76  0 13  -1
0 64  -1
1
46 70 77 -1
0 76  0 29  0 14  -1
0 70  -1
1
51 70 77 -1
0 76  0 29  0 14  -1
0 70  -1
1
49 58 77 -1
0 23  0 76  0 12  -1
0 58  -1
1
44 58 77 -1
0 23  0 76  0 12  -1
0 58  -1
0
83 7 12 47 82 -1
-1
-1
1
12 7 82 47 83 -1
0 87  0 86  -1
0 18  0 12  0 7  -1
0
83 7 12 42 82 -1
-1
-1
1
12 7 82 42 83 -1
0 87  0 86  -1
0 18  0 12  0 7  -1
0
18 -1
-1
-1
1
15 77 47 81 76 -1
0 83  0 82  -1
0 77  0 81  0 76  -1
1
77 42 16 81 76 -1
0 83  0 82  -1
0 77  0 81  0 76  -1

;; initial state
41 38 37 36 35 31 10 17 30 9 29 8 7 28 6 27 5 24 1 23 0 25 2 3 26 4 11 18 32 12 33 13 34 14 39 15 40 16 20 19 21 22 -1

;; goal
-1

;; tasks (primitive and abstract)
393
0 __method_precondition_MakeAndPourCocktailNull[shot1,cocktail3]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot1,cocktail3,level1,left,level1]
0 pour-shaker-to-shot[cocktail3,shot1,left,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot1,cocktail3,level1,right,level1]
0 pour-shaker-to-shot[cocktail3,shot1,right,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot1,cocktail3]
0 __method_precondition_MakeCocktailNull[shaker1,cocktail3]
0 shake[cocktail3,ingredient2,ingredient3,shaker1,right,left]
0 __method_precondition_EmptyHand[left,shot1]
0 drop[left,shot1]
0 __method_precondition_EmptyHand[left,shot2]
0 drop[left,shot2]
0 __method_precondition_EmptyHand[left,shot3]
0 drop[left,shot3]
0 __method_precondition_EmptyHand[left,shot4]
0 drop[left,shot4]
0 __method_precondition_EmptyHand[left,shaker1]
0 drop[left,shaker1]
0 __method_precondition_HandEmptyNull[right]
0 __method_precondition_HandEmptyNull[left]
0 __method_precondition_HoldingNull[right,shaker1]
0 __method_precondition_PickUp[right,shaker1]
0 grasp[right,shaker1]
0 drop[right,shaker1]
0 __method_precondition_OnTableNull[shaker1]
0 __method_precondition_EmptyHand[right,shot2]
0 drop[right,shot2]
0 __method_precondition_EmptyHand[right,shot4]
0 drop[right,shot4]
0 __method_precondition_EmptyHand[right,shot3]
0 drop[right,shot3]
0 __method_precondition_EmptyHand[right,shot1]
0 drop[right,shot1]
0 shake[cocktail3,ingredient2,ingredient3,shaker1,left,right]
0 __method_precondition_PickUp[left,shaker1]
0 grasp[left,shaker1]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient3]
0 pour-shot-to-clean-shaker[shot1,ingredient3,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot1]
0 grasp[right,shot1]
0 __method_precondition_OnTableNull[shot1]
0 pour-shot-to-clean-shaker[shot1,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot1]
0 grasp[left,shot1]
0 __method_precondition_AddIngredientToShotNull[shot1,ingredient3]
0 fill-shot[shot1,ingredient3,left,right,dispenser3]
0 fill-shot[shot1,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient3]
0 __method_precondition_CleanShotNull[shot1]
0 clean-shot[shot1,ingredient1,right,left]
0 empty-shot[right,shot1,ingredient1]
0 clean-shot[shot1,ingredient1,left,right]
0 empty-shot[left,shot1,ingredient1]
0 __method_precondition_CleanFullShot_base[shot1,ingredient1]
0 clean-shot[shot1,ingredient2,right,left]
0 empty-shot[right,shot1,ingredient2]
0 clean-shot[shot1,ingredient2,left,right]
0 empty-shot[left,shot1,ingredient2]
0 __method_precondition_CleanFullShot_base[shot1,ingredient2]
0 clean-shot[shot1,ingredient3,right,left]
0 empty-shot[right,shot1,ingredient3]
0 clean-shot[shot1,ingredient3,left,right]
0 empty-shot[left,shot1,ingredient3]
0 clean-shot[shot1,cocktail3,right,left]
0 empty-shot[right,shot1,cocktail3]
0 clean-shot[shot1,cocktail3,left,right]
0 empty-shot[left,shot1,cocktail3]
0 __method_precondition_CleanEmptyShot_split[shot1,left,ingredient2,right]
0 __method_precondition_CleanEmptyShot_split[shot1,left,cocktail3,right]
0 __method_precondition_CleanEmptyShot_split[shot1,left,ingredient1,right]
0 __method_precondition_CleanEmptyShot_split[shot1,left,ingredient3,right]
0 __method_precondition_CleanEmptyShot_base[shot1]
0 pour-shot-to-clean-shaker[shot3,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot3]
0 grasp[left,shot3]
0 __method_precondition_OnTableNull[shot3]
0 pour-shot-to-clean-shaker[shot3,ingredient3,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot3]
0 grasp[right,shot3]
0 __method_precondition_AddIngredientToShotNull[shot3,ingredient3]
0 fill-shot[shot3,ingredient3,left,right,dispenser3]
0 fill-shot[shot3,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient3]
0 __method_precondition_CleanShotNull[shot3]
0 clean-shot[shot3,ingredient1,right,left]
0 empty-shot[right,shot3,ingredient1]
0 clean-shot[shot3,ingredient1,left,right]
0 empty-shot[left,shot3,ingredient1]
0 __method_precondition_CleanFullShot_base[shot3,ingredient1]
0 clean-shot[shot3,cocktail2,right,left]
0 empty-shot[right,shot3,cocktail2]
0 clean-shot[shot3,cocktail2,left,right]
0 empty-shot[left,shot3,cocktail2]
0 __method_precondition_CleanFullShot_base[shot3,cocktail2]
0 clean-shot[shot3,ingredient2,right,left]
0 empty-shot[right,shot3,ingredient2]
0 clean-shot[shot3,ingredient2,left,right]
0 empty-shot[left,shot3,ingredient2]
0 __method_precondition_CleanFullShot_base[shot3,ingredient2]
0 clean-shot[shot3,ingredient3,right,left]
0 empty-shot[right,shot3,ingredient3]
0 clean-shot[shot3,ingredient3,left,right]
0 empty-shot[left,shot3,ingredient3]
0 __method_precondition_CleanEmptyShot_split[shot3,left,cocktail2,right]
0 __method_precondition_CleanEmptyShot_split[shot3,left,ingredient1,right]
0 __method_precondition_CleanEmptyShot_split[shot3,left,ingredient2,right]
0 __method_precondition_CleanEmptyShot_split[shot3,left,ingredient3,right]
0 __method_precondition_CleanEmptyShot_base[shot3]
0 pour-shot-to-clean-shaker[shot4,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot4]
0 grasp[left,shot4]
0 __method_precondition_OnTableNull[shot4]
0 pour-shot-to-clean-shaker[shot4,ingredient3,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot4]
0 grasp[right,shot4]
0 __method_precondition_AddIngredientToShotNull[shot4,ingredient3]
0 fill-shot[shot4,ingredient3,right,left,dispenser3]
0 fill-shot[shot4,ingredient3,left,right,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient3]
0 __method_precondition_CleanShotNull[shot4]
0 clean-shot[shot4,ingredient2,right,left]
0 empty-shot[right,shot4,ingredient2]
0 clean-shot[shot4,ingredient2,left,right]
0 empty-shot[left,shot4,ingredient2]
0 __method_precondition_CleanFullShot_base[shot4,ingredient2]
0 clean-shot[shot4,ingredient3,right,left]
0 empty-shot[right,shot4,ingredient3]
0 clean-shot[shot4,ingredient3,left,right]
0 empty-shot[left,shot4,ingredient3]
0 clean-shot[shot4,ingredient1,right,left]
0 empty-shot[right,shot4,ingredient1]
0 clean-shot[shot4,ingredient1,left,right]
0 empty-shot[left,shot4,ingredient1]
0 __method_precondition_CleanFullShot_base[shot4,ingredient1]
0 __method_precondition_CleanEmptyShot_split[shot4,left,ingredient1,right]
0 __method_precondition_CleanEmptyShot_split[shot4,left,ingredient2,right]
0 __method_precondition_CleanEmptyShot_split[shot4,left,ingredient3,right]
0 __method_precondition_CleanEmptyShot_base[shot4]
0 pour-shot-to-clean-shaker[shot2,ingredient3,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot2]
0 grasp[right,shot2]
0 __method_precondition_OnTableNull[shot2]
0 pour-shot-to-clean-shaker[shot2,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot2]
0 grasp[left,shot2]
0 __method_precondition_AddIngredientToShotNull[shot2,ingredient3]
0 fill-shot[shot2,ingredient3,left,right,dispenser3]
0 fill-shot[shot2,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient3]
0 __method_precondition_CleanShotNull[shot2]
0 clean-shot[shot2,ingredient1,right,left]
0 empty-shot[right,shot2,ingredient1]
0 clean-shot[shot2,ingredient1,left,right]
0 empty-shot[left,shot2,ingredient1]
0 __method_precondition_CleanFullShot_base[shot2,ingredient1]
0 clean-shot[shot2,ingredient2,right,left]
0 empty-shot[right,shot2,ingredient2]
0 clean-shot[shot2,ingredient2,left,right]
0 empty-shot[left,shot2,ingredient2]
0 __method_precondition_CleanFullShot_base[shot2,ingredient2]
0 clean-shot[shot2,ingredient3,right,left]
0 empty-shot[right,shot2,ingredient3]
0 clean-shot[shot2,ingredient3,left,right]
0 empty-shot[left,shot2,ingredient3]
0 clean-shot[shot2,cocktail1,right,left]
0 empty-shot[right,shot2,cocktail1]
0 clean-shot[shot2,cocktail1,left,right]
0 empty-shot[left,shot2,cocktail1]
0 __method_precondition_CleanFullShot_base[shot2,cocktail1]
0 __method_precondition_CleanEmptyShot_split[shot2,left,cocktail1,right]
0 __method_precondition_CleanEmptyShot_split[shot2,left,ingredient3,right]
0 __method_precondition_CleanEmptyShot_split[shot2,left,ingredient1,right]
0 __method_precondition_CleanEmptyShot_split[shot2,left,ingredient2,right]
0 __method_precondition_CleanEmptyShot_base[shot2]
0 __method_precondition_AddIngredientToEmptyShaker[shaker1,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_AddIngredientToUsedShaker[shaker1,level1,level1]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient2]
0 pour-shot-to-clean-shaker[shot1,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot1,ingredient2,shaker1,left,level1,level1]
0 fill-shot[shot1,ingredient2,left,right,dispenser2]
0 fill-shot[shot1,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient2]
0 pour-shot-to-clean-shaker[shot3,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot3,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot3,ingredient2,left,right,dispenser2]
0 fill-shot[shot3,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient2]
0 pour-shot-to-clean-shaker[shot4,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot4,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot4,ingredient2,right,left,dispenser2]
0 fill-shot[shot4,ingredient2,left,right,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient2]
0 pour-shot-to-clean-shaker[shot2,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot2,ingredient2,shaker1,left,level1,level1]
0 fill-shot[shot2,ingredient2,left,right,dispenser2]
0 fill-shot[shot2,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient2]
0 pour-shot-to-used-shaker[shot1,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient2,shaker1,left,level1,level1]
0 __method_precondition_CleanShakerNull[shaker1]
0 clean-shaker[shaker1,right,left]
0 clean-shaker[shaker1,left,right]
0 __method_precondition_CleanEmptyShaker_base[shaker1]
0 empty-shaker[right,shaker1,cocktail1,level1,level1]
0 __method_precondition_CleanFullShaker_split[shaker1,level1,cocktail1,level1]
0 empty-shaker[right,shaker1,cocktail2,level1,level1]
0 __method_precondition_CleanFullShaker_split[shaker1,level1,cocktail2,level1]
0 empty-shaker[right,shaker1,cocktail3,level1,level1]
0 empty-shaker[left,shaker1,cocktail1,level1,level1]
0 empty-shaker[left,shaker1,cocktail2,level1,level1]
0 empty-shaker[left,shaker1,cocktail3,level1,level1]
0 __method_precondition_CleanFullShaker_base_base[shaker1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot3,cocktail2,level1,left,level1]
0 pour-shaker-to-shot[cocktail2,shot3,left,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot3,cocktail2,level1,right,level1]
0 pour-shaker-to-shot[cocktail2,shot3,right,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot3,cocktail2]
0 shake[cocktail2,ingredient1,ingredient3,shaker1,right,left]
0 shake[cocktail2,ingredient1,ingredient3,shaker1,left,right]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient1]
0 pour-shot-to-clean-shaker[shot1,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot1,ingredient1,shaker1,left,level1,level1]
0 fill-shot[shot1,ingredient1,left,right,dispenser1]
0 fill-shot[shot1,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient1]
0 pour-shot-to-clean-shaker[shot3,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot3,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot3,ingredient1,left,right,dispenser1]
0 fill-shot[shot3,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient1]
0 pour-shot-to-clean-shaker[shot4,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot4,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot4,ingredient1,right,left,dispenser1]
0 fill-shot[shot4,ingredient1,left,right,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient1]
0 pour-shot-to-clean-shaker[shot2,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot2,ingredient1,shaker1,left,level1,level1]
0 fill-shot[shot2,ingredient1,left,right,dispenser1]
0 fill-shot[shot2,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient1]
0 pour-shot-to-used-shaker[shot1,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient1,shaker1,left,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot2,cocktail1,level1,right,level1]
0 pour-shaker-to-shot[cocktail1,shot2,right,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot2,cocktail1,level1,left,level1]
0 pour-shaker-to-shot[cocktail1,shot2,left,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot2,cocktail1]
0 shake[cocktail1,ingredient1,ingredient3,shaker1,right,left]
0 shake[cocktail1,ingredient1,ingredient3,shaker1,left,right]
1 __top[]
1 AchieveContainsShotCocktail[shot1,cocktail3]
1 DoPourShakerToShot[shaker1,shot1,cocktail3]
1 AchieveContainsShakerCocktail[shaker1,cocktail3]
1 MakeCocktail_splitted_14[shaker1,cocktail3,ingredient2,ingredient3]
1 AchieveHandEmpty[left]
1 AchieveHolding[right,shaker1]
1 AchieveOnTable[shaker1]
1 AchieveHandEmpty[right]
1 AchieveHolding[left,shaker1]
1 AchieveContainsShakerIngredient[shaker1,ingredient3]
1 AddIngredientToEmptyShaker_splitted_6[ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient3,shaker1,level1,level1]
1 AchieveHolding[right,shot1]
1 AchieveOnTable[shot1]
1 AchieveHolding[left,shot1]
1 AchieveContainsShotIngredient[shot1,ingredient3]
1 AddIngredientToShot_splitted_20[shot1,ingredient3]
1 AchieveCleanShot[shot1]
1 CleanFullShot_splitted_12[shot1,ingredient1]
1 CleanFullShot_splitted_12[shot1,ingredient2]
1 CleanFullShot_splitted_12[shot1,ingredient3]
1 CleanFullShot_splitted_12[shot1,cocktail3]
1 CleanEmptyShot_splitted_13[shot1]
1 CleanEmptyShot_splitted_4[shot1,right]
1 CleanEmptyShot_splitted_4[shot1,left]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient3,shaker1,level1,level1]
1 AchieveHolding[left,shot3]
1 AchieveOnTable[shot3]
1 AchieveHolding[right,shot3]
1 AchieveContainsShotIngredient[shot3,ingredient3]
1 AddIngredientToShot_splitted_20[shot3,ingredient3]
1 AchieveCleanShot[shot3]
1 CleanFullShot_splitted_12[shot3,ingredient1]
1 CleanFullShot_splitted_12[shot3,cocktail2]
1 CleanFullShot_splitted_12[shot3,ingredient2]
1 CleanFullShot_splitted_12[shot3,ingredient3]
1 CleanEmptyShot_splitted_13[shot3]
1 CleanEmptyShot_splitted_4[shot3,right]
1 CleanEmptyShot_splitted_4[shot3,left]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient3,shaker1,level1,level1]
1 AchieveHolding[left,shot4]
1 AchieveOnTable[shot4]
1 AchieveHolding[right,shot4]
1 AchieveContainsShotIngredient[shot4,ingredient3]
1 AddIngredientToShot_splitted_20[shot4,ingredient3]
1 AchieveCleanShot[shot4]
1 CleanFullShot_splitted_12[shot4,ingredient2]
1 CleanFullShot_splitted_12[shot4,ingredient3]
1 CleanFullShot_splitted_12[shot4,ingredient1]
1 CleanEmptyShot_splitted_13[shot4]
1 CleanEmptyShot_splitted_4[shot4,right]
1 CleanEmptyShot_splitted_4[shot4,left]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient3,shaker1,level1,level1]
1 AchieveHolding[right,shot2]
1 AchieveOnTable[shot2]
1 AchieveHolding[left,shot2]
1 AchieveContainsShotIngredient[shot2,ingredient3]
1 AddIngredientToShot_splitted_20[shot2,ingredient3]
1 AchieveCleanShot[shot2]
1 CleanFullShot_splitted_12[shot2,ingredient1]
1 CleanFullShot_splitted_12[shot2,ingredient2]
1 CleanFullShot_splitted_12[shot2,ingredient3]
1 CleanFullShot_splitted_12[shot2,cocktail1]
1 CleanEmptyShot_splitted_13[shot2]
1 CleanEmptyShot_splitted_4[shot2,right]
1 CleanEmptyShot_splitted_4[shot2,left]
1 AddIngredientToUsedShaker_splitted_7[ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient3,shaker1,level1,level1]
1 AchieveContainsShakerIngredient[shaker1,ingredient2]
1 AddIngredientToEmptyShaker_splitted_6[ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot1,ingredient2]
1 AddIngredientToShot_splitted_20[shot1,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot3,ingredient2]
1 AddIngredientToShot_splitted_20[shot3,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot4,ingredient2]
1 AddIngredientToShot_splitted_20[shot4,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot2,ingredient2]
1 AddIngredientToShot_splitted_20[shot2,ingredient2]
1 AddIngredientToUsedShaker_splitted_7[ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient2,shaker1,level1,level1]
1 AchieveCleanShaker[shaker1]
1 CleanEmptyShaker_splitted_10[shaker1]
1 CleanFullShaker_splitted_18[shaker1]
1 CleanFullShaker_splitted_2[right,shaker1]
1 CleanFullShaker_splitted_2[left,shaker1]
1 MakeAndPourCocktail_splitted_8[shaker1]
1 AchieveContainsShotCocktail[shot3,cocktail2]
1 DoPourShakerToShot[shaker1,shot3,cocktail2]
1 AchieveContainsShakerCocktail[shaker1,cocktail2]
1 MakeCocktail_splitted_14[shaker1,cocktail2,ingredient1,ingredient3]
1 AchieveContainsShakerIngredient[shaker1,ingredient1]
1 AddIngredientToEmptyShaker_splitted_6[ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot1,ingredient1]
1 AddIngredientToShot_splitted_20[shot1,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot3,ingredient1]
1 AddIngredientToShot_splitted_20[shot3,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot4,ingredient1]
1 AddIngredientToShot_splitted_20[shot4,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot2,ingredient1]
1 AddIngredientToShot_splitted_20[shot2,ingredient1]
1 AddIngredientToUsedShaker_splitted_7[ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotCocktail[shot2,cocktail1]
1 DoPourShakerToShot[shaker1,shot2,cocktail1]
1 AchieveContainsShakerCocktail[shaker1,cocktail1]
1 MakeCocktail_splitted_14[shaker1,cocktail1,ingredient1,ingredient3]

;; initial abstract task
269

;; methods
309
__top_method
269
389 366 270 -1
-1
MakeAndPourCocktailNull
270
0 -1
-1
MakeAndPourCocktail
270
5 272 287 365 271 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
271
1 2 -1
0 1 -1
pour_shaker_to_shot_action
271
3 4 -1
0 1 -1
MakeCocktailNull
272
6 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail3];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail3,ingredient2];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
272
360 341 279 273 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail3,ingredient2,ingredient3,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
273
275 274 7 -1
0 2 0 1 1 2 -1
EmptyHand
274
8 9 -1
0 1 -1
EmptyHand
274
10 11 -1
0 1 -1
EmptyHand
274
12 13 -1
0 1 -1
EmptyHand
274
14 15 -1
0 1 -1
EmptyHand
274
16 17 -1
0 1 -1
HandEmptyNull
274
18 -1
-1
HandEmptyNull
274
19 -1
-1
HoldingNull
275
20 -1
-1
PickUp
275
21 277 276 22 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
276
20 23 -1
0 1 -1
PutDown
276
16 17 -1
0 1 -1
OnTableNull
276
24 -1
-1
EmptyHand
277
25 26 -1
0 1 -1
EmptyHand
277
27 28 -1
0 1 -1
EmptyHand
277
29 30 -1
0 1 -1
EmptyHand
277
20 23 -1
0 1 -1
EmptyHand
277
31 32 -1
0 1 -1
HandEmptyNull
277
18 -1
-1
HandEmptyNull
277
19 -1
-1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail3,ingredient2,ingredient3,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
273
278 277 33 -1
0 2 0 1 1 2 -1
HoldingNull
278
16 -1
-1
PickUp
278
34 274 276 35 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShakerNull
279
36 -1
-1
AddIngredientToEmptyShaker
279
174 280 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
280
285 281 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
281
282 37 -1
0 1 -1
HoldingNull
282
31 -1
-1
PickUp
282
38 277 283 39 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
283
8 9 -1
0 1 -1
PutDown
283
31 32 -1
0 1 -1
OnTableNull
283
40 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
281
284 41 -1
0 1 -1
HoldingNull
284
8 -1
-1
PickUp
284
42 274 283 43 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
285
44 -1
-1
AddIngredientToShot
285
47 287 286 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
286
284 277 45 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
286
282 274 46 -1
0 2 0 1 1 2 -1
CleanShotNull
287
48 -1
-1
CleanFullShot
287
53 288 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
288
282 50 274 49 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
288
284 52 277 51 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
287
58 289 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
289
282 55 274 54 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
289
284 57 277 56 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
287
44 290 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
290
282 60 274 59 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
290
284 62 277 61 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
287
0 291 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,cocktail3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
291
282 64 274 63 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,cocktail3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
291
284 66 277 65 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
287
71 292 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
292
282 293 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
293
67 274 54 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
293
68 274 63 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
293
69 274 49 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
293
70 274 59 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
292
284 294 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
294
68 277 65 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
294
67 277 56 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
294
69 277 51 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
294
70 277 61 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
280
299 295 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
295
296 72 -1
0 1 -1
HoldingNull
296
12 -1
-1
PickUp
296
73 274 297 74 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
297
12 13 -1
0 1 -1
PutDown
297
29 30 -1
0 1 -1
OnTableNull
297
75 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
295
298 76 -1
0 1 -1
HoldingNull
298
29 -1
-1
PickUp
298
77 277 297 78 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
299
79 -1
-1
AddIngredientToShot
299
82 301 300 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
300
296 277 80 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
300
298 274 81 -1
0 2 0 1 1 2 -1
CleanShotNull
301
83 -1
-1
CleanFullShot
301
88 302 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
302
298 85 274 84 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
302
296 87 277 86 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
301
93 303 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,cocktail2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
303
298 90 274 89 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,cocktail2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
303
296 92 277 91 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
301
98 304 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
304
298 95 274 94 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
304
296 97 277 96 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
301
79 305 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
305
298 100 274 99 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
305
296 102 277 101 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
301
107 306 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
306
298 307 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
307
103 274 89 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
307
104 274 84 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
307
105 274 94 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
307
106 274 99 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
306
296 308 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
308
103 277 91 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
308
104 277 86 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
308
105 277 96 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
308
106 277 101 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
280
313 309 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
309
310 108 -1
0 1 -1
HoldingNull
310
14 -1
-1
PickUp
310
109 274 311 110 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
311
14 15 -1
0 1 -1
PutDown
311
27 28 -1
0 1 -1
OnTableNull
311
111 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
309
312 112 -1
0 1 -1
HoldingNull
312
27 -1
-1
PickUp
312
113 277 311 114 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
313
115 -1
-1
AddIngredientToShot
313
118 315 314 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
314
312 274 116 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
314
310 277 117 -1
0 2 0 1 1 2 -1
CleanShotNull
315
119 -1
-1
CleanFullShot
315
124 316 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
316
312 121 274 120 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
316
310 123 277 122 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
315
115 317 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
317
312 126 274 125 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
317
310 128 277 127 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
315
133 318 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
318
312 130 274 129 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
318
310 132 277 131 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
315
137 319 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
319
312 320 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
320
134 274 129 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
320
135 274 120 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
320
136 274 125 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
319
310 321 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
321
134 277 131 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
321
135 277 122 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
321
136 277 127 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
280
326 322 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
322
323 138 -1
0 1 -1
HoldingNull
323
25 -1
-1
PickUp
323
139 277 324 140 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
324
10 11 -1
0 1 -1
PutDown
324
25 26 -1
0 1 -1
OnTableNull
324
141 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
322
325 142 -1
0 1 -1
HoldingNull
325
10 -1
-1
PickUp
325
143 274 324 144 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
326
145 -1
-1
AddIngredientToShot
326
148 328 327 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
327
325 277 146 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
327
323 274 147 -1
0 2 0 1 1 2 -1
CleanShotNull
328
149 -1
-1
CleanFullShot
328
154 329 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
329
323 151 274 150 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
329
325 153 277 152 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
328
159 330 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
330
323 156 274 155 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
330
325 158 277 157 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
328
145 331 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
331
323 161 274 160 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
331
325 163 277 162 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
328
168 332 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,cocktail1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
332
323 165 274 164 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,cocktail1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
332
325 167 277 166 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
328
173 333 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
333
323 334 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
334
169 274 164 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
334
170 274 160 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
334
171 274 150 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
334
172 274 155 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
333
325 335 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
335
169 277 166 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
335
170 277 162 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
335
171 277 152 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
335
172 277 157 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
279
183 336 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
336
285 337 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
337
282 175 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
337
284 176 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
336
299 338 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
338
296 177 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
338
298 178 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
336
313 339 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
339
310 179 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
339
312 180 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
336
326 340 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
340
323 181 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
340
325 182 -1
0 1 -1
AddIngredientToShakerNull
341
184 -1
-1
AddIngredientToEmptyShaker
341
174 342 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
342
344 343 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
343
282 185 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
343
284 186 -1
0 1 -1
AddIngredientToShotNull
344
58 -1
-1
AddIngredientToShot
344
189 287 345 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
345
284 277 187 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
345
282 274 188 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
342
347 346 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
346
296 190 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
346
298 191 -1
0 1 -1
AddIngredientToShotNull
347
98 -1
-1
AddIngredientToShot
347
194 301 348 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
348
296 277 192 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
348
298 274 193 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
342
350 349 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
349
310 195 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
349
312 196 -1
0 1 -1
AddIngredientToShotNull
350
124 -1
-1
AddIngredientToShot
350
199 315 351 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
351
312 274 197 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
351
310 277 198 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
342
353 352 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
352
323 200 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
352
325 201 -1
0 1 -1
AddIngredientToShotNull
353
159 -1
-1
AddIngredientToShot
353
204 328 354 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
354
325 277 202 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
354
323 274 203 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
341
183 355 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
355
344 356 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
356
282 205 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
356
284 206 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
355
347 357 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
357
296 207 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
357
298 208 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
355
350 358 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
358
310 209 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
358
312 210 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
355
353 359 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
359
323 211 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
359
325 212 -1
0 1 -1
CleanShakerNull
360
213 -1
-1
CleanEmptyShaker
360
216 361 -1
0 1 -1
<_splitting_method_CleanEmptyShaker_splitted_10;CleanEmptyShaker_splitted_1[shaker1,right];_splitting_method_CleanEmptyShaker_splitted_1;1;0,-1,-2>
361
275 274 214 -1
0 2 0 1 1 2 -1
<_splitting_method_CleanEmptyShaker_splitted_10;CleanEmptyShaker_splitted_1[shaker1,left];_splitting_method_CleanEmptyShaker_splitted_1;1;0,-1,-2>
361
278 277 215 -1
0 2 0 1 1 2 -1
CleanFullShaker
360
225 362 -1
0 1 -1
<_splitting_method_CleanFullShaker_splitted_18;CleanFullShaker_splitted_11[shaker1,right];_splitting_method_CleanFullShaker_splitted_11;2;0,1,-1,-2>
362
275 363 274 214 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
_splitting_method_CleanFullShaker_splitted_2
363
218 217 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
363
220 219 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
363
6 221 -1
0 1 -1
<_splitting_method_CleanFullShaker_splitted_18;CleanFullShaker_splitted_11[shaker1,left];_splitting_method_CleanFullShaker_splitted_11;2;0,1,-1,-2>
362
278 364 277 215 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
_splitting_method_CleanFullShaker_splitted_2
364
218 222 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
364
220 223 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
364
6 224 -1
0 1 -1
_splitting_method_MakeAndPourCocktail_splitted_8
365
275 -1
-1
_splitting_method_MakeAndPourCocktail_splitted_8
365
278 -1
-1
MakeAndPourCocktailNull
366
93 -1
-1
MakeAndPourCocktail
366
230 368 301 365 367 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
367
226 227 -1
0 1 -1
pour_shaker_to_shot_action
367
228 229 -1
0 1 -1
MakeCocktailNull
368
220 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail2];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail2,ingredient1];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
368
360 370 279 369 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail2,ingredient1,ingredient3,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
369
275 274 231 -1
0 2 0 1 1 2 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail2,ingredient1,ingredient3,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
369
278 277 232 -1
0 2 0 1 1 2 -1
AddIngredientToShakerNull
370
233 -1
-1
AddIngredientToEmptyShaker
370
174 371 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
371
373 372 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
372
282 234 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
372
284 235 -1
0 1 -1
AddIngredientToShotNull
373
53 -1
-1
AddIngredientToShot
373
238 287 374 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
374
284 277 236 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
374
282 274 237 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
371
376 375 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
375
296 239 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
375
298 240 -1
0 1 -1
AddIngredientToShotNull
376
88 -1
-1
AddIngredientToShot
376
243 301 377 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
377
296 277 241 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
377
298 274 242 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
371
379 378 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
378
310 244 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
378
312 245 -1
0 1 -1
AddIngredientToShotNull
379
133 -1
-1
AddIngredientToShot
379
248 315 380 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
380
312 274 246 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
380
310 277 247 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
371
382 381 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
381
323 249 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
381
325 250 -1
0 1 -1
AddIngredientToShotNull
382
154 -1
-1
AddIngredientToShot
382
253 328 383 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
383
325 277 251 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
383
323 274 252 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
370
183 384 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
384
373 385 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
385
282 254 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
385
284 255 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
384
376 386 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
386
296 256 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
386
298 257 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
384
379 387 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
387
310 258 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
387
312 259 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
384
382 388 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
388
323 260 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
388
325 261 -1
0 1 -1
MakeAndPourCocktailNull
389
168 -1
-1
MakeAndPourCocktail
389
266 391 328 365 390 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
390
262 263 -1
0 1 -1
pour_shaker_to_shot_action
390
264 265 -1
0 1 -1
MakeCocktailNull
391
218 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail1];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail1,ingredient1];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
391
360 370 279 392 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail1,ingredient1,ingredient3,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
392
275 274 267 -1
0 2 0 1 1 2 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail1,ingredient1,ingredient3,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
392
278 277 268 -1
0 2 0 1 1 2 -1
