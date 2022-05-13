;; #state features
42
+at[package_0,city_loc_1]
+at[package_1,city_loc_1]
+at[package_2,city_loc_1]
+at[package_3,city_loc_1]
+at[truck_0,city_loc_2]
+at[truck_1,city_loc_2]
+at[truck_2,city_loc_2]
+capacity[truck_0,capacity_1]
+capacity[truck_1,capacity_1]
+capacity[truck_2,capacity_1]
+at[truck_0,city_loc_1]
+at[truck_0,city_loc_3]
+at[truck_1,city_loc_1]
+at[truck_1,city_loc_3]
+at[truck_2,city_loc_1]
+at[truck_2,city_loc_3]
+at[truck_0,city_loc_0]
+in[package_0,truck_0]
+capacity[truck_0,capacity_0]
+in[package_1,truck_0]
+in[package_2,truck_0]
+in[package_3,truck_0]
+at[truck_0,city_loc_4]
+at[truck_1,city_loc_0]
+in[package_0,truck_1]
+capacity[truck_1,capacity_0]
+in[package_1,truck_1]
+in[package_2,truck_1]
+in[package_3,truck_1]
+at[truck_1,city_loc_4]
+at[truck_2,city_loc_0]
+in[package_0,truck_2]
+capacity[truck_2,capacity_0]
+in[package_1,truck_2]
+in[package_2,truck_2]
+in[package_3,truck_2]
+at[truck_2,city_loc_4]
+at[package_0,city_loc_0]
+at[package_1,city_loc_2]
+at[package_2,city_loc_2]
+at[package_3,city_loc_2]
+at[package_3,city_loc_4]

;; Mutex Groups
42
0 0 +at[package_0,city_loc_1]
1 1 +at[package_1,city_loc_1]
2 2 +at[package_2,city_loc_1]
3 3 +at[package_3,city_loc_1]
4 4 +at[truck_0,city_loc_2]
5 5 +at[truck_1,city_loc_2]
6 6 +at[truck_2,city_loc_2]
7 7 +capacity[truck_0,capacity_1]
8 8 +capacity[truck_1,capacity_1]
9 9 +capacity[truck_2,capacity_1]
10 10 +at[truck_0,city_loc_1]
11 11 +at[truck_0,city_loc_3]
12 12 +at[truck_1,city_loc_1]
13 13 +at[truck_1,city_loc_3]
14 14 +at[truck_2,city_loc_1]
15 15 +at[truck_2,city_loc_3]
16 16 +at[truck_0,city_loc_0]
17 17 +in[package_0,truck_0]
18 18 +capacity[truck_0,capacity_0]
19 19 +in[package_1,truck_0]
20 20 +in[package_2,truck_0]
21 21 +in[package_3,truck_0]
22 22 +at[truck_0,city_loc_4]
23 23 +at[truck_1,city_loc_0]
24 24 +in[package_0,truck_1]
25 25 +capacity[truck_1,capacity_0]
26 26 +in[package_1,truck_1]
27 27 +in[package_2,truck_1]
28 28 +in[package_3,truck_1]
29 29 +at[truck_1,city_loc_4]
30 30 +at[truck_2,city_loc_0]
31 31 +in[package_0,truck_2]
32 32 +capacity[truck_2,capacity_0]
33 33 +in[package_1,truck_2]
34 34 +in[package_2,truck_2]
35 35 +in[package_3,truck_2]
36 36 +at[truck_2,city_loc_4]
37 37 +at[package_0,city_loc_0]
38 38 +at[package_1,city_loc_2]
39 39 +at[package_2,city_loc_2]
40 40 +at[package_3,city_loc_2]
41 41 +at[package_3,city_loc_4]

;; further strict Mutex Groups
0

;; further non strict Mutex Groups
0

;; known invariants
0

