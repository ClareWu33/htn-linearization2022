;; #state features
124
+ontable[shaker1]
+ontable[shot1]
+ontable[shot2]
+ontable[shot3]
+ontable[shot4]
+ontable[shot5]
+clean[shaker1]
+clean[shot1]
+clean[shot2]
+clean[shot3]
+clean[shot4]
+clean[shot5]
+empty[shaker1]
+empty[shot1]
+empty[shot2]
+empty[shot3]
+empty[shot4]
+empty[shot5]
+handEmpty[left]
+handEmpty[right]
-contains[shot3,cocktail2]
-contains[shot4,cocktail3]
-contains[shot5,cocktail1]
-contains[shot1,ingredient1]
-contains[shot1,ingredient2]
-contains[shot1,ingredient3]
-contains[shot1,ingredient5]
-contains[shot2,ingredient1]
-contains[shot2,ingredient2]
-contains[shot2,ingredient3]
-contains[shot2,ingredient5]
-contains[shot3,ingredient1]
-contains[shot3,ingredient2]
-contains[shot3,ingredient3]
-contains[shot3,ingredient5]
-contains[shot4,ingredient1]
-contains[shot4,ingredient2]
-contains[shot4,ingredient3]
-contains[shot4,ingredient5]
-contains[shot5,ingredient1]
-contains[shot5,ingredient2]
-contains[shot5,ingredient3]
-contains[shot5,ingredient5]
-holding[left,shaker1]
-holding[left,shot1]
-holding[left,shot2]
-holding[left,shot3]
-holding[left,shot4]
-holding[left,shot5]
-holding[right,shaker1]
-holding[right,shot1]
-holding[right,shot2]
-holding[right,shot3]
-holding[right,shot4]
-holding[right,shot5]
+holding[left,shaker1]
+holding[left,shot1]
+holding[left,shot2]
+holding[left,shot3]
+holding[left,shot4]
+holding[left,shot5]
+holding[right,shaker1]
+holding[right,shot1]
+holding[right,shot2]
+holding[right,shot3]
+holding[right,shot4]
+holding[right,shot5]
+contains[shot1,ingredient1]
+used[shot1,ingredient1]
+contains[shot1,ingredient2]
+used[shot1,ingredient2]
+contains[shot1,ingredient3]
+used[shot1,ingredient3]
+contains[shot1,ingredient5]
+used[shot1,ingredient5]
+contains[shot2,ingredient1]
+used[shot2,ingredient1]
+contains[shot2,ingredient2]
+used[shot2,ingredient2]
+contains[shot2,ingredient3]
+used[shot2,ingredient3]
+contains[shot2,ingredient5]
+used[shot2,ingredient5]
+contains[shot3,ingredient1]
+used[shot3,ingredient1]
+contains[shot3,ingredient2]
+used[shot3,ingredient2]
+contains[shot3,ingredient3]
+used[shot3,ingredient3]
+contains[shot3,ingredient5]
+used[shot3,ingredient5]
+contains[shot4,ingredient1]
+used[shot4,ingredient1]
+contains[shot4,ingredient2]
+used[shot4,ingredient2]
+contains[shot4,ingredient3]
+used[shot4,ingredient3]
+contains[shot4,ingredient5]
+used[shot4,ingredient5]
+contains[shot5,ingredient1]
+used[shot5,ingredient1]
+contains[shot5,ingredient2]
+used[shot5,ingredient2]
+contains[shot5,ingredient3]
+used[shot5,ingredient3]
+contains[shot5,ingredient5]
+used[shot5,ingredient5]
+contains[shaker1,ingredient1]
+unshaked[shaker1]
-clean[shaker1]
-empty[shaker1]
+contains[shaker1,ingredient2]
+contains[shaker1,ingredient3]
+contains[shaker1,ingredient5]
+shaked[shaker1]
+contains[shaker1,cocktail1]
+contains[shaker1,cocktail2]
+contains[shaker1,cocktail3]
+contains[shot5,cocktail1]
+used[shot5,cocktail1]
+contains[shot3,cocktail2]
+used[shot3,cocktail2]
+contains[shot4,cocktail3]
+used[shot4,cocktail3]

;; Mutex Groups
124
0 0 +ontable[shaker1]
1 1 +ontable[shot1]
2 2 +ontable[shot2]
3 3 +ontable[shot3]
4 4 +ontable[shot4]
5 5 +ontable[shot5]
6 6 +clean[shaker1]
7 7 +clean[shot1]
8 8 +clean[shot2]
9 9 +clean[shot3]
10 10 +clean[shot4]
11 11 +clean[shot5]
12 12 +empty[shaker1]
13 13 +empty[shot1]
14 14 +empty[shot2]
15 15 +empty[shot3]
16 16 +empty[shot4]
17 17 +empty[shot5]
18 18 +handEmpty[left]
19 19 +handEmpty[right]
20 20 -contains[shot3,cocktail2]
21 21 -contains[shot4,cocktail3]
22 22 -contains[shot5,cocktail1]
23 23 -contains[shot1,ingredient1]
24 24 -contains[shot1,ingredient2]
25 25 -contains[shot1,ingredient3]
26 26 -contains[shot1,ingredient5]
27 27 -contains[shot2,ingredient1]
28 28 -contains[shot2,ingredient2]
29 29 -contains[shot2,ingredient3]
30 30 -contains[shot2,ingredient5]
31 31 -contains[shot3,ingredient1]
32 32 -contains[shot3,ingredient2]
33 33 -contains[shot3,ingredient3]
34 34 -contains[shot3,ingredient5]
35 35 -contains[shot4,ingredient1]
36 36 -contains[shot4,ingredient2]
37 37 -contains[shot4,ingredient3]
38 38 -contains[shot4,ingredient5]
39 39 -contains[shot5,ingredient1]
40 40 -contains[shot5,ingredient2]
41 41 -contains[shot5,ingredient3]
42 42 -contains[shot5,ingredient5]
43 43 -holding[left,shaker1]
44 44 -holding[left,shot1]
45 45 -holding[left,shot2]
46 46 -holding[left,shot3]
47 47 -holding[left,shot4]
48 48 -holding[left,shot5]
49 49 -holding[right,shaker1]
50 50 -holding[right,shot1]
51 51 -holding[right,shot2]
52 52 -holding[right,shot3]
53 53 -holding[right,shot4]
54 54 -holding[right,shot5]
55 55 +holding[left,shaker1]
56 56 +holding[left,shot1]
57 57 +holding[left,shot2]
58 58 +holding[left,shot3]
59 59 +holding[left,shot4]
60 60 +holding[left,shot5]
61 61 +holding[right,shaker1]
62 62 +holding[right,shot1]
63 63 +holding[right,shot2]
64 64 +holding[right,shot3]
65 65 +holding[right,shot4]
66 66 +holding[right,shot5]
67 67 +contains[shot1,ingredient1]
68 68 +used[shot1,ingredient1]
69 69 +contains[shot1,ingredient2]
70 70 +used[shot1,ingredient2]
71 71 +contains[shot1,ingredient3]
72 72 +used[shot1,ingredient3]
73 73 +contains[shot1,ingredient5]
74 74 +used[shot1,ingredient5]
75 75 +contains[shot2,ingredient1]
76 76 +used[shot2,ingredient1]
77 77 +contains[shot2,ingredient2]
78 78 +used[shot2,ingredient2]
79 79 +contains[shot2,ingredient3]
80 80 +used[shot2,ingredient3]
81 81 +contains[shot2,ingredient5]
82 82 +used[shot2,ingredient5]
83 83 +contains[shot3,ingredient1]
84 84 +used[shot3,ingredient1]
85 85 +contains[shot3,ingredient2]
86 86 +used[shot3,ingredient2]
87 87 +contains[shot3,ingredient3]
88 88 +used[shot3,ingredient3]
89 89 +contains[shot3,ingredient5]
90 90 +used[shot3,ingredient5]
91 91 +contains[shot4,ingredient1]
92 92 +used[shot4,ingredient1]
93 93 +contains[shot4,ingredient2]
94 94 +used[shot4,ingredient2]
95 95 +contains[shot4,ingredient3]
96 96 +used[shot4,ingredient3]
97 97 +contains[shot4,ingredient5]
98 98 +used[shot4,ingredient5]
99 99 +contains[shot5,ingredient1]
100 100 +used[shot5,ingredient1]
101 101 +contains[shot5,ingredient2]
102 102 +used[shot5,ingredient2]
103 103 +contains[shot5,ingredient3]
104 104 +used[shot5,ingredient3]
105 105 +contains[shot5,ingredient5]
106 106 +used[shot5,ingredient5]
107 107 +contains[shaker1,ingredient1]
108 108 +unshaked[shaker1]
109 109 -clean[shaker1]
110 110 -empty[shaker1]
111 111 +contains[shaker1,ingredient2]
112 112 +contains[shaker1,ingredient3]
113 113 +contains[shaker1,ingredient5]
114 114 +shaked[shaker1]
115 115 +contains[shaker1,cocktail1]
116 116 +contains[shaker1,cocktail2]
117 117 +contains[shaker1,cocktail3]
118 118 +contains[shot5,cocktail1]
119 119 +used[shot5,cocktail1]
120 120 +contains[shot3,cocktail2]
121 121 +used[shot3,cocktail2]
122 122 +contains[shot4,cocktail3]
123 123 +used[shot4,cocktail3]

;; further strict Mutex Groups
0

;; further non strict Mutex Groups
0

;; known invariants
0

