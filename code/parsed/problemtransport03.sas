;; #state features
61
+at[package_0,city_loc_1]
+at[package_1,city_loc_1]
+at[package_2,city_loc_1]
+at[package_3,city_loc_2]
+at[package_4,city_loc_1]
+at[package_5,city_loc_1]
+at[package_6,city_loc_2]
+at[package_7,city_loc_2]
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
+in[package_3,truck_0]
+capacity[truck_0,capacity_0]
+in[package_6,truck_0]
+in[package_7,truck_0]
+in[package_3,truck_1]
+capacity[truck_1,capacity_0]
+in[package_6,truck_1]
+in[package_7,truck_1]
+in[package_3,truck_2]
+capacity[truck_2,capacity_0]
+in[package_6,truck_2]
+in[package_7,truck_2]
+at[truck_0,city_loc_0]
+in[package_0,truck_0]
+in[package_1,truck_0]
+in[package_2,truck_0]
+in[package_4,truck_0]
+in[package_5,truck_0]
+at[truck_0,city_loc_4]
+at[truck_1,city_loc_0]
+in[package_0,truck_1]
+in[package_1,truck_1]
+in[package_2,truck_1]
+in[package_4,truck_1]
+in[package_5,truck_1]
+at[truck_1,city_loc_4]
+at[truck_2,city_loc_0]
+in[package_0,truck_2]
+in[package_1,truck_2]
+in[package_2,truck_2]
+in[package_4,truck_2]
+in[package_5,truck_2]
+at[truck_2,city_loc_4]
+at[package_3,city_loc_3]
+at[package_6,city_loc_3]
+at[package_0,city_loc_0]
+at[package_1,city_loc_2]
+at[package_2,city_loc_2]
+at[package_5,city_loc_2]
+at[package_7,city_loc_4]
+at[package_4,city_loc_4]

;; Mutex Groups
61
0 0 +at[package_0,city_loc_1]
1 1 +at[package_1,city_loc_1]
2 2 +at[package_2,city_loc_1]
3 3 +at[package_3,city_loc_2]
4 4 +at[package_4,city_loc_1]
5 5 +at[package_5,city_loc_1]
6 6 +at[package_6,city_loc_2]
7 7 +at[package_7,city_loc_2]
8 8 +at[truck_0,city_loc_2]
9 9 +at[truck_1,city_loc_2]
10 10 +at[truck_2,city_loc_2]
11 11 +capacity[truck_0,capacity_1]
12 12 +capacity[truck_1,capacity_1]
13 13 +capacity[truck_2,capacity_1]
14 14 +at[truck_0,city_loc_1]
15 15 +at[truck_0,city_loc_3]
16 16 +at[truck_1,city_loc_1]
17 17 +at[truck_1,city_loc_3]
18 18 +at[truck_2,city_loc_1]
19 19 +at[truck_2,city_loc_3]
20 20 +in[package_3,truck_0]
21 21 +capacity[truck_0,capacity_0]
22 22 +in[package_6,truck_0]
23 23 +in[package_7,truck_0]
24 24 +in[package_3,truck_1]
25 25 +capacity[truck_1,capacity_0]
26 26 +in[package_6,truck_1]
27 27 +in[package_7,truck_1]
28 28 +in[package_3,truck_2]
29 29 +capacity[truck_2,capacity_0]
30 30 +in[package_6,truck_2]
31 31 +in[package_7,truck_2]
32 32 +at[truck_0,city_loc_0]
33 33 +in[package_0,truck_0]
34 34 +in[package_1,truck_0]
35 35 +in[package_2,truck_0]
36 36 +in[package_4,truck_0]
37 37 +in[package_5,truck_0]
38 38 +at[truck_0,city_loc_4]
39 39 +at[truck_1,city_loc_0]
40 40 +in[package_0,truck_1]
41 41 +in[package_1,truck_1]
42 42 +in[package_2,truck_1]
43 43 +in[package_4,truck_1]
44 44 +in[package_5,truck_1]
45 45 +at[truck_1,city_loc_4]
46 46 +at[truck_2,city_loc_0]
47 47 +in[package_0,truck_2]
48 48 +in[package_1,truck_2]
49 49 +in[package_2,truck_2]
50 50 +in[package_4,truck_2]
51 51 +in[package_5,truck_2]
52 52 +at[truck_2,city_loc_4]
53 53 +at[package_3,city_loc_3]
54 54 +at[package_6,city_loc_3]
55 55 +at[package_0,city_loc_0]
56 56 +at[package_1,city_loc_2]
57 57 +at[package_2,city_loc_2]
58 58 +at[package_5,city_loc_2]
59 59 +at[package_7,city_loc_4]
60 60 +at[package_4,city_loc_4]