;; Actions
75
1
22 21 18 -1
0 7  0 41  -1
0 18  0 21  -1
1
40 7 4 -1
0 18  0 21  -1
0 7  0 40  -1
1
10 -1
0 4  -1
0 10  -1
1
4 -1
-1
-1
1
16 -1
0 10  -1
0 16  -1
1
4 -1
0 10  -1
0 4  -1
1
10 -1
-1
-1
1
10 -1
0 16  -1
0 10  -1
1
16 -1
-1
-1
1
41 7 22 -1
0 18  0 21  -1
0 7  0 41  -1
1
11 -1
0 22  -1
0 11  -1
1
22 -1
-1
-1
1
4 -1
0 11  -1
0 4  -1
1
11 -1
-1
-1
1
3 7 10 -1
0 18  0 21  -1
0 7  0 3  -1
1
29 28 25 -1
0 8  0 41  -1
0 25  0 28  -1
1
8 40 5 -1
0 25  0 28  -1
0 8  0 40  -1
1
12 -1
0 5  -1
0 12  -1
1
5 -1
-1
-1
1
23 -1
0 12  -1
0 23  -1
1
5 -1
0 12  -1
0 5  -1
1
12 -1
-1
-1
1
12 -1
0 23  -1
0 12  -1
1
23 -1
-1
-1
1
41 8 29 -1
0 25  0 28  -1
0 8  0 41  -1
1
13 -1
0 29  -1
0 13  -1
1
29 -1
-1
-1
1
5 -1
0 13  -1
0 5  -1
1
13 -1
-1
-1
1
3 8 12 -1
0 25  0 28  -1
0 8  0 3  -1
1
36 35 32 -1
0 9  0 41  -1
0 32  0 35  -1
1
40 9 6 -1
0 32  0 35  -1
0 9  0 40  -1
1
14 -1
0 6  -1
0 14  -1
1
6 -1
-1
-1
1
30 -1
0 14  -1
0 30  -1
1
6 -1
0 14  -1
0 6  -1
1
14 -1
-1
-1
1
14 -1
0 30  -1
0 14  -1
1
30 -1
-1
-1
1
9 41 36 -1
0 32  0 35  -1
0 9  0 41  -1
1
15 -1
0 36  -1
0 15  -1
1
36 -1
-1
-1
1
6 -1
0 15  -1
0 6  -1
1
15 -1
-1
-1
1
3 9 14 -1
0 32  0 35  -1
0 9  0 3  -1
1
4 21 18 -1
0 7  0 40  -1
0 18  0 21  -1
1
28 5 25 -1
0 8  0 40  -1
0 25  0 28  -1
1
6 35 32 -1
0 9  0 40  -1
0 32  0 35  -1
1
6 34 32 -1
0 9  0 39  -1
0 32  0 34  -1
1
39 9 6 -1
0 32  0 34  -1
0 9  0 39  -1
1
2 9 14 -1
0 32  0 34  -1
0 9  0 2  -1
1
27 5 25 -1
0 8  0 39  -1
0 25  0 27  -1
1
39 8 5 -1
0 25  0 27  -1
0 8  0 39  -1
1
8 2 12 -1
0 25  0 27  -1
0 8  0 2  -1
1
4 20 18 -1
0 7  0 39  -1
0 18  0 20  -1
1
7 39 4 -1
0 18  0 20  -1
0 7  0 39  -1
1
2 7 10 -1
0 18  0 20  -1
0 7  0 2  -1
1
6 33 32 -1
0 9  0 38  -1
0 32  0 33  -1
1
38 9 6 -1
0 32  0 33  -1
0 9  0 38  -1
1
1 9 14 -1
0 32  0 33  -1
0 9  0 1  -1
1
26 5 25 -1
0 8  0 38  -1
0 25  0 26  -1
1
38 8 5 -1
0 25  0 26  -1
0 8  0 38  -1
1
1 8 12 -1
0 25  0 26  -1
0 8  0 1  -1
1
4 19 18 -1
0 7  0 38  -1
0 18  0 19  -1
1
38 7 4 -1
0 18  0 19  -1
0 7  0 38  -1
1
1 7 10 -1
0 18  0 19  -1
0 7  0 1  -1
1
30 31 32 -1
0 9  0 37  -1
0 32  0 31  -1
1
37 9 30 -1
0 32  0 31  -1
0 9  0 37  -1
1
0 9 14 -1
0 32  0 31  -1
0 9  0 0  -1
1
23 24 25 -1
0 8  0 37  -1
0 25  0 24  -1
1
37 8 23 -1
0 25  0 24  -1
0 8  0 37  -1
1
0 8 12 -1
0 25  0 24  -1
0 8  0 0  -1
1
16 17 18 -1
0 7  0 37  -1
0 18  0 17  -1
1
37 7 16 -1
0 18  0 17  -1
0 7  0 37  -1
1
7 0 10 -1
0 18  0 17  -1
0 7  0 0  -1

