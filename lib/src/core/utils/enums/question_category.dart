enum QuestionCategory {
  driverPedestrianSigns(1),
  trafficRules(2),
  warningSigns(3),
  prioritySigns(4),
  prohibitionSigns(5),
  directionSigns(6),
  infoDisplaySigns(7),
  serviceSigns(8),
  additionalInfoSigns(9),
  roadworkSignals(10),
  regulatorySignals(11),
  specialSignals(12),
  emergencySignals(13),
  guidanceAudibleSigns(14),
  movementSteering(15),
  roundaboutApproach(16),
  travelSpeed(17),
  bufferZone(18),
  slipperySurface(19),
  crossroadCrossing(20),
  railwayCrossing(21),
  motorwayTravel(22),
  residentialPriority(23),
  parking(24),
  educationalRoute(25),
  pedestriansFreight(26),
  bicycleMopedCrossing(27),
  roadMarking(28),
  medicalAssistance(29),
  movementSafety(30),
  administrativeLaw(31),
  ecoDriving(32);

  final int value;

  const QuestionCategory(this.value);

  List<int> get tickets => switch (this) {
        QuestionCategory.driverPedestrianSigns => _one,
        QuestionCategory.trafficRules => _two,
        QuestionCategory.warningSigns => _three,
        QuestionCategory.prioritySigns => _four,
        QuestionCategory.prohibitionSigns => _five,
        QuestionCategory.directionSigns => _six,
        QuestionCategory.infoDisplaySigns => _seven,
        QuestionCategory.serviceSigns => _eight,
        QuestionCategory.additionalInfoSigns => _nine,
        QuestionCategory.roadworkSignals => _ten,
        QuestionCategory.regulatorySignals => _eleven,
        QuestionCategory.specialSignals => _twelve,
        QuestionCategory.emergencySignals => _thirteen,
        QuestionCategory.guidanceAudibleSigns => _fourteen,
        QuestionCategory.movementSteering => _fifteen,
        QuestionCategory.roundaboutApproach => _sixteen,
        QuestionCategory.travelSpeed => _seventeen,
        QuestionCategory.bufferZone => _eighteen,
        QuestionCategory.slipperySurface => _nineteen,
        QuestionCategory.crossroadCrossing => _twenty,
        QuestionCategory.railwayCrossing => _twentyone,
        QuestionCategory.motorwayTravel => _twentytwo,
        QuestionCategory.residentialPriority => _twentythree,
        QuestionCategory.parking => _twentyfour,
        QuestionCategory.educationalRoute => _twentyfive,
        QuestionCategory.pedestriansFreight => _twentysix,
        QuestionCategory.bicycleMopedCrossing => _twentyseven,
        QuestionCategory.roadMarking => _twentyeight,
        QuestionCategory.medicalAssistance => _twentynine,
        QuestionCategory.movementSafety => _thirty,
        QuestionCategory.administrativeLaw => _thirtyone,
        QuestionCategory.ecoDriving => _thirtytwo,
      };
}

const _one = [
  37,
  62,
  123,
  125,
  130,
  133,
  204,
  208,
  214,
  260,
  263,
  334,
  335,
  390,
  391,
  471,
  878,
  879,
  880,
  881,
  882,
  883,
  884,
  887,
  888,
  889,
  891,
  892,
  893,
  895,
  896,
  900,
  902,
  904,
  905,
  906,
  907,
  910,
  914,
  916,
  917,
  918,
  919,
  920,
  921,
  922,
  923,
  924,
  925,
  939,
  949,
  961,
  962,
  1053,
  1056,
  1059,
  1089,
  1091,
  1092,
  1093,
  1098,
  1106,
  1114,
  1125,
  1126,
  1219,
  1220,
  1224,
  1225,
  1226,
  1227,
  1228,
  1230,
  1340,
  1341,
  1342,
  1379,
  1380,
  1482,
  1486,
  1572,
];