;; further strict Mutex Groups
0

;; further non strict Mutex Groups
0

;; known invariants
0

;; Actions
111
1
27 45 25 -1
0 12  0 59  -1
0 25  0 27  -1
1
59 12 45 -1
0 25  0 27  -1
0 12  0 59  -1
1
17 -1
0 45  -1
0 17  -1
1
45 -1
-1
-1
1
45 -1
0 17  -1
0 45  -1
1
9 -1
0 17  -1
0 9  -1
1
17 -1
-1
-1
1
16 -1
0 9  -1
0 16  -1
1
17 -1
0 9  -1
0 17  -1
1
9 -1
-1
-1
1
39 -1
0 16  -1
0 39  -1
1
9 -1
0 16  -1
0 9  -1
1
16 -1
-1
-1
1
16 -1
0 39  -1
0 16  -1
1
39 -1
-1
-1
1
7 12 9 -1
0 25  0 27  -1
0 12  0 7  -1
1
38 23 21 -1
0 11  0 59  -1
0 21  0 23  -1
1
59 11 38 -1
0 21  0 23  -1
0 11  0 59  -1
1
15 -1
0 38  -1
0 15  -1
1
38 -1
-1
-1
1
8 -1
0 15  -1
0 8  -1
1
38 -1
0 15  -1
0 38  -1
1
15 -1
-1
-1
1
14 -1
0 8  -1
0 14  -1
1
15 -1
0 8  -1
0 15  -1
1
8 -1
-1
-1
1
32 -1
0 14  -1
0 32  -1
1
8 -1
0 14  -1
0 8  -1
1
14 -1
-1
-1
1
14 -1
0 32  -1
0 14  -1
1
32 -1
-1
-1
1
7 11 8 -1
0 21  0 23  -1
0 11  0 7  -1
1
52 31 29 -1
0 13  0 59  -1
0 29  0 31  -1
1
59 13 52 -1
0 29  0 31  -1
0 13  0 59  -1
1
19 -1
0 52  -1
0 19  -1
1
52 -1
-1
-1
1
52 -1
0 19  -1
0 52  -1
1
10 -1
0 19  -1
0 10  -1
1
19 -1
-1
-1
1
18 -1
0 10  -1
0 18  -1
1
19 -1
0 10  -1
0 19  -1
1
10 -1
-1
-1
1
46 -1
0 18  -1
0 46  -1
1
10 -1
0 18  -1
0 10  -1
1
18 -1
-1
-1
1
18 -1
0 46  -1
0 18  -1
1
46 -1
-1
-1
1
7 13 10 -1
0 29  0 31  -1
0 13  0 7  -1
1
15 22 21 -1
0 11  0 54  -1
0 21  0 22  -1
1
54 11 15 -1
0 21  0 22  -1
0 11  0 54  -1
1
6 11 8 -1
0 21  0 22  -1
0 11  0 6  -1
1
30 19 29 -1
0 13  0 54  -1
0 29  0 30  -1
1
13 54 19 -1
0 29  0 30  -1
0 13  0 54  -1
1
6 13 10 -1
0 29  0 30  -1
0 13  0 6  -1
1
17 26 25 -1
0 12  0 54  -1
0 25  0 26  -1
1
54 12 17 -1
0 25  0 26  -1
0 12  0 54  -1
1
6 12 9 -1
0 25  0 26  -1
0 12  0 6  -1
1
8 37 21 -1
0 11  0 58  -1
0 21  0 37  -1
1
11 58 8 -1
0 21  0 37  -1
0 11  0 58  -1
1
5 11 14 -1
0 21  0 37  -1
0 11  0 5  -1
1
9 44 25 -1
0 12  0 58  -1
0 25  0 44  -1
1
58 12 9 -1
0 25  0 44  -1
0 12  0 58  -1
1
5 12 16 -1
0 25  0 44  -1
0 12  0 5  -1
1
10 51 29 -1
0 13  0 58  -1
0 29  0 51  -1
1
58 13 10 -1
0 29  0 51  -1
0 13  0 58  -1
1
5 13 18 -1
0 29  0 51  -1
0 13  0 5  -1
1
43 45 25 -1
0 12  0 60  -1
0 25  0 43  -1
1
12 60 45 -1
0 25  0 43  -1
0 12  0 60  -1
1
4 12 16 -1
0 25  0 43  -1
0 12  0 4  -1
1
52 50 29 -1
0 13  0 60  -1
0 29  0 50  -1
1
60 13 52 -1
0 29  0 50  -1
0 13  0 60  -1
1
4 13 18 -1
0 29  0 50  -1
0 13  0 4  -1
1
38 36 21 -1
0 11  0 60  -1
0 21  0 36  -1
1
60 11 38 -1
0 21  0 36  -1
0 11  0 60  -1
1
11 4 14 -1
0 21  0 36  -1
0 11  0 4  -1
1
28 19 29 -1
0 13  0 53  -1
0 29  0 28  -1
1
53 13 19 -1
0 29  0 28  -1
0 13  0 53  -1
1
3 13 10 -1
0 29  0 28  -1
0 13  0 3  -1
1
17 24 25 -1
0 12  0 53  -1
0 25  0 24  -1
1
53 12 17 -1
0 25  0 24  -1
0 12  0 53  -1
1
3 12 9 -1
0 25  0 24  -1
0 12  0 3  -1
1
15 20 21 -1
0 11  0 53  -1
0 21  0 20  -1
1
53 11 15 -1
0 21  0 20  -1
0 11  0 53  -1
1
11 3 8 -1
0 21  0 20  -1
0 11  0 3  -1
1
10 49 29 -1
0 13  0 57  -1
0 29  0 49  -1
1
57 13 10 -1
0 29  0 49  -1
0 13  0 57  -1
1
2 13 18 -1
0 29  0 49  -1
0 13  0 2  -1
1
9 42 25 -1
0 12  0 57  -1
0 25  0 42  -1
1
57 12 9 -1
0 25  0 42  -1
0 12  0 57  -1
1
2 12 16 -1
0 25  0 42  -1
0 12  0 2  -1
1
8 35 21 -1
0 11  0 57  -1
0 21  0 35  -1
1
57 11 8 -1
0 21  0 35  -1
0 11  0 57  -1
1
2 11 14 -1
0 21  0 35  -1
0 11  0 2  -1
1
10 48 29 -1
0 13  0 56  -1
0 29  0 48  -1
1
56 13 10 -1
0 29  0 48  -1
0 13  0 56  -1
1
1 13 18 -1
0 29  0 48  -1
0 13  0 1  -1
1
9 41 25 -1
0 12  0 56  -1
0 25  0 41  -1
1
56 12 9 -1
0 25  0 41  -1
0 12  0 56  -1
1
12 1 16 -1
0 25  0 41  -1
0 12  0 1  -1
1
8 34 21 -1
0 11  0 56  -1
0 21  0 34  -1
1
56 11 8 -1
0 21  0 34  -1
0 11  0 56  -1
1
1 11 14 -1
0 21  0 34  -1
0 11  0 1  -1
1
46 47 29 -1
0 13  0 55  -1
0 29  0 47  -1
1
55 13 46 -1
0 29  0 47  -1
0 13  0 55  -1
1
0 13 18 -1
0 29  0 47  -1
0 13  0 0  -1
1
39 40 25 -1
0 12  0 55  -1
0 25  0 40  -1
1
55 12 39 -1
0 25  0 40  -1
0 12  0 55  -1
1
0 12 16 -1
0 25  0 40  -1
0 12  0 0  -1
1
32 33 21 -1
0 11  0 55  -1
0 21  0 33  -1
1
55 11 32 -1
0 21  0 33  -1
0 11  0 55  -1
1
0 11 14 -1
0 21  0 33  -1
0 11  0 0  -1

