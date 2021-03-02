from tabulate import tabulate
print(tabulate([['9:30', '', 'ME 3017', '', 'ME 3017', ''],
                ['11:00', '', '', '', '', ''],
                ['','', '', '', '', ''],
                ['2:00', 'COE 3001', 'MATH 3670', 'COE 3001', 'MATH 3670', 'COE 3001'],
                ['3:30', 'CS 1332', 'ME 3210', 'CS 1332', 'ME 3210', 'CS 1332'],
                ], headers=['Start time', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], tablefmt='orgtbl'))