const _two = [
  79,
  135,
  829,
  846,
  848,
  940,
  999,
  1000,
  1001,
  1057,
  1060,
  1069,
  1318,
  1321,
  1322,
  1325,
  1327,
  1328,
  1330,
  1331,
  1332,
  1336,
  1337,
  1338,
  1339,
  1484,
  1797,
  1802,
];

const _three = [
  256,
  497,
  601,
  602,
  603,
  604,
  605,
  606,
  607,
  608,
  609,
  610,
  611,
  612,
  613,
  614,
  615,
  616,
  617,
  618,
  620,
  622,
  625,
  626,
  628,
  630,
  631,
  633,
  635,
  636,
  638,
  639,
  640,
  641,
  642,
  645,
  646,
  647,
  649,
  650,
  651,
  652,
  653,
  721,
  807,
];

const _four = [
  654,
  655,
  656,
  657,
  658,
  659,
  660,
  661,
  662,
  663,
  664,
  665,
  666,
  667,
  668,
  669,
  670,
  671,
  1356,
  1357,
  1358,
  1359,
  1360,
  1361,
  1362,
  1363,
  1364,
  1403,
  1404,
  1405,
  1406,
  1407,
  1408,
  1409,
  1793,
];

const _five = [
  253,
  254,
  255,
  353,
  545,
  673,
  675,
  677,
  679,
  681,
  683,
  685,
  687,
  689,
  691,
  696,
  697,
  698,
  699,
  706,
  708,
  710,
  712,
  714,
  716,
  718,
  722,
  724,
  726,
  731,
  732,
  735,
  737,
  738,
  740,
  742,
  745,
  746,
  749,
  750,
  751,
  752,
  754,
  756,
  758,
  760,
  762,
  764,
  766,
  1102,
  1262,
  1410,
  1411,
  1412,
  1413,
  1414,
  1415,
  1416,
];

const _six = [
  64,
  370,
  375,
  621,
  1140,
  1142,
  1145,
  1147,
  1149,
  1151,
  1152,
  1154,
  1155,
  1156,
  1157,
  1159,
  1160,
  1161,
  1163,
  1164,
  1168,
  1170,
  1232,
  1417,
  1418,
  1419,
  1420,
  1421,
  1422,
  1423,
];

const _seven = [
  187,
  189,
  192,
  337,
  484,
  486,
  488,
  768,
  770,
  771,
  774,
  776,
  777,
  778,
  779,
  780,
  782,
  784,
  785,
  787,
  789,
  790,
  792,
  794,
  796,
  798,
  799,
  800,
  912,
  1234,
  1236,
  1238,
  1424,
  1425,
  1427,
  1429,
];

const _eight = [
  1171,
  1172,
  1173,
  1174,
  1175,
  1176,
  1177,
  1178,
  1179,
  1181,
  1182,
  1184,
  1185,
  1186,
  1187,
  1188,
  1189,
  1191,
  1192,
  1240,
  1432,
  1433,
  1434,
  1435,
  1436,
  1437,
];

const _nine = [
  1193,
  1196,
  1198,
  1199,
  1201,
  1203,
  1205,
  1208,
  1211,
  1213,
  1215,
  1216,
  1239,
  1241,
  1242,
  1243,
  1244,
  1245,
  1246,
  1438,
  1440,
  1441,
  1442,
  1443,
  1444,
];

const _ten = [
  3,
  4,
  8,
  14,
  19,
  21,
  22,
  23,
  61,
  63,
  75,
  95,
  100,
  102,
  103,
  104,
  105,
  106,
  107,
  108,
  109,
  110,
  115,
  116,
  118,
  126,
  141,
  142,
  143,
  144,
  145,
  146,
  147,
  148,
  149,
  150,
  151,
  152,
  153,
  154,
  156,
  157,
  158,
  159,
  160,
  164,
  165,
  166,
  167,
  168,
  169,
  170,
  175,
  176,
  177,
  178,
  181,
  182,
  183,
  184,
  185,
  186,
  191,
  249,
  327,
  349,
  389,
  465,
  466,
  467,
  477,
  480,
  490,
  1252,
  1276,
  1278,
  1279,
  1445,
  1446,
  1447,
  1448,
  1450,
  1451,
  1588,
  1604,
  1649,
];