;; initial state
13 12 11 4 3 2 0 10 1 5 6 7 8 9 -1

;; goal
-1

;; tasks (primitive and abstract)
159
0 drop[truck_1,city_loc_4,package_7,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_4,package_7,capacity_0,capacity_1]
0 drive[truck_1,city_loc_3,city_loc_4]
0 noop[truck_1,city_loc_4]
0 drive[truck_1,city_loc_4,city_loc_3]
0 drive[truck_1,city_loc_2,city_loc_3]
0 noop[truck_1,city_loc_3]
0 drive[truck_1,city_loc_1,city_loc_2]
0 drive[truck_1,city_loc_3,city_loc_2]
0 noop[truck_1,city_loc_2]
0 drive[truck_1,city_loc_0,city_loc_1]
0 drive[truck_1,city_loc_2,city_loc_1]
0 noop[truck_1,city_loc_1]
0 drive[truck_1,city_loc_1,city_loc_0]
0 noop[truck_1,city_loc_0]
0 pick_up[truck_1,city_loc_2,package_7,capacity_0,capacity_1]
0 drop[truck_0,city_loc_4,package_7,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_4,package_7,capacity_0,capacity_1]
0 drive[truck_0,city_loc_3,city_loc_4]
0 noop[truck_0,city_loc_4]
0 drive[truck_0,city_loc_2,city_loc_3]
0 drive[truck_0,city_loc_4,city_loc_3]
0 noop[truck_0,city_loc_3]
0 drive[truck_0,city_loc_1,city_loc_2]
0 drive[truck_0,city_loc_3,city_loc_2]
0 noop[truck_0,city_loc_2]
0 drive[truck_0,city_loc_0,city_loc_1]
0 drive[truck_0,city_loc_2,city_loc_1]
0 noop[truck_0,city_loc_1]
0 drive[truck_0,city_loc_1,city_loc_0]
0 noop[truck_0,city_loc_0]
0 pick_up[truck_0,city_loc_2,package_7,capacity_0,capacity_1]
0 drop[truck_2,city_loc_4,package_7,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_4,package_7,capacity_0,capacity_1]
0 drive[truck_2,city_loc_3,city_loc_4]
0 noop[truck_2,city_loc_4]
0 drive[truck_2,city_loc_4,city_loc_3]
0 drive[truck_2,city_loc_2,city_loc_3]
0 noop[truck_2,city_loc_3]
0 drive[truck_2,city_loc_1,city_loc_2]
0 drive[truck_2,city_loc_3,city_loc_2]
0 noop[truck_2,city_loc_2]
0 drive[truck_2,city_loc_0,city_loc_1]
0 drive[truck_2,city_loc_2,city_loc_1]
0 noop[truck_2,city_loc_1]
0 drive[truck_2,city_loc_1,city_loc_0]
0 noop[truck_2,city_loc_0]
0 pick_up[truck_2,city_loc_2,package_7,capacity_0,capacity_1]
0 drop[truck_0,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_6,capacity_0,capacity_1]
0 drop[truck_2,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_6,capacity_0,capacity_1]
0 drop[truck_1,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_3,package_6,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_6,capacity_0,capacity_1]
0 drop[truck_0,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_1,package_5,capacity_0,capacity_1]
0 drop[truck_1,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_1,package_5,capacity_0,capacity_1]
0 drop[truck_2,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_5,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_1,package_5,capacity_0,capacity_1]
0 drop[truck_1,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_1,package_4,capacity_0,capacity_1]
0 drop[truck_2,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_1,package_4,capacity_0,capacity_1]
0 drop[truck_0,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_4,package_4,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_1,package_4,capacity_0,capacity_1]
0 drop[truck_2,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_2,city_loc_2,package_3,capacity_0,capacity_1]
0 drop[truck_1,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_1,city_loc_2,package_3,capacity_0,capacity_1]
0 drop[truck_0,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_3,package_3,capacity_0,capacity_1]
0 pick_up[truck_0,city_loc_2,package_3,capacity_0,capacity_1]
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
1 deliver[package_7,city_loc_4]
1 m_deliver_ordering_0_splitted_1[truck_1,package_7]
1 get_to[truck_1,city_loc_4]
1 get_to[truck_1,city_loc_3]
1 get_to[truck_1,city_loc_2]
1 get_to[truck_1,city_loc_1]
1 get_to[truck_1,city_loc_0]
1 m_deliver_ordering_0_splitted_1[truck_0,package_7]
1 get_to[truck_0,city_loc_4]
1 get_to[truck_0,city_loc_3]
1 get_to[truck_0,city_loc_2]
1 get_to[truck_0,city_loc_1]
1 get_to[truck_0,city_loc_0]
1 m_deliver_ordering_0_splitted_1[truck_2,package_7]
1 get_to[truck_2,city_loc_4]
1 get_to[truck_2,city_loc_3]
1 get_to[truck_2,city_loc_2]
1 get_to[truck_2,city_loc_1]
1 get_to[truck_2,city_loc_0]
1 deliver[package_6,city_loc_3]
1 m_deliver_ordering_0_splitted_1[truck_0,package_6]
1 m_deliver_ordering_0_splitted_1[truck_2,package_6]
1 m_deliver_ordering_0_splitted_1[truck_1,package_6]
1 deliver[package_5,city_loc_2]
1 m_deliver_ordering_0_splitted_1[truck_0,package_5]
1 m_deliver_ordering_0_splitted_1[truck_1,package_5]
1 m_deliver_ordering_0_splitted_1[truck_2,package_5]
1 deliver[package_4,city_loc_4]
1 m_deliver_ordering_0_splitted_1[truck_1,package_4]
1 m_deliver_ordering_0_splitted_1[truck_2,package_4]
1 m_deliver_ordering_0_splitted_1[truck_0,package_4]
1 deliver[package_3,city_loc_3]
1 m_deliver_ordering_0_splitted_1[truck_2,package_3]
1 m_deliver_ordering_0_splitted_1[truck_1,package_3]
1 m_deliver_ordering_0_splitted_1[truck_0,package_3]
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
111

