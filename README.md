# XV6 Scheduling and Syscalls

## Running 
`make qemu SCHEDULER = POLICY`  
POLICY = FCFS, PBS, MLFQ 

## Waitx Sys Call 
- Added creation time : ctime, Runtime  : rtime, and Endtime : etime to the proc structure
- Updates them for the child process. 
- It returns 0 for success and -1 for failure
- implemented time program using it

## Getpinfo Sys Call
- Updates the structure passed through it with the required information for each process.
- It is implemented by adding additional variables to the proc structure and updating them accordingly
- It returns 0 for success and -1 for failure

## Implementation of FCFS 
- Select a process by round robin system
- Search through the process table for any process with creation time less than the selected process and replace the process with it.

## Implementation PBS 
- Added priority to the proc strucuture with default value 60
- Select a process by round robin system
- Search through the process table for any process with priority greater than the selected process and replace the process with it. 
- Created a syscall set_priority(int priority, int pid) which updates the priority of process with given pid, if pid == 0 updates the priority of calling process.

## Implementation of MLFQ 
- It is implemented by creating multiple(5) queues and adding and removing process from each queue
- The process is inserted into lower priority queue if it has completed 2^i ticks in queue i (ranges from 0 to 3)
- For the last queue, the process is selected by round robin
- Starvation is prevented by inserting the process into higher level queue if it has not been run for 1000 ticks.

## Comparasion between various Scheduling policies
- MLFQ and Round Robin were the fastest
- MLFQ is best for IO bound processes as they need only few ticks and hence are not waiting for CPU bound processes to finish execution.
- PBS is best if we want a higher priority process to finish execution fast as it will be given more priority at each scheduling cycle.
- FCFS is the worst among the given processes as it will always schedule the oldest process, so if a I/O bound process follows a CPU bound process, it has to unnecessarily wait for the latter to finish.