const _eleven = [
  15,
  18,
  33,
  35,
  38,
  39,
  44,
  45,
  46,
  55,
  74,
  139,
  140,
  193,
  194,
  195,
  196,
  197,
  198,
  199,
  200,
  201,
  202,
  203,
  205,
  206,
  207,
  209,
  210,
  211,
  212,
  213,
  215,
  216,
  217,
  218,
  221,
  222,
  427,
  428,
  437,
  474,
  875,
  901,
  955,
  958,
  1024,
  1281,
  1282,
  1452,
  1453,
  1454,
  1455,
  1456,
  1457,
  1458,
];

const _twelve = [
  51,
  161,
  472,
  873,
  960,
  1002,
  1004,
  1005,
  1006,
  1007,
  1008,
  1009,
  1010,
  1013,
  1014,
  1015,
  1016,
  1017,
  1018,
  1019,
  1020,
  1021,
  1026,
  1028,
  1459,
  1460,
  1461,
  1462,
  1463,
  1464,
  1465,
];

const _thirteen = [
  344,
  356,
  473,
  491,
  569,
  897,
  964,
  1030,
  1032,
  1037,
  1038,
  1039,
  1040,
  1041,
  1042,
  1045,
  1047,
  1049,
  1086,
  1087,
  1088,
  1267,
  1466,
  1467,
  1468,
  1469,
  1470,
  1471,
  1472,
];

const _fourteen = [
  306,
  328,
  355,
  403,
  410,
  411,
  470,
  517,
  529,
  530,
  531,
  532,
  538,
  820,
  821,
  825,
  830,
  927,
  929,
  930,
  931,
  932,
  933,
  934,
  935,
  937,
  965,
  968,
  969,
  973,
  974,
  975,
  976,
  977,
  979,
  980,
  981,
  983,
  984,
  985,
  986,
  987,
  988,
  989,
  991,
  993,
  1034,
  1035,
  1306,
  1314,
  1473,
  1474,
  1477,
  1478,
  1479,
  1725,
  1726,
  1729,
  1730,
  1731,
  1732,
  1733,
  1734,
  1735,
  1736,
  1737,
  1739,
  1740,
  1741,
];

const _fifteen = [
  2,
  10,
  24,
  27,
  52,
  91,
  97,
  98,
  111,
  117,
  121,
  132,
  137,
  138,
  230,
  297,
  303,
  351,
  359,
  360,
  361,
  362,
  363,
  364,
  366,
  367,
  369,
  371,
  374,
  376,
  383,
  384,
  385,
  386,
  387,
  388,
  392,
  393,
  394,
  395,
  396,
  397,
  398,
  399,
  402,
  404,
  405,
  406,
  407,
  408,
  409,
  429,
  433,
  435,
  439,
  441,
  448,
  449,
  455,
  462,
  464,
  468,
  481,
  483,
  489,
  502,
  544,
  564,
  568,
  572,
  575,
  578,
  589,
  591,
  941,
  942,
  943,
  944,
  945,
  947,
  950,
  951,
  1048,
  1058,
  1334,
  1430,
  1480,
  1481,
  1483,
  1485,
  1804,
];

const _sixteen = [
  261,
  262,
  264,
  265,
  267,
  269,
  270,
  271,
  273,
  274,
  275,
  276,
  277,
  278,
  279,
  280,
  281,
  282,
  283,
  284,
  285,
  286,
  287,
  288,
  289,
  290,
  291,
  294,
  295,
  296,
  298,
  299,
  300,
  301,
  302,
  304,
  305,
  308,
  309,
  310,
  311,
  312,
  313,
  316,
  424,
  426,
  432,
  434,
  438,
  469,
  492,
  506,
  507,
  508,
  509,
  510,
  594,
  595,
  885,
  926,
  928,
  954,
  1165,
  1274,
  1487,
  1488,
  1489,
  1490,
  1491,
  1492,
  1493,
];