;; Actions
385
0
122 -1
-1
-1
0
10 117 16 61 114 -1
-1
-1
1
10 114 16 61 117 -1
0 123  0 122  -1
0 16  0 21  0 10  -1
0
16 117 10 55 114 -1
-1
-1
1
16 114 10 55 117 -1
0 123  0 122  -1
0 16  0 21  0 10  -1
0
21 -1
-1
-1
0
117 -1
-1
-1
1
19 108 113 55 112 -1
0 117  0 114  -1
0 113  0 108  0 112  -1
0
62 -1
-1
-1
1
62 -1
0 50  0 1  0 19  -1
0 62  -1
0
63 -1
-1
-1
1
63 -1
0 51  0 2  0 19  -1
0 63  -1
0
61 -1
-1
-1
1
61 -1
0 0  0 49  0 19  -1
0 61  -1
0
64 -1
-1
-1
1
64 -1
0 52  0 3  0 19  -1
0 64  -1
0
65 -1
-1
-1
1
65 -1
0 53  0 4  0 19  -1
0 65  -1
0
66 -1
-1
-1
1
66 -1
0 5  0 54  0 19  -1
0 66  -1
0
19 -1
-1
-1
0
18 -1
-1
-1
0
55 -1
-1
-1
0
43 -1
-1
-1
1
0 18 -1
0 55  -1
0 0  0 43  0 18  -1
1
55 -1
0 0  0 43  0 18  -1
0 55  -1
0
0 -1
-1
-1
0
60 -1
-1
-1
1
60 -1
0 5  0 48  0 18  -1
0 60  -1
0
56 -1
-1
-1
1
56 -1
0 44  0 1  0 18  -1
0 56  -1
0
59 -1
-1
-1
1
59 -1
0 47  0 4  0 18  -1
0 59  -1
0
57 -1
-1
-1
1
57 -1
0 45  0 2  0 18  -1
0 57  -1
0
58 -1
-1
-1
1
58 -1
0 46  0 3  0 18  -1
0 58  -1
1
18 108 113 61 112 -1
0 117  0 114  -1
0 113  0 108  0 112  -1
0
49 -1
-1
-1
1
0 19 -1
0 61  -1
0 0  0 49  0 19  -1
0
113 -1
-1
-1
1
12 73 6 56 -1
0 26  0 108  0 113  0 13  0 109  0 110  -1
0 73  0 6  0 12  -1
0
44 -1
-1
-1
1
1 18 -1
0 56  -1
0 1  0 44  0 18  -1
0
1 -1
-1
-1
1
6 73 12 62 -1
0 26  0 108  0 113  0 13  0 109  0 110  -1
0 73  0 6  0 12  -1
0
50 -1
-1
-1
1
1 19 -1
0 62  -1
0 1  0 50  0 19  -1
0
73 -1
-1
-1
1
7 13 56 19 -1
0 74  0 73  -1
0 13  0 26  0 7  -1
1
7 62 13 18 -1
0 74  0 73  -1
0 13  0 26  0 7  -1
0
26 -1
-1
-1
0
7 -1
-1
-1
1
13 19 56 72 -1
0 7  -1
0 72  -1
1
71 56 -1
0 25  0 13  -1
0 71  -1
1
13 18 62 72 -1
0 7  -1
0 72  -1
1
71 62 -1
0 25  0 13  -1
0 71  -1
0
71 -1
-1
-1
1
13 19 56 70 -1
0 7  -1
0 70  -1
1
69 56 -1
0 24  0 13  -1
0 69  -1
1
13 18 62 70 -1
0 7  -1
0 70  -1
1
69 62 -1
0 24  0 13  -1
0 69  -1
0
69 -1
-1
-1
1
19 56 13 68 -1
0 7  -1
0 68  -1
1
67 56 -1
0 23  0 13  -1
0 67  -1
1
62 13 18 68 -1
0 7  -1
0 68  -1
1
67 62 -1
0 23  0 13  -1
0 67  -1
0
67 -1
-1
-1
1
13 56 19 74 -1
0 7  -1
0 74  -1
1
73 56 -1
0 26  0 13  -1
0 73  -1
1
13 18 62 74 -1
0 7  -1
0 74  -1
1
73 62 -1
0 26  0 13  -1
0 73  -1
0
74 -1
-1
-1
0
72 -1
-1
-1
0
70 -1
-1
-1
0
68 -1
-1
-1
0
13 -1
-1
-1
1
6 12 89 58 -1
0 34  0 108  0 113  0 15  0 110  0 109  -1
0 89  0 6  0 12  -1
0
46 -1
-1
-1
1
3 18 -1
0 58  -1
0 46  0 3  0 18  -1
0
3 -1
-1
-1
1
6 12 89 64 -1
0 34  0 108  0 113  0 15  0 110  0 109  -1
0 89  0 6  0 12  -1
0
52 -1
-1
-1
1
3 19 -1
0 64  -1
0 3  0 52  0 19  -1
0
89 -1
-1
-1
1
15 58 9 19 -1
0 90  0 89  -1
0 15  0 34  0 9  -1
1
15 9 64 18 -1
0 90  0 89  -1
0 15  0 34  0 9  -1
0
34 -1
-1
-1
0
9 -1
-1
-1
1
19 58 15 90 -1
0 9  -1
0 90  -1
1
89 58 -1
0 34  0 15  -1
0 89  -1
1
18 64 15 90 -1
0 9  -1
0 90  -1
1
89 64 -1
0 34  0 15  -1
0 89  -1
1
15 19 58 88 -1
0 9  -1
0 88  -1
1
87 58 -1
0 33  0 15  -1
0 87  -1
1
15 64 18 88 -1
0 9  -1
0 88  -1
1
87 64 -1
0 33  0 15  -1
0 87  -1
0
87 -1
-1
-1
1
15 19 58 86 -1
0 9  -1
0 86  -1
1
85 58 -1
0 32  0 15  -1
0 85  -1
1
15 18 64 86 -1
0 9  -1
0 86  -1
1
85 64 -1
0 32  0 15  -1
0 85  -1
0
85 -1
-1
-1
1
15 58 19 84 -1
0 9  -1
0 84  -1
1
83 58 -1
0 31  0 15  -1
0 83  -1
1
15 18 64 84 -1
0 9  -1
0 84  -1
1
83 64 -1
0 31  0 15  -1
0 83  -1
0
83 -1
-1
-1
1
15 19 58 121 -1
0 9  -1
0 121  -1
1
120 58 -1
0 20  0 15  -1
0 120  -1
1
15 18 64 121 -1
0 9  -1
0 121  -1
1
120 64 -1
0 20  0 15  -1
0 120  -1
0
120 -1
-1
-1
0
121 -1
-1
-1
0
84 -1
-1
-1
0
86 -1
-1
-1
0
88 -1
-1
-1
0
90 -1
-1
-1
0
15 -1
-1
-1
1
6 81 12 57 -1
0 30  0 108  0 113  0 14  0 109  0 110  -1
0 81  0 6  0 12  -1
0
45 -1
-1
-1
1
2 18 -1
0 57  -1
0 2  0 45  0 18  -1
0
2 -1
-1
-1
1
12 6 81 63 -1
0 30  0 108  0 113  0 14  0 109  0 110  -1
0 81  0 6  0 12  -1
0
51 -1
-1
-1
1
2 19 -1
0 63  -1
0 2  0 51  0 19  -1
0
81 -1
-1
-1
1
8 57 14 19 -1
0 82  0 81  -1
0 14  0 30  0 8  -1
1
14 8 63 18 -1
0 82  0 81  -1
0 14  0 30  0 8  -1
0
30 -1
-1
-1
0
8 -1
-1
-1
1
14 19 57 82 -1
0 8  -1
0 82  -1
1
81 57 -1
0 30  0 14  -1
0 81  -1
1
14 18 63 82 -1
0 8  -1
0 82  -1
1
81 63 -1
0 30  0 14  -1
0 81  -1
1
14 19 57 76 -1
0 8  -1
0 76  -1
1
75 57 -1
0 27  0 14  -1
0 75  -1
1
14 18 63 76 -1
0 8  -1
0 76  -1
1
75 63 -1
0 27  0 14  -1
0 75  -1
0
75 -1
-1
-1
1
14 19 57 78 -1
0 8  -1
0 78  -1
1
77 57 -1
0 28  0 14  -1
0 77  -1
1
14 18 63 78 -1
0 8  -1
0 78  -1
1
77 63 -1
0 28  0 14  -1
0 77  -1
0
77 -1
-1
-1
1
14 19 57 80 -1
0 8  -1
0 80  -1
1
79 57 -1
0 29  0 14  -1
0 79  -1
1
14 18 63 80 -1
0 8  -1
0 80  -1
1
79 63 -1
0 29  0 14  -1
0 79  -1
0
79 -1
-1
-1
0
78 -1
-1
-1
0
76 -1
-1
-1
0
80 -1
-1
-1
0
82 -1
-1
-1
0
14 -1
-1
-1
1
6 12 97 59 -1
0 108  0 113  0 38  0 16  0 109  0 110  -1
0 6  0 97  0 12  -1
0
47 -1
-1
-1
1
4 18 -1
0 59  -1
0 4  0 47  0 18  -1
0
4 -1
-1
-1
1
6 12 97 65 -1
0 108  0 113  0 38  0 16  0 109  0 110  -1
0 6  0 97  0 12  -1
0
53 -1
-1
-1
1
4 19 -1
0 65  -1
0 53  0 4  0 19  -1
0
97 -1
-1
-1
1
10 16 59 19 -1
0 98  0 97  -1
0 16  0 38  0 10  -1
1
16 10 65 18 -1
0 98  0 97  -1
0 16  0 38  0 10  -1
0
38 -1
-1
-1
0
10 -1
-1
-1
1
19 59 16 96 -1
0 10  -1
0 96  -1
1
95 59 -1
0 37  0 16  -1
0 95  -1
1
18 65 16 96 -1
0 10  -1
0 96  -1
1
95 65 -1
0 37  0 16  -1
0 95  -1
0
95 -1
-1
-1
1
16 19 59 98 -1
0 10  -1
0 98  -1
1
97 59 -1
0 38  0 16  -1
0 97  -1
1
16 65 18 98 -1
0 10  -1
0 98  -1
1
97 65 -1
0 38  0 16  -1
0 97  -1
1
16 19 59 94 -1
0 10  -1
0 94  -1
1
93 59 -1
0 36  0 16  -1
0 93  -1
1
16 18 65 94 -1
0 10  -1
0 94  -1
1
93 65 -1
0 36  0 16  -1
0 93  -1
0
93 -1
-1
-1
1
16 19 59 92 -1
0 10  -1
0 92  -1
1
91 59 -1
0 35  0 16  -1
0 91  -1
1
16 18 65 92 -1
0 10  -1
0 92  -1
1
91 65 -1
0 35  0 16  -1
0 91  -1
0
91 -1
-1
-1
1
16 19 59 123 -1
0 10  -1
0 123  -1
1
122 59 -1
0 21  0 16  -1
0 122  -1
1
16 65 18 123 -1
0 10  -1
0 123  -1
1
122 65 -1
0 21  0 16  -1
0 122  -1
0
123 -1
-1
-1
0
94 -1
-1
-1
0
96 -1
-1
-1
0
98 -1
-1
-1
0
92 -1
-1
-1
0
16 -1
-1
-1
1
12 105 6 66 -1
0 42  0 108  0 113  0 17  0 109  0 110  -1
0 105  0 6  0 12  -1
0
54 -1
-1
-1
1
5 19 -1
0 66  -1
0 5  0 54  0 19  -1
0
5 -1
-1
-1
1
6 12 105 60 -1
0 42  0 108  0 113  0 17  0 109  0 110  -1
0 105  0 6  0 12  -1
0
48 -1
-1
-1
1
5 18 -1
0 60  -1
0 5  0 48  0 18  -1
0
105 -1
-1
-1
1
17 11 66 18 -1
0 106  0 105  -1
0 17  0 42  0 11  -1
1
11 17 60 19 -1
0 106  0 105  -1
0 17  0 42  0 11  -1
0
42 -1
-1
-1
0
11 -1
-1
-1
1
19 60 17 102 -1
0 11  -1
0 102  -1
1
101 60 -1
0 40  0 17  -1
0 101  -1
1
18 66 17 102 -1
0 11  -1
0 102  -1
1
101 66 -1
0 40  0 17  -1
0 101  -1
0
101 -1
-1
-1
1
17 60 19 104 -1
0 11  -1
0 104  -1
1
103 60 -1
0 41  0 17  -1
0 103  -1
1
17 18 66 104 -1
0 11  -1
0 104  -1
1
103 66 -1
0 41  0 17  -1
0 103  -1
0
103 -1
-1
-1
1
17 19 60 100 -1
0 11  -1
0 100  -1
1
99 60 -1
0 39  0 17  -1
0 99  -1
1
17 18 66 100 -1
0 11  -1
0 100  -1
1
99 66 -1
0 39  0 17  -1
0 99  -1
0
99 -1
-1
-1
1
17 60 19 119 -1
0 11  -1
0 119  -1
1
118 60 -1
0 22  0 17  -1
0 118  -1
1
17 18 66 119 -1
0 11  -1
0 119  -1
1
118 66 -1
0 22  0 17  -1
0 118  -1
0
118 -1
-1
-1
1
17 19 60 106 -1
0 11  -1
0 106  -1
1
105 60 -1
0 42  0 17  -1
0 105  -1
1
17 18 66 106 -1
0 11  -1
0 106  -1
1
105 66 -1
0 42  0 17  -1
0 105  -1
0
119 -1
-1
-1
0
100 -1
-1
-1
0
102 -1
-1
-1
0
106 -1
-1
-1
0
104 -1
-1
-1
0
17 -1
-1
-1
0
6 12 -1
-1
-1
1
56 73 108 -1
0 26  0 113  0 13  -1
0 73  -1
1
62 73 108 -1
0 26  0 113  0 13  -1
0 73  -1
1
89 58 108 -1
0 34  0 113  0 15  -1
0 89  -1
1
64 89 108 -1
0 34  0 113  0 15  -1
0 89  -1
1
57 81 108 -1
0 30  0 113  0 14  -1
0 81  -1
1
81 63 108 -1
0 30  0 113  0 14  -1
0 81  -1
1
59 97 108 -1
0 38  0 113  0 16  -1
0 97  -1
1
65 97 108 -1
0 38  0 113  0 16  -1
0 97  -1
1
66 105 108 -1
0 113  0 42  0 17  -1
0 105  -1
1
60 105 108 -1
0 113  0 42  0 17  -1
0 105  -1
0
110 -1
-1
-1
0
112 -1
-1
-1
1
12 6 71 56 -1
0 25  0 108  0 13  0 112  0 109  0 110  -1
0 71  0 6  0 12  -1
1
6 71 12 62 -1
0 25  0 108  0 13  0 112  0 109  0 110  -1
0 71  0 6  0 12  -1
1
7 13 56 19 -1
0 72  0 71  -1
0 13  0 25  0 7  -1
1
7 62 13 18 -1
0 72  0 71  -1
0 13  0 25  0 7  -1
0
25 -1
-1
-1
1
6 12 87 58 -1
0 108  0 112  0 15  0 33  0 110  0 109  -1
0 6  0 87  0 12  -1
1
6 12 87 64 -1
0 108  0 112  0 15  0 33  0 110  0 109  -1
0 6  0 87  0 12  -1
1
15 58 9 19 -1
0 88  0 87  -1
0 15  0 33  0 9  -1
1
15 9 64 18 -1
0 88  0 87  -1
0 15  0 33  0 9  -1
0
33 -1
-1
-1
1
6 79 12 57 -1
0 29  0 108  0 112  0 14  0 109  0 110  -1
0 79  0 6  0 12  -1
1
6 12 79 63 -1
0 29  0 108  0 112  0 14  0 109  0 110  -1
0 79  0 6  0 12  -1
1
8 57 14 19 -1
0 80  0 79  -1
0 14  0 29  0 8  -1
1
14 8 63 18 -1
0 80  0 79  -1
0 14  0 29  0 8  -1
0
29 -1
-1
-1
1
6 12 95 59 -1
0 37  0 108  0 112  0 16  0 109  0 110  -1
0 95  0 6  0 12  -1
1
6 12 95 65 -1
0 37  0 108  0 112  0 16  0 109  0 110  -1
0 95  0 6  0 12  -1
1
10 16 59 19 -1
0 96  0 95  -1
0 16  0 37  0 10  -1
1
16 10 65 18 -1
0 96  0 95  -1
0 16  0 37  0 10  -1
0
37 -1
-1
-1
1
12 103 6 66 -1
0 41  0 108  0 112  0 17  0 109  0 110  -1
0 103  0 6  0 12  -1
1
6 12 103 60 -1
0 41  0 108  0 112  0 17  0 109  0 110  -1
0 103  0 6  0 12  -1
1
17 11 66 18 -1
0 104  0 103  -1
0 17  0 41  0 11  -1
1
11 17 60 19 -1
0 104  0 103  -1
0 17  0 41  0 11  -1
0
41 -1
-1
-1
1
56 71 108 -1
0 25  0 112  0 13  -1
0 71  -1
1
62 71 108 -1
0 25  0 112  0 13  -1
0 71  -1
1
87 58 108 -1
0 33  0 112  0 15  -1
0 87  -1
1
64 87 108 -1
0 33  0 112  0 15  -1
0 87  -1
1
57 79 108 -1
0 112  0 29  0 14  -1
0 79  -1
1
79 63 108 -1
0 112  0 29  0 14  -1
0 79  -1
1
59 95 108 -1
0 37  0 112  0 16  -1
0 95  -1
1
65 95 108 -1
0 37  0 112  0 16  -1
0 95  -1
1
66 103 108 -1
0 41  0 112  0 17  -1
0 103  -1
1
60 103 108 -1
0 41  0 112  0 17  -1
0 103  -1
0
6 -1
-1
-1
1
12 55 19 -1
0 6  -1
0 109  -1
1
12 61 18 -1
0 6  -1
0 109  -1
0
12 109 -1
-1
-1
1
114 55 117 -1
0 108  0 12  -1
0 114  0 110  0 117  -1
1
114 55 116 -1
0 108  0 12  -1
0 114  0 110  0 116  -1
0
116 -1
-1
-1
1
114 55 115 -1
0 108  0 12  -1
0 114  0 110  0 115  -1
0
115 -1
-1
-1
1
114 61 117 -1
0 108  0 12  -1
0 114  0 110  0 117  -1
1
114 61 116 -1
0 108  0 12  -1
0 114  0 110  0 116  -1
1
114 61 115 -1
0 108  0 12  -1
0 114  0 110  0 115  -1
0
114 -1
-1
-1
0
15 116 61 9 114 -1
-1
-1
1
15 9 114 61 116 -1
0 121  0 120  -1
0 15  0 20  0 9  -1
0
116 15 55 9 114 -1
-1
-1
1
9 114 15 55 116 -1
0 121  0 120  -1
0 15  0 20  0 9  -1
0
20 -1
-1
-1
1
19 108 111 55 107 -1
0 116  0 114  -1
0 111  0 108  0 107  -1
1
18 108 111 61 107 -1
0 116  0 114  -1
0 111  0 108  0 107  -1
0
111 -1
-1
-1
1
12 69 6 56 -1
0 108  0 24  0 13  0 111  0 109  0 110  -1
0 69  0 6  0 12  -1
1
6 69 12 62 -1
0 108  0 24  0 13  0 111  0 109  0 110  -1
0 69  0 6  0 12  -1
1
7 13 56 19 -1
0 70  0 69  -1
0 13  0 24  0 7  -1
1
7 62 13 18 -1
0 70  0 69  -1
0 13  0 24  0 7  -1
0
24 -1
-1
-1
1
6 12 85 58 -1
0 108  0 111  0 15  0 110  0 32  0 109  -1
0 85  0 6  0 12  -1
1
6 12 85 64 -1
0 108  0 111  0 15  0 110  0 32  0 109  -1
0 85  0 6  0 12  -1
1
15 58 9 19 -1
0 86  0 85  -1
0 15  0 32  0 9  -1
1
15 9 64 18 -1
0 86  0 85  -1
0 15  0 32  0 9  -1
0
32 -1
-1
-1
1
6 12 77 57 -1
0 28  0 108  0 111  0 14  0 109  0 110  -1
0 6  0 77  0 12  -1
1
6 12 77 63 -1
0 28  0 108  0 111  0 14  0 109  0 110  -1
0 6  0 77  0 12  -1
1
8 57 14 19 -1
0 78  0 77  -1
0 14  0 28  0 8  -1
1
14 8 63 18 -1
0 78  0 77  -1
0 14  0 28  0 8  -1
0
28 -1
-1
-1
1
6 12 93 59 -1
0 36  0 108  0 111  0 16  0 109  0 110  -1
0 93  0 6  0 12  -1
1
6 12 93 65 -1
0 36  0 108  0 111  0 16  0 109  0 110  -1
0 93  0 6  0 12  -1
1
16 10 65 18 -1
0 94  0 93  -1
0 16  0 36  0 10  -1
1
10 16 59 19 -1
0 94  0 93  -1
0 16  0 36  0 10  -1
0
36 -1
-1
-1
1
12 6 101 66 -1
0 40  0 108  0 111  0 17  0 109  0 110  -1
0 101  0 6  0 12  -1
1
12 6 101 60 -1
0 40  0 108  0 111  0 17  0 109  0 110  -1
0 101  0 6  0 12  -1
1
17 11 66 18 -1
0 102  0 101  -1
0 17  0 40  0 11  -1
1
11 17 60 19 -1
0 102  0 101  -1
0 17  0 40  0 11  -1
0
40 -1
-1
-1
1
56 69 108 -1
0 24  0 111  0 13  -1
0 69  -1
1
62 69 108 -1
0 24  0 111  0 13  -1
0 69  -1
1
85 58 108 -1
0 32  0 111  0 15  -1
0 85  -1
1
64 85 108 -1
0 32  0 111  0 15  -1
0 85  -1
1
57 77 108 -1
0 28  0 111  0 14  -1
0 77  -1
1
77 63 108 -1
0 28  0 111  0 14  -1
0 77  -1
1
59 93 108 -1
0 36  0 111  0 16  -1
0 93  -1
1
65 93 108 -1
0 36  0 111  0 16  -1
0 93  -1
1
66 101 108 -1
0 40  0 111  0 17  -1
0 101  -1
1
60 101 108 -1
0 40  0 111  0 17  -1
0 101  -1
0
107 -1
-1
-1
1
12 67 6 56 -1
0 23  0 108  0 13  0 107  0 109  0 110  -1
0 6  0 67  0 12  -1
1
6 12 67 62 -1
0 23  0 108  0 13  0 107  0 109  0 110  -1
0 6  0 67  0 12  -1
1
7 13 56 19 -1
0 68  0 67  -1
0 13  0 23  0 7  -1
1
7 62 13 18 -1
0 68  0 67  -1
0 13  0 23  0 7  -1
0
23 -1
-1
-1
1
6 12 83 58 -1
0 31  0 108  0 107  0 15  0 110  0 109  -1
0 83  0 6  0 12  -1
1
6 12 83 64 -1
0 31  0 108  0 107  0 15  0 110  0 109  -1
0 83  0 6  0 12  -1
1
15 58 9 19 -1
0 84  0 83  -1
0 15  0 31  0 9  -1
1
15 9 64 18 -1
0 84  0 83  -1
0 15  0 31  0 9  -1
0
31 -1
-1
-1
1
6 75 12 57 -1
0 27  0 108  0 107  0 14  0 109  0 110  -1
0 75  0 6  0 12  -1
1
6 12 75 63 -1
0 27  0 108  0 107  0 14  0 109  0 110  -1
0 75  0 6  0 12  -1
1
8 57 14 19 -1
0 76  0 75  -1
0 14  0 27  0 8  -1
1
14 8 63 18 -1
0 76  0 75  -1
0 14  0 27  0 8  -1
0
27 -1
-1
-1
1
12 6 91 59 -1
0 35  0 108  0 107  0 16  0 109  0 110  -1
0 91  0 6  0 12  -1
1
12 6 91 65 -1
0 35  0 108  0 107  0 16  0 109  0 110  -1
0 91  0 6  0 12  -1
1
16 10 65 18 -1
0 92  0 91  -1
0 16  0 35  0 10  -1
1
10 16 59 19 -1
0 92  0 91  -1
0 16  0 35  0 10  -1
0
35 -1
-1
-1
1
12 99 6 66 -1
0 108  0 107  0 39  0 17  0 109  0 110  -1
0 99  0 6  0 12  -1
1
6 12 99 60 -1
0 108  0 107  0 39  0 17  0 109  0 110  -1
0 99  0 6  0 12  -1
1
17 11 66 18 -1
0 100  0 99  -1
0 17  0 39  0 11  -1
1
11 17 60 19 -1
0 100  0 99  -1
0 17  0 39  0 11  -1
0
39 -1
-1
-1
1
56 67 108 -1
0 107  0 23  0 13  -1
0 67  -1
1
62 67 108 -1
0 107  0 23  0 13  -1
0 67  -1
1
58 83 108 -1
0 31  0 107  0 15  -1
0 83  -1
1
64 83 108 -1
0 31  0 107  0 15  -1
0 83  -1
1
57 75 108 -1
0 27  0 107  0 14  -1
0 75  -1
1
75 63 108 -1
0 27  0 107  0 14  -1
0 75  -1
1
59 91 108 -1
0 35  0 107  0 16  -1
0 91  -1
1
65 91 108 -1
0 35  0 107  0 16  -1
0 91  -1
1
66 99 108 -1
0 39  0 107  0 17  -1
0 99  -1
1
60 99 108 -1
0 39  0 107  0 17  -1
0 99  -1
0
17 115 11 61 114 -1
-1
-1
1
17 114 11 61 115 -1
0 119  0 118  -1
0 17  0 22  0 11  -1
0
11 17 115 55 114 -1
-1
-1
1
17 11 114 55 115 -1
0 119  0 118  -1
0 17  0 22  0 11  -1
0
22 -1
-1
-1
1
19 108 107 55 111 -1
0 115  0 114  -1
0 107  0 108  0 111  -1
1
18 108 107 61 111 -1
0 115  0 114  -1
0 107  0 108  0 111  -1

