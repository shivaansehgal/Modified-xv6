
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"


int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp
	if (argc != 2){
  14:	83 39 02             	cmpl   $0x2,(%ecx)
#include "user.h"


int
main(int argc, char *argv[])
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	if (argc != 2){
  1a:	74 13                	je     2f <main+0x2f>
				printf(1, "Usage: sanity [n]\n");
  1c:	50                   	push   %eax
  1d:	50                   	push   %eax
  1e:	68 80 09 00 00       	push   $0x980
  23:	6a 01                	push   $0x1
  25:	e8 36 06 00 00       	call   660 <printf>
				exit();
  2a:	e8 c3 04 00 00       	call   4f2 <exit>
	int stime;
	int sums[3][3];
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sums[i][j] = 0;
	n = atoi(argv[1]);
  2f:	83 ec 0c             	sub    $0xc,%esp
  32:	ff 70 04             	pushl  0x4(%eax)
	int rutime;
	int stime;
	int sums[3][3];
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sums[i][j] = 0;
  35:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
  3c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
  43:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  4a:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  51:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  58:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  5f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  66:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	n = atoi(argv[1]);
  74:	e8 07 04 00 00       	call   480 <atoi>
	int pid;
	for (i = 0; i < n; i++) {
  79:	83 c4 10             	add    $0x10,%esp
  7c:	85 c0                	test   %eax,%eax
	int stime;
	int sums[3][3];
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sums[i][j] = 0;
	n = atoi(argv[1]);
  7e:	89 c3                	mov    %eax,%ebx
	int pid;
	for (i = 0; i < n; i++) {
  80:	0f 8e 58 01 00 00    	jle    1de <main+0x1de>
  86:	31 f6                	xor    %esi,%esi
		j = i % 3;
		pid = fork();
  88:	e8 5d 04 00 00       	call   4ea <fork>
		if (pid == 0) {//child
  8d:	85 c0                	test   %eax,%eax
  8f:	0f 84 c9 00 00 00    	je     15e <main+0x15e>
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sums[i][j] = 0;
	n = atoi(argv[1]);
	int pid;
	for (i = 0; i < n; i++) {
  95:	83 c6 01             	add    $0x1,%esi
  98:	39 f3                	cmp    %esi,%ebx
  9a:	75 ec                	jne    88 <main+0x88>
  9c:	31 ff                	xor    %edi,%edi
		continue; // father continues to spawn the next child
	}
	for (i = 0; i < n; i++) {
		pid = wait2(&retime, &rutime, &stime);
		int res = (pid - 4) % 3; // correlates to j in the dispatching loop
		switch(res) {
  9e:	89 de                	mov    %ebx,%esi
  a0:	eb 4d                	jmp    ef <main+0xef>
  a2:	83 fb 02             	cmp    $0x2,%ebx
  a5:	0f 84 c4 01 00 00    	je     26f <main+0x26f>
  ab:	85 db                	test   %ebx,%ebx
  ad:	75 35                	jne    e4 <main+0xe4>
			case 0: // CPU bound processes
				printf(1, "CPU-bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
  af:	8b 55 b8             	mov    -0x48(%ebp),%edx
  b2:	8b 5d bc             	mov    -0x44(%ebp),%ebx
  b5:	50                   	push   %eax
  b6:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
  b9:	03 45 c0             	add    -0x40(%ebp),%eax
  bc:	50                   	push   %eax
  bd:	ff 75 c0             	pushl  -0x40(%ebp)
  c0:	53                   	push   %ebx
  c1:	52                   	push   %edx
  c2:	51                   	push   %ecx
  c3:	68 94 09 00 00       	push   $0x994
  c8:	6a 01                	push   $0x1
  ca:	e8 91 05 00 00       	call   660 <printf>
				sums[0][0] += retime;
  cf:	8b 45 b8             	mov    -0x48(%ebp),%eax
  d2:	01 45 c4             	add    %eax,-0x3c(%ebp)
				sums[0][1] += rutime;
				sums[0][2] += stime;
				break;
  d5:	83 c4 20             	add    $0x20,%esp
		int res = (pid - 4) % 3; // correlates to j in the dispatching loop
		switch(res) {
			case 0: // CPU bound processes
				printf(1, "CPU-bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
				sums[0][0] += retime;
				sums[0][1] += rutime;
  d8:	8b 45 bc             	mov    -0x44(%ebp),%eax
  db:	01 45 c8             	add    %eax,-0x38(%ebp)
				sums[0][2] += stime;
  de:	8b 45 c0             	mov    -0x40(%ebp),%eax
  e1:	01 45 cc             	add    %eax,-0x34(%ebp)
			}
			exit(); // children exit here
		}
		continue; // father continues to spawn the next child
	}
	for (i = 0; i < n; i++) {
  e4:	83 c7 01             	add    $0x1,%edi
  e7:	39 fe                	cmp    %edi,%esi
  e9:	0f 84 ed 00 00 00    	je     1dc <main+0x1dc>
		pid = wait2(&retime, &rutime, &stime);
  ef:	8d 45 c0             	lea    -0x40(%ebp),%eax
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	50                   	push   %eax
  f6:	8d 45 bc             	lea    -0x44(%ebp),%eax
  f9:	50                   	push   %eax
  fa:	8d 45 b8             	lea    -0x48(%ebp),%eax
  fd:	50                   	push   %eax
  fe:	e8 a7 04 00 00       	call   5aa <wait2>
		int res = (pid - 4) % 3; // correlates to j in the dispatching loop
		switch(res) {
 103:	8d 58 fc             	lea    -0x4(%eax),%ebx
			exit(); // children exit here
		}
		continue; // father continues to spawn the next child
	}
	for (i = 0; i < n; i++) {
		pid = wait2(&retime, &rutime, &stime);
 106:	89 c1                	mov    %eax,%ecx
		int res = (pid - 4) % 3; // correlates to j in the dispatching loop
		switch(res) {
 108:	b8 56 55 55 55       	mov    $0x55555556,%eax
 10d:	83 c4 10             	add    $0x10,%esp
 110:	f7 eb                	imul   %ebx
 112:	89 d8                	mov    %ebx,%eax
 114:	c1 f8 1f             	sar    $0x1f,%eax
 117:	29 c2                	sub    %eax,%edx
 119:	8d 04 52             	lea    (%edx,%edx,2),%eax
 11c:	29 c3                	sub    %eax,%ebx
 11e:	83 fb 01             	cmp    $0x1,%ebx
 121:	0f 85 7b ff ff ff    	jne    a2 <main+0xa2>
				sums[0][0] += retime;
				sums[0][1] += rutime;
				sums[0][2] += stime;
				break;
			case 1: // CPU bound processes, short tasks
				printf(1, "CPU-S bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
 127:	8b 55 b8             	mov    -0x48(%ebp),%edx
 12a:	8b 5d bc             	mov    -0x44(%ebp),%ebx
 12d:	50                   	push   %eax
 12e:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
 131:	03 45 c0             	add    -0x40(%ebp),%eax
 134:	50                   	push   %eax
 135:	ff 75 c0             	pushl  -0x40(%ebp)
 138:	53                   	push   %ebx
 139:	52                   	push   %edx
 13a:	51                   	push   %ecx
 13b:	68 e0 09 00 00       	push   $0x9e0
 140:	6a 01                	push   $0x1
 142:	e8 19 05 00 00       	call   660 <printf>
				sums[1][0] += retime;
 147:	8b 45 b8             	mov    -0x48(%ebp),%eax
				sums[1][1] += rutime;
				sums[1][2] += stime;
				break;
 14a:	83 c4 20             	add    $0x20,%esp
				sums[0][1] += rutime;
				sums[0][2] += stime;
				break;
			case 1: // CPU bound processes, short tasks
				printf(1, "CPU-S bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
				sums[1][0] += retime;
 14d:	01 45 d0             	add    %eax,-0x30(%ebp)
				sums[1][1] += rutime;
 150:	8b 45 bc             	mov    -0x44(%ebp),%eax
 153:	01 45 d4             	add    %eax,-0x2c(%ebp)
				sums[1][2] += stime;
 156:	8b 45 c0             	mov    -0x40(%ebp),%eax
 159:	01 45 d8             	add    %eax,-0x28(%ebp)
				break;
 15c:	eb 86                	jmp    e4 <main+0xe4>
	int pid;
	for (i = 0; i < n; i++) {
		j = i % 3;
		pid = fork();
		if (pid == 0) {//child
			j = (getpid() - 4) % 3; // ensures independence from the first son's pid when gathering the results in the second part of the program
 15e:	e8 0f 04 00 00       	call   572 <getpid>
			switch(j) {
 163:	83 e8 04             	sub    $0x4,%eax
 166:	b9 03 00 00 00       	mov    $0x3,%ecx
 16b:	99                   	cltd   
 16c:	f7 f9                	idiv   %ecx
 16e:	83 fa 01             	cmp    $0x1,%edx
 171:	74 51                	je     1c4 <main+0x1c4>
 173:	83 fa 02             	cmp    $0x2,%edx
 176:	74 2a                	je     1a2 <main+0x1a2>
 178:	85 d2                	test   %edx,%edx
 17a:	74 05                	je     181 <main+0x181>
		for (j = 0; j < 3; j++)
			sums[i][j] /= n;
	printf(1, "\n\nCPU bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[0][0], sums[0][1], sums[0][2], sums[0][0] + sums[0][1] + sums[0][2]);
	printf(1, "CPU-S bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[1][0], sums[1][1], sums[1][2], sums[1][0] + sums[1][1] + sums[1][2]);
	printf(1, "I/O bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[2][0], sums[2][1], sums[2][2], sums[2][0] + sums[2][1] + sums[2][2]);
	exit();
 17c:	e8 71 03 00 00       	call   4f2 <exit>
	for (i = 0; i < n; i++) {
		j = i % 3;
		pid = fork();
		if (pid == 0) {//child
			j = (getpid() - 4) % 3; // ensures independence from the first son's pid when gathering the results in the second part of the program
			switch(j) {
 181:	d9 ee                	fldz   
				case 0: //CPU‐bound process (CPU):
						for (double z = 0; z < 1000000.0; z+= 0.1){
 183:	dd 05 e0 0b 00 00    	fldl   0xbe0
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	dc c1                	fadd   %st,%st(1)
 192:	d9 05 e8 0b 00 00    	flds   0xbe8
 198:	df ea                	fucomip %st(2),%st
 19a:	77 f4                	ja     190 <main+0x190>
 19c:	dd d8                	fstp   %st(0)
 19e:	dd d8                	fstp   %st(0)
 1a0:	eb da                	jmp    17c <main+0x17c>
	for (i = 0; i < n; i++) {
		j = i % 3;
		pid = fork();
		if (pid == 0) {//child
			j = (getpid() - 4) % 3; // ensures independence from the first son's pid when gathering the results in the second part of the program
			switch(j) {
 1a2:	bb 64 00 00 00       	mov    $0x64,%ebx
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
						yield();
					}
					break;
				case 2:// simulate I/O bound process (IO)
					for(k = 0; k < 100; k++){
						sleep(1);
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	e8 c8 03 00 00       	call   582 <sleep>
						for (j = 0; j < 1000000; j++){}
						yield();
					}
					break;
				case 2:// simulate I/O bound process (IO)
					for(k = 0; k < 100; k++){
 1ba:	83 c4 10             	add    $0x10,%esp
 1bd:	83 eb 01             	sub    $0x1,%ebx
 1c0:	75 ee                	jne    1b0 <main+0x1b0>
 1c2:	eb b8                	jmp    17c <main+0x17c>
	for (i = 0; i < n; i++) {
		j = i % 3;
		pid = fork();
		if (pid == 0) {//child
			j = (getpid() - 4) % 3; // ensures independence from the first son's pid when gathering the results in the second part of the program
			switch(j) {
 1c4:	bb 64 00 00 00       	mov    $0x64,%ebx
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
					}
					break;
				case 1: //short tasks based CPU‐bound process (S‐CPU):
					for (k = 0; k < 100; k++){
						for (j = 0; j < 1000000; j++){}
						yield();
 1d0:	e8 dd 03 00 00       	call   5b2 <yield>
						for (double z = 0; z < 1000000.0; z+= 0.1){
				         double x =  x + 3.14 * 89.64;   // useless calculations to consume CPU time
					}
					break;
				case 1: //short tasks based CPU‐bound process (S‐CPU):
					for (k = 0; k < 100; k++){
 1d5:	83 eb 01             	sub    $0x1,%ebx
 1d8:	75 f6                	jne    1d0 <main+0x1d0>
 1da:	eb a0                	jmp    17c <main+0x17c>
 1dc:	89 f3                	mov    %esi,%ebx
 1de:	8d 4d c4             	lea    -0x3c(%ebp),%ecx
 1e1:	8d 75 e8             	lea    -0x18(%ebp),%esi
				break;
		}
	}
	for (i = 0; i < 3; i++)
		for (j = 0; j < 3; j++)
			sums[i][j] /= n;
 1e4:	8b 01                	mov    (%ecx),%eax
 1e6:	83 c1 0c             	add    $0xc,%ecx
 1e9:	99                   	cltd   
 1ea:	f7 fb                	idiv   %ebx
 1ec:	89 41 f4             	mov    %eax,-0xc(%ecx)
 1ef:	8b 41 f8             	mov    -0x8(%ecx),%eax
 1f2:	99                   	cltd   
 1f3:	f7 fb                	idiv   %ebx
 1f5:	89 41 f8             	mov    %eax,-0x8(%ecx)
 1f8:	8b 41 fc             	mov    -0x4(%ecx),%eax
 1fb:	99                   	cltd   
 1fc:	f7 fb                	idiv   %ebx
 1fe:	89 41 fc             	mov    %eax,-0x4(%ecx)
				sums[2][1] += rutime;
				sums[2][2] += stime;
				break;
		}
	}
	for (i = 0; i < 3; i++)
 201:	39 f1                	cmp    %esi,%ecx
 203:	75 df                	jne    1e4 <main+0x1e4>
		for (j = 0; j < 3; j++)
			sums[i][j] /= n;
	printf(1, "\n\nCPU bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[0][0], sums[0][1], sums[0][2], sums[0][0] + sums[0][1] + sums[0][2]);
 205:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 208:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 20b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
 20e:	50                   	push   %eax
 20f:	50                   	push   %eax
 210:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 213:	01 d8                	add    %ebx,%eax
 215:	50                   	push   %eax
 216:	53                   	push   %ebx
 217:	51                   	push   %ecx
 218:	52                   	push   %edx
 219:	68 78 0a 00 00       	push   $0xa78
 21e:	6a 01                	push   $0x1
 220:	e8 3b 04 00 00       	call   660 <printf>
	printf(1, "CPU-S bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[1][0], sums[1][1], sums[1][2], sums[1][0] + sums[1][1] + sums[1][2]);
 225:	8b 55 d0             	mov    -0x30(%ebp),%edx
 228:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 22b:	83 c4 18             	add    $0x18,%esp
 22e:	8b 5d d8             	mov    -0x28(%ebp),%ebx
 231:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 234:	01 d8                	add    %ebx,%eax
 236:	50                   	push   %eax
 237:	53                   	push   %ebx
 238:	51                   	push   %ecx
 239:	52                   	push   %edx
 23a:	68 f0 0a 00 00       	push   $0xaf0
 23f:	6a 01                	push   $0x1
 241:	e8 1a 04 00 00       	call   660 <printf>
	printf(1, "I/O bound:\nAverage ready time: %d\nAverage running time: %d\nAverage sleeping time: %d\nAverage turnaround time: %d\n\n\n", sums[2][0], sums[2][1], sums[2][2], sums[2][0] + sums[2][1] + sums[2][2]);
 246:	8b 55 dc             	mov    -0x24(%ebp),%edx
 249:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 24c:	83 c4 18             	add    $0x18,%esp
 24f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 252:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 255:	01 d8                	add    %ebx,%eax
 257:	50                   	push   %eax
 258:	53                   	push   %ebx
 259:	51                   	push   %ecx
 25a:	52                   	push   %edx
 25b:	68 68 0b 00 00       	push   $0xb68
 260:	6a 01                	push   $0x1
 262:	e8 f9 03 00 00       	call   660 <printf>
	exit();
 267:	83 c4 20             	add    $0x20,%esp
 26a:	e9 0d ff ff ff       	jmp    17c <main+0x17c>
				sums[1][0] += retime;
				sums[1][1] += rutime;
				sums[1][2] += stime;
				break;
			case 2: // simulating I/O bound processes
				printf(1, "I/O bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
 26f:	8b 55 b8             	mov    -0x48(%ebp),%edx
 272:	8b 5d bc             	mov    -0x44(%ebp),%ebx
 275:	50                   	push   %eax
 276:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
 279:	03 45 c0             	add    -0x40(%ebp),%eax
 27c:	50                   	push   %eax
 27d:	ff 75 c0             	pushl  -0x40(%ebp)
 280:	53                   	push   %ebx
 281:	52                   	push   %edx
 282:	51                   	push   %ecx
 283:	68 2c 0a 00 00       	push   $0xa2c
 288:	6a 01                	push   $0x1
 28a:	e8 d1 03 00 00       	call   660 <printf>
				sums[2][0] += retime;
 28f:	8b 45 b8             	mov    -0x48(%ebp),%eax
				sums[2][1] += rutime;
				sums[2][2] += stime;
				break;
 292:	83 c4 20             	add    $0x20,%esp
				sums[1][1] += rutime;
				sums[1][2] += stime;
				break;
			case 2: // simulating I/O bound processes
				printf(1, "I/O bound, pid: %d, ready: %d, running: %d, sleeping: %d, turnaround: %d\n", pid, retime, rutime, stime, retime + rutime + stime);
				sums[2][0] += retime;
 295:	01 45 dc             	add    %eax,-0x24(%ebp)
				sums[2][1] += rutime;
 298:	8b 45 bc             	mov    -0x44(%ebp),%eax
 29b:	01 45 e0             	add    %eax,-0x20(%ebp)
				sums[2][2] += stime;
 29e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 2a1:	01 45 e4             	add    %eax,-0x1c(%ebp)
				break;
 2a4:	e9 3b fe ff ff       	jmp    e4 <main+0xe4>
 2a9:	66 90                	xchg   %ax,%ax
 2ab:	66 90                	xchg   %ax,%ax
 2ad:	66 90                	xchg   %ax,%ax
 2af:	90                   	nop

000002b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ba:	89 c2                	mov    %eax,%edx
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	83 c1 01             	add    $0x1,%ecx
 2c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2c7:	83 c2 01             	add    $0x1,%edx
 2ca:	84 db                	test   %bl,%bl
 2cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2cf:	75 ef                	jne    2c0 <strcpy+0x10>
    ;
  return os;
}
 2d1:	5b                   	pop    %ebx
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
 2e5:	8b 55 08             	mov    0x8(%ebp),%edx
 2e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2eb:	0f b6 02             	movzbl (%edx),%eax
 2ee:	0f b6 19             	movzbl (%ecx),%ebx
 2f1:	84 c0                	test   %al,%al
 2f3:	75 1e                	jne    313 <strcmp+0x33>
 2f5:	eb 29                	jmp    320 <strcmp+0x40>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 300:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 303:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 306:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 309:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 30d:	84 c0                	test   %al,%al
 30f:	74 0f                	je     320 <strcmp+0x40>
 311:	89 f1                	mov    %esi,%ecx
 313:	38 d8                	cmp    %bl,%al
 315:	74 e9                	je     300 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 317:	29 d8                	sub    %ebx,%eax
}
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 320:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 322:	29 d8                	sub    %ebx,%eax
}
 324:	5b                   	pop    %ebx
 325:	5e                   	pop    %esi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	90                   	nop
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <strlen>:

uint
strlen(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 336:	80 39 00             	cmpb   $0x0,(%ecx)
 339:	74 12                	je     34d <strlen+0x1d>
 33b:	31 d2                	xor    %edx,%edx
 33d:	8d 76 00             	lea    0x0(%esi),%esi
 340:	83 c2 01             	add    $0x1,%edx
 343:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 347:	89 d0                	mov    %edx,%eax
 349:	75 f5                	jne    340 <strlen+0x10>
    ;
  return n;
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 34d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	eb 0d                	jmp    360 <memset>
 353:	90                   	nop
 354:	90                   	nop
 355:	90                   	nop
 356:	90                   	nop
 357:	90                   	nop
 358:	90                   	nop
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 367:	8b 4d 10             	mov    0x10(%ebp),%ecx
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 d7                	mov    %edx,%edi
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 372:	89 d0                	mov    %edx,%eax
 374:	5f                   	pop    %edi
 375:	5d                   	pop    %ebp
 376:	c3                   	ret    
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <strchr>:

char*
strchr(const char *s, char c)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 45 08             	mov    0x8(%ebp),%eax
 387:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 38a:	0f b6 10             	movzbl (%eax),%edx
 38d:	84 d2                	test   %dl,%dl
 38f:	74 1d                	je     3ae <strchr+0x2e>
    if(*s == c)
 391:	38 d3                	cmp    %dl,%bl
 393:	89 d9                	mov    %ebx,%ecx
 395:	75 0d                	jne    3a4 <strchr+0x24>
 397:	eb 17                	jmp    3b0 <strchr+0x30>
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	38 ca                	cmp    %cl,%dl
 3a2:	74 0c                	je     3b0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3a4:	83 c0 01             	add    $0x1,%eax
 3a7:	0f b6 10             	movzbl (%eax),%edx
 3aa:	84 d2                	test   %dl,%dl
 3ac:	75 f2                	jne    3a0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3ae:	31 c0                	xor    %eax,%eax
}
 3b0:	5b                   	pop    %ebx
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    
 3b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <gets>:

char*
gets(char *buf, int max)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 3c8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 3cb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ce:	eb 29                	jmp    3f9 <gets+0x39>
    cc = read(0, &c, 1);
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	6a 01                	push   $0x1
 3d5:	57                   	push   %edi
 3d6:	6a 00                	push   $0x0
 3d8:	e8 2d 01 00 00       	call   50a <read>
    if(cc < 1)
 3dd:	83 c4 10             	add    $0x10,%esp
 3e0:	85 c0                	test   %eax,%eax
 3e2:	7e 1d                	jle    401 <gets+0x41>
      break;
    buf[i++] = c;
 3e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3e8:	8b 55 08             	mov    0x8(%ebp),%edx
 3eb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 3ed:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 3ef:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3f3:	74 1b                	je     410 <gets+0x50>
 3f5:	3c 0d                	cmp    $0xd,%al
 3f7:	74 17                	je     410 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f9:	8d 5e 01             	lea    0x1(%esi),%ebx
 3fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ff:	7c cf                	jl     3d0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 401:	8b 45 08             	mov    0x8(%ebp),%eax
 404:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 408:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40b:	5b                   	pop    %ebx
 40c:	5e                   	pop    %esi
 40d:	5f                   	pop    %edi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 410:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 413:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 415:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 419:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41c:	5b                   	pop    %ebx
 41d:	5e                   	pop    %esi
 41e:	5f                   	pop    %edi
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    
 421:	eb 0d                	jmp    430 <stat>
 423:	90                   	nop
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <stat>:

int
stat(const char *n, struct stat *st)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 435:	83 ec 08             	sub    $0x8,%esp
 438:	6a 00                	push   $0x0
 43a:	ff 75 08             	pushl  0x8(%ebp)
 43d:	e8 f0 00 00 00       	call   532 <open>
  if(fd < 0)
 442:	83 c4 10             	add    $0x10,%esp
 445:	85 c0                	test   %eax,%eax
 447:	78 27                	js     470 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 449:	83 ec 08             	sub    $0x8,%esp
 44c:	ff 75 0c             	pushl  0xc(%ebp)
 44f:	89 c3                	mov    %eax,%ebx
 451:	50                   	push   %eax
 452:	e8 f3 00 00 00       	call   54a <fstat>
 457:	89 c6                	mov    %eax,%esi
  close(fd);
 459:	89 1c 24             	mov    %ebx,(%esp)
 45c:	e8 b9 00 00 00       	call   51a <close>
  return r;
 461:	83 c4 10             	add    $0x10,%esp
 464:	89 f0                	mov    %esi,%eax
}
 466:	8d 65 f8             	lea    -0x8(%ebp),%esp
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
 46d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 470:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 475:	eb ef                	jmp    466 <stat+0x36>
 477:	89 f6                	mov    %esi,%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 487:	0f be 11             	movsbl (%ecx),%edx
 48a:	8d 42 d0             	lea    -0x30(%edx),%eax
 48d:	3c 09                	cmp    $0x9,%al
 48f:	b8 00 00 00 00       	mov    $0x0,%eax
 494:	77 1f                	ja     4b5 <atoi+0x35>
 496:	8d 76 00             	lea    0x0(%esi),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4a3:	83 c1 01             	add    $0x1,%ecx
 4a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4aa:	0f be 11             	movsbl (%ecx),%edx
 4ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4b0:	80 fb 09             	cmp    $0x9,%bl
 4b3:	76 eb                	jbe    4a0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 4b5:	5b                   	pop    %ebx
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	90                   	nop
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
 4c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ce:	85 db                	test   %ebx,%ebx
 4d0:	7e 14                	jle    4e6 <memmove+0x26>
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4df:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e2:	39 da                	cmp    %ebx,%edx
 4e4:	75 f2                	jne    4d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ea:	b8 01 00 00 00       	mov    $0x1,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <exit>:
SYSCALL(exit)
 4f2:	b8 02 00 00 00       	mov    $0x2,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <wait>:
SYSCALL(wait)
 4fa:	b8 03 00 00 00       	mov    $0x3,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <pipe>:
SYSCALL(pipe)
 502:	b8 04 00 00 00       	mov    $0x4,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <read>:
SYSCALL(read)
 50a:	b8 05 00 00 00       	mov    $0x5,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <write>:
SYSCALL(write)
 512:	b8 10 00 00 00       	mov    $0x10,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <close>:
SYSCALL(close)
 51a:	b8 15 00 00 00       	mov    $0x15,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <kill>:
SYSCALL(kill)
 522:	b8 06 00 00 00       	mov    $0x6,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <exec>:
SYSCALL(exec)
 52a:	b8 07 00 00 00       	mov    $0x7,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <open>:
SYSCALL(open)
 532:	b8 0f 00 00 00       	mov    $0xf,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <mknod>:
SYSCALL(mknod)
 53a:	b8 11 00 00 00       	mov    $0x11,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <unlink>:
SYSCALL(unlink)
 542:	b8 12 00 00 00       	mov    $0x12,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <fstat>:
SYSCALL(fstat)
 54a:	b8 08 00 00 00       	mov    $0x8,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <link>:
SYSCALL(link)
 552:	b8 13 00 00 00       	mov    $0x13,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <mkdir>:
SYSCALL(mkdir)
 55a:	b8 14 00 00 00       	mov    $0x14,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <chdir>:
SYSCALL(chdir)
 562:	b8 09 00 00 00       	mov    $0x9,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <dup>:
SYSCALL(dup)
 56a:	b8 0a 00 00 00       	mov    $0xa,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <getpid>:
SYSCALL(getpid)
 572:	b8 0b 00 00 00       	mov    $0xb,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <sbrk>:
SYSCALL(sbrk)
 57a:	b8 0c 00 00 00       	mov    $0xc,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <sleep>:
SYSCALL(sleep)
 582:	b8 0d 00 00 00       	mov    $0xd,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <uptime>:
SYSCALL(uptime)
 58a:	b8 0e 00 00 00       	mov    $0xe,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <waitx>:
SYSCALL(waitx)
 592:	b8 16 00 00 00       	mov    $0x16,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <getpinfo>:
SYSCALL(getpinfo)
 59a:	b8 17 00 00 00       	mov    $0x17,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <chpr>:
SYSCALL(chpr)
 5a2:	b8 18 00 00 00       	mov    $0x18,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <wait2>:
SYSCALL(wait2)
 5aa:	b8 19 00 00 00       	mov    $0x19,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <yield>:
SYSCALL(yield)
 5b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    
 5ba:	66 90                	xchg   %ax,%ax
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	89 c6                	mov    %eax,%esi
 5c8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ce:	85 db                	test   %ebx,%ebx
 5d0:	74 7e                	je     650 <printint+0x90>
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	c1 e8 1f             	shr    $0x1f,%eax
 5d7:	84 c0                	test   %al,%al
 5d9:	74 75                	je     650 <printint+0x90>
    neg = 1;
    x = -xx;
 5db:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5dd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5e4:	f7 d8                	neg    %eax
 5e6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5e9:	31 ff                	xor    %edi,%edi
 5eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5ee:	89 ce                	mov    %ecx,%esi
 5f0:	eb 08                	jmp    5fa <printint+0x3a>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5f8:	89 cf                	mov    %ecx,%edi
 5fa:	31 d2                	xor    %edx,%edx
 5fc:	8d 4f 01             	lea    0x1(%edi),%ecx
 5ff:	f7 f6                	div    %esi
 601:	0f b6 92 f4 0b 00 00 	movzbl 0xbf4(%edx),%edx
  }while((x /= base) != 0);
 608:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 60a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 60d:	75 e9                	jne    5f8 <printint+0x38>
  if(neg)
 60f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 612:	8b 75 c0             	mov    -0x40(%ebp),%esi
 615:	85 c0                	test   %eax,%eax
 617:	74 08                	je     621 <printint+0x61>
    buf[i++] = '-';
 619:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 61e:	8d 4f 02             	lea    0x2(%edi),%ecx
 621:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 625:	8d 76 00             	lea    0x0(%esi),%esi
 628:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62b:	83 ec 04             	sub    $0x4,%esp
 62e:	83 ef 01             	sub    $0x1,%edi
 631:	6a 01                	push   $0x1
 633:	53                   	push   %ebx
 634:	56                   	push   %esi
 635:	88 45 d7             	mov    %al,-0x29(%ebp)
 638:	e8 d5 fe ff ff       	call   512 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 63d:	83 c4 10             	add    $0x10,%esp
 640:	39 df                	cmp    %ebx,%edi
 642:	75 e4                	jne    628 <printint+0x68>
    putc(fd, buf[i]);
}
 644:	8d 65 f4             	lea    -0xc(%ebp),%esp
 647:	5b                   	pop    %ebx
 648:	5e                   	pop    %esi
 649:	5f                   	pop    %edi
 64a:	5d                   	pop    %ebp
 64b:	c3                   	ret    
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 650:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 652:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 659:	eb 8b                	jmp    5e6 <printint+0x26>
 65b:	90                   	nop
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000660 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 666:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 669:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 66f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 672:	89 45 d0             	mov    %eax,-0x30(%ebp)
 675:	0f b6 1e             	movzbl (%esi),%ebx
 678:	83 c6 01             	add    $0x1,%esi
 67b:	84 db                	test   %bl,%bl
 67d:	0f 84 b0 00 00 00    	je     733 <printf+0xd3>
 683:	31 d2                	xor    %edx,%edx
 685:	eb 39                	jmp    6c0 <printf+0x60>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 690:	83 f8 25             	cmp    $0x25,%eax
 693:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 696:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 69b:	74 18                	je     6b5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 69d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6a6:	6a 01                	push   $0x1
 6a8:	50                   	push   %eax
 6a9:	57                   	push   %edi
 6aa:	e8 63 fe ff ff       	call   512 <write>
 6af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6b2:	83 c4 10             	add    $0x10,%esp
 6b5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6bc:	84 db                	test   %bl,%bl
 6be:	74 73                	je     733 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6c0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6c2:	0f be cb             	movsbl %bl,%ecx
 6c5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6c8:	74 c6                	je     690 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6ca:	83 fa 25             	cmp    $0x25,%edx
 6cd:	75 e6                	jne    6b5 <printf+0x55>
      if(c == 'd'){
 6cf:	83 f8 64             	cmp    $0x64,%eax
 6d2:	0f 84 f8 00 00 00    	je     7d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6d8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6de:	83 f9 70             	cmp    $0x70,%ecx
 6e1:	74 5d                	je     740 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6e3:	83 f8 73             	cmp    $0x73,%eax
 6e6:	0f 84 84 00 00 00    	je     770 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ec:	83 f8 63             	cmp    $0x63,%eax
 6ef:	0f 84 ea 00 00 00    	je     7df <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6f5:	83 f8 25             	cmp    $0x25,%eax
 6f8:	0f 84 c2 00 00 00    	je     7c0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 701:	83 ec 04             	sub    $0x4,%esp
 704:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 708:	6a 01                	push   $0x1
 70a:	50                   	push   %eax
 70b:	57                   	push   %edi
 70c:	e8 01 fe ff ff       	call   512 <write>
 711:	83 c4 0c             	add    $0xc,%esp
 714:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 717:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 71a:	6a 01                	push   $0x1
 71c:	50                   	push   %eax
 71d:	57                   	push   %edi
 71e:	83 c6 01             	add    $0x1,%esi
 721:	e8 ec fd ff ff       	call   512 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 726:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 72a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 72f:	84 db                	test   %bl,%bl
 731:	75 8d                	jne    6c0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 733:	8d 65 f4             	lea    -0xc(%ebp),%esp
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
 73b:	90                   	nop
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 10 00 00 00       	mov    $0x10,%ecx
 748:	6a 00                	push   $0x0
 74a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 74d:	89 f8                	mov    %edi,%eax
 74f:	8b 13                	mov    (%ebx),%edx
 751:	e8 6a fe ff ff       	call   5c0 <printint>
        ap++;
 756:	89 d8                	mov    %ebx,%eax
 758:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 75b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 75d:	83 c0 04             	add    $0x4,%eax
 760:	89 45 d0             	mov    %eax,-0x30(%ebp)
 763:	e9 4d ff ff ff       	jmp    6b5 <printf+0x55>
 768:	90                   	nop
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
 773:	8b 18                	mov    (%eax),%ebx
        ap++;
 775:	83 c0 04             	add    $0x4,%eax
 778:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 77b:	b8 ec 0b 00 00       	mov    $0xbec,%eax
 780:	85 db                	test   %ebx,%ebx
 782:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 785:	0f b6 03             	movzbl (%ebx),%eax
 788:	84 c0                	test   %al,%al
 78a:	74 23                	je     7af <printf+0x14f>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 790:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 793:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 796:	83 ec 04             	sub    $0x4,%esp
 799:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 79b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 79e:	50                   	push   %eax
 79f:	57                   	push   %edi
 7a0:	e8 6d fd ff ff       	call   512 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7a5:	0f b6 03             	movzbl (%ebx),%eax
 7a8:	83 c4 10             	add    $0x10,%esp
 7ab:	84 c0                	test   %al,%al
 7ad:	75 e1                	jne    790 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 ff fe ff ff       	jmp    6b5 <printf+0x55>
 7b6:	8d 76 00             	lea    0x0(%esi),%esi
 7b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
 7c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7c9:	6a 01                	push   $0x1
 7cb:	e9 4c ff ff ff       	jmp    71c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d8:	6a 01                	push   $0x1
 7da:	e9 6b ff ff ff       	jmp    74a <printf+0xea>
 7df:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7e2:	83 ec 04             	sub    $0x4,%esp
 7e5:	8b 03                	mov    (%ebx),%eax
 7e7:	6a 01                	push   $0x1
 7e9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7ef:	50                   	push   %eax
 7f0:	57                   	push   %edi
 7f1:	e8 1c fd ff ff       	call   512 <write>
 7f6:	e9 5b ff ff ff       	jmp    756 <printf+0xf6>
 7fb:	66 90                	xchg   %ax,%ax
 7fd:	66 90                	xchg   %ax,%ax
 7ff:	90                   	nop

00000800 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 800:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	a1 98 0e 00 00       	mov    0xe98,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 806:	89 e5                	mov    %esp,%ebp
 808:	57                   	push   %edi
 809:	56                   	push   %esi
 80a:	53                   	push   %ebx
 80b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 810:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 813:	39 c8                	cmp    %ecx,%eax
 815:	73 19                	jae    830 <free+0x30>
 817:	89 f6                	mov    %esi,%esi
 819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 820:	39 d1                	cmp    %edx,%ecx
 822:	72 1c                	jb     840 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 824:	39 d0                	cmp    %edx,%eax
 826:	73 18                	jae    840 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 828:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82e:	72 f0                	jb     820 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	39 d0                	cmp    %edx,%eax
 832:	72 f4                	jb     828 <free+0x28>
 834:	39 d1                	cmp    %edx,%ecx
 836:	73 f0                	jae    828 <free+0x28>
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 840:	8b 73 fc             	mov    -0x4(%ebx),%esi
 843:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 846:	39 d7                	cmp    %edx,%edi
 848:	74 19                	je     863 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 84a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 853:	39 f1                	cmp    %esi,%ecx
 855:	74 23                	je     87a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 857:	89 08                	mov    %ecx,(%eax)
  freep = p;
 859:	a3 98 0e 00 00       	mov    %eax,0xe98
}
 85e:	5b                   	pop    %ebx
 85f:	5e                   	pop    %esi
 860:	5f                   	pop    %edi
 861:	5d                   	pop    %ebp
 862:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 863:	03 72 04             	add    0x4(%edx),%esi
 866:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 869:	8b 10                	mov    (%eax),%edx
 86b:	8b 12                	mov    (%edx),%edx
 86d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 870:	8b 50 04             	mov    0x4(%eax),%edx
 873:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 876:	39 f1                	cmp    %esi,%ecx
 878:	75 dd                	jne    857 <free+0x57>
    p->s.size += bp->s.size;
 87a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 87d:	a3 98 0e 00 00       	mov    %eax,0xe98
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 882:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 885:	8b 53 f8             	mov    -0x8(%ebx),%edx
 888:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 88a:	5b                   	pop    %ebx
 88b:	5e                   	pop    %esi
 88c:	5f                   	pop    %edi
 88d:	5d                   	pop    %ebp
 88e:	c3                   	ret    
 88f:	90                   	nop

00000890 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	57                   	push   %edi
 894:	56                   	push   %esi
 895:	53                   	push   %ebx
 896:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 899:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 89c:	8b 15 98 0e 00 00    	mov    0xe98,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a2:	8d 78 07             	lea    0x7(%eax),%edi
 8a5:	c1 ef 03             	shr    $0x3,%edi
 8a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8ab:	85 d2                	test   %edx,%edx
 8ad:	0f 84 a3 00 00 00    	je     956 <malloc+0xc6>
 8b3:	8b 02                	mov    (%edx),%eax
 8b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8b8:	39 cf                	cmp    %ecx,%edi
 8ba:	76 74                	jbe    930 <malloc+0xa0>
 8bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8c2:	be 00 10 00 00       	mov    $0x1000,%esi
 8c7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8ce:	0f 43 f7             	cmovae %edi,%esi
 8d1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8d6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8dc:	0f 46 da             	cmovbe %edx,%ebx
 8df:	eb 10                	jmp    8f1 <malloc+0x61>
 8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ea:	8b 48 04             	mov    0x4(%eax),%ecx
 8ed:	39 cf                	cmp    %ecx,%edi
 8ef:	76 3f                	jbe    930 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f1:	39 05 98 0e 00 00    	cmp    %eax,0xe98
 8f7:	89 c2                	mov    %eax,%edx
 8f9:	75 ed                	jne    8e8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 8fb:	83 ec 0c             	sub    $0xc,%esp
 8fe:	53                   	push   %ebx
 8ff:	e8 76 fc ff ff       	call   57a <sbrk>
  if(p == (char*)-1)
 904:	83 c4 10             	add    $0x10,%esp
 907:	83 f8 ff             	cmp    $0xffffffff,%eax
 90a:	74 1c                	je     928 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 90c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 90f:	83 ec 0c             	sub    $0xc,%esp
 912:	83 c0 08             	add    $0x8,%eax
 915:	50                   	push   %eax
 916:	e8 e5 fe ff ff       	call   800 <free>
  return freep;
 91b:	8b 15 98 0e 00 00    	mov    0xe98,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 921:	83 c4 10             	add    $0x10,%esp
 924:	85 d2                	test   %edx,%edx
 926:	75 c0                	jne    8e8 <malloc+0x58>
        return 0;
 928:	31 c0                	xor    %eax,%eax
 92a:	eb 1c                	jmp    948 <malloc+0xb8>
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 930:	39 cf                	cmp    %ecx,%edi
 932:	74 1c                	je     950 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 934:	29 f9                	sub    %edi,%ecx
 936:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 939:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 93c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 93f:	89 15 98 0e 00 00    	mov    %edx,0xe98
      return (void*)(p + 1);
 945:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 948:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94b:	5b                   	pop    %ebx
 94c:	5e                   	pop    %esi
 94d:	5f                   	pop    %edi
 94e:	5d                   	pop    %ebp
 94f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 950:	8b 08                	mov    (%eax),%ecx
 952:	89 0a                	mov    %ecx,(%edx)
 954:	eb e9                	jmp    93f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 956:	c7 05 98 0e 00 00 9c 	movl   $0xe9c,0xe98
 95d:	0e 00 00 
 960:	c7 05 9c 0e 00 00 9c 	movl   $0xe9c,0xe9c
 967:	0e 00 00 
    base.s.size = 0;
 96a:	b8 9c 0e 00 00       	mov    $0xe9c,%eax
 96f:	c7 05 a0 0e 00 00 00 	movl   $0x0,0xea0
 976:	00 00 00 
 979:	e9 3e ff ff ff       	jmp    8bc <malloc+0x2c>