const _seventeen = [
  224,
  225,
  226,
  227,
  228,
  229,
  231,
  232,
  233,
  234,
  235,
  236,
  237,
  238,
  239,
  240,
  241,
  242,
  243,
  244,
  245,
  247,
  248,
  250,
  251,
  252,
  257,
  258,
  259,
  307,
  354,
  380,
  381,
  446,
  493,
  540,
  824,
  898,
  936,
  967,
  971,
  972,
  982,
  990,
  992,
  996,
  998,
  1158,
  1271,
  1273,
  1494,
  1495,
  1496,
  1497,
  1498,
  1499,
  1500,
  1809,
];

const _eighteen = [
  565,
  576,
  577,
  579,
  580,
  583,
  584,
  860,
  861,
  862,
  863,
  899,
  911,
  1003,
  1012,
  1022,
  1085,
  1285,
  1294,
  1295,
  1304,
  1307,
  1381,
  1428,
  1501,
  1502,
  1503,
  1504,
  1505,
  1506,
  1507,
  1695,
  1728,
];

const _nineteen = [
  292,
  314,
  315,
  317,
  318,
  319,
  320,
  321,
  322,
  323,
  324,
  326,
  329,
  330,
  339,
  340,
  341,
  342,
  343,
  345,
  346,
  348,
  350,
  352,
  357,
  358,
  372,
  373,
  443,
  463,
  475,
  478,
  479,
  482,
  485,
  487,
  494,
  495,
  496,
  499,
  501,
  536,
  803,
  811,
  817,
  886,
  894,
  957,
  959,
  1029,
  1031,
  1036,
  1043,
  1044,
  1247,
  1253,
  1263,
  1269,
  1508,
  1509,
  1510,
  1511,
  1512,
  1513,
  1514,
  1794,
  1795,
  1796,
  1800,
  1810,
];

const _twenty = [
  1,
  5,
  6,
  7,
  12,
  13,
  16,
  17,
  20,
  26,
  28,
  29,
  30,
  41,
  42,
  47,
  48,
  49,
  50,
  53,
  54,
  60,
  65,
  66,
  68,
  69,
  70,
  71,
  72,
  73,
  76,
  77,
  78,
  80,
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90,
  92,
  94,
  96,
  101,
  112,
  113,
  114,
  119,
  120,
  124,
  127,
  128,
  129,
  131,
  134,
  136,
  171,
  365,
  504,
  511,
  512,
  963,
  1025,
  1090,
  1094,
  1095,
  1096,
  1097,
  1099,
  1100,
  1101,
  1103,
  1104,
  1105,
  1107,
  1108,
  1109,
  1110,
  1111,
  1112,
  1113,
  1115,
  1116,
  1117,
  1118,
  1119,
  1120,
  1121,
  1122,
  1123,
  1124,
  1127,
  1128,
  1129,
  1130,
  1135,
  1250,
  1275,
  1365,
  1366,
  1367,
  1368,
  1369,
  1370,
  1371,
  1372,
  1373,
  1374,
  1375,
  1376,
  1377,
  1378,
  1515,
  1516,
  1517,
  1518,
  1519,
  1520,
  1521,
  1698,
];

const _twentyone = [
  155,
  162,
  179,
  180,
  377,
  412,
  413,
  414,
  415,
  416,
  417,
  418,
  419,
  420,
  421,
  422,
  423,
  425,
  430,
  431,
  436,
  440,
  442,
  444,
  908,
  1289,
  1291,
  1292,
  1293,
  1300,
  1302,
  1303,
  1310,
  1311,
  1312,
  1317,
  1319,
  1320,
  1323,
  1324,
  1343,
  1476,
];

const _twentytwo = [
  336,
  338,
  368,
  378,
  379,
  401,
  445,
  447,
  450,
  451,
  452,
  453,
  454,
  456,
  457,
  458,
  459,
  460,
  514,
  1344,
  1348,
  1350,
  1351,
  1352,
  1528,
  1529,
  1530,
  1531,
  1532,
  1533,
  1709,
  1710,
  1717,
  1724,
];