;; methods
136
__top_method
111
155 151 147 143 139 135 131 112 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_4,package_7];m_unload_ordering_0;2;0,1,-1>
112
113 114 0 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_4,package_7];m_load_ordering_0;1;0,-1>
113
114 1 -1
0 1 -1
m_drive_to_ordering_0
114
2 -1
-1
m_i_am_there_ordering_0
114
3 -1
-1
m_drive_to_via_ordering_0
114
115 2 -1
0 1 -1
m_drive_to_ordering_0
115
4 -1
-1
m_drive_to_ordering_0
115
5 -1
-1
m_i_am_there_ordering_0
115
6 -1
-1
m_drive_to_via_ordering_0
115
116 5 -1
0 1 -1
m_drive_to_ordering_0
116
7 -1
-1
m_drive_to_ordering_0
116
8 -1
-1
m_i_am_there_ordering_0
116
9 -1
-1
m_drive_to_via_ordering_0
116
115 8 -1
0 1 -1
m_drive_to_via_ordering_0
116
117 7 -1
0 1 -1
m_drive_to_ordering_0
117
10 -1
-1
m_drive_to_ordering_0
117
11 -1
-1
m_i_am_there_ordering_0
117
12 -1
-1
m_drive_to_via_ordering_0
117
118 10 -1
0 1 -1
m_drive_to_ordering_0
118
13 -1
-1
m_i_am_there_ordering_0
118
14 -1
-1
m_drive_to_via_ordering_0
118
117 13 -1
0 1 -1
m_drive_to_via_ordering_0
117
116 11 -1
0 1 -1
m_drive_to_via_ordering_0
115
114 4 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_7];m_load_ordering_0;1;0,-1>
113
116 15 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_4,package_7];m_unload_ordering_0;2;0,1,-1>
112
119 120 16 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_4,package_7];m_load_ordering_0;1;0,-1>
119
120 17 -1
0 1 -1
m_drive_to_ordering_0
120
18 -1
-1
m_i_am_there_ordering_0
120
19 -1
-1
m_drive_to_via_ordering_0
120
121 18 -1
0 1 -1
m_drive_to_ordering_0
121
20 -1
-1
m_drive_to_ordering_0
121
21 -1
-1
m_i_am_there_ordering_0
121
22 -1
-1
m_drive_to_via_ordering_0
121
122 20 -1
0 1 -1
m_drive_to_ordering_0
122
23 -1
-1
m_drive_to_ordering_0
122
24 -1
-1
m_i_am_there_ordering_0
122
25 -1
-1
m_drive_to_via_ordering_0
122
121 24 -1
0 1 -1
m_drive_to_via_ordering_0
122
123 23 -1
0 1 -1
m_drive_to_ordering_0
123
26 -1
-1
m_drive_to_ordering_0
123
27 -1
-1
m_i_am_there_ordering_0
123
28 -1
-1
m_drive_to_via_ordering_0
123
122 27 -1
0 1 -1
m_drive_to_via_ordering_0
123
124 26 -1
0 1 -1
m_drive_to_ordering_0
124
29 -1
-1
m_i_am_there_ordering_0
124
30 -1
-1
m_drive_to_via_ordering_0
124
123 29 -1
0 1 -1
m_drive_to_via_ordering_0
121
120 21 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_7];m_load_ordering_0;1;0,-1>
119
122 31 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_4,package_7];m_unload_ordering_0;2;0,1,-1>
112
125 126 32 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_4,package_7];m_load_ordering_0;1;0,-1>
125
126 33 -1
0 1 -1
m_drive_to_ordering_0
126
34 -1
-1
m_i_am_there_ordering_0
126
35 -1
-1
m_drive_to_via_ordering_0
126
127 34 -1
0 1 -1
m_drive_to_ordering_0
127
36 -1
-1
m_drive_to_ordering_0
127
37 -1
-1
m_i_am_there_ordering_0
127
38 -1
-1
m_drive_to_via_ordering_0
127
128 37 -1
0 1 -1
m_drive_to_ordering_0
128
39 -1
-1
m_drive_to_ordering_0
128
40 -1
-1
m_i_am_there_ordering_0
128
41 -1
-1
m_drive_to_via_ordering_0
128
127 40 -1
0 1 -1
m_drive_to_via_ordering_0
128
129 39 -1
0 1 -1
m_drive_to_ordering_0
129
42 -1
-1
m_drive_to_ordering_0
129
43 -1
-1
m_i_am_there_ordering_0
129
44 -1
-1
m_drive_to_via_ordering_0
129
128 43 -1
0 1 -1
m_drive_to_via_ordering_0
129
130 42 -1
0 1 -1
m_drive_to_ordering_0
130
45 -1
-1
m_i_am_there_ordering_0
130
46 -1
-1
m_drive_to_via_ordering_0
130
129 45 -1
0 1 -1
m_drive_to_via_ordering_0
127
126 36 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_7];m_load_ordering_0;1;0,-1>
125
128 47 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_3,package_6];m_unload_ordering_0;2;0,1,-1>
131
132 121 48 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_3,package_6];m_load_ordering_0;1;0,-1>
132
121 49 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_6];m_load_ordering_0;1;0,-1>
132
122 50 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_3,package_6];m_unload_ordering_0;2;0,1,-1>
131
133 127 51 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_3,package_6];m_load_ordering_0;1;0,-1>
133
127 52 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_6];m_load_ordering_0;1;0,-1>
133
128 53 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_3,package_6];m_unload_ordering_0;2;0,1,-1>
131
134 115 54 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_3,package_6];m_load_ordering_0;1;0,-1>
134
115 55 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_6];m_load_ordering_0;1;0,-1>
134
116 56 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_5];m_unload_ordering_0;2;0,1,-1>
135
136 122 57 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_5];m_load_ordering_0;1;0,-1>
136
122 58 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_5];m_load_ordering_0;1;0,-1>
136
123 59 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_5];m_unload_ordering_0;2;0,1,-1>
135
137 116 60 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_5];m_load_ordering_0;1;0,-1>
137
116 61 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_5];m_load_ordering_0;1;0,-1>
137
117 62 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_5];m_unload_ordering_0;2;0,1,-1>
135
138 128 63 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_5];m_load_ordering_0;1;0,-1>
138
128 64 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_5];m_load_ordering_0;1;0,-1>
138
129 65 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_4,package_4];m_unload_ordering_0;2;0,1,-1>
139
140 114 66 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_4,package_4];m_load_ordering_0;1;0,-1>
140
114 67 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_4];m_load_ordering_0;1;0,-1>
140
117 68 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_4,package_4];m_unload_ordering_0;2;0,1,-1>
139
141 126 69 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_4,package_4];m_load_ordering_0;1;0,-1>
141
126 70 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_4];m_load_ordering_0;1;0,-1>
141
129 71 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_4,package_4];m_unload_ordering_0;2;0,1,-1>
139
142 120 72 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_4,package_4];m_load_ordering_0;1;0,-1>
142
120 73 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_4];m_load_ordering_0;1;0,-1>
142
123 74 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_3,package_3];m_unload_ordering_0;2;0,1,-1>
143
144 127 75 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_3,package_3];m_load_ordering_0;1;0,-1>
144
127 76 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
144
128 77 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_3,package_3];m_unload_ordering_0;2;0,1,-1>
143
145 115 78 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_3,package_3];m_load_ordering_0;1;0,-1>
145
115 79 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
145
116 80 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_3,package_3];m_unload_ordering_0;2;0,1,-1>
143
146 121 81 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_3,package_3];m_load_ordering_0;1;0,-1>
146
121 82 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_3];m_load_ordering_0;1;0,-1>
146
122 83 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
147
148 128 84 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
148
128 85 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
148
129 86 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
147
149 116 87 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
149
116 88 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
149
117 89 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_2];m_unload_ordering_0;2;0,1,-1>
147
150 122 90 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_2];m_load_ordering_0;1;0,-1>
150
122 91 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_2];m_load_ordering_0;1;0,-1>
150
123 92 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
151
152 128 93 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
152
128 94 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
152
129 95 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
151
153 116 96 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
153
116 97 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
153
117 98 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_2,package_1];m_unload_ordering_0;2;0,1,-1>
151
154 122 99 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_2,package_1];m_load_ordering_0;1;0,-1>
154
122 100 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_1];m_load_ordering_0;1;0,-1>
154
123 101 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_2,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
155
156 130 102 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
156
130 103 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_2,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
156
129 104 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_1,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
155
157 118 105 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
157
118 106 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_1,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
157
117 107 -1
0 1 -1
<m_deliver_ordering_0;unload[truck_0,city_loc_0,package_0];m_unload_ordering_0;2;0,1,-1>
155
158 124 108 -1
0 2 0 1 1 2 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_0,package_0];m_load_ordering_0;1;0,-1>
158
124 109 -1
0 1 -1
<_splitting_method_m_deliver_ordering_0_splitted_1;load[truck_0,city_loc_1,package_0];m_load_ordering_0;1;0,-1>
158
123 110 -1
0 1 -1