;; initial state
54 53 52 51 50 49 48 47 20 17 34 16 15 33 14 32 13 31 12 30 11 4 24 3 23 2 21 18 39 0 22 19 40 1 5 25 6 7 26 8 27 9 28 10 29 35 36 37 38 41 42 43 44 45 46 -1

;; goal
-1

;; tasks (primitive and abstract)
559
0 __method_precondition_MakeAndPourCocktailNull[shot4,cocktail3]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot4,cocktail3,level1,right,level1]
0 pour-shaker-to-shot[cocktail3,shot4,right,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot4,cocktail3,level1,left,level1]
0 pour-shaker-to-shot[cocktail3,shot4,left,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot4,cocktail3]
0 __method_precondition_MakeCocktailNull[shaker1,cocktail3]
0 shake[cocktail3,ingredient3,ingredient5,shaker1,left,right]
0 __method_precondition_EmptyHand[right,shot1]
0 drop[right,shot1]
0 __method_precondition_EmptyHand[right,shot2]
0 drop[right,shot2]
0 __method_precondition_EmptyHand[right,shaker1]
0 drop[right,shaker1]
0 __method_precondition_EmptyHand[right,shot3]
0 drop[right,shot3]
0 __method_precondition_EmptyHand[right,shot4]
0 drop[right,shot4]
0 __method_precondition_EmptyHand[right,shot5]
0 drop[right,shot5]
0 __method_precondition_HandEmptyNull[right]
0 __method_precondition_HandEmptyNull[left]
0 __method_precondition_HoldingNull[left,shaker1]
0 __method_precondition_PickUp[left,shaker1]
0 grasp[left,shaker1]
0 drop[left,shaker1]
0 __method_precondition_OnTableNull[shaker1]
0 __method_precondition_EmptyHand[left,shot5]
0 drop[left,shot5]
0 __method_precondition_EmptyHand[left,shot1]
0 drop[left,shot1]
0 __method_precondition_EmptyHand[left,shot4]
0 drop[left,shot4]
0 __method_precondition_EmptyHand[left,shot2]
0 drop[left,shot2]
0 __method_precondition_EmptyHand[left,shot3]
0 drop[left,shot3]
0 shake[cocktail3,ingredient3,ingredient5,shaker1,right,left]
0 __method_precondition_PickUp[right,shaker1]
0 grasp[right,shaker1]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient5]
0 pour-shot-to-clean-shaker[shot1,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot1]
0 grasp[left,shot1]
0 __method_precondition_OnTableNull[shot1]
0 pour-shot-to-clean-shaker[shot1,ingredient5,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot1]
0 grasp[right,shot1]
0 __method_precondition_AddIngredientToShotNull[shot1,ingredient5]
0 fill-shot[shot1,ingredient5,left,right,dispenser5]
0 fill-shot[shot1,ingredient5,right,left,dispenser5]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient5]
0 __method_precondition_CleanShotNull[shot1]
0 clean-shot[shot1,ingredient3,left,right]
0 empty-shot[left,shot1,ingredient3]
0 clean-shot[shot1,ingredient3,right,left]
0 empty-shot[right,shot1,ingredient3]
0 __method_precondition_CleanFullShot_base[shot1,ingredient3]
0 clean-shot[shot1,ingredient2,left,right]
0 empty-shot[left,shot1,ingredient2]
0 clean-shot[shot1,ingredient2,right,left]
0 empty-shot[right,shot1,ingredient2]
0 __method_precondition_CleanFullShot_base[shot1,ingredient2]
0 clean-shot[shot1,ingredient1,left,right]
0 empty-shot[left,shot1,ingredient1]
0 clean-shot[shot1,ingredient1,right,left]
0 empty-shot[right,shot1,ingredient1]
0 __method_precondition_CleanFullShot_base[shot1,ingredient1]
0 clean-shot[shot1,ingredient5,left,right]
0 empty-shot[left,shot1,ingredient5]
0 clean-shot[shot1,ingredient5,right,left]
0 empty-shot[right,shot1,ingredient5]
0 __method_precondition_CleanEmptyShot_split[shot1,right,ingredient5,left]
0 __method_precondition_CleanEmptyShot_split[shot1,right,ingredient3,left]
0 __method_precondition_CleanEmptyShot_split[shot1,right,ingredient2,left]
0 __method_precondition_CleanEmptyShot_split[shot1,right,ingredient1,left]
0 __method_precondition_CleanEmptyShot_base[shot1]
0 pour-shot-to-clean-shaker[shot3,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot3]
0 grasp[left,shot3]
0 __method_precondition_OnTableNull[shot3]
0 pour-shot-to-clean-shaker[shot3,ingredient5,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot3]
0 grasp[right,shot3]
0 __method_precondition_AddIngredientToShotNull[shot3,ingredient5]
0 fill-shot[shot3,ingredient5,left,right,dispenser5]
0 fill-shot[shot3,ingredient5,right,left,dispenser5]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient5]
0 __method_precondition_CleanShotNull[shot3]
0 clean-shot[shot3,ingredient5,left,right]
0 empty-shot[left,shot3,ingredient5]
0 clean-shot[shot3,ingredient5,right,left]
0 empty-shot[right,shot3,ingredient5]
0 clean-shot[shot3,ingredient3,left,right]
0 empty-shot[left,shot3,ingredient3]
0 clean-shot[shot3,ingredient3,right,left]
0 empty-shot[right,shot3,ingredient3]
0 __method_precondition_CleanFullShot_base[shot3,ingredient3]
0 clean-shot[shot3,ingredient2,left,right]
0 empty-shot[left,shot3,ingredient2]
0 clean-shot[shot3,ingredient2,right,left]
0 empty-shot[right,shot3,ingredient2]
0 __method_precondition_CleanFullShot_base[shot3,ingredient2]
0 clean-shot[shot3,ingredient1,left,right]
0 empty-shot[left,shot3,ingredient1]
0 clean-shot[shot3,ingredient1,right,left]
0 empty-shot[right,shot3,ingredient1]
0 __method_precondition_CleanFullShot_base[shot3,ingredient1]
0 clean-shot[shot3,cocktail2,left,right]
0 empty-shot[left,shot3,cocktail2]
0 clean-shot[shot3,cocktail2,right,left]
0 empty-shot[right,shot3,cocktail2]
0 __method_precondition_CleanFullShot_base[shot3,cocktail2]
0 __method_precondition_CleanEmptyShot_split[shot3,right,cocktail2,left]
0 __method_precondition_CleanEmptyShot_split[shot3,right,ingredient1,left]
0 __method_precondition_CleanEmptyShot_split[shot3,right,ingredient2,left]
0 __method_precondition_CleanEmptyShot_split[shot3,right,ingredient3,left]
0 __method_precondition_CleanEmptyShot_split[shot3,right,ingredient5,left]
0 __method_precondition_CleanEmptyShot_base[shot3]
0 pour-shot-to-clean-shaker[shot2,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot2]
0 grasp[left,shot2]
0 __method_precondition_OnTableNull[shot2]
0 pour-shot-to-clean-shaker[shot2,ingredient5,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot2]
0 grasp[right,shot2]
0 __method_precondition_AddIngredientToShotNull[shot2,ingredient5]
0 fill-shot[shot2,ingredient5,left,right,dispenser5]
0 fill-shot[shot2,ingredient5,right,left,dispenser5]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient5]
0 __method_precondition_CleanShotNull[shot2]
0 clean-shot[shot2,ingredient5,left,right]
0 empty-shot[left,shot2,ingredient5]
0 clean-shot[shot2,ingredient5,right,left]
0 empty-shot[right,shot2,ingredient5]
0 clean-shot[shot2,ingredient1,left,right]
0 empty-shot[left,shot2,ingredient1]
0 clean-shot[shot2,ingredient1,right,left]
0 empty-shot[right,shot2,ingredient1]
0 __method_precondition_CleanFullShot_base[shot2,ingredient1]
0 clean-shot[shot2,ingredient2,left,right]
0 empty-shot[left,shot2,ingredient2]
0 clean-shot[shot2,ingredient2,right,left]
0 empty-shot[right,shot2,ingredient2]
0 __method_precondition_CleanFullShot_base[shot2,ingredient2]
0 clean-shot[shot2,ingredient3,left,right]
0 empty-shot[left,shot2,ingredient3]
0 clean-shot[shot2,ingredient3,right,left]
0 empty-shot[right,shot2,ingredient3]
0 __method_precondition_CleanFullShot_base[shot2,ingredient3]
0 __method_precondition_CleanEmptyShot_split[shot2,right,ingredient2,left]
0 __method_precondition_CleanEmptyShot_split[shot2,right,ingredient1,left]
0 __method_precondition_CleanEmptyShot_split[shot2,right,ingredient3,left]
0 __method_precondition_CleanEmptyShot_split[shot2,right,ingredient5,left]
0 __method_precondition_CleanEmptyShot_base[shot2]
0 pour-shot-to-clean-shaker[shot4,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot4]
0 grasp[left,shot4]
0 __method_precondition_OnTableNull[shot4]
0 pour-shot-to-clean-shaker[shot4,ingredient5,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot4]
0 grasp[right,shot4]
0 __method_precondition_AddIngredientToShotNull[shot4,ingredient5]
0 fill-shot[shot4,ingredient5,left,right,dispenser5]
0 fill-shot[shot4,ingredient5,right,left,dispenser5]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient5]
0 __method_precondition_CleanShotNull[shot4]
0 clean-shot[shot4,ingredient3,left,right]
0 empty-shot[left,shot4,ingredient3]
0 clean-shot[shot4,ingredient3,right,left]
0 empty-shot[right,shot4,ingredient3]
0 __method_precondition_CleanFullShot_base[shot4,ingredient3]
0 clean-shot[shot4,ingredient5,left,right]
0 empty-shot[left,shot4,ingredient5]
0 clean-shot[shot4,ingredient5,right,left]
0 empty-shot[right,shot4,ingredient5]
0 clean-shot[shot4,ingredient2,left,right]
0 empty-shot[left,shot4,ingredient2]
0 clean-shot[shot4,ingredient2,right,left]
0 empty-shot[right,shot4,ingredient2]
0 __method_precondition_CleanFullShot_base[shot4,ingredient2]
0 clean-shot[shot4,ingredient1,left,right]
0 empty-shot[left,shot4,ingredient1]
0 clean-shot[shot4,ingredient1,right,left]
0 empty-shot[right,shot4,ingredient1]
0 __method_precondition_CleanFullShot_base[shot4,ingredient1]
0 clean-shot[shot4,cocktail3,left,right]
0 empty-shot[left,shot4,cocktail3]
0 clean-shot[shot4,cocktail3,right,left]
0 empty-shot[right,shot4,cocktail3]
0 __method_precondition_CleanEmptyShot_split[shot4,right,cocktail3,left]
0 __method_precondition_CleanEmptyShot_split[shot4,right,ingredient2,left]
0 __method_precondition_CleanEmptyShot_split[shot4,right,ingredient3,left]
0 __method_precondition_CleanEmptyShot_split[shot4,right,ingredient5,left]
0 __method_precondition_CleanEmptyShot_split[shot4,right,ingredient1,left]
0 __method_precondition_CleanEmptyShot_base[shot4]
0 pour-shot-to-clean-shaker[shot5,ingredient5,shaker1,right,level1,level1]
0 __method_precondition_PickUp[right,shot5]
0 grasp[right,shot5]
0 __method_precondition_OnTableNull[shot5]
0 pour-shot-to-clean-shaker[shot5,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_PickUp[left,shot5]
0 grasp[left,shot5]
0 __method_precondition_AddIngredientToShotNull[shot5,ingredient5]
0 fill-shot[shot5,ingredient5,right,left,dispenser5]
0 fill-shot[shot5,ingredient5,left,right,dispenser5]
0 __method_precondition_AddIngredientToShot_base_base[shot5,ingredient5]
0 __method_precondition_CleanShotNull[shot5]
0 clean-shot[shot5,ingredient2,left,right]
0 empty-shot[left,shot5,ingredient2]
0 clean-shot[shot5,ingredient2,right,left]
0 empty-shot[right,shot5,ingredient2]
0 __method_precondition_CleanFullShot_base[shot5,ingredient2]
0 clean-shot[shot5,ingredient3,left,right]
0 empty-shot[left,shot5,ingredient3]
0 clean-shot[shot5,ingredient3,right,left]
0 empty-shot[right,shot5,ingredient3]
0 __method_precondition_CleanFullShot_base[shot5,ingredient3]
0 clean-shot[shot5,ingredient1,left,right]
0 empty-shot[left,shot5,ingredient1]
0 clean-shot[shot5,ingredient1,right,left]
0 empty-shot[right,shot5,ingredient1]
0 __method_precondition_CleanFullShot_base[shot5,ingredient1]
0 clean-shot[shot5,cocktail1,left,right]
0 empty-shot[left,shot5,cocktail1]
0 clean-shot[shot5,cocktail1,right,left]
0 empty-shot[right,shot5,cocktail1]
0 __method_precondition_CleanFullShot_base[shot5,cocktail1]
0 clean-shot[shot5,ingredient5,left,right]
0 empty-shot[left,shot5,ingredient5]
0 clean-shot[shot5,ingredient5,right,left]
0 empty-shot[right,shot5,ingredient5]
0 __method_precondition_CleanEmptyShot_split[shot5,right,cocktail1,left]
0 __method_precondition_CleanEmptyShot_split[shot5,right,ingredient1,left]
0 __method_precondition_CleanEmptyShot_split[shot5,right,ingredient2,left]
0 __method_precondition_CleanEmptyShot_split[shot5,right,ingredient5,left]
0 __method_precondition_CleanEmptyShot_split[shot5,right,ingredient3,left]
0 __method_precondition_CleanEmptyShot_base[shot5]
0 __method_precondition_AddIngredientToEmptyShaker[shaker1,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient5,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient5,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient5,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient5,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient5,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient5,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient5,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient5,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient5,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient5,shaker1,left,level1,level1]
0 __method_precondition_AddIngredientToUsedShaker[shaker1,level1,level1]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient3]
0 pour-shot-to-clean-shaker[shot1,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot1,ingredient3,shaker1,right,level1,level1]
0 fill-shot[shot1,ingredient3,left,right,dispenser3]
0 fill-shot[shot1,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient3]
0 pour-shot-to-clean-shaker[shot3,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot3,ingredient3,shaker1,right,level1,level1]
0 fill-shot[shot3,ingredient3,left,right,dispenser3]
0 fill-shot[shot3,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient3]
0 pour-shot-to-clean-shaker[shot2,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot2,ingredient3,shaker1,right,level1,level1]
0 fill-shot[shot2,ingredient3,left,right,dispenser3]
0 fill-shot[shot2,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient3]
0 pour-shot-to-clean-shaker[shot4,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot4,ingredient3,shaker1,right,level1,level1]
0 fill-shot[shot4,ingredient3,left,right,dispenser3]
0 fill-shot[shot4,ingredient3,right,left,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient3]
0 pour-shot-to-clean-shaker[shot5,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot5,ingredient3,shaker1,left,level1,level1]
0 fill-shot[shot5,ingredient3,right,left,dispenser3]
0 fill-shot[shot5,ingredient3,left,right,dispenser3]
0 __method_precondition_AddIngredientToShot_base_base[shot5,ingredient3]
0 pour-shot-to-used-shaker[shot1,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient3,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient3,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient3,shaker1,left,level1,level1]
0 __method_precondition_CleanShakerNull[shaker1]
0 clean-shaker[shaker1,left,right]
0 clean-shaker[shaker1,right,left]
0 __method_precondition_CleanEmptyShaker_base[shaker1]
0 empty-shaker[left,shaker1,cocktail3,level1,level1]
0 empty-shaker[left,shaker1,cocktail2,level1,level1]
0 __method_precondition_CleanFullShaker_split[shaker1,level1,cocktail2,level1]
0 empty-shaker[left,shaker1,cocktail1,level1,level1]
0 __method_precondition_CleanFullShaker_split[shaker1,level1,cocktail1,level1]
0 empty-shaker[right,shaker1,cocktail3,level1,level1]
0 empty-shaker[right,shaker1,cocktail2,level1,level1]
0 empty-shaker[right,shaker1,cocktail1,level1,level1]
0 __method_precondition_CleanFullShaker_base_base[shaker1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot3,cocktail2,level1,right,level1]
0 pour-shaker-to-shot[cocktail2,shot3,right,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot3,cocktail2,level1,left,level1]
0 pour-shaker-to-shot[cocktail2,shot3,left,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot3,cocktail2]
0 shake[cocktail2,ingredient1,ingredient2,shaker1,left,right]
0 shake[cocktail2,ingredient1,ingredient2,shaker1,right,left]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient2]
0 pour-shot-to-clean-shaker[shot1,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot1,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot1,ingredient2,left,right,dispenser2]
0 fill-shot[shot1,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient2]
0 pour-shot-to-clean-shaker[shot3,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot3,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot3,ingredient2,left,right,dispenser2]
0 fill-shot[shot3,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient2]
0 pour-shot-to-clean-shaker[shot2,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot2,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot2,ingredient2,left,right,dispenser2]
0 fill-shot[shot2,ingredient2,right,left,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient2]
0 pour-shot-to-clean-shaker[shot4,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot4,ingredient2,shaker1,right,level1,level1]
0 fill-shot[shot4,ingredient2,right,left,dispenser2]
0 fill-shot[shot4,ingredient2,left,right,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient2]
0 pour-shot-to-clean-shaker[shot5,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot5,ingredient2,shaker1,left,level1,level1]
0 fill-shot[shot5,ingredient2,right,left,dispenser2]
0 fill-shot[shot5,ingredient2,left,right,dispenser2]
0 __method_precondition_AddIngredientToShot_base_base[shot5,ingredient2]
0 pour-shot-to-used-shaker[shot1,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient2,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient2,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient2,shaker1,left,level1,level1]
0 __method_precondition_AddIngredientToShakerNull[shaker1,ingredient1]
0 pour-shot-to-clean-shaker[shot1,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot1,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot1,ingredient1,left,right,dispenser1]
0 fill-shot[shot1,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot1,ingredient1]
0 pour-shot-to-clean-shaker[shot3,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot3,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot3,ingredient1,left,right,dispenser1]
0 fill-shot[shot3,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot3,ingredient1]
0 pour-shot-to-clean-shaker[shot2,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot2,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot2,ingredient1,left,right,dispenser1]
0 fill-shot[shot2,ingredient1,right,left,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot2,ingredient1]
0 pour-shot-to-clean-shaker[shot4,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-clean-shaker[shot4,ingredient1,shaker1,right,level1,level1]
0 fill-shot[shot4,ingredient1,right,left,dispenser1]
0 fill-shot[shot4,ingredient1,left,right,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot4,ingredient1]
0 pour-shot-to-clean-shaker[shot5,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-clean-shaker[shot5,ingredient1,shaker1,left,level1,level1]
0 fill-shot[shot5,ingredient1,right,left,dispenser1]
0 fill-shot[shot5,ingredient1,left,right,dispenser1]
0 __method_precondition_AddIngredientToShot_base_base[shot5,ingredient1]
0 pour-shot-to-used-shaker[shot1,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot1,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot3,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot2,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient1,shaker1,left,level1,level1]
0 pour-shot-to-used-shaker[shot4,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient1,shaker1,right,level1,level1]
0 pour-shot-to-used-shaker[shot5,ingredient1,shaker1,left,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot5,cocktail1,level1,right,level1]
0 pour-shaker-to-shot[cocktail1,shot5,right,shaker1,level1,level1]
0 __method_precondition_pour_shaker_to_shot_action[shaker1,shot5,cocktail1,level1,left,level1]
0 pour-shaker-to-shot[cocktail1,shot5,left,shaker1,level1,level1]
0 __method_precondition_MakeAndPourCocktail[shot5,cocktail1]
0 shake[cocktail1,ingredient2,ingredient1,shaker1,left,right]
0 shake[cocktail1,ingredient2,ingredient1,shaker1,right,left]
1 __top[]
1 AchieveContainsShotCocktail[shot4,cocktail3]
1 DoPourShakerToShot[shaker1,shot4,cocktail3]
1 AchieveContainsShakerCocktail[shaker1,cocktail3]
1 MakeCocktail_splitted_14[shaker1,cocktail3,ingredient3,ingredient5]
1 AchieveHandEmpty[right]
1 AchieveHolding[left,shaker1]
1 AchieveOnTable[shaker1]
1 AchieveHandEmpty[left]
1 AchieveHolding[right,shaker1]
1 AchieveContainsShakerIngredient[shaker1,ingredient5]
1 AddIngredientToEmptyShaker_splitted_6[ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient5,shaker1,level1,level1]
1 AchieveHolding[left,shot1]
1 AchieveOnTable[shot1]
1 AchieveHolding[right,shot1]
1 AchieveContainsShotIngredient[shot1,ingredient5]
1 AddIngredientToShot_splitted_20[shot1,ingredient5]
1 AchieveCleanShot[shot1]
1 CleanFullShot_splitted_12[shot1,ingredient3]
1 CleanFullShot_splitted_12[shot1,ingredient2]
1 CleanFullShot_splitted_12[shot1,ingredient1]
1 CleanFullShot_splitted_12[shot1,ingredient5]
1 CleanEmptyShot_splitted_13[shot1]
1 CleanEmptyShot_splitted_4[shot1,left]
1 CleanEmptyShot_splitted_4[shot1,right]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient5,shaker1,level1,level1]
1 AchieveHolding[left,shot3]
1 AchieveOnTable[shot3]
1 AchieveHolding[right,shot3]
1 AchieveContainsShotIngredient[shot3,ingredient5]
1 AddIngredientToShot_splitted_20[shot3,ingredient5]
1 AchieveCleanShot[shot3]
1 CleanFullShot_splitted_12[shot3,ingredient5]
1 CleanFullShot_splitted_12[shot3,ingredient3]
1 CleanFullShot_splitted_12[shot3,ingredient2]
1 CleanFullShot_splitted_12[shot3,ingredient1]
1 CleanFullShot_splitted_12[shot3,cocktail2]
1 CleanEmptyShot_splitted_13[shot3]
1 CleanEmptyShot_splitted_4[shot3,left]
1 CleanEmptyShot_splitted_4[shot3,right]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient5,shaker1,level1,level1]
1 AchieveHolding[left,shot2]
1 AchieveOnTable[shot2]
1 AchieveHolding[right,shot2]
1 AchieveContainsShotIngredient[shot2,ingredient5]
1 AddIngredientToShot_splitted_20[shot2,ingredient5]
1 AchieveCleanShot[shot2]
1 CleanFullShot_splitted_12[shot2,ingredient5]
1 CleanFullShot_splitted_12[shot2,ingredient1]
1 CleanFullShot_splitted_12[shot2,ingredient2]
1 CleanFullShot_splitted_12[shot2,ingredient3]
1 CleanEmptyShot_splitted_13[shot2]
1 CleanEmptyShot_splitted_4[shot2,left]
1 CleanEmptyShot_splitted_4[shot2,right]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient5,shaker1,level1,level1]
1 AchieveHolding[left,shot4]
1 AchieveOnTable[shot4]
1 AchieveHolding[right,shot4]
1 AchieveContainsShotIngredient[shot4,ingredient5]
1 AddIngredientToShot_splitted_20[shot4,ingredient5]
1 AchieveCleanShot[shot4]
1 CleanFullShot_splitted_12[shot4,ingredient3]
1 CleanFullShot_splitted_12[shot4,ingredient5]
1 CleanFullShot_splitted_12[shot4,ingredient2]
1 CleanFullShot_splitted_12[shot4,ingredient1]
1 CleanFullShot_splitted_12[shot4,cocktail3]
1 CleanEmptyShot_splitted_13[shot4]
1 CleanEmptyShot_splitted_4[shot4,left]
1 CleanEmptyShot_splitted_4[shot4,right]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot5,ingredient5,shaker1,level1,level1]
1 AchieveHolding[right,shot5]
1 AchieveOnTable[shot5]
1 AchieveHolding[left,shot5]
1 AchieveContainsShotIngredient[shot5,ingredient5]
1 AddIngredientToShot_splitted_20[shot5,ingredient5]
1 AchieveCleanShot[shot5]
1 CleanFullShot_splitted_12[shot5,ingredient2]
1 CleanFullShot_splitted_12[shot5,ingredient3]
1 CleanFullShot_splitted_12[shot5,ingredient1]
1 CleanFullShot_splitted_12[shot5,cocktail1]
1 CleanFullShot_splitted_12[shot5,ingredient5]
1 CleanEmptyShot_splitted_13[shot5]
1 CleanEmptyShot_splitted_4[shot5,left]
1 CleanEmptyShot_splitted_4[shot5,right]
1 AddIngredientToUsedShaker_splitted_7[ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient5,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot5,ingredient5,shaker1,level1,level1]
1 AchieveContainsShakerIngredient[shaker1,ingredient3]
1 AddIngredientToEmptyShaker_splitted_6[ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient3,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot1,ingredient3]
1 AddIngredientToShot_splitted_20[shot1,ingredient3]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient3,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot3,ingredient3]
1 AddIngredientToShot_splitted_20[shot3,ingredient3]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient3,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot2,ingredient3]
1 AddIngredientToShot_splitted_20[shot2,ingredient3]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient3,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot4,ingredient3]
1 AddIngredientToShot_splitted_20[shot4,ingredient3]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot5,ingredient3,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot5,ingredient3]
1 AddIngredientToShot_splitted_20[shot5,ingredient3]
1 AddIngredientToUsedShaker_splitted_7[ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient3,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot5,ingredient3,shaker1,level1,level1]
1 AchieveCleanShaker[shaker1]
1 CleanEmptyShaker_splitted_10[shaker1]
1 CleanFullShaker_splitted_18[shaker1]
1 CleanFullShaker_splitted_2[left,shaker1]
1 CleanFullShaker_splitted_2[right,shaker1]
1 MakeAndPourCocktail_splitted_8[shaker1]
1 AchieveContainsShotCocktail[shot3,cocktail2]
1 DoPourShakerToShot[shaker1,shot3,cocktail2]
1 AchieveContainsShakerCocktail[shaker1,cocktail2]
1 MakeCocktail_splitted_14[shaker1,cocktail2,ingredient1,ingredient2]
1 AchieveContainsShakerIngredient[shaker1,ingredient2]
1 AddIngredientToEmptyShaker_splitted_6[ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot1,ingredient2]
1 AddIngredientToShot_splitted_20[shot1,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot3,ingredient2]
1 AddIngredientToShot_splitted_20[shot3,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot2,ingredient2]
1 AddIngredientToShot_splitted_20[shot2,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot4,ingredient2]
1 AddIngredientToShot_splitted_20[shot4,ingredient2]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot5,ingredient2,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot5,ingredient2]
1 AddIngredientToShot_splitted_20[shot5,ingredient2]
1 AddIngredientToUsedShaker_splitted_7[ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient2,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot5,ingredient2,shaker1,level1,level1]
1 AchieveContainsShakerIngredient[shaker1,ingredient1]
1 AddIngredientToEmptyShaker_splitted_6[ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot1,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot1,ingredient1]
1 AddIngredientToShot_splitted_20[shot1,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot3,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot3,ingredient1]
1 AddIngredientToShot_splitted_20[shot3,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot2,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot2,ingredient1]
1 AddIngredientToShot_splitted_20[shot2,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot4,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot4,ingredient1]
1 AddIngredientToShot_splitted_20[shot4,ingredient1]
1 _splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15[shot5,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotIngredient[shot5,ingredient1]
1 AddIngredientToShot_splitted_20[shot5,ingredient1]
1 AddIngredientToUsedShaker_splitted_7[ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot1,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot3,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot2,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot4,ingredient1,shaker1,level1,level1]
1 _splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16[shot5,ingredient1,shaker1,level1,level1]
1 AchieveContainsShotCocktail[shot5,cocktail1]
1 DoPourShakerToShot[shaker1,shot5,cocktail1]
1 AchieveContainsShakerCocktail[shaker1,cocktail1]
1 MakeCocktail_splitted_14[shaker1,cocktail1,ingredient2,ingredient1]

;; initial abstract task
385

;; methods
445
__top_method
385
555 505 386 -1
-1
MakeAndPourCocktailNull
386
0 -1
-1
MakeAndPourCocktail
386
5 388 446 504 387 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
387
1 2 -1
0 1 -1
pour_shaker_to_shot_action
387
3 4 -1
0 1 -1
MakeCocktailNull
388
6 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail3];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail3,ingredient3];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
388
499 476 395 389 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail3,ingredient3,ingredient5,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
389
391 390 7 -1
0 2 0 1 1 2 -1
EmptyHand
390
8 9 -1
0 1 -1
EmptyHand
390
10 11 -1
0 1 -1
EmptyHand
390
12 13 -1
0 1 -1
EmptyHand
390
14 15 -1
0 1 -1
EmptyHand
390
16 17 -1
0 1 -1
EmptyHand
390
18 19 -1
0 1 -1
HandEmptyNull
390
20 -1
-1
HandEmptyNull
390
21 -1
-1
HoldingNull
391
22 -1
-1
PickUp
391
23 393 392 24 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
392
12 13 -1
0 1 -1
PutDown
392
22 25 -1
0 1 -1
OnTableNull
392
26 -1
-1
EmptyHand
393
22 25 -1
0 1 -1
EmptyHand
393
27 28 -1
0 1 -1
EmptyHand
393
29 30 -1
0 1 -1
EmptyHand
393
31 32 -1
0 1 -1
EmptyHand
393
33 34 -1
0 1 -1
EmptyHand
393
35 36 -1
0 1 -1
HandEmptyNull
393
20 -1
-1
HandEmptyNull
393
21 -1
-1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail3,ingredient3,ingredient5,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
389
394 393 37 -1
0 2 0 1 1 2 -1
HoldingNull
394
12 -1
-1
PickUp
394
38 390 392 39 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShakerNull
395
40 -1
-1
AddIngredientToEmptyShaker
395
238 396 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
396
401 397 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
397
398 41 -1
0 1 -1
HoldingNull
398
29 -1
-1
PickUp
398
42 393 399 43 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
399
8 9 -1
0 1 -1
PutDown
399
29 30 -1
0 1 -1
OnTableNull
399
44 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
397
400 45 -1
0 1 -1
HoldingNull
400
8 -1
-1
PickUp
400
46 390 399 47 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
401
48 -1
-1
AddIngredientToShot
401
51 403 402 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient5,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
402
398 390 49 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient5,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
402
400 393 50 -1
0 2 0 1 1 2 -1
CleanShotNull
403
52 -1
-1
CleanFullShot
403
57 404 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
404
398 54 390 53 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
404
400 56 393 55 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
403
62 405 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
405
398 59 390 58 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
405
400 61 393 60 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
403
67 406 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
406
398 64 390 63 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
406
400 66 393 65 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
403
48 407 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient5,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
407
398 69 390 68 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot1,ingredient5,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
407
400 71 393 70 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
403
76 408 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
408
398 409 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
409
72 390 68 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
409
73 390 53 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
409
74 390 58 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
409
75 390 63 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
408
400 410 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
410
72 393 70 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
410
73 393 55 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
410
74 393 60 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
410
75 393 65 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
396
415 411 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
411
412 77 -1
0 1 -1
HoldingNull
412
35 -1
-1
PickUp
412
78 393 413 79 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
413
35 36 -1
0 1 -1
PutDown
413
14 15 -1
0 1 -1
OnTableNull
413
80 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
411
414 81 -1
0 1 -1
HoldingNull
414
14 -1
-1
PickUp
414
82 390 413 83 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
415
84 -1
-1
AddIngredientToShot
415
87 417 416 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient5,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
416
412 390 85 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient5,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
416
414 393 86 -1
0 2 0 1 1 2 -1
CleanShotNull
417
88 -1
-1
CleanFullShot
417
84 418 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient5,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
418
412 90 390 89 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient5,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
418
414 92 393 91 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
417
97 419 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
419
412 94 390 93 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
419
414 96 393 95 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
417
102 420 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
420
412 99 390 98 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
420
414 101 393 100 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
417
107 421 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
421
412 104 390 103 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
421
414 106 393 105 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
417
112 422 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,cocktail2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
422
412 109 390 108 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot3,cocktail2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
422
414 111 393 110 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
417
118 423 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
423
412 424 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
424
113 390 108 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
424
114 390 103 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
424
115 390 98 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
424
116 390 93 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
424
117 390 89 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
423
414 425 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
425
113 393 110 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
425
114 393 105 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
425
115 393 100 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
425
116 393 95 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
425
117 393 91 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
396
430 426 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
426
427 119 -1
0 1 -1
HoldingNull
427
33 -1
-1
PickUp
427
120 393 428 121 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
428
33 34 -1
0 1 -1
PutDown
428
10 11 -1
0 1 -1
OnTableNull
428
122 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
426
429 123 -1
0 1 -1
HoldingNull
429
10 -1
-1
PickUp
429
124 390 428 125 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
430
126 -1
-1
AddIngredientToShot
430
129 432 431 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient5,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
431
427 390 127 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient5,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
431
429 393 128 -1
0 2 0 1 1 2 -1
CleanShotNull
432
130 -1
-1
CleanFullShot
432
126 433 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient5,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
433
427 132 390 131 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient5,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
433
429 134 393 133 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
432
139 434 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
434
427 136 390 135 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
434
429 138 393 137 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
432
144 435 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
435
427 141 390 140 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
435
429 143 393 142 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
432
149 436 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
436
427 146 390 145 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot2,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
436
429 148 393 147 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
432
154 437 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
437
427 438 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
438
150 390 140 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
438
151 390 135 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
438
152 390 145 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
438
153 390 131 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
437
429 439 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
439
151 393 137 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
439
150 393 142 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
439
152 393 147 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
439
153 393 133 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
396
444 440 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
440
441 155 -1
0 1 -1
HoldingNull
441
31 -1
-1
PickUp
441
156 393 442 157 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
442
16 17 -1
0 1 -1
PutDown
442
31 32 -1
0 1 -1
OnTableNull
442
158 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
440
443 159 -1
0 1 -1
HoldingNull
443
16 -1
-1
PickUp
443
160 390 442 161 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
444
162 -1
-1
AddIngredientToShot
444
165 446 445 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient5,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
445
441 390 163 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient5,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
445
443 393 164 -1
0 2 0 1 1 2 -1
CleanShotNull
446
166 -1
-1
CleanFullShot
446
171 447 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
447
441 168 390 167 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
447
443 170 393 169 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
446
162 448 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient5,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
448
441 173 390 172 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient5,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
448
443 175 393 174 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
446
180 449 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
449
441 177 390 176 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
449
443 179 393 178 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
446
185 450 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
450
441 182 390 181 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
450
443 184 393 183 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
446
0 451 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,cocktail3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
451
441 187 390 186 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot4,cocktail3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
451
443 189 393 188 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
446
195 452 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
452
441 453 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
453
190 390 186 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
453
191 390 176 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
453
192 390 167 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
453
193 390 172 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
453
194 390 181 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
452
443 454 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
454
190 393 188 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
454
192 393 169 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
454
193 393 174 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
454
191 393 178 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
454
194 393 183 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
396
459 455 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
455
456 196 -1
0 1 -1
HoldingNull
456
18 -1
-1
PickUp
456
197 390 457 198 -1
0 3 0 2 0 1 2 3 1 2 -1
PutDown
457
18 19 -1
0 1 -1
PutDown
457
27 28 -1
0 1 -1
OnTableNull
457
199 -1
-1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
455
458 200 -1
0 1 -1
HoldingNull
458
27 -1
-1
PickUp
458
201 393 457 202 -1
0 3 0 2 0 1 2 3 1 2 -1
AddIngredientToShotNull
459
203 -1
-1
AddIngredientToShot
459
206 461 460 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot5,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient5,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
460
456 393 204 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot5,ingredient5];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient5,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
460
458 390 205 -1
0 2 0 1 1 2 -1
CleanShotNull
461
207 -1
-1
CleanFullShot
461
212 462 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient2,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
462
458 209 390 208 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient2,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
462
456 211 393 210 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
461
217 463 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient3,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
463
458 214 390 213 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient3,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
463
456 216 393 215 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
461
222 464 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
464
458 219 390 218 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
464
456 221 393 220 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
461
227 465 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,cocktail1,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
465
458 224 390 223 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,cocktail1,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
465
456 226 393 225 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanFullShot
461
203 466 -1
0 1 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient5,left];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
466
458 229 390 228 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
<_splitting_method_CleanFullShot_splitted_12;CleanFullShot_splitted_3[shot5,ingredient5,right];_splitting_method_CleanFullShot_splitted_3;2;0,1,-1,-2>
466
456 231 393 230 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
CleanEmptyShot
461
237 467 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_13
467
458 468 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
468
232 390 223 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
468
233 390 218 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
468
234 390 208 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
468
235 390 228 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
468
236 390 213 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_13
467
456 469 -1
0 1 -1
_splitting_method_CleanEmptyShot_splitted_4
469
232 393 225 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
469
233 393 220 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
469
234 393 210 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
469
236 393 215 -1
0 2 0 1 1 2 -1
_splitting_method_CleanEmptyShot_splitted_4
469
235 393 230 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
395
249 470 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
470
401 471 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
471
398 239 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
471
400 240 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
470
415 472 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
472
412 241 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
472
414 242 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
470
430 473 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
473
427 243 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
473
429 244 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
470
444 474 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
474
441 245 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
474
443 246 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
470
459 475 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
475
456 247 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
475
458 248 -1
0 1 -1
AddIngredientToShakerNull
476
250 -1
-1
AddIngredientToEmptyShaker
476
238 477 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
477
479 478 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
478
398 251 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
478
400 252 -1
0 1 -1
AddIngredientToShotNull
479
57 -1
-1
AddIngredientToShot
479
255 403 480 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
480
398 390 253 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
480
400 393 254 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
477
482 481 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
481
412 256 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
481
414 257 -1
0 1 -1
AddIngredientToShotNull
482
97 -1
-1
AddIngredientToShot
482
260 417 483 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
483
412 390 258 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
483
414 393 259 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
477
485 484 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
484
427 261 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
484
429 262 -1
0 1 -1
AddIngredientToShotNull
485
149 -1
-1
AddIngredientToShot
485
265 432 486 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
486
427 390 263 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
486
429 393 264 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
477
488 487 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
487
441 266 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
487
443 267 -1
0 1 -1
AddIngredientToShotNull
488
171 -1
-1
AddIngredientToShot
488
270 446 489 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
489
441 390 268 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
489
443 393 269 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
477
491 490 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
490
456 271 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
490
458 272 -1
0 1 -1
AddIngredientToShotNull
491
217 -1
-1
AddIngredientToShot
491
275 461 492 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot5,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient3,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
492
456 393 273 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot5,ingredient3];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient3,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
492
458 390 274 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
476
249 493 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
493
479 494 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
494
398 276 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
494
400 277 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
493
482 495 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
495
412 278 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
495
414 279 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
493
485 496 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
496
427 280 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
496
429 281 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
493
488 497 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
497
441 282 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
497
443 283 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
493
491 498 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
498
456 284 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
498
458 285 -1
0 1 -1
CleanShakerNull
499
286 -1
-1
CleanEmptyShaker
499
289 500 -1
0 1 -1
<_splitting_method_CleanEmptyShaker_splitted_10;CleanEmptyShaker_splitted_1[shaker1,left];_splitting_method_CleanEmptyShaker_splitted_1;1;0,-1,-2>
500
391 390 287 -1
0 2 0 1 1 2 -1
<_splitting_method_CleanEmptyShaker_splitted_10;CleanEmptyShaker_splitted_1[shaker1,right];_splitting_method_CleanEmptyShaker_splitted_1;1;0,-1,-2>
500
394 393 288 -1
0 2 0 1 1 2 -1
CleanFullShaker
499
298 501 -1
0 1 -1
<_splitting_method_CleanFullShaker_splitted_18;CleanFullShaker_splitted_11[shaker1,left];_splitting_method_CleanFullShaker_splitted_11;2;0,1,-1,-2>
501
391 502 390 287 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
_splitting_method_CleanFullShaker_splitted_2
502
6 290 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
502
292 291 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
502
294 293 -1
0 1 -1
<_splitting_method_CleanFullShaker_splitted_18;CleanFullShaker_splitted_11[shaker1,right];_splitting_method_CleanFullShaker_splitted_11;2;0,1,-1,-2>
501
394 503 393 288 -1
1 3 1 2 0 3 0 1 0 2 2 3 -1
_splitting_method_CleanFullShaker_splitted_2
503
6 295 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
503
292 296 -1
0 1 -1
_splitting_method_CleanFullShaker_splitted_2
503
294 297 -1
0 1 -1
_splitting_method_MakeAndPourCocktail_splitted_8
504
391 -1
-1
_splitting_method_MakeAndPourCocktail_splitted_8
504
394 -1
-1
MakeAndPourCocktailNull
505
112 -1
-1
MakeAndPourCocktail
505
303 507 417 504 506 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
506
299 300 -1
0 1 -1
pour_shaker_to_shot_action
506
301 302 -1
0 1 -1
MakeCocktailNull
507
292 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail2];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail2,ingredient1];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
507
499 532 509 508 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail2,ingredient1,ingredient2,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
508
391 390 304 -1
0 2 0 1 1 2 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail2,ingredient1,ingredient2,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
508
394 393 305 -1
0 2 0 1 1 2 -1
AddIngredientToShakerNull
509
306 -1
-1
AddIngredientToEmptyShaker
509
238 510 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
510
512 511 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
511
398 307 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
511
400 308 -1
0 1 -1
AddIngredientToShotNull
512
62 -1
-1
AddIngredientToShot
512
311 403 513 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
513
398 390 309 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
513
400 393 310 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
510
515 514 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
514
412 312 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
514
414 313 -1
0 1 -1
AddIngredientToShotNull
515
102 -1
-1
AddIngredientToShot
515
316 417 516 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
516
412 390 314 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
516
414 393 315 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
510
518 517 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
517
427 317 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
517
429 318 -1
0 1 -1
AddIngredientToShotNull
518
144 -1
-1
AddIngredientToShot
518
321 432 519 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
519
427 390 319 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
519
429 393 320 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
510
521 520 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
520
441 322 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
520
443 323 -1
0 1 -1
AddIngredientToShotNull
521
180 -1
-1
AddIngredientToShot
521
326 446 522 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
522
443 393 324 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
522
441 390 325 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
510
524 523 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
523
456 327 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
523
458 328 -1
0 1 -1
AddIngredientToShotNull
524
212 -1
-1
AddIngredientToShot
524
331 461 525 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot5,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient2,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
525
456 393 329 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot5,ingredient2];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient2,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
525
458 390 330 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
509
249 526 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
526
512 527 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
527
398 332 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
527
400 333 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
526
515 528 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
528
412 334 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
528
414 335 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
526
518 529 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
529
427 336 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
529
429 337 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
526
521 530 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
530
441 338 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
530
443 339 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
526
524 531 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
531
456 340 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
531
458 341 -1
0 1 -1
AddIngredientToShakerNull
532
342 -1
-1
AddIngredientToEmptyShaker
532
238 533 -1
0 1 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
533
535 534 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
534
398 343 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
534
400 344 -1
0 1 -1
AddIngredientToShotNull
535
67 -1
-1
AddIngredientToShot
535
347 403 536 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot1,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
536
398 390 345 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot1,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot1,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
536
400 393 346 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
533
538 537 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
537
412 348 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
537
414 349 -1
0 1 -1
AddIngredientToShotNull
538
107 -1
-1
AddIngredientToShot
538
352 417 539 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot3,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
539
412 390 350 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot3,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot3,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
539
414 393 351 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
533
541 540 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
540
427 353 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
540
429 354 -1
0 1 -1
AddIngredientToShotNull
541
139 -1
-1
AddIngredientToShot
541
357 432 542 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot2,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
542
427 390 355 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot2,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot2,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
542
429 393 356 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
533
544 543 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
543
441 358 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
543
443 359 -1
0 1 -1
AddIngredientToShotNull
544
185 -1
-1
AddIngredientToShot
544
362 446 545 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot4,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
545
443 393 360 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot4,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot4,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
545
441 390 361 -1
0 2 0 1 1 2 -1
_splitting_method_AddIngredientToEmptyShaker_splitted_6
533
547 546 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
546
456 363 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToEmptyShaker_splitted_6_splitted_15
546
458 364 -1
0 1 -1
AddIngredientToShotNull
547
222 -1
-1
AddIngredientToShot
547
367 461 548 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[right,shot5,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient1,right,left];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
548
456 393 365 -1
0 2 0 1 1 2 -1
<<_splitting_method_AddIngredientToShot_splitted_20;AddIngredientToShot_splitted_17[left,shot5,ingredient1];_splitting_method_AddIngredientToShot_splitted_17;1;0,-1,-2>;AddIngredientToShot_splitted_9[shot5,ingredient1,left,right];_splitting_method_AddIngredientToShot_splitted_9;2;0,1,-1>
548
458 390 366 -1
0 2 0 1 1 2 -1
AddIngredientToUsedShaker
532
249 549 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
549
535 550 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
550
398 368 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
550
400 369 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
549
538 551 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
551
412 370 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
551
414 371 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
549
541 552 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
552
427 372 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
552
429 373 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
549
544 553 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
553
441 374 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
553
443 375 -1
0 1 -1
_splitting_method_AddIngredientToUsedShaker_splitted_7
549
547 554 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
554
456 376 -1
0 1 -1
_splitting_method__splitting_method_AddIngredientToUsedShaker_splitted_7_splitted_16
554
458 377 -1
0 1 -1
MakeAndPourCocktailNull
555
227 -1
-1
MakeAndPourCocktail
555
382 557 461 504 556 -1
0 4 0 1 0 3 0 2 1 2 3 4 2 3 -1
pour_shaker_to_shot_action
556
378 379 -1
0 1 -1
pour_shaker_to_shot_action
556
380 381 -1
0 1 -1
MakeCocktailNull
557
294 -1
-1
<<MakeCocktail;MakeCocktail_splitted_21[shaker1,cocktail1];_splitting_method_MakeCocktail_splitted_21;1;0,-1,-2>;MakeCocktail_splitted_19[shaker1,cocktail1,ingredient2];_splitting_method_MakeCocktail_splitted_19;2;0,1,-1,-2>
557
499 509 532 558 -1
0 3 0 1 0 2 1 3 1 2 2 3 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail1,ingredient2,ingredient1,shaker1,left];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
558
391 390 383 -1
0 2 0 1 1 2 -1
<_splitting_method_MakeCocktail_splitted_14;MakeCocktail_splitted_5[cocktail1,ingredient2,ingredient1,shaker1,right];_splitting_method_MakeCocktail_splitted_5;1;0,-1,-2>
558
394 393 384 -1
0 2 0 1 1 2 -1