const _twentythree = [
  59,
  266,
  268,
  503,
  513,
  515,
  516,
  518,
  519,
  533,
  534,
  619,
  623,
  624,
  627,
  629,
  632,
  634,
  637,
  643,
  644,
  648,
  1050,
  1534,
  1535,
  1536,
  1537,
  1538,
  1539,
];

const _twentyfour = [
  461,
  539,
  541,
  542,
  546,
  547,
  548,
  549,
  550,
  551,
  552,
  553,
  554,
  555,
  556,
  557,
  558,
  559,
  560,
  561,
  562,
  563,
  566,
  567,
  570,
  590,
  695,
  701,
  703,
  707,
  711,
  715,
  723,
  729,
  739,
  741,
  743,
  753,
  755,
  757,
  759,
  761,
  763,
  765,
  767,
  1180,
  1540,
  1541,
  1542,
  1543,
  1544,
  1545,
  1798,
];

const _twentyfive = [
  672,
  674,
  676,
  678,
  680,
  682,
  684,
  686,
  688,
  690,
  692,
  693,
  694,
  700,
  702,
  704,
  705,
  709,
  713,
  717,
  719,
  720,
  725,
  727,
  728,
  730,
  733,
  734,
  736,
  744,
  747,
  748,
  903,
  1131,
  1132,
  1133,
  1134,
  1136,
  1137,
  1138,
  1546,
  1547,
  1548,
  1549,
  1550,
  1551,
];

const _twentysix = [
  325,
  331,
  332,
  333,
  476,
  571,
  573,
  574,
  581,
  585,
  586,
  587,
  812,
  813,
  814,
  815,
  816,
  845,
  847,
  849,
  868,
  869,
  870,
  946,
  1065,
  1139,
  1141,
  1143,
  1144,
  1146,
  1148,
  1150,
  1153,
  1162,
  1166,
  1167,
  1169,
  1272,
  1552,
  1553,
  1554,
  1555,
  1556,
  1557,
  1799,
  1806,
];

const _twentyseven = [
  99,
  163,
  172,
  173,
  174,
  188,
  190,
  223,
  246,
  520,
  521,
  522,
  523,
  524,
  525,
  526,
  527,
  528,
  535,
  537,
  769,
  772,
  773,
  775,
  781,
  783,
  786,
  788,
  791,
  793,
  795,
  797,
  806,
  808,
  809,
  822,
  826,
  938,
  997,
  1183,
  1218,
  1221,
  1222,
  1223,
  1229,
  1231,
  1233,
  1235,
  1237,
  1270,
  1333,
  1335,
  1558,
  1559,
  1560,
  1561,
  1562,
  1563,
  1808,
];

const _twentyeight = [
  347,
  400,
  876,
  877,
  948,
  952,
  1194,
  1195,
  1197,
  1200,
  1202,
  1204,
  1206,
  1207,
  1209,
  1210,
  1212,
  1214,
  1217,
  1248,
  1249,
  1254,
  1255,
  1256,
  1257,
  1258,
  1259,
  1260,
  1261,
  1564,
  1565,
  1566,
  1567,
  1568,
  1569,
];