;; initial state
9 8 7 6 5 1 0 4 2 3 -1

;; goal
-1

;; tasks (primitive and abstract)
108
0 drop[truck_0,city_loc_4,package_3,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_3,capacity_0,capacity_1]
0 drive[truck_0,city_loc_1,city_loc_2]
0 noop[truck_0,city_loc_2]
0 drive[truck_0,city_loc_0,city_loc_1]
0 drive[truck_0,city_loc_2,city_loc_1]
0 noop[truck_0,city_loc_1]
0 drive[truck_0,city_loc_1,city_loc_0]
0 noop[truck_0,city_loc_0]
0 pick_up[truck_0,city_loc_4,package_3,capacity_0,capacity_1]
0 drive[truck_0,city_loc_3,city_loc_4]
0 noop[truck_0,city_loc_4]
0 drive[truck_0,city_loc_2,city_loc_3]
0 noop[truck_0,city_loc_3]
0 pick_up[truck_0,city_loc_1,package_3,capacity_0,capacity_1]
0 drop[truck_1,city_loc_4,package_3,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_3,capacity_0,capacity_1]
0 drive[truck_1,city_loc_1,city_loc_2]
0 noop[truck_1,city_loc_2]
0 drive[truck_1,city_loc_0,city_loc_1]
0 drive[truck_1,city_loc_2,city_loc_1]
0 noop[truck_1,city_loc_1]
0 drive[truck_1,city_loc_1,city_loc_0]
0 noop[truck_1,city_loc_0]
0 pick_up[truck_1,city_loc_4,package_3,capacity_0,capacity_1]
0 drive[truck_1,city_loc_3,city_loc_4]
0 noop[truck_1,city_loc_4]
0 drive[truck_1,city_loc_2,city_loc_3]
0 noop[truck_1,city_loc_3]
0 pick_up[truck_1,city_loc_1,package_3,capacity_0,capacity_1]
0 drop[truck_2,city_loc_4,package_3,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_3,capacity_0,capacity_1]
0 drive[truck_2,city_loc_1,city_loc_2]
0 noop[truck_2,city_loc_2]
0 drive[truck_2,city_loc_0,city_loc_1]
0 drive[truck_2,city_loc_2,city_loc_1]
0 noop[truck_2,city_loc_1]
0 drive[truck_2,city_loc_1,city_loc_0]
0 noop[truck_2,city_loc_0]
0 pick_up[truck_2,city_loc_4,package_3,capacity_0,capacity_1]
0 drive[truck_2,city_loc_3,city_loc_4]
0 noop[truck_2,city_loc_4]
0 drive[truck_2,city_loc_2,city_loc_3]
0 noop[truck_2,city_loc_3]
0 pick_up[truck_2,city_loc_1,package_3,capacity_0,capacity_1]
0 drop[truck_0,city_loc_2,package_3,capacity_0,capacity_1]
0 drop[truck_1,city_loc_2,package_3,capacity_0,capacity_1]
0 drop[truck_2,city_loc_2,package_3,capacity_0,capacity_1]
0 drop[truck_2,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_1,package_2,capacity_0,capacity_1]
0 drop[truck_1,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_1,package_2,capacity_0,capacity_1]
0 drop[truck_0,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_2,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_1,package_2,capacity_0,capacity_1]
0 drop[truck_2,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_1,package_1,capacity_0,capacity_1]
0 drop[truck_1,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_1,package_1,capacity_0,capacity_1]
0 drop[truck_0,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_1,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_1,package_1,capacity_0,capacity_1]
0 drop[truck_2,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_1,package_0,capacity_0,capacity_1]
0 drop[truck_1,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_1,package_0,capacity_0,capacity_1]
0 drop[truck_0,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_0,package_0,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_1,package_0,capacity_0,capacity_1]
1 __top[]
1 deliver[package_3,city_loc_4]
1 m_deliver_ordering_0_splitted_1[truck_0,package_3]
1 get_to[truck_0,city_loc_2]
1 get_to[truck_0,city_loc_1]
1 get_to[truck_0,city_loc_0]
1 get_to[truck_0,city_loc_4]
1 get_to[truck_0,city_loc_3]
1 m_deliver_ordering_0_splitted_1[truck_1,package_3]
1 get_to[truck_1,city_loc_2]
1 get_to[truck_1,city_loc_1]
1 get_to[truck_1,city_loc_0]
1 get_to[truck_1,city_loc_4]
1 get_to[truck_1,city_loc_3]
1 m_deliver_ordering_0_splitted_1[truck_2,package_3]
1 get_to[truck_2,city_loc_2]
1 get_to[truck_2,city_loc_1]
1 get_to[truck_2,city_loc_0]
1 get_to[truck_2,city_loc_4]
1 get_to[truck_2,city_loc_3]
1 deliver[package_3,city_loc_2]
1 deliver[package_2,city_loc_2]
1 m_deliver_ordering_0_splitted_1[truck_2,package_2]
1 m_deliver_ordering_0_splitted_1[truck_1,package_2]
1 m_deliver_ordering_0_splitted_1[truck_0,package_2]
1 deliver[package_1,city_loc_2]
1 m_deliver_ordering_0_splitted_1[truck_2,package_1]
1 m_deliver_ordering_0_splitted_1[truck_1,package_1]
1 m_deliver_ordering_0_splitted_1[truck_0,package_1]
1 deliver[package_0,city_loc_0]
1 m_deliver_ordering_0_splitted_1[truck_2,package_0]
1 m_deliver_ordering_0_splitted_1[truck_1,package_0]
1 m_deliver_ordering_0_splitted_1[truck_0,package_0]