## Benchmark Program Results
Benchmark runs 10 child which performs some random computations then sleep and continue it for some time. 
- DEFAULT
```
    PID == 12
    Run_time = 433
    Num_run = 675
    current_queue=0
    test 8 ended

    PID == 9
    Run_time = 474
    Num_run = 720
    current_queue=0
    test 5 ended

    PID == 13
    Run_time = 468
    Num_run = 725
    current_queue=0
    test 9 ended

    PID == 5
    Run_time = 515
    Num_run = 803
    current_queue=0
    test 1 ended

    PID == 8
    Run_time = 515
    Num_run = 784
    current_queue=0
    test 4 ended

    PID == 4
    Run_time = 536
    Num_run = 821
    current_queue=0
    test 0 ended

    PID == 11
    Run_time = 513
    Num_run = 781
    current_queue=0
    test 7 ended

    PID == 7
    Run_time = 537
    Num_run = 805
    current_queue=0
    test 3 ended

    PID == 10
    Run_time = 612
    Num_run = 888
    current_queue=0
    test 6 ended

    PID == 6
    Run_time = 605
    Num_run = 897
    current_queue=0
    test 2 ended

```
- FCFS
```
    PID == 4
    Run_time = 594
    Num_run = 1069
    current_queue=0
    test 0 ended

    PID == 6
    Run_time = 601
    Num_run = 1082
    current_queue=0
    test 2 ended

    PID == 5
    Run_time = 621
    Num_run = 1094
    current_queue=0
    test 1 ended

    PID == 7
    Run_time = 672
    Num_run = 1137
    current_queue=0
    test 3 ended

    PID == 8
    Run_time = 369
    Num_run = 739
    current_queue=0
    test 4 ended

    PID == 10
    Run_time = 392
    Num_run = 789
    current_queue=0
    test 6 ended

    PID == 11
    Run_time = 398
    Num_run = 806
    current_queue=0
    test 7 ended

    PID == 9
    Run_time = 523
    Num_run = 926
    current_queue=0
    test 5 ended

    PID == 12
    Run_time = 442
    Num_run = 808
    current_queue=0
    test 8 ended

    PID == 13
    Run_time = 495
    Num_run = 850
    current_queue=0
    test 9 ended

```
- Priority
```
    PID == 13
    Run_time = 506
    Num_run = 1002
    test 9 ended

    PID == 12
    Run_time = 563
    Num_run = 1054
    test 8 ended

    PID == 11
    Run_time = 859
    Num_run = 1300
    test 7 ended

    PID == 10
    Run_time = 457
    Num_run = 848
    test 6 ended

    PID == 9
    Run_time = 569
    Num_run = 986
    test 5 ended

    PID == 8
    Run_time = 467
    Num_run = 875
    test 4 ended

    PID == 7
    Run_time = 557
    Num_run = 957
    test 3 ended

    PID == 6
    Run_time = 509
    Num_run = 892
    test 2 ended

    PID == 5
    Run_time = 566
    Num_run = 904
    test 1 ended

    PID == 4
    Run_time = 479
    Num_run = 825
    test 0 ended

```
- MLFQ
```
    PID == 9
    Run_time = 478
    Num_run = 709
    current_queue=4
    ticks : 1 2 4 8 693 
    test 5 ended

    PID == 6
    Run_time = 486
    Num_run = 736
    current_queue=4
    ticks : 1 2 4 8 720 
    test 2 ended

    PID == 7
    Run_time = 508
    Num_run = 762
    current_queue=4
    ticks : 1 2 4 8 746 
    test 3 ended

    PID == 13
    Run_time = 519
    Num_run = 767
    current_queue=4
    ticks : 1 2 4 8 751 
    test 9 ended

    PID == 5
    Run_time = 566
    Num_run = 817
    current_queue=4
    ticks : 1 2 4 8 801 
    test 1 ended

    PID == 10
    Run_time = 553
    Num_run = 800
    current_queue=4
    ticks : 1 2 4 8 784 
    test 6 ended

    PID == 12
    Run_time = 565
    Num_run = 815
    current_queue=4
    ticks : 1 2 4 8 799 
    test 8 ended

    PID == 8
    Run_time = 556
    Num_run = 821
    current_queue=4
    ticks : 1 2 4 8 805 
    test 4 ended

    PID == 11
    Run_time = 582
    Num_run = 848
    current_queue=4
    ticks : 1 2 4 8 832 
    test 7 ended

    PID == 4
    Run_time = 594
    Num_run = 870
    current_queue=4
    ticks : 1 2 4 8 854 
    test 0 ended

```

## Test Program Results
test runs 3 programs test1, test2, test3 which performs some random computations then sleep and continue it for some time. 
- DEFAULT
```
    test 3 ended
    wait = 1095 run = 1710
    test 2 ended
    wait = 1187 run = 1695
    test 1 ended
    wait = 1196 run = 1917
```
- FCFS
```
    Creation time : test1 < test2 < test3
    test 1 ended
    wait = 496 run = 2507
    test 2 ended
    wait = 1535 run = 2350
    test 3 ended
    wait = 1710 run = 2559
```
- Priority
```
    Priority: test1 > test2 > test3
    test 1 ended
    wait = 499 run = 2525
    test 2 ended
    wait = 509 run = 2491
    test 3 ended
    wait = 3187 run = 2621
```
- MLFQ
```
    test 1 ended
    PID == 10
    Run_time = 1696
    Num_run = 2096
    current_queue=4
    ticks : 1 2 4 8 2080 
    wait = 1145 run = 1697

    test 2 ended
    PID == 9
    Run_time = 1791
    Num_run = 2186
    current_queue=4
    ticks : 1 2 4 8 2170 
    wait = 1113 run = 1792

    test 3 ended
    PID == 8
    Run_time = 2147
    Num_run = 2566
    current_queue=4
    ticks : 1 2 4 8 2550 
    wait = 1408 run = 2148