const _twentynine = [
  498,
  500,
  505,
  543,
  588,
  592,
  593,
  596,
  597,
  598,
  599,
  600,
  810,
  871,
  872,
  890,
  909,
  913,
  915,
  966,
  970,
  1011,
  1023,
  1027,
  1046,
  1051,
  1054,
  1062,
  1063,
  1064,
  1071,
  1077,
  1078,
  1079,
  1084,
  1190,
  1251,
  1264,
  1265,
  1268,
  1277,
  1280,
  1283,
  1284,
  1389,
  1390,
  1391,
  1392,
  1393,
  1394,
  1395,
  1396,
  1397,
  1398,
  1399,
  1400,
  1401,
  1402,
  1522,
  1523,
  1524,
  1525,
  1526,
  1527,
  1570,
  1571,
  1573,
  1574,
  1575,
  1582,
  1583,
  1584,
  1585,
  1586,
  1587,
  1589,
  1590,
  1592,
  1593,
  1594,
  1595,
  1596,
  1597,
  1598,
  1599,
  1600,
  1601,
  1602,
  1603,
  1605,
  1606,
  1607,
  1610,
  1611,
  1612,
  1613,
  1614,
  1615,
  1616,
  1617,
  1618,
  1619,
  1620,
  1621,
  1622,
  1623,
  1624,
  1625,
  1626,
  1627,
  1628,
  1629,
  1630,
  1631,
  1632,
  1633,
  1634,
  1636,
  1637,
  1638,
  1639,
  1640,
  1641,
  1642,
  1643,
  1644,
  1645,
];

const _thirty = [
  9,
  11,
  25,
  31,
  32,
  34,
  36,
  40,
  43,
  56,
  57,
  58,
  67,
  93,
  122,
  219,
  220,
  272,
  293,
  382,
  582,
  801,
  802,
  804,
  805,
  818,
  819,
  823,
  827,
  828,
  831,
  832,
  833,
  834,
  835,
  836,
  837,
  838,
  839,
  840,
  841,
  842,
  843,
  850,
  851,
  852,
  853,
  854,
  855,
  856,
  857,
  858,
  859,
  864,
  865,
  866,
  867,
  874,
  953,
  956,
  978,
  994,
  995,
  1033,
  1055,
  1061,
  1066,
  1067,
  1068,
  1070,
  1286,
  1287,
  1288,
  1290,
  1296,
  1297,
  1298,
  1299,
  1301,
  1305,
  1308,
  1309,
  1313,
  1315,
  1316,
  1326,
  1382,
  1383,
  1384,
  1385,
  1386,
  1387,
  1388,
  1426,
  1431,
  1449,
  1475,
  1576,
  1577,
  1578,
  1579,
  1580,
  1581,
  1591,
  1608,
  1609,
  1635,
  1646,
  1647,
  1648,
  1650,
  1651,
  1652,
  1653,
  1654,
  1655,
  1656,
  1657,
  1658,
  1659,
  1660,
  1661,
  1662,
  1663,
  1664,
  1665,
  1666,
  1667,
  1668,
  1669,
  1670,
  1671,
  1672,
  1673,
  1674,
  1675,
  1676,
  1677,
  1678,
  1679,
  1680,
  1681,
  1682,
  1683,
  1684,
  1685,
  1686,
  1687,
  1688,
  1689,
  1690,
  1691,
  1692,
  1693,
  1694,
  1696,
  1697,
  1727,
  1738,
  1803,
  1805,
  1807,
];

const _thirtyone = [
  844,
  1052,
  1072,
  1073,
  1074,
  1075,
  1076,
  1080,
  1081,
  1082,
  1083,
  1266,
  1329,
  1345,
  1346,
  1347,
  1349,
  1353,
  1354,
  1355,
  1439,
  1699,
  1700,
  1701,
  1702,
  1703,
  1704,
  1705,
  1706,
  1707,
  1708,
  1711,
  1712,
  1713,
  1714,
  1715,
  1716,
  1718,
  1719,
  1720,
  1721,
  1722,
  1723,
  1811,
];

const _thirtytwo = [
  1742,
  1743,
  1744,
  1745,
  1746,
  1747,
  1748,
  1749,
  1750,
  1751,
  1752,
  1753,
  1754,
  1755,
  1756,
  1757,
  1758,
  1759,
  1760,
  1761,
  1762,
  1763,
  1764,
  1765,
  1766,
  1767,
  1768,
  1769,
  1770,
  1771,
  1772,
  1773,
  1774,
  1775,
  1776,
  1777,
  1778,
  1779,
  1780,
  1781,
  1782,
  1783,
  1784,
  1785,
  1786,
  1787,
  1788,
  1789,
  1790,
  1791,
  1792,
];