;; initial abstract task
75

;; methods
94
__top_method
75
104 100 96 95 76 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_4,package_3];m_unload_ordering_0;2;0,1,-1>
76
77 81 0 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
77
78 1 -1
0 1 -1
m_drive_to_ordering_0
78
2 -1
-1
m_i_am_there_ordering_0
78
3 -1
-1
m_drive_to_via_ordering_0
78
79 2 -1
0 1 -1
m_drive_to_ordering_0
79
4 -1
-1
m_drive_to_ordering_0
79
5 -1
-1
m_i_am_there_ordering_0
79
6 -1
-1
m_drive_to_via_ordering_0
79
78 5 -1
0 1 -1
m_drive_to_via_ordering_0
79
80 4 -1
0 1 -1
m_drive_to_ordering_0
80
7 -1
-1
m_i_am_there_ordering_0
80
8 -1
-1
m_drive_to_via_ordering_0
80
79 7 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_4,package_3];m_load_ordering_0;1;0,-1>
77
81 9 -1
0 1 -1
m_drive_to_ordering_0
81
10 -1
-1
m_i_am_there_ordering_0
81
11 -1
-1
m_drive_to_via_ordering_0
81
82 10 -1
0 1 -1
m_drive_to_ordering_0
82
12 -1
-1
m_i_am_there_ordering_0
82
13 -1
-1
m_drive_to_via_ordering_0
82
78 12 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_3];m_load_ordering_0;1;0,-1>
77
79 14 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_4,package_3];m_unload_ordering_0;2;0,1,-1>
76
83 87 15 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
83
84 16 -1
0 1 -1
m_drive_to_ordering_0
84
17 -1
-1
m_i_am_there_ordering_0
84
18 -1
-1
m_drive_to_via_ordering_0
84
85 17 -1
0 1 -1
m_drive_to_ordering_0
85
19 -1
-1
m_drive_to_ordering_0
85
20 -1
-1
m_i_am_there_ordering_0
85
21 -1
-1
m_drive_to_via_ordering_0
85
84 20 -1
0 1 -1
m_drive_to_via_ordering_0
85
86 19 -1
0 1 -1
m_drive_to_ordering_0
86
22 -1
-1
m_i_am_there_ordering_0
86
23 -1
-1
m_drive_to_via_ordering_0
86
85 22 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_4,package_3];m_load_ordering_0;1;0,-1>
83
87 24 -1
0 1 -1
m_drive_to_ordering_0
87
25 -1
-1
m_i_am_there_ordering_0
87
26 -1
-1
m_drive_to_via_ordering_0
87
88 25 -1
0 1 -1
m_drive_to_ordering_0
88
27 -1
-1
m_i_am_there_ordering_0
88
28 -1
-1
m_drive_to_via_ordering_0
88
84 27 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_3];m_load_ordering_0;1;0,-1>
83
85 29 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_4,package_3];m_unload_ordering_0;2;0,1,-1>
76
89 93 30 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
89
90 31 -1
0 1 -1
m_drive_to_ordering_0
90
32 -1
-1
m_i_am_there_ordering_0
90
33 -1
-1
m_drive_to_via_ordering_0
90
91 32 -1
0 1 -1
m_drive_to_ordering_0
91
34 -1
-1
m_drive_to_ordering_0
91
35 -1
-1
m_i_am_there_ordering_0
91
36 -1
-1
m_drive_to_via_ordering_0
91
92 34 -1
0 1 -1
m_drive_to_ordering_0
92
37 -1
-1
m_i_am_there_ordering_0
92
38 -1
-1
m_drive_to_via_ordering_0
92
91 37 -1
0 1 -1
m_drive_to_via_ordering_0
91
90 35 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_4,package_3];m_load_ordering_0;1;0,-1>
89
93 39 -1
0 1 -1
m_drive_to_ordering_0
93
40 -1
-1
m_i_am_there_ordering_0
93
41 -1
-1
m_drive_to_via_ordering_0
93
94 40 -1
0 1 -1
m_drive_to_ordering_0
94
42 -1
-1
m_i_am_there_ordering_0
94
43 -1
-1
m_drive_to_via_ordering_0
94
90 42 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_3];m_load_ordering_0;1;0,-1>
89
91 44 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_3];m_unload_ordering_0;2;0,1,-1>
95
77 78 45 -1
0 2 0 1 1 2 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_3];m_unload_ordering_0;2;0,1,-1>
95
83 84 46 -1
0 2 0 1 1 2 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_3];m_unload_ordering_0;2;0,1,-1>
95
89 90 47 -1
0 2 0 1 1 2 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
96
97 90 48 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
97
90 49 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
97
91 50 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
96
98 84 51 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
98
84 52 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
98
85 53 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
96
99 78 54 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
99
78 55 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
99
79 56 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
100
101 90 57 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
101
90 58 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
101
91 59 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
100
102 84 60 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
102
84 61 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
102
85 62 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
100
103 78 63 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
103
78 64 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
103
79 65 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
104
105 92 66 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
105
92 67 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
105
91 68 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
104
106 86 69 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
106
86 70 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
106
85 71 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
104
107 80 72 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
107
80 73 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
107
79 74 -1
0 1 -1
