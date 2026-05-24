
Objecting\kernel.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot_header>:
  100000:	02 b0 ad 1b 07 00    	add    0x71bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	f7 4f 52 e4 00 00 00 	testl  $0xe4,0x52(%edi)
	...
  100023:	00 00                	add    %al,(%eax)
  100025:	04 00                	add    $0x0,%al
  100027:	00 00                	add    %al,(%eax)
  100029:	03 00                	add    (%eax),%eax
  10002b:	00 20                	add    %ah,(%eax)
  10002d:	00 00                	add    %al,(%eax)
	...

00100030 <_start>:
  100030:	89 1d 00 e0 10 00    	mov    %ebx,0x10e000
  100036:	bc 00 30 11 00       	mov    $0x113000,%esp
  10003b:	e8 b0 02 00 00       	call   1002f0 <kernel_main>
  100040:	fa                   	cli

00100041 <_start.hang>:
  100041:	f4                   	hlt
  100042:	eb fd                	jmp    100041 <_start.hang>
  100044:	66 90                	xchg   %ax,%ax
  100046:	66 90                	xchg   %ax,%ax
  100048:	66 90                	xchg   %ax,%ax
  10004a:	66 90                	xchg   %ax,%ax
  10004c:	66 90                	xchg   %ax,%ax
  10004e:	66 90                	xchg   %ax,%ax
  100050:	66 90                	xchg   %ax,%ax
  100052:	66 90                	xchg   %ax,%ax
  100054:	66 90                	xchg   %ax,%ax
  100056:	66 90                	xchg   %ax,%ax
  100058:	66 90                	xchg   %ax,%ax
  10005a:	66 90                	xchg   %ax,%ax
  10005c:	66 90                	xchg   %ax,%ax
  10005e:	66 90                	xchg   %ax,%ax
  100060:	66 90                	xchg   %ax,%ax
  100062:	66 90                	xchg   %ax,%ax
  100064:	66 90                	xchg   %ax,%ax
  100066:	66 90                	xchg   %ax,%ax
  100068:	66 90                	xchg   %ax,%ax
  10006a:	66 90                	xchg   %ax,%ax
  10006c:	66 90                	xchg   %ax,%ax
  10006e:	66 90                	xchg   %ax,%ax
  100070:	66 90                	xchg   %ax,%ax
  100072:	66 90                	xchg   %ax,%ax
  100074:	66 90                	xchg   %ax,%ax
  100076:	66 90                	xchg   %ax,%ax
  100078:	66 90                	xchg   %ax,%ax
  10007a:	66 90                	xchg   %ax,%ax
  10007c:	66 90                	xchg   %ax,%ax
  10007e:	66 90                	xchg   %ax,%ax

00100080 <test_program1>:
  100080:	55                   	push   %ebp
  100081:	89 e5                	mov    %esp,%ebp
  100083:	53                   	push   %ebx
  100084:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  100087:	83 ec 24             	sub    $0x24,%esp
  10008a:	eb 34                	jmp    1000c0 <test_program1+0x40>
  10008c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100090:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100097:	00 
  100098:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10009f:	00 
  1000a0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1000a7:	00 
  1000a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1000af:	00 
  1000b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1000b7:	00 
  1000b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1000bf:	00 
  1000c0:	a1 2c 30 11 00       	mov    0x11302c,%eax
  1000c5:	83 c0 01             	add    $0x1,%eax
  1000c8:	a3 2c 30 11 00       	mov    %eax,0x11302c
  1000cd:	a1 2c 30 11 00       	mov    0x11302c,%eax
  1000d2:	69 c0 1d e6 cb 0b    	imul   $0xbcbe61d,%eax,%eax
  1000d8:	05 40 7c 0a 00       	add    $0xa7c40,%eax
  1000dd:	c1 c8 06             	ror    $0x6,%eax
  1000e0:	3d e2 53 00 00       	cmp    $0x53e2,%eax
  1000e5:	77 d9                	ja     1000c0 <test_program1+0x40>
  1000e7:	83 ec 0c             	sub    $0xc,%esp
  1000ea:	68 00 30 11 00       	push   $0x113000
  1000ef:	e8 0c 73 00 00       	call   107400 <mutex_lock>
  1000f4:	83 c4 0c             	add    $0xc,%esp
  1000f7:	68 8c b9 10 00       	push   $0x10b98c
  1000fc:	6a 00                	push   $0x0
  1000fe:	6a 16                	push   $0x16
  100100:	e8 eb 0b 00 00       	call   100cf0 <terminal_writeat>
  100105:	a1 2c 30 11 00       	mov    0x11302c,%eax
  10010a:	83 c4 0c             	add    $0xc,%esp
  10010d:	6a 0a                	push   $0xa
  10010f:	53                   	push   %ebx
  100110:	50                   	push   %eax
  100111:	e8 1a 08 00 00       	call   100930 <itoa>
  100116:	83 c4 0c             	add    $0xc,%esp
  100119:	53                   	push   %ebx
  10011a:	6a 0f                	push   $0xf
  10011c:	6a 16                	push   $0x16
  10011e:	e8 cd 0b 00 00       	call   100cf0 <terminal_writeat>
  100123:	89 1c 24             	mov    %ebx,(%esp)
  100126:	e8 85 04 00 00       	call   1005b0 <strlen>
  10012b:	83 c4 0c             	add    $0xc,%esp
  10012e:	83 c0 0f             	add    $0xf,%eax
  100131:	68 9c b9 10 00       	push   $0x10b99c
  100136:	0f b6 c0             	movzbl %al,%eax
  100139:	50                   	push   %eax
  10013a:	6a 16                	push   $0x16
  10013c:	e8 af 0b 00 00       	call   100cf0 <terminal_writeat>
  100141:	c7 04 24 00 30 11 00 	movl   $0x113000,(%esp)
  100148:	e8 43 73 00 00       	call   107490 <mutex_unlock>
  10014d:	83 c4 10             	add    $0x10,%esp
  100150:	e9 6b ff ff ff       	jmp    1000c0 <test_program1+0x40>
  100155:	8d 76 00             	lea    0x0(%esi),%esi
  100158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10015f:	00 

00100160 <test_program2>:
  100160:	55                   	push   %ebp
  100161:	89 e5                	mov    %esp,%ebp
  100163:	53                   	push   %ebx
  100164:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  100167:	83 ec 24             	sub    $0x24,%esp
  10016a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100170:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100177:	00 
  100178:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10017f:	00 
  100180:	a1 2c 30 11 00       	mov    0x11302c,%eax
  100185:	83 c0 01             	add    $0x1,%eax
  100188:	a3 2c 30 11 00       	mov    %eax,0x11302c
  10018d:	a1 2c 30 11 00       	mov    0x11302c,%eax
  100192:	69 c0 1d e6 cb 0b    	imul   $0xbcbe61d,%eax,%eax
  100198:	05 40 7c 0a 00       	add    $0xa7c40,%eax
  10019d:	c1 c8 06             	ror    $0x6,%eax
  1001a0:	3d e2 53 00 00       	cmp    $0x53e2,%eax
  1001a5:	77 d9                	ja     100180 <test_program2+0x20>
  1001a7:	83 ec 0c             	sub    $0xc,%esp
  1001aa:	68 00 30 11 00       	push   $0x113000
  1001af:	e8 4c 72 00 00       	call   107400 <mutex_lock>
  1001b4:	83 c4 0c             	add    $0xc,%esp
  1001b7:	68 a7 b9 10 00       	push   $0x10b9a7
  1001bc:	6a 00                	push   $0x0
  1001be:	6a 17                	push   $0x17
  1001c0:	e8 2b 0b 00 00       	call   100cf0 <terminal_writeat>
  1001c5:	a1 2c 30 11 00       	mov    0x11302c,%eax
  1001ca:	83 c4 0c             	add    $0xc,%esp
  1001cd:	6a 0a                	push   $0xa
  1001cf:	53                   	push   %ebx
  1001d0:	50                   	push   %eax
  1001d1:	e8 5a 07 00 00       	call   100930 <itoa>
  1001d6:	83 c4 0c             	add    $0xc,%esp
  1001d9:	53                   	push   %ebx
  1001da:	6a 0f                	push   $0xf
  1001dc:	6a 17                	push   $0x17
  1001de:	e8 0d 0b 00 00       	call   100cf0 <terminal_writeat>
  1001e3:	89 1c 24             	mov    %ebx,(%esp)
  1001e6:	e8 c5 03 00 00       	call   1005b0 <strlen>
  1001eb:	83 c4 0c             	add    $0xc,%esp
  1001ee:	83 c0 0f             	add    $0xf,%eax
  1001f1:	68 9c b9 10 00       	push   $0x10b99c
  1001f6:	0f b6 c0             	movzbl %al,%eax
  1001f9:	50                   	push   %eax
  1001fa:	6a 17                	push   $0x17
  1001fc:	e8 ef 0a 00 00       	call   100cf0 <terminal_writeat>
  100201:	c7 04 24 00 30 11 00 	movl   $0x113000,(%esp)
  100208:	e8 83 72 00 00       	call   107490 <mutex_unlock>
  10020d:	83 c4 10             	add    $0x10,%esp
  100210:	e9 6b ff ff ff       	jmp    100180 <test_program2+0x20>
  100215:	8d 76 00             	lea    0x0(%esi),%esi
  100218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10021f:	00 

00100220 <demo_processes>:
  100220:	55                   	push   %ebp
  100221:	89 e5                	mov    %esp,%ebp
  100223:	56                   	push   %esi
  100224:	53                   	push   %ebx
  100225:	83 ec 1c             	sub    $0x1c,%esp
  100228:	68 b7 b9 10 00       	push   $0x10b9b7
  10022d:	e8 de 09 00 00       	call   100c10 <terminal_writestring>
  100232:	6a 00                	push   $0x0
  100234:	68 80 00 00 00       	push   $0x80
  100239:	68 80 00 10 00       	push   $0x100080
  10023e:	68 d5 b9 10 00       	push   $0x10b9d5
  100243:	e8 d8 4f 00 00       	call   105220 <process_create_ex>
  100248:	83 c4 20             	add    $0x20,%esp
  10024b:	6a 00                	push   $0x0
  10024d:	89 c6                	mov    %eax,%esi
  10024f:	6a 64                	push   $0x64
  100251:	68 60 01 10 00       	push   $0x100160
  100256:	68 db b9 10 00       	push   $0x10b9db
  10025b:	e8 c0 4f 00 00       	call   105220 <process_create_ex>
  100260:	83 c4 10             	add    $0x10,%esp
  100263:	89 c3                	mov    %eax,%ebx
  100265:	85 f6                	test   %esi,%esi
  100267:	7e 36                	jle    10029f <demo_processes+0x7f>
  100269:	83 ec 0c             	sub    $0xc,%esp
  10026c:	68 34 ca 10 00       	push   $0x10ca34
  100271:	e8 9a 09 00 00       	call   100c10 <terminal_writestring>
  100276:	83 c4 0c             	add    $0xc,%esp
  100279:	8d 45 e8             	lea    -0x18(%ebp),%eax
  10027c:	6a 0a                	push   $0xa
  10027e:	50                   	push   %eax
  10027f:	56                   	push   %esi
  100280:	e8 ab 06 00 00       	call   100930 <itoa>
  100285:	8d 45 e8             	lea    -0x18(%ebp),%eax
  100288:	89 04 24             	mov    %eax,(%esp)
  10028b:	e8 80 09 00 00       	call   100c10 <terminal_writestring>
  100290:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  100297:	e8 74 09 00 00       	call   100c10 <terminal_writestring>
  10029c:	83 c4 10             	add    $0x10,%esp
  10029f:	85 db                	test   %ebx,%ebx
  1002a1:	7e 33                	jle    1002d6 <demo_processes+0xb6>
  1002a3:	83 ec 0c             	sub    $0xc,%esp
  1002a6:	8d 75 e8             	lea    -0x18(%ebp),%esi
  1002a9:	68 58 ca 10 00       	push   $0x10ca58
  1002ae:	e8 5d 09 00 00       	call   100c10 <terminal_writestring>
  1002b3:	83 c4 0c             	add    $0xc,%esp
  1002b6:	6a 0a                	push   $0xa
  1002b8:	56                   	push   %esi
  1002b9:	53                   	push   %ebx
  1002ba:	e8 71 06 00 00       	call   100930 <itoa>
  1002bf:	89 34 24             	mov    %esi,(%esp)
  1002c2:	e8 49 09 00 00       	call   100c10 <terminal_writestring>
  1002c7:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1002ce:	e8 3d 09 00 00       	call   100c10 <terminal_writestring>
  1002d3:	83 c4 10             	add    $0x10,%esp
  1002d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1002d9:	5b                   	pop    %ebx
  1002da:	5e                   	pop    %esi
  1002db:	5d                   	pop    %ebp
  1002dc:	e9 0f 56 00 00       	jmp    1058f0 <process_list>
  1002e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1002e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1002ef:	00 

001002f0 <kernel_main>:
  1002f0:	55                   	push   %ebp
  1002f1:	89 e5                	mov    %esp,%ebp
  1002f3:	53                   	push   %ebx
  1002f4:	83 ec 14             	sub    $0x14,%esp
  1002f7:	e8 e4 09 00 00       	call   100ce0 <terminal_initialize>
  1002fc:	83 ec 0c             	sub    $0xc,%esp
  1002ff:	68 7c ca 10 00       	push   $0x10ca7c
  100304:	e8 07 09 00 00       	call   100c10 <terminal_writestring>
  100309:	c7 04 24 e1 b9 10 00 	movl   $0x10b9e1,(%esp)
  100310:	e8 fb 08 00 00       	call   100c10 <terminal_writestring>
  100315:	e8 56 0a 00 00       	call   100d70 <gdt_init>
  10031a:	e8 71 0c 00 00       	call   100f90 <idt_install>
  10031f:	58                   	pop    %eax
  100320:	5a                   	pop    %edx
  100321:	6a 28                	push   $0x28
  100323:	6a 20                	push   $0x20
  100325:	e8 a6 0b 00 00       	call   100ed0 <pic_remap>
  10032a:	e8 11 21 00 00       	call   102440 <framebuffer_init>
  10032f:	e8 8c 48 00 00       	call   104bc0 <memory_init>
  100334:	e8 a7 57 00 00       	call   105ae0 <process_init>
  100339:	e8 72 5d 00 00       	call   1060b0 <syscall_init>
  10033e:	e8 dd 7b 00 00       	call   107f20 <sync_init>
  100343:	e8 c8 99 00 00       	call   109d10 <debugger_init>
  100348:	59                   	pop    %ecx
  100349:	5b                   	pop    %ebx
  10034a:	68 ed b9 10 00       	push   $0x10b9ed
  10034f:	68 00 30 11 00       	push   $0x113000
  100354:	e8 47 70 00 00       	call   1073a0 <mutex_init>
  100359:	58                   	pop    %eax
  10035a:	5a                   	pop    %edx
  10035b:	6a 00                	push   $0x0
  10035d:	68 f9 b9 10 00       	push   $0x10b9f9
  100362:	e8 89 79 00 00       	call   107cf0 <sem_create>
  100367:	c7 04 24 02 ba 10 00 	movl   $0x10ba02,(%esp)
  10036e:	e8 dd 7a 00 00       	call   107e50 <msg_queue_create>
  100373:	e8 c8 17 00 00       	call   101b40 <keyboard_init>
  100378:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  10037f:	e8 0c 1a 00 00       	call   101d90 <timer_init>
  100384:	e8 67 1d 00 00       	call   1020f0 <mouse_init>
  100389:	e8 52 21 00 00       	call   1024e0 <dma_init>
  10038e:	e8 8d 9b 00 00       	call   109f20 <sound_init>
  100393:	c7 04 24 a8 ca 10 00 	movl   $0x10caa8,(%esp)
  10039a:	e8 71 08 00 00       	call   100c10 <terminal_writestring>
  10039f:	e8 7c fe ff ff       	call   100220 <demo_processes>
  1003a4:	e8 f7 2e 00 00       	call   1032a0 <dma_demo>
  1003a9:	c7 04 24 cc ca 10 00 	movl   $0x10cacc,(%esp)
  1003b0:	e8 5b 08 00 00       	call   100c10 <terminal_writestring>
  1003b5:	c7 04 24 c0 b6 10 00 	movl   $0x10b6c0,(%esp)
  1003bc:	e8 1f 9e 00 00       	call   10a1e0 <sound_loop_melody>
  1003c1:	fb                   	sti
  1003c2:	c7 04 24 0d ba 10 00 	movl   $0x10ba0d,(%esp)
  1003c9:	8d 5d f7             	lea    -0x9(%ebp),%ebx
  1003cc:	e8 3f 08 00 00       	call   100c10 <terminal_writestring>
  1003d1:	c7 04 24 ec ca 10 00 	movl   $0x10caec,(%esp)
  1003d8:	e8 33 08 00 00       	call   100c10 <terminal_writestring>
  1003dd:	c7 04 24 10 cb 10 00 	movl   $0x10cb10,(%esp)
  1003e4:	e8 27 08 00 00       	call   100c10 <terminal_writestring>
  1003e9:	83 c4 10             	add    $0x10,%esp
  1003ec:	eb 03                	jmp    1003f1 <kernel_main+0x101>
  1003ee:	66 90                	xchg   %ax,%ax
  1003f0:	f4                   	hlt
  1003f1:	a1 20 3d 11 00       	mov    0x113d20,%eax
  1003f6:	85 c0                	test   %eax,%eax
  1003f8:	75 26                	jne    100420 <kernel_main+0x130>
  1003fa:	83 ec 0c             	sub    $0xc,%esp
  1003fd:	53                   	push   %ebx
  1003fe:	e8 cd 16 00 00       	call   101ad0 <keyboard_buffer_read>
  100403:	83 c4 10             	add    $0x10,%esp
  100406:	85 c0                	test   %eax,%eax
  100408:	74 e6                	je     1003f0 <kernel_main+0x100>
  10040a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10040e:	83 ec 0c             	sub    $0xc,%esp
  100411:	50                   	push   %eax
  100412:	e8 99 06 00 00       	call   100ab0 <terminal_putchar>
  100417:	83 c4 10             	add    $0x10,%esp
  10041a:	eb de                	jmp    1003fa <kernel_main+0x10a>
  10041c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100420:	c7 05 20 3d 11 00 00 	movl   $0x0,0x113d20
  100427:	00 00 00 
  10042a:	83 ec 0c             	sub    $0xc,%esp
  10042d:	68 48 cb 10 00       	push   $0x10cb48
  100432:	e8 d9 07 00 00       	call   100c10 <terminal_writestring>
  100437:	e8 34 7d 00 00       	call   108170 <debugger_run>
  10043c:	c7 04 24 29 ba 10 00 	movl   $0x10ba29,(%esp)
  100443:	e8 c8 07 00 00       	call   100c10 <terminal_writestring>
  100448:	83 c4 10             	add    $0x10,%esp
  10044b:	eb ad                	jmp    1003fa <kernel_main+0x10a>
  10044d:	66 90                	xchg   %ax,%ax
  10044f:	66 90                	xchg   %ax,%ax
  100451:	66 90                	xchg   %ax,%ax
  100453:	66 90                	xchg   %ax,%ax
  100455:	66 90                	xchg   %ax,%ax
  100457:	66 90                	xchg   %ax,%ax
  100459:	66 90                	xchg   %ax,%ax
  10045b:	66 90                	xchg   %ax,%ax
  10045d:	66 90                	xchg   %ax,%ax
  10045f:	90                   	nop

00100460 <memcpy>:
  100460:	55                   	push   %ebp
  100461:	89 e5                	mov    %esp,%ebp
  100463:	56                   	push   %esi
  100464:	53                   	push   %ebx
  100465:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100468:	8b 75 08             	mov    0x8(%ebp),%esi
  10046b:	85 db                	test   %ebx,%ebx
  10046d:	74 21                	je     100490 <memcpy+0x30>
  10046f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100472:	89 f2                	mov    %esi,%edx
  100474:	01 c3                	add    %eax,%ebx
  100476:	66 90                	xchg   %ax,%ax
  100478:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10047f:	00 
  100480:	0f b6 08             	movzbl (%eax),%ecx
  100483:	83 c0 01             	add    $0x1,%eax
  100486:	83 c2 01             	add    $0x1,%edx
  100489:	88 4a ff             	mov    %cl,-0x1(%edx)
  10048c:	39 d8                	cmp    %ebx,%eax
  10048e:	75 f0                	jne    100480 <memcpy+0x20>
  100490:	89 f0                	mov    %esi,%eax
  100492:	5b                   	pop    %ebx
  100493:	5e                   	pop    %esi
  100494:	5d                   	pop    %ebp
  100495:	c3                   	ret
  100496:	66 90                	xchg   %ax,%ax
  100498:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10049f:	00 

001004a0 <memset>:
  1004a0:	55                   	push   %ebp
  1004a1:	89 e5                	mov    %esp,%ebp
  1004a3:	56                   	push   %esi
  1004a4:	8b 75 10             	mov    0x10(%ebp),%esi
  1004a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004aa:	53                   	push   %ebx
  1004ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004ae:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
  1004b1:	85 f6                	test   %esi,%esi
  1004b3:	74 27                	je     1004dc <memset+0x3c>
  1004b5:	89 ce                	mov    %ecx,%esi
  1004b7:	89 d8                	mov    %ebx,%eax
  1004b9:	29 de                	sub    %ebx,%esi
  1004bb:	83 e6 01             	and    $0x1,%esi
  1004be:	74 10                	je     1004d0 <memset+0x30>
  1004c0:	8d 43 01             	lea    0x1(%ebx),%eax
  1004c3:	88 13                	mov    %dl,(%ebx)
  1004c5:	39 c8                	cmp    %ecx,%eax
  1004c7:	74 13                	je     1004dc <memset+0x3c>
  1004c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1004d0:	88 10                	mov    %dl,(%eax)
  1004d2:	83 c0 02             	add    $0x2,%eax
  1004d5:	88 50 ff             	mov    %dl,-0x1(%eax)
  1004d8:	39 c8                	cmp    %ecx,%eax
  1004da:	75 f4                	jne    1004d0 <memset+0x30>
  1004dc:	89 d8                	mov    %ebx,%eax
  1004de:	5b                   	pop    %ebx
  1004df:	5e                   	pop    %esi
  1004e0:	5d                   	pop    %ebp
  1004e1:	c3                   	ret
  1004e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1004e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1004ef:	00 

001004f0 <memmove>:
  1004f0:	55                   	push   %ebp
  1004f1:	89 e5                	mov    %esp,%ebp
  1004f3:	56                   	push   %esi
  1004f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f7:	8b 55 10             	mov    0x10(%ebp),%edx
  1004fa:	53                   	push   %ebx
  1004fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004fe:	39 c3                	cmp    %eax,%ebx
  100500:	73 2e                	jae    100530 <memmove+0x40>
  100502:	85 d2                	test   %edx,%edx
  100504:	74 1a                	je     100520 <memmove+0x30>
  100506:	89 de                	mov    %ebx,%esi
  100508:	01 c2                	add    %eax,%edx
  10050a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100510:	0f b6 08             	movzbl (%eax),%ecx
  100513:	83 c0 01             	add    $0x1,%eax
  100516:	83 c6 01             	add    $0x1,%esi
  100519:	88 4e ff             	mov    %cl,-0x1(%esi)
  10051c:	39 d0                	cmp    %edx,%eax
  10051e:	75 f0                	jne    100510 <memmove+0x20>
  100520:	89 d8                	mov    %ebx,%eax
  100522:	5b                   	pop    %ebx
  100523:	5e                   	pop    %esi
  100524:	5d                   	pop    %ebp
  100525:	c3                   	ret
  100526:	66 90                	xchg   %ax,%ax
  100528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10052f:	00 
  100530:	39 d8                	cmp    %ebx,%eax
  100532:	73 ec                	jae    100520 <memmove+0x30>
  100534:	85 d2                	test   %edx,%edx
  100536:	74 e8                	je     100520 <memmove+0x30>
  100538:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10053f:	00 
  100540:	83 ea 01             	sub    $0x1,%edx
  100543:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
  100547:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
  10054a:	75 f4                	jne    100540 <memmove+0x50>
  10054c:	89 d8                	mov    %ebx,%eax
  10054e:	5b                   	pop    %ebx
  10054f:	5e                   	pop    %esi
  100550:	5d                   	pop    %ebp
  100551:	c3                   	ret
  100552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100558:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10055f:	00 

00100560 <memcmp>:
  100560:	55                   	push   %ebp
  100561:	89 e5                	mov    %esp,%ebp
  100563:	56                   	push   %esi
  100564:	8b 75 10             	mov    0x10(%ebp),%esi
  100567:	53                   	push   %ebx
  100568:	85 f6                	test   %esi,%esi
  10056a:	74 34                	je     1005a0 <memcmp+0x40>
  10056c:	8b 45 08             	mov    0x8(%ebp),%eax
  10056f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100572:	01 c6                	add    %eax,%esi
  100574:	eb 14                	jmp    10058a <memcmp+0x2a>
  100576:	66 90                	xchg   %ax,%ax
  100578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10057f:	00 
  100580:	83 c0 01             	add    $0x1,%eax
  100583:	83 c2 01             	add    $0x1,%edx
  100586:	39 f0                	cmp    %esi,%eax
  100588:	74 16                	je     1005a0 <memcmp+0x40>
  10058a:	0f b6 08             	movzbl (%eax),%ecx
  10058d:	0f b6 1a             	movzbl (%edx),%ebx
  100590:	38 d9                	cmp    %bl,%cl
  100592:	74 ec                	je     100580 <memcmp+0x20>
  100594:	0f b6 c1             	movzbl %cl,%eax
  100597:	29 d8                	sub    %ebx,%eax
  100599:	5b                   	pop    %ebx
  10059a:	5e                   	pop    %esi
  10059b:	5d                   	pop    %ebp
  10059c:	c3                   	ret
  10059d:	8d 76 00             	lea    0x0(%esi),%esi
  1005a0:	5b                   	pop    %ebx
  1005a1:	31 c0                	xor    %eax,%eax
  1005a3:	5e                   	pop    %esi
  1005a4:	5d                   	pop    %ebp
  1005a5:	c3                   	ret
  1005a6:	66 90                	xchg   %ax,%ax
  1005a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1005af:	00 

001005b0 <strlen>:
  1005b0:	55                   	push   %ebp
  1005b1:	31 c0                	xor    %eax,%eax
  1005b3:	89 e5                	mov    %esp,%ebp
  1005b5:	8b 55 08             	mov    0x8(%ebp),%edx
  1005b8:	80 3a 00             	cmpb   $0x0,(%edx)
  1005bb:	74 0c                	je     1005c9 <strlen+0x19>
  1005bd:	8d 76 00             	lea    0x0(%esi),%esi
  1005c0:	83 c0 01             	add    $0x1,%eax
  1005c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  1005c7:	75 f7                	jne    1005c0 <strlen+0x10>
  1005c9:	5d                   	pop    %ebp
  1005ca:	c3                   	ret
  1005cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001005d0 <strcpy>:
  1005d0:	55                   	push   %ebp
  1005d1:	31 c0                	xor    %eax,%eax
  1005d3:	89 e5                	mov    %esp,%ebp
  1005d5:	53                   	push   %ebx
  1005d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1005d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1005dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  1005e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  1005e7:	83 c0 01             	add    $0x1,%eax
  1005ea:	84 d2                	test   %dl,%dl
  1005ec:	75 f2                	jne    1005e0 <strcpy+0x10>
  1005ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005f1:	89 c8                	mov    %ecx,%eax
  1005f3:	c9                   	leave
  1005f4:	c3                   	ret
  1005f5:	8d 76 00             	lea    0x0(%esi),%esi
  1005f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1005ff:	00 

00100600 <strncpy>:
  100600:	55                   	push   %ebp
  100601:	31 c0                	xor    %eax,%eax
  100603:	89 e5                	mov    %esp,%ebp
  100605:	56                   	push   %esi
  100606:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100609:	8b 75 0c             	mov    0xc(%ebp),%esi
  10060c:	53                   	push   %ebx
  10060d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100610:	85 c9                	test   %ecx,%ecx
  100612:	75 16                	jne    10062a <strncpy+0x2a>
  100614:	eb 48                	jmp    10065e <strncpy+0x5e>
  100616:	66 90                	xchg   %ax,%ax
  100618:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10061f:	00 
  100620:	88 14 03             	mov    %dl,(%ebx,%eax,1)
  100623:	83 c0 01             	add    $0x1,%eax
  100626:	39 c1                	cmp    %eax,%ecx
  100628:	74 34                	je     10065e <strncpy+0x5e>
  10062a:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
  10062e:	84 d2                	test   %dl,%dl
  100630:	75 ee                	jne    100620 <strncpy+0x20>
  100632:	39 c8                	cmp    %ecx,%eax
  100634:	73 28                	jae    10065e <strncpy+0x5e>
  100636:	01 d9                	add    %ebx,%ecx
  100638:	01 d8                	add    %ebx,%eax
  10063a:	89 ca                	mov    %ecx,%edx
  10063c:	29 c2                	sub    %eax,%edx
  10063e:	83 e2 01             	and    $0x1,%edx
  100641:	74 0d                	je     100650 <strncpy+0x50>
  100643:	c6 00 00             	movb   $0x0,(%eax)
  100646:	83 c0 01             	add    $0x1,%eax
  100649:	39 c1                	cmp    %eax,%ecx
  10064b:	74 11                	je     10065e <strncpy+0x5e>
  10064d:	8d 76 00             	lea    0x0(%esi),%esi
  100650:	c6 00 00             	movb   $0x0,(%eax)
  100653:	83 c0 02             	add    $0x2,%eax
  100656:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
  10065a:	39 c1                	cmp    %eax,%ecx
  10065c:	75 f2                	jne    100650 <strncpy+0x50>
  10065e:	89 d8                	mov    %ebx,%eax
  100660:	5b                   	pop    %ebx
  100661:	5e                   	pop    %esi
  100662:	5d                   	pop    %ebp
  100663:	c3                   	ret
  100664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100668:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10066f:	00 

00100670 <strcmp>:
  100670:	55                   	push   %ebp
  100671:	89 e5                	mov    %esp,%ebp
  100673:	53                   	push   %ebx
  100674:	8b 55 08             	mov    0x8(%ebp),%edx
  100677:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10067a:	0f b6 02             	movzbl (%edx),%eax
  10067d:	84 c0                	test   %al,%al
  10067f:	75 2d                	jne    1006ae <strcmp+0x3e>
  100681:	eb 4a                	jmp    1006cd <strcmp+0x5d>
  100683:	eb 1b                	jmp    1006a0 <strcmp+0x30>
  100685:	8d 76 00             	lea    0x0(%esi),%esi
  100688:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10068f:	00 
  100690:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100697:	00 
  100698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10069f:	00 
  1006a0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  1006a4:	83 c2 01             	add    $0x1,%edx
  1006a7:	84 c0                	test   %al,%al
  1006a9:	74 15                	je     1006c0 <strcmp+0x50>
  1006ab:	83 c1 01             	add    $0x1,%ecx
  1006ae:	0f b6 19             	movzbl (%ecx),%ebx
  1006b1:	38 c3                	cmp    %al,%bl
  1006b3:	74 eb                	je     1006a0 <strcmp+0x30>
  1006b5:	29 d8                	sub    %ebx,%eax
  1006b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006ba:	c9                   	leave
  1006bb:	c3                   	ret
  1006bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1006c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  1006c4:	31 c0                	xor    %eax,%eax
  1006c6:	29 d8                	sub    %ebx,%eax
  1006c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006cb:	c9                   	leave
  1006cc:	c3                   	ret
  1006cd:	0f b6 19             	movzbl (%ecx),%ebx
  1006d0:	31 c0                	xor    %eax,%eax
  1006d2:	eb e1                	jmp    1006b5 <strcmp+0x45>
  1006d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1006d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006df:	00 

001006e0 <strncmp>:
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	56                   	push   %esi
  1006e4:	8b 75 10             	mov    0x10(%ebp),%esi
  1006e7:	53                   	push   %ebx
  1006e8:	85 f6                	test   %esi,%esi
  1006ea:	74 3c                	je     100728 <strncmp+0x48>
  1006ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1006ef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1006f2:	01 c6                	add    %eax,%esi
  1006f4:	eb 18                	jmp    10070e <strncmp+0x2e>
  1006f6:	66 90                	xchg   %ax,%ax
  1006f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006ff:	00 
  100700:	84 d2                	test   %dl,%dl
  100702:	74 2c                	je     100730 <strncmp+0x50>
  100704:	83 c0 01             	add    $0x1,%eax
  100707:	83 c1 01             	add    $0x1,%ecx
  10070a:	39 c6                	cmp    %eax,%esi
  10070c:	74 1a                	je     100728 <strncmp+0x48>
  10070e:	0f b6 18             	movzbl (%eax),%ebx
  100711:	0f b6 11             	movzbl (%ecx),%edx
  100714:	38 d3                	cmp    %dl,%bl
  100716:	74 e8                	je     100700 <strncmp+0x20>
  100718:	0f b6 c3             	movzbl %bl,%eax
  10071b:	5b                   	pop    %ebx
  10071c:	29 d0                	sub    %edx,%eax
  10071e:	5e                   	pop    %esi
  10071f:	5d                   	pop    %ebp
  100720:	c3                   	ret
  100721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100728:	5b                   	pop    %ebx
  100729:	31 c0                	xor    %eax,%eax
  10072b:	5e                   	pop    %esi
  10072c:	5d                   	pop    %ebp
  10072d:	c3                   	ret
  10072e:	66 90                	xchg   %ax,%ax
  100730:	31 c0                	xor    %eax,%eax
  100732:	eb e7                	jmp    10071b <strncmp+0x3b>
  100734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10073f:	00 

00100740 <strcat>:
  100740:	55                   	push   %ebp
  100741:	89 e5                	mov    %esp,%ebp
  100743:	56                   	push   %esi
  100744:	8b 75 08             	mov    0x8(%ebp),%esi
  100747:	53                   	push   %ebx
  100748:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10074b:	89 f2                	mov    %esi,%edx
  10074d:	80 3e 00             	cmpb   $0x0,(%esi)
  100750:	74 16                	je     100768 <strcat+0x28>
  100752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10075f:	00 
  100760:	83 c2 01             	add    $0x1,%edx
  100763:	80 3a 00             	cmpb   $0x0,(%edx)
  100766:	75 f8                	jne    100760 <strcat+0x20>
  100768:	31 c0                	xor    %eax,%eax
  10076a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100770:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
  100774:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  100777:	83 c0 01             	add    $0x1,%eax
  10077a:	84 c9                	test   %cl,%cl
  10077c:	75 f2                	jne    100770 <strcat+0x30>
  10077e:	89 f0                	mov    %esi,%eax
  100780:	5b                   	pop    %ebx
  100781:	5e                   	pop    %esi
  100782:	5d                   	pop    %ebp
  100783:	c3                   	ret
  100784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10078f:	00 

00100790 <strchr>:
  100790:	55                   	push   %ebp
  100791:	89 e5                	mov    %esp,%ebp
  100793:	8b 45 08             	mov    0x8(%ebp),%eax
  100796:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100799:	0f b6 10             	movzbl (%eax),%edx
  10079c:	38 ca                	cmp    %cl,%dl
  10079e:	75 1b                	jne    1007bb <strchr+0x2b>
  1007a0:	eb 1f                	jmp    1007c1 <strchr+0x31>
  1007a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1007a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007af:	00 
  1007b0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  1007b4:	83 c0 01             	add    $0x1,%eax
  1007b7:	38 ca                	cmp    %cl,%dl
  1007b9:	74 06                	je     1007c1 <strchr+0x31>
  1007bb:	84 d2                	test   %dl,%dl
  1007bd:	75 f1                	jne    1007b0 <strchr+0x20>
  1007bf:	31 c0                	xor    %eax,%eax
  1007c1:	5d                   	pop    %ebp
  1007c2:	c3                   	ret
  1007c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007cf:	00 

001007d0 <strrchr>:
  1007d0:	55                   	push   %ebp
  1007d1:	89 e5                	mov    %esp,%ebp
  1007d3:	53                   	push   %ebx
  1007d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007d7:	0f b6 10             	movzbl (%eax),%edx
  1007da:	84 d2                	test   %dl,%dl
  1007dc:	74 32                	je     100810 <strrchr+0x40>
  1007de:	0f b6 5d 0c          	movzbl 0xc(%ebp),%ebx
  1007e2:	31 c9                	xor    %ecx,%ecx
  1007e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1007e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007ef:	00 
  1007f0:	38 d3                	cmp    %dl,%bl
  1007f2:	0f 44 c8             	cmove  %eax,%ecx
  1007f5:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  1007f9:	83 c0 01             	add    $0x1,%eax
  1007fc:	84 d2                	test   %dl,%dl
  1007fe:	75 f0                	jne    1007f0 <strrchr+0x20>
  100800:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100803:	89 c8                	mov    %ecx,%eax
  100805:	c9                   	leave
  100806:	c3                   	ret
  100807:	90                   	nop
  100808:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10080f:	00 
  100810:	31 c9                	xor    %ecx,%ecx
  100812:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100815:	c9                   	leave
  100816:	89 c8                	mov    %ecx,%eax
  100818:	c3                   	ret
  100819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100820 <putchar>:
  100820:	55                   	push   %ebp
  100821:	0f b6 15 31 30 11 00 	movzbl 0x113031,%edx
  100828:	89 e5                	mov    %esp,%ebp
  10082a:	53                   	push   %ebx
  10082b:	8b 45 08             	mov    0x8(%ebp),%eax
  10082e:	3c 0a                	cmp    $0xa,%al
  100830:	74 31                	je     100863 <putchar+0x43>
  100832:	3c 0d                	cmp    $0xd,%al
  100834:	74 52                	je     100888 <putchar+0x68>
  100836:	0f b6 ca             	movzbl %dl,%ecx
  100839:	0f b6 1d 30 30 11 00 	movzbl 0x113030,%ebx
  100840:	66 98                	cbtw
  100842:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100845:	80 cc 07             	or     $0x7,%ah
  100848:	c1 e1 04             	shl    $0x4,%ecx
  10084b:	01 d9                	add    %ebx,%ecx
  10084d:	66 89 84 09 00 80 0b 	mov    %ax,0xb8000(%ecx,%ecx,1)
  100854:	00 
  100855:	0f b6 05 30 30 11 00 	movzbl 0x113030,%eax
  10085c:	83 c0 01             	add    $0x1,%eax
  10085f:	3c 4f                	cmp    $0x4f,%al
  100861:	76 35                	jbe    100898 <putchar+0x78>
  100863:	83 c2 01             	add    $0x1,%edx
  100866:	c6 05 30 30 11 00 00 	movb   $0x0,0x113030
  10086d:	88 15 31 30 11 00    	mov    %dl,0x113031
  100873:	80 fa 18             	cmp    $0x18,%dl
  100876:	76 07                	jbe    10087f <putchar+0x5f>
  100878:	c6 05 31 30 11 00 00 	movb   $0x0,0x113031
  10087f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100882:	c9                   	leave
  100883:	c3                   	ret
  100884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100888:	c6 05 30 30 11 00 00 	movb   $0x0,0x113030
  10088f:	eb e2                	jmp    100873 <putchar+0x53>
  100891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100898:	a2 30 30 11 00       	mov    %al,0x113030
  10089d:	eb d4                	jmp    100873 <putchar+0x53>
  10089f:	90                   	nop

001008a0 <printf>:
  1008a0:	55                   	push   %ebp
  1008a1:	89 e5                	mov    %esp,%ebp
  1008a3:	57                   	push   %edi
  1008a4:	56                   	push   %esi
  1008a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1008a8:	53                   	push   %ebx
  1008a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1008b0:	66 0f be 01          	movsbw (%ecx),%ax
  1008b4:	84 c0                	test   %al,%al
  1008b6:	74 2e                	je     1008e6 <printf+0x46>
  1008b8:	0f b6 15 31 30 11 00 	movzbl 0x113031,%edx
  1008bf:	83 c1 01             	add    $0x1,%ecx
  1008c2:	3c 0a                	cmp    $0xa,%al
  1008c4:	74 51                	je     100917 <printf+0x77>
  1008c6:	3c 0d                	cmp    $0xd,%al
  1008c8:	75 26                	jne    1008f0 <printf+0x50>
  1008ca:	31 db                	xor    %ebx,%ebx
  1008cc:	88 1d 30 30 11 00    	mov    %bl,0x113030
  1008d2:	80 fa 18             	cmp    $0x18,%dl
  1008d5:	76 d9                	jbe    1008b0 <printf+0x10>
  1008d7:	c6 05 31 30 11 00 00 	movb   $0x0,0x113031
  1008de:	66 0f be 01          	movsbw (%ecx),%ax
  1008e2:	84 c0                	test   %al,%al
  1008e4:	75 d2                	jne    1008b8 <printf+0x18>
  1008e6:	5b                   	pop    %ebx
  1008e7:	5e                   	pop    %esi
  1008e8:	5f                   	pop    %edi
  1008e9:	5d                   	pop    %ebp
  1008ea:	c3                   	ret
  1008eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1008f0:	0f b6 3d 30 30 11 00 	movzbl 0x113030,%edi
  1008f7:	0f b6 f2             	movzbl %dl,%esi
  1008fa:	80 cc 07             	or     $0x7,%ah
  1008fd:	8d 34 b6             	lea    (%esi,%esi,4),%esi
  100900:	89 fb                	mov    %edi,%ebx
  100902:	c1 e6 04             	shl    $0x4,%esi
  100905:	01 fe                	add    %edi,%esi
  100907:	83 c3 01             	add    $0x1,%ebx
  10090a:	66 89 84 36 00 80 0b 	mov    %ax,0xb8000(%esi,%esi,1)
  100911:	00 
  100912:	80 fb 4f             	cmp    $0x4f,%bl
  100915:	76 b5                	jbe    1008cc <printf+0x2c>
  100917:	83 c2 01             	add    $0x1,%edx
  10091a:	c6 05 30 30 11 00 00 	movb   $0x0,0x113030
  100921:	88 15 31 30 11 00    	mov    %dl,0x113031
  100927:	eb a9                	jmp    1008d2 <printf+0x32>
  100929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100930 <itoa>:
  100930:	55                   	push   %ebp
  100931:	89 e5                	mov    %esp,%ebp
  100933:	57                   	push   %edi
  100934:	56                   	push   %esi
  100935:	53                   	push   %ebx
  100936:	83 ec 04             	sub    $0x4,%esp
  100939:	8b 45 08             	mov    0x8(%ebp),%eax
  10093c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10093f:	85 c0                	test   %eax,%eax
  100941:	0f 84 89 00 00 00    	je     1009d0 <itoa+0xa0>
  100947:	79 7f                	jns    1009c8 <itoa+0x98>
  100949:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
  10094d:	75 79                	jne    1009c8 <itoa+0x98>
  10094f:	f7 d8                	neg    %eax
  100951:	bf 01 00 00 00       	mov    $0x1,%edi
  100956:	89 7d f0             	mov    %edi,-0x10(%ebp)
  100959:	31 c9                	xor    %ecx,%ecx
  10095b:	eb 05                	jmp    100962 <itoa+0x32>
  10095d:	8d 76 00             	lea    0x0(%esi),%esi
  100960:	89 f1                	mov    %esi,%ecx
  100962:	99                   	cltd
  100963:	f7 7d 10             	idivl  0x10(%ebp)
  100966:	8d 72 30             	lea    0x30(%edx),%esi
  100969:	8d 7a 57             	lea    0x57(%edx),%edi
  10096c:	83 fa 0a             	cmp    $0xa,%edx
  10096f:	0f 4c fe             	cmovl  %esi,%edi
  100972:	8d 71 01             	lea    0x1(%ecx),%esi
  100975:	89 fa                	mov    %edi,%edx
  100977:	88 54 33 ff          	mov    %dl,-0x1(%ebx,%esi,1)
  10097b:	85 c0                	test   %eax,%eax
  10097d:	75 e1                	jne    100960 <itoa+0x30>
  10097f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100982:	85 d2                	test   %edx,%edx
  100984:	74 5a                	je     1009e0 <itoa+0xb0>
  100986:	c6 04 33 2d          	movb   $0x2d,(%ebx,%esi,1)
  10098a:	c6 44 0b 02 00       	movb   $0x0,0x2(%ebx,%ecx,1)
  10098f:	89 f1                	mov    %esi,%ecx
  100991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100998:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10099f:	00 
  1009a0:	0f b6 34 03          	movzbl (%ebx,%eax,1),%esi
  1009a4:	0f b6 14 0b          	movzbl (%ebx,%ecx,1),%edx
  1009a8:	88 14 03             	mov    %dl,(%ebx,%eax,1)
  1009ab:	89 f2                	mov    %esi,%edx
  1009ad:	83 c0 01             	add    $0x1,%eax
  1009b0:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  1009b3:	83 e9 01             	sub    $0x1,%ecx
  1009b6:	39 c8                	cmp    %ecx,%eax
  1009b8:	7c e6                	jl     1009a0 <itoa+0x70>
  1009ba:	83 c4 04             	add    $0x4,%esp
  1009bd:	5b                   	pop    %ebx
  1009be:	5e                   	pop    %esi
  1009bf:	5f                   	pop    %edi
  1009c0:	5d                   	pop    %ebp
  1009c1:	c3                   	ret
  1009c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1009c8:	31 ff                	xor    %edi,%edi
  1009ca:	eb 8a                	jmp    100956 <itoa+0x26>
  1009cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1009d0:	b9 30 00 00 00       	mov    $0x30,%ecx
  1009d5:	66 89 0b             	mov    %cx,(%ebx)
  1009d8:	83 c4 04             	add    $0x4,%esp
  1009db:	5b                   	pop    %ebx
  1009dc:	5e                   	pop    %esi
  1009dd:	5f                   	pop    %edi
  1009de:	5d                   	pop    %ebp
  1009df:	c3                   	ret
  1009e0:	c6 04 33 00          	movb   $0x0,(%ebx,%esi,1)
  1009e4:	85 c9                	test   %ecx,%ecx
  1009e6:	75 b8                	jne    1009a0 <itoa+0x70>
  1009e8:	eb d0                	jmp    1009ba <itoa+0x8a>
  1009ea:	66 90                	xchg   %ax,%ax
  1009ec:	66 90                	xchg   %ax,%ax
  1009ee:	66 90                	xchg   %ax,%ax
  1009f0:	66 90                	xchg   %ax,%ax
  1009f2:	66 90                	xchg   %ax,%ax
  1009f4:	66 90                	xchg   %ax,%ax
  1009f6:	66 90                	xchg   %ax,%ax
  1009f8:	66 90                	xchg   %ax,%ax
  1009fa:	66 90                	xchg   %ax,%ax
  1009fc:	66 90                	xchg   %ax,%ax
  1009fe:	66 90                	xchg   %ax,%ax

00100a00 <terminal_newline>:
  100a00:	0f b6 05 33 30 11 00 	movzbl 0x113033,%eax
  100a07:	c6 05 32 30 11 00 00 	movb   $0x0,0x113032
  100a0e:	3c 18                	cmp    $0x18,%al
  100a10:	74 09                	je     100a1b <terminal_newline+0x1b>
  100a12:	83 c0 01             	add    $0x1,%eax
  100a15:	a2 33 30 11 00       	mov    %al,0x113033
  100a1a:	c3                   	ret
  100a1b:	55                   	push   %ebp
  100a1c:	b9 50 00 00 00       	mov    $0x50,%ecx
  100a21:	b8 a0 80 0b 00       	mov    $0xb80a0,%eax
  100a26:	89 e5                	mov    %esp,%ebp
  100a28:	53                   	push   %ebx
  100a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100a30:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100a36:	66 90                	xchg   %ax,%ax
  100a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a3f:	00 
  100a40:	0f b7 18             	movzwl (%eax),%ebx
  100a43:	83 c0 02             	add    $0x2,%eax
  100a46:	66 89 98 5e ff ff ff 	mov    %bx,-0xa2(%eax)
  100a4d:	39 c2                	cmp    %eax,%edx
  100a4f:	75 ef                	jne    100a40 <terminal_newline+0x40>
  100a51:	83 c1 50             	add    $0x50,%ecx
  100a54:	81 f9 d0 07 00 00    	cmp    $0x7d0,%ecx
  100a5a:	74 04                	je     100a60 <terminal_newline+0x60>
  100a5c:	89 d0                	mov    %edx,%eax
  100a5e:	eb d0                	jmp    100a30 <terminal_newline+0x30>
  100a60:	b8 00 8f 0b 00       	mov    $0xb8f00,%eax
  100a65:	eb 19                	jmp    100a80 <terminal_newline+0x80>
  100a67:	90                   	nop
  100a68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a6f:	00 
  100a70:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a77:	00 
  100a78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a7f:	00 
  100a80:	ba 20 0f 00 00       	mov    $0xf20,%edx
  100a85:	b9 20 0f 00 00       	mov    $0xf20,%ecx
  100a8a:	83 c0 04             	add    $0x4,%eax
  100a8d:	66 89 50 fc          	mov    %dx,-0x4(%eax)
  100a91:	66 89 48 fe          	mov    %cx,-0x2(%eax)
  100a95:	3d a0 8f 0b 00       	cmp    $0xb8fa0,%eax
  100a9a:	75 e4                	jne    100a80 <terminal_newline+0x80>
  100a9c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a9f:	c9                   	leave
  100aa0:	c3                   	ret
  100aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100aaf:	00 

00100ab0 <terminal_putchar>:
  100ab0:	55                   	push   %ebp
  100ab1:	89 e5                	mov    %esp,%ebp
  100ab3:	53                   	push   %ebx
  100ab4:	83 ec 04             	sub    $0x4,%esp
  100ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aba:	3c 0a                	cmp    $0xa,%al
  100abc:	74 42                	je     100b00 <terminal_putchar+0x50>
  100abe:	7f 28                	jg     100ae8 <terminal_putchar+0x38>
  100ac0:	3c 08                	cmp    $0x8,%al
  100ac2:	74 5c                	je     100b20 <terminal_putchar+0x70>
  100ac4:	bb 04 00 00 00       	mov    $0x4,%ebx
  100ac9:	3c 09                	cmp    $0x9,%al
  100acb:	75 38                	jne    100b05 <terminal_putchar+0x55>
  100acd:	83 ec 0c             	sub    $0xc,%esp
  100ad0:	6a 20                	push   $0x20
  100ad2:	e8 d9 ff ff ff       	call   100ab0 <terminal_putchar>
  100ad7:	83 c4 10             	add    $0x10,%esp
  100ada:	83 eb 01             	sub    $0x1,%ebx
  100add:	75 ee                	jne    100acd <terminal_putchar+0x1d>
  100adf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ae2:	c9                   	leave
  100ae3:	c3                   	ret
  100ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ae8:	3c 0d                	cmp    $0xd,%al
  100aea:	75 74                	jne    100b60 <terminal_putchar+0xb0>
  100aec:	c6 05 32 30 11 00 00 	movb   $0x0,0x113032
  100af3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100af6:	c9                   	leave
  100af7:	c3                   	ret
  100af8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100aff:	00 
  100b00:	e8 fb fe ff ff       	call   100a00 <terminal_newline>
  100b05:	0f b6 15 32 30 11 00 	movzbl 0x113032,%edx
  100b0c:	80 fa 50             	cmp    $0x50,%dl
  100b0f:	75 ce                	jne    100adf <terminal_putchar+0x2f>
  100b11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b14:	c9                   	leave
  100b15:	e9 e6 fe ff ff       	jmp    100a00 <terminal_newline>
  100b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100b20:	0f b6 15 32 30 11 00 	movzbl 0x113032,%edx
  100b27:	0f b6 05 33 30 11 00 	movzbl 0x113033,%eax
  100b2e:	84 d2                	test   %dl,%dl
  100b30:	75 6e                	jne    100ba0 <terminal_putchar+0xf0>
  100b32:	84 c0                	test   %al,%al
  100b34:	74 a9                	je     100adf <terminal_putchar+0x2f>
  100b36:	83 e8 01             	sub    $0x1,%eax
  100b39:	ba 20 0f 00 00       	mov    $0xf20,%edx
  100b3e:	c6 05 32 30 11 00 4f 	movb   $0x4f,0x113032
  100b45:	a2 33 30 11 00       	mov    %al,0x113033
  100b4a:	0f b6 c0             	movzbl %al,%eax
  100b4d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100b50:	c1 e0 04             	shl    $0x4,%eax
  100b53:	66 89 94 00 9e 80 0b 	mov    %dx,0xb809e(%eax,%eax,1)
  100b5a:	00 
  100b5b:	eb 82                	jmp    100adf <terminal_putchar+0x2f>
  100b5d:	8d 76 00             	lea    0x0(%esi),%esi
  100b60:	0f b6 15 32 30 11 00 	movzbl 0x113032,%edx
  100b67:	3c 1f                	cmp    $0x1f,%al
  100b69:	7e a1                	jle    100b0c <terminal_putchar+0x5c>
  100b6b:	0f b6 0d 33 30 11 00 	movzbl 0x113033,%ecx
  100b72:	0f b6 da             	movzbl %dl,%ebx
  100b75:	66 98                	cbtw
  100b77:	83 c2 01             	add    $0x1,%edx
  100b7a:	80 cc 0f             	or     $0xf,%ah
  100b7d:	88 15 32 30 11 00    	mov    %dl,0x113032
  100b83:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100b86:	c1 e1 04             	shl    $0x4,%ecx
  100b89:	01 d9                	add    %ebx,%ecx
  100b8b:	66 89 84 09 00 80 0b 	mov    %ax,0xb8000(%ecx,%ecx,1)
  100b92:	00 
  100b93:	e9 74 ff ff ff       	jmp    100b0c <terminal_putchar+0x5c>
  100b98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100b9f:	00 
  100ba0:	83 ea 01             	sub    $0x1,%edx
  100ba3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100ba6:	0f b6 ca             	movzbl %dl,%ecx
  100ba9:	c1 e0 04             	shl    $0x4,%eax
  100bac:	88 15 32 30 11 00    	mov    %dl,0x113032
  100bb2:	01 c8                	add    %ecx,%eax
  100bb4:	b9 20 0f 00 00       	mov    $0xf20,%ecx
  100bb9:	66 89 8c 00 00 80 0b 	mov    %cx,0xb8000(%eax,%eax,1)
  100bc0:	00 
  100bc1:	e9 46 ff ff ff       	jmp    100b0c <terminal_putchar+0x5c>
  100bc6:	66 90                	xchg   %ax,%ax
  100bc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100bcf:	00 

00100bd0 <terminal_write>:
  100bd0:	55                   	push   %ebp
  100bd1:	89 e5                	mov    %esp,%ebp
  100bd3:	56                   	push   %esi
  100bd4:	53                   	push   %ebx
  100bd5:	8b 75 0c             	mov    0xc(%ebp),%esi
  100bd8:	85 f6                	test   %esi,%esi
  100bda:	74 2a                	je     100c06 <terminal_write+0x36>
  100bdc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100bdf:	01 de                	add    %ebx,%esi
  100be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100be8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100bef:	00 
  100bf0:	0f be 03             	movsbl (%ebx),%eax
  100bf3:	83 ec 0c             	sub    $0xc,%esp
  100bf6:	83 c3 01             	add    $0x1,%ebx
  100bf9:	50                   	push   %eax
  100bfa:	e8 b1 fe ff ff       	call   100ab0 <terminal_putchar>
  100bff:	83 c4 10             	add    $0x10,%esp
  100c02:	39 f3                	cmp    %esi,%ebx
  100c04:	75 ea                	jne    100bf0 <terminal_write+0x20>
  100c06:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c09:	5b                   	pop    %ebx
  100c0a:	5e                   	pop    %esi
  100c0b:	5d                   	pop    %ebp
  100c0c:	c3                   	ret
  100c0d:	8d 76 00             	lea    0x0(%esi),%esi

00100c10 <terminal_writestring>:
  100c10:	55                   	push   %ebp
  100c11:	89 e5                	mov    %esp,%ebp
  100c13:	53                   	push   %ebx
  100c14:	83 ec 04             	sub    $0x4,%esp
  100c17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c1a:	0f be 03             	movsbl (%ebx),%eax
  100c1d:	84 c0                	test   %al,%al
  100c1f:	74 25                	je     100c46 <terminal_writestring+0x36>
  100c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100c28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c2f:	00 
  100c30:	83 ec 0c             	sub    $0xc,%esp
  100c33:	83 c3 01             	add    $0x1,%ebx
  100c36:	50                   	push   %eax
  100c37:	e8 74 fe ff ff       	call   100ab0 <terminal_putchar>
  100c3c:	0f be 03             	movsbl (%ebx),%eax
  100c3f:	83 c4 10             	add    $0x10,%esp
  100c42:	84 c0                	test   %al,%al
  100c44:	75 ea                	jne    100c30 <terminal_writestring+0x20>
  100c46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c49:	c9                   	leave
  100c4a:	c3                   	ret
  100c4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00100c50 <terminal_clear>:
  100c50:	ba a0 80 0b 00       	mov    $0xb80a0,%edx
  100c55:	8d 76 00             	lea    0x0(%esi),%esi
  100c58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c5f:	00 
  100c60:	8d 82 60 ff ff ff    	lea    -0xa0(%edx),%eax
  100c66:	eb 18                	jmp    100c80 <terminal_clear+0x30>
  100c68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c6f:	00 
  100c70:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c77:	00 
  100c78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c7f:	00 
  100c80:	b9 20 0f 00 00       	mov    $0xf20,%ecx
  100c85:	83 c0 04             	add    $0x4,%eax
  100c88:	66 89 48 fc          	mov    %cx,-0x4(%eax)
  100c8c:	b9 20 0f 00 00       	mov    $0xf20,%ecx
  100c91:	66 89 48 fe          	mov    %cx,-0x2(%eax)
  100c95:	39 d0                	cmp    %edx,%eax
  100c97:	75 e7                	jne    100c80 <terminal_clear+0x30>
  100c99:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100c9f:	3d a0 8f 0b 00       	cmp    $0xb8fa0,%eax
  100ca4:	75 ba                	jne    100c60 <terminal_clear+0x10>
  100ca6:	c6 05 33 30 11 00 00 	movb   $0x0,0x113033
  100cad:	c6 05 32 30 11 00 00 	movb   $0x0,0x113032
  100cb4:	c3                   	ret
  100cb5:	8d 76 00             	lea    0x0(%esi),%esi
  100cb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100cbf:	00 

00100cc0 <terminal_setcursor>:
  100cc0:	55                   	push   %ebp
  100cc1:	89 e5                	mov    %esp,%ebp
  100cc3:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc6:	8b 55 0c             	mov    0xc(%ebp),%edx
  100cc9:	3c 18                	cmp    $0x18,%al
  100ccb:	77 10                	ja     100cdd <terminal_setcursor+0x1d>
  100ccd:	80 fa 4f             	cmp    $0x4f,%dl
  100cd0:	77 0b                	ja     100cdd <terminal_setcursor+0x1d>
  100cd2:	a2 33 30 11 00       	mov    %al,0x113033
  100cd7:	88 15 32 30 11 00    	mov    %dl,0x113032
  100cdd:	5d                   	pop    %ebp
  100cde:	c3                   	ret
  100cdf:	90                   	nop

00100ce0 <terminal_initialize>:
  100ce0:	e9 6b ff ff ff       	jmp    100c50 <terminal_clear>
  100ce5:	8d 76 00             	lea    0x0(%esi),%esi
  100ce8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100cef:	00 

00100cf0 <terminal_writeat>:
  100cf0:	55                   	push   %ebp
  100cf1:	89 e5                	mov    %esp,%ebp
  100cf3:	57                   	push   %edi
  100cf4:	56                   	push   %esi
  100cf5:	53                   	push   %ebx
  100cf6:	83 ec 04             	sub    $0x4,%esp
  100cf9:	8b 55 08             	mov    0x8(%ebp),%edx
  100cfc:	8b 75 0c             	mov    0xc(%ebp),%esi
  100cff:	8b 7d 10             	mov    0x10(%ebp),%edi
  100d02:	80 fa 18             	cmp    $0x18,%dl
  100d05:	77 5d                	ja     100d64 <terminal_writeat+0x74>
  100d07:	89 f0                	mov    %esi,%eax
  100d09:	3c 4f                	cmp    $0x4f,%al
  100d0b:	77 57                	ja     100d64 <terminal_writeat+0x74>
  100d0d:	0f b6 07             	movzbl (%edi),%eax
  100d10:	84 c0                	test   %al,%al
  100d12:	74 50                	je     100d64 <terminal_writeat+0x74>
  100d14:	0f b6 d2             	movzbl %dl,%edx
  100d17:	89 f3                	mov    %esi,%ebx
  100d19:	8d 14 92             	lea    (%edx,%edx,4),%edx
  100d1c:	0f b6 cb             	movzbl %bl,%ecx
  100d1f:	c1 e2 04             	shl    $0x4,%edx
  100d22:	01 ca                	add    %ecx,%edx
  100d24:	8d 8c 12 00 80 0b 00 	lea    0xb8000(%edx,%edx,1),%ecx
  100d2b:	89 fa                	mov    %edi,%edx
  100d2d:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  100d30:	eb 12                	jmp    100d44 <terminal_writeat+0x54>
  100d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100d38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100d3f:	00 
  100d40:	84 c0                	test   %al,%al
  100d42:	74 20                	je     100d64 <terminal_writeat+0x74>
  100d44:	83 45 f0 02          	addl   $0x2,-0x10(%ebp)
  100d48:	8b 5d f0             	mov    -0x10(%ebp),%ebx
  100d4b:	83 c2 01             	add    $0x1,%edx
  100d4e:	80 cc 0f             	or     $0xf,%ah
  100d51:	8d 0c 16             	lea    (%esi,%edx,1),%ecx
  100d54:	66 89 43 fe          	mov    %ax,-0x2(%ebx)
  100d58:	89 fb                	mov    %edi,%ebx
  100d5a:	0f b6 02             	movzbl (%edx),%eax
  100d5d:	29 d9                	sub    %ebx,%ecx
  100d5f:	80 f9 50             	cmp    $0x50,%cl
  100d62:	75 dc                	jne    100d40 <terminal_writeat+0x50>
  100d64:	83 c4 04             	add    $0x4,%esp
  100d67:	5b                   	pop    %ebx
  100d68:	5e                   	pop    %esi
  100d69:	5f                   	pop    %edi
  100d6a:	5d                   	pop    %ebp
  100d6b:	c3                   	ret
  100d6c:	66 90                	xchg   %ax,%ax
  100d6e:	66 90                	xchg   %ax,%ax

00100d70 <gdt_init>:
  100d70:	55                   	push   %ebp
  100d71:	89 e5                	mov    %esp,%ebp
  100d73:	56                   	push   %esi
  100d74:	be 40 30 11 00       	mov    $0x113040,%esi
  100d79:	53                   	push   %ebx
  100d7a:	bb a8 30 11 00       	mov    $0x1130a8,%ebx
  100d7f:	83 ec 0c             	sub    $0xc,%esp
  100d82:	68 43 ba 10 00       	push   $0x10ba43
  100d87:	e8 84 fe ff ff       	call   100c10 <terminal_writestring>
  100d8c:	83 c4 0c             	add    $0xc,%esp
  100d8f:	b8 2f 00 00 00       	mov    $0x2f,%eax
  100d94:	c7 05 aa 30 11 00 c0 	movl   $0x1130c0,0x1130aa
  100d9b:	30 11 00 
  100d9e:	66 a3 a8 30 11 00    	mov    %ax,0x1130a8
  100da4:	c7 05 c0 30 11 00 00 	movl   $0x0,0x1130c0
  100dab:	00 00 00 
  100dae:	c7 05 c4 30 11 00 00 	movl   $0x0,0x1130c4
  100db5:	00 00 00 
  100db8:	c7 05 c8 30 11 00 ff 	movl   $0xffff,0x1130c8
  100dbf:	ff 00 00 
  100dc2:	c7 05 cc 30 11 00 00 	movl   $0xcf9a00,0x1130cc
  100dc9:	9a cf 00 
  100dcc:	c7 05 d0 30 11 00 ff 	movl   $0xffff,0x1130d0
  100dd3:	ff 00 00 
  100dd6:	c7 05 d4 30 11 00 00 	movl   $0xcf9200,0x1130d4
  100ddd:	92 cf 00 
  100de0:	c7 05 d8 30 11 00 ff 	movl   $0xffff,0x1130d8
  100de7:	ff 00 00 
  100dea:	c7 05 dc 30 11 00 00 	movl   $0xcffa00,0x1130dc
  100df1:	fa cf 00 
  100df4:	c7 05 e0 30 11 00 ff 	movl   $0xffff,0x1130e0
  100dfb:	ff 00 00 
  100dfe:	c7 05 e4 30 11 00 00 	movl   $0xcff200,0x1130e4
  100e05:	f2 cf 00 
  100e08:	6a 68                	push   $0x68
  100e0a:	6a 00                	push   $0x0
  100e0c:	56                   	push   %esi
  100e0d:	e8 8e f6 ff ff       	call   1004a0 <memset>
  100e12:	89 f0                	mov    %esi,%eax
  100e14:	66 89 1d e8 30 11 00 	mov    %bx,0x1130e8
  100e1b:	c1 eb 10             	shr    $0x10,%ebx
  100e1e:	c1 e8 10             	shr    $0x10,%eax
  100e21:	ba 68 00 00 00       	mov    $0x68,%edx
  100e26:	83 e3 0f             	and    $0xf,%ebx
  100e29:	66 89 35 ea 30 11 00 	mov    %si,0x1130ea
  100e30:	a2 ec 30 11 00       	mov    %al,0x1130ec
  100e35:	89 f0                	mov    %esi,%eax
  100e37:	c1 e8 18             	shr    $0x18,%eax
  100e3a:	66 89 15 a6 30 11 00 	mov    %dx,0x1130a6
  100e41:	a2 ef 30 11 00       	mov    %al,0x1130ef
  100e46:	88 1d ee 30 11 00    	mov    %bl,0x1130ee
  100e4c:	c7 05 48 30 11 00 10 	movl   $0x10,0x113048
  100e53:	00 00 00 
  100e56:	c7 05 44 30 11 00 00 	movl   $0x10000,0x113044
  100e5d:	00 01 00 
  100e60:	c6 05 ed 30 11 00 89 	movb   $0x89,0x1130ed
  100e67:	c7 04 24 a8 30 11 00 	movl   $0x1130a8,(%esp)
  100e6e:	e8 2d 00 00 00       	call   100ea0 <gdt_flush>
  100e73:	e8 45 00 00 00       	call   100ebd <tss_flush>
  100e78:	c7 04 24 58 ba 10 00 	movl   $0x10ba58,(%esp)
  100e7f:	e8 8c fd ff ff       	call   100c10 <terminal_writestring>
  100e84:	83 c4 10             	add    $0x10,%esp
  100e87:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e8a:	5b                   	pop    %ebx
  100e8b:	5e                   	pop    %esi
  100e8c:	5d                   	pop    %ebp
  100e8d:	c3                   	ret
  100e8e:	66 90                	xchg   %ax,%ax

00100e90 <tss_set_esp0>:
  100e90:	55                   	push   %ebp
  100e91:	89 e5                	mov    %esp,%ebp
  100e93:	8b 45 08             	mov    0x8(%ebp),%eax
  100e96:	5d                   	pop    %ebp
  100e97:	a3 44 30 11 00       	mov    %eax,0x113044
  100e9c:	c3                   	ret
  100e9d:	66 90                	xchg   %ax,%ax
  100e9f:	90                   	nop

00100ea0 <gdt_flush>:
  100ea0:	8b 44 24 04          	mov    0x4(%esp),%eax
  100ea4:	0f 01 10             	lgdtl  (%eax)
  100ea7:	66 b8 10 00          	mov    $0x10,%ax
  100eab:	8e d8                	mov    %eax,%ds
  100ead:	8e c0                	mov    %eax,%es
  100eaf:	8e e0                	mov    %eax,%fs
  100eb1:	8e e8                	mov    %eax,%gs
  100eb3:	8e d0                	mov    %eax,%ss
  100eb5:	ea bc 0e 10 00 08 00 	ljmp   $0x8,$0x100ebc

00100ebc <gdt_flush.flush>:
  100ebc:	c3                   	ret

00100ebd <tss_flush>:
  100ebd:	66 b8 28 00          	mov    $0x28,%ax
  100ec1:	0f 00 d8             	ltr    %eax
  100ec4:	c3                   	ret
  100ec5:	66 90                	xchg   %ax,%ax
  100ec7:	66 90                	xchg   %ax,%ax
  100ec9:	66 90                	xchg   %ax,%ax
  100ecb:	66 90                	xchg   %ax,%ax
  100ecd:	66 90                	xchg   %ax,%ax
  100ecf:	90                   	nop

00100ed0 <pic_remap>:
  100ed0:	55                   	push   %ebp
  100ed1:	89 e5                	mov    %esp,%ebp
  100ed3:	e4 21                	in     $0x21,%al
  100ed5:	89 c1                	mov    %eax,%ecx
  100ed7:	e4 a1                	in     $0xa1,%al
  100ed9:	89 c2                	mov    %eax,%edx
  100edb:	b8 11 00 00 00       	mov    $0x11,%eax
  100ee0:	e6 20                	out    %al,$0x20
  100ee2:	e6 a0                	out    %al,$0xa0
  100ee4:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  100ee8:	e6 21                	out    %al,$0x21
  100eea:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  100eee:	e6 a1                	out    %al,$0xa1
  100ef0:	b8 04 00 00 00       	mov    $0x4,%eax
  100ef5:	e6 21                	out    %al,$0x21
  100ef7:	b8 02 00 00 00       	mov    $0x2,%eax
  100efc:	e6 a1                	out    %al,$0xa1
  100efe:	b8 01 00 00 00       	mov    $0x1,%eax
  100f03:	e6 21                	out    %al,$0x21
  100f05:	e6 a1                	out    %al,$0xa1
  100f07:	89 c8                	mov    %ecx,%eax
  100f09:	e6 21                	out    %al,$0x21
  100f0b:	89 d0                	mov    %edx,%eax
  100f0d:	e6 a1                	out    %al,$0xa1
  100f0f:	5d                   	pop    %ebp
  100f10:	c3                   	ret
  100f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100f18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100f1f:	00 

00100f20 <pic_send_eoi>:
  100f20:	55                   	push   %ebp
  100f21:	89 e5                	mov    %esp,%ebp
  100f23:	80 7d 08 07          	cmpb   $0x7,0x8(%ebp)
  100f27:	76 07                	jbe    100f30 <pic_send_eoi+0x10>
  100f29:	b8 20 00 00 00       	mov    $0x20,%eax
  100f2e:	e6 a0                	out    %al,$0xa0
  100f30:	b8 20 00 00 00       	mov    $0x20,%eax
  100f35:	e6 20                	out    %al,$0x20
  100f37:	5d                   	pop    %ebp
  100f38:	c3                   	ret
  100f39:	66 90                	xchg   %ax,%ax
  100f3b:	66 90                	xchg   %ax,%ax
  100f3d:	66 90                	xchg   %ax,%ax
  100f3f:	90                   	nop

00100f40 <idt_set_gate>:
  100f40:	55                   	push   %ebp
  100f41:	89 e5                	mov    %esp,%ebp
  100f43:	53                   	push   %ebx
  100f44:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100f47:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  100f4b:	8b 5d 14             	mov    0x14(%ebp),%ebx
  100f4e:	8b 55 0c             	mov    0xc(%ebp),%edx
  100f51:	66 89 0c c5 22 31 11 	mov    %cx,0x113122(,%eax,8)
  100f58:	00 
  100f59:	0f b7 0d 20 dc 10 00 	movzwl 0x10dc20,%ecx
  100f60:	66 89 14 c5 20 31 11 	mov    %dx,0x113120(,%eax,8)
  100f67:	00 
  100f68:	c1 ea 10             	shr    $0x10,%edx
  100f6b:	88 dd                	mov    %bl,%ch
  100f6d:	66 89 14 c5 26 31 11 	mov    %dx,0x113126(,%eax,8)
  100f74:	00 
  100f75:	66 89 0c c5 24 31 11 	mov    %cx,0x113124(,%eax,8)
  100f7c:	00 
  100f7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f80:	c9                   	leave
  100f81:	c3                   	ret
  100f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100f88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100f8f:	00 

00100f90 <idt_install>:
  100f90:	55                   	push   %ebp
  100f91:	b8 ff 07 00 00       	mov    $0x7ff,%eax
  100f96:	89 e5                	mov    %esp,%ebp
  100f98:	83 ec 08             	sub    $0x8,%esp
  100f9b:	0f b7 15 20 dc 10 00 	movzwl 0x10dc20,%edx
  100fa2:	c7 05 02 31 11 00 20 	movl   $0x113120,0x113102
  100fa9:	31 11 00 
  100fac:	66 a3 00 31 11 00    	mov    %ax,0x113100
  100fb2:	31 c0                	xor    %eax,%eax
  100fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100fb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100fbf:	00 
  100fc0:	31 c9                	xor    %ecx,%ecx
  100fc2:	66 89 14 c5 24 31 11 	mov    %dx,0x113124(,%eax,8)
  100fc9:	00 
  100fca:	c7 04 c5 20 31 11 00 	movl   $0x0,0x113120(,%eax,8)
  100fd1:	00 00 00 00 
  100fd5:	66 89 0c c5 26 31 11 	mov    %cx,0x113126(,%eax,8)
  100fdc:	00 
  100fdd:	83 c0 01             	add    $0x1,%eax
  100fe0:	3d 00 01 00 00       	cmp    $0x100,%eax
  100fe5:	75 d9                	jne    100fc0 <idt_install+0x30>
  100fe7:	e8 84 00 00 00       	call   101070 <isr_install>
  100fec:	e8 1f 06 00 00       	call   101610 <irq_install>
  100ff1:	83 ec 0c             	sub    $0xc,%esp
  100ff4:	68 00 31 11 00       	push   $0x113100
  100ff9:	e8 92 09 00 00       	call   101990 <idt_flush>
  100ffe:	83 c4 10             	add    $0x10,%esp
  101001:	c9                   	leave
  101002:	c3                   	ret
  101003:	66 90                	xchg   %ax,%ax
  101005:	66 90                	xchg   %ax,%ax
  101007:	66 90                	xchg   %ax,%ax
  101009:	66 90                	xchg   %ax,%ax
  10100b:	66 90                	xchg   %ax,%ax
  10100d:	66 90                	xchg   %ax,%ax
  10100f:	66 90                	xchg   %ax,%ax
  101011:	66 90                	xchg   %ax,%ax
  101013:	66 90                	xchg   %ax,%ax
  101015:	66 90                	xchg   %ax,%ax
  101017:	66 90                	xchg   %ax,%ax
  101019:	66 90                	xchg   %ax,%ax
  10101b:	66 90                	xchg   %ax,%ax
  10101d:	66 90                	xchg   %ax,%ax
  10101f:	90                   	nop

00101020 <hex_to_str>:
  101020:	55                   	push   %ebp
  101021:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  101026:	89 e5                	mov    %esp,%ebp
  101028:	56                   	push   %esi
  101029:	89 d6                	mov    %edx,%esi
  10102b:	53                   	push   %ebx
  10102c:	89 c3                	mov    %eax,%ebx
  10102e:	b8 30 78 00 00       	mov    $0x7830,%eax
  101033:	66 89 02             	mov    %ax,(%edx)
  101036:	8d 42 02             	lea    0x2(%edx),%eax
  101039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101040:	89 da                	mov    %ebx,%edx
  101042:	83 c0 01             	add    $0x1,%eax
  101045:	d3 ea                	shr    %cl,%edx
  101047:	83 e9 04             	sub    $0x4,%ecx
  10104a:	83 e2 0f             	and    $0xf,%edx
  10104d:	0f b6 92 6a ba 10 00 	movzbl 0x10ba6a(%edx),%edx
  101054:	88 50 ff             	mov    %dl,-0x1(%eax)
  101057:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  10105a:	75 e4                	jne    101040 <hex_to_str+0x20>
  10105c:	c6 46 0a 00          	movb   $0x0,0xa(%esi)
  101060:	5b                   	pop    %ebx
  101061:	5e                   	pop    %esi
  101062:	5d                   	pop    %ebp
  101063:	c3                   	ret
  101064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101068:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10106f:	00 

00101070 <isr_install>:
  101070:	55                   	push   %ebp
  101071:	89 e5                	mov    %esp,%ebp
  101073:	83 ec 08             	sub    $0x8,%esp
  101076:	68 8e 00 00 00       	push   $0x8e
  10107b:	6a 08                	push   $0x8
  10107d:	68 a0 17 10 00       	push   $0x1017a0
  101082:	6a 00                	push   $0x0
  101084:	e8 b7 fe ff ff       	call   100f40 <idt_set_gate>
  101089:	68 8e 00 00 00       	push   $0x8e
  10108e:	6a 08                	push   $0x8
  101090:	68 aa 17 10 00       	push   $0x1017aa
  101095:	6a 01                	push   $0x1
  101097:	e8 a4 fe ff ff       	call   100f40 <idt_set_gate>
  10109c:	83 c4 20             	add    $0x20,%esp
  10109f:	68 8e 00 00 00       	push   $0x8e
  1010a4:	6a 08                	push   $0x8
  1010a6:	68 b4 17 10 00       	push   $0x1017b4
  1010ab:	6a 02                	push   $0x2
  1010ad:	e8 8e fe ff ff       	call   100f40 <idt_set_gate>
  1010b2:	68 8e 00 00 00       	push   $0x8e
  1010b7:	6a 08                	push   $0x8
  1010b9:	68 be 17 10 00       	push   $0x1017be
  1010be:	6a 03                	push   $0x3
  1010c0:	e8 7b fe ff ff       	call   100f40 <idt_set_gate>
  1010c5:	83 c4 20             	add    $0x20,%esp
  1010c8:	68 8e 00 00 00       	push   $0x8e
  1010cd:	6a 08                	push   $0x8
  1010cf:	68 c8 17 10 00       	push   $0x1017c8
  1010d4:	6a 04                	push   $0x4
  1010d6:	e8 65 fe ff ff       	call   100f40 <idt_set_gate>
  1010db:	68 8e 00 00 00       	push   $0x8e
  1010e0:	6a 08                	push   $0x8
  1010e2:	68 d2 17 10 00       	push   $0x1017d2
  1010e7:	6a 05                	push   $0x5
  1010e9:	e8 52 fe ff ff       	call   100f40 <idt_set_gate>
  1010ee:	83 c4 20             	add    $0x20,%esp
  1010f1:	68 8e 00 00 00       	push   $0x8e
  1010f6:	6a 08                	push   $0x8
  1010f8:	68 dc 17 10 00       	push   $0x1017dc
  1010fd:	6a 06                	push   $0x6
  1010ff:	e8 3c fe ff ff       	call   100f40 <idt_set_gate>
  101104:	68 8e 00 00 00       	push   $0x8e
  101109:	6a 08                	push   $0x8
  10110b:	68 e6 17 10 00       	push   $0x1017e6
  101110:	6a 07                	push   $0x7
  101112:	e8 29 fe ff ff       	call   100f40 <idt_set_gate>
  101117:	83 c4 20             	add    $0x20,%esp
  10111a:	68 8e 00 00 00       	push   $0x8e
  10111f:	6a 08                	push   $0x8
  101121:	68 f0 17 10 00       	push   $0x1017f0
  101126:	6a 08                	push   $0x8
  101128:	e8 13 fe ff ff       	call   100f40 <idt_set_gate>
  10112d:	68 8e 00 00 00       	push   $0x8e
  101132:	6a 08                	push   $0x8
  101134:	68 f8 17 10 00       	push   $0x1017f8
  101139:	6a 09                	push   $0x9
  10113b:	e8 00 fe ff ff       	call   100f40 <idt_set_gate>
  101140:	83 c4 20             	add    $0x20,%esp
  101143:	68 8e 00 00 00       	push   $0x8e
  101148:	6a 08                	push   $0x8
  10114a:	68 02 18 10 00       	push   $0x101802
  10114f:	6a 0a                	push   $0xa
  101151:	e8 ea fd ff ff       	call   100f40 <idt_set_gate>
  101156:	68 8e 00 00 00       	push   $0x8e
  10115b:	6a 08                	push   $0x8
  10115d:	68 0a 18 10 00       	push   $0x10180a
  101162:	6a 0b                	push   $0xb
  101164:	e8 d7 fd ff ff       	call   100f40 <idt_set_gate>
  101169:	83 c4 20             	add    $0x20,%esp
  10116c:	68 8e 00 00 00       	push   $0x8e
  101171:	6a 08                	push   $0x8
  101173:	68 12 18 10 00       	push   $0x101812
  101178:	6a 0c                	push   $0xc
  10117a:	e8 c1 fd ff ff       	call   100f40 <idt_set_gate>
  10117f:	68 8e 00 00 00       	push   $0x8e
  101184:	6a 08                	push   $0x8
  101186:	68 1a 18 10 00       	push   $0x10181a
  10118b:	6a 0d                	push   $0xd
  10118d:	e8 ae fd ff ff       	call   100f40 <idt_set_gate>
  101192:	83 c4 20             	add    $0x20,%esp
  101195:	68 8e 00 00 00       	push   $0x8e
  10119a:	6a 08                	push   $0x8
  10119c:	68 22 18 10 00       	push   $0x101822
  1011a1:	6a 0e                	push   $0xe
  1011a3:	e8 98 fd ff ff       	call   100f40 <idt_set_gate>
  1011a8:	68 8e 00 00 00       	push   $0x8e
  1011ad:	6a 08                	push   $0x8
  1011af:	68 2a 18 10 00       	push   $0x10182a
  1011b4:	6a 0f                	push   $0xf
  1011b6:	e8 85 fd ff ff       	call   100f40 <idt_set_gate>
  1011bb:	83 c4 20             	add    $0x20,%esp
  1011be:	68 8e 00 00 00       	push   $0x8e
  1011c3:	6a 08                	push   $0x8
  1011c5:	68 34 18 10 00       	push   $0x101834
  1011ca:	6a 10                	push   $0x10
  1011cc:	e8 6f fd ff ff       	call   100f40 <idt_set_gate>
  1011d1:	68 8e 00 00 00       	push   $0x8e
  1011d6:	6a 08                	push   $0x8
  1011d8:	68 3e 18 10 00       	push   $0x10183e
  1011dd:	6a 11                	push   $0x11
  1011df:	e8 5c fd ff ff       	call   100f40 <idt_set_gate>
  1011e4:	83 c4 20             	add    $0x20,%esp
  1011e7:	68 8e 00 00 00       	push   $0x8e
  1011ec:	6a 08                	push   $0x8
  1011ee:	68 48 18 10 00       	push   $0x101848
  1011f3:	6a 12                	push   $0x12
  1011f5:	e8 46 fd ff ff       	call   100f40 <idt_set_gate>
  1011fa:	68 8e 00 00 00       	push   $0x8e
  1011ff:	6a 08                	push   $0x8
  101201:	68 52 18 10 00       	push   $0x101852
  101206:	6a 13                	push   $0x13
  101208:	e8 33 fd ff ff       	call   100f40 <idt_set_gate>
  10120d:	83 c4 20             	add    $0x20,%esp
  101210:	68 8e 00 00 00       	push   $0x8e
  101215:	6a 08                	push   $0x8
  101217:	68 5c 18 10 00       	push   $0x10185c
  10121c:	6a 14                	push   $0x14
  10121e:	e8 1d fd ff ff       	call   100f40 <idt_set_gate>
  101223:	68 8e 00 00 00       	push   $0x8e
  101228:	6a 08                	push   $0x8
  10122a:	68 66 18 10 00       	push   $0x101866
  10122f:	6a 15                	push   $0x15
  101231:	e8 0a fd ff ff       	call   100f40 <idt_set_gate>
  101236:	83 c4 20             	add    $0x20,%esp
  101239:	68 8e 00 00 00       	push   $0x8e
  10123e:	6a 08                	push   $0x8
  101240:	68 70 18 10 00       	push   $0x101870
  101245:	6a 16                	push   $0x16
  101247:	e8 f4 fc ff ff       	call   100f40 <idt_set_gate>
  10124c:	68 8e 00 00 00       	push   $0x8e
  101251:	6a 08                	push   $0x8
  101253:	68 7a 18 10 00       	push   $0x10187a
  101258:	6a 17                	push   $0x17
  10125a:	e8 e1 fc ff ff       	call   100f40 <idt_set_gate>
  10125f:	83 c4 20             	add    $0x20,%esp
  101262:	68 8e 00 00 00       	push   $0x8e
  101267:	6a 08                	push   $0x8
  101269:	68 84 18 10 00       	push   $0x101884
  10126e:	6a 18                	push   $0x18
  101270:	e8 cb fc ff ff       	call   100f40 <idt_set_gate>
  101275:	68 8e 00 00 00       	push   $0x8e
  10127a:	6a 08                	push   $0x8
  10127c:	68 8e 18 10 00       	push   $0x10188e
  101281:	6a 19                	push   $0x19
  101283:	e8 b8 fc ff ff       	call   100f40 <idt_set_gate>
  101288:	83 c4 20             	add    $0x20,%esp
  10128b:	68 8e 00 00 00       	push   $0x8e
  101290:	6a 08                	push   $0x8
  101292:	68 98 18 10 00       	push   $0x101898
  101297:	6a 1a                	push   $0x1a
  101299:	e8 a2 fc ff ff       	call   100f40 <idt_set_gate>
  10129e:	68 8e 00 00 00       	push   $0x8e
  1012a3:	6a 08                	push   $0x8
  1012a5:	68 a2 18 10 00       	push   $0x1018a2
  1012aa:	6a 1b                	push   $0x1b
  1012ac:	e8 8f fc ff ff       	call   100f40 <idt_set_gate>
  1012b1:	83 c4 20             	add    $0x20,%esp
  1012b4:	68 8e 00 00 00       	push   $0x8e
  1012b9:	6a 08                	push   $0x8
  1012bb:	68 ac 18 10 00       	push   $0x1018ac
  1012c0:	6a 1c                	push   $0x1c
  1012c2:	e8 79 fc ff ff       	call   100f40 <idt_set_gate>
  1012c7:	68 8e 00 00 00       	push   $0x8e
  1012cc:	6a 08                	push   $0x8
  1012ce:	68 b6 18 10 00       	push   $0x1018b6
  1012d3:	6a 1d                	push   $0x1d
  1012d5:	e8 66 fc ff ff       	call   100f40 <idt_set_gate>
  1012da:	83 c4 20             	add    $0x20,%esp
  1012dd:	68 8e 00 00 00       	push   $0x8e
  1012e2:	6a 08                	push   $0x8
  1012e4:	68 c0 18 10 00       	push   $0x1018c0
  1012e9:	6a 1e                	push   $0x1e
  1012eb:	e8 50 fc ff ff       	call   100f40 <idt_set_gate>
  1012f0:	68 8e 00 00 00       	push   $0x8e
  1012f5:	6a 08                	push   $0x8
  1012f7:	68 c7 18 10 00       	push   $0x1018c7
  1012fc:	6a 1f                	push   $0x1f
  1012fe:	e8 3d fc ff ff       	call   100f40 <idt_set_gate>
  101303:	83 c4 20             	add    $0x20,%esp
  101306:	c9                   	leave
  101307:	c3                   	ret
  101308:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10130f:	00 

00101310 <isr_handler>:
  101310:	55                   	push   %ebp
  101311:	89 e5                	mov    %esp,%ebp
  101313:	57                   	push   %edi
  101314:	56                   	push   %esi
  101315:	53                   	push   %ebx
  101316:	8d 5d a8             	lea    -0x58(%ebp),%ebx
  101319:	83 ec 58             	sub    $0x58,%esp
  10131c:	8b 75 2c             	mov    0x2c(%ebp),%esi
  10131f:	8b 7d 30             	mov    0x30(%ebp),%edi
  101322:	68 7b ba 10 00       	push   $0x10ba7b
  101327:	e8 e4 f8 ff ff       	call   100c10 <terminal_writestring>
  10132c:	c7 04 24 96 ba 10 00 	movl   $0x10ba96,(%esp)
  101333:	e8 d8 f8 ff ff       	call   100c10 <terminal_writestring>
  101338:	58                   	pop    %eax
  101339:	ff 34 b5 00 b0 10 00 	push   0x10b000(,%esi,4)
  101340:	e8 cb f8 ff ff       	call   100c10 <terminal_writestring>
  101345:	c7 04 24 a2 ba 10 00 	movl   $0x10baa2,(%esp)
  10134c:	e8 bf f8 ff ff       	call   100c10 <terminal_writestring>
  101351:	89 da                	mov    %ebx,%edx
  101353:	89 f0                	mov    %esi,%eax
  101355:	e8 c6 fc ff ff       	call   101020 <hex_to_str>
  10135a:	89 1c 24             	mov    %ebx,(%esp)
  10135d:	e8 ae f8 ff ff       	call   100c10 <terminal_writestring>
  101362:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  101369:	e8 a2 f8 ff ff       	call   100c10 <terminal_writestring>
  10136e:	c7 04 24 a6 ba 10 00 	movl   $0x10baa6,(%esp)
  101375:	e8 96 f8 ff ff       	call   100c10 <terminal_writestring>
  10137a:	89 da                	mov    %ebx,%edx
  10137c:	89 f8                	mov    %edi,%eax
  10137e:	e8 9d fc ff ff       	call   101020 <hex_to_str>
  101383:	89 1c 24             	mov    %ebx,(%esp)
  101386:	e8 85 f8 ff ff       	call   100c10 <terminal_writestring>
  10138b:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  101392:	e8 79 f8 ff ff       	call   100c10 <terminal_writestring>
  101397:	c7 04 24 b3 ba 10 00 	movl   $0x10bab3,(%esp)
  10139e:	e8 6d f8 ff ff       	call   100c10 <terminal_writestring>
  1013a3:	8b 45 28             	mov    0x28(%ebp),%eax
  1013a6:	89 da                	mov    %ebx,%edx
  1013a8:	e8 73 fc ff ff       	call   101020 <hex_to_str>
  1013ad:	89 1c 24             	mov    %ebx,(%esp)
  1013b0:	e8 5b f8 ff ff       	call   100c10 <terminal_writestring>
  1013b5:	c7 04 24 bb ba 10 00 	movl   $0x10babb,(%esp)
  1013bc:	e8 4f f8 ff ff       	call   100c10 <terminal_writestring>
  1013c1:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1013c4:	89 da                	mov    %ebx,%edx
  1013c6:	e8 55 fc ff ff       	call   101020 <hex_to_str>
  1013cb:	89 1c 24             	mov    %ebx,(%esp)
  1013ce:	e8 3d f8 ff ff       	call   100c10 <terminal_writestring>
  1013d3:	c7 04 24 c3 ba 10 00 	movl   $0x10bac3,(%esp)
  1013da:	e8 31 f8 ff ff       	call   100c10 <terminal_writestring>
  1013df:	8b 45 24             	mov    0x24(%ebp),%eax
  1013e2:	89 da                	mov    %ebx,%edx
  1013e4:	e8 37 fc ff ff       	call   101020 <hex_to_str>
  1013e9:	89 1c 24             	mov    %ebx,(%esp)
  1013ec:	e8 1f f8 ff ff       	call   100c10 <terminal_writestring>
  1013f1:	c7 04 24 cb ba 10 00 	movl   $0x10bacb,(%esp)
  1013f8:	e8 13 f8 ff ff       	call   100c10 <terminal_writestring>
  1013fd:	8b 45 20             	mov    0x20(%ebp),%eax
  101400:	89 da                	mov    %ebx,%edx
  101402:	e8 19 fc ff ff       	call   101020 <hex_to_str>
  101407:	89 1c 24             	mov    %ebx,(%esp)
  10140a:	e8 01 f8 ff ff       	call   100c10 <terminal_writestring>
  10140f:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  101416:	e8 f5 f7 ff ff       	call   100c10 <terminal_writestring>
  10141b:	c7 04 24 d3 ba 10 00 	movl   $0x10bad3,(%esp)
  101422:	e8 e9 f7 ff ff       	call   100c10 <terminal_writestring>
  101427:	8b 45 10             	mov    0x10(%ebp),%eax
  10142a:	89 da                	mov    %ebx,%edx
  10142c:	e8 ef fb ff ff       	call   101020 <hex_to_str>
  101431:	89 1c 24             	mov    %ebx,(%esp)
  101434:	e8 d7 f7 ff ff       	call   100c10 <terminal_writestring>
  101439:	c7 04 24 db ba 10 00 	movl   $0x10badb,(%esp)
  101440:	e8 cb f7 ff ff       	call   100c10 <terminal_writestring>
  101445:	8b 45 0c             	mov    0xc(%ebp),%eax
  101448:	89 da                	mov    %ebx,%edx
  10144a:	e8 d1 fb ff ff       	call   101020 <hex_to_str>
  10144f:	89 1c 24             	mov    %ebx,(%esp)
  101452:	e8 b9 f7 ff ff       	call   100c10 <terminal_writestring>
  101457:	c7 04 24 e3 ba 10 00 	movl   $0x10bae3,(%esp)
  10145e:	e8 ad f7 ff ff       	call   100c10 <terminal_writestring>
  101463:	8b 45 14             	mov    0x14(%ebp),%eax
  101466:	89 da                	mov    %ebx,%edx
  101468:	e8 b3 fb ff ff       	call   101020 <hex_to_str>
  10146d:	89 1c 24             	mov    %ebx,(%esp)
  101470:	e8 9b f7 ff ff       	call   100c10 <terminal_writestring>
  101475:	c7 04 24 eb ba 10 00 	movl   $0x10baeb,(%esp)
  10147c:	e8 8f f7 ff ff       	call   100c10 <terminal_writestring>
  101481:	8b 45 18             	mov    0x18(%ebp),%eax
  101484:	89 da                	mov    %ebx,%edx
  101486:	e8 95 fb ff ff       	call   101020 <hex_to_str>
  10148b:	89 1c 24             	mov    %ebx,(%esp)
  10148e:	e8 7d f7 ff ff       	call   100c10 <terminal_writestring>
  101493:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10149a:	e8 71 f7 ff ff       	call   100c10 <terminal_writestring>
  10149f:	c7 04 24 f3 ba 10 00 	movl   $0x10baf3,(%esp)
  1014a6:	e8 65 f7 ff ff       	call   100c10 <terminal_writestring>
  1014ab:	8b 45 34             	mov    0x34(%ebp),%eax
  1014ae:	89 da                	mov    %ebx,%edx
  1014b0:	e8 6b fb ff ff       	call   101020 <hex_to_str>
  1014b5:	89 1c 24             	mov    %ebx,(%esp)
  1014b8:	e8 53 f7 ff ff       	call   100c10 <terminal_writestring>
  1014bd:	c7 04 24 fb ba 10 00 	movl   $0x10bafb,(%esp)
  1014c4:	e8 47 f7 ff ff       	call   100c10 <terminal_writestring>
  1014c9:	8b 45 38             	mov    0x38(%ebp),%eax
  1014cc:	89 da                	mov    %ebx,%edx
  1014ce:	e8 4d fb ff ff       	call   101020 <hex_to_str>
  1014d3:	89 1c 24             	mov    %ebx,(%esp)
  1014d6:	e8 35 f7 ff ff       	call   100c10 <terminal_writestring>
  1014db:	c7 04 24 02 bb 10 00 	movl   $0x10bb02,(%esp)
  1014e2:	e8 29 f7 ff ff       	call   100c10 <terminal_writestring>
  1014e7:	8b 45 3c             	mov    0x3c(%ebp),%eax
  1014ea:	89 da                	mov    %ebx,%edx
  1014ec:	e8 2f fb ff ff       	call   101020 <hex_to_str>
  1014f1:	89 1c 24             	mov    %ebx,(%esp)
  1014f4:	e8 17 f7 ff ff       	call   100c10 <terminal_writestring>
  1014f9:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  101500:	e8 0b f7 ff ff       	call   100c10 <terminal_writestring>
  101505:	83 c4 10             	add    $0x10,%esp
  101508:	83 fe 0e             	cmp    $0xe,%esi
  10150b:	74 16                	je     101523 <isr_handler+0x213>
  10150d:	83 ec 0c             	sub    $0xc,%esp
  101510:	68 a9 bb 10 00       	push   $0x10bba9
  101515:	e8 f6 f6 ff ff       	call   100c10 <terminal_writestring>
  10151a:	83 c4 10             	add    $0x10,%esp
  10151d:	8d 76 00             	lea    0x0(%esi),%esi
  101520:	f4                   	hlt
  101521:	eb fd                	jmp    101520 <isr_handler+0x210>
  101523:	0f 20 d6             	mov    %cr2,%esi
  101526:	83 ec 0c             	sub    $0xc,%esp
  101529:	68 0d bb 10 00       	push   $0x10bb0d
  10152e:	e8 dd f6 ff ff       	call   100c10 <terminal_writestring>
  101533:	89 da                	mov    %ebx,%edx
  101535:	89 f0                	mov    %esi,%eax
  101537:	e8 e4 fa ff ff       	call   101020 <hex_to_str>
  10153c:	89 1c 24             	mov    %ebx,(%esp)
  10153f:	e8 cc f6 ff ff       	call   100c10 <terminal_writestring>
  101544:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10154b:	e8 c0 f6 ff ff       	call   100c10 <terminal_writestring>
  101550:	c7 04 24 20 bb 10 00 	movl   $0x10bb20,(%esp)
  101557:	e8 b4 f6 ff ff       	call   100c10 <terminal_writestring>
  10155c:	83 c4 10             	add    $0x10,%esp
  10155f:	f7 c7 01 00 00 00    	test   $0x1,%edi
  101565:	75 42                	jne    1015a9 <isr_handler+0x299>
  101567:	83 ec 0c             	sub    $0xc,%esp
  10156a:	68 4c bb 10 00       	push   $0x10bb4c
  10156f:	e8 9c f6 ff ff       	call   100c10 <terminal_writestring>
  101574:	83 c4 10             	add    $0x10,%esp
  101577:	f7 c7 02 00 00 00    	test   $0x2,%edi
  10157d:	74 51                	je     1015d0 <isr_handler+0x2c0>
  10157f:	83 ec 0c             	sub    $0xc,%esp
  101582:	68 62 bb 10 00       	push   $0x10bb62
  101587:	e8 84 f6 ff ff       	call   100c10 <terminal_writestring>
  10158c:	83 c4 10             	add    $0x10,%esp
  10158f:	83 e7 04             	and    $0x4,%edi
  101592:	74 27                	je     1015bb <isr_handler+0x2ab>
  101594:	83 ec 0c             	sub    $0xc,%esp
  101597:	68 85 bb 10 00       	push   $0x10bb85
  10159c:	e8 6f f6 ff ff       	call   100c10 <terminal_writestring>
  1015a1:	83 c4 10             	add    $0x10,%esp
  1015a4:	e9 64 ff ff ff       	jmp    10150d <isr_handler+0x1fd>
  1015a9:	83 ec 0c             	sub    $0xc,%esp
  1015ac:	68 32 bb 10 00       	push   $0x10bb32
  1015b1:	e8 5a f6 ff ff       	call   100c10 <terminal_writestring>
  1015b6:	83 c4 10             	add    $0x10,%esp
  1015b9:	eb bc                	jmp    101577 <isr_handler+0x267>
  1015bb:	83 ec 0c             	sub    $0xc,%esp
  1015be:	68 94 bb 10 00       	push   $0x10bb94
  1015c3:	e8 48 f6 ff ff       	call   100c10 <terminal_writestring>
  1015c8:	83 c4 10             	add    $0x10,%esp
  1015cb:	e9 3d ff ff ff       	jmp    10150d <isr_handler+0x1fd>
  1015d0:	83 ec 0c             	sub    $0xc,%esp
  1015d3:	68 74 bb 10 00       	push   $0x10bb74
  1015d8:	e8 33 f6 ff ff       	call   100c10 <terminal_writestring>
  1015dd:	83 c4 10             	add    $0x10,%esp
  1015e0:	eb ad                	jmp    10158f <isr_handler+0x27f>
  1015e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1015e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1015ef:	00 

001015f0 <register_interrupt_handler>:
  1015f0:	55                   	push   %ebp
  1015f1:	89 e5                	mov    %esp,%ebp
  1015f3:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  1015f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1015fa:	89 14 85 20 39 11 00 	mov    %edx,0x113920(,%eax,4)
  101601:	5d                   	pop    %ebp
  101602:	c3                   	ret
  101603:	66 90                	xchg   %ax,%ax
  101605:	66 90                	xchg   %ax,%ax
  101607:	66 90                	xchg   %ax,%ax
  101609:	66 90                	xchg   %ax,%ax
  10160b:	66 90                	xchg   %ax,%ax
  10160d:	66 90                	xchg   %ax,%ax
  10160f:	90                   	nop

00101610 <irq_install>:
  101610:	55                   	push   %ebp
  101611:	89 e5                	mov    %esp,%ebp
  101613:	83 ec 08             	sub    $0x8,%esp
  101616:	68 8e 00 00 00       	push   $0x8e
  10161b:	6a 08                	push   $0x8
  10161d:	68 ce 18 10 00       	push   $0x1018ce
  101622:	6a 20                	push   $0x20
  101624:	e8 17 f9 ff ff       	call   100f40 <idt_set_gate>
  101629:	68 8e 00 00 00       	push   $0x8e
  10162e:	6a 08                	push   $0x8
  101630:	68 d8 18 10 00       	push   $0x1018d8
  101635:	6a 21                	push   $0x21
  101637:	e8 04 f9 ff ff       	call   100f40 <idt_set_gate>
  10163c:	83 c4 20             	add    $0x20,%esp
  10163f:	68 8e 00 00 00       	push   $0x8e
  101644:	6a 08                	push   $0x8
  101646:	68 e2 18 10 00       	push   $0x1018e2
  10164b:	6a 22                	push   $0x22
  10164d:	e8 ee f8 ff ff       	call   100f40 <idt_set_gate>
  101652:	68 8e 00 00 00       	push   $0x8e
  101657:	6a 08                	push   $0x8
  101659:	68 e9 18 10 00       	push   $0x1018e9
  10165e:	6a 23                	push   $0x23
  101660:	e8 db f8 ff ff       	call   100f40 <idt_set_gate>
  101665:	83 c4 20             	add    $0x20,%esp
  101668:	68 8e 00 00 00       	push   $0x8e
  10166d:	6a 08                	push   $0x8
  10166f:	68 f0 18 10 00       	push   $0x1018f0
  101674:	6a 24                	push   $0x24
  101676:	e8 c5 f8 ff ff       	call   100f40 <idt_set_gate>
  10167b:	68 8e 00 00 00       	push   $0x8e
  101680:	6a 08                	push   $0x8
  101682:	68 f7 18 10 00       	push   $0x1018f7
  101687:	6a 25                	push   $0x25
  101689:	e8 b2 f8 ff ff       	call   100f40 <idt_set_gate>
  10168e:	83 c4 20             	add    $0x20,%esp
  101691:	68 8e 00 00 00       	push   $0x8e
  101696:	6a 08                	push   $0x8
  101698:	68 fe 18 10 00       	push   $0x1018fe
  10169d:	6a 26                	push   $0x26
  10169f:	e8 9c f8 ff ff       	call   100f40 <idt_set_gate>
  1016a4:	68 8e 00 00 00       	push   $0x8e
  1016a9:	6a 08                	push   $0x8
  1016ab:	68 05 19 10 00       	push   $0x101905
  1016b0:	6a 27                	push   $0x27
  1016b2:	e8 89 f8 ff ff       	call   100f40 <idt_set_gate>
  1016b7:	83 c4 20             	add    $0x20,%esp
  1016ba:	68 8e 00 00 00       	push   $0x8e
  1016bf:	6a 08                	push   $0x8
  1016c1:	68 0c 19 10 00       	push   $0x10190c
  1016c6:	6a 28                	push   $0x28
  1016c8:	e8 73 f8 ff ff       	call   100f40 <idt_set_gate>
  1016cd:	68 8e 00 00 00       	push   $0x8e
  1016d2:	6a 08                	push   $0x8
  1016d4:	68 13 19 10 00       	push   $0x101913
  1016d9:	6a 29                	push   $0x29
  1016db:	e8 60 f8 ff ff       	call   100f40 <idt_set_gate>
  1016e0:	83 c4 20             	add    $0x20,%esp
  1016e3:	68 8e 00 00 00       	push   $0x8e
  1016e8:	6a 08                	push   $0x8
  1016ea:	68 1a 19 10 00       	push   $0x10191a
  1016ef:	6a 2a                	push   $0x2a
  1016f1:	e8 4a f8 ff ff       	call   100f40 <idt_set_gate>
  1016f6:	68 8e 00 00 00       	push   $0x8e
  1016fb:	6a 08                	push   $0x8
  1016fd:	68 21 19 10 00       	push   $0x101921
  101702:	6a 2b                	push   $0x2b
  101704:	e8 37 f8 ff ff       	call   100f40 <idt_set_gate>
  101709:	83 c4 20             	add    $0x20,%esp
  10170c:	68 8e 00 00 00       	push   $0x8e
  101711:	6a 08                	push   $0x8
  101713:	68 28 19 10 00       	push   $0x101928
  101718:	6a 2c                	push   $0x2c
  10171a:	e8 21 f8 ff ff       	call   100f40 <idt_set_gate>
  10171f:	68 8e 00 00 00       	push   $0x8e
  101724:	6a 08                	push   $0x8
  101726:	68 2f 19 10 00       	push   $0x10192f
  10172b:	6a 2d                	push   $0x2d
  10172d:	e8 0e f8 ff ff       	call   100f40 <idt_set_gate>
  101732:	83 c4 20             	add    $0x20,%esp
  101735:	68 8e 00 00 00       	push   $0x8e
  10173a:	6a 08                	push   $0x8
  10173c:	68 36 19 10 00       	push   $0x101936
  101741:	6a 2e                	push   $0x2e
  101743:	e8 f8 f7 ff ff       	call   100f40 <idt_set_gate>
  101748:	68 8e 00 00 00       	push   $0x8e
  10174d:	6a 08                	push   $0x8
  10174f:	68 3d 19 10 00       	push   $0x10193d
  101754:	6a 2f                	push   $0x2f
  101756:	e8 e5 f7 ff ff       	call   100f40 <idt_set_gate>
  10175b:	83 c4 20             	add    $0x20,%esp
  10175e:	c9                   	leave
  10175f:	c3                   	ret

00101760 <irq_handler>:
  101760:	55                   	push   %ebp
  101761:	89 e5                	mov    %esp,%ebp
  101763:	83 ec 08             	sub    $0x8,%esp
  101766:	8b 55 2c             	mov    0x2c(%ebp),%edx
  101769:	83 fa 27             	cmp    $0x27,%edx
  10176c:	76 07                	jbe    101775 <irq_handler+0x15>
  10176e:	b8 20 00 00 00       	mov    $0x20,%eax
  101773:	e6 a0                	out    %al,$0xa0
  101775:	b8 20 00 00 00       	mov    $0x20,%eax
  10177a:	e6 20                	out    %al,$0x20
  10177c:	8b 04 95 20 39 11 00 	mov    0x113920(,%edx,4),%eax
  101783:	85 c0                	test   %eax,%eax
  101785:	74 0c                	je     101793 <irq_handler+0x33>
  101787:	83 ec 0c             	sub    $0xc,%esp
  10178a:	8d 55 08             	lea    0x8(%ebp),%edx
  10178d:	52                   	push   %edx
  10178e:	ff d0                	call   *%eax
  101790:	83 c4 10             	add    $0x10,%esp
  101793:	c9                   	leave
  101794:	c3                   	ret
  101795:	66 90                	xchg   %ax,%ax
  101797:	66 90                	xchg   %ax,%ax
  101799:	66 90                	xchg   %ax,%ax
  10179b:	66 90                	xchg   %ax,%ax
  10179d:	66 90                	xchg   %ax,%ax
  10179f:	90                   	nop

001017a0 <isr0>:
  1017a0:	fa                   	cli
  1017a1:	6a 00                	push   $0x0
  1017a3:	6a 00                	push   $0x0
  1017a5:	e9 9a 01 00 00       	jmp    101944 <isr_common_stub>

001017aa <isr1>:
  1017aa:	fa                   	cli
  1017ab:	6a 00                	push   $0x0
  1017ad:	6a 01                	push   $0x1
  1017af:	e9 90 01 00 00       	jmp    101944 <isr_common_stub>

001017b4 <isr2>:
  1017b4:	fa                   	cli
  1017b5:	6a 00                	push   $0x0
  1017b7:	6a 02                	push   $0x2
  1017b9:	e9 86 01 00 00       	jmp    101944 <isr_common_stub>

001017be <isr3>:
  1017be:	fa                   	cli
  1017bf:	6a 00                	push   $0x0
  1017c1:	6a 03                	push   $0x3
  1017c3:	e9 7c 01 00 00       	jmp    101944 <isr_common_stub>

001017c8 <isr4>:
  1017c8:	fa                   	cli
  1017c9:	6a 00                	push   $0x0
  1017cb:	6a 04                	push   $0x4
  1017cd:	e9 72 01 00 00       	jmp    101944 <isr_common_stub>

001017d2 <isr5>:
  1017d2:	fa                   	cli
  1017d3:	6a 00                	push   $0x0
  1017d5:	6a 05                	push   $0x5
  1017d7:	e9 68 01 00 00       	jmp    101944 <isr_common_stub>

001017dc <isr6>:
  1017dc:	fa                   	cli
  1017dd:	6a 00                	push   $0x0
  1017df:	6a 06                	push   $0x6
  1017e1:	e9 5e 01 00 00       	jmp    101944 <isr_common_stub>

001017e6 <isr7>:
  1017e6:	fa                   	cli
  1017e7:	6a 00                	push   $0x0
  1017e9:	6a 07                	push   $0x7
  1017eb:	e9 54 01 00 00       	jmp    101944 <isr_common_stub>

001017f0 <isr8>:
  1017f0:	fa                   	cli
  1017f1:	6a 08                	push   $0x8
  1017f3:	e9 4c 01 00 00       	jmp    101944 <isr_common_stub>

001017f8 <isr9>:
  1017f8:	fa                   	cli
  1017f9:	6a 00                	push   $0x0
  1017fb:	6a 09                	push   $0x9
  1017fd:	e9 42 01 00 00       	jmp    101944 <isr_common_stub>

00101802 <isr10>:
  101802:	fa                   	cli
  101803:	6a 0a                	push   $0xa
  101805:	e9 3a 01 00 00       	jmp    101944 <isr_common_stub>

0010180a <isr11>:
  10180a:	fa                   	cli
  10180b:	6a 0b                	push   $0xb
  10180d:	e9 32 01 00 00       	jmp    101944 <isr_common_stub>

00101812 <isr12>:
  101812:	fa                   	cli
  101813:	6a 0c                	push   $0xc
  101815:	e9 2a 01 00 00       	jmp    101944 <isr_common_stub>

0010181a <isr13>:
  10181a:	fa                   	cli
  10181b:	6a 0d                	push   $0xd
  10181d:	e9 22 01 00 00       	jmp    101944 <isr_common_stub>

00101822 <isr14>:
  101822:	fa                   	cli
  101823:	6a 0e                	push   $0xe
  101825:	e9 1a 01 00 00       	jmp    101944 <isr_common_stub>

0010182a <isr15>:
  10182a:	fa                   	cli
  10182b:	6a 00                	push   $0x0
  10182d:	6a 0f                	push   $0xf
  10182f:	e9 10 01 00 00       	jmp    101944 <isr_common_stub>

00101834 <isr16>:
  101834:	fa                   	cli
  101835:	6a 00                	push   $0x0
  101837:	6a 10                	push   $0x10
  101839:	e9 06 01 00 00       	jmp    101944 <isr_common_stub>

0010183e <isr17>:
  10183e:	fa                   	cli
  10183f:	6a 00                	push   $0x0
  101841:	6a 11                	push   $0x11
  101843:	e9 fc 00 00 00       	jmp    101944 <isr_common_stub>

00101848 <isr18>:
  101848:	fa                   	cli
  101849:	6a 00                	push   $0x0
  10184b:	6a 12                	push   $0x12
  10184d:	e9 f2 00 00 00       	jmp    101944 <isr_common_stub>

00101852 <isr19>:
  101852:	fa                   	cli
  101853:	6a 00                	push   $0x0
  101855:	6a 13                	push   $0x13
  101857:	e9 e8 00 00 00       	jmp    101944 <isr_common_stub>

0010185c <isr20>:
  10185c:	fa                   	cli
  10185d:	6a 00                	push   $0x0
  10185f:	6a 14                	push   $0x14
  101861:	e9 de 00 00 00       	jmp    101944 <isr_common_stub>

00101866 <isr21>:
  101866:	fa                   	cli
  101867:	6a 00                	push   $0x0
  101869:	6a 15                	push   $0x15
  10186b:	e9 d4 00 00 00       	jmp    101944 <isr_common_stub>

00101870 <isr22>:
  101870:	fa                   	cli
  101871:	6a 00                	push   $0x0
  101873:	6a 16                	push   $0x16
  101875:	e9 ca 00 00 00       	jmp    101944 <isr_common_stub>

0010187a <isr23>:
  10187a:	fa                   	cli
  10187b:	6a 00                	push   $0x0
  10187d:	6a 17                	push   $0x17
  10187f:	e9 c0 00 00 00       	jmp    101944 <isr_common_stub>

00101884 <isr24>:
  101884:	fa                   	cli
  101885:	6a 00                	push   $0x0
  101887:	6a 18                	push   $0x18
  101889:	e9 b6 00 00 00       	jmp    101944 <isr_common_stub>

0010188e <isr25>:
  10188e:	fa                   	cli
  10188f:	6a 00                	push   $0x0
  101891:	6a 19                	push   $0x19
  101893:	e9 ac 00 00 00       	jmp    101944 <isr_common_stub>

00101898 <isr26>:
  101898:	fa                   	cli
  101899:	6a 00                	push   $0x0
  10189b:	6a 1a                	push   $0x1a
  10189d:	e9 a2 00 00 00       	jmp    101944 <isr_common_stub>

001018a2 <isr27>:
  1018a2:	fa                   	cli
  1018a3:	6a 00                	push   $0x0
  1018a5:	6a 1b                	push   $0x1b
  1018a7:	e9 98 00 00 00       	jmp    101944 <isr_common_stub>

001018ac <isr28>:
  1018ac:	fa                   	cli
  1018ad:	6a 00                	push   $0x0
  1018af:	6a 1c                	push   $0x1c
  1018b1:	e9 8e 00 00 00       	jmp    101944 <isr_common_stub>

001018b6 <isr29>:
  1018b6:	fa                   	cli
  1018b7:	6a 00                	push   $0x0
  1018b9:	6a 1d                	push   $0x1d
  1018bb:	e9 84 00 00 00       	jmp    101944 <isr_common_stub>

001018c0 <isr30>:
  1018c0:	fa                   	cli
  1018c1:	6a 00                	push   $0x0
  1018c3:	6a 1e                	push   $0x1e
  1018c5:	eb 7d                	jmp    101944 <isr_common_stub>

001018c7 <isr31>:
  1018c7:	fa                   	cli
  1018c8:	6a 00                	push   $0x0
  1018ca:	6a 1f                	push   $0x1f
  1018cc:	eb 76                	jmp    101944 <isr_common_stub>

001018ce <irq0>:
  1018ce:	fa                   	cli
  1018cf:	6a 00                	push   $0x0
  1018d1:	6a 20                	push   $0x20
  1018d3:	e9 90 00 00 00       	jmp    101968 <irq_common_stub>

001018d8 <irq1>:
  1018d8:	fa                   	cli
  1018d9:	6a 00                	push   $0x0
  1018db:	6a 21                	push   $0x21
  1018dd:	e9 86 00 00 00       	jmp    101968 <irq_common_stub>

001018e2 <irq2>:
  1018e2:	fa                   	cli
  1018e3:	6a 00                	push   $0x0
  1018e5:	6a 22                	push   $0x22
  1018e7:	eb 7f                	jmp    101968 <irq_common_stub>

001018e9 <irq3>:
  1018e9:	fa                   	cli
  1018ea:	6a 00                	push   $0x0
  1018ec:	6a 23                	push   $0x23
  1018ee:	eb 78                	jmp    101968 <irq_common_stub>

001018f0 <irq4>:
  1018f0:	fa                   	cli
  1018f1:	6a 00                	push   $0x0
  1018f3:	6a 24                	push   $0x24
  1018f5:	eb 71                	jmp    101968 <irq_common_stub>

001018f7 <irq5>:
  1018f7:	fa                   	cli
  1018f8:	6a 00                	push   $0x0
  1018fa:	6a 25                	push   $0x25
  1018fc:	eb 6a                	jmp    101968 <irq_common_stub>

001018fe <irq6>:
  1018fe:	fa                   	cli
  1018ff:	6a 00                	push   $0x0
  101901:	6a 26                	push   $0x26
  101903:	eb 63                	jmp    101968 <irq_common_stub>

00101905 <irq7>:
  101905:	fa                   	cli
  101906:	6a 00                	push   $0x0
  101908:	6a 27                	push   $0x27
  10190a:	eb 5c                	jmp    101968 <irq_common_stub>

0010190c <irq8>:
  10190c:	fa                   	cli
  10190d:	6a 00                	push   $0x0
  10190f:	6a 28                	push   $0x28
  101911:	eb 55                	jmp    101968 <irq_common_stub>

00101913 <irq9>:
  101913:	fa                   	cli
  101914:	6a 00                	push   $0x0
  101916:	6a 29                	push   $0x29
  101918:	eb 4e                	jmp    101968 <irq_common_stub>

0010191a <irq10>:
  10191a:	fa                   	cli
  10191b:	6a 00                	push   $0x0
  10191d:	6a 2a                	push   $0x2a
  10191f:	eb 47                	jmp    101968 <irq_common_stub>

00101921 <irq11>:
  101921:	fa                   	cli
  101922:	6a 00                	push   $0x0
  101924:	6a 2b                	push   $0x2b
  101926:	eb 40                	jmp    101968 <irq_common_stub>

00101928 <irq12>:
  101928:	fa                   	cli
  101929:	6a 00                	push   $0x0
  10192b:	6a 2c                	push   $0x2c
  10192d:	eb 39                	jmp    101968 <irq_common_stub>

0010192f <irq13>:
  10192f:	fa                   	cli
  101930:	6a 00                	push   $0x0
  101932:	6a 2d                	push   $0x2d
  101934:	eb 32                	jmp    101968 <irq_common_stub>

00101936 <irq14>:
  101936:	fa                   	cli
  101937:	6a 00                	push   $0x0
  101939:	6a 2e                	push   $0x2e
  10193b:	eb 2b                	jmp    101968 <irq_common_stub>

0010193d <irq15>:
  10193d:	fa                   	cli
  10193e:	6a 00                	push   $0x0
  101940:	6a 2f                	push   $0x2f
  101942:	eb 24                	jmp    101968 <irq_common_stub>

00101944 <isr_common_stub>:
  101944:	60                   	pusha
  101945:	66 8c d8             	mov    %ds,%ax
  101948:	50                   	push   %eax
  101949:	66 b8 10 00          	mov    $0x10,%ax
  10194d:	8e d8                	mov    %eax,%ds
  10194f:	8e c0                	mov    %eax,%es
  101951:	8e e0                	mov    %eax,%fs
  101953:	8e e8                	mov    %eax,%gs
  101955:	e8 b6 f9 ff ff       	call   101310 <isr_handler>
  10195a:	58                   	pop    %eax
  10195b:	8e d8                	mov    %eax,%ds
  10195d:	8e c0                	mov    %eax,%es
  10195f:	8e e0                	mov    %eax,%fs
  101961:	8e e8                	mov    %eax,%gs
  101963:	61                   	popa
  101964:	83 c4 08             	add    $0x8,%esp
  101967:	cf                   	iret

00101968 <irq_common_stub>:
  101968:	60                   	pusha
  101969:	66 8c d8             	mov    %ds,%ax
  10196c:	50                   	push   %eax
  10196d:	66 b8 10 00          	mov    $0x10,%ax
  101971:	8e d8                	mov    %eax,%ds
  101973:	8e c0                	mov    %eax,%es
  101975:	8e e0                	mov    %eax,%fs
  101977:	8e e8                	mov    %eax,%gs
  101979:	e8 e2 fd ff ff       	call   101760 <irq_handler>
  10197e:	5b                   	pop    %ebx
  10197f:	8e db                	mov    %ebx,%ds
  101981:	8e c3                	mov    %ebx,%es
  101983:	8e e3                	mov    %ebx,%fs
  101985:	8e eb                	mov    %ebx,%gs
  101987:	61                   	popa
  101988:	83 c4 08             	add    $0x8,%esp
  10198b:	cf                   	iret
  10198c:	66 90                	xchg   %ax,%ax
  10198e:	66 90                	xchg   %ax,%ax

00101990 <idt_flush>:
  101990:	8b 44 24 04          	mov    0x4(%esp),%eax
  101994:	0f 01 18             	lidtl  (%eax)
  101997:	c3                   	ret
  101998:	66 90                	xchg   %ax,%ax
  10199a:	66 90                	xchg   %ax,%ax
  10199c:	66 90                	xchg   %ax,%ax
  10199e:	66 90                	xchg   %ax,%ax

001019a0 <keyboard_callback>:
  1019a0:	e4 60                	in     $0x60,%al
  1019a2:	84 c0                	test   %al,%al
  1019a4:	78 3a                	js     1019e0 <keyboard_callback+0x40>
  1019a6:	3c 3b                	cmp    $0x3b,%al
  1019a8:	74 22                	je     1019cc <keyboard_callback+0x2c>
  1019aa:	77 1c                	ja     1019c8 <keyboard_callback+0x28>
  1019ac:	3c 3a                	cmp    $0x3a,%al
  1019ae:	74 58                	je     101a08 <keyboard_callback+0x68>
  1019b0:	3c 2a                	cmp    $0x2a,%al
  1019b2:	74 04                	je     1019b8 <keyboard_callback+0x18>
  1019b4:	3c 36                	cmp    $0x36,%al
  1019b6:	75 68                	jne    101a20 <keyboard_callback+0x80>
  1019b8:	c7 05 28 3d 11 00 01 	movl   $0x1,0x113d28
  1019bf:	00 00 00 
  1019c2:	c3                   	ret
  1019c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1019c8:	3c 58                	cmp    $0x58,%al
  1019ca:	75 24                	jne    1019f0 <keyboard_callback+0x50>
  1019cc:	c7 05 20 3d 11 00 01 	movl   $0x1,0x113d20
  1019d3:	00 00 00 
  1019d6:	c3                   	ret
  1019d7:	90                   	nop
  1019d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1019df:	00 
  1019e0:	83 e0 7f             	and    $0x7f,%eax
  1019e3:	3c 2a                	cmp    $0x2a,%al
  1019e5:	74 11                	je     1019f8 <keyboard_callback+0x58>
  1019e7:	3c 36                	cmp    $0x36,%al
  1019e9:	74 0d                	je     1019f8 <keyboard_callback+0x58>
  1019eb:	c3                   	ret
  1019ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1019f0:	c3                   	ret
  1019f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1019f8:	c7 05 28 3d 11 00 00 	movl   $0x0,0x113d28
  1019ff:	00 00 00 
  101a02:	c3                   	ret
  101a03:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101a08:	8b 0d 24 3d 11 00    	mov    0x113d24,%ecx
  101a0e:	31 c0                	xor    %eax,%eax
  101a10:	85 c9                	test   %ecx,%ecx
  101a12:	0f 94 c0             	sete   %al
  101a15:	a3 24 3d 11 00       	mov    %eax,0x113d24
  101a1a:	c3                   	ret
  101a1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101a20:	8b 15 28 3d 11 00    	mov    0x113d28,%edx
  101a26:	85 d2                	test   %edx,%edx
  101a28:	74 4e                	je     101a78 <keyboard_callback+0xd8>
  101a2a:	8b 0d 24 3d 11 00    	mov    0x113d24,%ecx
  101a30:	85 c9                	test   %ecx,%ecx
  101a32:	75 4e                	jne    101a82 <keyboard_callback+0xe2>
  101a34:	0f b6 c0             	movzbl %al,%eax
  101a37:	0f b6 90 80 b0 10 00 	movzbl 0x10b080(%eax),%edx
  101a3e:	84 d2                	test   %dl,%dl
  101a40:	74 a9                	je     1019eb <keyboard_callback+0x4b>
  101a42:	a1 30 3d 11 00       	mov    0x113d30,%eax
  101a47:	8d 48 01             	lea    0x1(%eax),%ecx
  101a4a:	c1 f9 1f             	sar    $0x1f,%ecx
  101a4d:	c1 e9 18             	shr    $0x18,%ecx
  101a50:	8d 44 08 01          	lea    0x1(%eax,%ecx,1),%eax
  101a54:	0f b6 c0             	movzbl %al,%eax
  101a57:	29 c8                	sub    %ecx,%eax
  101a59:	8b 0d 2c 3d 11 00    	mov    0x113d2c,%ecx
  101a5f:	39 c8                	cmp    %ecx,%eax
  101a61:	74 88                	je     1019eb <keyboard_callback+0x4b>
  101a63:	8b 0d 30 3d 11 00    	mov    0x113d30,%ecx
  101a69:	a3 30 3d 11 00       	mov    %eax,0x113d30
  101a6e:	88 91 40 3d 11 00    	mov    %dl,0x113d40(%ecx)
  101a74:	c3                   	ret
  101a75:	8d 76 00             	lea    0x0(%esi),%esi
  101a78:	8b 15 24 3d 11 00    	mov    0x113d24,%edx
  101a7e:	85 d2                	test   %edx,%edx
  101a80:	75 b2                	jne    101a34 <keyboard_callback+0x94>
  101a82:	0f b6 c0             	movzbl %al,%eax
  101a85:	0f b6 90 c0 b0 10 00 	movzbl 0x10b0c0(%eax),%edx
  101a8c:	eb b0                	jmp    101a3e <keyboard_callback+0x9e>
  101a8e:	66 90                	xchg   %ax,%ax

00101a90 <keyboard_buffer_put>:
  101a90:	a1 30 3d 11 00       	mov    0x113d30,%eax
  101a95:	55                   	push   %ebp
  101a96:	8d 48 01             	lea    0x1(%eax),%ecx
  101a99:	c1 f9 1f             	sar    $0x1f,%ecx
  101a9c:	89 e5                	mov    %esp,%ebp
  101a9e:	c1 e9 18             	shr    $0x18,%ecx
  101aa1:	8b 55 08             	mov    0x8(%ebp),%edx
  101aa4:	8d 44 08 01          	lea    0x1(%eax,%ecx,1),%eax
  101aa8:	0f b6 c0             	movzbl %al,%eax
  101aab:	29 c8                	sub    %ecx,%eax
  101aad:	8b 0d 2c 3d 11 00    	mov    0x113d2c,%ecx
  101ab3:	39 c1                	cmp    %eax,%ecx
  101ab5:	74 11                	je     101ac8 <keyboard_buffer_put+0x38>
  101ab7:	8b 0d 30 3d 11 00    	mov    0x113d30,%ecx
  101abd:	a3 30 3d 11 00       	mov    %eax,0x113d30
  101ac2:	88 91 40 3d 11 00    	mov    %dl,0x113d40(%ecx)
  101ac8:	5d                   	pop    %ebp
  101ac9:	c3                   	ret
  101aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101ad0 <keyboard_buffer_read>:
  101ad0:	8b 0d 30 3d 11 00    	mov    0x113d30,%ecx
  101ad6:	8b 15 2c 3d 11 00    	mov    0x113d2c,%edx
  101adc:	39 d1                	cmp    %edx,%ecx
  101ade:	74 38                	je     101b18 <keyboard_buffer_read+0x48>
  101ae0:	55                   	push   %ebp
  101ae1:	a1 2c 3d 11 00       	mov    0x113d2c,%eax
  101ae6:	0f b6 90 40 3d 11 00 	movzbl 0x113d40(%eax),%edx
  101aed:	89 e5                	mov    %esp,%ebp
  101aef:	8b 45 08             	mov    0x8(%ebp),%eax
  101af2:	88 10                	mov    %dl,(%eax)
  101af4:	a1 2c 3d 11 00       	mov    0x113d2c,%eax
  101af9:	5d                   	pop    %ebp
  101afa:	83 c0 01             	add    $0x1,%eax
  101afd:	99                   	cltd
  101afe:	c1 ea 18             	shr    $0x18,%edx
  101b01:	01 d0                	add    %edx,%eax
  101b03:	0f b6 c0             	movzbl %al,%eax
  101b06:	29 d0                	sub    %edx,%eax
  101b08:	a3 2c 3d 11 00       	mov    %eax,0x113d2c
  101b0d:	b8 01 00 00 00       	mov    $0x1,%eax
  101b12:	c3                   	ret
  101b13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101b18:	31 c0                	xor    %eax,%eax
  101b1a:	c3                   	ret
  101b1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00101b20 <keyboard_buffer_available>:
  101b20:	a1 30 3d 11 00       	mov    0x113d30,%eax
  101b25:	8b 15 2c 3d 11 00    	mov    0x113d2c,%edx
  101b2b:	29 d0                	sub    %edx,%eax
  101b2d:	05 00 01 00 00       	add    $0x100,%eax
  101b32:	99                   	cltd
  101b33:	c1 ea 18             	shr    $0x18,%edx
  101b36:	01 d0                	add    %edx,%eax
  101b38:	0f b6 c0             	movzbl %al,%eax
  101b3b:	29 d0                	sub    %edx,%eax
  101b3d:	c3                   	ret
  101b3e:	66 90                	xchg   %ax,%ax

00101b40 <keyboard_init>:
  101b40:	55                   	push   %ebp
  101b41:	89 e5                	mov    %esp,%ebp
  101b43:	83 ec 10             	sub    $0x10,%esp
  101b46:	c7 05 30 3d 11 00 00 	movl   $0x0,0x113d30
  101b4d:	00 00 00 
  101b50:	68 a0 19 10 00       	push   $0x1019a0
  101b55:	6a 21                	push   $0x21
  101b57:	c7 05 2c 3d 11 00 00 	movl   $0x0,0x113d2c
  101b5e:	00 00 00 
  101b61:	e8 8a fa ff ff       	call   1015f0 <register_interrupt_handler>
  101b66:	83 c4 10             	add    $0x10,%esp
  101b69:	c9                   	leave
  101b6a:	c3                   	ret
  101b6b:	66 90                	xchg   %ax,%ax
  101b6d:	66 90                	xchg   %ax,%ax
  101b6f:	66 90                	xchg   %ax,%ax
  101b71:	66 90                	xchg   %ax,%ax
  101b73:	66 90                	xchg   %ax,%ax
  101b75:	66 90                	xchg   %ax,%ax
  101b77:	66 90                	xchg   %ax,%ax
  101b79:	66 90                	xchg   %ax,%ax
  101b7b:	66 90                	xchg   %ax,%ax
  101b7d:	66 90                	xchg   %ax,%ax
  101b7f:	90                   	nop

00101b80 <timer_callback>:
  101b80:	55                   	push   %ebp
  101b81:	89 e5                	mov    %esp,%ebp
  101b83:	56                   	push   %esi
  101b84:	53                   	push   %ebx
  101b85:	83 ec 10             	sub    $0x10,%esp
  101b88:	a1 50 3e 11 00       	mov    0x113e50,%eax
  101b8d:	83 c0 01             	add    $0x1,%eax
  101b90:	a3 50 3e 11 00       	mov    %eax,0x113e50
  101b95:	e8 46 39 00 00       	call   1054e0 <schedule_tick>
  101b9a:	a1 50 3e 11 00       	mov    0x113e50,%eax
  101b9f:	69 c0 29 5c 8f c2    	imul   $0xc28f5c29,%eax,%eax
  101ba5:	c1 c8 02             	ror    $0x2,%eax
  101ba8:	3d 28 5c 8f 02       	cmp    $0x28f5c28,%eax
  101bad:	77 1b                	ja     101bca <timer_callback+0x4a>
  101baf:	a1 4c 3e 11 00       	mov    0x113e4c,%eax
  101bb4:	83 c0 01             	add    $0x1,%eax
  101bb7:	a3 4c 3e 11 00       	mov    %eax,0x113e4c
  101bbc:	a1 4c 3e 11 00       	mov    0x113e4c,%eax
  101bc1:	83 f8 3b             	cmp    $0x3b,%eax
  101bc4:	0f 87 5e 01 00 00    	ja     101d28 <timer_callback+0x1a8>
  101bca:	e8 b1 81 00 00       	call   109d80 <sound_tick>
  101bcf:	a1 4c 3e 11 00       	mov    0x113e4c,%eax
  101bd4:	3b 05 40 3e 11 00    	cmp    0x113e40,%eax
  101bda:	0f 84 3a 01 00 00    	je     101d1a <timer_callback+0x19a>
  101be0:	a1 4c 3e 11 00       	mov    0x113e4c,%eax
  101be5:	8b 15 44 3e 11 00    	mov    0x113e44,%edx
  101beb:	bb cd cc cc cc       	mov    $0xcccccccd,%ebx
  101bf0:	c6 45 ee 3a          	movb   $0x3a,-0x12(%ebp)
  101bf4:	8b 35 44 3e 11 00    	mov    0x113e44,%esi
  101bfa:	c6 45 f1 3a          	movb   $0x3a,-0xf(%ebp)
  101bfe:	a3 40 3e 11 00       	mov    %eax,0x113e40
  101c03:	89 d0                	mov    %edx,%eax
  101c05:	f7 e3                	mul    %ebx
  101c07:	89 f0                	mov    %esi,%eax
  101c09:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
  101c0d:	89 d1                	mov    %edx,%ecx
  101c0f:	f7 e3                	mul    %ebx
  101c11:	c1 e9 03             	shr    $0x3,%ecx
  101c14:	c1 ea 03             	shr    $0x3,%edx
  101c17:	8d 04 92             	lea    (%edx,%edx,4),%eax
  101c1a:	01 c0                	add    %eax,%eax
  101c1c:	29 c6                	sub    %eax,%esi
  101c1e:	8d 46 30             	lea    0x30(%esi),%eax
  101c21:	88 45 ed             	mov    %al,-0x13(%ebp)
  101c24:	a1 48 3e 11 00       	mov    0x113e48,%eax
  101c29:	8b 35 48 3e 11 00    	mov    0x113e48,%esi
  101c2f:	f7 e3                	mul    %ebx
  101c31:	89 f0                	mov    %esi,%eax
  101c33:	c1 ea 03             	shr    $0x3,%edx
  101c36:	83 c2 30             	add    $0x30,%edx
  101c39:	88 55 ef             	mov    %dl,-0x11(%ebp)
  101c3c:	f7 e3                	mul    %ebx
  101c3e:	c1 ea 03             	shr    $0x3,%edx
  101c41:	8d 04 92             	lea    (%edx,%edx,4),%eax
  101c44:	01 c0                	add    %eax,%eax
  101c46:	29 c6                	sub    %eax,%esi
  101c48:	8d 46 30             	lea    0x30(%esi),%eax
  101c4b:	88 45 f0             	mov    %al,-0x10(%ebp)
  101c4e:	a1 4c 3e 11 00       	mov    0x113e4c,%eax
  101c53:	8b 35 4c 3e 11 00    	mov    0x113e4c,%esi
  101c59:	f7 e3                	mul    %ebx
  101c5b:	89 f0                	mov    %esi,%eax
  101c5d:	c1 ea 03             	shr    $0x3,%edx
  101c60:	83 c2 30             	add    $0x30,%edx
  101c63:	88 55 f2             	mov    %dl,-0xe(%ebp)
  101c66:	f7 e3                	mul    %ebx
  101c68:	bb 20 0f 00 00       	mov    $0xf20,%ebx
  101c6d:	c1 ea 03             	shr    $0x3,%edx
  101c70:	8d 04 92             	lea    (%edx,%edx,4),%eax
  101c73:	ba 20 0f 00 00       	mov    $0xf20,%edx
  101c78:	01 c0                	add    %eax,%eax
  101c7a:	29 c6                	sub    %eax,%esi
  101c7c:	8d 46 30             	lea    0x30(%esi),%eax
  101c7f:	be 20 0f 00 00       	mov    $0xf20,%esi
  101c84:	88 45 f3             	mov    %al,-0xd(%ebp)
  101c87:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101c8c:	66 a3 2c 81 0b 00    	mov    %ax,0xb812c
  101c92:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101c97:	66 a3 34 81 0b 00    	mov    %ax,0xb8134
  101c9d:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101ca2:	66 a3 36 81 0b 00    	mov    %ax,0xb8136
  101ca8:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101cad:	66 a3 38 81 0b 00    	mov    %ax,0xb8138
  101cb3:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101cb8:	66 89 15 2e 81 0b 00 	mov    %dx,0xb812e
  101cbf:	89 ca                	mov    %ecx,%edx
  101cc1:	66 a3 3a 81 0b 00    	mov    %ax,0xb813a
  101cc7:	b8 20 0f 00 00       	mov    $0xf20,%eax
  101ccc:	66 89 1d 30 81 0b 00 	mov    %bx,0xb8130
  101cd3:	66 89 35 32 81 0b 00 	mov    %si,0xb8132
  101cda:	66 a3 3c 81 0b 00    	mov    %ax,0xb813c
  101ce0:	80 c2 30             	add    $0x30,%dl
  101ce3:	74 35                	je     101d1a <timer_callback+0x19a>
  101ce5:	31 c0                	xor    %eax,%eax
  101ce7:	8d 4d ec             	lea    -0x14(%ebp),%ecx
  101cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101cf0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101cf7:	00 
  101cf8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101cff:	00 
  101d00:	66 0f be d2          	movsbw %dl,%dx
  101d04:	80 ce 0f             	or     $0xf,%dh
  101d07:	66 89 94 00 2c 81 0b 	mov    %dx,0xb812c(%eax,%eax,1)
  101d0e:	00 
  101d0f:	83 c0 01             	add    $0x1,%eax
  101d12:	0f b6 14 01          	movzbl (%ecx,%eax,1),%edx
  101d16:	84 d2                	test   %dl,%dl
  101d18:	75 e6                	jne    101d00 <timer_callback+0x180>
  101d1a:	83 c4 10             	add    $0x10,%esp
  101d1d:	5b                   	pop    %ebx
  101d1e:	5e                   	pop    %esi
  101d1f:	5d                   	pop    %ebp
  101d20:	c3                   	ret
  101d21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101d28:	c7 05 4c 3e 11 00 00 	movl   $0x0,0x113e4c
  101d2f:	00 00 00 
  101d32:	a1 48 3e 11 00       	mov    0x113e48,%eax
  101d37:	83 c0 01             	add    $0x1,%eax
  101d3a:	a3 48 3e 11 00       	mov    %eax,0x113e48
  101d3f:	a1 48 3e 11 00       	mov    0x113e48,%eax
  101d44:	83 f8 3b             	cmp    $0x3b,%eax
  101d47:	0f 86 7d fe ff ff    	jbe    101bca <timer_callback+0x4a>
  101d4d:	c7 05 48 3e 11 00 00 	movl   $0x0,0x113e48
  101d54:	00 00 00 
  101d57:	a1 44 3e 11 00       	mov    0x113e44,%eax
  101d5c:	83 c0 01             	add    $0x1,%eax
  101d5f:	a3 44 3e 11 00       	mov    %eax,0x113e44
  101d64:	a1 44 3e 11 00       	mov    0x113e44,%eax
  101d69:	83 f8 17             	cmp    $0x17,%eax
  101d6c:	0f 86 58 fe ff ff    	jbe    101bca <timer_callback+0x4a>
  101d72:	c7 05 44 3e 11 00 00 	movl   $0x0,0x113e44
  101d79:	00 00 00 
  101d7c:	e9 49 fe ff ff       	jmp    101bca <timer_callback+0x4a>
  101d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101d88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101d8f:	00 

00101d90 <timer_init>:
  101d90:	55                   	push   %ebp
  101d91:	89 e5                	mov    %esp,%ebp
  101d93:	83 ec 10             	sub    $0x10,%esp
  101d96:	68 80 1b 10 00       	push   $0x101b80
  101d9b:	6a 20                	push   $0x20
  101d9d:	e8 4e f8 ff ff       	call   1015f0 <register_interrupt_handler>
  101da2:	31 d2                	xor    %edx,%edx
  101da4:	b8 de 34 12 00       	mov    $0x1234de,%eax
  101da9:	f7 75 08             	divl   0x8(%ebp)
  101dac:	89 c1                	mov    %eax,%ecx
  101dae:	b8 36 00 00 00       	mov    $0x36,%eax
  101db3:	e6 43                	out    %al,$0x43
  101db5:	89 c8                	mov    %ecx,%eax
  101db7:	e6 40                	out    %al,$0x40
  101db9:	89 c8                	mov    %ecx,%eax
  101dbb:	c1 e8 08             	shr    $0x8,%eax
  101dbe:	e6 40                	out    %al,$0x40
  101dc0:	83 c4 10             	add    $0x10,%esp
  101dc3:	c9                   	leave
  101dc4:	c3                   	ret
  101dc5:	66 90                	xchg   %ax,%ax
  101dc7:	66 90                	xchg   %ax,%ax
  101dc9:	66 90                	xchg   %ax,%ax
  101dcb:	66 90                	xchg   %ax,%ax
  101dcd:	66 90                	xchg   %ax,%ax
  101dcf:	66 90                	xchg   %ax,%ax
  101dd1:	66 90                	xchg   %ax,%ax
  101dd3:	66 90                	xchg   %ax,%ax
  101dd5:	66 90                	xchg   %ax,%ax
  101dd7:	66 90                	xchg   %ax,%ax
  101dd9:	66 90                	xchg   %ax,%ax
  101ddb:	66 90                	xchg   %ax,%ax
  101ddd:	66 90                	xchg   %ax,%ax
  101ddf:	90                   	nop

00101de0 <mouse_callback>:
  101de0:	e4 60                	in     $0x60,%al
  101de2:	0f b6 0d 6b 3e 11 00 	movzbl 0x113e6b,%ecx
  101de9:	88 81 68 3e 11 00    	mov    %al,0x113e68(%ecx)
  101def:	80 f9 02             	cmp    $0x2,%cl
  101df2:	74 0c                	je     101e00 <mouse_callback+0x20>
  101df4:	8d 41 01             	lea    0x1(%ecx),%eax
  101df7:	a2 6b 3e 11 00       	mov    %al,0x113e6b
  101dfc:	c3                   	ret
  101dfd:	8d 76 00             	lea    0x0(%esi),%esi
  101e00:	55                   	push   %ebp
  101e01:	89 e5                	mov    %esp,%ebp
  101e03:	57                   	push   %edi
  101e04:	56                   	push   %esi
  101e05:	53                   	push   %ebx
  101e06:	83 ec 2c             	sub    $0x2c,%esp
  101e09:	0f b6 0d 68 3e 11 00 	movzbl 0x113e68,%ecx
  101e10:	c6 05 6b 3e 11 00 00 	movb   $0x0,0x113e6b
  101e17:	0f b6 15 69 3e 11 00 	movzbl 0x113e69,%edx
  101e1e:	0f b6 05 6a 3e 11 00 	movzbl 0x113e6a,%eax
  101e25:	f6 c1 10             	test   $0x10,%cl
  101e28:	75 16                	jne    101e40 <mouse_callback+0x60>
  101e2a:	83 e1 20             	and    $0x20,%ecx
  101e2d:	75 1b                	jne    101e4a <mouse_callback+0x6a>
  101e2f:	f7 d8                	neg    %eax
  101e31:	89 d7                	mov    %edx,%edi
  101e33:	66 09 c7             	or     %ax,%di
  101e36:	75 18                	jne    101e50 <mouse_callback+0x70>
  101e38:	83 c4 2c             	add    $0x2c,%esp
  101e3b:	5b                   	pop    %ebx
  101e3c:	5e                   	pop    %esi
  101e3d:	5f                   	pop    %edi
  101e3e:	5d                   	pop    %ebp
  101e3f:	c3                   	ret
  101e40:	66 81 ca 00 ff       	or     $0xff00,%dx
  101e45:	83 e1 20             	and    $0x20,%ecx
  101e48:	74 04                	je     101e4e <mouse_callback+0x6e>
  101e4a:	66 0d 00 ff          	or     $0xff00,%ax
  101e4e:	f7 d8                	neg    %eax
  101e50:	0f bf d2             	movswl %dx,%edx
  101e53:	98                   	cwtl
  101e54:	80 3d 80 42 11 00 00 	cmpb   $0x0,0x114280
  101e5b:	0f 85 e1 00 00 00    	jne    101f42 <mouse_callback+0x162>
  101e61:	03 15 64 3e 11 00    	add    0x113e64,%edx
  101e67:	03 05 60 3e 11 00    	add    0x113e60,%eax
  101e6d:	89 15 64 3e 11 00    	mov    %edx,0x113e64
  101e73:	a3 60 3e 11 00       	mov    %eax,0x113e60
  101e78:	83 fa 03             	cmp    $0x3,%edx
  101e7b:	7e 26                	jle    101ea3 <mouse_callback+0xc3>
  101e7d:	83 ea 04             	sub    $0x4,%edx
  101e80:	89 15 64 3e 11 00    	mov    %edx,0x113e64
  101e86:	83 f8 07             	cmp    $0x7,%eax
  101e89:	0f 8e 79 01 00 00    	jle    102008 <mouse_callback+0x228>
  101e8f:	ba 01 00 00 00       	mov    $0x1,%edx
  101e94:	83 e8 08             	sub    $0x8,%eax
  101e97:	a3 60 3e 11 00       	mov    %eax,0x113e60
  101e9c:	b8 01 00 00 00       	mov    $0x1,%eax
  101ea1:	eb 32                	jmp    101ed5 <mouse_callback+0xf5>
  101ea3:	83 fa fd             	cmp    $0xfffffffd,%edx
  101ea6:	0f 8d 21 02 00 00    	jge    1020cd <mouse_callback+0x2ed>
  101eac:	83 c2 04             	add    $0x4,%edx
  101eaf:	89 15 64 3e 11 00    	mov    %edx,0x113e64
  101eb5:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  101eba:	83 f8 07             	cmp    $0x7,%eax
  101ebd:	7f d5                	jg     101e94 <mouse_callback+0xb4>
  101ebf:	83 f8 f9             	cmp    $0xfffffff9,%eax
  101ec2:	0f 8d 39 01 00 00    	jge    102001 <mouse_callback+0x221>
  101ec8:	83 c0 08             	add    $0x8,%eax
  101ecb:	a3 60 3e 11 00       	mov    %eax,0x113e60
  101ed0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101ed5:	80 3d 6c 3e 11 00 00 	cmpb   $0x0,0x113e6c
  101edc:	74 16                	je     101ef4 <mouse_callback+0x114>
  101ede:	8b 0d 08 e0 10 00    	mov    0x10e008,%ecx
  101ee4:	83 f9 4f             	cmp    $0x4f,%ecx
  101ee7:	0f 86 e9 00 00 00    	jbe    101fd6 <mouse_callback+0x1f6>
  101eed:	c6 05 6c 3e 11 00 00 	movb   $0x0,0x113e6c
  101ef4:	03 15 88 42 11 00    	add    0x114288,%edx
  101efa:	03 05 84 42 11 00    	add    0x114284,%eax
  101f00:	89 15 88 42 11 00    	mov    %edx,0x114288
  101f06:	a3 84 42 11 00       	mov    %eax,0x114284
  101f0b:	85 d2                	test   %edx,%edx
  101f0d:	0f 88 a5 00 00 00    	js     101fb8 <mouse_callback+0x1d8>
  101f13:	83 fa 4f             	cmp    $0x4f,%edx
  101f16:	7e 0a                	jle    101f22 <mouse_callback+0x142>
  101f18:	c7 05 88 42 11 00 4f 	movl   $0x4f,0x114288
  101f1f:	00 00 00 
  101f22:	85 c0                	test   %eax,%eax
  101f24:	0f 88 9d 00 00 00    	js     101fc7 <mouse_callback+0x1e7>
  101f2a:	83 f8 18             	cmp    $0x18,%eax
  101f2d:	0f 8e 05 ff ff ff    	jle    101e38 <mouse_callback+0x58>
  101f33:	c7 05 84 42 11 00 18 	movl   $0x18,0x114284
  101f3a:	00 00 00 
  101f3d:	e9 f6 fe ff ff       	jmp    101e38 <mouse_callback+0x58>
  101f42:	8b 1d 88 42 11 00    	mov    0x114288,%ebx
  101f48:	03 05 84 42 11 00    	add    0x114284,%eax
  101f4e:	89 c6                	mov    %eax,%esi
  101f50:	01 d3                	add    %edx,%ebx
  101f52:	e8 f9 03 00 00       	call   102350 <fb_get_info>
  101f57:	89 c2                	mov    %eax,%edx
  101f59:	31 c0                	xor    %eax,%eax
  101f5b:	85 db                	test   %ebx,%ebx
  101f5d:	0f 48 d8             	cmovs  %eax,%ebx
  101f60:	8b 42 04             	mov    0x4(%edx),%eax
  101f63:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101f66:	83 e8 02             	sub    $0x2,%eax
  101f69:	39 cb                	cmp    %ecx,%ebx
  101f6b:	0f 4d d8             	cmovge %eax,%ebx
  101f6e:	31 c0                	xor    %eax,%eax
  101f70:	85 f6                	test   %esi,%esi
  101f72:	0f 49 c6             	cmovns %esi,%eax
  101f75:	89 c7                	mov    %eax,%edi
  101f77:	8b 42 08             	mov    0x8(%edx),%eax
  101f7a:	8d 50 ff             	lea    -0x1(%eax),%edx
  101f7d:	83 e8 02             	sub    $0x2,%eax
  101f80:	39 d7                	cmp    %edx,%edi
  101f82:	0f 4c c7             	cmovl  %edi,%eax
  101f85:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  101f88:	39 1d 88 42 11 00    	cmp    %ebx,0x114288
  101f8e:	75 0c                	jne    101f9c <mouse_callback+0x1bc>
  101f90:	39 05 84 42 11 00    	cmp    %eax,0x114284
  101f96:	0f 84 9c fe ff ff    	je     101e38 <mouse_callback+0x58>
  101f9c:	80 3d 70 3e 11 00 00 	cmpb   $0x0,0x113e70
  101fa3:	75 6d                	jne    102012 <mouse_callback+0x232>
  101fa5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101fa8:	89 1d 88 42 11 00    	mov    %ebx,0x114288
  101fae:	a3 84 42 11 00       	mov    %eax,0x114284
  101fb3:	e9 80 fe ff ff       	jmp    101e38 <mouse_callback+0x58>
  101fb8:	c7 05 88 42 11 00 00 	movl   $0x0,0x114288
  101fbf:	00 00 00 
  101fc2:	e9 5b ff ff ff       	jmp    101f22 <mouse_callback+0x142>
  101fc7:	c7 05 84 42 11 00 00 	movl   $0x0,0x114284
  101fce:	00 00 00 
  101fd1:	e9 62 fe ff ff       	jmp    101e38 <mouse_callback+0x58>
  101fd6:	8b 1d 04 e0 10 00    	mov    0x10e004,%ebx
  101fdc:	83 fb 18             	cmp    $0x18,%ebx
  101fdf:	0f 87 08 ff ff ff    	ja     101eed <mouse_callback+0x10d>
  101fe5:	8d 1c 9b             	lea    (%ebx,%ebx,4),%ebx
  101fe8:	c1 e3 04             	shl    $0x4,%ebx
  101feb:	01 d9                	add    %ebx,%ecx
  101fed:	0f b7 1d 6e 3e 11 00 	movzwl 0x113e6e,%ebx
  101ff4:	66 89 9c 09 00 80 0b 	mov    %bx,0xb8000(%ecx,%ecx,1)
  101ffb:	00 
  101ffc:	e9 ec fe ff ff       	jmp    101eed <mouse_callback+0x10d>
  102001:	31 c0                	xor    %eax,%eax
  102003:	e9 cd fe ff ff       	jmp    101ed5 <mouse_callback+0xf5>
  102008:	ba 01 00 00 00       	mov    $0x1,%edx
  10200d:	e9 ad fe ff ff       	jmp    101ebf <mouse_callback+0xdf>
  102012:	e8 39 03 00 00       	call   102350 <fb_get_info>
  102017:	8b 0d 10 e0 10 00    	mov    0x10e010,%ecx
  10201d:	89 5d d0             	mov    %ebx,-0x30(%ebp)
  102020:	89 c6                	mov    %eax,%esi
  102022:	b8 00 01 00 00       	mov    $0x100,%eax
  102027:	8b 3d 0c e0 10 00    	mov    0x10e00c,%edi
  10202d:	29 c8                	sub    %ecx,%eax
  10202f:	89 ca                	mov    %ecx,%edx
  102031:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  102034:	83 c1 10             	add    $0x10,%ecx
  102037:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10203a:	f7 da                	neg    %edx
  10203c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102040:	89 f8                	mov    %edi,%eax
  102042:	89 7d e0             	mov    %edi,-0x20(%ebp)
  102045:	f7 d0                	not    %eax
  102047:	c1 e8 1f             	shr    $0x1f,%eax
  10204a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10204d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102050:	eb 15                	jmp    102067 <mouse_callback+0x287>
  102052:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102058:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10205f:	00 
  102060:	83 c0 01             	add    $0x1,%eax
  102063:	39 c1                	cmp    %eax,%ecx
  102065:	74 49                	je     1020b0 <mouse_callback+0x2d0>
  102067:	80 bc 02 00 b1 10 00 	cmpb   $0x0,0x10b100(%edx,%eax,1)
  10206e:	00 
  10206f:	74 ef                	je     102060 <mouse_callback+0x280>
  102071:	85 c0                	test   %eax,%eax
  102073:	78 eb                	js     102060 <mouse_callback+0x280>
  102075:	39 46 04             	cmp    %eax,0x4(%esi)
  102078:	7e e6                	jle    102060 <mouse_callback+0x280>
  10207a:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  10207e:	74 e0                	je     102060 <mouse_callback+0x280>
  102080:	8b 7d e0             	mov    -0x20(%ebp),%edi
  102083:	39 7e 08             	cmp    %edi,0x8(%esi)
  102086:	7e d8                	jle    102060 <mouse_callback+0x280>
  102088:	8b 5e 10             	mov    0x10(%esi),%ebx
  10208b:	0f af df             	imul   %edi,%ebx
  10208e:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
  102091:	03 1e                	add    (%esi),%ebx
  102093:	89 df                	mov    %ebx,%edi
  102095:	8d 1c 95 00 00 00 00 	lea    0x0(,%edx,4),%ebx
  10209c:	8b 9c 83 80 3e 11 00 	mov    0x113e80(%ebx,%eax,4),%ebx
  1020a3:	83 c0 01             	add    $0x1,%eax
  1020a6:	89 1f                	mov    %ebx,(%edi)
  1020a8:	39 c1                	cmp    %eax,%ecx
  1020aa:	75 bb                	jne    102067 <mouse_callback+0x287>
  1020ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1020b0:	8b 7d e0             	mov    -0x20(%ebp),%edi
  1020b3:	83 c2 10             	add    $0x10,%edx
  1020b6:	83 c7 01             	add    $0x1,%edi
  1020b9:	3b 55 d8             	cmp    -0x28(%ebp),%edx
  1020bc:	75 82                	jne    102040 <mouse_callback+0x260>
  1020be:	c6 05 70 3e 11 00 00 	movb   $0x0,0x113e70
  1020c5:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  1020c8:	e9 d8 fe ff ff       	jmp    101fa5 <mouse_callback+0x1c5>
  1020cd:	83 f8 07             	cmp    $0x7,%eax
  1020d0:	7f 10                	jg     1020e2 <mouse_callback+0x302>
  1020d2:	83 f8 f9             	cmp    $0xfffffff9,%eax
  1020d5:	0f 8d 5d fd ff ff    	jge    101e38 <mouse_callback+0x58>
  1020db:	31 d2                	xor    %edx,%edx
  1020dd:	e9 e6 fd ff ff       	jmp    101ec8 <mouse_callback+0xe8>
  1020e2:	31 d2                	xor    %edx,%edx
  1020e4:	e9 ab fd ff ff       	jmp    101e94 <mouse_callback+0xb4>
  1020e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001020f0 <mouse_init>:
  1020f0:	55                   	push   %ebp
  1020f1:	89 e5                	mov    %esp,%ebp
  1020f3:	83 ec 08             	sub    $0x8,%esp
  1020f6:	e8 25 01 00 00       	call   102220 <fb_is_graphical>
  1020fb:	a2 80 42 11 00       	mov    %al,0x114280
  102100:	89 c2                	mov    %eax,%edx
  102102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102108:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10210f:	00 
  102110:	e4 64                	in     $0x64,%al
  102112:	a8 02                	test   $0x2,%al
  102114:	75 fa                	jne    102110 <mouse_init+0x20>
  102116:	b8 a8 ff ff ff       	mov    $0xffffffa8,%eax
  10211b:	e6 64                	out    %al,$0x64
  10211d:	8d 76 00             	lea    0x0(%esi),%esi
  102120:	e4 64                	in     $0x64,%al
  102122:	a8 02                	test   $0x2,%al
  102124:	75 fa                	jne    102120 <mouse_init+0x30>
  102126:	b8 20 00 00 00       	mov    $0x20,%eax
  10212b:	e6 64                	out    %al,$0x64
  10212d:	8d 76 00             	lea    0x0(%esi),%esi
  102130:	e4 64                	in     $0x64,%al
  102132:	a8 01                	test   $0x1,%al
  102134:	74 fa                	je     102130 <mouse_init+0x40>
  102136:	e4 60                	in     $0x60,%al
  102138:	83 c8 02             	or     $0x2,%eax
  10213b:	89 c1                	mov    %eax,%ecx
  10213d:	8d 76 00             	lea    0x0(%esi),%esi
  102140:	e4 64                	in     $0x64,%al
  102142:	a8 02                	test   $0x2,%al
  102144:	75 fa                	jne    102140 <mouse_init+0x50>
  102146:	b8 60 00 00 00       	mov    $0x60,%eax
  10214b:	e6 64                	out    %al,$0x64
  10214d:	8d 76 00             	lea    0x0(%esi),%esi
  102150:	e4 64                	in     $0x64,%al
  102152:	a8 02                	test   $0x2,%al
  102154:	75 fa                	jne    102150 <mouse_init+0x60>
  102156:	89 c8                	mov    %ecx,%eax
  102158:	e6 60                	out    %al,$0x60
  10215a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102160:	e4 64                	in     $0x64,%al
  102162:	a8 02                	test   $0x2,%al
  102164:	75 fa                	jne    102160 <mouse_init+0x70>
  102166:	b8 d4 ff ff ff       	mov    $0xffffffd4,%eax
  10216b:	e6 64                	out    %al,$0x64
  10216d:	8d 76 00             	lea    0x0(%esi),%esi
  102170:	e4 64                	in     $0x64,%al
  102172:	a8 02                	test   $0x2,%al
  102174:	75 fa                	jne    102170 <mouse_init+0x80>
  102176:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  10217b:	e6 60                	out    %al,$0x60
  10217d:	8d 76 00             	lea    0x0(%esi),%esi
  102180:	e4 64                	in     $0x64,%al
  102182:	a8 01                	test   $0x1,%al
  102184:	74 fa                	je     102180 <mouse_init+0x90>
  102186:	e4 60                	in     $0x60,%al
  102188:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10218f:	00 
  102190:	e4 64                	in     $0x64,%al
  102192:	a8 02                	test   $0x2,%al
  102194:	75 fa                	jne    102190 <mouse_init+0xa0>
  102196:	b8 d4 ff ff ff       	mov    $0xffffffd4,%eax
  10219b:	e6 64                	out    %al,$0x64
  10219d:	8d 76 00             	lea    0x0(%esi),%esi
  1021a0:	e4 64                	in     $0x64,%al
  1021a2:	a8 02                	test   $0x2,%al
  1021a4:	75 fa                	jne    1021a0 <mouse_init+0xb0>
  1021a6:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  1021ab:	e6 60                	out    %al,$0x60
  1021ad:	8d 76 00             	lea    0x0(%esi),%esi
  1021b0:	e4 64                	in     $0x64,%al
  1021b2:	a8 01                	test   $0x1,%al
  1021b4:	74 fa                	je     1021b0 <mouse_init+0xc0>
  1021b6:	e4 60                	in     $0x60,%al
  1021b8:	84 d2                	test   %dl,%dl
  1021ba:	75 3c                	jne    1021f8 <mouse_init+0x108>
  1021bc:	c7 05 88 42 11 00 28 	movl   $0x28,0x114288
  1021c3:	00 00 00 
  1021c6:	c7 05 84 42 11 00 0c 	movl   $0xc,0x114284
  1021cd:	00 00 00 
  1021d0:	c6 05 6c 3e 11 00 00 	movb   $0x0,0x113e6c
  1021d7:	83 ec 08             	sub    $0x8,%esp
  1021da:	c6 05 6b 3e 11 00 00 	movb   $0x0,0x113e6b
  1021e1:	68 e0 1d 10 00       	push   $0x101de0
  1021e6:	6a 2c                	push   $0x2c
  1021e8:	e8 03 f4 ff ff       	call   1015f0 <register_interrupt_handler>
  1021ed:	83 c4 10             	add    $0x10,%esp
  1021f0:	c9                   	leave
  1021f1:	c3                   	ret
  1021f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1021f8:	e8 53 01 00 00       	call   102350 <fb_get_info>
  1021fd:	c6 05 70 3e 11 00 00 	movb   $0x0,0x113e70
  102204:	89 c2                	mov    %eax,%edx
  102206:	8b 40 04             	mov    0x4(%eax),%eax
  102209:	d1 e8                	shr    $1,%eax
  10220b:	a3 88 42 11 00       	mov    %eax,0x114288
  102210:	8b 42 08             	mov    0x8(%edx),%eax
  102213:	d1 e8                	shr    $1,%eax
  102215:	a3 84 42 11 00       	mov    %eax,0x114284
  10221a:	eb bb                	jmp    1021d7 <mouse_init+0xe7>
  10221c:	66 90                	xchg   %ax,%ax
  10221e:	66 90                	xchg   %ax,%ax

00102220 <fb_is_graphical>:
  102220:	0f b6 05 8c 42 11 00 	movzbl 0x11428c,%eax
  102227:	c3                   	ret
  102228:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10222f:	00 

00102230 <fb_putpixel>:
  102230:	80 3d 8c 42 11 00 00 	cmpb   $0x0,0x11428c
  102237:	74 4f                	je     102288 <fb_putpixel+0x58>
  102239:	55                   	push   %ebp
  10223a:	a1 94 42 11 00       	mov    0x114294,%eax
  10223f:	89 e5                	mov    %esp,%ebp
  102241:	39 45 08             	cmp    %eax,0x8(%ebp)
  102244:	73 3d                	jae    102283 <fb_putpixel+0x53>
  102246:	a1 98 42 11 00       	mov    0x114298,%eax
  10224b:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10224e:	73 33                	jae    102283 <fb_putpixel+0x53>
  102250:	8b 45 0c             	mov    0xc(%ebp),%eax
  102253:	0f af 05 a0 42 11 00 	imul   0x1142a0,%eax
  10225a:	8b 55 08             	mov    0x8(%ebp),%edx
  10225d:	0f b6 4d 10          	movzbl 0x10(%ebp),%ecx
  102261:	8d 14 90             	lea    (%eax,%edx,4),%edx
  102264:	0f b6 45 18          	movzbl 0x18(%ebp),%eax
  102268:	03 15 90 42 11 00    	add    0x114290,%edx
  10226e:	c1 e0 10             	shl    $0x10,%eax
  102271:	09 c8                	or     %ecx,%eax
  102273:	0f b6 4d 14          	movzbl 0x14(%ebp),%ecx
  102277:	c1 e1 08             	shl    $0x8,%ecx
  10227a:	09 c8                	or     %ecx,%eax
  10227c:	0d 00 00 00 ff       	or     $0xff000000,%eax
  102281:	89 02                	mov    %eax,(%edx)
  102283:	5d                   	pop    %ebp
  102284:	c3                   	ret
  102285:	8d 76 00             	lea    0x0(%esi),%esi
  102288:	c3                   	ret
  102289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102290 <fb_fill_rect>:
  102290:	55                   	push   %ebp
  102291:	89 e5                	mov    %esp,%ebp
  102293:	57                   	push   %edi
  102294:	56                   	push   %esi
  102295:	53                   	push   %ebx
  102296:	83 ec 0c             	sub    $0xc,%esp
  102299:	0f b6 45 18          	movzbl 0x18(%ebp),%eax
  10229d:	8b 7d 08             	mov    0x8(%ebp),%edi
  1022a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1022a3:	88 45 f3             	mov    %al,-0xd(%ebp)
  1022a6:	0f b6 45 1c          	movzbl 0x1c(%ebp),%eax
  1022aa:	88 45 f2             	mov    %al,-0xe(%ebp)
  1022ad:	80 3d 8c 42 11 00 00 	cmpb   $0x0,0x11428c
  1022b4:	0f 84 82 00 00 00    	je     10233c <fb_fill_rect+0xac>
  1022ba:	8b 75 14             	mov    0x14(%ebp),%esi
  1022bd:	01 ce                	add    %ecx,%esi
  1022bf:	39 f1                	cmp    %esi,%ecx
  1022c1:	73 79                	jae    10233c <fb_fill_rect+0xac>
  1022c3:	0f b6 45 20          	movzbl 0x20(%ebp),%eax
  1022c7:	89 75 e8             	mov    %esi,-0x18(%ebp)
  1022ca:	c1 e0 10             	shl    $0x10,%eax
  1022cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1022d0:	3b 0d 98 42 11 00    	cmp    0x114298,%ecx
  1022d6:	73 64                	jae    10233c <fb_fill_rect+0xac>
  1022d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1022db:	89 f8                	mov    %edi,%eax
  1022dd:	01 fb                	add    %edi,%ebx
  1022df:	39 df                	cmp    %ebx,%edi
  1022e1:	73 51                	jae    102334 <fb_fill_rect+0xa4>
  1022e3:	89 7d 08             	mov    %edi,0x8(%ebp)
  1022e6:	eb 41                	jmp    102329 <fb_fill_rect+0x99>
  1022e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1022ef:	00 
  1022f0:	3b 0d 98 42 11 00    	cmp    0x114298,%ecx
  1022f6:	73 2a                	jae    102322 <fb_fill_rect+0x92>
  1022f8:	8b 15 a0 42 11 00    	mov    0x1142a0,%edx
  1022fe:	0f b6 7d f2          	movzbl -0xe(%ebp),%edi
  102302:	0f af d1             	imul   %ecx,%edx
  102305:	c1 e7 08             	shl    $0x8,%edi
  102308:	8d 34 82             	lea    (%edx,%eax,4),%esi
  10230b:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  10230f:	0b 55 ec             	or     -0x14(%ebp),%edx
  102312:	09 fa                	or     %edi,%edx
  102314:	03 35 90 42 11 00    	add    0x114290,%esi
  10231a:	81 ca 00 00 00 ff    	or     $0xff000000,%edx
  102320:	89 16                	mov    %edx,(%esi)
  102322:	83 c0 01             	add    $0x1,%eax
  102325:	39 d8                	cmp    %ebx,%eax
  102327:	74 08                	je     102331 <fb_fill_rect+0xa1>
  102329:	3b 05 94 42 11 00    	cmp    0x114294,%eax
  10232f:	72 bf                	jb     1022f0 <fb_fill_rect+0x60>
  102331:	8b 7d 08             	mov    0x8(%ebp),%edi
  102334:	83 c1 01             	add    $0x1,%ecx
  102337:	3b 4d e8             	cmp    -0x18(%ebp),%ecx
  10233a:	75 94                	jne    1022d0 <fb_fill_rect+0x40>
  10233c:	83 c4 0c             	add    $0xc,%esp
  10233f:	5b                   	pop    %ebx
  102340:	5e                   	pop    %esi
  102341:	5f                   	pop    %edi
  102342:	5d                   	pop    %ebp
  102343:	c3                   	ret
  102344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10234f:	00 

00102350 <fb_get_info>:
  102350:	b8 90 42 11 00       	mov    $0x114290,%eax
  102355:	c3                   	ret
  102356:	66 90                	xchg   %ax,%ax
  102358:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10235f:	00 

00102360 <fb_clear>:
  102360:	55                   	push   %ebp
  102361:	89 e5                	mov    %esp,%ebp
  102363:	57                   	push   %edi
  102364:	56                   	push   %esi
  102365:	53                   	push   %ebx
  102366:	83 ec 0c             	sub    $0xc,%esp
  102369:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  10236d:	88 45 f3             	mov    %al,-0xd(%ebp)
  102370:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  102374:	88 45 f2             	mov    %al,-0xe(%ebp)
  102377:	80 3d 8c 42 11 00 00 	cmpb   $0x0,0x11428c
  10237e:	0f 84 85 00 00 00    	je     102409 <fb_clear+0xa9>
  102384:	8b 1d 98 42 11 00    	mov    0x114298,%ebx
  10238a:	85 db                	test   %ebx,%ebx
  10238c:	74 7b                	je     102409 <fb_clear+0xa9>
  10238e:	8b 3d 94 42 11 00    	mov    0x114294,%edi
  102394:	85 ff                	test   %edi,%edi
  102396:	74 79                	je     102411 <fb_clear+0xb1>
  102398:	0f b6 45 10          	movzbl 0x10(%ebp),%eax
  10239c:	89 5d e8             	mov    %ebx,-0x18(%ebp)
  10239f:	31 c9                	xor    %ecx,%ecx
  1023a1:	c1 e0 10             	shl    $0x10,%eax
  1023a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1023a7:	90                   	nop
  1023a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1023af:	00 
  1023b0:	31 c0                	xor    %eax,%eax
  1023b2:	eb 3d                	jmp    1023f1 <fb_clear+0x91>
  1023b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1023b8:	3b 0d 98 42 11 00    	cmp    0x114298,%ecx
  1023be:	73 2a                	jae    1023ea <fb_clear+0x8a>
  1023c0:	8b 15 a0 42 11 00    	mov    0x1142a0,%edx
  1023c6:	0f b6 75 f2          	movzbl -0xe(%ebp),%esi
  1023ca:	0f af d1             	imul   %ecx,%edx
  1023cd:	c1 e6 08             	shl    $0x8,%esi
  1023d0:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  1023d3:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  1023d7:	0b 55 ec             	or     -0x14(%ebp),%edx
  1023da:	09 f2                	or     %esi,%edx
  1023dc:	03 1d 90 42 11 00    	add    0x114290,%ebx
  1023e2:	81 ca 00 00 00 ff    	or     $0xff000000,%edx
  1023e8:	89 13                	mov    %edx,(%ebx)
  1023ea:	83 c0 01             	add    $0x1,%eax
  1023ed:	39 c7                	cmp    %eax,%edi
  1023ef:	74 08                	je     1023f9 <fb_clear+0x99>
  1023f1:	3b 05 94 42 11 00    	cmp    0x114294,%eax
  1023f7:	72 bf                	jb     1023b8 <fb_clear+0x58>
  1023f9:	83 c1 01             	add    $0x1,%ecx
  1023fc:	39 4d e8             	cmp    %ecx,-0x18(%ebp)
  1023ff:	74 08                	je     102409 <fb_clear+0xa9>
  102401:	3b 0d 98 42 11 00    	cmp    0x114298,%ecx
  102407:	72 a7                	jb     1023b0 <fb_clear+0x50>
  102409:	83 c4 0c             	add    $0xc,%esp
  10240c:	5b                   	pop    %ebx
  10240d:	5e                   	pop    %esi
  10240e:	5f                   	pop    %edi
  10240f:	5d                   	pop    %ebp
  102410:	c3                   	ret
  102411:	8d 47 01             	lea    0x1(%edi),%eax
  102414:	39 c3                	cmp    %eax,%ebx
  102416:	74 f1                	je     102409 <fb_clear+0xa9>
  102418:	3b 05 98 42 11 00    	cmp    0x114298,%eax
  10241e:	73 e9                	jae    102409 <fb_clear+0xa9>
  102420:	83 c7 02             	add    $0x2,%edi
  102423:	39 fb                	cmp    %edi,%ebx
  102425:	74 e2                	je     102409 <fb_clear+0xa9>
  102427:	3b 3d 98 42 11 00    	cmp    0x114298,%edi
  10242d:	72 e2                	jb     102411 <fb_clear+0xb1>
  10242f:	eb d8                	jmp    102409 <fb_clear+0xa9>
  102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102438:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10243f:	00 

00102440 <framebuffer_init>:
  102440:	55                   	push   %ebp
  102441:	89 e5                	mov    %esp,%ebp
  102443:	53                   	push   %ebx
  102444:	83 ec 04             	sub    $0x4,%esp
  102447:	a1 00 e0 10 00       	mov    0x10e000,%eax
  10244c:	8b 50 64             	mov    0x64(%eax),%edx
  10244f:	8b 48 58             	mov    0x58(%eax),%ecx
  102452:	89 15 94 42 11 00    	mov    %edx,0x114294
  102458:	8b 50 68             	mov    0x68(%eax),%edx
  10245b:	89 0d 90 42 11 00    	mov    %ecx,0x114290
  102461:	89 15 98 42 11 00    	mov    %edx,0x114298
  102467:	8b 50 6c             	mov    0x6c(%eax),%edx
  10246a:	8b 40 60             	mov    0x60(%eax),%eax
  10246d:	0f b6 da             	movzbl %dl,%ebx
  102470:	89 1d 9c 42 11 00    	mov    %ebx,0x11429c
  102476:	a3 a0 42 11 00       	mov    %eax,0x1142a0
  10247b:	84 d2                	test   %dl,%dl
  10247d:	75 41                	jne    1024c0 <framebuffer_init+0x80>
  10247f:	85 c9                	test   %ecx,%ecx
  102481:	74 3d                	je     1024c0 <framebuffer_init+0x80>
  102483:	83 ec 04             	sub    $0x4,%esp
  102486:	b8 08 08 00 00       	mov    $0x808,%eax
  10248b:	c6 05 8c 42 11 00 01 	movb   $0x1,0x11428c
  102492:	6a 00                	push   $0x0
  102494:	6a 00                	push   $0x0
  102496:	6a 00                	push   $0x0
  102498:	66 a3 a4 42 11 00    	mov    %ax,0x1142a4
  10249e:	c6 05 a6 42 11 00 08 	movb   $0x8,0x1142a6
  1024a5:	e8 b6 fe ff ff       	call   102360 <fb_clear>
  1024aa:	c7 04 24 a4 cb 10 00 	movl   $0x10cba4,(%esp)
  1024b1:	e8 5a e7 ff ff       	call   100c10 <terminal_writestring>
  1024b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1024b9:	83 c4 10             	add    $0x10,%esp
  1024bc:	c9                   	leave
  1024bd:	c3                   	ret
  1024be:	66 90                	xchg   %ax,%ax
  1024c0:	83 ec 0c             	sub    $0xc,%esp
  1024c3:	c6 05 8c 42 11 00 00 	movb   $0x0,0x11428c
  1024ca:	68 68 cb 10 00       	push   $0x10cb68
  1024cf:	e8 3c e7 ff ff       	call   100c10 <terminal_writestring>
  1024d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1024d7:	83 c4 10             	add    $0x10,%esp
  1024da:	c9                   	leave
  1024db:	c3                   	ret
  1024dc:	66 90                	xchg   %ax,%ax
  1024de:	66 90                	xchg   %ax,%ax

001024e0 <dma_init>:
  1024e0:	55                   	push   %ebp
  1024e1:	89 e5                	mov    %esp,%ebp
  1024e3:	83 ec 14             	sub    $0x14,%esp
  1024e6:	68 d4 cb 10 00       	push   $0x10cbd4
  1024eb:	e8 20 e7 ff ff       	call   100c10 <terminal_writestring>
  1024f0:	83 c4 0c             	add    $0xc,%esp
  1024f3:	68 e0 00 00 00       	push   $0xe0
  1024f8:	6a 00                	push   $0x0
  1024fa:	68 e0 42 11 00       	push   $0x1142e0
  1024ff:	e8 9c df ff ff       	call   1004a0 <memset>
  102504:	b8 e0 42 11 00       	mov    $0x1142e0,%eax
  102509:	83 c4 10             	add    $0x10,%esp
  10250c:	31 d2                	xor    %edx,%edx
  10250e:	66 90                	xchg   %ax,%ax
  102510:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102517:	00 
  102518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10251f:	00 
  102520:	88 10                	mov    %dl,(%eax)
  102522:	83 c2 01             	add    $0x1,%edx
  102525:	83 c0 1c             	add    $0x1c,%eax
  102528:	c6 40 e5 00          	movb   $0x0,-0x1b(%eax)
  10252c:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
  102533:	83 fa 08             	cmp    $0x8,%edx
  102536:	75 e8                	jne    102520 <dma_init+0x40>
  102538:	c6 05 51 43 11 00 01 	movb   $0x1,0x114351
  10253f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102544:	c7 05 54 43 11 00 01 	movl   $0x1,0x114354
  10254b:	00 00 00 
  10254e:	e6 0d                	out    %al,$0xd
  102550:	e6 0e                	out    %al,$0xe
  102552:	31 c0                	xor    %eax,%eax
  102554:	e6 08                	out    %al,$0x8
  102556:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10255b:	e6 da                	out    %al,$0xda
  10255d:	e6 dc                	out    %al,$0xdc
  10255f:	31 c0                	xor    %eax,%eax
  102561:	e6 d0                	out    %al,$0xd0
  102563:	b8 c0 ff ff ff       	mov    $0xffffffc0,%eax
  102568:	e6 d6                	out    %al,$0xd6
  10256a:	b8 04 00 00 00       	mov    $0x4,%eax
  10256f:	e6 d4                	out    %al,$0xd4
  102571:	83 ec 0c             	sub    $0xc,%esp
  102574:	68 09 bd 10 00       	push   $0x10bd09
  102579:	e8 92 e6 ff ff       	call   100c10 <terminal_writestring>
  10257e:	c7 04 24 fc cb 10 00 	movl   $0x10cbfc,(%esp)
  102585:	e8 86 e6 ff ff       	call   100c10 <terminal_writestring>
  10258a:	c7 04 24 20 cc 10 00 	movl   $0x10cc20,(%esp)
  102591:	e8 7a e6 ff ff       	call   100c10 <terminal_writestring>
  102596:	c7 04 24 44 cc 10 00 	movl   $0x10cc44,(%esp)
  10259d:	e8 6e e6 ff ff       	call   100c10 <terminal_writestring>
  1025a2:	c7 04 24 68 cc 10 00 	movl   $0x10cc68,(%esp)
  1025a9:	e8 62 e6 ff ff       	call   100c10 <terminal_writestring>
  1025ae:	c7 04 24 8c cc 10 00 	movl   $0x10cc8c,(%esp)
  1025b5:	e8 56 e6 ff ff       	call   100c10 <terminal_writestring>
  1025ba:	83 c4 10             	add    $0x10,%esp
  1025bd:	c9                   	leave
  1025be:	c3                   	ret
  1025bf:	90                   	nop

001025c0 <dma_channel_alloc>:
  1025c0:	55                   	push   %ebp
  1025c1:	89 e5                	mov    %esp,%ebp
  1025c3:	83 ec 28             	sub    $0x28,%esp
  1025c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1025c9:	3c 04                	cmp    $0x4,%al
  1025cb:	74 2b                	je     1025f8 <dma_channel_alloc+0x38>
  1025cd:	3c 07                	cmp    $0x7,%al
  1025cf:	77 27                	ja     1025f8 <dma_channel_alloc+0x38>
  1025d1:	0f b6 c0             	movzbl %al,%eax
  1025d4:	6b d0 1c             	imul   $0x1c,%eax,%edx
  1025d7:	80 ba e1 42 11 00 00 	cmpb   $0x0,0x1142e1(%edx)
  1025de:	75 1f                	jne    1025ff <dma_channel_alloc+0x3f>
  1025e0:	c6 82 e1 42 11 00 01 	movb   $0x1,0x1142e1(%edx)
  1025e7:	31 c0                	xor    %eax,%eax
  1025e9:	c7 82 e4 42 11 00 00 	movl   $0x0,0x1142e4(%edx)
  1025f0:	00 00 00 
  1025f3:	c9                   	leave
  1025f4:	c3                   	ret
  1025f5:	8d 76 00             	lea    0x0(%esi),%esi
  1025f8:	c9                   	leave
  1025f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1025fe:	c3                   	ret
  1025ff:	83 ec 0c             	sub    $0xc,%esp
  102602:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102605:	68 26 bd 10 00       	push   $0x10bd26
  10260a:	e8 01 e6 ff ff       	call   100c10 <terminal_writestring>
  10260f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102612:	83 c4 0c             	add    $0xc,%esp
  102615:	8d 55 f0             	lea    -0x10(%ebp),%edx
  102618:	6a 0a                	push   $0xa
  10261a:	52                   	push   %edx
  10261b:	50                   	push   %eax
  10261c:	e8 0f e3 ff ff       	call   100930 <itoa>
  102621:	8d 55 f0             	lea    -0x10(%ebp),%edx
  102624:	89 14 24             	mov    %edx,(%esp)
  102627:	e8 e4 e5 ff ff       	call   100c10 <terminal_writestring>
  10262c:	c7 04 24 42 bd 10 00 	movl   $0x10bd42,(%esp)
  102633:	e8 d8 e5 ff ff       	call   100c10 <terminal_writestring>
  102638:	83 c4 10             	add    $0x10,%esp
  10263b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102640:	c9                   	leave
  102641:	c3                   	ret
  102642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10264f:	00 

00102650 <dma_channel_free>:
  102650:	55                   	push   %ebp
  102651:	89 e5                	mov    %esp,%ebp
  102653:	8b 45 08             	mov    0x8(%ebp),%eax
  102656:	3c 07                	cmp    $0x7,%al
  102658:	77 2c                	ja     102686 <dma_channel_free+0x36>
  10265a:	3c 04                	cmp    $0x4,%al
  10265c:	74 28                	je     102686 <dma_channel_free+0x36>
  10265e:	19 d2                	sbb    %edx,%edx
  102660:	0f b6 c8             	movzbl %al,%ecx
  102663:	83 e0 03             	and    $0x3,%eax
  102666:	80 e2 36             	and    $0x36,%dl
  102669:	83 c8 04             	or     $0x4,%eax
  10266c:	66 81 c2 d4 00       	add    $0xd4,%dx
  102671:	ee                   	out    %al,(%dx)
  102672:	6b c9 1c             	imul   $0x1c,%ecx,%ecx
  102675:	c7 81 e4 42 11 00 00 	movl   $0x0,0x1142e4(%ecx)
  10267c:	00 00 00 
  10267f:	c6 81 e1 42 11 00 00 	movb   $0x0,0x1142e1(%ecx)
  102686:	5d                   	pop    %ebp
  102687:	c3                   	ret
  102688:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10268f:	00 

00102690 <dma_setup_transfer>:
  102690:	55                   	push   %ebp
  102691:	89 e5                	mov    %esp,%ebp
  102693:	57                   	push   %edi
  102694:	56                   	push   %esi
  102695:	53                   	push   %ebx
  102696:	83 ec 1c             	sub    $0x1c,%esp
  102699:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10269c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10269f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1026a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1026a5:	80 f9 07             	cmp    $0x7,%cl
  1026a8:	0f 87 b2 01 00 00    	ja     102860 <dma_setup_transfer+0x1d0>
  1026ae:	80 f9 04             	cmp    $0x4,%cl
  1026b1:	0f 84 a9 01 00 00    	je     102860 <dma_setup_transfer+0x1d0>
  1026b7:	0f b6 f9             	movzbl %cl,%edi
  1026ba:	6b d7 1c             	imul   $0x1c,%edi,%edx
  1026bd:	8d 82 e0 42 11 00    	lea    0x1142e0(%edx),%eax
  1026c3:	80 ba e1 42 11 00 00 	cmpb   $0x0,0x1142e1(%edx)
  1026ca:	0f 84 90 01 00 00    	je     102860 <dma_setup_transfer+0x1d0>
  1026d0:	81 fb ff ff ff 00    	cmp    $0xffffff,%ebx
  1026d6:	0f 87 94 01 00 00    	ja     102870 <dma_setup_transfer+0x1e0>
  1026dc:	8b 55 10             	mov    0x10(%ebp),%edx
  1026df:	01 da                	add    %ebx,%edx
  1026e1:	81 fa 00 00 00 01    	cmp    $0x1000000,%edx
  1026e7:	0f 87 83 01 00 00    	ja     102870 <dma_setup_transfer+0x1e0>
  1026ed:	8b 75 10             	mov    0x10(%ebp),%esi
  1026f0:	8d 56 ff             	lea    -0x1(%esi),%edx
  1026f3:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  1026f9:	0f 87 46 01 00 00    	ja     102845 <dma_setup_transfer+0x1b5>
  1026ff:	8b 75 10             	mov    0x10(%ebp),%esi
  102702:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
  102706:	89 58 08             	mov    %ebx,0x8(%eax)
  102709:	89 70 0c             	mov    %esi,0xc(%eax)
  10270c:	8b 75 14             	mov    0x14(%ebp),%esi
  10270f:	88 50 18             	mov    %dl,0x18(%eax)
  102712:	89 70 10             	mov    %esi,0x10(%eax)
  102715:	8b 75 18             	mov    0x18(%ebp),%esi
  102718:	89 70 14             	mov    %esi,0x14(%eax)
  10271b:	0f b6 87 00 b2 10 00 	movzbl 0x10b200(%edi),%eax
  102722:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
  102726:	89 c2                	mov    %eax,%edx
  102728:	80 f9 03             	cmp    $0x3,%cl
  10272b:	0f 86 af 00 00 00    	jbe    1027e0 <dma_setup_transfer+0x150>
  102731:	89 ce                	mov    %ecx,%esi
  102733:	83 e6 03             	and    $0x3,%esi
  102736:	89 f0                	mov    %esi,%eax
  102738:	83 c8 04             	or     $0x4,%eax
  10273b:	e6 d4                	out    %al,$0xd4
  10273d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102742:	e6 d8                	out    %al,$0xd8
  102744:	84 d2                	test   %dl,%dl
  102746:	74 1e                	je     102766 <dma_setup_transfer+0xd6>
  102748:	8d 56 60             	lea    0x60(%esi),%edx
  10274b:	0f b6 d2             	movzbl %dl,%edx
  10274e:	01 d2                	add    %edx,%edx
  102750:	e6 d8                	out    %al,$0xd8
  102752:	89 d8                	mov    %ebx,%eax
  102754:	ee                   	out    %al,(%dx)
  102755:	89 d8                	mov    %ebx,%eax
  102757:	66 c1 e8 08          	shr    $0x8,%ax
  10275b:	ee                   	out    %al,(%dx)
  10275c:	89 d8                	mov    %ebx,%eax
  10275e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  102762:	c1 e8 10             	shr    $0x10,%eax
  102765:	ee                   	out    %al,(%dx)
  102766:	8d 5e 61             	lea    0x61(%esi),%ebx
  102769:	ba d8 00 00 00       	mov    $0xd8,%edx
  10276e:	0f b6 db             	movzbl %bl,%ebx
  102771:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  102774:	bb d4 00 00 00       	mov    $0xd4,%ebx
  102779:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
  10277d:	66 89 5d e0          	mov    %bx,-0x20(%ebp)
  102781:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
  102785:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102788:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10278d:	ee                   	out    %al,(%dx)
  10278e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  102792:	89 d8                	mov    %ebx,%eax
  102794:	ee                   	out    %al,(%dx)
  102795:	89 d8                	mov    %ebx,%eax
  102797:	66 c1 e8 08          	shr    $0x8,%ax
  10279b:	ee                   	out    %al,(%dx)
  10279c:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  1027a0:	c1 e0 04             	shl    $0x4,%eax
  1027a3:	0a 45 18             	or     0x18(%ebp),%al
  1027a6:	84 c9                	test   %cl,%cl
  1027a8:	0f 85 82 00 00 00    	jne    102830 <dma_setup_transfer+0x1a0>
  1027ae:	8b 55 14             	mov    0x14(%ebp),%edx
  1027b1:	85 d2                	test   %edx,%edx
  1027b3:	75 7b                	jne    102830 <dma_setup_transfer+0x1a0>
  1027b5:	83 c8 08             	or     $0x8,%eax
  1027b8:	ba 0b 00 00 00       	mov    $0xb,%edx
  1027bd:	09 f0                	or     %esi,%eax
  1027bf:	ee                   	out    %al,(%dx)
  1027c0:	89 f0                	mov    %esi,%eax
  1027c2:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
  1027c6:	ee                   	out    %al,(%dx)
  1027c7:	6b c7 1c             	imul   $0x1c,%edi,%eax
  1027ca:	c7 80 e4 42 11 00 00 	movl   $0x0,0x1142e4(%eax)
  1027d1:	00 00 00 
  1027d4:	31 c0                	xor    %eax,%eax
  1027d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1027d9:	5b                   	pop    %ebx
  1027da:	5e                   	pop    %esi
  1027db:	5f                   	pop    %edi
  1027dc:	5d                   	pop    %ebp
  1027dd:	c3                   	ret
  1027de:	66 90                	xchg   %ax,%ax
  1027e0:	89 c8                	mov    %ecx,%eax
  1027e2:	83 c8 04             	or     $0x4,%eax
  1027e5:	e6 0a                	out    %al,$0xa
  1027e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1027ec:	e6 0c                	out    %al,$0xc
  1027ee:	0f b6 d1             	movzbl %cl,%edx
  1027f1:	8d 34 12             	lea    (%edx,%edx,1),%esi
  1027f4:	66 83 7d e2 00       	cmpw   $0x0,-0x1e(%ebp)
  1027f9:	74 18                	je     102813 <dma_setup_transfer+0x183>
  1027fb:	e6 0c                	out    %al,$0xc
  1027fd:	89 d8                	mov    %ebx,%eax
  1027ff:	89 f2                	mov    %esi,%edx
  102801:	ee                   	out    %al,(%dx)
  102802:	89 d8                	mov    %ebx,%eax
  102804:	66 c1 e8 08          	shr    $0x8,%ax
  102808:	ee                   	out    %al,(%dx)
  102809:	89 d8                	mov    %ebx,%eax
  10280b:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10280f:	c1 e8 10             	shr    $0x10,%eax
  102812:	ee                   	out    %al,(%dx)
  102813:	8d 46 01             	lea    0x1(%esi),%eax
  102816:	ba 0c 00 00 00       	mov    $0xc,%edx
  10281b:	89 ce                	mov    %ecx,%esi
  10281d:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
  102821:	b8 0a 00 00 00       	mov    $0xa,%eax
  102826:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  10282a:	e9 52 ff ff ff       	jmp    102781 <dma_setup_transfer+0xf1>
  10282f:	90                   	nop
  102830:	0a 45 14             	or     0x14(%ebp),%al
  102833:	80 f9 04             	cmp    $0x4,%cl
  102836:	19 d2                	sbb    %edx,%edx
  102838:	80 e2 35             	and    $0x35,%dl
  10283b:	66 81 c2 d6 00       	add    $0xd6,%dx
  102840:	e9 78 ff ff ff       	jmp    1027bd <dma_setup_transfer+0x12d>
  102845:	83 ec 0c             	sub    $0xc,%esp
  102848:	68 e8 cc 10 00       	push   $0x10cce8
  10284d:	e8 be e3 ff ff       	call   100c10 <terminal_writestring>
  102852:	83 c4 10             	add    $0x10,%esp
  102855:	8d 76 00             	lea    0x0(%esi),%esi
  102858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10285f:	00 
  102860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102865:	e9 6c ff ff ff       	jmp    1027d6 <dma_setup_transfer+0x146>
  10286a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102870:	83 ec 0c             	sub    $0xc,%esp
  102873:	68 bc cc 10 00       	push   $0x10ccbc
  102878:	e8 93 e3 ff ff       	call   100c10 <terminal_writestring>
  10287d:	83 c4 10             	add    $0x10,%esp
  102880:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  102885:	e9 4c ff ff ff       	jmp    1027d6 <dma_setup_transfer+0x146>
  10288a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102890 <dma_start_transfer>:
  102890:	55                   	push   %ebp
  102891:	89 e5                	mov    %esp,%ebp
  102893:	8b 45 08             	mov    0x8(%ebp),%eax
  102896:	3c 07                	cmp    $0x7,%al
  102898:	77 36                	ja     1028d0 <dma_start_transfer+0x40>
  10289a:	3c 04                	cmp    $0x4,%al
  10289c:	74 32                	je     1028d0 <dma_start_transfer+0x40>
  10289e:	0f b6 d0             	movzbl %al,%edx
  1028a1:	6b d2 1c             	imul   $0x1c,%edx,%edx
  1028a4:	8d 8a e0 42 11 00    	lea    0x1142e0(%edx),%ecx
  1028aa:	80 ba e1 42 11 00 00 	cmpb   $0x0,0x1142e1(%edx)
  1028b1:	74 1d                	je     1028d0 <dma_start_transfer+0x40>
  1028b3:	3c 04                	cmp    $0x4,%al
  1028b5:	19 d2                	sbb    %edx,%edx
  1028b7:	83 e0 03             	and    $0x3,%eax
  1028ba:	80 e2 36             	and    $0x36,%dl
  1028bd:	66 81 c2 d4 00       	add    $0xd4,%dx
  1028c2:	ee                   	out    %al,(%dx)
  1028c3:	31 c0                	xor    %eax,%eax
  1028c5:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
  1028cc:	5d                   	pop    %ebp
  1028cd:	c3                   	ret
  1028ce:	66 90                	xchg   %ax,%ax
  1028d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1028d5:	5d                   	pop    %ebp
  1028d6:	c3                   	ret
  1028d7:	90                   	nop
  1028d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1028df:	00 

001028e0 <dma_wait_completion>:
  1028e0:	55                   	push   %ebp
  1028e1:	89 e5                	mov    %esp,%ebp
  1028e3:	57                   	push   %edi
  1028e4:	56                   	push   %esi
  1028e5:	53                   	push   %ebx
  1028e6:	83 ec 1c             	sub    $0x1c,%esp
  1028e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1028ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  1028ef:	80 fb 07             	cmp    $0x7,%bl
  1028f2:	0f 87 70 01 00 00    	ja     102a68 <dma_wait_completion+0x188>
  1028f8:	84 db                	test   %bl,%bl
  1028fa:	0f 85 80 00 00 00    	jne    102980 <dma_wait_completion+0xa0>
  102900:	0f b6 05 c0 42 11 00 	movzbl 0x1142c0,%eax
  102907:	84 c0                	test   %al,%al
  102909:	75 5e                	jne    102969 <dma_wait_completion+0x89>
  10290b:	85 f6                	test   %esi,%esi
  10290d:	0f 84 3d 01 00 00    	je     102a50 <dma_wait_completion+0x170>
  102913:	31 d2                	xor    %edx,%edx
  102915:	8d 76 00             	lea    0x0(%esi),%esi
  102918:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10291f:	00 
  102920:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102927:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10292a:	3d 0f 27 00 00       	cmp    $0x270f,%eax
  10292f:	77 22                	ja     102953 <dma_wait_completion+0x73>
  102931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102938:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10293f:	00 
  102940:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102943:	83 c0 01             	add    $0x1,%eax
  102946:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102949:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10294c:	3d 0f 27 00 00       	cmp    $0x270f,%eax
  102951:	76 ed                	jbe    102940 <dma_wait_completion+0x60>
  102953:	83 c2 01             	add    $0x1,%edx
  102956:	39 f2                	cmp    %esi,%edx
  102958:	0f 83 31 01 00 00    	jae    102a8f <dma_wait_completion+0x1af>
  10295e:	0f b6 05 c0 42 11 00 	movzbl 0x1142c0,%eax
  102965:	84 c0                	test   %al,%al
  102967:	74 b7                	je     102920 <dma_wait_completion+0x40>
  102969:	c6 05 c0 42 11 00 00 	movb   $0x0,0x1142c0
  102970:	31 c0                	xor    %eax,%eax
  102972:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102975:	5b                   	pop    %ebx
  102976:	5e                   	pop    %esi
  102977:	5f                   	pop    %edi
  102978:	5d                   	pop    %ebp
  102979:	c3                   	ret
  10297a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102980:	80 fb 04             	cmp    $0x4,%bl
  102983:	89 d9                	mov    %ebx,%ecx
  102985:	b8 01 00 00 00       	mov    $0x1,%eax
  10298a:	19 d2                	sbb    %edx,%edx
  10298c:	83 e1 03             	and    $0x3,%ecx
  10298f:	80 e2 38             	and    $0x38,%dl
  102992:	d3 e0                	shl    %cl,%eax
  102994:	66 81 c2 d0 00       	add    $0xd0,%dx
  102999:	89 c1                	mov    %eax,%ecx
  10299b:	ec                   	in     (%dx),%al
  10299c:	84 c8                	test   %cl,%al
  10299e:	75 5f                	jne    1029ff <dma_wait_completion+0x11f>
  1029a0:	85 f6                	test   %esi,%esi
  1029a2:	74 7a                	je     102a1e <dma_wait_completion+0x13e>
  1029a4:	31 ff                	xor    %edi,%edi
  1029a6:	66 90                	xchg   %ax,%ax
  1029a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029af:	00 
  1029b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1029b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029ba:	3d 0f 27 00 00       	cmp    $0x270f,%eax
  1029bf:	77 32                	ja     1029f3 <dma_wait_completion+0x113>
  1029c1:	eb 1d                	jmp    1029e0 <dma_wait_completion+0x100>
  1029c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029cf:	00 
  1029d0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029d7:	00 
  1029d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029df:	00 
  1029e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029e3:	83 c0 01             	add    $0x1,%eax
  1029e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1029e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029ec:	3d 0f 27 00 00       	cmp    $0x270f,%eax
  1029f1:	76 ed                	jbe    1029e0 <dma_wait_completion+0x100>
  1029f3:	83 c7 01             	add    $0x1,%edi
  1029f6:	39 f7                	cmp    %esi,%edi
  1029f8:	73 78                	jae    102a72 <dma_wait_completion+0x192>
  1029fa:	ec                   	in     (%dx),%al
  1029fb:	84 c8                	test   %cl,%al
  1029fd:	74 b1                	je     1029b0 <dma_wait_completion+0xd0>
  1029ff:	0f b6 db             	movzbl %bl,%ebx
  102a02:	6b db 1c             	imul   $0x1c,%ebx,%ebx
  102a05:	c7 83 e4 42 11 00 02 	movl   $0x2,0x1142e4(%ebx)
  102a0c:	00 00 00 
  102a0f:	e9 5c ff ff ff       	jmp    102970 <dma_wait_completion+0x90>
  102a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102a18:	f4                   	hlt
  102a19:	ec                   	in     (%dx),%al
  102a1a:	84 c8                	test   %cl,%al
  102a1c:	75 e1                	jne    1029ff <dma_wait_completion+0x11f>
  102a1e:	f4                   	hlt
  102a1f:	ec                   	in     (%dx),%al
  102a20:	84 c8                	test   %cl,%al
  102a22:	74 f4                	je     102a18 <dma_wait_completion+0x138>
  102a24:	0f b6 db             	movzbl %bl,%ebx
  102a27:	6b db 1c             	imul   $0x1c,%ebx,%ebx
  102a2a:	c7 83 e4 42 11 00 02 	movl   $0x2,0x1142e4(%ebx)
  102a31:	00 00 00 
  102a34:	e9 37 ff ff ff       	jmp    102970 <dma_wait_completion+0x90>
  102a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102a40:	f4                   	hlt
  102a41:	0f b6 05 c0 42 11 00 	movzbl 0x1142c0,%eax
  102a48:	84 c0                	test   %al,%al
  102a4a:	0f 85 19 ff ff ff    	jne    102969 <dma_wait_completion+0x89>
  102a50:	f4                   	hlt
  102a51:	0f b6 05 c0 42 11 00 	movzbl 0x1142c0,%eax
  102a58:	84 c0                	test   %al,%al
  102a5a:	74 e4                	je     102a40 <dma_wait_completion+0x160>
  102a5c:	c6 05 c0 42 11 00 00 	movb   $0x0,0x1142c0
  102a63:	e9 08 ff ff ff       	jmp    102970 <dma_wait_completion+0x90>
  102a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102a6d:	e9 00 ff ff ff       	jmp    102972 <dma_wait_completion+0x92>
  102a72:	0f b6 c3             	movzbl %bl,%eax
  102a75:	6b c0 1c             	imul   $0x1c,%eax,%eax
  102a78:	c7 80 e4 42 11 00 03 	movl   $0x3,0x1142e4(%eax)
  102a7f:	00 00 00 
  102a82:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102a85:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  102a8a:	5b                   	pop    %ebx
  102a8b:	5e                   	pop    %esi
  102a8c:	5f                   	pop    %edi
  102a8d:	5d                   	pop    %ebp
  102a8e:	c3                   	ret
  102a8f:	83 ec 0c             	sub    $0xc,%esp
  102a92:	68 18 cd 10 00       	push   $0x10cd18
  102a97:	e8 74 e1 ff ff       	call   100c10 <terminal_writestring>
  102a9c:	83 c4 10             	add    $0x10,%esp
  102a9f:	eb e1                	jmp    102a82 <dma_wait_completion+0x1a2>
  102aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102aaf:	00 

00102ab0 <dma_get_channel_state>:
  102ab0:	55                   	push   %ebp
  102ab1:	ba 03 00 00 00       	mov    $0x3,%edx
  102ab6:	89 e5                	mov    %esp,%ebp
  102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  102abb:	3c 07                	cmp    $0x7,%al
  102abd:	77 0c                	ja     102acb <dma_get_channel_state+0x1b>
  102abf:	0f b6 c0             	movzbl %al,%eax
  102ac2:	6b c0 1c             	imul   $0x1c,%eax,%eax
  102ac5:	8b 90 e4 42 11 00    	mov    0x1142e4(%eax),%edx
  102acb:	89 d0                	mov    %edx,%eax
  102acd:	5d                   	pop    %ebp
  102ace:	c3                   	ret
  102acf:	90                   	nop

00102ad0 <dma_stop_transfer>:
  102ad0:	55                   	push   %ebp
  102ad1:	89 e5                	mov    %esp,%ebp
  102ad3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102ad6:	80 f9 07             	cmp    $0x7,%cl
  102ad9:	77 28                	ja     102b03 <dma_stop_transfer+0x33>
  102adb:	80 f9 04             	cmp    $0x4,%cl
  102ade:	74 23                	je     102b03 <dma_stop_transfer+0x33>
  102ae0:	19 d2                	sbb    %edx,%edx
  102ae2:	89 c8                	mov    %ecx,%eax
  102ae4:	80 e2 36             	and    $0x36,%dl
  102ae7:	83 e0 03             	and    $0x3,%eax
  102aea:	66 81 c2 d4 00       	add    $0xd4,%dx
  102aef:	83 c8 04             	or     $0x4,%eax
  102af2:	ee                   	out    %al,(%dx)
  102af3:	0f b6 c9             	movzbl %cl,%ecx
  102af6:	6b c9 1c             	imul   $0x1c,%ecx,%ecx
  102af9:	c7 81 e4 42 11 00 00 	movl   $0x0,0x1142e4(%ecx)
  102b00:	00 00 00 
  102b03:	5d                   	pop    %ebp
  102b04:	c3                   	ret
  102b05:	8d 76 00             	lea    0x0(%esi),%esi
  102b08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102b0f:	00 

00102b10 <dma_memcpy_phys>:
  102b10:	55                   	push   %ebp
  102b11:	89 e5                	mov    %esp,%ebp
  102b13:	57                   	push   %edi
  102b14:	56                   	push   %esi
  102b15:	53                   	push   %ebx
  102b16:	83 ec 2c             	sub    $0x2c,%esp
  102b19:	8b 5d 10             	mov    0x10(%ebp),%ebx
  102b1c:	8b 55 08             	mov    0x8(%ebp),%edx
  102b1f:	8b 75 0c             	mov    0xc(%ebp),%esi
  102b22:	8d 43 ff             	lea    -0x1(%ebx),%eax
  102b25:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
  102b2a:	0f 87 b0 02 00 00    	ja     102de0 <dma_memcpy_phys+0x2d0>
  102b30:	89 f0                	mov    %esi,%eax
  102b32:	09 d0                	or     %edx,%eax
  102b34:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  102b39:	0f 87 3a 02 00 00    	ja     102d79 <dma_memcpy_phys+0x269>
  102b3f:	8d 04 33             	lea    (%ebx,%esi,1),%eax
  102b42:	3d 00 00 00 01       	cmp    $0x1000000,%eax
  102b47:	0f 87 15 02 00 00    	ja     102d62 <dma_memcpy_phys+0x252>
  102b4d:	8d 04 13             	lea    (%ebx,%edx,1),%eax
  102b50:	3d 00 00 00 01       	cmp    $0x1000000,%eax
  102b55:	0f 87 07 02 00 00    	ja     102d62 <dma_memcpy_phys+0x252>
  102b5b:	80 3d e1 42 11 00 00 	cmpb   $0x0,0x1142e1
  102b62:	0f 85 e3 01 00 00    	jne    102d4b <dma_memcpy_phys+0x23b>
  102b68:	80 3d fd 42 11 00 00 	cmpb   $0x0,0x1142fd
  102b6f:	0f 85 d6 01 00 00    	jne    102d4b <dma_memcpy_phys+0x23b>
  102b75:	83 ec 0c             	sub    $0xc,%esp
  102b78:	89 55 08             	mov    %edx,0x8(%ebp)
  102b7b:	8d 7d c8             	lea    -0x38(%ebp),%edi
  102b7e:	68 65 bd 10 00       	push   $0x10bd65
  102b83:	e8 88 e0 ff ff       	call   100c10 <terminal_writestring>
  102b88:	83 c4 0c             	add    $0xc,%esp
  102b8b:	6a 10                	push   $0x10
  102b8d:	57                   	push   %edi
  102b8e:	56                   	push   %esi
  102b8f:	e8 9c dd ff ff       	call   100930 <itoa>
  102b94:	89 3c 24             	mov    %edi,(%esp)
  102b97:	e8 74 e0 ff ff       	call   100c10 <terminal_writestring>
  102b9c:	c7 04 24 7c bd 10 00 	movl   $0x10bd7c,(%esp)
  102ba3:	e8 68 e0 ff ff       	call   100c10 <terminal_writestring>
  102ba8:	8b 55 08             	mov    0x8(%ebp),%edx
  102bab:	83 c4 0c             	add    $0xc,%esp
  102bae:	6a 10                	push   $0x10
  102bb0:	57                   	push   %edi
  102bb1:	52                   	push   %edx
  102bb2:	e8 79 dd ff ff       	call   100930 <itoa>
  102bb7:	89 3c 24             	mov    %edi,(%esp)
  102bba:	e8 51 e0 ff ff       	call   100c10 <terminal_writestring>
  102bbf:	c7 04 24 e8 c0 10 00 	movl   $0x10c0e8,(%esp)
  102bc6:	e8 45 e0 ff ff       	call   100c10 <terminal_writestring>
  102bcb:	83 c4 0c             	add    $0xc,%esp
  102bce:	6a 0a                	push   $0xa
  102bd0:	57                   	push   %edi
  102bd1:	53                   	push   %ebx
  102bd2:	e8 59 dd ff ff       	call   100930 <itoa>
  102bd7:	89 3c 24             	mov    %edi,(%esp)
  102bda:	e8 31 e0 ff ff       	call   100c10 <terminal_writestring>
  102bdf:	c7 04 24 83 bd 10 00 	movl   $0x10bd83,(%esp)
  102be6:	e8 25 e0 ff ff       	call   100c10 <terminal_writestring>
  102beb:	c6 05 e1 42 11 00 01 	movb   $0x1,0x1142e1
  102bf2:	b8 04 00 00 00       	mov    $0x4,%eax
  102bf7:	c6 05 fd 42 11 00 01 	movb   $0x1,0x1142fd
  102bfe:	e6 0a                	out    %al,$0xa
  102c00:	b8 05 00 00 00       	mov    $0x5,%eax
  102c05:	e6 0a                	out    %al,$0xa
  102c07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102c0c:	e6 0c                	out    %al,$0xc
  102c0e:	e6 0c                	out    %al,$0xc
  102c10:	b8 01 00 00 00       	mov    $0x1,%eax
  102c15:	e6 08                	out    %al,$0x8
  102c17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102c1c:	e6 0c                	out    %al,$0xc
  102c1e:	89 f0                	mov    %esi,%eax
  102c20:	e6 00                	out    %al,$0x0
  102c22:	89 f0                	mov    %esi,%eax
  102c24:	66 c1 e8 08          	shr    $0x8,%ax
  102c28:	e6 00                	out    %al,$0x0
  102c2a:	89 f0                	mov    %esi,%eax
  102c2c:	c1 e8 10             	shr    $0x10,%eax
  102c2f:	e6 87                	out    %al,$0x87
  102c31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102c36:	e6 0c                	out    %al,$0xc
  102c38:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  102c3c:	e6 02                	out    %al,$0x2
  102c3e:	0f b7 45 08          	movzwl 0x8(%ebp),%eax
  102c42:	66 c1 e8 08          	shr    $0x8,%ax
  102c46:	e6 02                	out    %al,$0x2
  102c48:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4b:	c1 e8 10             	shr    $0x10,%eax
  102c4e:	e6 83                	out    %al,$0x83
  102c50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102c55:	8d 53 ff             	lea    -0x1(%ebx),%edx
  102c58:	e6 0c                	out    %al,$0xc
  102c5a:	89 d6                	mov    %edx,%esi
  102c5c:	89 d0                	mov    %edx,%eax
  102c5e:	e6 01                	out    %al,$0x1
  102c60:	0f b6 d6             	movzbl %dh,%edx
  102c63:	89 d0                	mov    %edx,%eax
  102c65:	e6 01                	out    %al,$0x1
  102c67:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102c6c:	e6 0c                	out    %al,$0xc
  102c6e:	89 f0                	mov    %esi,%eax
  102c70:	e6 03                	out    %al,$0x3
  102c72:	89 d0                	mov    %edx,%eax
  102c74:	e6 03                	out    %al,$0x3
  102c76:	b8 88 ff ff ff       	mov    $0xffffff88,%eax
  102c7b:	e6 0b                	out    %al,$0xb
  102c7d:	b8 85 ff ff ff       	mov    $0xffffff85,%eax
  102c82:	e6 0b                	out    %al,$0xb
  102c84:	c6 05 c0 42 11 00 00 	movb   $0x0,0x1142c0
  102c8b:	b8 01 00 00 00       	mov    $0x1,%eax
  102c90:	e6 0a                	out    %al,$0xa
  102c92:	31 c0                	xor    %eax,%eax
  102c94:	e6 0a                	out    %al,$0xa
  102c96:	c7 04 24 f8 cd 10 00 	movl   $0x10cdf8,(%esp)
  102c9d:	e8 6e df ff ff       	call   100c10 <terminal_writestring>
  102ca2:	83 c4 10             	add    $0x10,%esp
  102ca5:	b9 40 4b 4c 00       	mov    $0x4c4b40,%ecx
  102caa:	eb 09                	jmp    102cb5 <dma_memcpy_phys+0x1a5>
  102cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102cb0:	83 e9 01             	sub    $0x1,%ecx
  102cb3:	74 57                	je     102d0c <dma_memcpy_phys+0x1fc>
  102cb5:	e4 08                	in     $0x8,%al
  102cb7:	83 e0 01             	and    $0x1,%eax
  102cba:	89 c6                	mov    %eax,%esi
  102cbc:	74 f2                	je     102cb0 <dma_memcpy_phys+0x1a0>
  102cbe:	31 c0                	xor    %eax,%eax
  102cc0:	e6 08                	out    %al,$0x8
  102cc2:	b8 04 00 00 00       	mov    $0x4,%eax
  102cc7:	e6 0a                	out    %al,$0xa
  102cc9:	b8 05 00 00 00       	mov    $0x5,%eax
  102cce:	e6 0a                	out    %al,$0xa
  102cd0:	83 ec 0c             	sub    $0xc,%esp
  102cd3:	c6 05 e1 42 11 00 00 	movb   $0x0,0x1142e1
  102cda:	c6 05 fd 42 11 00 00 	movb   $0x0,0x1142fd
  102ce1:	c7 05 e4 42 11 00 02 	movl   $0x2,0x1142e4
  102ce8:	00 00 00 
  102ceb:	c7 05 00 43 11 00 02 	movl   $0x2,0x114300
  102cf2:	00 00 00 
  102cf5:	68 8b bd 10 00       	push   $0x10bd8b
  102cfa:	e8 11 df ff ff       	call   100c10 <terminal_writestring>
  102cff:	83 c4 10             	add    $0x10,%esp
  102d02:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102d05:	89 d8                	mov    %ebx,%eax
  102d07:	5b                   	pop    %ebx
  102d08:	5e                   	pop    %esi
  102d09:	5f                   	pop    %edi
  102d0a:	5d                   	pop    %ebp
  102d0b:	c3                   	ret
  102d0c:	83 ec 0c             	sub    $0xc,%esp
  102d0f:	68 24 ce 10 00       	push   $0x10ce24
  102d14:	e8 f7 de ff ff       	call   100c10 <terminal_writestring>
  102d19:	b8 04 00 00 00       	mov    $0x4,%eax
  102d1e:	e6 0a                	out    %al,$0xa
  102d20:	b8 05 00 00 00       	mov    $0x5,%eax
  102d25:	e6 0a                	out    %al,$0xa
  102d27:	89 f0                	mov    %esi,%eax
  102d29:	e6 08                	out    %al,$0x8
  102d2b:	c6 05 e1 42 11 00 00 	movb   $0x0,0x1142e1
  102d32:	bb fc ff ff ff       	mov    $0xfffffffc,%ebx
  102d37:	83 c4 10             	add    $0x10,%esp
  102d3a:	c6 05 fd 42 11 00 00 	movb   $0x0,0x1142fd
  102d41:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102d44:	89 d8                	mov    %ebx,%eax
  102d46:	5b                   	pop    %ebx
  102d47:	5e                   	pop    %esi
  102d48:	5f                   	pop    %edi
  102d49:	5d                   	pop    %ebp
  102d4a:	c3                   	ret
  102d4b:	83 ec 0c             	sub    $0xc,%esp
  102d4e:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
  102d53:	68 d0 cd 10 00       	push   $0x10cdd0
  102d58:	e8 b3 de ff ff       	call   100c10 <terminal_writestring>
  102d5d:	83 c4 10             	add    $0x10,%esp
  102d60:	eb a0                	jmp    102d02 <dma_memcpy_phys+0x1f2>
  102d62:	83 ec 0c             	sub    $0xc,%esp
  102d65:	68 9c cd 10 00       	push   $0x10cd9c
  102d6a:	e8 a1 de ff ff       	call   100c10 <terminal_writestring>
  102d6f:	83 c4 10             	add    $0x10,%esp
  102d72:	bb fe ff ff ff       	mov    $0xfffffffe,%ebx
  102d77:	eb 89                	jmp    102d02 <dma_memcpy_phys+0x1f2>
  102d79:	83 ec 0c             	sub    $0xc,%esp
  102d7c:	89 55 08             	mov    %edx,0x8(%ebp)
  102d7f:	8d 5d c8             	lea    -0x38(%ebp),%ebx
  102d82:	68 64 cd 10 00       	push   $0x10cd64
  102d87:	e8 84 de ff ff       	call   100c10 <terminal_writestring>
  102d8c:	c7 04 24 54 bd 10 00 	movl   $0x10bd54,(%esp)
  102d93:	e8 78 de ff ff       	call   100c10 <terminal_writestring>
  102d98:	83 c4 0c             	add    $0xc,%esp
  102d9b:	6a 10                	push   $0x10
  102d9d:	53                   	push   %ebx
  102d9e:	56                   	push   %esi
  102d9f:	e8 8c db ff ff       	call   100930 <itoa>
  102da4:	89 1c 24             	mov    %ebx,(%esp)
  102da7:	e8 64 de ff ff       	call   100c10 <terminal_writestring>
  102dac:	c7 04 24 5d bd 10 00 	movl   $0x10bd5d,(%esp)
  102db3:	e8 58 de ff ff       	call   100c10 <terminal_writestring>
  102db8:	8b 55 08             	mov    0x8(%ebp),%edx
  102dbb:	83 c4 0c             	add    $0xc,%esp
  102dbe:	6a 10                	push   $0x10
  102dc0:	53                   	push   %ebx
  102dc1:	52                   	push   %edx
  102dc2:	e8 69 db ff ff       	call   100930 <itoa>
  102dc7:	89 1c 24             	mov    %ebx,(%esp)
  102dca:	e8 41 de ff ff       	call   100c10 <terminal_writestring>
  102dcf:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  102dd6:	e8 35 de ff ff       	call   100c10 <terminal_writestring>
  102ddb:	83 c4 10             	add    $0x10,%esp
  102dde:	eb 92                	jmp    102d72 <dma_memcpy_phys+0x262>
  102de0:	83 ec 0c             	sub    $0xc,%esp
  102de3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  102de8:	68 38 cd 10 00       	push   $0x10cd38
  102ded:	e8 1e de ff ff       	call   100c10 <terminal_writestring>
  102df2:	83 c4 10             	add    $0x10,%esp
  102df5:	e9 08 ff ff ff       	jmp    102d02 <dma_memcpy_phys+0x1f2>
  102dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102e00 <dma_memcpy>:
  102e00:	e9 0b fd ff ff       	jmp    102b10 <dma_memcpy_phys>
  102e05:	8d 76 00             	lea    0x0(%esi),%esi
  102e08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102e0f:	00 

00102e10 <dma_alloc_buffer>:
  102e10:	55                   	push   %ebp
  102e11:	89 e5                	mov    %esp,%ebp
  102e13:	53                   	push   %ebx
  102e14:	83 ec 14             	sub    $0x14,%esp
  102e17:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1a:	83 c0 0f             	add    $0xf,%eax
  102e1d:	83 e0 f0             	and    $0xfffffff0,%eax
  102e20:	0f 84 8a 00 00 00    	je     102eb0 <dma_alloc_buffer+0xa0>
  102e26:	89 c3                	mov    %eax,%ebx
  102e28:	8d 80 ff 0f 00 00    	lea    0xfff(%eax),%eax
  102e2e:	83 ec 0c             	sub    $0xc,%esp
  102e31:	c1 e8 0c             	shr    $0xc,%eax
  102e34:	50                   	push   %eax
  102e35:	e8 d6 0a 00 00       	call   103910 <alloc_pages>
  102e3a:	83 c4 10             	add    $0x10,%esp
  102e3d:	89 c2                	mov    %eax,%edx
  102e3f:	85 c0                	test   %eax,%eax
  102e41:	74 5d                	je     102ea0 <dma_alloc_buffer+0x90>
  102e43:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  102e48:	77 36                	ja     102e80 <dma_alloc_buffer+0x70>
  102e4a:	f6 45 0c 01          	testb  $0x1,0xc(%ebp)
  102e4e:	75 10                	jne    102e60 <dma_alloc_buffer+0x50>
  102e50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102e53:	89 d0                	mov    %edx,%eax
  102e55:	c9                   	leave
  102e56:	c3                   	ret
  102e57:	90                   	nop
  102e58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102e5f:	00 
  102e60:	83 ec 04             	sub    $0x4,%esp
  102e63:	53                   	push   %ebx
  102e64:	6a 00                	push   $0x0
  102e66:	52                   	push   %edx
  102e67:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102e6a:	e8 31 d6 ff ff       	call   1004a0 <memset>
  102e6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102e75:	83 c4 10             	add    $0x10,%esp
  102e78:	c9                   	leave
  102e79:	89 d0                	mov    %edx,%eax
  102e7b:	c3                   	ret
  102e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102e80:	83 ec 0c             	sub    $0xc,%esp
  102e83:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e86:	68 68 ce 10 00       	push   $0x10ce68
  102e8b:	e8 80 dd ff ff       	call   100c10 <terminal_writestring>
  102e90:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e93:	83 c4 10             	add    $0x10,%esp
  102e96:	f6 45 0c 01          	testb  $0x1,0xc(%ebp)
  102e9a:	74 b4                	je     102e50 <dma_alloc_buffer+0x40>
  102e9c:	eb c2                	jmp    102e60 <dma_alloc_buffer+0x50>
  102e9e:	66 90                	xchg   %ax,%ax
  102ea0:	83 ec 0c             	sub    $0xc,%esp
  102ea3:	68 44 ce 10 00       	push   $0x10ce44
  102ea8:	e8 63 dd ff ff       	call   100c10 <terminal_writestring>
  102ead:	83 c4 10             	add    $0x10,%esp
  102eb0:	31 d2                	xor    %edx,%edx
  102eb2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102eb5:	c9                   	leave
  102eb6:	89 d0                	mov    %edx,%eax
  102eb8:	c3                   	ret
  102eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102ec0 <dma_free_buffer>:
  102ec0:	55                   	push   %ebp
  102ec1:	89 e5                	mov    %esp,%ebp
  102ec3:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec9:	85 d2                	test   %edx,%edx
  102ecb:	74 1b                	je     102ee8 <dma_free_buffer+0x28>
  102ecd:	05 ff 0f 00 00       	add    $0xfff,%eax
  102ed2:	89 55 08             	mov    %edx,0x8(%ebp)
  102ed5:	c1 e8 0c             	shr    $0xc,%eax
  102ed8:	89 45 0c             	mov    %eax,0xc(%ebp)
  102edb:	5d                   	pop    %ebp
  102edc:	e9 bf 0a 00 00       	jmp    1039a0 <free_pages>
  102ee1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102ee8:	5d                   	pop    %ebp
  102ee9:	c3                   	ret
  102eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102ef0 <dma_dump_status>:
  102ef0:	55                   	push   %ebp
  102ef1:	89 e5                	mov    %esp,%ebp
  102ef3:	57                   	push   %edi
  102ef4:	56                   	push   %esi
  102ef5:	53                   	push   %ebx
  102ef6:	83 ec 28             	sub    $0x28,%esp
  102ef9:	68 94 ce 10 00       	push   $0x10ce94
  102efe:	e8 0d dd ff ff       	call   100c10 <terminal_writestring>
  102f03:	e4 08                	in     $0x8,%al
  102f05:	0f b6 d8             	movzbl %al,%ebx
  102f08:	e4 d0                	in     $0xd0,%al
  102f0a:	c7 04 24 a7 bd 10 00 	movl   $0x10bda7,(%esp)
  102f11:	89 c6                	mov    %eax,%esi
  102f13:	8d 7d d8             	lea    -0x28(%ebp),%edi
  102f16:	e8 f5 dc ff ff       	call   100c10 <terminal_writestring>
  102f1b:	83 c4 0c             	add    $0xc,%esp
  102f1e:	6a 10                	push   $0x10
  102f20:	57                   	push   %edi
  102f21:	53                   	push   %ebx
  102f22:	e8 09 da ff ff       	call   100930 <itoa>
  102f27:	89 3c 24             	mov    %edi,(%esp)
  102f2a:	e8 e1 dc ff ff       	call   100c10 <terminal_writestring>
  102f2f:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  102f36:	e8 d5 dc ff ff       	call   100c10 <terminal_writestring>
  102f3b:	c7 04 24 b9 bd 10 00 	movl   $0x10bdb9,(%esp)
  102f42:	e8 c9 dc ff ff       	call   100c10 <terminal_writestring>
  102f47:	89 f0                	mov    %esi,%eax
  102f49:	83 c4 0c             	add    $0xc,%esp
  102f4c:	0f b6 f0             	movzbl %al,%esi
  102f4f:	6a 10                	push   $0x10
  102f51:	57                   	push   %edi
  102f52:	56                   	push   %esi
  102f53:	e8 d8 d9 ff ff       	call   100930 <itoa>
  102f58:	89 3c 24             	mov    %edi,(%esp)
  102f5b:	31 ff                	xor    %edi,%edi
  102f5d:	e8 ae dc ff ff       	call   100c10 <terminal_writestring>
  102f62:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  102f69:	e8 a2 dc ff ff       	call   100c10 <terminal_writestring>
  102f6e:	c7 04 24 cb bd 10 00 	movl   $0x10bdcb,(%esp)
  102f75:	e8 96 dc ff ff       	call   100c10 <terminal_writestring>
  102f7a:	83 c4 10             	add    $0x10,%esp
  102f7d:	89 f8                	mov    %edi,%eax
  102f7f:	ba a5 bd 10 00       	mov    $0x10bda5,%edx
  102f84:	0f a3 c3             	bt     %eax,%ebx
  102f87:	b8 d9 b9 10 00       	mov    $0x10b9d9,%eax
  102f8c:	0f 42 d0             	cmovb  %eax,%edx
  102f8f:	83 ec 0c             	sub    $0xc,%esp
  102f92:	83 c7 01             	add    $0x1,%edi
  102f95:	52                   	push   %edx
  102f96:	e8 75 dc ff ff       	call   100c10 <terminal_writestring>
  102f9b:	83 c4 10             	add    $0x10,%esp
  102f9e:	83 ff 04             	cmp    $0x4,%edi
  102fa1:	75 da                	jne    102f7d <dma_dump_status+0x8d>
  102fa3:	83 ec 0c             	sub    $0xc,%esp
  102fa6:	68 d9 bd 10 00       	push   $0x10bdd9
  102fab:	e8 60 dc ff ff       	call   100c10 <terminal_writestring>
  102fb0:	83 c4 10             	add    $0x10,%esp
  102fb3:	89 f8                	mov    %edi,%eax
  102fb5:	ba a5 bd 10 00       	mov    $0x10bda5,%edx
  102fba:	0f a3 c3             	bt     %eax,%ebx
  102fbd:	b8 d9 b9 10 00       	mov    $0x10b9d9,%eax
  102fc2:	0f 42 d0             	cmovb  %eax,%edx
  102fc5:	83 ec 0c             	sub    $0xc,%esp
  102fc8:	83 c7 01             	add    $0x1,%edi
  102fcb:	52                   	push   %edx
  102fcc:	e8 3f dc ff ff       	call   100c10 <terminal_writestring>
  102fd1:	83 c4 10             	add    $0x10,%esp
  102fd4:	83 ff 08             	cmp    $0x8,%edi
  102fd7:	75 da                	jne    102fb3 <dma_dump_status+0xc3>
  102fd9:	83 ec 0c             	sub    $0xc,%esp
  102fdc:	31 db                	xor    %ebx,%ebx
  102fde:	bf a5 bd 10 00       	mov    $0x10bda5,%edi
  102fe3:	68 a9 bf 10 00       	push   $0x10bfa9
  102fe8:	e8 23 dc ff ff       	call   100c10 <terminal_writestring>
  102fed:	c7 04 24 e5 bd 10 00 	movl   $0x10bde5,(%esp)
  102ff4:	e8 17 dc ff ff       	call   100c10 <terminal_writestring>
  102ff9:	83 c4 10             	add    $0x10,%esp
  102ffc:	0f a3 de             	bt     %ebx,%esi
  102fff:	b8 d9 b9 10 00       	mov    $0x10b9d9,%eax
  103004:	0f 43 c7             	cmovae %edi,%eax
  103007:	83 ec 0c             	sub    $0xc,%esp
  10300a:	83 c3 01             	add    $0x1,%ebx
  10300d:	50                   	push   %eax
  10300e:	e8 fd db ff ff       	call   100c10 <terminal_writestring>
  103013:	83 c4 10             	add    $0x10,%esp
  103016:	83 fb 04             	cmp    $0x4,%ebx
  103019:	75 e1                	jne    102ffc <dma_dump_status+0x10c>
  10301b:	83 ec 0c             	sub    $0xc,%esp
  10301e:	bf a5 bd 10 00       	mov    $0x10bda5,%edi
  103023:	68 d9 bd 10 00       	push   $0x10bdd9
  103028:	e8 e3 db ff ff       	call   100c10 <terminal_writestring>
  10302d:	83 c4 10             	add    $0x10,%esp
  103030:	0f a3 de             	bt     %ebx,%esi
  103033:	b8 d9 b9 10 00       	mov    $0x10b9d9,%eax
  103038:	0f 43 c7             	cmovae %edi,%eax
  10303b:	83 ec 0c             	sub    $0xc,%esp
  10303e:	83 c3 01             	add    $0x1,%ebx
  103041:	50                   	push   %eax
  103042:	e8 c9 db ff ff       	call   100c10 <terminal_writestring>
  103047:	83 c4 10             	add    $0x10,%esp
  10304a:	83 fb 08             	cmp    $0x8,%ebx
  10304d:	75 e1                	jne    103030 <dma_dump_status+0x140>
  10304f:	83 ec 0c             	sub    $0xc,%esp
  103052:	68 a9 bf 10 00       	push   $0x10bfa9
  103057:	e8 b4 db ff ff       	call   100c10 <terminal_writestring>
  10305c:	c7 04 24 f3 bd 10 00 	movl   $0x10bdf3,(%esp)
  103063:	e8 a8 db ff ff       	call   100c10 <terminal_writestring>
  103068:	83 c4 10             	add    $0x10,%esp
  10306b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10306e:	5b                   	pop    %ebx
  10306f:	5e                   	pop    %esi
  103070:	5f                   	pop    %edi
  103071:	5d                   	pop    %ebp
  103072:	c3                   	ret
  103073:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103078:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10307f:	00 

00103080 <dma_dump_channels>:
  103080:	55                   	push   %ebp
  103081:	89 e5                	mov    %esp,%ebp
  103083:	57                   	push   %edi
  103084:	56                   	push   %esi
  103085:	8d 7d d8             	lea    -0x28(%ebp),%edi
  103088:	be e1 42 11 00       	mov    $0x1142e1,%esi
  10308d:	53                   	push   %ebx
  10308e:	31 db                	xor    %ebx,%ebx
  103090:	83 ec 28             	sub    $0x28,%esp
  103093:	68 1b be 10 00       	push   $0x10be1b
  103098:	e8 73 db ff ff       	call   100c10 <terminal_writestring>
  10309d:	c7 04 24 32 be 10 00 	movl   $0x10be32,(%esp)
  1030a4:	e8 67 db ff ff       	call   100c10 <terminal_writestring>
  1030a9:	c7 04 24 4c be 10 00 	movl   $0x10be4c,(%esp)
  1030b0:	e8 5b db ff ff       	call   100c10 <terminal_writestring>
  1030b5:	83 c4 10             	add    $0x10,%esp
  1030b8:	eb 3d                	jmp    1030f7 <dma_dump_channels+0x77>
  1030ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1030c0:	85 c0                	test   %eax,%eax
  1030c2:	0f 84 a8 00 00 00    	je     103170 <dma_dump_channels+0xf0>
  1030c8:	83 ec 0c             	sub    $0xc,%esp
  1030cb:	68 73 be 10 00       	push   $0x10be73
  1030d0:	e8 3b db ff ff       	call   100c10 <terminal_writestring>
  1030d5:	83 c4 10             	add    $0x10,%esp
  1030d8:	83 ec 0c             	sub    $0xc,%esp
  1030db:	83 c3 01             	add    $0x1,%ebx
  1030de:	83 c6 1c             	add    $0x1c,%esi
  1030e1:	68 a9 bf 10 00       	push   $0x10bfa9
  1030e6:	e8 25 db ff ff       	call   100c10 <terminal_writestring>
  1030eb:	83 c4 10             	add    $0x10,%esp
  1030ee:	83 fb 08             	cmp    $0x8,%ebx
  1030f1:	0f 84 91 00 00 00    	je     103188 <dma_dump_channels+0x108>
  1030f7:	83 ec 04             	sub    $0x4,%esp
  1030fa:	6a 0a                	push   $0xa
  1030fc:	57                   	push   %edi
  1030fd:	53                   	push   %ebx
  1030fe:	e8 2d d8 ff ff       	call   100930 <itoa>
  103103:	89 3c 24             	mov    %edi,(%esp)
  103106:	e8 05 db ff ff       	call   100c10 <terminal_writestring>
  10310b:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  103112:	e8 f9 da ff ff       	call   100c10 <terminal_writestring>
  103117:	80 3e 00             	cmpb   $0x0,(%esi)
  10311a:	ba 16 be 10 00       	mov    $0x10be16,%edx
  10311f:	b8 11 be 10 00       	mov    $0x10be11,%eax
  103124:	0f 44 c2             	cmove  %edx,%eax
  103127:	89 04 24             	mov    %eax,(%esp)
  10312a:	e8 e1 da ff ff       	call   100c10 <terminal_writestring>
  10312f:	8b 46 03             	mov    0x3(%esi),%eax
  103132:	83 c4 10             	add    $0x10,%esp
  103135:	83 f8 02             	cmp    $0x2,%eax
  103138:	74 1e                	je     103158 <dma_dump_channels+0xd8>
  10313a:	76 84                	jbe    1030c0 <dma_dump_channels+0x40>
  10313c:	83 f8 03             	cmp    $0x3,%eax
  10313f:	75 97                	jne    1030d8 <dma_dump_channels+0x58>
  103141:	83 ec 0c             	sub    $0xc,%esp
  103144:	68 89 be 10 00       	push   $0x10be89
  103149:	e8 c2 da ff ff       	call   100c10 <terminal_writestring>
  10314e:	83 c4 10             	add    $0x10,%esp
  103151:	eb 85                	jmp    1030d8 <dma_dump_channels+0x58>
  103153:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103158:	83 ec 0c             	sub    $0xc,%esp
  10315b:	68 7e be 10 00       	push   $0x10be7e
  103160:	e8 ab da ff ff       	call   100c10 <terminal_writestring>
  103165:	83 c4 10             	add    $0x10,%esp
  103168:	e9 6b ff ff ff       	jmp    1030d8 <dma_dump_channels+0x58>
  10316d:	8d 76 00             	lea    0x0(%esi),%esi
  103170:	83 ec 0c             	sub    $0xc,%esp
  103173:	68 68 be 10 00       	push   $0x10be68
  103178:	e8 93 da ff ff       	call   100c10 <terminal_writestring>
  10317d:	83 c4 10             	add    $0x10,%esp
  103180:	e9 53 ff ff ff       	jmp    1030d8 <dma_dump_channels+0x58>
  103185:	8d 76 00             	lea    0x0(%esi),%esi
  103188:	83 ec 0c             	sub    $0xc,%esp
  10318b:	68 f7 bd 10 00       	push   $0x10bdf7
  103190:	e8 7b da ff ff       	call   100c10 <terminal_writestring>
  103195:	83 c4 10             	add    $0x10,%esp
  103198:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10319b:	5b                   	pop    %ebx
  10319c:	5e                   	pop    %esi
  10319d:	5f                   	pop    %edi
  10319e:	5d                   	pop    %ebp
  10319f:	c3                   	ret

001031a0 <dma_verify_transfer>:
  1031a0:	55                   	push   %ebp
  1031a1:	89 e5                	mov    %esp,%ebp
  1031a3:	57                   	push   %edi
  1031a4:	56                   	push   %esi
  1031a5:	53                   	push   %ebx
  1031a6:	83 ec 1c             	sub    $0x1c,%esp
  1031a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1031ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  1031af:	85 c0                	test   %eax,%eax
  1031b1:	0f 84 d9 00 00 00    	je     103290 <dma_verify_transfer+0xf0>
  1031b7:	31 db                	xor    %ebx,%ebx
  1031b9:	31 f6                	xor    %esi,%esi
  1031bb:	eb 0e                	jmp    1031cb <dma_verify_transfer+0x2b>
  1031bd:	8d 76 00             	lea    0x0(%esi),%esi
  1031c0:	83 c3 01             	add    $0x1,%ebx
  1031c3:	39 d8                	cmp    %ebx,%eax
  1031c5:	0f 84 bb 00 00 00    	je     103286 <dma_verify_transfer+0xe6>
  1031cb:	8b 7d 08             	mov    0x8(%ebp),%edi
  1031ce:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
  1031d2:	38 0c 1f             	cmp    %cl,(%edi,%ebx,1)
  1031d5:	74 e9                	je     1031c0 <dma_verify_transfer+0x20>
  1031d7:	83 c6 01             	add    $0x1,%esi
  1031da:	83 fe 0a             	cmp    $0xa,%esi
  1031dd:	7f e1                	jg     1031c0 <dma_verify_transfer+0x20>
  1031df:	83 ec 0c             	sub    $0xc,%esp
  1031e2:	89 55 0c             	mov    %edx,0xc(%ebp)
  1031e5:	89 45 10             	mov    %eax,0x10(%ebp)
  1031e8:	68 94 be 10 00       	push   $0x10be94
  1031ed:	e8 1e da ff ff       	call   100c10 <terminal_writestring>
  1031f2:	83 c4 0c             	add    $0xc,%esp
  1031f5:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1031f8:	6a 0a                	push   $0xa
  1031fa:	50                   	push   %eax
  1031fb:	53                   	push   %ebx
  1031fc:	e8 2f d7 ff ff       	call   100930 <itoa>
  103201:	8d 45 d8             	lea    -0x28(%ebp),%eax
  103204:	89 04 24             	mov    %eax,(%esp)
  103207:	e8 04 da ff ff       	call   100c10 <terminal_writestring>
  10320c:	c7 04 24 1d bb 10 00 	movl   $0x10bb1d,(%esp)
  103213:	e8 f8 d9 ff ff       	call   100c10 <terminal_writestring>
  103218:	83 c4 0c             	add    $0xc,%esp
  10321b:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10321e:	6a 10                	push   $0x10
  103220:	50                   	push   %eax
  103221:	8b 45 08             	mov    0x8(%ebp),%eax
  103224:	0f b6 0c 18          	movzbl (%eax,%ebx,1),%ecx
  103228:	51                   	push   %ecx
  103229:	e8 02 d7 ff ff       	call   100930 <itoa>
  10322e:	8d 45 d8             	lea    -0x28(%ebp),%eax
  103231:	89 04 24             	mov    %eax,(%esp)
  103234:	e8 d7 d9 ff ff       	call   100c10 <terminal_writestring>
  103239:	c7 04 24 aa be 10 00 	movl   $0x10beaa,(%esp)
  103240:	e8 cb d9 ff ff       	call   100c10 <terminal_writestring>
  103245:	83 c4 0c             	add    $0xc,%esp
  103248:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10324b:	6a 10                	push   $0x10
  10324d:	50                   	push   %eax
  10324e:	8b 55 0c             	mov    0xc(%ebp),%edx
  103251:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
  103255:	83 c3 01             	add    $0x1,%ebx
  103258:	51                   	push   %ecx
  103259:	e8 d2 d6 ff ff       	call   100930 <itoa>
  10325e:	8d 45 d8             	lea    -0x28(%ebp),%eax
  103261:	89 04 24             	mov    %eax,(%esp)
  103264:	e8 a7 d9 ff ff       	call   100c10 <terminal_writestring>
  103269:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  103270:	e8 9b d9 ff ff       	call   100c10 <terminal_writestring>
  103275:	8b 45 10             	mov    0x10(%ebp),%eax
  103278:	8b 55 0c             	mov    0xc(%ebp),%edx
  10327b:	83 c4 10             	add    $0x10,%esp
  10327e:	39 d8                	cmp    %ebx,%eax
  103280:	0f 85 45 ff ff ff    	jne    1031cb <dma_verify_transfer+0x2b>
  103286:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103289:	89 f0                	mov    %esi,%eax
  10328b:	5b                   	pop    %ebx
  10328c:	5e                   	pop    %esi
  10328d:	5f                   	pop    %edi
  10328e:	5d                   	pop    %ebp
  10328f:	c3                   	ret
  103290:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103293:	31 f6                	xor    %esi,%esi
  103295:	5b                   	pop    %ebx
  103296:	89 f0                	mov    %esi,%eax
  103298:	5e                   	pop    %esi
  103299:	5f                   	pop    %edi
  10329a:	5d                   	pop    %ebp
  10329b:	c3                   	ret
  10329c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001032a0 <dma_demo>:
  1032a0:	55                   	push   %ebp
  1032a1:	89 e5                	mov    %esp,%ebp
  1032a3:	56                   	push   %esi
  1032a4:	53                   	push   %ebx
  1032a5:	83 ec 4c             	sub    $0x4c,%esp
  1032a8:	68 b4 ce 10 00       	push   $0x10ceb4
  1032ad:	e8 5e d9 ff ff       	call   100c10 <terminal_writestring>
  1032b2:	c7 04 24 af be 10 00 	movl   $0x10beaf,(%esp)
  1032b9:	e8 52 d9 ff ff       	call   100c10 <terminal_writestring>
  1032be:	c7 04 24 dc ce 10 00 	movl   $0x10cedc,(%esp)
  1032c5:	e8 46 d9 ff ff       	call   100c10 <terminal_writestring>
  1032ca:	c7 04 24 00 cf 10 00 	movl   $0x10cf00,(%esp)
  1032d1:	e8 3a d9 ff ff       	call   100c10 <terminal_writestring>
  1032d6:	83 c4 10             	add    $0x10,%esp
  1032d9:	b8 00 00 f0 00       	mov    $0xf00000,%eax
  1032de:	66 90                	xchg   %ax,%ax
  1032e0:	88 00                	mov    %al,(%eax)
  1032e2:	8d 50 01             	lea    0x1(%eax),%edx
  1032e5:	83 c0 02             	add    $0x2,%eax
  1032e8:	88 12                	mov    %dl,(%edx)
  1032ea:	3d 00 01 f0 00       	cmp    $0xf00100,%eax
  1032ef:	75 ef                	jne    1032e0 <dma_demo+0x40>
  1032f1:	83 ec 04             	sub    $0x4,%esp
  1032f4:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  1032f7:	be 00 00 f0 00       	mov    $0xf00000,%esi
  1032fc:	68 00 01 00 00       	push   $0x100
  103301:	68 aa 00 00 00       	push   $0xaa
  103306:	68 00 10 f0 00       	push   $0xf01000
  10330b:	e8 90 d1 ff ff       	call   1004a0 <memset>
  103310:	c7 04 24 c7 be 10 00 	movl   $0x10bec7,(%esp)
  103317:	e8 f4 d8 ff ff       	call   100c10 <terminal_writestring>
  10331c:	83 c4 0c             	add    $0xc,%esp
  10331f:	6a 10                	push   $0x10
  103321:	53                   	push   %ebx
  103322:	68 00 00 f0 00       	push   $0xf00000
  103327:	e8 04 d6 ff ff       	call   100930 <itoa>
  10332c:	89 1c 24             	mov    %ebx,(%esp)
  10332f:	e8 dc d8 ff ff       	call   100c10 <terminal_writestring>
  103334:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10333b:	e8 d0 d8 ff ff       	call   100c10 <terminal_writestring>
  103340:	c7 04 24 d4 be 10 00 	movl   $0x10bed4,(%esp)
  103347:	e8 c4 d8 ff ff       	call   100c10 <terminal_writestring>
  10334c:	83 c4 0c             	add    $0xc,%esp
  10334f:	6a 10                	push   $0x10
  103351:	53                   	push   %ebx
  103352:	68 00 10 f0 00       	push   $0xf01000
  103357:	e8 d4 d5 ff ff       	call   100930 <itoa>
  10335c:	89 1c 24             	mov    %ebx,(%esp)
  10335f:	e8 ac d8 ff ff       	call   100c10 <terminal_writestring>
  103364:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10336b:	e8 a0 d8 ff ff       	call   100c10 <terminal_writestring>
  103370:	c7 04 24 28 cf 10 00 	movl   $0x10cf28,(%esp)
  103377:	e8 94 d8 ff ff       	call   100c10 <terminal_writestring>
  10337c:	83 c4 10             	add    $0x10,%esp
  10337f:	eb 2a                	jmp    1033ab <dma_demo+0x10b>
  103381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103388:	83 ec 0c             	sub    $0xc,%esp
  10338b:	83 c6 01             	add    $0x1,%esi
  10338e:	53                   	push   %ebx
  10338f:	e8 7c d8 ff ff       	call   100c10 <terminal_writestring>
  103394:	c7 04 24 a5 b9 10 00 	movl   $0x10b9a5,(%esp)
  10339b:	e8 70 d8 ff ff       	call   100c10 <terminal_writestring>
  1033a0:	83 c4 10             	add    $0x10,%esp
  1033a3:	81 fe 10 00 f0 00    	cmp    $0xf00010,%esi
  1033a9:	74 29                	je     1033d4 <dma_demo+0x134>
  1033ab:	83 ec 04             	sub    $0x4,%esp
  1033ae:	6a 10                	push   $0x10
  1033b0:	53                   	push   %ebx
  1033b1:	0f b6 06             	movzbl (%esi),%eax
  1033b4:	50                   	push   %eax
  1033b5:	e8 76 d5 ff ff       	call   100930 <itoa>
  1033ba:	83 c4 10             	add    $0x10,%esp
  1033bd:	80 3e 0f             	cmpb   $0xf,(%esi)
  1033c0:	77 c6                	ja     103388 <dma_demo+0xe8>
  1033c2:	83 ec 0c             	sub    $0xc,%esp
  1033c5:	68 a5 bd 10 00       	push   $0x10bda5
  1033ca:	e8 41 d8 ff ff       	call   100c10 <terminal_writestring>
  1033cf:	83 c4 10             	add    $0x10,%esp
  1033d2:	eb b4                	jmp    103388 <dma_demo+0xe8>
  1033d4:	83 ec 0c             	sub    $0xc,%esp
  1033d7:	be 00 10 f0 00       	mov    $0xf01000,%esi
  1033dc:	68 a9 bf 10 00       	push   $0x10bfa9
  1033e1:	e8 2a d8 ff ff       	call   100c10 <terminal_writestring>
  1033e6:	c7 04 24 4c cf 10 00 	movl   $0x10cf4c,(%esp)
  1033ed:	e8 1e d8 ff ff       	call   100c10 <terminal_writestring>
  1033f2:	83 c4 10             	add    $0x10,%esp
  1033f5:	eb 2c                	jmp    103423 <dma_demo+0x183>
  1033f7:	90                   	nop
  1033f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1033ff:	00 
  103400:	83 ec 0c             	sub    $0xc,%esp
  103403:	83 c6 01             	add    $0x1,%esi
  103406:	53                   	push   %ebx
  103407:	e8 04 d8 ff ff       	call   100c10 <terminal_writestring>
  10340c:	c7 04 24 a5 b9 10 00 	movl   $0x10b9a5,(%esp)
  103413:	e8 f8 d7 ff ff       	call   100c10 <terminal_writestring>
  103418:	83 c4 10             	add    $0x10,%esp
  10341b:	81 fe 10 10 f0 00    	cmp    $0xf01010,%esi
  103421:	74 29                	je     10344c <dma_demo+0x1ac>
  103423:	83 ec 04             	sub    $0x4,%esp
  103426:	6a 10                	push   $0x10
  103428:	53                   	push   %ebx
  103429:	0f b6 06             	movzbl (%esi),%eax
  10342c:	50                   	push   %eax
  10342d:	e8 fe d4 ff ff       	call   100930 <itoa>
  103432:	83 c4 10             	add    $0x10,%esp
  103435:	80 3e 0f             	cmpb   $0xf,(%esi)
  103438:	77 c6                	ja     103400 <dma_demo+0x160>
  10343a:	83 ec 0c             	sub    $0xc,%esp
  10343d:	68 a5 bd 10 00       	push   $0x10bda5
  103442:	e8 c9 d7 ff ff       	call   100c10 <terminal_writestring>
  103447:	83 c4 10             	add    $0x10,%esp
  10344a:	eb b4                	jmp    103400 <dma_demo+0x160>
  10344c:	83 ec 0c             	sub    $0xc,%esp
  10344f:	68 a9 bf 10 00       	push   $0x10bfa9
  103454:	e8 b7 d7 ff ff       	call   100c10 <terminal_writestring>
  103459:	c7 04 24 e1 be 10 00 	movl   $0x10bee1,(%esp)
  103460:	e8 ab d7 ff ff       	call   100c10 <terminal_writestring>
  103465:	83 c4 0c             	add    $0xc,%esp
  103468:	68 00 01 00 00       	push   $0x100
  10346d:	68 00 00 f0 00       	push   $0xf00000
  103472:	68 00 10 f0 00       	push   $0xf01000
  103477:	e8 94 f6 ff ff       	call   102b10 <dma_memcpy_phys>
  10347c:	83 c4 10             	add    $0x10,%esp
  10347f:	89 c6                	mov    %eax,%esi
  103481:	85 c0                	test   %eax,%eax
  103483:	0f 88 2c 01 00 00    	js     1035b5 <dma_demo+0x315>
  103489:	83 ec 0c             	sub    $0xc,%esp
  10348c:	68 fe be 10 00       	push   $0x10befe
  103491:	e8 7a d7 ff ff       	call   100c10 <terminal_writestring>
  103496:	83 c4 0c             	add    $0xc,%esp
  103499:	6a 0a                	push   $0xa
  10349b:	53                   	push   %ebx
  10349c:	56                   	push   %esi
  10349d:	be 00 10 f0 00       	mov    $0xf01000,%esi
  1034a2:	e8 89 d4 ff ff       	call   100930 <itoa>
  1034a7:	89 1c 24             	mov    %ebx,(%esp)
  1034aa:	e8 61 d7 ff ff       	call   100c10 <terminal_writestring>
  1034af:	c7 04 24 19 bf 10 00 	movl   $0x10bf19,(%esp)
  1034b6:	e8 55 d7 ff ff       	call   100c10 <terminal_writestring>
  1034bb:	c7 04 24 a0 cf 10 00 	movl   $0x10cfa0,(%esp)
  1034c2:	e8 49 d7 ff ff       	call   100c10 <terminal_writestring>
  1034c7:	83 c4 10             	add    $0x10,%esp
  1034ca:	eb 27                	jmp    1034f3 <dma_demo+0x253>
  1034cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1034d0:	83 ec 0c             	sub    $0xc,%esp
  1034d3:	83 c6 01             	add    $0x1,%esi
  1034d6:	53                   	push   %ebx
  1034d7:	e8 34 d7 ff ff       	call   100c10 <terminal_writestring>
  1034dc:	c7 04 24 a5 b9 10 00 	movl   $0x10b9a5,(%esp)
  1034e3:	e8 28 d7 ff ff       	call   100c10 <terminal_writestring>
  1034e8:	83 c4 10             	add    $0x10,%esp
  1034eb:	81 fe 10 10 f0 00    	cmp    $0xf01010,%esi
  1034f1:	74 29                	je     10351c <dma_demo+0x27c>
  1034f3:	83 ec 04             	sub    $0x4,%esp
  1034f6:	6a 10                	push   $0x10
  1034f8:	53                   	push   %ebx
  1034f9:	0f b6 06             	movzbl (%esi),%eax
  1034fc:	50                   	push   %eax
  1034fd:	e8 2e d4 ff ff       	call   100930 <itoa>
  103502:	83 c4 10             	add    $0x10,%esp
  103505:	80 3e 0f             	cmpb   $0xf,(%esi)
  103508:	77 c6                	ja     1034d0 <dma_demo+0x230>
  10350a:	83 ec 0c             	sub    $0xc,%esp
  10350d:	68 a5 bd 10 00       	push   $0x10bda5
  103512:	e8 f9 d6 ff ff       	call   100c10 <terminal_writestring>
  103517:	83 c4 10             	add    $0x10,%esp
  10351a:	eb b4                	jmp    1034d0 <dma_demo+0x230>
  10351c:	83 ec 0c             	sub    $0xc,%esp
  10351f:	68 a9 bf 10 00       	push   $0x10bfa9
  103524:	e8 e7 d6 ff ff       	call   100c10 <terminal_writestring>
  103529:	83 c4 0c             	add    $0xc,%esp
  10352c:	68 00 01 00 00       	push   $0x100
  103531:	68 00 10 f0 00       	push   $0xf01000
  103536:	68 00 00 f0 00       	push   $0xf00000
  10353b:	e8 60 fc ff ff       	call   1031a0 <dma_verify_transfer>
  103540:	83 c4 10             	add    $0x10,%esp
  103543:	89 c6                	mov    %eax,%esi
  103545:	85 c0                	test   %eax,%eax
  103547:	74 5a                	je     1035a3 <dma_demo+0x303>
  103549:	83 ec 0c             	sub    $0xc,%esp
  10354c:	68 fc cf 10 00       	push   $0x10cffc
  103551:	e8 ba d6 ff ff       	call   100c10 <terminal_writestring>
  103556:	83 c4 0c             	add    $0xc,%esp
  103559:	6a 0a                	push   $0xa
  10355b:	53                   	push   %ebx
  10355c:	56                   	push   %esi
  10355d:	e8 ce d3 ff ff       	call   100930 <itoa>
  103562:	89 1c 24             	mov    %ebx,(%esp)
  103565:	e8 a6 d6 ff ff       	call   100c10 <terminal_writestring>
  10356a:	c7 04 24 29 bf 10 00 	movl   $0x10bf29,(%esp)
  103571:	e8 9a d6 ff ff       	call   100c10 <terminal_writestring>
  103576:	83 c4 10             	add    $0x10,%esp
  103579:	83 ec 04             	sub    $0x4,%esp
  10357c:	68 00 01 00 00       	push   $0x100
  103581:	6a 00                	push   $0x0
  103583:	68 00 10 f0 00       	push   $0xf01000
  103588:	e8 13 cf ff ff       	call   1004a0 <memset>
  10358d:	c7 04 24 1c d0 10 00 	movl   $0x10d01c,(%esp)
  103594:	e8 77 d6 ff ff       	call   100c10 <terminal_writestring>
  103599:	83 c4 10             	add    $0x10,%esp
  10359c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10359f:	5b                   	pop    %ebx
  1035a0:	5e                   	pop    %esi
  1035a1:	5d                   	pop    %ebp
  1035a2:	c3                   	ret
  1035a3:	83 ec 0c             	sub    $0xc,%esp
  1035a6:	68 cc cf 10 00       	push   $0x10cfcc
  1035ab:	e8 60 d6 ff ff       	call   100c10 <terminal_writestring>
  1035b0:	83 c4 10             	add    $0x10,%esp
  1035b3:	eb c4                	jmp    103579 <dma_demo+0x2d9>
  1035b5:	83 ec 0c             	sub    $0xc,%esp
  1035b8:	68 78 cf 10 00       	push   $0x10cf78
  1035bd:	e8 4e d6 ff ff       	call   100c10 <terminal_writestring>
  1035c2:	83 c4 0c             	add    $0xc,%esp
  1035c5:	6a 0a                	push   $0xa
  1035c7:	53                   	push   %ebx
  1035c8:	56                   	push   %esi
  1035c9:	e8 62 d3 ff ff       	call   100930 <itoa>
  1035ce:	89 1c 24             	mov    %ebx,(%esp)
  1035d1:	e8 3a d6 ff ff       	call   100c10 <terminal_writestring>
  1035d6:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1035dd:	e8 2e d6 ff ff       	call   100c10 <terminal_writestring>
  1035e2:	83 c4 10             	add    $0x10,%esp
  1035e5:	eb 92                	jmp    103579 <dma_demo+0x2d9>
  1035e7:	66 90                	xchg   %ax,%ax
  1035e9:	66 90                	xchg   %ax,%ax
  1035eb:	66 90                	xchg   %ax,%ax
  1035ed:	66 90                	xchg   %ax,%ax
  1035ef:	66 90                	xchg   %ax,%ax
  1035f1:	66 90                	xchg   %ax,%ax
  1035f3:	66 90                	xchg   %ax,%ax
  1035f5:	66 90                	xchg   %ax,%ax
  1035f7:	66 90                	xchg   %ax,%ax
  1035f9:	66 90                	xchg   %ax,%ax
  1035fb:	66 90                	xchg   %ax,%ax
  1035fd:	66 90                	xchg   %ax,%ax
  1035ff:	90                   	nop

00103600 <buddy_free_pages.part.0>:
  103600:	55                   	push   %ebp
  103601:	89 e5                	mov    %esp,%ebp
  103603:	57                   	push   %edi
  103604:	56                   	push   %esi
  103605:	53                   	push   %ebx
  103606:	89 c3                	mov    %eax,%ebx
  103608:	89 d0                	mov    %edx,%eax
  10360a:	ba 01 00 00 00       	mov    $0x1,%edx
  10360f:	89 c1                	mov    %eax,%ecx
  103611:	d3 e2                	shl    %cl,%edx
  103613:	89 d9                	mov    %ebx,%ecx
  103615:	89 d6                	mov    %edx,%esi
  103617:	83 ec 08             	sub    $0x8,%esp
  10361a:	89 5d ec             	mov    %ebx,-0x14(%ebp)
  10361d:	8b 15 30 45 13 00    	mov    0x134530,%edx
  103623:	89 75 f0             	mov    %esi,-0x10(%ebp)
  103626:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
  103629:	eb 0c                	jmp    103637 <buddy_free_pages.part.0+0x37>
  10362b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103630:	83 c1 01             	add    $0x1,%ecx
  103633:	39 f9                	cmp    %edi,%ecx
  103635:	74 29                	je     103660 <buddy_free_pages.part.0+0x60>
  103637:	39 d1                	cmp    %edx,%ecx
  103639:	73 f5                	jae    103630 <buddy_free_pages.part.0+0x30>
  10363b:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
  103641:	77 ed                	ja     103630 <buddy_free_pages.part.0+0x30>
  103643:	89 cb                	mov    %ecx,%ebx
  103645:	be 01 00 00 00       	mov    $0x1,%esi
  10364a:	d3 e6                	shl    %cl,%esi
  10364c:	c1 eb 05             	shr    $0x5,%ebx
  10364f:	83 c1 01             	add    $0x1,%ecx
  103652:	f7 d6                	not    %esi
  103654:	21 34 9d 00 45 11 00 	and    %esi,0x114500(,%ebx,4)
  10365b:	39 f9                	cmp    %edi,%ecx
  10365d:	75 d8                	jne    103637 <buddy_free_pages.part.0+0x37>
  10365f:	90                   	nop
  103660:	8b 75 f0             	mov    -0x10(%ebp),%esi
  103663:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  103666:	29 35 2c 45 13 00    	sub    %esi,0x13452c
  10366c:	83 f8 0a             	cmp    $0xa,%eax
  10366f:	75 41                	jne    1036b2 <buddy_free_pages.part.0+0xb2>
  103671:	eb 7d                	jmp    1036f0 <buddy_free_pages.part.0+0xf0>
  103673:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103678:	89 37                	mov    %esi,(%edi)
  10367a:	85 f6                	test   %esi,%esi
  10367c:	74 0e                	je     10368c <buddy_free_pages.part.0+0x8c>
  10367e:	89 cf                	mov    %ecx,%edi
  103680:	c1 e7 04             	shl    $0x4,%edi
  103683:	8b bf 44 45 13 00    	mov    0x134544(%edi),%edi
  103689:	89 7e 04             	mov    %edi,0x4(%esi)
  10368c:	89 ce                	mov    %ecx,%esi
  10368e:	c1 e6 04             	shl    $0x4,%esi
  103691:	39 cb                	cmp    %ecx,%ebx
  103693:	c7 86 40 45 13 00 00 	movl   $0x0,0x134540(%esi)
  10369a:	00 00 00 
  10369d:	0f 47 d9             	cmova  %ecx,%ebx
  1036a0:	83 c0 01             	add    $0x1,%eax
  1036a3:	c7 86 44 45 13 00 00 	movl   $0x0,0x134544(%esi)
  1036aa:	00 00 00 
  1036ad:	83 f8 0a             	cmp    $0xa,%eax
  1036b0:	74 3e                	je     1036f0 <buddy_free_pages.part.0+0xf0>
  1036b2:	89 d9                	mov    %ebx,%ecx
  1036b4:	0f bb c1             	btc    %eax,%ecx
  1036b7:	39 d1                	cmp    %edx,%ecx
  1036b9:	73 35                	jae    1036f0 <buddy_free_pages.part.0+0xf0>
  1036bb:	89 ce                	mov    %ecx,%esi
  1036bd:	c1 e6 04             	shl    $0x4,%esi
  1036c0:	80 be 4c 45 13 00 00 	cmpb   $0x0,0x13454c(%esi)
  1036c7:	75 27                	jne    1036f0 <buddy_free_pages.part.0+0xf0>
  1036c9:	39 86 48 45 13 00    	cmp    %eax,0x134548(%esi)
  1036cf:	75 1f                	jne    1036f0 <buddy_free_pages.part.0+0xf0>
  1036d1:	8b be 44 45 13 00    	mov    0x134544(%esi),%edi
  1036d7:	8b b6 40 45 13 00    	mov    0x134540(%esi),%esi
  1036dd:	85 ff                	test   %edi,%edi
  1036df:	75 97                	jne    103678 <buddy_free_pages.part.0+0x78>
  1036e1:	89 34 85 00 45 13 00 	mov    %esi,0x134500(,%eax,4)
  1036e8:	eb 90                	jmp    10367a <buddy_free_pages.part.0+0x7a>
  1036ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1036f0:	c1 e3 04             	shl    $0x4,%ebx
  1036f3:	8b 0c 85 00 45 13 00 	mov    0x134500(,%eax,4),%ecx
  1036fa:	8d 93 40 45 13 00    	lea    0x134540(%ebx),%edx
  103700:	89 42 08             	mov    %eax,0x8(%edx)
  103703:	c6 42 0c 00          	movb   $0x0,0xc(%edx)
  103707:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
  10370e:	89 8b 40 45 13 00    	mov    %ecx,0x134540(%ebx)
  103714:	85 c9                	test   %ecx,%ecx
  103716:	74 03                	je     10371b <buddy_free_pages.part.0+0x11b>
  103718:	89 51 04             	mov    %edx,0x4(%ecx)
  10371b:	89 14 85 00 45 13 00 	mov    %edx,0x134500(,%eax,4)
  103722:	83 c4 08             	add    $0x8,%esp
  103725:	5b                   	pop    %ebx
  103726:	5e                   	pop    %esi
  103727:	5f                   	pop    %edi
  103728:	5d                   	pop    %ebp
  103729:	c3                   	ret
  10372a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103730 <buddy_alloc_pages.part.0>:
  103730:	55                   	push   %ebp
  103731:	89 c1                	mov    %eax,%ecx
  103733:	89 e5                	mov    %esp,%ebp
  103735:	57                   	push   %edi
  103736:	89 c7                	mov    %eax,%edi
  103738:	56                   	push   %esi
  103739:	53                   	push   %ebx
  10373a:	83 ec 08             	sub    $0x8,%esp
  10373d:	8d 76 00             	lea    0x0(%esi),%esi
  103740:	8b 04 8d 00 45 13 00 	mov    0x134500(,%ecx,4),%eax
  103747:	85 c0                	test   %eax,%eax
  103749:	75 1d                	jne    103768 <buddy_alloc_pages.part.0+0x38>
  10374b:	83 c1 01             	add    $0x1,%ecx
  10374e:	83 f9 0b             	cmp    $0xb,%ecx
  103751:	75 ed                	jne    103740 <buddy_alloc_pages.part.0+0x10>
  103753:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  10375a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10375d:	83 c4 08             	add    $0x8,%esp
  103760:	5b                   	pop    %ebx
  103761:	5e                   	pop    %esi
  103762:	5f                   	pop    %edi
  103763:	5d                   	pop    %ebp
  103764:	c3                   	ret
  103765:	8d 76 00             	lea    0x0(%esi),%esi
  103768:	8b 1c 8d 00 45 13 00 	mov    0x134500(,%ecx,4),%ebx
  10376f:	8b 53 04             	mov    0x4(%ebx),%edx
  103772:	8b 03                	mov    (%ebx),%eax
  103774:	85 d2                	test   %edx,%edx
  103776:	0f 84 fc 00 00 00    	je     103878 <buddy_alloc_pages.part.0+0x148>
  10377c:	89 02                	mov    %eax,(%edx)
  10377e:	85 c0                	test   %eax,%eax
  103780:	74 03                	je     103785 <buddy_alloc_pages.part.0+0x55>
  103782:	89 50 04             	mov    %edx,0x4(%eax)
  103785:	89 d8                	mov    %ebx,%eax
  103787:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  10378d:	2d 40 45 13 00       	sub    $0x134540,%eax
  103792:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  103799:	c1 f8 04             	sar    $0x4,%eax
  10379c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10379f:	39 cf                	cmp    %ecx,%edi
  1037a1:	73 52                	jae    1037f5 <buddy_alloc_pages.part.0+0xc5>
  1037a3:	89 5d ec             	mov    %ebx,-0x14(%ebp)
  1037a6:	66 90                	xchg   %ax,%ax
  1037a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1037af:	00 
  1037b0:	83 e9 01             	sub    $0x1,%ecx
  1037b3:	ba 01 00 00 00       	mov    $0x1,%edx
  1037b8:	d3 e2                	shl    %cl,%edx
  1037ba:	8b 34 8d 00 45 13 00 	mov    0x134500(,%ecx,4),%esi
  1037c1:	01 c2                	add    %eax,%edx
  1037c3:	c1 e2 04             	shl    $0x4,%edx
  1037c6:	8d 9a 40 45 13 00    	lea    0x134540(%edx),%ebx
  1037cc:	89 b2 40 45 13 00    	mov    %esi,0x134540(%edx)
  1037d2:	89 4b 08             	mov    %ecx,0x8(%ebx)
  1037d5:	c6 43 0c 00          	movb   $0x0,0xc(%ebx)
  1037d9:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  1037e0:	85 f6                	test   %esi,%esi
  1037e2:	74 03                	je     1037e7 <buddy_alloc_pages.part.0+0xb7>
  1037e4:	89 5e 04             	mov    %ebx,0x4(%esi)
  1037e7:	89 1c 8d 00 45 13 00 	mov    %ebx,0x134500(,%ecx,4)
  1037ee:	39 f9                	cmp    %edi,%ecx
  1037f0:	75 be                	jne    1037b0 <buddy_alloc_pages.part.0+0x80>
  1037f2:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  1037f5:	89 f9                	mov    %edi,%ecx
  1037f7:	be 01 00 00 00       	mov    $0x1,%esi
  1037fc:	c6 43 0c 01          	movb   $0x1,0xc(%ebx)
  103800:	89 7b 08             	mov    %edi,0x8(%ebx)
  103803:	d3 e6                	shl    %cl,%esi
  103805:	89 c1                	mov    %eax,%ecx
  103807:	8d 14 06             	lea    (%esi,%eax,1),%edx
  10380a:	eb 34                	jmp    103840 <buddy_alloc_pages.part.0+0x110>
  10380c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103810:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103817:	00 
  103818:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10381f:	00 
  103820:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103827:	00 
  103828:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10382f:	00 
  103830:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103837:	00 
  103838:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10383f:	00 
  103840:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
  103846:	77 13                	ja     10385b <buddy_alloc_pages.part.0+0x12b>
  103848:	89 c8                	mov    %ecx,%eax
  10384a:	bf 01 00 00 00       	mov    $0x1,%edi
  10384f:	c1 e8 05             	shr    $0x5,%eax
  103852:	d3 e7                	shl    %cl,%edi
  103854:	09 3c 85 00 45 11 00 	or     %edi,0x114500(,%eax,4)
  10385b:	83 c1 01             	add    $0x1,%ecx
  10385e:	39 ca                	cmp    %ecx,%edx
  103860:	75 de                	jne    103840 <buddy_alloc_pages.part.0+0x110>
  103862:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103865:	01 35 2c 45 13 00    	add    %esi,0x13452c
  10386b:	83 c4 08             	add    $0x8,%esp
  10386e:	5b                   	pop    %ebx
  10386f:	5e                   	pop    %esi
  103870:	5f                   	pop    %edi
  103871:	5d                   	pop    %ebp
  103872:	c3                   	ret
  103873:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103878:	89 04 8d 00 45 13 00 	mov    %eax,0x134500(,%ecx,4)
  10387f:	e9 fa fe ff ff       	jmp    10377e <buddy_alloc_pages.part.0+0x4e>
  103884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103888:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10388f:	00 

00103890 <alloc_page>:
  103890:	55                   	push   %ebp
  103891:	31 c0                	xor    %eax,%eax
  103893:	89 e5                	mov    %esp,%ebp
  103895:	53                   	push   %ebx
  103896:	83 ec 04             	sub    $0x4,%esp
  103899:	e8 92 fe ff ff       	call   103730 <buddy_alloc_pages.part.0>
  10389e:	83 f8 ff             	cmp    $0xffffffff,%eax
  1038a1:	74 25                	je     1038c8 <alloc_page+0x38>
  1038a3:	83 ec 04             	sub    $0x4,%esp
  1038a6:	c1 e0 0c             	shl    $0xc,%eax
  1038a9:	68 00 10 00 00       	push   $0x1000
  1038ae:	89 c3                	mov    %eax,%ebx
  1038b0:	6a 00                	push   $0x0
  1038b2:	50                   	push   %eax
  1038b3:	e8 e8 cb ff ff       	call   1004a0 <memset>
  1038b8:	83 c4 10             	add    $0x10,%esp
  1038bb:	89 d8                	mov    %ebx,%eax
  1038bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1038c0:	c9                   	leave
  1038c1:	c3                   	ret
  1038c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1038c8:	83 ec 0c             	sub    $0xc,%esp
  1038cb:	31 db                	xor    %ebx,%ebx
  1038cd:	68 38 bf 10 00       	push   $0x10bf38
  1038d2:	e8 39 d3 ff ff       	call   100c10 <terminal_writestring>
  1038d7:	83 c4 10             	add    $0x10,%esp
  1038da:	eb df                	jmp    1038bb <alloc_page+0x2b>
  1038dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001038e0 <free_page>:
  1038e0:	55                   	push   %ebp
  1038e1:	89 e5                	mov    %esp,%ebp
  1038e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1038e6:	85 c0                	test   %eax,%eax
  1038e8:	74 0b                	je     1038f5 <free_page+0x15>
  1038ea:	c1 e8 0c             	shr    $0xc,%eax
  1038ed:	3b 05 30 45 13 00    	cmp    0x134530,%eax
  1038f3:	72 0b                	jb     103900 <free_page+0x20>
  1038f5:	5d                   	pop    %ebp
  1038f6:	c3                   	ret
  1038f7:	90                   	nop
  1038f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1038ff:	00 
  103900:	31 d2                	xor    %edx,%edx
  103902:	5d                   	pop    %ebp
  103903:	e9 f8 fc ff ff       	jmp    103600 <buddy_free_pages.part.0>
  103908:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10390f:	00 

00103910 <alloc_pages>:
  103910:	55                   	push   %ebp
  103911:	89 e5                	mov    %esp,%ebp
  103913:	83 ec 18             	sub    $0x18,%esp
  103916:	8b 4d 08             	mov    0x8(%ebp),%ecx
  103919:	85 c9                	test   %ecx,%ecx
  10391b:	74 31                	je     10394e <alloc_pages+0x3e>
  10391d:	ba 01 00 00 00       	mov    $0x1,%edx
  103922:	31 c0                	xor    %eax,%eax
  103924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103928:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10392f:	00 
  103930:	39 ca                	cmp    %ecx,%edx
  103932:	73 24                	jae    103958 <alloc_pages+0x48>
  103934:	83 c0 01             	add    $0x1,%eax
  103937:	01 d2                	add    %edx,%edx
  103939:	83 f8 0b             	cmp    $0xb,%eax
  10393c:	75 f2                	jne    103930 <alloc_pages+0x20>
  10393e:	83 ec 0c             	sub    $0xc,%esp
  103941:	68 44 d0 10 00       	push   $0x10d044
  103946:	e8 c5 d2 ff ff       	call   100c10 <terminal_writestring>
  10394b:	83 c4 10             	add    $0x10,%esp
  10394e:	c9                   	leave
  10394f:	31 d2                	xor    %edx,%edx
  103951:	89 d0                	mov    %edx,%eax
  103953:	c3                   	ret
  103954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103958:	89 4d 08             	mov    %ecx,0x8(%ebp)
  10395b:	e8 d0 fd ff ff       	call   103730 <buddy_alloc_pages.part.0>
  103960:	8b 4d 08             	mov    0x8(%ebp),%ecx
  103963:	83 f8 ff             	cmp    $0xffffffff,%eax
  103966:	74 1f                	je     103987 <alloc_pages+0x77>
  103968:	c1 e0 0c             	shl    $0xc,%eax
  10396b:	83 ec 04             	sub    $0x4,%esp
  10396e:	c1 e1 0c             	shl    $0xc,%ecx
  103971:	51                   	push   %ecx
  103972:	6a 00                	push   $0x0
  103974:	50                   	push   %eax
  103975:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103978:	e8 23 cb ff ff       	call   1004a0 <memset>
  10397d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103980:	83 c4 10             	add    $0x10,%esp
  103983:	c9                   	leave
  103984:	89 d0                	mov    %edx,%eax
  103986:	c3                   	ret
  103987:	83 ec 0c             	sub    $0xc,%esp
  10398a:	68 54 bf 10 00       	push   $0x10bf54
  10398f:	e8 7c d2 ff ff       	call   100c10 <terminal_writestring>
  103994:	83 c4 10             	add    $0x10,%esp
  103997:	eb b5                	jmp    10394e <alloc_pages+0x3e>
  103999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001039a0 <free_pages>:
  1039a0:	55                   	push   %ebp
  1039a1:	89 e5                	mov    %esp,%ebp
  1039a3:	53                   	push   %ebx
  1039a4:	8b 55 08             	mov    0x8(%ebp),%edx
  1039a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039aa:	85 d2                	test   %edx,%edx
  1039ac:	74 42                	je     1039f0 <free_pages+0x50>
  1039ae:	85 c0                	test   %eax,%eax
  1039b0:	74 3e                	je     1039f0 <free_pages+0x50>
  1039b2:	89 d3                	mov    %edx,%ebx
  1039b4:	c1 eb 0c             	shr    $0xc,%ebx
  1039b7:	3b 1d 30 45 13 00    	cmp    0x134530,%ebx
  1039bd:	73 31                	jae    1039f0 <free_pages+0x50>
  1039bf:	83 f8 01             	cmp    $0x1,%eax
  1039c2:	74 34                	je     1039f8 <free_pages+0x58>
  1039c4:	ba 01 00 00 00       	mov    $0x1,%edx
  1039c9:	31 c9                	xor    %ecx,%ecx
  1039cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1039d0:	01 d2                	add    %edx,%edx
  1039d2:	83 c1 01             	add    $0x1,%ecx
  1039d5:	39 c2                	cmp    %eax,%edx
  1039d7:	72 f7                	jb     1039d0 <free_pages+0x30>
  1039d9:	83 f9 0a             	cmp    $0xa,%ecx
  1039dc:	77 12                	ja     1039f0 <free_pages+0x50>
  1039de:	89 d8                	mov    %ebx,%eax
  1039e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1039e3:	89 ca                	mov    %ecx,%edx
  1039e5:	c9                   	leave
  1039e6:	e9 15 fc ff ff       	jmp    103600 <buddy_free_pages.part.0>
  1039eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1039f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1039f3:	c9                   	leave
  1039f4:	c3                   	ret
  1039f5:	8d 76 00             	lea    0x0(%esi),%esi
  1039f8:	31 c9                	xor    %ecx,%ecx
  1039fa:	eb e2                	jmp    1039de <free_pages+0x3e>
  1039fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103a00 <slab_alloc>:
  103a00:	55                   	push   %ebp
  103a01:	89 e5                	mov    %esp,%ebp
  103a03:	57                   	push   %edi
  103a04:	56                   	push   %esi
  103a05:	53                   	push   %ebx
  103a06:	83 ec 1c             	sub    $0x1c,%esp
  103a09:	8b 45 08             	mov    0x8(%ebp),%eax
  103a0c:	85 c0                	test   %eax,%eax
  103a0e:	74 21                	je     103a31 <slab_alloc+0x31>
  103a10:	31 c9                	xor    %ecx,%ecx
  103a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103a18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103a1f:	00 
  103a20:	39 04 8d 20 b2 10 00 	cmp    %eax,0x10b220(,%ecx,4)
  103a27:	73 17                	jae    103a40 <slab_alloc+0x40>
  103a29:	83 c1 01             	add    $0x1,%ecx
  103a2c:	83 f9 09             	cmp    $0x9,%ecx
  103a2f:	75 ef                	jne    103a20 <slab_alloc+0x20>
  103a31:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103a34:	31 d2                	xor    %edx,%edx
  103a36:	5b                   	pop    %ebx
  103a37:	89 d0                	mov    %edx,%eax
  103a39:	5e                   	pop    %esi
  103a3a:	5f                   	pop    %edi
  103a3b:	5d                   	pop    %ebp
  103a3c:	c3                   	ret
  103a3d:	8d 76 00             	lea    0x0(%esi),%esi
  103a40:	6b c1 1c             	imul   $0x1c,%ecx,%eax
  103a43:	80 b8 f8 43 11 00 00 	cmpb   $0x0,0x1143f8(%eax)
  103a4a:	0f 85 00 01 00 00    	jne    103b50 <slab_alloc+0x150>
  103a50:	89 c2                	mov    %eax,%edx
  103a52:	c1 fa 02             	sar    $0x2,%edx
  103a55:	69 d2 b7 6d db b6    	imul   $0xb6db6db7,%edx,%edx
  103a5b:	8b 3c 95 20 b2 10 00 	mov    0x10b220(,%edx,4),%edi
  103a62:	89 b8 e0 43 11 00    	mov    %edi,0x1143e0(%eax)
  103a68:	b8 01 00 00 00       	mov    $0x1,%eax
  103a6d:	81 ff fc 0f 00 00    	cmp    $0xffc,%edi
  103a73:	77 09                	ja     103a7e <slab_alloc+0x7e>
  103a75:	b8 fc 0f 00 00       	mov    $0xffc,%eax
  103a7a:	31 d2                	xor    %edx,%edx
  103a7c:	f7 f7                	div    %edi
  103a7e:	6b d1 1c             	imul   $0x1c,%ecx,%edx
  103a81:	89 82 e4 43 11 00    	mov    %eax,0x1143e4(%edx)
  103a87:	c7 82 e8 43 11 00 00 	movl   $0x0,0x1143e8(%edx)
  103a8e:	00 00 00 
  103a91:	c7 82 ec 43 11 00 00 	movl   $0x0,0x1143ec(%edx)
  103a98:	00 00 00 
  103a9b:	c7 82 f0 43 11 00 00 	movl   $0x0,0x1143f0(%edx)
  103aa2:	00 00 00 
  103aa5:	c7 82 f4 43 11 00 00 	movl   $0x0,0x1143f4(%edx)
  103aac:	00 00 00 
  103aaf:	c6 82 f8 43 11 00 01 	movb   $0x1,0x1143f8(%edx)
  103ab6:	31 c0                	xor    %eax,%eax
  103ab8:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  103abb:	e8 70 fc ff ff       	call   103730 <buddy_alloc_pages.part.0>
  103ac0:	83 f8 ff             	cmp    $0xffffffff,%eax
  103ac3:	0f 84 ca 00 00 00    	je     103b93 <slab_alloc+0x193>
  103ac9:	83 ec 04             	sub    $0x4,%esp
  103acc:	c1 e0 0c             	shl    $0xc,%eax
  103acf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103ad2:	89 c3                	mov    %eax,%ebx
  103ad4:	68 00 10 00 00       	push   $0x1000
  103ad9:	6a 00                	push   $0x0
  103adb:	50                   	push   %eax
  103adc:	e8 bf c9 ff ff       	call   1004a0 <memset>
  103ae1:	83 c4 10             	add    $0x10,%esp
  103ae4:	89 da                	mov    %ebx,%edx
  103ae6:	85 db                	test   %ebx,%ebx
  103ae8:	0f 84 b5 00 00 00    	je     103ba3 <slab_alloc+0x1a3>
  103aee:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  103af1:	6b c1 1c             	imul   $0x1c,%ecx,%eax
  103af4:	8b 98 e4 43 11 00    	mov    0x1143e4(%eax),%ebx
  103afa:	89 de                	mov    %ebx,%esi
  103afc:	85 db                	test   %ebx,%ebx
  103afe:	74 34                	je     103b34 <slab_alloc+0x134>
  103b00:	8b b8 e0 43 11 00    	mov    0x1143e0(%eax),%edi
  103b06:	8b 98 e8 43 11 00    	mov    0x1143e8(%eax),%ebx
  103b0c:	89 d0                	mov    %edx,%eax
  103b0e:	31 d2                	xor    %edx,%edx
  103b10:	89 d9                	mov    %ebx,%ecx
  103b12:	83 c2 01             	add    $0x1,%edx
  103b15:	89 c3                	mov    %eax,%ebx
  103b17:	89 08                	mov    %ecx,(%eax)
  103b19:	01 f8                	add    %edi,%eax
  103b1b:	39 d6                	cmp    %edx,%esi
  103b1d:	75 f1                	jne    103b10 <slab_alloc+0x110>
  103b1f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  103b22:	8d 46 ff             	lea    -0x1(%esi),%eax
  103b25:	0f af c7             	imul   %edi,%eax
  103b28:	03 45 e0             	add    -0x20(%ebp),%eax
  103b2b:	6b d1 1c             	imul   $0x1c,%ecx,%edx
  103b2e:	89 82 e8 43 11 00    	mov    %eax,0x1143e8(%edx)
  103b34:	6b c1 1c             	imul   $0x1c,%ecx,%eax
  103b37:	01 b0 ec 43 11 00    	add    %esi,0x1143ec(%eax)
  103b3d:	8b 90 e8 43 11 00    	mov    0x1143e8(%eax),%edx
  103b43:	83 80 f4 43 11 00 01 	addl   $0x1,0x1143f4(%eax)
  103b4a:	eb 12                	jmp    103b5e <slab_alloc+0x15e>
  103b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103b50:	8b 90 e8 43 11 00    	mov    0x1143e8(%eax),%edx
  103b56:	85 d2                	test   %edx,%edx
  103b58:	0f 84 58 ff ff ff    	je     103ab6 <slab_alloc+0xb6>
  103b5e:	6b c9 1c             	imul   $0x1c,%ecx,%ecx
  103b61:	8b 02                	mov    (%edx),%eax
  103b63:	83 ec 04             	sub    $0x4,%esp
  103b66:	89 81 e8 43 11 00    	mov    %eax,0x1143e8(%ecx)
  103b6c:	81 c1 e0 43 11 00    	add    $0x1143e0,%ecx
  103b72:	83 41 10 01          	addl   $0x1,0x10(%ecx)
  103b76:	ff 31                	push   (%ecx)
  103b78:	6a 00                	push   $0x0
  103b7a:	52                   	push   %edx
  103b7b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103b7e:	e8 1d c9 ff ff       	call   1004a0 <memset>
  103b83:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103b86:	83 c4 10             	add    $0x10,%esp
  103b89:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103b8c:	5b                   	pop    %ebx
  103b8d:	5e                   	pop    %esi
  103b8e:	89 d0                	mov    %edx,%eax
  103b90:	5f                   	pop    %edi
  103b91:	5d                   	pop    %ebp
  103b92:	c3                   	ret
  103b93:	83 ec 0c             	sub    $0xc,%esp
  103b96:	68 38 bf 10 00       	push   $0x10bf38
  103b9b:	e8 70 d0 ff ff       	call   100c10 <terminal_writestring>
  103ba0:	83 c4 10             	add    $0x10,%esp
  103ba3:	83 ec 0c             	sub    $0xc,%esp
  103ba6:	68 64 d0 10 00       	push   $0x10d064
  103bab:	e8 60 d0 ff ff       	call   100c10 <terminal_writestring>
  103bb0:	83 c4 10             	add    $0x10,%esp
  103bb3:	e9 79 fe ff ff       	jmp    103a31 <slab_alloc+0x31>
  103bb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103bbf:	00 

00103bc0 <kmalloc>:
  103bc0:	55                   	push   %ebp
  103bc1:	89 e5                	mov    %esp,%ebp
  103bc3:	56                   	push   %esi
  103bc4:	53                   	push   %ebx
  103bc5:	83 ec 10             	sub    $0x10,%esp
  103bc8:	8b 75 08             	mov    0x8(%ebp),%esi
  103bcb:	85 f6                	test   %esi,%esi
  103bcd:	0f 84 19 01 00 00    	je     103cec <kmalloc+0x12c>
  103bd3:	81 fe 00 08 00 00    	cmp    $0x800,%esi
  103bd9:	0f 86 21 01 00 00    	jbe    103d00 <kmalloc+0x140>
  103bdf:	83 c6 03             	add    $0x3,%esi
  103be2:	b8 10 00 00 00       	mov    $0x10,%eax
  103be7:	8b 1d ec 44 11 00    	mov    0x1144ec,%ebx
  103bed:	83 e6 fc             	and    $0xfffffffc,%esi
  103bf0:	39 c6                	cmp    %eax,%esi
  103bf2:	0f 42 f0             	cmovb  %eax,%esi
  103bf5:	eb 3c                	jmp    103c33 <kmalloc+0x73>
  103bf7:	90                   	nop
  103bf8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103bff:	00 
  103c00:	3b 1d 14 e0 10 00    	cmp    0x10e014,%ebx
  103c06:	73 37                	jae    103c3f <kmalloc+0x7f>
  103c08:	8b 43 04             	mov    0x4(%ebx),%eax
  103c0b:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
  103c10:	74 07                	je     103c19 <kmalloc+0x59>
  103c12:	3d 0d f0 ad ba       	cmp    $0xbaadf00d,%eax
  103c17:	75 26                	jne    103c3f <kmalloc+0x7f>
  103c19:	8b 03                	mov    (%ebx),%eax
  103c1b:	3d 00 00 00 0f       	cmp    $0xf000000,%eax
  103c20:	77 1d                	ja     103c3f <kmalloc+0x7f>
  103c22:	80 7b 14 00          	cmpb   $0x0,0x14(%ebx)
  103c26:	74 08                	je     103c30 <kmalloc+0x70>
  103c28:	39 f0                	cmp    %esi,%eax
  103c2a:	0f 83 e0 00 00 00    	jae    103d10 <kmalloc+0x150>
  103c30:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  103c33:	85 db                	test   %ebx,%ebx
  103c35:	74 29                	je     103c60 <kmalloc+0xa0>
  103c37:	3b 1d 1c e0 10 00    	cmp    0x10e01c,%ebx
  103c3d:	73 c1                	jae    103c00 <kmalloc+0x40>
  103c3f:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  103c46:	74 e8                	je     103c30 <kmalloc+0x70>
  103c48:	83 ec 0c             	sub    $0xc,%esp
  103c4b:	68 88 d0 10 00       	push   $0x10d088
  103c50:	e8 bb cf ff ff       	call   100c10 <terminal_writestring>
  103c55:	83 c4 10             	add    $0x10,%esp
  103c58:	eb d6                	jmp    103c30 <kmalloc+0x70>
  103c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103c60:	a1 14 e0 10 00       	mov    0x10e014,%eax
  103c65:	8d 54 30 1c          	lea    0x1c(%eax,%esi,1),%edx
  103c69:	39 15 18 e0 10 00    	cmp    %edx,0x10e018
  103c6f:	72 6b                	jb     103cdc <kmalloc+0x11c>
  103c71:	8b 15 ec 44 11 00    	mov    0x1144ec,%edx
  103c77:	89 30                	mov    %esi,(%eax)
  103c79:	c7 40 04 ef be ad de 	movl   $0xdeadbeef,0x4(%eax)
  103c80:	c7 40 08 be ba fe ca 	movl   $0xcafebabe,0x8(%eax)
  103c87:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  103c8b:	89 50 0c             	mov    %edx,0xc(%eax)
  103c8e:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  103c95:	85 d2                	test   %edx,%edx
  103c97:	74 03                	je     103c9c <kmalloc+0xdc>
  103c99:	89 42 10             	mov    %eax,0x10(%edx)
  103c9c:	8d 54 30 1f          	lea    0x1f(%eax,%esi,1),%edx
  103ca0:	a3 ec 44 11 00       	mov    %eax,0x1144ec
  103ca5:	83 e2 fc             	and    $0xfffffffc,%edx
  103ca8:	c7 44 30 18 ab ab ab 	movl   $0xabababab,0x18(%eax,%esi,1)
  103caf:	ab 
  103cb0:	89 15 14 e0 10 00    	mov    %edx,0x10e014
  103cb6:	8d 50 18             	lea    0x18(%eax),%edx
  103cb9:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  103cc0:	0f 85 da 00 00 00    	jne    103da0 <kmalloc+0x1e0>
  103cc6:	01 35 e8 44 11 00    	add    %esi,0x1144e8
  103ccc:	89 d0                	mov    %edx,%eax
  103cce:	83 05 e0 44 11 00 01 	addl   $0x1,0x1144e0
  103cd5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103cd8:	5b                   	pop    %ebx
  103cd9:	5e                   	pop    %esi
  103cda:	5d                   	pop    %ebp
  103cdb:	c3                   	ret
  103cdc:	83 ec 0c             	sub    $0xc,%esp
  103cdf:	68 bc d0 10 00       	push   $0x10d0bc
  103ce4:	e8 27 cf ff ff       	call   100c10 <terminal_writestring>
  103ce9:	83 c4 10             	add    $0x10,%esp
  103cec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103cef:	31 d2                	xor    %edx,%edx
  103cf1:	5b                   	pop    %ebx
  103cf2:	89 d0                	mov    %edx,%eax
  103cf4:	5e                   	pop    %esi
  103cf5:	5d                   	pop    %ebp
  103cf6:	c3                   	ret
  103cf7:	90                   	nop
  103cf8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103cff:	00 
  103d00:	89 75 08             	mov    %esi,0x8(%ebp)
  103d03:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103d06:	5b                   	pop    %ebx
  103d07:	5e                   	pop    %esi
  103d08:	5d                   	pop    %ebp
  103d09:	e9 f2 fc ff ff       	jmp    103a00 <slab_alloc>
  103d0e:	66 90                	xchg   %ax,%ax
  103d10:	89 c1                	mov    %eax,%ecx
  103d12:	c6 43 14 00          	movb   $0x0,0x14(%ebx)
  103d16:	8d 54 03 18          	lea    0x18(%ebx,%eax,1),%edx
  103d1a:	29 f1                	sub    %esi,%ecx
  103d1c:	c7 43 04 ef be ad de 	movl   $0xdeadbeef,0x4(%ebx)
  103d23:	c7 43 08 be ba fe ca 	movl   $0xcafebabe,0x8(%ebx)
  103d2a:	83 f9 28             	cmp    $0x28,%ecx
  103d2d:	76 3f                	jbe    103d6e <kmalloc+0x1ae>
  103d2f:	8b 43 0c             	mov    0xc(%ebx),%eax
  103d32:	8d 54 33 18          	lea    0x18(%ebx,%esi,1),%edx
  103d36:	83 e9 18             	sub    $0x18,%ecx
  103d39:	89 0a                	mov    %ecx,(%edx)
  103d3b:	89 42 0c             	mov    %eax,0xc(%edx)
  103d3e:	8b 43 0c             	mov    0xc(%ebx),%eax
  103d41:	c7 42 04 ef be ad de 	movl   $0xdeadbeef,0x4(%edx)
  103d48:	c7 42 08 be ba fe ca 	movl   $0xcafebabe,0x8(%edx)
  103d4f:	c6 42 14 01          	movb   $0x1,0x14(%edx)
  103d53:	89 5a 10             	mov    %ebx,0x10(%edx)
  103d56:	85 c0                	test   %eax,%eax
  103d58:	74 03                	je     103d5d <kmalloc+0x19d>
  103d5a:	89 50 10             	mov    %edx,0x10(%eax)
  103d5d:	89 33                	mov    %esi,(%ebx)
  103d5f:	8b 02                	mov    (%edx),%eax
  103d61:	89 53 0c             	mov    %edx,0xc(%ebx)
  103d64:	c7 44 02 18 ab ab ab 	movl   $0xabababab,0x18(%edx,%eax,1)
  103d6b:	ab 
  103d6c:	89 f0                	mov    %esi,%eax
  103d6e:	c7 02 ab ab ab ab    	movl   $0xabababab,(%edx)
  103d74:	8d 53 18             	lea    0x18(%ebx),%edx
  103d77:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  103d7e:	75 3d                	jne    103dbd <kmalloc+0x1fd>
  103d80:	01 05 e8 44 11 00    	add    %eax,0x1144e8
  103d86:	89 d0                	mov    %edx,%eax
  103d88:	83 05 e0 44 11 00 01 	addl   $0x1,0x1144e0
  103d8f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103d92:	5b                   	pop    %ebx
  103d93:	5e                   	pop    %esi
  103d94:	5d                   	pop    %ebp
  103d95:	c3                   	ret
  103d96:	66 90                	xchg   %ax,%ax
  103d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103d9f:	00 
  103da0:	83 ec 04             	sub    $0x4,%esp
  103da3:	56                   	push   %esi
  103da4:	68 ab 00 00 00       	push   $0xab
  103da9:	52                   	push   %edx
  103daa:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103dad:	e8 ee c6 ff ff       	call   1004a0 <memset>
  103db2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103db5:	83 c4 10             	add    $0x10,%esp
  103db8:	e9 09 ff ff ff       	jmp    103cc6 <kmalloc+0x106>
  103dbd:	83 ec 04             	sub    $0x4,%esp
  103dc0:	50                   	push   %eax
  103dc1:	68 ab 00 00 00       	push   $0xab
  103dc6:	52                   	push   %edx
  103dc7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103dca:	e8 d1 c6 ff ff       	call   1004a0 <memset>
  103dcf:	8b 03                	mov    (%ebx),%eax
  103dd1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103dd4:	83 c4 10             	add    $0x10,%esp
  103dd7:	eb a7                	jmp    103d80 <kmalloc+0x1c0>
  103dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103de0 <kcalloc>:
  103de0:	55                   	push   %ebp
  103de1:	89 e5                	mov    %esp,%ebp
  103de3:	53                   	push   %ebx
  103de4:	83 ec 14             	sub    $0x14,%esp
  103de7:	8b 45 08             	mov    0x8(%ebp),%eax
  103dea:	f7 65 0c             	mull   0xc(%ebp)
  103ded:	70 30                	jo     103e1f <kcalloc+0x3f>
  103def:	83 ec 0c             	sub    $0xc,%esp
  103df2:	89 c3                	mov    %eax,%ebx
  103df4:	50                   	push   %eax
  103df5:	e8 c6 fd ff ff       	call   103bc0 <kmalloc>
  103dfa:	83 c4 10             	add    $0x10,%esp
  103dfd:	89 c2                	mov    %eax,%edx
  103dff:	85 c0                	test   %eax,%eax
  103e01:	74 15                	je     103e18 <kcalloc+0x38>
  103e03:	83 ec 04             	sub    $0x4,%esp
  103e06:	53                   	push   %ebx
  103e07:	6a 00                	push   $0x0
  103e09:	50                   	push   %eax
  103e0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103e0d:	e8 8e c6 ff ff       	call   1004a0 <memset>
  103e12:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103e15:	83 c4 10             	add    $0x10,%esp
  103e18:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103e1b:	89 d0                	mov    %edx,%eax
  103e1d:	c9                   	leave
  103e1e:	c3                   	ret
  103e1f:	83 ec 0c             	sub    $0xc,%esp
  103e22:	68 71 bf 10 00       	push   $0x10bf71
  103e27:	e8 e4 cd ff ff       	call   100c10 <terminal_writestring>
  103e2c:	83 c4 10             	add    $0x10,%esp
  103e2f:	31 d2                	xor    %edx,%edx
  103e31:	eb e5                	jmp    103e18 <kcalloc+0x38>
  103e33:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103e38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103e3f:	00 

00103e40 <kmalloc_aligned>:
  103e40:	55                   	push   %ebp
  103e41:	89 e5                	mov    %esp,%ebp
  103e43:	53                   	push   %ebx
  103e44:	83 ec 04             	sub    $0x4,%esp
  103e47:	8b 45 08             	mov    0x8(%ebp),%eax
  103e4a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  103e4d:	85 c0                	test   %eax,%eax
  103e4f:	74 3f                	je     103e90 <kmalloc_aligned+0x50>
  103e51:	85 db                	test   %ebx,%ebx
  103e53:	74 3b                	je     103e90 <kmalloc_aligned+0x50>
  103e55:	8d 53 ff             	lea    -0x1(%ebx),%edx
  103e58:	85 da                	test   %ebx,%edx
  103e5a:	ba 10 00 00 00       	mov    $0x10,%edx
  103e5f:	0f 45 da             	cmovne %edx,%ebx
  103e62:	83 ec 0c             	sub    $0xc,%esp
  103e65:	8d 44 18 08          	lea    0x8(%eax,%ebx,1),%eax
  103e69:	50                   	push   %eax
  103e6a:	e8 51 fd ff ff       	call   103bc0 <kmalloc>
  103e6f:	83 c4 10             	add    $0x10,%esp
  103e72:	89 c2                	mov    %eax,%edx
  103e74:	85 c0                	test   %eax,%eax
  103e76:	74 18                	je     103e90 <kmalloc_aligned+0x50>
  103e78:	89 d9                	mov    %ebx,%ecx
  103e7a:	8d 44 18 07          	lea    0x7(%eax,%ebx,1),%eax
  103e7e:	f7 d9                	neg    %ecx
  103e80:	21 c8                	and    %ecx,%eax
  103e82:	89 58 fc             	mov    %ebx,-0x4(%eax)
  103e85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103e88:	89 50 f8             	mov    %edx,-0x8(%eax)
  103e8b:	c9                   	leave
  103e8c:	c3                   	ret
  103e8d:	8d 76 00             	lea    0x0(%esi),%esi
  103e90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103e93:	31 c0                	xor    %eax,%eax
  103e95:	c9                   	leave
  103e96:	c3                   	ret
  103e97:	90                   	nop
  103e98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103e9f:	00 

00103ea0 <slab_free>:
  103ea0:	55                   	push   %ebp
  103ea1:	89 e5                	mov    %esp,%ebp
  103ea3:	57                   	push   %edi
  103ea4:	56                   	push   %esi
  103ea5:	8b 75 08             	mov    0x8(%ebp),%esi
  103ea8:	53                   	push   %ebx
  103ea9:	85 f6                	test   %esi,%esi
  103eab:	74 37                	je     103ee4 <slab_free+0x44>
  103ead:	89 f7                	mov    %esi,%edi
  103eaf:	b9 e0 43 11 00       	mov    $0x1143e0,%ecx
  103eb4:	31 db                	xor    %ebx,%ebx
  103eb6:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
  103ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103ec0:	80 79 18 00          	cmpb   $0x0,0x18(%ecx)
  103ec4:	74 0a                	je     103ed0 <slab_free+0x30>
  103ec6:	89 f8                	mov    %edi,%eax
  103ec8:	31 d2                	xor    %edx,%edx
  103eca:	f7 31                	divl   (%ecx)
  103ecc:	85 d2                	test   %edx,%edx
  103ece:	74 30                	je     103f00 <slab_free+0x60>
  103ed0:	83 c3 01             	add    $0x1,%ebx
  103ed3:	83 c1 1c             	add    $0x1c,%ecx
  103ed6:	83 fb 09             	cmp    $0x9,%ebx
  103ed9:	75 e5                	jne    103ec0 <slab_free+0x20>
  103edb:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  103ee2:	75 0c                	jne    103ef0 <slab_free+0x50>
  103ee4:	5b                   	pop    %ebx
  103ee5:	5e                   	pop    %esi
  103ee6:	5f                   	pop    %edi
  103ee7:	5d                   	pop    %ebp
  103ee8:	c3                   	ret
  103ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103ef0:	5b                   	pop    %ebx
  103ef1:	5e                   	pop    %esi
  103ef2:	c7 45 08 e8 d0 10 00 	movl   $0x10d0e8,0x8(%ebp)
  103ef9:	5f                   	pop    %edi
  103efa:	5d                   	pop    %ebp
  103efb:	e9 10 cd ff ff       	jmp    100c10 <terminal_writestring>
  103f00:	6b db 1c             	imul   $0x1c,%ebx,%ebx
  103f03:	8b 83 e8 43 11 00    	mov    0x1143e8(%ebx),%eax
  103f09:	89 06                	mov    %eax,(%esi)
  103f0b:	83 ab f0 43 11 00 01 	subl   $0x1,0x1143f0(%ebx)
  103f12:	89 b3 e8 43 11 00    	mov    %esi,0x1143e8(%ebx)
  103f18:	5b                   	pop    %ebx
  103f19:	5e                   	pop    %esi
  103f1a:	5f                   	pop    %edi
  103f1b:	5d                   	pop    %ebp
  103f1c:	c3                   	ret
  103f1d:	8d 76 00             	lea    0x0(%esi),%esi

00103f20 <kfree>:
  103f20:	55                   	push   %ebp
  103f21:	89 e5                	mov    %esp,%ebp
  103f23:	57                   	push   %edi
  103f24:	56                   	push   %esi
  103f25:	53                   	push   %ebx
  103f26:	83 ec 2c             	sub    $0x2c,%esp
  103f29:	8b 55 08             	mov    0x8(%ebp),%edx
  103f2c:	85 d2                	test   %edx,%edx
  103f2e:	0f 84 97 00 00 00    	je     103fcb <kfree+0xab>
  103f34:	8b 42 ec             	mov    -0x14(%edx),%eax
  103f37:	3d 0d f0 ad ba       	cmp    $0xbaadf00d,%eax
  103f3c:	0f 84 7e 01 00 00    	je     1040c0 <kfree+0x1a0>
  103f42:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
  103f47:	0f 85 8b 00 00 00    	jne    103fd8 <kfree+0xb8>
  103f4d:	8d 7a e8             	lea    -0x18(%edx),%edi
  103f50:	81 7a f0 be ba fe ca 	cmpl   $0xcafebabe,-0x10(%edx)
  103f57:	0f 85 b3 00 00 00    	jne    104010 <kfree+0xf0>
  103f5d:	8b 42 e8             	mov    -0x18(%edx),%eax
  103f60:	81 3c 02 ab ab ab ab 	cmpl   $0xabababab,(%edx,%eax,1)
  103f67:	0f 85 2b 01 00 00    	jne    104098 <kfree+0x178>
  103f6d:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  103f74:	75 7a                	jne    103ff0 <kfree+0xd0>
  103f76:	8b 4a f4             	mov    -0xc(%edx),%ecx
  103f79:	01 05 e4 44 11 00    	add    %eax,0x1144e4
  103f7f:	83 05 dc 44 11 00 01 	addl   $0x1,0x1144dc
  103f86:	c6 42 fc 01          	movb   $0x1,-0x4(%edx)
  103f8a:	c7 42 ec 0d f0 ad ba 	movl   $0xbaadf00d,-0x14(%edx)
  103f91:	c7 42 f0 00 00 00 00 	movl   $0x0,-0x10(%edx)
  103f98:	85 c9                	test   %ecx,%ecx
  103f9a:	74 14                	je     103fb0 <kfree+0x90>
  103f9c:	80 79 14 00          	cmpb   $0x0,0x14(%ecx)
  103fa0:	74 0e                	je     103fb0 <kfree+0x90>
  103fa2:	83 c0 1c             	add    $0x1c,%eax
  103fa5:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
  103fa8:	39 d9                	cmp    %ebx,%ecx
  103faa:	0f 84 28 01 00 00    	je     1040d8 <kfree+0x1b8>
  103fb0:	8b 42 f8             	mov    -0x8(%edx),%eax
  103fb3:	85 c0                	test   %eax,%eax
  103fb5:	74 14                	je     103fcb <kfree+0xab>
  103fb7:	80 78 14 00          	cmpb   $0x0,0x14(%eax)
  103fbb:	74 0e                	je     103fcb <kfree+0xab>
  103fbd:	8b 08                	mov    (%eax),%ecx
  103fbf:	8d 5c 08 1c          	lea    0x1c(%eax,%ecx,1),%ebx
  103fc3:	39 df                	cmp    %ebx,%edi
  103fc5:	0f 84 45 01 00 00    	je     104110 <kfree+0x1f0>
  103fcb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103fce:	5b                   	pop    %ebx
  103fcf:	5e                   	pop    %esi
  103fd0:	5f                   	pop    %edi
  103fd1:	5d                   	pop    %ebp
  103fd2:	c3                   	ret
  103fd3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  103fd8:	89 55 08             	mov    %edx,0x8(%ebp)
  103fdb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103fde:	5b                   	pop    %ebx
  103fdf:	5e                   	pop    %esi
  103fe0:	5f                   	pop    %edi
  103fe1:	5d                   	pop    %ebp
  103fe2:	e9 b9 fe ff ff       	jmp    103ea0 <slab_free>
  103fe7:	90                   	nop
  103fe8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103fef:	00 
  103ff0:	83 ec 04             	sub    $0x4,%esp
  103ff3:	50                   	push   %eax
  103ff4:	68 de 00 00 00       	push   $0xde
  103ff9:	52                   	push   %edx
  103ffa:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103ffd:	e8 9e c4 ff ff       	call   1004a0 <memset>
  104002:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  104005:	83 c4 10             	add    $0x10,%esp
  104008:	8b 42 e8             	mov    -0x18(%edx),%eax
  10400b:	e9 66 ff ff ff       	jmp    103f76 <kfree+0x56>
  104010:	83 ec 0c             	sub    $0xc,%esp
  104013:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  104016:	68 20 d1 10 00       	push   $0x10d120
  10401b:	e8 f0 cb ff ff       	call   100c10 <terminal_writestring>
  104020:	83 c4 10             	add    $0x10,%esp
  104023:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  10402a:	74 9f                	je     103fcb <kfree+0xab>
  10402c:	83 ec 0c             	sub    $0xc,%esp
  10402f:	68 ab bf 10 00       	push   $0x10bfab
  104034:	e8 d7 cb ff ff       	call   100c10 <terminal_writestring>
  104039:	83 c4 0c             	add    $0xc,%esp
  10403c:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10403f:	6a 10                	push   $0x10
  104041:	50                   	push   %eax
  104042:	57                   	push   %edi
  104043:	e8 e8 c8 ff ff       	call   100930 <itoa>
  104048:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10404b:	89 04 24             	mov    %eax,(%esp)
  10404e:	e8 bd cb ff ff       	call   100c10 <terminal_writestring>
  104053:	c7 04 24 b9 bf 10 00 	movl   $0x10bfb9,(%esp)
  10405a:	e8 b1 cb ff ff       	call   100c10 <terminal_writestring>
  10405f:	83 c4 0c             	add    $0xc,%esp
  104062:	8d 45 d8             	lea    -0x28(%ebp),%eax
  104065:	6a 0a                	push   $0xa
  104067:	50                   	push   %eax
  104068:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10406b:	ff 72 e8             	push   -0x18(%edx)
  10406e:	e8 bd c8 ff ff       	call   100930 <itoa>
  104073:	8d 45 d8             	lea    -0x28(%ebp),%eax
  104076:	89 04 24             	mov    %eax,(%esp)
  104079:	e8 92 cb ff ff       	call   100c10 <terminal_writestring>
  10407e:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  104085:	e8 86 cb ff ff       	call   100c10 <terminal_writestring>
  10408a:	83 c4 10             	add    $0x10,%esp
  10408d:	e9 39 ff ff ff       	jmp    103fcb <kfree+0xab>
  104092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104098:	83 ec 0c             	sub    $0xc,%esp
  10409b:	68 54 d1 10 00       	push   $0x10d154
  1040a0:	e8 6b cb ff ff       	call   100c10 <terminal_writestring>
  1040a5:	83 c4 10             	add    $0x10,%esp
  1040a8:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  1040af:	0f 84 16 ff ff ff    	je     103fcb <kfree+0xab>
  1040b5:	c7 45 08 78 d1 10 00 	movl   $0x10d178,0x8(%ebp)
  1040bc:	eb 09                	jmp    1040c7 <kfree+0x1a7>
  1040be:	66 90                	xchg   %ax,%ax
  1040c0:	c7 45 08 8d bf 10 00 	movl   $0x10bf8d,0x8(%ebp)
  1040c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1040ca:	5b                   	pop    %ebx
  1040cb:	5e                   	pop    %esi
  1040cc:	5f                   	pop    %edi
  1040cd:	5d                   	pop    %ebp
  1040ce:	e9 3d cb ff ff       	jmp    100c10 <terminal_writestring>
  1040d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1040d8:	8b 71 0c             	mov    0xc(%ecx),%esi
  1040db:	03 01                	add    (%ecx),%eax
  1040dd:	89 42 e8             	mov    %eax,-0x18(%edx)
  1040e0:	89 72 f4             	mov    %esi,-0xc(%edx)
  1040e3:	8b 71 0c             	mov    0xc(%ecx),%esi
  1040e6:	85 f6                	test   %esi,%esi
  1040e8:	74 03                	je     1040ed <kfree+0x1cd>
  1040ea:	89 7e 10             	mov    %edi,0x10(%esi)
  1040ed:	03 09                	add    (%ecx),%ecx
  1040ef:	83 c1 1c             	add    $0x1c,%ecx
  1040f2:	3b 0d 14 e0 10 00    	cmp    0x10e014,%ecx
  1040f8:	0f 82 b2 fe ff ff    	jb     103fb0 <kfree+0x90>
  1040fe:	8d 44 07 1f          	lea    0x1f(%edi,%eax,1),%eax
  104102:	83 e0 fc             	and    $0xfffffffc,%eax
  104105:	a3 14 e0 10 00       	mov    %eax,0x10e014
  10410a:	e9 a1 fe ff ff       	jmp    103fb0 <kfree+0x90>
  10410f:	90                   	nop
  104110:	8b 72 e8             	mov    -0x18(%edx),%esi
  104113:	8d 4c 31 1c          	lea    0x1c(%ecx,%esi,1),%ecx
  104117:	8b 72 f4             	mov    -0xc(%edx),%esi
  10411a:	89 08                	mov    %ecx,(%eax)
  10411c:	89 70 0c             	mov    %esi,0xc(%eax)
  10411f:	8b 52 f4             	mov    -0xc(%edx),%edx
  104122:	85 d2                	test   %edx,%edx
  104124:	74 03                	je     104129 <kfree+0x209>
  104126:	89 42 10             	mov    %eax,0x10(%edx)
  104129:	8d 54 08 1c          	lea    0x1c(%eax,%ecx,1),%edx
  10412d:	3b 15 14 e0 10 00    	cmp    0x10e014,%edx
  104133:	0f 82 92 fe ff ff    	jb     103fcb <kfree+0xab>
  104139:	8d 44 08 1f          	lea    0x1f(%eax,%ecx,1),%eax
  10413d:	83 e0 fc             	and    $0xfffffffc,%eax
  104140:	a3 14 e0 10 00       	mov    %eax,0x10e014
  104145:	e9 81 fe ff ff       	jmp    103fcb <kfree+0xab>
  10414a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104150 <krealloc>:
  104150:	55                   	push   %ebp
  104151:	89 e5                	mov    %esp,%ebp
  104153:	57                   	push   %edi
  104154:	56                   	push   %esi
  104155:	53                   	push   %ebx
  104156:	83 ec 2c             	sub    $0x2c,%esp
  104159:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10415c:	8b 75 0c             	mov    0xc(%ebp),%esi
  10415f:	85 db                	test   %ebx,%ebx
  104161:	0f 84 99 01 00 00    	je     104300 <krealloc+0x1b0>
  104167:	85 f6                	test   %esi,%esi
  104169:	0f 84 a1 01 00 00    	je     104310 <krealloc+0x1c0>
  10416f:	8d 43 e8             	lea    -0x18(%ebx),%eax
  104172:	3b 05 1c e0 10 00    	cmp    0x10e01c,%eax
  104178:	72 26                	jb     1041a0 <krealloc+0x50>
  10417a:	8b 15 14 e0 10 00    	mov    0x10e014,%edx
  104180:	39 d0                	cmp    %edx,%eax
  104182:	73 1c                	jae    1041a0 <krealloc+0x50>
  104184:	8b 7b ec             	mov    -0x14(%ebx),%edi
  104187:	81 ff ef be ad de    	cmp    $0xdeadbeef,%edi
  10418d:	74 49                	je     1041d8 <krealloc+0x88>
  10418f:	81 ff 0d f0 ad ba    	cmp    $0xbaadf00d,%edi
  104195:	74 41                	je     1041d8 <krealloc+0x88>
  104197:	90                   	nop
  104198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10419f:	00 
  1041a0:	83 ec 0c             	sub    $0xc,%esp
  1041a3:	56                   	push   %esi
  1041a4:	e8 17 fa ff ff       	call   103bc0 <kmalloc>
  1041a9:	83 c4 10             	add    $0x10,%esp
  1041ac:	89 c7                	mov    %eax,%edi
  1041ae:	85 c0                	test   %eax,%eax
  1041b0:	74 18                	je     1041ca <krealloc+0x7a>
  1041b2:	b8 00 01 00 00       	mov    $0x100,%eax
  1041b7:	83 ec 04             	sub    $0x4,%esp
  1041ba:	39 c6                	cmp    %eax,%esi
  1041bc:	0f 46 c6             	cmovbe %esi,%eax
  1041bf:	50                   	push   %eax
  1041c0:	53                   	push   %ebx
  1041c1:	57                   	push   %edi
  1041c2:	e8 99 c2 ff ff       	call   100460 <memcpy>
  1041c7:	83 c4 10             	add    $0x10,%esp
  1041ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1041cd:	89 f8                	mov    %edi,%eax
  1041cf:	5b                   	pop    %ebx
  1041d0:	5e                   	pop    %esi
  1041d1:	5f                   	pop    %edi
  1041d2:	5d                   	pop    %ebp
  1041d3:	c3                   	ret
  1041d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1041d8:	8b 4b e8             	mov    -0x18(%ebx),%ecx
  1041db:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  1041de:	81 f9 00 00 00 0f    	cmp    $0xf000000,%ecx
  1041e4:	77 ba                	ja     1041a0 <krealloc+0x50>
  1041e6:	80 7b fc 00          	cmpb   $0x0,-0x4(%ebx)
  1041ea:	75 b4                	jne    1041a0 <krealloc+0x50>
  1041ec:	81 ff ef be ad de    	cmp    $0xdeadbeef,%edi
  1041f2:	0f 85 30 01 00 00    	jne    104328 <krealloc+0x1d8>
  1041f8:	8d 7e 03             	lea    0x3(%esi),%edi
  1041fb:	83 e7 fc             	and    $0xfffffffc,%edi
  1041fe:	89 7d e0             	mov    %edi,-0x20(%ebp)
  104201:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  104204:	0f 83 e6 00 00 00    	jae    1042f0 <krealloc+0x1a0>
  10420a:	8b 7b f4             	mov    -0xc(%ebx),%edi
  10420d:	85 ff                	test   %edi,%edi
  10420f:	74 16                	je     104227 <krealloc+0xd7>
  104211:	89 7d dc             	mov    %edi,-0x24(%ebp)
  104214:	89 f9                	mov    %edi,%ecx
  104216:	80 7f 14 00          	cmpb   $0x0,0x14(%edi)
  10421a:	74 0b                	je     104227 <krealloc+0xd7>
  10421c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  10421f:	8d 7c 38 1c          	lea    0x1c(%eax,%edi,1),%edi
  104223:	39 f9                	cmp    %edi,%ecx
  104225:	74 41                	je     104268 <krealloc+0x118>
  104227:	83 ec 0c             	sub    $0xc,%esp
  10422a:	56                   	push   %esi
  10422b:	e8 90 f9 ff ff       	call   103bc0 <kmalloc>
  104230:	83 c4 10             	add    $0x10,%esp
  104233:	89 c7                	mov    %eax,%edi
  104235:	85 c0                	test   %eax,%eax
  104237:	74 91                	je     1041ca <krealloc+0x7a>
  104239:	8b 43 e8             	mov    -0x18(%ebx),%eax
  10423c:	83 ec 04             	sub    $0x4,%esp
  10423f:	39 c6                	cmp    %eax,%esi
  104241:	0f 47 f0             	cmova  %eax,%esi
  104244:	56                   	push   %esi
  104245:	53                   	push   %ebx
  104246:	57                   	push   %edi
  104247:	e8 14 c2 ff ff       	call   100460 <memcpy>
  10424c:	89 1c 24             	mov    %ebx,(%esp)
  10424f:	e8 cc fc ff ff       	call   103f20 <kfree>
  104254:	83 c4 10             	add    $0x10,%esp
  104257:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10425a:	89 f8                	mov    %edi,%eax
  10425c:	5b                   	pop    %ebx
  10425d:	5e                   	pop    %esi
  10425e:	5f                   	pop    %edi
  10425f:	5d                   	pop    %ebp
  104260:	c3                   	ret
  104261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104268:	8b 39                	mov    (%ecx),%edi
  10426a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10426d:	89 7d d8             	mov    %edi,-0x28(%ebp)
  104270:	8d 7c 0f 18          	lea    0x18(%edi,%ecx,1),%edi
  104274:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  104277:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  10427a:	39 cf                	cmp    %ecx,%edi
  10427c:	72 a9                	jb     104227 <krealloc+0xd7>
  10427e:	8b 75 d8             	mov    -0x28(%ebp),%esi
  104281:	8b 7d dc             	mov    -0x24(%ebp),%edi
  104284:	29 ce                	sub    %ecx,%esi
  104286:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  104289:	01 f1                	add    %esi,%ecx
  10428b:	8b 77 0c             	mov    0xc(%edi),%esi
  10428e:	89 75 d8             	mov    %esi,-0x28(%ebp)
  104291:	83 f9 28             	cmp    $0x28,%ecx
  104294:	0f 86 a5 00 00 00    	jbe    10433f <krealloc+0x1ef>
  10429a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10429d:	8d 71 e8             	lea    -0x18(%ecx),%esi
  1042a0:	83 c2 18             	add    $0x18,%edx
  1042a3:	2b 55 e4             	sub    -0x1c(%ebp),%edx
  1042a6:	01 fa                	add    %edi,%edx
  1042a8:	89 32                	mov    %esi,(%edx)
  1042aa:	8b 75 d8             	mov    -0x28(%ebp),%esi
  1042ad:	89 42 10             	mov    %eax,0x10(%edx)
  1042b0:	89 72 0c             	mov    %esi,0xc(%edx)
  1042b3:	8b 47 0c             	mov    0xc(%edi),%eax
  1042b6:	c7 42 04 ef be ad de 	movl   $0xdeadbeef,0x4(%edx)
  1042bd:	c7 42 08 be ba fe ca 	movl   $0xcafebabe,0x8(%edx)
  1042c4:	c6 42 14 01          	movb   $0x1,0x14(%edx)
  1042c8:	85 c0                	test   %eax,%eax
  1042ca:	74 03                	je     1042cf <krealloc+0x17f>
  1042cc:	89 50 10             	mov    %edx,0x10(%eax)
  1042cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042d2:	89 53 f4             	mov    %edx,-0xc(%ebx)
  1042d5:	89 43 e8             	mov    %eax,-0x18(%ebx)
  1042d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042db:	c7 04 03 ab ab ab ab 	movl   $0xabababab,(%ebx,%eax,1)
  1042e2:	03 05 e8 44 11 00    	add    0x1144e8,%eax
  1042e8:	2b 45 e4             	sub    -0x1c(%ebp),%eax
  1042eb:	a3 e8 44 11 00       	mov    %eax,0x1144e8
  1042f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1042f3:	89 df                	mov    %ebx,%edi
  1042f5:	89 f8                	mov    %edi,%eax
  1042f7:	5b                   	pop    %ebx
  1042f8:	5e                   	pop    %esi
  1042f9:	5f                   	pop    %edi
  1042fa:	5d                   	pop    %ebp
  1042fb:	c3                   	ret
  1042fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104300:	89 75 08             	mov    %esi,0x8(%ebp)
  104303:	8d 65 f4             	lea    -0xc(%ebp),%esp
  104306:	5b                   	pop    %ebx
  104307:	5e                   	pop    %esi
  104308:	5f                   	pop    %edi
  104309:	5d                   	pop    %ebp
  10430a:	e9 b1 f8 ff ff       	jmp    103bc0 <kmalloc>
  10430f:	90                   	nop
  104310:	83 ec 0c             	sub    $0xc,%esp
  104313:	31 ff                	xor    %edi,%edi
  104315:	53                   	push   %ebx
  104316:	e8 05 fc ff ff       	call   103f20 <kfree>
  10431b:	83 c4 10             	add    $0x10,%esp
  10431e:	e9 a7 fe ff ff       	jmp    1041ca <krealloc+0x7a>
  104323:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  104328:	83 ec 0c             	sub    $0xc,%esp
  10432b:	31 ff                	xor    %edi,%edi
  10432d:	68 c1 bf 10 00       	push   $0x10bfc1
  104332:	e8 d9 c8 ff ff       	call   100c10 <terminal_writestring>
  104337:	83 c4 10             	add    $0x10,%esp
  10433a:	e9 8b fe ff ff       	jmp    1041ca <krealloc+0x7a>
  10433f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
  104342:	89 73 e8             	mov    %esi,-0x18(%ebx)
  104345:	8b 75 d8             	mov    -0x28(%ebp),%esi
  104348:	89 73 f4             	mov    %esi,-0xc(%ebx)
  10434b:	8b 75 dc             	mov    -0x24(%ebp),%esi
  10434e:	8b 76 0c             	mov    0xc(%esi),%esi
  104351:	85 f6                	test   %esi,%esi
  104353:	74 03                	je     104358 <krealloc+0x208>
  104355:	89 46 10             	mov    %eax,0x10(%esi)
  104358:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10435b:	03 00                	add    (%eax),%eax
  10435d:	83 c0 1c             	add    $0x1c,%eax
  104360:	39 d0                	cmp    %edx,%eax
  104362:	72 08                	jb     10436c <krealloc+0x21c>
  104364:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104367:	a3 14 e0 10 00       	mov    %eax,0x10e014
  10436c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10436f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  104372:	e9 61 ff ff ff       	jmp    1042d8 <krealloc+0x188>
  104377:	90                   	nop
  104378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10437f:	00 

00104380 <kfree_aligned>:
  104380:	55                   	push   %ebp
  104381:	89 e5                	mov    %esp,%ebp
  104383:	8b 45 08             	mov    0x8(%ebp),%eax
  104386:	85 c0                	test   %eax,%eax
  104388:	74 2e                	je     1043b8 <kfree_aligned+0x38>
  10438a:	8b 48 fc             	mov    -0x4(%eax),%ecx
  10438d:	8d 51 ff             	lea    -0x1(%ecx),%edx
  104390:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  104396:	77 10                	ja     1043a8 <kfree_aligned+0x28>
  104398:	8b 40 f8             	mov    -0x8(%eax),%eax
  10439b:	89 45 08             	mov    %eax,0x8(%ebp)
  10439e:	5d                   	pop    %ebp
  10439f:	e9 7c fb ff ff       	jmp    103f20 <kfree>
  1043a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1043a8:	c7 45 08 a0 d1 10 00 	movl   $0x10d1a0,0x8(%ebp)
  1043af:	5d                   	pop    %ebp
  1043b0:	e9 5b c8 ff ff       	jmp    100c10 <terminal_writestring>
  1043b5:	8d 76 00             	lea    0x0(%esi),%esi
  1043b8:	5d                   	pop    %ebp
  1043b9:	c3                   	ret
  1043ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001043c0 <memory_debug_enable>:
  1043c0:	55                   	push   %ebp
  1043c1:	89 e5                	mov    %esp,%ebp
  1043c3:	53                   	push   %ebx
  1043c4:	83 ec 10             	sub    $0x10,%esp
  1043c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1043ca:	68 f2 bf 10 00       	push   $0x10bff2
  1043cf:	88 1d c0 43 11 00    	mov    %bl,0x1143c0
  1043d5:	e8 36 c8 ff ff       	call   100c10 <terminal_writestring>
  1043da:	83 c4 10             	add    $0x10,%esp
  1043dd:	b8 e7 bf 10 00       	mov    $0x10bfe7,%eax
  1043e2:	84 db                	test   %bl,%bl
  1043e4:	ba dd bf 10 00       	mov    $0x10bfdd,%edx
  1043e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1043ec:	0f 45 c2             	cmovne %edx,%eax
  1043ef:	89 45 08             	mov    %eax,0x8(%ebp)
  1043f2:	c9                   	leave
  1043f3:	e9 18 c8 ff ff       	jmp    100c10 <terminal_writestring>
  1043f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1043ff:	00 

00104400 <memory_heap_validate>:
  104400:	55                   	push   %ebp
  104401:	89 e5                	mov    %esp,%ebp
  104403:	56                   	push   %esi
  104404:	53                   	push   %ebx
  104405:	83 ec 20             	sub    $0x20,%esp
  104408:	8b 1d ec 44 11 00    	mov    0x1144ec,%ebx
  10440e:	85 db                	test   %ebx,%ebx
  104410:	0f 84 1a 01 00 00    	je     104530 <memory_heap_validate+0x130>
  104416:	31 f6                	xor    %esi,%esi
  104418:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10441f:	00 
  104420:	3b 1d 1c e0 10 00    	cmp    0x10e01c,%ebx
  104426:	72 58                	jb     104480 <memory_heap_validate+0x80>
  104428:	3b 1d 14 e0 10 00    	cmp    0x10e014,%ebx
  10442e:	73 50                	jae    104480 <memory_heap_validate+0x80>
  104430:	8b 43 04             	mov    0x4(%ebx),%eax
  104433:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
  104438:	74 66                	je     1044a0 <memory_heap_validate+0xa0>
  10443a:	3d 0d f0 ad ba       	cmp    $0xbaadf00d,%eax
  10443f:	74 5f                	je     1044a0 <memory_heap_validate+0xa0>
  104441:	83 c6 01             	add    $0x1,%esi
  104444:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  10444b:	0f 85 7f 01 00 00    	jne    1045d0 <memory_heap_validate+0x1d0>
  104451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104458:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10445f:	00 
  104460:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  104463:	85 db                	test   %ebx,%ebx
  104465:	75 b9                	jne    104420 <memory_heap_validate+0x20>
  104467:	85 f6                	test   %esi,%esi
  104469:	0f 84 c1 00 00 00    	je     104530 <memory_heap_validate+0x130>
  10446f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  104472:	89 f0                	mov    %esi,%eax
  104474:	5b                   	pop    %ebx
  104475:	5e                   	pop    %esi
  104476:	5d                   	pop    %ebp
  104477:	c3                   	ret
  104478:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10447f:	00 
  104480:	83 c6 01             	add    $0x1,%esi
  104483:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  10448a:	74 d4                	je     104460 <memory_heap_validate+0x60>
  10448c:	83 ec 0c             	sub    $0xc,%esp
  10448f:	68 c4 d1 10 00       	push   $0x10d1c4
  104494:	e8 77 c7 ff ff       	call   100c10 <terminal_writestring>
  104499:	83 c4 10             	add    $0x10,%esp
  10449c:	eb c2                	jmp    104460 <memory_heap_validate+0x60>
  10449e:	66 90                	xchg   %ax,%ax
  1044a0:	80 7b 14 00          	cmpb   $0x0,0x14(%ebx)
  1044a4:	75 4a                	jne    1044f0 <memory_heap_validate+0xf0>
  1044a6:	81 7b 08 be ba fe ca 	cmpl   $0xcafebabe,0x8(%ebx)
  1044ad:	0f 84 0d 01 00 00    	je     1045c0 <memory_heap_validate+0x1c0>
  1044b3:	8d 46 01             	lea    0x1(%esi),%eax
  1044b6:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  1044bd:	0f 85 8d 00 00 00    	jne    104550 <memory_heap_validate+0x150>
  1044c3:	8b 13                	mov    (%ebx),%edx
  1044c5:	89 c6                	mov    %eax,%esi
  1044c7:	81 7c 13 18 ab ab ab 	cmpl   $0xabababab,0x18(%ebx,%edx,1)
  1044ce:	ab 
  1044cf:	74 1f                	je     1044f0 <memory_heap_validate+0xf0>
  1044d1:	83 c6 01             	add    $0x1,%esi
  1044d4:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  1044db:	0f 85 2f 01 00 00    	jne    104610 <memory_heap_validate+0x210>
  1044e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1044e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1044ef:	00 
  1044f0:	8b 43 0c             	mov    0xc(%ebx),%eax
  1044f3:	85 c0                	test   %eax,%eax
  1044f5:	0f 84 6c ff ff ff    	je     104467 <memory_heap_validate+0x67>
  1044fb:	39 58 10             	cmp    %ebx,0x10(%eax)
  1044fe:	74 0c                	je     10450c <memory_heap_validate+0x10c>
  104500:	83 c6 01             	add    $0x1,%esi
  104503:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  10450a:	75 0c                	jne    104518 <memory_heap_validate+0x118>
  10450c:	89 c3                	mov    %eax,%ebx
  10450e:	e9 0d ff ff ff       	jmp    104420 <memory_heap_validate+0x20>
  104513:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  104518:	83 ec 0c             	sub    $0xc,%esp
  10451b:	68 98 d2 10 00       	push   $0x10d298
  104520:	e8 eb c6 ff ff       	call   100c10 <terminal_writestring>
  104525:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  104528:	83 c4 10             	add    $0x10,%esp
  10452b:	e9 33 ff ff ff       	jmp    104463 <memory_heap_validate+0x63>
  104530:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  104537:	0f 85 eb 00 00 00    	jne    104628 <memory_heap_validate+0x228>
  10453d:	31 f6                	xor    %esi,%esi
  10453f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  104542:	89 f0                	mov    %esi,%eax
  104544:	5b                   	pop    %ebx
  104545:	5e                   	pop    %esi
  104546:	5d                   	pop    %ebp
  104547:	c3                   	ret
  104548:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10454f:	00 
  104550:	83 ec 0c             	sub    $0xc,%esp
  104553:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  104556:	68 10 d2 10 00       	push   $0x10d210
  10455b:	e8 b0 c6 ff ff       	call   100c10 <terminal_writestring>
  104560:	83 c4 10             	add    $0x10,%esp
  104563:	80 7b 14 00          	cmpb   $0x0,0x14(%ebx)
  104567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10456a:	0f 84 53 ff ff ff    	je     1044c3 <memory_heap_validate+0xc3>
  104570:	8b 53 04             	mov    0x4(%ebx),%edx
  104573:	81 fa 0d f0 ad ba    	cmp    $0xbaadf00d,%edx
  104579:	0f 84 c0 00 00 00    	je     10463f <memory_heap_validate+0x23f>
  10457f:	81 fa ef be ad de    	cmp    $0xdeadbeef,%edx
  104585:	0f 84 b4 00 00 00    	je     10463f <memory_heap_validate+0x23f>
  10458b:	83 c6 02             	add    $0x2,%esi
  10458e:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  104595:	0f 84 55 ff ff ff    	je     1044f0 <memory_heap_validate+0xf0>
  10459b:	83 ec 0c             	sub    $0xc,%esp
  10459e:	68 3c d2 10 00       	push   $0x10d23c
  1045a3:	e8 68 c6 ff ff       	call   100c10 <terminal_writestring>
  1045a8:	83 c4 10             	add    $0x10,%esp
  1045ab:	80 7b 14 00          	cmpb   $0x0,0x14(%ebx)
  1045af:	0f 85 3b ff ff ff    	jne    1044f0 <memory_heap_validate+0xf0>
  1045b5:	8d 76 00             	lea    0x0(%esi),%esi
  1045b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1045bf:	00 
  1045c0:	89 f0                	mov    %esi,%eax
  1045c2:	e9 fc fe ff ff       	jmp    1044c3 <memory_heap_validate+0xc3>
  1045c7:	90                   	nop
  1045c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1045cf:	00 
  1045d0:	83 ec 0c             	sub    $0xc,%esp
  1045d3:	68 ec d1 10 00       	push   $0x10d1ec
  1045d8:	e8 33 c6 ff ff       	call   100c10 <terminal_writestring>
  1045dd:	83 c4 0c             	add    $0xc,%esp
  1045e0:	8d 45 e8             	lea    -0x18(%ebp),%eax
  1045e3:	6a 10                	push   $0x10
  1045e5:	50                   	push   %eax
  1045e6:	ff 73 04             	push   0x4(%ebx)
  1045e9:	e8 42 c3 ff ff       	call   100930 <itoa>
  1045ee:	8d 45 e8             	lea    -0x18(%ebp),%eax
  1045f1:	89 04 24             	mov    %eax,(%esp)
  1045f4:	e8 17 c6 ff ff       	call   100c10 <terminal_writestring>
  1045f9:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  104600:	e8 0b c6 ff ff       	call   100c10 <terminal_writestring>
  104605:	83 c4 10             	add    $0x10,%esp
  104608:	e9 53 fe ff ff       	jmp    104460 <memory_heap_validate+0x60>
  10460d:	8d 76 00             	lea    0x0(%esi),%esi
  104610:	83 ec 0c             	sub    $0xc,%esp
  104613:	68 68 d2 10 00       	push   $0x10d268
  104618:	e8 f3 c5 ff ff       	call   100c10 <terminal_writestring>
  10461d:	83 c4 10             	add    $0x10,%esp
  104620:	e9 cb fe ff ff       	jmp    1044f0 <memory_heap_validate+0xf0>
  104625:	8d 76 00             	lea    0x0(%esi),%esi
  104628:	83 ec 0c             	sub    $0xc,%esp
  10462b:	31 f6                	xor    %esi,%esi
  10462d:	68 c0 d2 10 00       	push   $0x10d2c0
  104632:	e8 d9 c5 ff ff       	call   100c10 <terminal_writestring>
  104637:	83 c4 10             	add    $0x10,%esp
  10463a:	e9 00 ff ff ff       	jmp    10453f <memory_heap_validate+0x13f>
  10463f:	89 c6                	mov    %eax,%esi
  104641:	e9 aa fe ff ff       	jmp    1044f0 <memory_heap_validate+0xf0>
  104646:	66 90                	xchg   %ax,%ax
  104648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10464f:	00 

00104650 <memory_heap_dump>:
  104650:	55                   	push   %ebp
  104651:	89 e5                	mov    %esp,%ebp
  104653:	57                   	push   %edi
  104654:	56                   	push   %esi
  104655:	53                   	push   %ebx
  104656:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  104659:	83 ec 28             	sub    $0x28,%esp
  10465c:	68 11 c0 10 00       	push   $0x10c011
  104661:	e8 aa c5 ff ff       	call   100c10 <terminal_writestring>
  104666:	8b 35 ec 44 11 00    	mov    0x1144ec,%esi
  10466c:	83 c4 10             	add    $0x10,%esp
  10466f:	31 c0                	xor    %eax,%eax
  104671:	e9 cd 00 00 00       	jmp    104743 <memory_heap_dump+0xf3>
  104676:	66 90                	xchg   %ax,%ax
  104678:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10467f:	00 
  104680:	83 ec 0c             	sub    $0xc,%esp
  104683:	68 2b c0 10 00       	push   $0x10c02b
  104688:	e8 83 c5 ff ff       	call   100c10 <terminal_writestring>
  10468d:	83 c4 0c             	add    $0xc,%esp
  104690:	6a 0a                	push   $0xa
  104692:	53                   	push   %ebx
  104693:	57                   	push   %edi
  104694:	e8 97 c2 ff ff       	call   100930 <itoa>
  104699:	89 1c 24             	mov    %ebx,(%esp)
  10469c:	e8 6f c5 ff ff       	call   100c10 <terminal_writestring>
  1046a1:	c7 04 24 2f c0 10 00 	movl   $0x10c02f,(%esp)
  1046a8:	e8 63 c5 ff ff       	call   100c10 <terminal_writestring>
  1046ad:	c7 04 24 89 c3 10 00 	movl   $0x10c389,(%esp)
  1046b4:	e8 57 c5 ff ff       	call   100c10 <terminal_writestring>
  1046b9:	83 c4 0c             	add    $0xc,%esp
  1046bc:	6a 10                	push   $0x10
  1046be:	53                   	push   %ebx
  1046bf:	56                   	push   %esi
  1046c0:	e8 6b c2 ff ff       	call   100930 <itoa>
  1046c5:	89 1c 24             	mov    %ebx,(%esp)
  1046c8:	e8 43 c5 ff ff       	call   100c10 <terminal_writestring>
  1046cd:	c7 04 24 ba bf 10 00 	movl   $0x10bfba,(%esp)
  1046d4:	e8 37 c5 ff ff       	call   100c10 <terminal_writestring>
  1046d9:	83 c4 0c             	add    $0xc,%esp
  1046dc:	6a 0a                	push   $0xa
  1046de:	53                   	push   %ebx
  1046df:	ff 36                	push   (%esi)
  1046e1:	e8 4a c2 ff ff       	call   100930 <itoa>
  1046e6:	89 1c 24             	mov    %ebx,(%esp)
  1046e9:	e8 22 c5 ff ff       	call   100c10 <terminal_writestring>
  1046ee:	80 7e 14 00          	cmpb   $0x0,0x14(%esi)
  1046f2:	ba 0b c0 10 00       	mov    $0x10c00b,%edx
  1046f7:	b8 05 c0 10 00       	mov    $0x10c005,%eax
  1046fc:	0f 44 c2             	cmove  %edx,%eax
  1046ff:	89 04 24             	mov    %eax,(%esp)
  104702:	e8 09 c5 ff ff       	call   100c10 <terminal_writestring>
  104707:	c7 04 24 32 c0 10 00 	movl   $0x10c032,(%esp)
  10470e:	e8 fd c4 ff ff       	call   100c10 <terminal_writestring>
  104713:	83 c4 0c             	add    $0xc,%esp
  104716:	6a 10                	push   $0x10
  104718:	53                   	push   %ebx
  104719:	ff 76 04             	push   0x4(%esi)
  10471c:	e8 0f c2 ff ff       	call   100930 <itoa>
  104721:	89 1c 24             	mov    %ebx,(%esp)
  104724:	e8 e7 c4 ff ff       	call   100c10 <terminal_writestring>
  104729:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  104730:	e8 db c4 ff ff       	call   100c10 <terminal_writestring>
  104735:	8b 76 0c             	mov    0xc(%esi),%esi
  104738:	8d 47 01             	lea    0x1(%edi),%eax
  10473b:	83 c4 10             	add    $0x10,%esp
  10473e:	83 ff 64             	cmp    $0x64,%edi
  104741:	74 67                	je     1047aa <memory_heap_dump+0x15a>
  104743:	89 c7                	mov    %eax,%edi
  104745:	85 f6                	test   %esi,%esi
  104747:	0f 85 33 ff ff ff    	jne    104680 <memory_heap_dump+0x30>
  10474d:	83 ec 0c             	sub    $0xc,%esp
  104750:	68 4f c0 10 00       	push   $0x10c04f
  104755:	e8 b6 c4 ff ff       	call   100c10 <terminal_writestring>
  10475a:	83 c4 0c             	add    $0xc,%esp
  10475d:	6a 0a                	push   $0xa
  10475f:	53                   	push   %ebx
  104760:	57                   	push   %edi
  104761:	e8 ca c1 ff ff       	call   100930 <itoa>
  104766:	89 1c 24             	mov    %ebx,(%esp)
  104769:	e8 a2 c4 ff ff       	call   100c10 <terminal_writestring>
  10476e:	c7 04 24 60 c0 10 00 	movl   $0x10c060,(%esp)
  104775:	e8 96 c4 ff ff       	call   100c10 <terminal_writestring>
  10477a:	83 c4 0c             	add    $0xc,%esp
  10477d:	6a 10                	push   $0x10
  10477f:	53                   	push   %ebx
  104780:	ff 35 14 e0 10 00    	push   0x10e014
  104786:	e8 a5 c1 ff ff       	call   100930 <itoa>
  10478b:	89 1c 24             	mov    %ebx,(%esp)
  10478e:	e8 7d c4 ff ff       	call   100c10 <terminal_writestring>
  104793:	c7 04 24 70 c0 10 00 	movl   $0x10c070,(%esp)
  10479a:	e8 71 c4 ff ff       	call   100c10 <terminal_writestring>
  10479f:	83 c4 10             	add    $0x10,%esp
  1047a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1047a5:	5b                   	pop    %ebx
  1047a6:	5e                   	pop    %esi
  1047a7:	5f                   	pop    %edi
  1047a8:	5d                   	pop    %ebp
  1047a9:	c3                   	ret
  1047aa:	83 ec 0c             	sub    $0xc,%esp
  1047ad:	bf 65 00 00 00       	mov    $0x65,%edi
  1047b2:	68 3c c0 10 00       	push   $0x10c03c
  1047b7:	e8 54 c4 ff ff       	call   100c10 <terminal_writestring>
  1047bc:	83 c4 10             	add    $0x10,%esp
  1047bf:	eb 8c                	jmp    10474d <memory_heap_dump+0xfd>
  1047c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1047c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1047cf:	00 

001047d0 <memory_slab_dump>:
  1047d0:	55                   	push   %ebp
  1047d1:	89 e5                	mov    %esp,%ebp
  1047d3:	57                   	push   %edi
  1047d4:	31 ff                	xor    %edi,%edi
  1047d6:	56                   	push   %esi
  1047d7:	be e0 43 11 00       	mov    $0x1143e0,%esi
  1047dc:	53                   	push   %ebx
  1047dd:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  1047e0:	83 ec 28             	sub    $0x28,%esp
  1047e3:	68 85 c0 10 00       	push   $0x10c085
  1047e8:	e8 23 c4 ff ff       	call   100c10 <terminal_writestring>
  1047ed:	83 c4 10             	add    $0x10,%esp
  1047f0:	e9 84 00 00 00       	jmp    104879 <memory_slab_dump+0xa9>
  1047f5:	8d 76 00             	lea    0x0(%esi),%esi
  1047f8:	83 ec 0c             	sub    $0xc,%esp
  1047fb:	83 c7 01             	add    $0x1,%edi
  1047fe:	83 c6 1c             	add    $0x1c,%esi
  104801:	68 b2 c0 10 00       	push   $0x10c0b2
  104806:	e8 05 c4 ff ff       	call   100c10 <terminal_writestring>
  10480b:	83 c4 0c             	add    $0xc,%esp
  10480e:	6a 0a                	push   $0xa
  104810:	53                   	push   %ebx
  104811:	ff 76 f8             	push   -0x8(%esi)
  104814:	e8 17 c1 ff ff       	call   100930 <itoa>
  104819:	89 1c 24             	mov    %ebx,(%esp)
  10481c:	e8 ef c3 ff ff       	call   100c10 <terminal_writestring>
  104821:	c7 04 24 ba c0 10 00 	movl   $0x10c0ba,(%esp)
  104828:	e8 e3 c3 ff ff       	call   100c10 <terminal_writestring>
  10482d:	83 c4 0c             	add    $0xc,%esp
  104830:	6a 0a                	push   $0xa
  104832:	53                   	push   %ebx
  104833:	ff 76 f0             	push   -0x10(%esi)
  104836:	e8 f5 c0 ff ff       	call   100930 <itoa>
  10483b:	89 1c 24             	mov    %ebx,(%esp)
  10483e:	e8 cd c3 ff ff       	call   100c10 <terminal_writestring>
  104843:	c7 04 24 c0 c0 10 00 	movl   $0x10c0c0,(%esp)
  10484a:	e8 c1 c3 ff ff       	call   100c10 <terminal_writestring>
  10484f:	83 c4 0c             	add    $0xc,%esp
  104852:	6a 0a                	push   $0xa
  104854:	53                   	push   %ebx
  104855:	ff 76 f4             	push   -0xc(%esi)
  104858:	e8 d3 c0 ff ff       	call   100930 <itoa>
  10485d:	89 1c 24             	mov    %ebx,(%esp)
  104860:	e8 ab c3 ff ff       	call   100c10 <terminal_writestring>
  104865:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10486c:	e8 9f c3 ff ff       	call   100c10 <terminal_writestring>
  104871:	83 c4 10             	add    $0x10,%esp
  104874:	83 ff 09             	cmp    $0x9,%edi
  104877:	74 6a                	je     1048e3 <memory_slab_dump+0x113>
  104879:	83 ec 0c             	sub    $0xc,%esp
  10487c:	68 2b c0 10 00       	push   $0x10c02b
  104881:	e8 8a c3 ff ff       	call   100c10 <terminal_writestring>
  104886:	83 c4 0c             	add    $0xc,%esp
  104889:	6a 0a                	push   $0xa
  10488b:	53                   	push   %ebx
  10488c:	57                   	push   %edi
  10488d:	e8 9e c0 ff ff       	call   100930 <itoa>
  104892:	89 1c 24             	mov    %ebx,(%esp)
  104895:	e8 76 c3 ff ff       	call   100c10 <terminal_writestring>
  10489a:	c7 04 24 9f c0 10 00 	movl   $0x10c09f,(%esp)
  1048a1:	e8 6a c3 ff ff       	call   100c10 <terminal_writestring>
  1048a6:	83 c4 0c             	add    $0xc,%esp
  1048a9:	6a 0a                	push   $0xa
  1048ab:	53                   	push   %ebx
  1048ac:	ff 36                	push   (%esi)
  1048ae:	e8 7d c0 ff ff       	call   100930 <itoa>
  1048b3:	89 1c 24             	mov    %ebx,(%esp)
  1048b6:	e8 55 c3 ff ff       	call   100c10 <terminal_writestring>
  1048bb:	83 c4 10             	add    $0x10,%esp
  1048be:	80 7e 18 00          	cmpb   $0x0,0x18(%esi)
  1048c2:	0f 85 30 ff ff ff    	jne    1047f8 <memory_slab_dump+0x28>
  1048c8:	83 ec 0c             	sub    $0xc,%esp
  1048cb:	83 c7 01             	add    $0x1,%edi
  1048ce:	83 c6 1c             	add    $0x1c,%esi
  1048d1:	68 a7 c0 10 00       	push   $0x10c0a7
  1048d6:	e8 35 c3 ff ff       	call   100c10 <terminal_writestring>
  1048db:	83 c4 10             	add    $0x10,%esp
  1048de:	83 ff 09             	cmp    $0x9,%edi
  1048e1:	75 96                	jne    104879 <memory_slab_dump+0xa9>
  1048e3:	83 ec 0c             	sub    $0xc,%esp
  1048e6:	68 f6 bd 10 00       	push   $0x10bdf6
  1048eb:	e8 20 c3 ff ff       	call   100c10 <terminal_writestring>
  1048f0:	83 c4 10             	add    $0x10,%esp
  1048f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1048f6:	5b                   	pop    %ebx
  1048f7:	5e                   	pop    %esi
  1048f8:	5f                   	pop    %edi
  1048f9:	5d                   	pop    %ebp
  1048fa:	c3                   	ret
  1048fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00104900 <get_total_memory>:
  104900:	a1 30 45 13 00       	mov    0x134530,%eax
  104905:	c1 e0 0c             	shl    $0xc,%eax
  104908:	c3                   	ret
  104909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104910 <get_used_memory>:
  104910:	a1 2c 45 13 00       	mov    0x13452c,%eax
  104915:	c1 e0 0c             	shl    $0xc,%eax
  104918:	c3                   	ret
  104919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104920 <get_free_memory>:
  104920:	a1 30 45 13 00       	mov    0x134530,%eax
  104925:	2b 05 2c 45 13 00    	sub    0x13452c,%eax
  10492b:	c1 e0 0c             	shl    $0xc,%eax
  10492e:	c3                   	ret
  10492f:	90                   	nop

00104930 <get_heap_used>:
  104930:	a1 e8 44 11 00       	mov    0x1144e8,%eax
  104935:	2b 05 e4 44 11 00    	sub    0x1144e4,%eax
  10493b:	c3                   	ret
  10493c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104940 <get_heap_free>:
  104940:	8b 15 ec 44 11 00    	mov    0x1144ec,%edx
  104946:	31 c0                	xor    %eax,%eax
  104948:	85 d2                	test   %edx,%edx
  10494a:	74 13                	je     10495f <get_heap_free+0x1f>
  10494c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104950:	80 7a 14 00          	cmpb   $0x0,0x14(%edx)
  104954:	74 02                	je     104958 <get_heap_free+0x18>
  104956:	03 02                	add    (%edx),%eax
  104958:	8b 52 0c             	mov    0xc(%edx),%edx
  10495b:	85 d2                	test   %edx,%edx
  10495d:	75 f1                	jne    104950 <get_heap_free+0x10>
  10495f:	03 05 18 e0 10 00    	add    0x10e018,%eax
  104965:	2b 05 14 e0 10 00    	sub    0x10e014,%eax
  10496b:	c3                   	ret
  10496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104970 <memory_map_dump>:
  104970:	55                   	push   %ebp
  104971:	89 e5                	mov    %esp,%ebp
  104973:	57                   	push   %edi
  104974:	56                   	push   %esi
  104975:	8d 75 d8             	lea    -0x28(%ebp),%esi
  104978:	53                   	push   %ebx
  104979:	83 ec 28             	sub    $0x28,%esp
  10497c:	68 e8 d2 10 00       	push   $0x10d2e8
  104981:	e8 8a c2 ff ff       	call   100c10 <terminal_writestring>
  104986:	c7 04 24 c7 c0 10 00 	movl   $0x10c0c7,(%esp)
  10498d:	e8 7e c2 ff ff       	call   100c10 <terminal_writestring>
  104992:	a1 30 45 13 00       	mov    0x134530,%eax
  104997:	83 c4 0c             	add    $0xc,%esp
  10499a:	6a 0a                	push   $0xa
  10499c:	c1 e0 0c             	shl    $0xc,%eax
  10499f:	56                   	push   %esi
  1049a0:	c1 e8 14             	shr    $0x14,%eax
  1049a3:	50                   	push   %eax
  1049a4:	e8 87 bf ff ff       	call   100930 <itoa>
  1049a9:	89 34 24             	mov    %esi,(%esp)
  1049ac:	e8 5f c2 ff ff       	call   100c10 <terminal_writestring>
  1049b1:	c7 04 24 d4 c0 10 00 	movl   $0x10c0d4,(%esp)
  1049b8:	e8 53 c2 ff ff       	call   100c10 <terminal_writestring>
  1049bd:	a1 2c 45 13 00       	mov    0x13452c,%eax
  1049c2:	83 c4 0c             	add    $0xc,%esp
  1049c5:	6a 0a                	push   $0xa
  1049c7:	c1 e0 0c             	shl    $0xc,%eax
  1049ca:	56                   	push   %esi
  1049cb:	c1 e8 14             	shr    $0x14,%eax
  1049ce:	50                   	push   %eax
  1049cf:	e8 5c bf ff ff       	call   100930 <itoa>
  1049d4:	89 34 24             	mov    %esi,(%esp)
  1049d7:	e8 34 c2 ff ff       	call   100c10 <terminal_writestring>
  1049dc:	c7 04 24 e0 c0 10 00 	movl   $0x10c0e0,(%esp)
  1049e3:	e8 28 c2 ff ff       	call   100c10 <terminal_writestring>
  1049e8:	a1 30 45 13 00       	mov    0x134530,%eax
  1049ed:	83 c4 0c             	add    $0xc,%esp
  1049f0:	2b 05 2c 45 13 00    	sub    0x13452c,%eax
  1049f6:	c1 e0 0c             	shl    $0xc,%eax
  1049f9:	6a 0a                	push   $0xa
  1049fb:	c1 e8 14             	shr    $0x14,%eax
  1049fe:	56                   	push   %esi
  1049ff:	50                   	push   %eax
  104a00:	e8 2b bf ff ff       	call   100930 <itoa>
  104a05:	89 34 24             	mov    %esi,(%esp)
  104a08:	e8 03 c2 ff ff       	call   100c10 <terminal_writestring>
  104a0d:	c7 04 24 eb c0 10 00 	movl   $0x10c0eb,(%esp)
  104a14:	e8 f7 c1 ff ff       	call   100c10 <terminal_writestring>
  104a19:	c7 04 24 f5 c0 10 00 	movl   $0x10c0f5,(%esp)
  104a20:	e8 eb c1 ff ff       	call   100c10 <terminal_writestring>
  104a25:	83 c4 0c             	add    $0xc,%esp
  104a28:	6a 10                	push   $0x10
  104a2a:	56                   	push   %esi
  104a2b:	ff 35 1c e0 10 00    	push   0x10e01c
  104a31:	e8 fa be ff ff       	call   100930 <itoa>
  104a36:	89 34 24             	mov    %esi,(%esp)
  104a39:	e8 d2 c1 ff ff       	call   100c10 <terminal_writestring>
  104a3e:	c7 04 24 00 c1 10 00 	movl   $0x10c100,(%esp)
  104a45:	e8 c6 c1 ff ff       	call   100c10 <terminal_writestring>
  104a4a:	83 c4 0c             	add    $0xc,%esp
  104a4d:	6a 10                	push   $0x10
  104a4f:	56                   	push   %esi
  104a50:	ff 35 14 e0 10 00    	push   0x10e014
  104a56:	e8 d5 be ff ff       	call   100930 <itoa>
  104a5b:	89 34 24             	mov    %esi,(%esp)
  104a5e:	e8 ad c1 ff ff       	call   100c10 <terminal_writestring>
  104a63:	c7 04 24 06 c1 10 00 	movl   $0x10c106,(%esp)
  104a6a:	e8 a1 c1 ff ff       	call   100c10 <terminal_writestring>
  104a6f:	83 c4 0c             	add    $0xc,%esp
  104a72:	6a 10                	push   $0x10
  104a74:	56                   	push   %esi
  104a75:	ff 35 18 e0 10 00    	push   0x10e018
  104a7b:	e8 b0 be ff ff       	call   100930 <itoa>
  104a80:	89 34 24             	mov    %esi,(%esp)
  104a83:	31 ff                	xor    %edi,%edi
  104a85:	e8 86 c1 ff ff       	call   100c10 <terminal_writestring>
  104a8a:	c7 04 24 32 c8 10 00 	movl   $0x10c832,(%esp)
  104a91:	e8 7a c1 ff ff       	call   100c10 <terminal_writestring>
  104a96:	83 c4 0c             	add    $0xc,%esp
  104a99:	6a 0a                	push   $0xa
  104a9b:	56                   	push   %esi
  104a9c:	ff 35 e0 44 11 00    	push   0x1144e0
  104aa2:	e8 89 be ff ff       	call   100930 <itoa>
  104aa7:	89 34 24             	mov    %esi,(%esp)
  104aaa:	e8 61 c1 ff ff       	call   100c10 <terminal_writestring>
  104aaf:	c7 04 24 0c c1 10 00 	movl   $0x10c10c,(%esp)
  104ab6:	e8 55 c1 ff ff       	call   100c10 <terminal_writestring>
  104abb:	83 c4 0c             	add    $0xc,%esp
  104abe:	6a 0a                	push   $0xa
  104ac0:	56                   	push   %esi
  104ac1:	ff 35 dc 44 11 00    	push   0x1144dc
  104ac7:	e8 64 be ff ff       	call   100930 <itoa>
  104acc:	89 34 24             	mov    %esi,(%esp)
  104acf:	e8 3c c1 ff ff       	call   100c10 <terminal_writestring>
  104ad4:	c7 04 24 16 c1 10 00 	movl   $0x10c116,(%esp)
  104adb:	e8 30 c1 ff ff       	call   100c10 <terminal_writestring>
  104ae0:	c7 04 24 1f c1 10 00 	movl   $0x10c11f,(%esp)
  104ae7:	e8 24 c1 ff ff       	call   100c10 <terminal_writestring>
  104aec:	83 c4 10             	add    $0x10,%esp
  104aef:	90                   	nop
  104af0:	8b 04 bd 00 45 13 00 	mov    0x134500(,%edi,4),%eax
  104af7:	85 c0                	test   %eax,%eax
  104af9:	74 56                	je     104b51 <memory_map_dump+0x1e1>
  104afb:	31 db                	xor    %ebx,%ebx
  104afd:	8d 76 00             	lea    0x0(%esi),%esi
  104b00:	8b 00                	mov    (%eax),%eax
  104b02:	83 c3 01             	add    $0x1,%ebx
  104b05:	85 c0                	test   %eax,%eax
  104b07:	75 f7                	jne    104b00 <memory_map_dump+0x190>
  104b09:	85 db                	test   %ebx,%ebx
  104b0b:	74 44                	je     104b51 <memory_map_dump+0x1e1>
  104b0d:	83 ec 0c             	sub    $0xc,%esp
  104b10:	68 34 c1 10 00       	push   $0x10c134
  104b15:	e8 f6 c0 ff ff       	call   100c10 <terminal_writestring>
  104b1a:	83 c4 0c             	add    $0xc,%esp
  104b1d:	6a 0a                	push   $0xa
  104b1f:	56                   	push   %esi
  104b20:	57                   	push   %edi
  104b21:	e8 0a be ff ff       	call   100930 <itoa>
  104b26:	89 34 24             	mov    %esi,(%esp)
  104b29:	e8 e2 c0 ff ff       	call   100c10 <terminal_writestring>
  104b2e:	c7 04 24 32 c1 10 00 	movl   $0x10c132,(%esp)
  104b35:	e8 d6 c0 ff ff       	call   100c10 <terminal_writestring>
  104b3a:	83 c4 0c             	add    $0xc,%esp
  104b3d:	6a 0a                	push   $0xa
  104b3f:	56                   	push   %esi
  104b40:	53                   	push   %ebx
  104b41:	e8 ea bd ff ff       	call   100930 <itoa>
  104b46:	89 34 24             	mov    %esi,(%esp)
  104b49:	e8 c2 c0 ff ff       	call   100c10 <terminal_writestring>
  104b4e:	83 c4 10             	add    $0x10,%esp
  104b51:	83 c7 01             	add    $0x1,%edi
  104b54:	83 ff 0b             	cmp    $0xb,%edi
  104b57:	75 97                	jne    104af0 <memory_map_dump+0x180>
  104b59:	83 ec 0c             	sub    $0xc,%esp
  104b5c:	68 0c d3 10 00       	push   $0x10d30c
  104b61:	e8 aa c0 ff ff       	call   100c10 <terminal_writestring>
  104b66:	83 c4 10             	add    $0x10,%esp
  104b69:	8d 65 f4             	lea    -0xc(%ebp),%esp
  104b6c:	5b                   	pop    %ebx
  104b6d:	5e                   	pop    %esi
  104b6e:	5f                   	pop    %edi
  104b6f:	5d                   	pop    %ebp
  104b70:	c3                   	ret
  104b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104b78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104b7f:	00 

00104b80 <memory_set_readonly>:
  104b80:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  104b87:	75 07                	jne    104b90 <memory_set_readonly+0x10>
  104b89:	c3                   	ret
  104b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104b90:	55                   	push   %ebp
  104b91:	89 e5                	mov    %esp,%ebp
  104b93:	c7 45 08 30 d3 10 00 	movl   $0x10d330,0x8(%ebp)
  104b9a:	5d                   	pop    %ebp
  104b9b:	e9 70 c0 ff ff       	jmp    100c10 <terminal_writestring>

00104ba0 <memory_set_readwrite>:
  104ba0:	80 3d c0 43 11 00 00 	cmpb   $0x0,0x1143c0
  104ba7:	75 07                	jne    104bb0 <memory_set_readwrite+0x10>
  104ba9:	c3                   	ret
  104baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104bb0:	55                   	push   %ebp
  104bb1:	89 e5                	mov    %esp,%ebp
  104bb3:	c7 45 08 5c d3 10 00 	movl   $0x10d35c,0x8(%ebp)
  104bba:	5d                   	pop    %ebp
  104bbb:	e9 50 c0 ff ff       	jmp    100c10 <terminal_writestring>

00104bc0 <memory_init>:
  104bc0:	55                   	push   %ebp
  104bc1:	89 e5                	mov    %esp,%ebp
  104bc3:	57                   	push   %edi
  104bc4:	56                   	push   %esi
  104bc5:	53                   	push   %ebx
  104bc6:	83 ec 38             	sub    $0x38,%esp
  104bc9:	68 88 d3 10 00       	push   $0x10d388
  104bce:	e8 3d c0 ff ff       	call   100c10 <terminal_writestring>
  104bd3:	83 c4 0c             	add    $0xc,%esp
  104bd6:	c7 05 30 45 13 00 00 	movl   $0x8000,0x134530
  104bdd:	80 00 00 
  104be0:	68 00 00 02 00       	push   $0x20000
  104be5:	6a 00                	push   $0x0
  104be7:	68 00 45 11 00       	push   $0x114500
  104bec:	e8 af b8 ff ff       	call   1004a0 <memset>
  104bf1:	83 c4 10             	add    $0x10,%esp
  104bf4:	b8 01 00 00 00       	mov    $0x1,%eax
  104bf9:	c7 05 00 45 13 00 00 	movl   $0x0,0x134500
  104c00:	00 00 00 
  104c03:	eb 1b                	jmp    104c20 <memory_init+0x60>
  104c05:	8d 76 00             	lea    0x0(%esi),%esi
  104c08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104c0f:	00 
  104c10:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104c17:	00 
  104c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104c1f:	00 
  104c20:	c7 04 85 00 45 13 00 	movl   $0x0,0x134500(,%eax,4)
  104c27:	00 00 00 00 
  104c2b:	c7 04 85 04 45 13 00 	movl   $0x0,0x134504(,%eax,4)
  104c32:	00 00 00 00 
  104c36:	83 c0 02             	add    $0x2,%eax
  104c39:	83 f8 0b             	cmp    $0xb,%eax
  104c3c:	75 e2                	jne    104c20 <memory_init+0x60>
  104c3e:	8b 0d 30 45 13 00    	mov    0x134530,%ecx
  104c44:	b8 40 45 13 00       	mov    $0x134540,%eax
  104c49:	89 ca                	mov    %ecx,%edx
  104c4b:	c1 e2 04             	shl    $0x4,%edx
  104c4e:	01 c2                	add    %eax,%edx
  104c50:	85 c9                	test   %ecx,%ecx
  104c52:	0f 84 02 01 00 00    	je     104d5a <memory_init+0x19a>
  104c58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104c5f:	00 
  104c60:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  104c66:	83 c0 10             	add    $0x10,%eax
  104c69:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
  104c70:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
  104c77:	c6 40 fc 01          	movb   $0x1,-0x4(%eax)
  104c7b:	39 d0                	cmp    %edx,%eax
  104c7d:	75 e1                	jne    104c60 <memory_init+0xa0>
  104c7f:	b8 00 10 00 00       	mov    $0x1000,%eax
  104c84:	89 ce                	mov    %ecx,%esi
  104c86:	39 c1                	cmp    %eax,%ecx
  104c88:	0f 46 c1             	cmovbe %ecx,%eax
  104c8b:	89 c3                	mov    %eax,%ebx
  104c8d:	29 c6                	sub    %eax,%esi
  104c8f:	0f 84 99 00 00 00    	je     104d2e <memory_init+0x16e>
  104c95:	89 45 c8             	mov    %eax,-0x38(%ebp)
  104c98:	bf 01 00 00 00       	mov    $0x1,%edi
  104c9d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  104ca2:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  104ca5:	89 c6                	mov    %eax,%esi
  104ca7:	90                   	nop
  104ca8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104caf:	00 
  104cb0:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
  104cb3:	b9 0a 00 00 00       	mov    $0xa,%ecx
  104cb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104cbf:	00 
  104cc0:	89 f8                	mov    %edi,%eax
  104cc2:	d3 e0                	shl    %cl,%eax
  104cc4:	39 c3                	cmp    %eax,%ebx
  104cc6:	0f 83 54 02 00 00    	jae    104f20 <memory_init+0x360>
  104ccc:	83 e9 01             	sub    $0x1,%ecx
  104ccf:	75 ef                	jne    104cc0 <memory_init+0x100>
  104cd1:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
  104cd4:	89 f0                	mov    %esi,%eax
  104cd6:	c1 e0 04             	shl    $0x4,%eax
  104cd9:	89 c3                	mov    %eax,%ebx
  104cdb:	89 88 48 45 13 00    	mov    %ecx,0x134548(%eax)
  104ce1:	c6 80 4c 45 13 00 00 	movb   $0x0,0x13454c(%eax)
  104ce8:	05 40 45 13 00       	add    $0x134540,%eax
  104ced:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  104cf4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  104cf7:	8b 04 8d 00 45 13 00 	mov    0x134500(,%ecx,4),%eax
  104cfe:	89 45 cc             	mov    %eax,-0x34(%ebp)
  104d01:	89 d8                	mov    %ebx,%eax
  104d03:	8b 5d cc             	mov    -0x34(%ebp),%ebx
  104d06:	89 98 40 45 13 00    	mov    %ebx,0x134540(%eax)
  104d0c:	85 db                	test   %ebx,%ebx
  104d0e:	74 06                	je     104d16 <memory_init+0x156>
  104d10:	8b 45 d0             	mov    -0x30(%ebp),%eax
  104d13:	89 43 04             	mov    %eax,0x4(%ebx)
  104d16:	8b 45 d0             	mov    -0x30(%ebp),%eax
  104d19:	89 04 8d 00 45 13 00 	mov    %eax,0x134500(,%ecx,4)
  104d20:	89 f8                	mov    %edi,%eax
  104d22:	d3 e0                	shl    %cl,%eax
  104d24:	01 c6                	add    %eax,%esi
  104d26:	29 45 d4             	sub    %eax,-0x2c(%ebp)
  104d29:	75 85                	jne    104cb0 <memory_init+0xf0>
  104d2b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  104d2e:	31 c9                	xor    %ecx,%ecx
  104d30:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d37:	00 
  104d38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104d3f:	00 
  104d40:	89 c8                	mov    %ecx,%eax
  104d42:	ba 01 00 00 00       	mov    $0x1,%edx
  104d47:	d3 e2                	shl    %cl,%edx
  104d49:	c1 e8 05             	shr    $0x5,%eax
  104d4c:	83 c1 01             	add    $0x1,%ecx
  104d4f:	09 14 85 00 45 11 00 	or     %edx,0x114500(,%eax,4)
  104d56:	39 cb                	cmp    %ecx,%ebx
  104d58:	75 e6                	jne    104d40 <memory_init+0x180>
  104d5a:	c7 05 1c e0 10 00 00 	movl   $0x1000000,0x10e01c
  104d61:	00 00 01 
  104d64:	b8 f8 43 11 00       	mov    $0x1143f8,%eax
  104d69:	ba f4 44 11 00       	mov    $0x1144f4,%edx
  104d6e:	c7 05 18 e0 10 00 00 	movl   $0x10000000,0x10e018
  104d75:	00 00 10 
  104d78:	c7 05 14 e0 10 00 00 	movl   $0x1000000,0x10e014
  104d7f:	00 00 01 
  104d82:	c7 05 ec 44 11 00 00 	movl   $0x0,0x1144ec
  104d89:	00 00 00 
  104d8c:	c7 05 e8 44 11 00 00 	movl   $0x0,0x1144e8
  104d93:	00 00 00 
  104d96:	c7 05 e4 44 11 00 00 	movl   $0x0,0x1144e4
  104d9d:	00 00 00 
  104da0:	c7 05 e0 44 11 00 00 	movl   $0x0,0x1144e0
  104da7:	00 00 00 
  104daa:	c7 05 dc 44 11 00 00 	movl   $0x0,0x1144dc
  104db1:	00 00 00 
  104db4:	c6 00 00             	movb   $0x0,(%eax)
  104db7:	83 c0 54             	add    $0x54,%eax
  104dba:	c6 40 c8 00          	movb   $0x0,-0x38(%eax)
  104dbe:	c6 40 e4 00          	movb   $0x0,-0x1c(%eax)
  104dc2:	39 c2                	cmp    %eax,%edx
  104dc4:	75 ee                	jne    104db4 <memory_init+0x1f4>
  104dc6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  104dcd:	bb e0 43 11 00       	mov    $0x1143e0,%ebx
  104dd2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  104dd5:	8b 0c 85 20 b2 10 00 	mov    0x10b220(,%eax,4),%ecx
  104ddc:	b8 01 00 00 00       	mov    $0x1,%eax
  104de1:	89 0b                	mov    %ecx,(%ebx)
  104de3:	81 f9 fc 0f 00 00    	cmp    $0xffc,%ecx
  104de9:	77 09                	ja     104df4 <memory_init+0x234>
  104deb:	b8 fc 0f 00 00       	mov    $0xffc,%eax
  104df0:	31 d2                	xor    %edx,%edx
  104df2:	f7 f1                	div    %ecx
  104df4:	89 43 04             	mov    %eax,0x4(%ebx)
  104df7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  104dfe:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  104e05:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
  104e0c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  104e13:	c6 43 18 01          	movb   $0x1,0x18(%ebx)
  104e17:	31 c0                	xor    %eax,%eax
  104e19:	e8 12 e9 ff ff       	call   103730 <buddy_alloc_pages.part.0>
  104e1e:	83 f8 ff             	cmp    $0xffffffff,%eax
  104e21:	0f 84 37 01 00 00    	je     104f5e <memory_init+0x39e>
  104e27:	83 ec 04             	sub    $0x4,%esp
  104e2a:	c1 e0 0c             	shl    $0xc,%eax
  104e2d:	68 00 10 00 00       	push   $0x1000
  104e32:	89 c6                	mov    %eax,%esi
  104e34:	6a 00                	push   $0x0
  104e36:	50                   	push   %eax
  104e37:	e8 64 b6 ff ff       	call   1004a0 <memset>
  104e3c:	83 c4 10             	add    $0x10,%esp
  104e3f:	85 f6                	test   %esi,%esi
  104e41:	74 43                	je     104e86 <memory_init+0x2c6>
  104e43:	8b 7b 04             	mov    0x4(%ebx),%edi
  104e46:	85 ff                	test   %edi,%edi
  104e48:	74 35                	je     104e7f <memory_init+0x2bf>
  104e4a:	8b 03                	mov    (%ebx),%eax
  104e4c:	8b 4b 08             	mov    0x8(%ebx),%ecx
  104e4f:	89 5d c8             	mov    %ebx,-0x38(%ebp)
  104e52:	31 d2                	xor    %edx,%edx
  104e54:	89 75 cc             	mov    %esi,-0x34(%ebp)
  104e57:	89 45 d0             	mov    %eax,-0x30(%ebp)
  104e5a:	89 f0                	mov    %esi,%eax
  104e5c:	8b 75 d0             	mov    -0x30(%ebp),%esi
  104e5f:	90                   	nop
  104e60:	89 cb                	mov    %ecx,%ebx
  104e62:	83 c2 01             	add    $0x1,%edx
  104e65:	89 c1                	mov    %eax,%ecx
  104e67:	89 18                	mov    %ebx,(%eax)
  104e69:	01 f0                	add    %esi,%eax
  104e6b:	39 d7                	cmp    %edx,%edi
  104e6d:	75 f1                	jne    104e60 <memory_init+0x2a0>
  104e6f:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  104e72:	8d 47 ff             	lea    -0x1(%edi),%eax
  104e75:	0f af 45 d0          	imul   -0x30(%ebp),%eax
  104e79:	03 45 cc             	add    -0x34(%ebp),%eax
  104e7c:	89 43 08             	mov    %eax,0x8(%ebx)
  104e7f:	01 7b 0c             	add    %edi,0xc(%ebx)
  104e82:	83 43 14 01          	addl   $0x1,0x14(%ebx)
  104e86:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  104e8a:	83 c3 1c             	add    $0x1c,%ebx
  104e8d:	83 7d d4 03          	cmpl   $0x3,-0x2c(%ebp)
  104e91:	0f 85 3b ff ff ff    	jne    104dd2 <memory_init+0x212>
  104e97:	83 ec 0c             	sub    $0xc,%esp
  104e9a:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  104e9d:	68 3b c1 10 00       	push   $0x10c13b
  104ea2:	e8 69 bd ff ff       	call   100c10 <terminal_writestring>
  104ea7:	a1 30 45 13 00       	mov    0x134530,%eax
  104eac:	83 c4 0c             	add    $0xc,%esp
  104eaf:	6a 0a                	push   $0xa
  104eb1:	c1 e0 0c             	shl    $0xc,%eax
  104eb4:	53                   	push   %ebx
  104eb5:	c1 e8 14             	shr    $0x14,%eax
  104eb8:	50                   	push   %eax
  104eb9:	e8 72 ba ff ff       	call   100930 <itoa>
  104ebe:	89 1c 24             	mov    %ebx,(%esp)
  104ec1:	e8 4a bd ff ff       	call   100c10 <terminal_writestring>
  104ec6:	c7 04 24 45 c1 10 00 	movl   $0x10c145,(%esp)
  104ecd:	e8 3e bd ff ff       	call   100c10 <terminal_writestring>
  104ed2:	83 c4 0c             	add    $0xc,%esp
  104ed5:	6a 0a                	push   $0xa
  104ed7:	53                   	push   %ebx
  104ed8:	ff 35 30 45 13 00    	push   0x134530
  104ede:	e8 4d ba ff ff       	call   100930 <itoa>
  104ee3:	89 1c 24             	mov    %ebx,(%esp)
  104ee6:	e8 25 bd ff ff       	call   100c10 <terminal_writestring>
  104eeb:	c7 04 24 4b c1 10 00 	movl   $0x10c14b,(%esp)
  104ef2:	e8 19 bd ff ff       	call   100c10 <terminal_writestring>
  104ef7:	c7 04 24 a8 d3 10 00 	movl   $0x10d3a8,(%esp)
  104efe:	e8 0d bd ff ff       	call   100c10 <terminal_writestring>
  104f03:	c7 04 24 54 c1 10 00 	movl   $0x10c154,(%esp)
  104f0a:	e8 01 bd ff ff       	call   100c10 <terminal_writestring>
  104f0f:	83 c4 10             	add    $0x10,%esp
  104f12:	8d 65 f4             	lea    -0xc(%ebp),%esp
  104f15:	5b                   	pop    %ebx
  104f16:	5e                   	pop    %esi
  104f17:	5f                   	pop    %edi
  104f18:	5d                   	pop    %ebp
  104f19:	c3                   	ret
  104f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104f20:	89 d0                	mov    %edx,%eax
  104f22:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
  104f25:	d3 e0                	shl    %cl,%eax
  104f27:	f7 d0                	not    %eax
  104f29:	85 f0                	test   %esi,%eax
  104f2b:	0f 84 a3 fd ff ff    	je     104cd4 <memory_init+0x114>
  104f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104f3f:	00 
  104f40:	83 e9 01             	sub    $0x1,%ecx
  104f43:	89 d0                	mov    %edx,%eax
  104f45:	d3 e0                	shl    %cl,%eax
  104f47:	f7 d0                	not    %eax
  104f49:	85 f0                	test   %esi,%eax
  104f4b:	75 f3                	jne    104f40 <memory_init+0x380>
  104f4d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
  104f50:	83 f9 0a             	cmp    $0xa,%ecx
  104f53:	0f 86 7b fd ff ff    	jbe    104cd4 <memory_init+0x114>
  104f59:	e9 c2 fd ff ff       	jmp    104d20 <memory_init+0x160>
  104f5e:	83 ec 0c             	sub    $0xc,%esp
  104f61:	68 38 bf 10 00       	push   $0x10bf38
  104f66:	e8 a5 bc ff ff       	call   100c10 <terminal_writestring>
  104f6b:	83 c4 10             	add    $0x10,%esp
  104f6e:	e9 13 ff ff ff       	jmp    104e86 <memory_init+0x2c6>
  104f73:	66 90                	xchg   %ax,%ax
  104f75:	66 90                	xchg   %ax,%ax
  104f77:	66 90                	xchg   %ax,%ax
  104f79:	66 90                	xchg   %ax,%ax
  104f7b:	66 90                	xchg   %ax,%ax
  104f7d:	66 90                	xchg   %ax,%ax
  104f7f:	90                   	nop

00104f80 <idle_thread_entry>:
  104f80:	f4                   	hlt
  104f81:	eb fd                	jmp    104f80 <idle_thread_entry>
  104f83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  104f88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104f8f:	00 

00104f90 <allocate_pid>:
  104f90:	8b 15 24 e0 10 00    	mov    0x10e024,%edx
  104f96:	b9 01 00 00 00       	mov    $0x1,%ecx
  104f9b:	8d 42 01             	lea    0x1(%edx),%eax
  104f9e:	3d ff fe ff ff       	cmp    $0xfffffeff,%eax
  104fa3:	0f 47 c1             	cmova  %ecx,%eax
  104fa6:	a3 24 e0 10 00       	mov    %eax,0x10e024
  104fab:	89 d0                	mov    %edx,%eax
  104fad:	c3                   	ret
  104fae:	66 90                	xchg   %ax,%ax

00104fb0 <thread_create_ex>:
  104fb0:	55                   	push   %ebp
  104fb1:	89 e5                	mov    %esp,%ebp
  104fb3:	57                   	push   %edi
  104fb4:	56                   	push   %esi
  104fb5:	53                   	push   %ebx
  104fb6:	83 ec 1c             	sub    $0x1c,%esp
  104fb9:	8b 45 18             	mov    0x18(%ebp),%eax
  104fbc:	8b 7d 08             	mov    0x8(%ebp),%edi
  104fbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  104fc2:	85 ff                	test   %edi,%edi
  104fc4:	0f 84 26 02 00 00    	je     1051f0 <thread_create_ex+0x240>
  104fca:	8b 45 08             	mov    0x8(%ebp),%eax
  104fcd:	83 b8 50 01 00 00 07 	cmpl   $0x7,0x150(%eax)
  104fd4:	0f 87 16 02 00 00    	ja     1051f0 <thread_create_ex+0x240>
  104fda:	b8 e0 49 13 01       	mov    $0x11349e0,%eax
  104fdf:	31 db                	xor    %ebx,%ebx
  104fe1:	eb 31                	jmp    105014 <thread_create_ex+0x64>
  104fe3:	eb 1b                	jmp    105000 <thread_create_ex+0x50>
  104fe5:	8d 76 00             	lea    0x0(%esi),%esi
  104fe8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104fef:	00 
  104ff0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104ff7:	00 
  104ff8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104fff:	00 
  105000:	83 c3 01             	add    $0x1,%ebx
  105003:	05 88 00 00 00       	add    $0x88,%eax
  105008:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
  10500e:	0f 84 dc 01 00 00    	je     1051f0 <thread_create_ex+0x240>
  105014:	8b 30                	mov    (%eax),%esi
  105016:	85 f6                	test   %esi,%esi
  105018:	75 e6                	jne    105000 <thread_create_ex+0x50>
  10501a:	69 fb 88 00 00 00    	imul   $0x88,%ebx,%edi
  105020:	83 ec 04             	sub    $0x4,%esp
  105023:	68 88 00 00 00       	push   $0x88
  105028:	6a 00                	push   $0x0
  10502a:	8d b7 e0 49 13 01    	lea    0x11349e0(%edi),%esi
  105030:	56                   	push   %esi
  105031:	e8 6a b4 ff ff       	call   1004a0 <memset>
  105036:	8b 15 20 e0 10 00    	mov    0x10e020,%edx
  10503c:	83 c4 10             	add    $0x10,%esp
  10503f:	b9 01 00 00 00       	mov    $0x1,%ecx
  105044:	8d 42 01             	lea    0x1(%edx),%eax
  105047:	89 97 e0 49 13 01    	mov    %edx,0x11349e0(%edi)
  10504d:	3d ff fe ff ff       	cmp    $0xfffffeff,%eax
  105052:	0f 47 c1             	cmova  %ecx,%eax
  105055:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  105058:	a3 20 e0 10 00       	mov    %eax,0x10e020
  10505d:	85 c9                	test   %ecx,%ecx
  10505f:	74 1b                	je     10507c <thread_create_ex+0xcc>
  105061:	83 ec 04             	sub    $0x4,%esp
  105064:	8d 87 e4 49 13 01    	lea    0x11349e4(%edi),%eax
  10506a:	6a 1f                	push   $0x1f
  10506c:	ff 75 0c             	push   0xc(%ebp)
  10506f:	50                   	push   %eax
  105070:	e8 8b b5 ff ff       	call   100600 <strncpy>
  105075:	c6 46 23 00          	movb   $0x0,0x23(%esi)
  105079:	83 c4 10             	add    $0x10,%esp
  10507c:	69 cb 88 00 00 00    	imul   $0x88,%ebx,%ecx
  105082:	8b 45 08             	mov    0x8(%ebp),%eax
  105085:	83 ec 0c             	sub    $0xc,%esp
  105088:	89 81 08 4a 13 01    	mov    %eax,0x1134a08(%ecx)
  10508e:	8b 45 14             	mov    0x14(%ebp),%eax
  105091:	c7 81 04 4a 13 01 05 	movl   $0x5,0x1134a04(%ecx)
  105098:	00 00 00 
  10509b:	89 81 54 4a 13 01    	mov    %eax,0x1134a54(%ecx)
  1050a1:	c7 81 58 4a 13 01 05 	movl   $0x5,0x1134a58(%ecx)
  1050a8:	00 00 00 
  1050ab:	c7 81 5c 4a 13 01 00 	movl   $0x0,0x1134a5c(%ecx)
  1050b2:	00 00 00 
  1050b5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  1050b8:	68 00 10 00 00       	push   $0x1000
  1050bd:	e8 fe ea ff ff       	call   103bc0 <kmalloc>
  1050c2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  1050c5:	83 c4 10             	add    $0x10,%esp
  1050c8:	89 81 4c 4a 13 01    	mov    %eax,0x1134a4c(%ecx)
  1050ce:	85 c0                	test   %eax,%eax
  1050d0:	0f 84 1a 01 00 00    	je     1051f0 <thread_create_ex+0x240>
  1050d6:	83 ec 04             	sub    $0x4,%esp
  1050d9:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  1050df:	81 c7 0c 4a 13 01    	add    $0x1134a0c,%edi
  1050e5:	89 55 e0             	mov    %edx,-0x20(%ebp)
  1050e8:	6a 40                	push   $0x40
  1050ea:	6a 00                	push   $0x0
  1050ec:	57                   	push   %edi
  1050ed:	e8 ae b3 ff ff       	call   1004a0 <memset>
  1050f2:	83 c4 10             	add    $0x10,%esp
  1050f5:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  1050f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1050fc:	0f 85 ce 00 00 00    	jne    1051d0 <thread_create_ex+0x220>
  105102:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%ebp)
  105109:	b9 10 00 00 00       	mov    $0x10,%ecx
  10510e:	69 c3 88 00 00 00    	imul   $0x88,%ebx,%eax
  105114:	8b 7d 10             	mov    0x10(%ebp),%edi
  105117:	89 90 28 4a 13 01    	mov    %edx,0x1134a28(%eax)
  10511d:	89 b8 2c 4a 13 01    	mov    %edi,0x1134a2c(%eax)
  105123:	8b 7d 08             	mov    0x8(%ebp),%edi
  105126:	89 90 24 4a 13 01    	mov    %edx,0x1134a24(%eax)
  10512c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10512f:	89 88 38 4a 13 01    	mov    %ecx,0x1134a38(%eax)
  105135:	89 88 3c 4a 13 01    	mov    %ecx,0x1134a3c(%eax)
  10513b:	89 88 40 4a 13 01    	mov    %ecx,0x1134a40(%eax)
  105141:	89 88 44 4a 13 01    	mov    %ecx,0x1134a44(%eax)
  105147:	89 88 48 4a 13 01    	mov    %ecx,0x1134a48(%eax)
  10514d:	89 90 34 4a 13 01    	mov    %edx,0x1134a34(%eax)
  105153:	c7 80 30 4a 13 01 02 	movl   $0x202,0x1134a30(%eax)
  10515a:	02 00 00 
  10515d:	8b 97 50 01 00 00    	mov    0x150(%edi),%edx
  105163:	8d 4a 01             	lea    0x1(%edx),%ecx
  105166:	89 8f 50 01 00 00    	mov    %ecx,0x150(%edi)
  10516c:	89 b4 97 30 01 00 00 	mov    %esi,0x130(%edi,%edx,4)
  105173:	8b 15 d4 49 13 01    	mov    0x11349d4,%edx
  105179:	c7 80 04 4a 13 01 00 	movl   $0x0,0x1134a04(%eax)
  105180:	00 00 00 
  105183:	c7 80 60 4a 13 01 00 	movl   $0x0,0x1134a60(%eax)
  10518a:	00 00 00 
  10518d:	c7 80 64 4a 13 01 00 	movl   $0x0,0x1134a64(%eax)
  105194:	00 00 00 
  105197:	85 d2                	test   %edx,%edx
  105199:	74 4d                	je     1051e8 <thread_create_ex+0x238>
  10519b:	8b 15 d0 49 13 01    	mov    0x11349d0,%edx
  1051a1:	89 b2 80 00 00 00    	mov    %esi,0x80(%edx)
  1051a7:	89 90 64 4a 13 01    	mov    %edx,0x1134a64(%eax)
  1051ad:	69 db 88 00 00 00    	imul   $0x88,%ebx,%ebx
  1051b3:	89 35 d0 49 13 01    	mov    %esi,0x11349d0
  1051b9:	8b 83 e0 49 13 01    	mov    0x11349e0(%ebx),%eax
  1051bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1051c2:	5b                   	pop    %ebx
  1051c3:	5e                   	pop    %esi
  1051c4:	5f                   	pop    %edi
  1051c5:	5d                   	pop    %ebp
  1051c6:	c3                   	ret
  1051c7:	90                   	nop
  1051c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1051cf:	00 
  1051d0:	c7 45 e4 1b 00 00 00 	movl   $0x1b,-0x1c(%ebp)
  1051d7:	b9 23 00 00 00       	mov    $0x23,%ecx
  1051dc:	e9 2d ff ff ff       	jmp    10510e <thread_create_ex+0x15e>
  1051e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1051e8:	89 35 d4 49 13 01    	mov    %esi,0x11349d4
  1051ee:	eb bd                	jmp    1051ad <thread_create_ex+0x1fd>
  1051f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1051f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1051f8:	5b                   	pop    %ebx
  1051f9:	5e                   	pop    %esi
  1051fa:	5f                   	pop    %edi
  1051fb:	5d                   	pop    %ebp
  1051fc:	c3                   	ret
  1051fd:	8d 76 00             	lea    0x0(%esi),%esi

00105200 <thread_create>:
  105200:	55                   	push   %ebp
  105201:	89 e5                	mov    %esp,%ebp
  105203:	83 ec 14             	sub    $0x14,%esp
  105206:	6a 00                	push   $0x0
  105208:	ff 75 14             	push   0x14(%ebp)
  10520b:	ff 75 10             	push   0x10(%ebp)
  10520e:	ff 75 0c             	push   0xc(%ebp)
  105211:	ff 75 08             	push   0x8(%ebp)
  105214:	e8 97 fd ff ff       	call   104fb0 <thread_create_ex>
  105219:	c9                   	leave
  10521a:	c3                   	ret
  10521b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105220 <process_create_ex>:
  105220:	55                   	push   %ebp
  105221:	89 e5                	mov    %esp,%ebp
  105223:	57                   	push   %edi
  105224:	56                   	push   %esi
  105225:	53                   	push   %ebx
  105226:	31 db                	xor    %ebx,%ebx
  105228:	83 ec 1c             	sub    $0x1c,%esp
  10522b:	8b 45 14             	mov    0x14(%ebp),%eax
  10522e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  105231:	b8 e0 8d 13 01       	mov    $0x1138de0,%eax
  105236:	eb 19                	jmp    105251 <process_create_ex+0x31>
  105238:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10523f:	00 
  105240:	83 c3 01             	add    $0x1,%ebx
  105243:	05 80 01 00 00       	add    $0x180,%eax
  105248:	83 fb 40             	cmp    $0x40,%ebx
  10524b:	0f 84 e9 00 00 00    	je     10533a <process_create_ex+0x11a>
  105251:	8b 10                	mov    (%eax),%edx
  105253:	85 d2                	test   %edx,%edx
  105255:	75 e9                	jne    105240 <process_create_ex+0x20>
  105257:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  10525a:	83 ec 04             	sub    $0x4,%esp
  10525d:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  105260:	89 45 e0             	mov    %eax,-0x20(%ebp)
  105263:	c1 e6 07             	shl    $0x7,%esi
  105266:	68 80 01 00 00       	push   $0x180
  10526b:	8d be e0 8d 13 01    	lea    0x1138de0(%esi),%edi
  105271:	6a 00                	push   $0x0
  105273:	57                   	push   %edi
  105274:	e8 27 b2 ff ff       	call   1004a0 <memset>
  105279:	8b 15 24 e0 10 00    	mov    0x10e024,%edx
  10527f:	83 c4 10             	add    $0x10,%esp
  105282:	b9 01 00 00 00       	mov    $0x1,%ecx
  105287:	8d 42 01             	lea    0x1(%edx),%eax
  10528a:	89 96 e0 8d 13 01    	mov    %edx,0x1138de0(%esi)
  105290:	3d ff fe ff ff       	cmp    $0xfffffeff,%eax
  105295:	0f 47 c1             	cmova  %ecx,%eax
  105298:	a3 24 e0 10 00       	mov    %eax,0x10e024
  10529d:	8b 45 08             	mov    0x8(%ebp),%eax
  1052a0:	85 c0                	test   %eax,%eax
  1052a2:	74 1b                	je     1052bf <process_create_ex+0x9f>
  1052a4:	83 ec 04             	sub    $0x4,%esp
  1052a7:	81 c6 e4 8d 13 01    	add    $0x1138de4,%esi
  1052ad:	6a 1f                	push   $0x1f
  1052af:	ff 75 08             	push   0x8(%ebp)
  1052b2:	56                   	push   %esi
  1052b3:	e8 48 b3 ff ff       	call   100600 <strncpy>
  1052b8:	c6 47 23 00          	movb   $0x0,0x23(%edi)
  1052bc:	83 c4 10             	add    $0x10,%esp
  1052bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1052c2:	83 ec 0c             	sub    $0xc,%esp
  1052c5:	01 c3                	add    %eax,%ebx
  1052c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1052ca:	c1 e3 07             	shl    $0x7,%ebx
  1052cd:	89 83 34 8f 13 01    	mov    %eax,0x1138f34(%ebx)
  1052d3:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  1052d7:	c7 83 04 8e 13 01 05 	movl   $0x5,0x1138e04(%ebx)
  1052de:	00 00 00 
  1052e1:	c7 83 38 8f 13 01 05 	movl   $0x5,0x1138f38(%ebx)
  1052e8:	00 00 00 
  1052eb:	c7 83 30 8f 13 01 00 	movl   $0x0,0x1138f30(%ebx)
  1052f2:	00 00 00 
  1052f5:	c7 83 0c 8f 13 01 00 	movl   $0x0,0x1138f0c(%ebx)
  1052fc:	00 00 00 
  1052ff:	c7 83 50 8f 13 01 00 	movl   $0x0,0x1138f50(%ebx)
  105306:	00 00 00 
  105309:	50                   	push   %eax
  10530a:	ff 75 10             	push   0x10(%ebp)
  10530d:	ff 75 0c             	push   0xc(%ebp)
  105310:	68 ed c1 10 00       	push   $0x10c1ed
  105315:	57                   	push   %edi
  105316:	e8 95 fc ff ff       	call   104fb0 <thread_create_ex>
  10531b:	83 c4 20             	add    $0x20,%esp
  10531e:	85 c0                	test   %eax,%eax
  105320:	78 0e                	js     105330 <process_create_ex+0x110>
  105322:	8b 83 e0 8d 13 01    	mov    0x1138de0(%ebx),%eax
  105328:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10532b:	5b                   	pop    %ebx
  10532c:	5e                   	pop    %esi
  10532d:	5f                   	pop    %edi
  10532e:	5d                   	pop    %ebp
  10532f:	c3                   	ret
  105330:	c7 83 e0 8d 13 01 00 	movl   $0x0,0x1138de0(%ebx)
  105337:	00 00 00 
  10533a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10533d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105342:	5b                   	pop    %ebx
  105343:	5e                   	pop    %esi
  105344:	5f                   	pop    %edi
  105345:	5d                   	pop    %ebp
  105346:	c3                   	ret
  105347:	90                   	nop
  105348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10534f:	00 

00105350 <process_create>:
  105350:	55                   	push   %ebp
  105351:	89 e5                	mov    %esp,%ebp
  105353:	83 ec 08             	sub    $0x8,%esp
  105356:	6a 01                	push   $0x1
  105358:	ff 75 10             	push   0x10(%ebp)
  10535b:	ff 75 0c             	push   0xc(%ebp)
  10535e:	ff 75 08             	push   0x8(%ebp)
  105361:	e8 ba fe ff ff       	call   105220 <process_create_ex>
  105366:	c9                   	leave
  105367:	c3                   	ret
  105368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10536f:	00 

00105370 <schedule>:
  105370:	55                   	push   %ebp
  105371:	89 e5                	mov    %esp,%ebp
  105373:	83 ec 08             	sub    $0x8,%esp
  105376:	8b 15 cc 49 13 01    	mov    0x11349cc,%edx
  10537c:	a1 d4 49 13 01       	mov    0x11349d4,%eax
  105381:	85 d2                	test   %edx,%edx
  105383:	74 73                	je     1053f8 <schedule+0x88>
  105385:	83 7a 24 01          	cmpl   $0x1,0x24(%edx)
  105389:	0f 84 e1 00 00 00    	je     105470 <schedule+0x100>
  10538f:	85 c0                	test   %eax,%eax
  105391:	0f 84 91 00 00 00    	je     105428 <schedule+0xb8>
  105397:	8b 88 80 00 00 00    	mov    0x80(%eax),%ecx
  10539d:	89 0d d4 49 13 01    	mov    %ecx,0x11349d4
  1053a3:	85 c9                	test   %ecx,%ecx
  1053a5:	0f 84 b5 00 00 00    	je     105460 <schedule+0xf0>
  1053ab:	c7 81 84 00 00 00 00 	movl   $0x0,0x84(%ecx)
  1053b2:	00 00 00 
  1053b5:	8b 48 28             	mov    0x28(%eax),%ecx
  1053b8:	a3 cc 49 13 01       	mov    %eax,0x11349cc
  1053bd:	83 c0 2c             	add    $0x2c,%eax
  1053c0:	c7 40 54 00 00 00 00 	movl   $0x0,0x54(%eax)
  1053c7:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
  1053ce:	c7 40 f8 01 00 00 00 	movl   $0x1,-0x8(%eax)
  1053d5:	89 0d c8 49 13 01    	mov    %ecx,0x11349c8
  1053db:	85 d2                	test   %edx,%edx
  1053dd:	74 03                	je     1053e2 <schedule+0x72>
  1053df:	83 c2 2c             	add    $0x2c,%edx
  1053e2:	83 ec 08             	sub    $0x8,%esp
  1053e5:	50                   	push   %eax
  1053e6:	52                   	push   %edx
  1053e7:	e8 c4 1c 00 00       	call   1070b0 <context_switch>
  1053ec:	83 c4 10             	add    $0x10,%esp
  1053ef:	c9                   	leave
  1053f0:	c3                   	ret
  1053f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1053f8:	85 c0                	test   %eax,%eax
  1053fa:	75 9b                	jne    105397 <schedule+0x27>
  1053fc:	a1 68 49 13 01       	mov    0x1134968,%eax
  105401:	c7 05 cc 49 13 01 40 	movl   $0x1134940,0x11349cc
  105408:	49 13 01 
  10540b:	c7 05 64 49 13 01 01 	movl   $0x1,0x1134964
  105412:	00 00 00 
  105415:	a3 c8 49 13 01       	mov    %eax,0x11349c8
  10541a:	b8 6c 49 13 01       	mov    $0x113496c,%eax
  10541f:	eb c1                	jmp    1053e2 <schedule+0x72>
  105421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105428:	a1 68 49 13 01       	mov    0x1134968,%eax
  10542d:	83 ec 08             	sub    $0x8,%esp
  105430:	83 c2 2c             	add    $0x2c,%edx
  105433:	c7 05 cc 49 13 01 40 	movl   $0x1134940,0x11349cc
  10543a:	49 13 01 
  10543d:	c7 05 64 49 13 01 01 	movl   $0x1,0x1134964
  105444:	00 00 00 
  105447:	a3 c8 49 13 01       	mov    %eax,0x11349c8
  10544c:	b8 6c 49 13 01       	mov    $0x113496c,%eax
  105451:	50                   	push   %eax
  105452:	52                   	push   %edx
  105453:	e8 58 1c 00 00       	call   1070b0 <context_switch>
  105458:	83 c4 10             	add    $0x10,%esp
  10545b:	c9                   	leave
  10545c:	c3                   	ret
  10545d:	8d 76 00             	lea    0x0(%esi),%esi
  105460:	c7 05 d0 49 13 01 00 	movl   $0x0,0x11349d0
  105467:	00 00 00 
  10546a:	e9 46 ff ff ff       	jmp    1053b5 <schedule+0x45>
  10546f:	90                   	nop
  105470:	c7 42 24 00 00 00 00 	movl   $0x0,0x24(%edx)
  105477:	c7 82 80 00 00 00 00 	movl   $0x0,0x80(%edx)
  10547e:	00 00 00 
  105481:	85 c0                	test   %eax,%eax
  105483:	74 2b                	je     1054b0 <schedule+0x140>
  105485:	8b 0d d0 49 13 01    	mov    0x11349d0,%ecx
  10548b:	89 15 d0 49 13 01    	mov    %edx,0x11349d0
  105491:	89 91 80 00 00 00    	mov    %edx,0x80(%ecx)
  105497:	89 8a 84 00 00 00    	mov    %ecx,0x84(%edx)
  10549d:	8b 88 80 00 00 00    	mov    0x80(%eax),%ecx
  1054a3:	e9 f5 fe ff ff       	jmp    10539d <schedule+0x2d>
  1054a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1054af:	00 
  1054b0:	8b 42 28             	mov    0x28(%edx),%eax
  1054b3:	c7 42 24 01 00 00 00 	movl   $0x1,0x24(%edx)
  1054ba:	83 c2 2c             	add    $0x2c,%edx
  1054bd:	c7 42 58 00 00 00 00 	movl   $0x0,0x58(%edx)
  1054c4:	a3 c8 49 13 01       	mov    %eax,0x11349c8
  1054c9:	89 d0                	mov    %edx,%eax
  1054cb:	c7 05 d0 49 13 01 00 	movl   $0x0,0x11349d0
  1054d2:	00 00 00 
  1054d5:	e9 08 ff ff ff       	jmp    1053e2 <schedule+0x72>
  1054da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001054e0 <schedule_tick>:
  1054e0:	a1 cc 49 13 01       	mov    0x11349cc,%eax
  1054e5:	85 c0                	test   %eax,%eax
  1054e7:	74 2f                	je     105518 <schedule_tick+0x38>
  1054e9:	8b 50 28             	mov    0x28(%eax),%edx
  1054ec:	83 40 7c 01          	addl   $0x1,0x7c(%eax)
  1054f0:	83 82 5c 01 00 00 01 	addl   $0x1,0x15c(%edx)
  1054f7:	8b 48 78             	mov    0x78(%eax),%ecx
  1054fa:	39 48 7c             	cmp    %ecx,0x7c(%eax)
  1054fd:	72 19                	jb     105518 <schedule_tick+0x38>
  1054ff:	c7 40 7c 00 00 00 00 	movl   $0x0,0x7c(%eax)
  105506:	a1 d4 49 13 01       	mov    0x11349d4,%eax
  10550b:	85 c0                	test   %eax,%eax
  10550d:	74 09                	je     105518 <schedule_tick+0x38>
  10550f:	e9 5c fe ff ff       	jmp    105370 <schedule>
  105514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105518:	c3                   	ret
  105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105520 <yield>:
  105520:	e9 4b fe ff ff       	jmp    105370 <schedule>
  105525:	8d 76 00             	lea    0x0(%esi),%esi
  105528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10552f:	00 

00105530 <thread_exit>:
  105530:	8b 15 cc 49 13 01    	mov    0x11349cc,%edx
  105536:	85 d2                	test   %edx,%edx
  105538:	0f 84 82 00 00 00    	je     1055c0 <thread_exit+0x90>
  10553e:	55                   	push   %ebp
  10553f:	89 e5                	mov    %esp,%ebp
  105541:	56                   	push   %esi
  105542:	53                   	push   %ebx
  105543:	8b 4a 28             	mov    0x28(%edx),%ecx
  105546:	c7 42 24 04 00 00 00 	movl   $0x4,0x24(%edx)
  10554d:	85 c9                	test   %ecx,%ecx
  10554f:	74 36                	je     105587 <thread_exit+0x57>
  105551:	8b 99 50 01 00 00    	mov    0x150(%ecx),%ebx
  105557:	85 db                	test   %ebx,%ebx
  105559:	74 2c                	je     105587 <thread_exit+0x57>
  10555b:	31 c0                	xor    %eax,%eax
  10555d:	eb 08                	jmp    105567 <thread_exit+0x37>
  10555f:	90                   	nop
  105560:	83 c0 01             	add    $0x1,%eax
  105563:	39 d8                	cmp    %ebx,%eax
  105565:	74 20                	je     105587 <thread_exit+0x57>
  105567:	3b 94 81 30 01 00 00 	cmp    0x130(%ecx,%eax,4),%edx
  10556e:	75 f0                	jne    105560 <thread_exit+0x30>
  105570:	8d 73 ff             	lea    -0x1(%ebx),%esi
  105573:	8b 9c 99 2c 01 00 00 	mov    0x12c(%ecx,%ebx,4),%ebx
  10557a:	89 b1 50 01 00 00    	mov    %esi,0x150(%ecx)
  105580:	89 9c 81 30 01 00 00 	mov    %ebx,0x130(%ecx,%eax,4)
  105587:	8b 42 6c             	mov    0x6c(%edx),%eax
  10558a:	85 c0                	test   %eax,%eax
  10558c:	75 12                	jne    1055a0 <thread_exit+0x70>
  10558e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  105591:	5b                   	pop    %ebx
  105592:	5e                   	pop    %esi
  105593:	5d                   	pop    %ebp
  105594:	e9 d7 fd ff ff       	jmp    105370 <schedule>
  105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1055a0:	83 ec 0c             	sub    $0xc,%esp
  1055a3:	50                   	push   %eax
  1055a4:	e8 77 e9 ff ff       	call   103f20 <kfree>
  1055a9:	83 c4 10             	add    $0x10,%esp
  1055ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1055af:	5b                   	pop    %ebx
  1055b0:	5e                   	pop    %esi
  1055b1:	5d                   	pop    %ebp
  1055b2:	e9 b9 fd ff ff       	jmp    105370 <schedule>
  1055b7:	90                   	nop
  1055b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055bf:	00 
  1055c0:	c3                   	ret
  1055c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1055c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055cf:	00 

001055d0 <process_exit>:
  1055d0:	55                   	push   %ebp
  1055d1:	89 e5                	mov    %esp,%ebp
  1055d3:	57                   	push   %edi
  1055d4:	56                   	push   %esi
  1055d5:	53                   	push   %ebx
  1055d6:	83 ec 0c             	sub    $0xc,%esp
  1055d9:	8b 15 c8 49 13 01    	mov    0x11349c8,%edx
  1055df:	8b 45 08             	mov    0x8(%ebp),%eax
  1055e2:	85 d2                	test   %edx,%edx
  1055e4:	0f 84 36 01 00 00    	je     105720 <process_exit+0x150>
  1055ea:	89 82 74 01 00 00    	mov    %eax,0x174(%edx)
  1055f0:	8b 82 50 01 00 00    	mov    0x150(%edx),%eax
  1055f6:	c7 42 24 04 00 00 00 	movl   $0x4,0x24(%edx)
  1055fd:	8b 35 cc 49 13 01    	mov    0x11349cc,%esi
  105603:	85 c0                	test   %eax,%eax
  105605:	0f 84 a5 00 00 00    	je     1056b0 <process_exit+0xe0>
  10560b:	31 db                	xor    %ebx,%ebx
  10560d:	eb 20                	jmp    10562f <process_exit+0x5f>
  10560f:	90                   	nop
  105610:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105617:	00 
  105618:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10561f:	00 
  105620:	83 c3 01             	add    $0x1,%ebx
  105623:	3b 9a 50 01 00 00    	cmp    0x150(%edx),%ebx
  105629:	0f 83 81 00 00 00    	jae    1056b0 <process_exit+0xe0>
  10562f:	8b 84 9a 30 01 00 00 	mov    0x130(%edx,%ebx,4),%eax
  105636:	85 c0                	test   %eax,%eax
  105638:	74 e6                	je     105620 <process_exit+0x50>
  10563a:	39 f0                	cmp    %esi,%eax
  10563c:	74 e2                	je     105620 <process_exit+0x50>
  10563e:	8b 88 84 00 00 00    	mov    0x84(%eax),%ecx
  105644:	c7 40 24 04 00 00 00 	movl   $0x4,0x24(%eax)
  10564b:	8b b8 80 00 00 00    	mov    0x80(%eax),%edi
  105651:	85 c9                	test   %ecx,%ecx
  105653:	0f 84 97 00 00 00    	je     1056f0 <process_exit+0x120>
  105659:	89 b9 80 00 00 00    	mov    %edi,0x80(%ecx)
  10565f:	8b 88 84 00 00 00    	mov    0x84(%eax),%ecx
  105665:	85 ff                	test   %edi,%edi
  105667:	74 77                	je     1056e0 <process_exit+0x110>
  105669:	89 8f 84 00 00 00    	mov    %ecx,0x84(%edi)
  10566f:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  105676:	00 00 00 
  105679:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  105680:	00 00 00 
  105683:	8b 40 6c             	mov    0x6c(%eax),%eax
  105686:	85 c0                	test   %eax,%eax
  105688:	74 96                	je     105620 <process_exit+0x50>
  10568a:	83 ec 0c             	sub    $0xc,%esp
  10568d:	83 c3 01             	add    $0x1,%ebx
  105690:	50                   	push   %eax
  105691:	e8 8a e8 ff ff       	call   103f20 <kfree>
  105696:	8b 15 c8 49 13 01    	mov    0x11349c8,%edx
  10569c:	8b 35 cc 49 13 01    	mov    0x11349cc,%esi
  1056a2:	83 c4 10             	add    $0x10,%esp
  1056a5:	3b 9a 50 01 00 00    	cmp    0x150(%edx),%ebx
  1056ab:	72 82                	jb     10562f <process_exit+0x5f>
  1056ad:	8d 76 00             	lea    0x0(%esi),%esi
  1056b0:	c7 82 50 01 00 00 00 	movl   $0x0,0x150(%edx)
  1056b7:	00 00 00 
  1056ba:	85 f6                	test   %esi,%esi
  1056bc:	74 0e                	je     1056cc <process_exit+0xfc>
  1056be:	8b 46 6c             	mov    0x6c(%esi),%eax
  1056c1:	c7 46 24 04 00 00 00 	movl   $0x4,0x24(%esi)
  1056c8:	85 c0                	test   %eax,%eax
  1056ca:	75 34                	jne    105700 <process_exit+0x130>
  1056cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1056cf:	5b                   	pop    %ebx
  1056d0:	5e                   	pop    %esi
  1056d1:	5f                   	pop    %edi
  1056d2:	5d                   	pop    %ebp
  1056d3:	e9 98 fc ff ff       	jmp    105370 <schedule>
  1056d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056df:	00 
  1056e0:	89 0d d0 49 13 01    	mov    %ecx,0x11349d0
  1056e6:	e9 84 ff ff ff       	jmp    10566f <process_exit+0x9f>
  1056eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056f0:	89 3d d4 49 13 01    	mov    %edi,0x11349d4
  1056f6:	e9 6a ff ff ff       	jmp    105665 <process_exit+0x95>
  1056fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  105700:	83 ec 0c             	sub    $0xc,%esp
  105703:	50                   	push   %eax
  105704:	e8 17 e8 ff ff       	call   103f20 <kfree>
  105709:	83 c4 10             	add    $0x10,%esp
  10570c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10570f:	5b                   	pop    %ebx
  105710:	5e                   	pop    %esi
  105711:	5f                   	pop    %edi
  105712:	5d                   	pop    %ebp
  105713:	e9 58 fc ff ff       	jmp    105370 <schedule>
  105718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10571f:	00 
  105720:	8d 65 f4             	lea    -0xc(%ebp),%esp
  105723:	5b                   	pop    %ebx
  105724:	5e                   	pop    %esi
  105725:	5f                   	pop    %edi
  105726:	5d                   	pop    %ebp
  105727:	c3                   	ret
  105728:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10572f:	00 

00105730 <get_current_thread>:
  105730:	a1 cc 49 13 01       	mov    0x11349cc,%eax
  105735:	c3                   	ret
  105736:	66 90                	xchg   %ax,%ax
  105738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10573f:	00 

00105740 <get_current_process>:
  105740:	a1 c8 49 13 01       	mov    0x11349c8,%eax
  105745:	c3                   	ret
  105746:	66 90                	xchg   %ax,%ax
  105748:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10574f:	00 

00105750 <get_current_pid>:
  105750:	8b 15 c8 49 13 01    	mov    0x11349c8,%edx
  105756:	31 c0                	xor    %eax,%eax
  105758:	85 d2                	test   %edx,%edx
  10575a:	74 02                	je     10575e <get_current_pid+0xe>
  10575c:	8b 02                	mov    (%edx),%eax
  10575e:	c3                   	ret
  10575f:	90                   	nop

00105760 <get_current_tid>:
  105760:	8b 15 cc 49 13 01    	mov    0x11349cc,%edx
  105766:	31 c0                	xor    %eax,%eax
  105768:	85 d2                	test   %edx,%edx
  10576a:	74 02                	je     10576e <get_current_tid+0xe>
  10576c:	8b 02                	mov    (%edx),%eax
  10576e:	c3                   	ret
  10576f:	90                   	nop

00105770 <wait_for_process>:
  105770:	55                   	push   %ebp
  105771:	ba e0 8d 13 01       	mov    $0x1138de0,%edx
  105776:	31 c0                	xor    %eax,%eax
  105778:	89 e5                	mov    %esp,%ebp
  10577a:	53                   	push   %ebx
  10577b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10577e:	eb 0e                	jmp    10578e <wait_for_process+0x1e>
  105780:	83 c0 01             	add    $0x1,%eax
  105783:	81 c2 80 01 00 00    	add    $0x180,%edx
  105789:	83 f8 40             	cmp    $0x40,%eax
  10578c:	74 42                	je     1057d0 <wait_for_process+0x60>
  10578e:	39 0a                	cmp    %ecx,(%edx)
  105790:	75 ee                	jne    105780 <wait_for_process+0x10>
  105792:	8d 0c 00             	lea    (%eax,%eax,1),%ecx
  105795:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
  105798:	c1 e3 07             	shl    $0x7,%ebx
  10579b:	8d 93 e0 8d 13 01    	lea    0x1138de0(%ebx),%edx
  1057a1:	83 bb 04 8e 13 01 04 	cmpl   $0x4,0x1138e04(%ebx)
  1057a8:	74 0d                	je     1057b7 <wait_for_process+0x47>
  1057aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1057b0:	f4                   	hlt
  1057b1:	83 7a 24 04          	cmpl   $0x4,0x24(%edx)
  1057b5:	75 f9                	jne    1057b0 <wait_for_process+0x40>
  1057b7:	01 c1                	add    %eax,%ecx
  1057b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1057bc:	c1 e1 07             	shl    $0x7,%ecx
  1057bf:	8b 81 54 8f 13 01    	mov    0x1138f54(%ecx),%eax
  1057c5:	c9                   	leave
  1057c6:	c3                   	ret
  1057c7:	90                   	nop
  1057c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1057cf:	00 
  1057d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1057d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1057d8:	c9                   	leave
  1057d9:	c3                   	ret
  1057da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001057e0 <thread_sleep>:
  1057e0:	55                   	push   %ebp
  1057e1:	a1 cc 49 13 01       	mov    0x11349cc,%eax
  1057e6:	89 e5                	mov    %esp,%ebp
  1057e8:	8b 55 08             	mov    0x8(%ebp),%edx
  1057eb:	85 c0                	test   %eax,%eax
  1057ed:	74 19                	je     105808 <thread_sleep+0x28>
  1057ef:	03 50 7c             	add    0x7c(%eax),%edx
  1057f2:	c7 40 24 03 00 00 00 	movl   $0x3,0x24(%eax)
  1057f9:	89 50 70             	mov    %edx,0x70(%eax)
  1057fc:	5d                   	pop    %ebp
  1057fd:	e9 6e fb ff ff       	jmp    105370 <schedule>
  105802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105808:	5d                   	pop    %ebp
  105809:	c3                   	ret
  10580a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105810 <thread_block>:
  105810:	55                   	push   %ebp
  105811:	89 e5                	mov    %esp,%ebp
  105813:	8b 45 08             	mov    0x8(%ebp),%eax
  105816:	85 c0                	test   %eax,%eax
  105818:	74 41                	je     10585b <thread_block+0x4b>
  10581a:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
  105820:	c7 40 24 02 00 00 00 	movl   $0x2,0x24(%eax)
  105827:	8b 88 80 00 00 00    	mov    0x80(%eax),%ecx
  10582d:	85 d2                	test   %edx,%edx
  10582f:	74 2f                	je     105860 <thread_block+0x50>
  105831:	89 8a 80 00 00 00    	mov    %ecx,0x80(%edx)
  105837:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
  10583d:	85 c9                	test   %ecx,%ecx
  10583f:	74 29                	je     10586a <thread_block+0x5a>
  105841:	89 91 84 00 00 00    	mov    %edx,0x84(%ecx)
  105847:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  10584e:	00 00 00 
  105851:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  105858:	00 00 00 
  10585b:	5d                   	pop    %ebp
  10585c:	c3                   	ret
  10585d:	8d 76 00             	lea    0x0(%esi),%esi
  105860:	89 0d d4 49 13 01    	mov    %ecx,0x11349d4
  105866:	85 c9                	test   %ecx,%ecx
  105868:	75 d7                	jne    105841 <thread_block+0x31>
  10586a:	89 15 d0 49 13 01    	mov    %edx,0x11349d0
  105870:	eb d5                	jmp    105847 <thread_block+0x37>
  105872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105878:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10587f:	00 

00105880 <thread_unblock>:
  105880:	55                   	push   %ebp
  105881:	89 e5                	mov    %esp,%ebp
  105883:	8b 45 08             	mov    0x8(%ebp),%eax
  105886:	85 c0                	test   %eax,%eax
  105888:	74 06                	je     105890 <thread_unblock+0x10>
  10588a:	83 78 24 02          	cmpl   $0x2,0x24(%eax)
  10588e:	74 08                	je     105898 <thread_unblock+0x18>
  105890:	5d                   	pop    %ebp
  105891:	c3                   	ret
  105892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105898:	8b 15 d4 49 13 01    	mov    0x11349d4,%edx
  10589e:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
  1058a5:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1058ac:	00 00 00 
  1058af:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  1058b6:	00 00 00 
  1058b9:	85 d2                	test   %edx,%edx
  1058bb:	74 23                	je     1058e0 <thread_unblock+0x60>
  1058bd:	8b 15 d0 49 13 01    	mov    0x11349d0,%edx
  1058c3:	a3 d0 49 13 01       	mov    %eax,0x11349d0
  1058c8:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
  1058ce:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  1058d4:	5d                   	pop    %ebp
  1058d5:	c3                   	ret
  1058d6:	66 90                	xchg   %ax,%ax
  1058d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1058df:	00 
  1058e0:	a3 d4 49 13 01       	mov    %eax,0x11349d4
  1058e5:	5d                   	pop    %ebp
  1058e6:	a3 d0 49 13 01       	mov    %eax,0x11349d0
  1058eb:	c3                   	ret
  1058ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001058f0 <process_list>:
  1058f0:	55                   	push   %ebp
  1058f1:	89 e5                	mov    %esp,%ebp
  1058f3:	57                   	push   %edi
  1058f4:	56                   	push   %esi
  1058f5:	8d 7d d8             	lea    -0x28(%ebp),%edi
  1058f8:	be e4 8d 13 01       	mov    $0x1138de4,%esi
  1058fd:	53                   	push   %ebx
  1058fe:	83 ec 28             	sub    $0x28,%esp
  105901:	68 71 c1 10 00       	push   $0x10c171
  105906:	e8 05 b3 ff ff       	call   100c10 <terminal_writestring>
  10590b:	c7 04 24 d8 d3 10 00 	movl   $0x10d3d8,(%esp)
  105912:	e8 f9 b2 ff ff       	call   100c10 <terminal_writestring>
  105917:	c7 04 24 04 d4 10 00 	movl   $0x10d404,(%esp)
  10591e:	e8 ed b2 ff ff       	call   100c10 <terminal_writestring>
  105923:	83 c4 10             	add    $0x10,%esp
  105926:	eb 2a                	jmp    105952 <process_list+0x62>
  105928:	eb 16                	jmp    105940 <process_list+0x50>
  10592a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105930:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105937:	00 
  105938:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10593f:	00 
  105940:	81 c6 80 01 00 00    	add    $0x180,%esi
  105946:	81 fe e4 ed 13 01    	cmp    $0x113ede4,%esi
  10594c:	0f 84 c5 00 00 00    	je     105a17 <process_list+0x127>
  105952:	8b 46 fc             	mov    -0x4(%esi),%eax
  105955:	85 c0                	test   %eax,%eax
  105957:	74 e7                	je     105940 <process_list+0x50>
  105959:	83 ec 04             	sub    $0x4,%esp
  10595c:	6a 0a                	push   $0xa
  10595e:	57                   	push   %edi
  10595f:	50                   	push   %eax
  105960:	e8 cb af ff ff       	call   100930 <itoa>
  105965:	89 3c 24             	mov    %edi,(%esp)
  105968:	e8 a3 b2 ff ff       	call   100c10 <terminal_writestring>
  10596d:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  105974:	e8 97 b2 ff ff       	call   100c10 <terminal_writestring>
  105979:	89 34 24             	mov    %esi,(%esp)
  10597c:	e8 8f b2 ff ff       	call   100c10 <terminal_writestring>
  105981:	89 34 24             	mov    %esi,(%esp)
  105984:	e8 27 ac ff ff       	call   1005b0 <strlen>
  105989:	83 c4 10             	add    $0x10,%esp
  10598c:	89 c3                	mov    %eax,%ebx
  10598e:	83 f8 13             	cmp    $0x13,%eax
  105991:	7f 25                	jg     1059b8 <process_list+0xc8>
  105993:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  105998:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10599f:	00 
  1059a0:	83 ec 0c             	sub    $0xc,%esp
  1059a3:	83 c3 01             	add    $0x1,%ebx
  1059a6:	68 a5 b9 10 00       	push   $0x10b9a5
  1059ab:	e8 60 b2 ff ff       	call   100c10 <terminal_writestring>
  1059b0:	83 c4 10             	add    $0x10,%esp
  1059b3:	83 fb 14             	cmp    $0x14,%ebx
  1059b6:	75 e8                	jne    1059a0 <process_list+0xb0>
  1059b8:	83 7e 20 05          	cmpl   $0x5,0x20(%esi)
  1059bc:	77 22                	ja     1059e0 <process_list+0xf0>
  1059be:	8b 46 20             	mov    0x20(%esi),%eax
  1059c1:	ff 24 85 44 b2 10 00 	jmp    *0x10b244(,%eax,4)
  1059c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1059cf:	00 
  1059d0:	83 ec 0c             	sub    $0xc,%esp
  1059d3:	68 b0 c1 10 00       	push   $0x10c1b0
  1059d8:	e8 33 b2 ff ff       	call   100c10 <terminal_writestring>
  1059dd:	83 c4 10             	add    $0x10,%esp
  1059e0:	83 ec 04             	sub    $0x4,%esp
  1059e3:	81 c6 80 01 00 00    	add    $0x180,%esi
  1059e9:	6a 0a                	push   $0xa
  1059eb:	57                   	push   %edi
  1059ec:	ff 76 cc             	push   -0x34(%esi)
  1059ef:	e8 3c af ff ff       	call   100930 <itoa>
  1059f4:	89 3c 24             	mov    %edi,(%esp)
  1059f7:	e8 14 b2 ff ff       	call   100c10 <terminal_writestring>
  1059fc:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  105a03:	e8 08 b2 ff ff       	call   100c10 <terminal_writestring>
  105a08:	83 c4 10             	add    $0x10,%esp
  105a0b:	81 fe e4 ed 13 01    	cmp    $0x113ede4,%esi
  105a11:	0f 85 3b ff ff ff    	jne    105952 <process_list+0x62>
  105a17:	83 ec 0c             	sub    $0xc,%esp
  105a1a:	68 30 d4 10 00       	push   $0x10d430
  105a1f:	e8 ec b1 ff ff       	call   100c10 <terminal_writestring>
  105a24:	83 c4 10             	add    $0x10,%esp
  105a27:	8d 65 f4             	lea    -0xc(%ebp),%esp
  105a2a:	5b                   	pop    %ebx
  105a2b:	5e                   	pop    %esi
  105a2c:	5f                   	pop    %edi
  105a2d:	5d                   	pop    %ebp
  105a2e:	c3                   	ret
  105a2f:	90                   	nop
  105a30:	83 ec 0c             	sub    $0xc,%esp
  105a33:	68 88 c1 10 00       	push   $0x10c188
  105a38:	e8 d3 b1 ff ff       	call   100c10 <terminal_writestring>
  105a3d:	83 c4 10             	add    $0x10,%esp
  105a40:	eb 9e                	jmp    1059e0 <process_list+0xf0>
  105a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105a48:	83 ec 0c             	sub    $0xc,%esp
  105a4b:	68 ba c1 10 00       	push   $0x10c1ba
  105a50:	e8 bb b1 ff ff       	call   100c10 <terminal_writestring>
  105a55:	83 c4 10             	add    $0x10,%esp
  105a58:	eb 86                	jmp    1059e0 <process_list+0xf0>
  105a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105a60:	83 ec 0c             	sub    $0xc,%esp
  105a63:	68 9c c1 10 00       	push   $0x10c19c
  105a68:	e8 a3 b1 ff ff       	call   100c10 <terminal_writestring>
  105a6d:	83 c4 10             	add    $0x10,%esp
  105a70:	e9 6b ff ff ff       	jmp    1059e0 <process_list+0xf0>
  105a75:	8d 76 00             	lea    0x0(%esi),%esi
  105a78:	83 ec 0c             	sub    $0xc,%esp
  105a7b:	68 92 c1 10 00       	push   $0x10c192
  105a80:	e8 8b b1 ff ff       	call   100c10 <terminal_writestring>
  105a85:	83 c4 10             	add    $0x10,%esp
  105a88:	e9 53 ff ff ff       	jmp    1059e0 <process_list+0xf0>
  105a8d:	8d 76 00             	lea    0x0(%esi),%esi
  105a90:	83 ec 0c             	sub    $0xc,%esp
  105a93:	68 a6 c1 10 00       	push   $0x10c1a6
  105a98:	e8 73 b1 ff ff       	call   100c10 <terminal_writestring>
  105a9d:	83 c4 10             	add    $0x10,%esp
  105aa0:	e9 3b ff ff ff       	jmp    1059e0 <process_list+0xf0>
  105aa5:	8d 76 00             	lea    0x0(%esi),%esi
  105aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105aaf:	00 

00105ab0 <switch_to_user_mode>:
  105ab0:	55                   	push   %ebp
  105ab1:	89 e5                	mov    %esp,%ebp
  105ab3:	8b 55 08             	mov    0x8(%ebp),%edx
  105ab6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  105ab9:	fa                   	cli
  105aba:	66 b8 23 00          	mov    $0x23,%ax
  105abe:	8e d8                	mov    %eax,%ds
  105ac0:	8e c0                	mov    %eax,%es
  105ac2:	8e e0                	mov    %eax,%fs
  105ac4:	8e e8                	mov    %eax,%gs
  105ac6:	6a 23                	push   $0x23
  105ac8:	51                   	push   %ecx
  105ac9:	68 02 02 00 00       	push   $0x202
  105ace:	6a 1b                	push   $0x1b
  105ad0:	52                   	push   %edx
  105ad1:	cf                   	iret
  105ad2:	5d                   	pop    %ebp
  105ad3:	c3                   	ret
  105ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105ad8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105adf:	00 

00105ae0 <process_init>:
  105ae0:	55                   	push   %ebp
  105ae1:	89 e5                	mov    %esp,%ebp
  105ae3:	57                   	push   %edi
  105ae4:	56                   	push   %esi
  105ae5:	53                   	push   %ebx
  105ae6:	31 db                	xor    %ebx,%ebx
  105ae8:	83 ec 28             	sub    $0x28,%esp
  105aeb:	68 50 d4 10 00       	push   $0x10d450
  105af0:	e8 1b b1 ff ff       	call   100c10 <terminal_writestring>
  105af5:	83 c4 0c             	add    $0xc,%esp
  105af8:	68 00 60 00 00       	push   $0x6000
  105afd:	6a 00                	push   $0x0
  105aff:	68 e0 8d 13 01       	push   $0x1138de0
  105b04:	e8 97 a9 ff ff       	call   1004a0 <memset>
  105b09:	83 c4 0c             	add    $0xc,%esp
  105b0c:	68 00 44 00 00       	push   $0x4400
  105b11:	6a 00                	push   $0x0
  105b13:	68 e0 49 13 01       	push   $0x11349e0
  105b18:	e8 83 a9 ff ff       	call   1004a0 <memset>
  105b1d:	83 c4 0c             	add    $0xc,%esp
  105b20:	68 88 00 00 00       	push   $0x88
  105b25:	6a 00                	push   $0x0
  105b27:	68 40 49 13 01       	push   $0x1134940
  105b2c:	e8 6f a9 ff ff       	call   1004a0 <memset>
  105b31:	83 c4 0c             	add    $0xc,%esp
  105b34:	6a 05                	push   $0x5
  105b36:	68 c4 c1 10 00       	push   $0x10c1c4
  105b3b:	68 44 49 13 01       	push   $0x1134944
  105b40:	e8 bb aa ff ff       	call   100600 <strncpy>
  105b45:	83 c4 0c             	add    $0xc,%esp
  105b48:	6a 40                	push   $0x40
  105b4a:	6a 00                	push   $0x0
  105b4c:	68 6c 49 13 01       	push   $0x113496c
  105b51:	e8 4a a9 ff ff       	call   1004a0 <memset>
  105b56:	c7 05 8c 49 13 01 80 	movl   $0x104f80,0x113498c
  105b5d:	4f 10 00 
  105b60:	c7 05 88 49 13 01 40 	movl   $0x1134940,0x1134988
  105b67:	49 13 01 
  105b6a:	c7 05 84 49 13 01 40 	movl   $0x1134940,0x1134984
  105b71:	49 13 01 
  105b74:	c7 05 94 49 13 01 08 	movl   $0x8,0x1134994
  105b7b:	00 00 00 
  105b7e:	c7 05 98 49 13 01 10 	movl   $0x10,0x1134998
  105b85:	00 00 00 
  105b88:	c7 05 9c 49 13 01 10 	movl   $0x10,0x113499c
  105b8f:	00 00 00 
  105b92:	c7 05 a0 49 13 01 10 	movl   $0x10,0x11349a0
  105b99:	00 00 00 
  105b9c:	c7 05 a4 49 13 01 10 	movl   $0x10,0x11349a4
  105ba3:	00 00 00 
  105ba6:	c7 05 a8 49 13 01 10 	movl   $0x10,0x11349a8
  105bad:	00 00 00 
  105bb0:	c7 05 90 49 13 01 02 	movl   $0x202,0x1134990
  105bb7:	02 00 00 
  105bba:	c7 05 64 49 13 01 00 	movl   $0x0,0x1134964
  105bc1:	00 00 00 
  105bc4:	c7 05 b4 49 13 01 00 	movl   $0x0,0x11349b4
  105bcb:	00 00 00 
  105bce:	c7 05 40 49 13 01 00 	movl   $0x0,0x1134940
  105bd5:	00 00 00 
  105bd8:	c7 05 d4 49 13 01 00 	movl   $0x0,0x11349d4
  105bdf:	00 00 00 
  105be2:	c7 05 d0 49 13 01 00 	movl   $0x0,0x11349d0
  105be9:	00 00 00 
  105bec:	c7 04 24 c9 c1 10 00 	movl   $0x10c1c9,(%esp)
  105bf3:	e8 18 b0 ff ff       	call   100c10 <terminal_writestring>
  105bf8:	b8 e0 8d 13 01       	mov    $0x1138de0,%eax
  105bfd:	83 c4 10             	add    $0x10,%esp
  105c00:	eb 2f                	jmp    105c31 <process_init+0x151>
  105c02:	eb 1c                	jmp    105c20 <process_init+0x140>
  105c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105c08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c0f:	00 
  105c10:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c17:	00 
  105c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c1f:	00 
  105c20:	83 c3 01             	add    $0x1,%ebx
  105c23:	05 80 01 00 00       	add    $0x180,%eax
  105c28:	83 fb 40             	cmp    $0x40,%ebx
  105c2b:	0f 84 81 01 00 00    	je     105db2 <process_init+0x2d2>
  105c31:	8b 08                	mov    (%eax),%ecx
  105c33:	85 c9                	test   %ecx,%ecx
  105c35:	75 e9                	jne    105c20 <process_init+0x140>
  105c37:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  105c3a:	83 ec 04             	sub    $0x4,%esp
  105c3d:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  105c40:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  105c43:	c1 e6 07             	shl    $0x7,%esi
  105c46:	68 80 01 00 00       	push   $0x180
  105c4b:	8d be e0 8d 13 01    	lea    0x1138de0(%esi),%edi
  105c51:	6a 00                	push   $0x0
  105c53:	57                   	push   %edi
  105c54:	e8 47 a8 ff ff       	call   1004a0 <memset>
  105c59:	8b 15 24 e0 10 00    	mov    0x10e024,%edx
  105c5f:	83 c4 0c             	add    $0xc,%esp
  105c62:	b9 01 00 00 00       	mov    $0x1,%ecx
  105c67:	8d 42 01             	lea    0x1(%edx),%eax
  105c6a:	89 96 e0 8d 13 01    	mov    %edx,0x1138de0(%esi)
  105c70:	3d ff fe ff ff       	cmp    $0xfffffeff,%eax
  105c75:	0f 47 c1             	cmova  %ecx,%eax
  105c78:	81 c6 e4 8d 13 01    	add    $0x1138de4,%esi
  105c7e:	a3 24 e0 10 00       	mov    %eax,0x10e024
  105c83:	6a 05                	push   $0x5
  105c85:	68 e3 c1 10 00       	push   $0x10c1e3
  105c8a:	56                   	push   %esi
  105c8b:	31 f6                	xor    %esi,%esi
  105c8d:	e8 6e a9 ff ff       	call   100600 <strncpy>
  105c92:	c7 47 24 01 00 00 00 	movl   $0x1,0x24(%edi)
  105c99:	b8 e0 49 13 01       	mov    $0x11349e0,%eax
  105c9e:	83 c4 10             	add    $0x10,%esp
  105ca1:	c7 87 54 01 00 00 ff 	movl   $0xff,0x154(%edi)
  105ca8:	00 00 00 
  105cab:	c7 87 58 01 00 00 05 	movl   $0x5,0x158(%edi)
  105cb2:	00 00 00 
  105cb5:	c7 87 50 01 00 00 00 	movl   $0x0,0x150(%edi)
  105cbc:	00 00 00 
  105cbf:	eb 33                	jmp    105cf4 <process_init+0x214>
  105cc1:	eb 1d                	jmp    105ce0 <process_init+0x200>
  105cc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  105cc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105ccf:	00 
  105cd0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105cd7:	00 
  105cd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105cdf:	00 
  105ce0:	83 c6 01             	add    $0x1,%esi
  105ce3:	05 88 00 00 00       	add    $0x88,%eax
  105ce8:	81 fe 80 00 00 00    	cmp    $0x80,%esi
  105cee:	0f 84 be 00 00 00    	je     105db2 <process_init+0x2d2>
  105cf4:	8b 10                	mov    (%eax),%edx
  105cf6:	85 d2                	test   %edx,%edx
  105cf8:	75 e6                	jne    105ce0 <process_init+0x200>
  105cfa:	69 f6 88 00 00 00    	imul   $0x88,%esi,%esi
  105d00:	83 ec 04             	sub    $0x4,%esp
  105d03:	68 88 00 00 00       	push   $0x88
  105d08:	6a 00                	push   $0x0
  105d0a:	8d 96 e0 49 13 01    	lea    0x11349e0(%esi),%edx
  105d10:	52                   	push   %edx
  105d11:	89 55 e0             	mov    %edx,-0x20(%ebp)
  105d14:	e8 87 a7 ff ff       	call   1004a0 <memset>
  105d19:	a1 20 e0 10 00       	mov    0x10e020,%eax
  105d1e:	83 c4 0c             	add    $0xc,%esp
  105d21:	b9 01 00 00 00       	mov    $0x1,%ecx
  105d26:	89 86 e0 49 13 01    	mov    %eax,0x11349e0(%esi)
  105d2c:	83 c0 01             	add    $0x1,%eax
  105d2f:	3d ff fe ff ff       	cmp    $0xfffffeff,%eax
  105d34:	0f 47 c1             	cmova  %ecx,%eax
  105d37:	81 c6 e4 49 13 01    	add    $0x11349e4,%esi
  105d3d:	a3 20 e0 10 00       	mov    %eax,0x10e020
  105d42:	6a 0a                	push   $0xa
  105d44:	68 e8 c1 10 00       	push   $0x10c1e8
  105d49:	56                   	push   %esi
  105d4a:	e8 b1 a8 ff ff       	call   100600 <strncpy>
  105d4f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  105d52:	c7 42 24 01 00 00 00 	movl   $0x1,0x24(%edx)
  105d59:	89 7a 28             	mov    %edi,0x28(%edx)
  105d5c:	c7 42 74 ff 00 00 00 	movl   $0xff,0x74(%edx)
  105d63:	c7 42 78 05 00 00 00 	movl   $0x5,0x78(%edx)
  105d6a:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  105d71:	e8 4a de ff ff       	call   103bc0 <kmalloc>
  105d76:	8b 55 e0             	mov    -0x20(%ebp),%edx
  105d79:	89 3d c8 49 13 01    	mov    %edi,0x11349c8
  105d7f:	83 c4 10             	add    $0x10,%esp
  105d82:	89 42 6c             	mov    %eax,0x6c(%edx)
  105d85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105d88:	89 15 cc 49 13 01    	mov    %edx,0x11349cc
  105d8e:	01 d8                	add    %ebx,%eax
  105d90:	89 c3                	mov    %eax,%ebx
  105d92:	c1 e0 05             	shl    $0x5,%eax
  105d95:	c1 e3 07             	shl    $0x7,%ebx
  105d98:	8b 8b 30 8f 13 01    	mov    0x1138f30(%ebx),%ecx
  105d9e:	8d 71 01             	lea    0x1(%ecx),%esi
  105da1:	8d 44 01 4c          	lea    0x4c(%ecx,%eax,1),%eax
  105da5:	89 b3 30 8f 13 01    	mov    %esi,0x1138f30(%ebx)
  105dab:	89 14 85 e0 8d 13 01 	mov    %edx,0x1138de0(,%eax,4)
  105db2:	83 ec 0c             	sub    $0xc,%esp
  105db5:	68 f2 c1 10 00       	push   $0x10c1f2
  105dba:	e8 51 ae ff ff       	call   100c10 <terminal_writestring>
  105dbf:	83 c4 10             	add    $0x10,%esp
  105dc2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  105dc5:	5b                   	pop    %ebx
  105dc6:	5e                   	pop    %esi
  105dc7:	5f                   	pop    %edi
  105dc8:	5d                   	pop    %ebp
  105dc9:	c3                   	ret
  105dca:	66 90                	xchg   %ax,%ax
  105dcc:	66 90                	xchg   %ax,%ax
  105dce:	66 90                	xchg   %ax,%ax
  105dd0:	66 90                	xchg   %ax,%ax
  105dd2:	66 90                	xchg   %ax,%ax
  105dd4:	66 90                	xchg   %ax,%ax
  105dd6:	66 90                	xchg   %ax,%ax
  105dd8:	66 90                	xchg   %ax,%ax
  105dda:	66 90                	xchg   %ax,%ax
  105ddc:	66 90                	xchg   %ax,%ax
  105dde:	66 90                	xchg   %ax,%ax

00105de0 <sys_read>:
  105de0:	31 c0                	xor    %eax,%eax
  105de2:	c3                   	ret
  105de3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  105de8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105def:	00 

00105df0 <sys_kill>:
  105df0:	55                   	push   %ebp
  105df1:	89 e5                	mov    %esp,%ebp
  105df3:	83 ec 14             	sub    $0x14,%esp
  105df6:	68 0f c2 10 00       	push   $0x10c20f
  105dfb:	e8 10 ae ff ff       	call   100c10 <terminal_writestring>
  105e00:	31 c0                	xor    %eax,%eax
  105e02:	c9                   	leave
  105e03:	c3                   	ret
  105e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105e08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e0f:	00 

00105e10 <sys_brk>:
  105e10:	55                   	push   %ebp
  105e11:	89 e5                	mov    %esp,%ebp
  105e13:	83 ec 14             	sub    $0x14,%esp
  105e16:	68 70 d4 10 00       	push   $0x10d470
  105e1b:	e8 f0 ad ff ff       	call   100c10 <terminal_writestring>
  105e20:	8b 45 08             	mov    0x8(%ebp),%eax
  105e23:	c9                   	leave
  105e24:	c3                   	ret
  105e25:	8d 76 00             	lea    0x0(%esi),%esi
  105e28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e2f:	00 

00105e30 <sys_open>:
  105e30:	55                   	push   %ebp
  105e31:	89 e5                	mov    %esp,%ebp
  105e33:	83 ec 14             	sub    $0x14,%esp
  105e36:	68 90 d4 10 00       	push   $0x10d490
  105e3b:	e8 d0 ad ff ff       	call   100c10 <terminal_writestring>
  105e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105e45:	c9                   	leave
  105e46:	c3                   	ret
  105e47:	90                   	nop
  105e48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e4f:	00 

00105e50 <sys_print>:
  105e50:	55                   	push   %ebp
  105e51:	89 e5                	mov    %esp,%ebp
  105e53:	83 ec 08             	sub    $0x8,%esp
  105e56:	8b 45 08             	mov    0x8(%ebp),%eax
  105e59:	85 c0                	test   %eax,%eax
  105e5b:	75 0b                	jne    105e68 <sys_print+0x18>
  105e5d:	c9                   	leave
  105e5e:	31 c0                	xor    %eax,%eax
  105e60:	c3                   	ret
  105e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105e68:	83 ec 0c             	sub    $0xc,%esp
  105e6b:	50                   	push   %eax
  105e6c:	e8 9f ad ff ff       	call   100c10 <terminal_writestring>
  105e71:	83 c4 10             	add    $0x10,%esp
  105e74:	31 c0                	xor    %eax,%eax
  105e76:	c9                   	leave
  105e77:	c3                   	ret
  105e78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e7f:	00 

00105e80 <sys_exec>:
  105e80:	55                   	push   %ebp
  105e81:	89 e5                	mov    %esp,%ebp
  105e83:	57                   	push   %edi
  105e84:	56                   	push   %esi
  105e85:	53                   	push   %ebx
  105e86:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  105e89:	83 ec 28             	sub    $0x28,%esp
  105e8c:	8b 75 08             	mov    0x8(%ebp),%esi
  105e8f:	68 2a c2 10 00       	push   $0x10c22a
  105e94:	e8 77 ad ff ff       	call   100c10 <terminal_writestring>
  105e99:	83 c4 10             	add    $0x10,%esp
  105e9c:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  105ea1:	eb 1d                	jmp    105ec0 <sys_exec+0x40>
  105ea3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  105ea8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105eaf:	00 
  105eb0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105eb7:	00 
  105eb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105ebf:	00 
  105ec0:	89 f0                	mov    %esi,%eax
  105ec2:	d3 e8                	shr    %cl,%eax
  105ec4:	83 e0 0f             	and    $0xf,%eax
  105ec7:	3c 09                	cmp    $0x9,%al
  105ec9:	8d 78 30             	lea    0x30(%eax),%edi
  105ecc:	8d 50 57             	lea    0x57(%eax),%edx
  105ecf:	0f 46 d7             	cmovbe %edi,%edx
  105ed2:	83 e9 04             	sub    $0x4,%ecx
  105ed5:	83 c3 01             	add    $0x1,%ebx
  105ed8:	88 53 ff             	mov    %dl,-0x1(%ebx)
  105edb:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  105ede:	75 e0                	jne    105ec0 <sys_exec+0x40>
  105ee0:	83 ec 0c             	sub    $0xc,%esp
  105ee3:	8d 45 d8             	lea    -0x28(%ebp),%eax
  105ee6:	c6 45 e0 00          	movb   $0x0,-0x20(%ebp)
  105eea:	50                   	push   %eax
  105eeb:	e8 20 ad ff ff       	call   100c10 <terminal_writestring>
  105ef0:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  105ef7:	e8 14 ad ff ff       	call   100c10 <terminal_writestring>
  105efc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  105eff:	31 c0                	xor    %eax,%eax
  105f01:	5b                   	pop    %ebx
  105f02:	5e                   	pop    %esi
  105f03:	5f                   	pop    %edi
  105f04:	5d                   	pop    %ebp
  105f05:	c3                   	ret
  105f06:	66 90                	xchg   %ax,%ax
  105f08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105f0f:	00 

00105f10 <sys_fork>:
  105f10:	55                   	push   %ebp
  105f11:	89 e5                	mov    %esp,%ebp
  105f13:	83 ec 14             	sub    $0x14,%esp
  105f16:	68 48 c2 10 00       	push   $0x10c248
  105f1b:	e8 f0 ac ff ff       	call   100c10 <terminal_writestring>
  105f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105f25:	c9                   	leave
  105f26:	c3                   	ret
  105f27:	90                   	nop
  105f28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105f2f:	00 

00105f30 <sys_getppid>:
  105f30:	55                   	push   %ebp
  105f31:	89 e5                	mov    %esp,%ebp
  105f33:	83 ec 08             	sub    $0x8,%esp
  105f36:	e8 05 f8 ff ff       	call   105740 <get_current_process>
  105f3b:	31 d2                	xor    %edx,%edx
  105f3d:	85 c0                	test   %eax,%eax
  105f3f:	74 0c                	je     105f4d <sys_getppid+0x1d>
  105f41:	8b 80 70 01 00 00    	mov    0x170(%eax),%eax
  105f47:	85 c0                	test   %eax,%eax
  105f49:	74 02                	je     105f4d <sys_getppid+0x1d>
  105f4b:	8b 10                	mov    (%eax),%edx
  105f4d:	c9                   	leave
  105f4e:	89 d0                	mov    %edx,%eax
  105f50:	c3                   	ret
  105f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105f58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105f5f:	00 

00105f60 <sys_write>:
  105f60:	55                   	push   %ebp
  105f61:	89 e5                	mov    %esp,%ebp
  105f63:	57                   	push   %edi
  105f64:	56                   	push   %esi
  105f65:	53                   	push   %ebx
  105f66:	83 ec 0c             	sub    $0xc,%esp
  105f69:	8b 7d 10             	mov    0x10(%ebp),%edi
  105f6c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  105f6f:	85 ff                	test   %edi,%edi
  105f71:	74 23                	je     105f96 <sys_write+0x36>
  105f73:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
  105f76:	66 90                	xchg   %ax,%ax
  105f78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105f7f:	00 
  105f80:	0f be 03             	movsbl (%ebx),%eax
  105f83:	83 ec 0c             	sub    $0xc,%esp
  105f86:	83 c3 01             	add    $0x1,%ebx
  105f89:	50                   	push   %eax
  105f8a:	e8 21 ab ff ff       	call   100ab0 <terminal_putchar>
  105f8f:	83 c4 10             	add    $0x10,%esp
  105f92:	39 f3                	cmp    %esi,%ebx
  105f94:	75 ea                	jne    105f80 <sys_write+0x20>
  105f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
  105f99:	89 f8                	mov    %edi,%eax
  105f9b:	5b                   	pop    %ebx
  105f9c:	5e                   	pop    %esi
  105f9d:	5f                   	pop    %edi
  105f9e:	5d                   	pop    %ebp
  105f9f:	c3                   	ret

00105fa0 <sys_yield>:
  105fa0:	55                   	push   %ebp
  105fa1:	89 e5                	mov    %esp,%ebp
  105fa3:	83 ec 08             	sub    $0x8,%esp
  105fa6:	e8 75 f5 ff ff       	call   105520 <yield>
  105fab:	31 c0                	xor    %eax,%eax
  105fad:	c9                   	leave
  105fae:	c3                   	ret
  105faf:	90                   	nop

00105fb0 <sys_sleep>:
  105fb0:	55                   	push   %ebp
  105fb1:	89 e5                	mov    %esp,%ebp
  105fb3:	83 ec 14             	sub    $0x14,%esp
  105fb6:	ff 75 08             	push   0x8(%ebp)
  105fb9:	e8 22 f8 ff ff       	call   1057e0 <thread_sleep>
  105fbe:	31 c0                	xor    %eax,%eax
  105fc0:	c9                   	leave
  105fc1:	c3                   	ret
  105fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105fc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105fcf:	00 

00105fd0 <sys_gettid>:
  105fd0:	e9 8b f7 ff ff       	jmp    105760 <get_current_tid>
  105fd5:	8d 76 00             	lea    0x0(%esi),%esi
  105fd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105fdf:	00 

00105fe0 <sys_getpid>:
  105fe0:	e9 6b f7 ff ff       	jmp    105750 <get_current_pid>
  105fe5:	8d 76 00             	lea    0x0(%esi),%esi
  105fe8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105fef:	00 

00105ff0 <sys_waitpid>:
  105ff0:	e9 7b f7 ff ff       	jmp    105770 <wait_for_process>
  105ff5:	8d 76 00             	lea    0x0(%esi),%esi
  105ff8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105fff:	00 

00106000 <sys_exit>:
  106000:	55                   	push   %ebp
  106001:	89 e5                	mov    %esp,%ebp
  106003:	83 ec 14             	sub    $0x14,%esp
  106006:	ff 75 08             	push   0x8(%ebp)
  106009:	e8 c2 f5 ff ff       	call   1055d0 <process_exit>
  10600e:	31 c0                	xor    %eax,%eax
  106010:	c9                   	leave
  106011:	c3                   	ret
  106012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106018:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10601f:	00 

00106020 <sys_close>:
  106020:	31 c0                	xor    %eax,%eax
  106022:	c3                   	ret
  106023:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106028:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10602f:	00 

00106030 <system_call_handler>:
  106030:	55                   	push   %ebp
  106031:	89 e5                	mov    %esp,%ebp
  106033:	56                   	push   %esi
  106034:	53                   	push   %ebx
  106035:	83 ec 20             	sub    $0x20,%esp
  106038:	8b 45 08             	mov    0x8(%ebp),%eax
  10603b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10603e:	8b 5d 10             	mov    0x10(%ebp),%ebx
  106041:	8b 75 14             	mov    0x14(%ebp),%esi
  106044:	83 f8 0f             	cmp    $0xf,%eax
  106047:	77 1f                	ja     106068 <system_call_handler+0x38>
  106049:	8b 14 85 60 b2 10 00 	mov    0x10b260(,%eax,4),%edx
  106050:	85 d2                	test   %edx,%edx
  106052:	74 14                	je     106068 <system_call_handler+0x38>
  106054:	89 75 10             	mov    %esi,0x10(%ebp)
  106057:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10605a:	89 4d 08             	mov    %ecx,0x8(%ebp)
  10605d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  106060:	5b                   	pop    %ebx
  106061:	5e                   	pop    %esi
  106062:	5d                   	pop    %ebp
  106063:	ff e2                	jmp    *%edx
  106065:	8d 76 00             	lea    0x0(%esi),%esi
  106068:	83 ec 0c             	sub    $0xc,%esp
  10606b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10606e:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  106071:	68 63 c2 10 00       	push   $0x10c263
  106076:	e8 95 ab ff ff       	call   100c10 <terminal_writestring>
  10607b:	83 c4 0c             	add    $0xc,%esp
  10607e:	6a 0a                	push   $0xa
  106080:	53                   	push   %ebx
  106081:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106084:	50                   	push   %eax
  106085:	e8 a6 a8 ff ff       	call   100930 <itoa>
  10608a:	89 1c 24             	mov    %ebx,(%esp)
  10608d:	e8 7e ab ff ff       	call   100c10 <terminal_writestring>
  106092:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106099:	e8 72 ab ff ff       	call   100c10 <terminal_writestring>
  10609e:	83 c4 10             	add    $0x10,%esp
  1060a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1060a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1060a9:	5b                   	pop    %ebx
  1060aa:	5e                   	pop    %esi
  1060ab:	5d                   	pop    %ebp
  1060ac:	c3                   	ret
  1060ad:	8d 76 00             	lea    0x0(%esi),%esi

001060b0 <syscall_init>:
  1060b0:	55                   	push   %ebp
  1060b1:	89 e5                	mov    %esp,%ebp
  1060b3:	83 ec 14             	sub    $0x14,%esp
  1060b6:	68 75 c2 10 00       	push   $0x10c275
  1060bb:	e8 50 ab ff ff       	call   100c10 <terminal_writestring>
  1060c0:	68 ee 00 00 00       	push   $0xee
  1060c5:	6a 08                	push   $0x8
  1060c7:	68 41 71 10 00       	push   $0x107141
  1060cc:	68 80 00 00 00       	push   $0x80
  1060d1:	e8 6a ae ff ff       	call   100f40 <idt_set_gate>
  1060d6:	83 c4 14             	add    $0x14,%esp
  1060d9:	68 b8 d4 10 00       	push   $0x10d4b8
  1060de:	e8 2d ab ff ff       	call   100c10 <terminal_writestring>
  1060e3:	83 c4 10             	add    $0x10,%esp
  1060e6:	c9                   	leave
  1060e7:	c3                   	ret
  1060e8:	66 90                	xchg   %ax,%ax
  1060ea:	66 90                	xchg   %ax,%ax
  1060ec:	66 90                	xchg   %ax,%ax
  1060ee:	66 90                	xchg   %ax,%ax
  1060f0:	66 90                	xchg   %ax,%ax
  1060f2:	66 90                	xchg   %ax,%ax
  1060f4:	66 90                	xchg   %ax,%ax
  1060f6:	66 90                	xchg   %ax,%ax
  1060f8:	66 90                	xchg   %ax,%ax
  1060fa:	66 90                	xchg   %ax,%ax
  1060fc:	66 90                	xchg   %ax,%ax
  1060fe:	66 90                	xchg   %ax,%ax

00106100 <simple_alloc>:
  106100:	55                   	push   %ebp
  106101:	89 e5                	mov    %esp,%ebp
  106103:	53                   	push   %ebx
  106104:	83 ec 08             	sub    $0x8,%esp
  106107:	8b 45 08             	mov    0x8(%ebp),%eax
  10610a:	8b 1d 28 e0 10 00    	mov    0x10e028,%ebx
  106110:	05 ff 0f 00 00       	add    $0xfff,%eax
  106115:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10611a:	50                   	push   %eax
  10611b:	8d 14 03             	lea    (%ebx,%eax,1),%edx
  10611e:	6a 00                	push   $0x0
  106120:	53                   	push   %ebx
  106121:	89 15 28 e0 10 00    	mov    %edx,0x10e028
  106127:	e8 74 a3 ff ff       	call   1004a0 <memset>
  10612c:	89 d8                	mov    %ebx,%eax
  10612e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  106131:	c9                   	leave
  106132:	c3                   	ret
  106133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10613f:	00 

00106140 <exe_check_format>:
  106140:	55                   	push   %ebp
  106141:	89 e5                	mov    %esp,%ebp
  106143:	53                   	push   %ebx
  106144:	8b 55 08             	mov    0x8(%ebp),%edx
  106147:	85 d2                	test   %edx,%edx
  106149:	0f 94 c0             	sete   %al
  10614c:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
  106150:	0f 96 c1             	setbe  %cl
  106153:	08 c8                	or     %cl,%al
  106155:	75 59                	jne    1061b0 <exe_check_format+0x70>
  106157:	80 3a 7f             	cmpb   $0x7f,(%edx)
  10615a:	74 14                	je     106170 <exe_check_format+0x30>
  10615c:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%edx)
  106161:	74 2d                	je     106190 <exe_check_format+0x50>
  106163:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  106166:	c9                   	leave
  106167:	c3                   	ret
  106168:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10616f:	00 
  106170:	80 7a 01 45          	cmpb   $0x45,0x1(%edx)
  106174:	75 e6                	jne    10615c <exe_check_format+0x1c>
  106176:	80 7a 02 4c          	cmpb   $0x4c,0x2(%edx)
  10617a:	75 e0                	jne    10615c <exe_check_format+0x1c>
  10617c:	80 7a 03 46          	cmpb   $0x46,0x3(%edx)
  106180:	75 da                	jne    10615c <exe_check_format+0x1c>
  106182:	b8 01 00 00 00       	mov    $0x1,%eax
  106187:	eb da                	jmp    106163 <exe_check_format+0x23>
  106189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106190:	8b 4a 3c             	mov    0x3c(%edx),%ecx
  106193:	8d 59 04             	lea    0x4(%ecx),%ebx
  106196:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
  106199:	72 c8                	jb     106163 <exe_check_format+0x23>
  10619b:	81 3c 0a 50 45 00 00 	cmpl   $0x4550,(%edx,%ecx,1)
  1061a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1061a5:	c9                   	leave
  1061a6:	0f 94 c0             	sete   %al
  1061a9:	c3                   	ret
  1061aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1061b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1061b3:	31 c0                	xor    %eax,%eax
  1061b5:	c9                   	leave
  1061b6:	c3                   	ret
  1061b7:	90                   	nop
  1061b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1061bf:	00 

001061c0 <exe_run_elf>:
  1061c0:	55                   	push   %ebp
  1061c1:	89 e5                	mov    %esp,%ebp
  1061c3:	57                   	push   %edi
  1061c4:	56                   	push   %esi
  1061c5:	53                   	push   %ebx
  1061c6:	81 ec 98 01 00 00    	sub    $0x198,%esp
  1061cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1061cf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  1061d2:	68 9c c2 10 00       	push   $0x10c29c
  1061d7:	e8 34 aa ff ff       	call   100c10 <terminal_writestring>
  1061dc:	85 db                	test   %ebx,%ebx
  1061de:	b8 93 c2 10 00       	mov    $0x10c293,%eax
  1061e3:	0f 44 d8             	cmove  %eax,%ebx
  1061e6:	89 1c 24             	mov    %ebx,(%esp)
  1061e9:	8d 9d 54 ff ff ff    	lea    -0xac(%ebp),%ebx
  1061ef:	e8 1c aa ff ff       	call   100c10 <terminal_writestring>
  1061f4:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1061fb:	e8 10 aa ff ff       	call   100c10 <terminal_writestring>
  106200:	83 c4 0c             	add    $0xc,%esp
  106203:	68 94 00 00 00       	push   $0x94
  106208:	6a 00                	push   $0x0
  10620a:	53                   	push   %ebx
  10620b:	e8 90 a2 ff ff       	call   1004a0 <memset>
  106210:	83 c4 10             	add    $0x10,%esp
  106213:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
  10621a:	00 00 00 
  10621d:	85 ff                	test   %edi,%edi
  10621f:	0f 84 0b 01 00 00    	je     106330 <exe_run_elf+0x170>
  106225:	83 7d 10 33          	cmpl   $0x33,0x10(%ebp)
  106229:	0f 86 01 01 00 00    	jbe    106330 <exe_run_elf+0x170>
  10622f:	80 3f 7f             	cmpb   $0x7f,(%edi)
  106232:	75 0a                	jne    10623e <exe_run_elf+0x7e>
  106234:	80 7f 01 45          	cmpb   $0x45,0x1(%edi)
  106238:	0f 84 aa 00 00 00    	je     1062e8 <exe_run_elf+0x128>
  10623e:	83 ec 04             	sub    $0x4,%esp
  106241:	68 80 00 00 00       	push   $0x80
  106246:	68 d5 c2 10 00       	push   $0x10c2d5
  10624b:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  106251:	50                   	push   %eax
  106252:	e8 a9 a3 ff ff       	call   100600 <strncpy>
  106257:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
  10625d:	83 c4 10             	add    $0x10,%esp
  106260:	89 85 94 fe ff ff    	mov    %eax,-0x16c(%ebp)
  106266:	8b bd 94 fe ff ff    	mov    -0x16c(%ebp),%edi
  10626c:	b9 25 00 00 00       	mov    $0x25,%ecx
  106271:	89 de                	mov    %ebx,%esi
  106273:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  106275:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  10627b:	85 c0                	test   %eax,%eax
  10627d:	0f 84 b5 03 00 00    	je     106638 <exe_run_elf+0x478>
  106283:	83 ec 04             	sub    $0x4,%esp
  106286:	68 80 00 00 00       	push   $0x80
  10628b:	ff b5 c4 fe ff ff    	push   -0x13c(%ebp)
  106291:	68 d1 c3 10 00       	push   $0x10c3d1
  106296:	e8 b5 f0 ff ff       	call   105350 <process_create>
  10629b:	83 c4 10             	add    $0x10,%esp
  10629e:	89 c6                	mov    %eax,%esi
  1062a0:	85 c0                	test   %eax,%eax
  1062a2:	0f 88 c4 03 00 00    	js     10666c <exe_run_elf+0x4ac>
  1062a8:	83 ec 0c             	sub    $0xc,%esp
  1062ab:	68 f4 c3 10 00       	push   $0x10c3f4
  1062b0:	e8 5b a9 ff ff       	call   100c10 <terminal_writestring>
  1062b5:	83 c4 0c             	add    $0xc,%esp
  1062b8:	6a 0a                	push   $0xa
  1062ba:	53                   	push   %ebx
  1062bb:	56                   	push   %esi
  1062bc:	e8 6f a6 ff ff       	call   100930 <itoa>
  1062c1:	89 1c 24             	mov    %ebx,(%esp)
  1062c4:	e8 47 a9 ff ff       	call   100c10 <terminal_writestring>
  1062c9:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1062d0:	e8 3b a9 ff ff       	call   100c10 <terminal_writestring>
  1062d5:	83 c4 10             	add    $0x10,%esp
  1062d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1062db:	89 f0                	mov    %esi,%eax
  1062dd:	5b                   	pop    %ebx
  1062de:	5e                   	pop    %esi
  1062df:	5f                   	pop    %edi
  1062e0:	5d                   	pop    %ebp
  1062e1:	c3                   	ret
  1062e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1062e8:	80 7f 02 4c          	cmpb   $0x4c,0x2(%edi)
  1062ec:	0f 85 4c ff ff ff    	jne    10623e <exe_run_elf+0x7e>
  1062f2:	80 7f 03 46          	cmpb   $0x46,0x3(%edi)
  1062f6:	0f 85 42 ff ff ff    	jne    10623e <exe_run_elf+0x7e>
  1062fc:	80 7f 04 01          	cmpb   $0x1,0x4(%edi)
  106300:	75 46                	jne    106348 <exe_run_elf+0x188>
  106302:	66 83 7f 12 03       	cmpw   $0x3,0x12(%edi)
  106307:	0f 85 13 03 00 00    	jne    106620 <exe_run_elf+0x460>
  10630d:	66 83 7f 10 02       	cmpw   $0x2,0x10(%edi)
  106312:	74 4c                	je     106360 <exe_run_elf+0x1a0>
  106314:	83 ec 04             	sub    $0x4,%esp
  106317:	68 80 00 00 00       	push   $0x80
  10631c:	68 05 c3 10 00       	push   $0x10c305
  106321:	e9 25 ff ff ff       	jmp    10624b <exe_run_elf+0x8b>
  106326:	66 90                	xchg   %ax,%ax
  106328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10632f:	00 
  106330:	83 ec 04             	sub    $0x4,%esp
  106333:	68 80 00 00 00       	push   $0x80
  106338:	68 b7 c2 10 00       	push   $0x10c2b7
  10633d:	e9 09 ff ff ff       	jmp    10624b <exe_run_elf+0x8b>
  106342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106348:	83 ec 04             	sub    $0x4,%esp
  10634b:	68 80 00 00 00       	push   $0x80
  106350:	68 e7 c2 10 00       	push   $0x10c2e7
  106355:	e9 f1 fe ff ff       	jmp    10624b <exe_run_elf+0x8b>
  10635a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106360:	83 ec 0c             	sub    $0xc,%esp
  106363:	68 1b c3 10 00       	push   $0x10c31b
  106368:	e8 a3 a8 ff ff       	call   100c10 <terminal_writestring>
  10636d:	8b 4f 1c             	mov    0x1c(%edi),%ecx
  106370:	0f b7 57 2c          	movzwl 0x2c(%edi),%edx
  106374:	83 c4 10             	add    $0x10,%esp
  106377:	01 f9                	add    %edi,%ecx
  106379:	89 8d 94 fe ff ff    	mov    %ecx,-0x16c(%ebp)
  10637f:	66 85 d2             	test   %dx,%dx
  106382:	0f 84 a1 04 00 00    	je     106829 <exe_run_elf+0x669>
  106388:	c1 e2 05             	shl    $0x5,%edx
  10638b:	89 7d 0c             	mov    %edi,0xc(%ebp)
  10638e:	89 c8                	mov    %ecx,%eax
  106390:	be ff ff ff ff       	mov    $0xffffffff,%esi
  106395:	01 ca                	add    %ecx,%edx
  106397:	31 c9                	xor    %ecx,%ecx
  106399:	89 d7                	mov    %edx,%edi
  10639b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1063a0:	83 38 01             	cmpl   $0x1,(%eax)
  1063a3:	75 10                	jne    1063b5 <exe_run_elf+0x1f5>
  1063a5:	8b 50 08             	mov    0x8(%eax),%edx
  1063a8:	39 d6                	cmp    %edx,%esi
  1063aa:	0f 47 f2             	cmova  %edx,%esi
  1063ad:	03 50 14             	add    0x14(%eax),%edx
  1063b0:	39 d1                	cmp    %edx,%ecx
  1063b2:	0f 42 ca             	cmovb  %edx,%ecx
  1063b5:	83 c0 20             	add    $0x20,%eax
  1063b8:	39 f8                	cmp    %edi,%eax
  1063ba:	75 e4                	jne    1063a0 <exe_run_elf+0x1e0>
  1063bc:	89 b5 8c fe ff ff    	mov    %esi,-0x174(%ebp)
  1063c2:	8b 7d 0c             	mov    0xc(%ebp),%edi
  1063c5:	29 f1                	sub    %esi,%ecx
  1063c7:	0f 84 4a 04 00 00    	je     106817 <exe_run_elf+0x657>
  1063cd:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
  1063d3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  1063d9:	89 95 90 fe ff ff    	mov    %edx,-0x170(%ebp)
  1063df:	89 d0                	mov    %edx,%eax
  1063e1:	8b 0d 28 e0 10 00    	mov    0x10e028,%ecx
  1063e7:	83 ec 04             	sub    $0x4,%esp
  1063ea:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1063ed:	89 8d 88 fe ff ff    	mov    %ecx,-0x178(%ebp)
  1063f3:	89 ce                	mov    %ecx,%esi
  1063f5:	89 15 28 e0 10 00    	mov    %edx,0x10e028
  1063fb:	50                   	push   %eax
  1063fc:	6a 00                	push   $0x0
  1063fe:	51                   	push   %ecx
  1063ff:	e8 9c a0 ff ff       	call   1004a0 <memset>
  106404:	c7 04 24 4b c3 10 00 	movl   $0x10c34b,(%esp)
  10640b:	e8 00 a8 ff ff       	call   100c10 <terminal_writestring>
  106410:	89 f0                	mov    %esi,%eax
  106412:	c6 85 a8 fe ff ff 00 	movb   $0x0,-0x158(%ebp)
  106419:	c1 e8 1c             	shr    $0x1c,%eax
  10641c:	83 c0 30             	add    $0x30,%eax
  10641f:	88 85 a0 fe ff ff    	mov    %al,-0x160(%ebp)
  106425:	89 f0                	mov    %esi,%eax
  106427:	c1 e8 18             	shr    $0x18,%eax
  10642a:	83 e0 0f             	and    $0xf,%eax
  10642d:	83 c0 30             	add    $0x30,%eax
  106430:	88 85 a1 fe ff ff    	mov    %al,-0x15f(%ebp)
  106436:	89 f0                	mov    %esi,%eax
  106438:	c1 e8 14             	shr    $0x14,%eax
  10643b:	83 e0 0f             	and    $0xf,%eax
  10643e:	83 c0 30             	add    $0x30,%eax
  106441:	88 85 a2 fe ff ff    	mov    %al,-0x15e(%ebp)
  106447:	89 f0                	mov    %esi,%eax
  106449:	c1 e8 10             	shr    $0x10,%eax
  10644c:	83 e0 0f             	and    $0xf,%eax
  10644f:	83 c0 30             	add    $0x30,%eax
  106452:	88 85 a3 fe ff ff    	mov    %al,-0x15d(%ebp)
  106458:	89 f0                	mov    %esi,%eax
  10645a:	c1 e8 0c             	shr    $0xc,%eax
  10645d:	83 e0 0f             	and    $0xf,%eax
  106460:	83 c0 30             	add    $0x30,%eax
  106463:	88 85 a4 fe ff ff    	mov    %al,-0x15c(%ebp)
  106469:	89 f0                	mov    %esi,%eax
  10646b:	c1 e8 08             	shr    $0x8,%eax
  10646e:	83 e0 0f             	and    $0xf,%eax
  106471:	83 c0 30             	add    $0x30,%eax
  106474:	88 85 a5 fe ff ff    	mov    %al,-0x15b(%ebp)
  10647a:	89 f0                	mov    %esi,%eax
  10647c:	c0 e8 04             	shr    $0x4,%al
  10647f:	83 c0 30             	add    $0x30,%eax
  106482:	88 85 a6 fe ff ff    	mov    %al,-0x15a(%ebp)
  106488:	89 f0                	mov    %esi,%eax
  10648a:	83 e0 0f             	and    $0xf,%eax
  10648d:	83 c0 30             	add    $0x30,%eax
  106490:	88 85 a7 fe ff ff    	mov    %al,-0x159(%ebp)
  106496:	8d 85 a0 fe ff ff    	lea    -0x160(%ebp),%eax
  10649c:	89 04 24             	mov    %eax,(%esp)
  10649f:	e8 6c a7 ff ff       	call   100c10 <terminal_writestring>
  1064a4:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1064ab:	e8 60 a7 ff ff       	call   100c10 <terminal_writestring>
  1064b0:	c7 04 24 5c c3 10 00 	movl   $0x10c35c,(%esp)
  1064b7:	e8 54 a7 ff ff       	call   100c10 <terminal_writestring>
  1064bc:	83 c4 0c             	add    $0xc,%esp
  1064bf:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  1064c5:	6a 0a                	push   $0xa
  1064c7:	50                   	push   %eax
  1064c8:	ff b5 90 fe ff ff    	push   -0x170(%ebp)
  1064ce:	e8 5d a4 ff ff       	call   100930 <itoa>
  1064d3:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  1064d9:	89 04 24             	mov    %eax,(%esp)
  1064dc:	e8 2f a7 ff ff       	call   100c10 <terminal_writestring>
  1064e1:	c7 04 24 83 bd 10 00 	movl   $0x10bd83,(%esp)
  1064e8:	e8 23 a7 ff ff       	call   100c10 <terminal_writestring>
  1064ed:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
  1064f3:	83 c4 10             	add    $0x10,%esp
  1064f6:	31 d2                	xor    %edx,%edx
  1064f8:	8b b5 94 fe ff ff    	mov    -0x16c(%ebp),%esi
  1064fe:	89 85 94 fe ff ff    	mov    %eax,-0x16c(%ebp)
  106504:	66 83 7f 2c 00       	cmpw   $0x0,0x2c(%edi)
  106509:	74 2f                	je     10653a <exe_run_elf+0x37a>
  10650b:	89 7d 0c             	mov    %edi,0xc(%ebp)
  10650e:	89 f7                	mov    %esi,%edi
  106510:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106517:	00 
  106518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10651f:	00 
  106520:	83 3f 01             	cmpl   $0x1,(%edi)
  106523:	0f 84 55 01 00 00    	je     10667e <exe_run_elf+0x4be>
  106529:	8b 45 0c             	mov    0xc(%ebp),%eax
  10652c:	83 c2 01             	add    $0x1,%edx
  10652f:	83 c7 20             	add    $0x20,%edi
  106532:	66 3b 50 2c          	cmp    0x2c(%eax),%dx
  106536:	72 e8                	jb     106520 <exe_run_elf+0x360>
  106538:	89 c7                	mov    %eax,%edi
  10653a:	8b 95 88 fe ff ff    	mov    -0x178(%ebp),%edx
  106540:	8b 47 18             	mov    0x18(%edi),%eax
  106543:	83 ec 0c             	sub    $0xc,%esp
  106546:	c7 85 54 ff ff ff 01 	movl   $0x1,-0xac(%ebp)
  10654d:	00 00 00 
  106550:	c7 85 60 ff ff ff 00 	movl   $0x8000,-0xa0(%ebp)
  106557:	80 00 00 
  10655a:	8d b5 a0 fe ff ff    	lea    -0x160(%ebp),%esi
  106560:	01 d0                	add    %edx,%eax
  106562:	2b 85 8c fe ff ff    	sub    -0x174(%ebp),%eax
  106568:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
  10656e:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
  106574:	c7 85 64 ff ff ff 00 	movl   $0x100000,-0x9c(%ebp)
  10657b:	00 10 00 
  10657e:	68 6b c3 10 00       	push   $0x10c36b
  106583:	e8 88 a6 ff ff       	call   100c10 <terminal_writestring>
  106588:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
  10658e:	83 c4 10             	add    $0x10,%esp
  106591:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  106596:	89 85 90 fe ff ff    	mov    %eax,-0x170(%ebp)
  10659c:	eb 22                	jmp    1065c0 <exe_run_elf+0x400>
  10659e:	66 90                	xchg   %ax,%ax
  1065a0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065a7:	00 
  1065a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065af:	00 
  1065b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065b7:	00 
  1065b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065bf:	00 
  1065c0:	8b 85 90 fe ff ff    	mov    -0x170(%ebp),%eax
  1065c6:	d3 e8                	shr    %cl,%eax
  1065c8:	83 e0 0f             	and    $0xf,%eax
  1065cb:	3c 09                	cmp    $0x9,%al
  1065cd:	8d 78 30             	lea    0x30(%eax),%edi
  1065d0:	8d 50 57             	lea    0x57(%eax),%edx
  1065d3:	0f 46 d7             	cmovbe %edi,%edx
  1065d6:	83 e9 04             	sub    $0x4,%ecx
  1065d9:	83 c6 01             	add    $0x1,%esi
  1065dc:	88 56 ff             	mov    %dl,-0x1(%esi)
  1065df:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  1065e2:	75 dc                	jne    1065c0 <exe_run_elf+0x400>
  1065e4:	83 ec 0c             	sub    $0xc,%esp
  1065e7:	8d 85 a0 fe ff ff    	lea    -0x160(%ebp),%eax
  1065ed:	c6 85 a8 fe ff ff 00 	movb   $0x0,-0x158(%ebp)
  1065f4:	50                   	push   %eax
  1065f5:	e8 16 a6 ff ff       	call   100c10 <terminal_writestring>
  1065fa:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106601:	e8 0a a6 ff ff       	call   100c10 <terminal_writestring>
  106606:	c7 04 24 a2 c3 10 00 	movl   $0x10c3a2,(%esp)
  10660d:	e8 fe a5 ff ff       	call   100c10 <terminal_writestring>
  106612:	83 c4 10             	add    $0x10,%esp
  106615:	e9 4c fc ff ff       	jmp    106266 <exe_run_elf+0xa6>
  10661a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106620:	83 ec 04             	sub    $0x4,%esp
  106623:	68 80 00 00 00       	push   $0x80
  106628:	68 f8 c2 10 00       	push   $0x10c2f8
  10662d:	e9 19 fc ff ff       	jmp    10624b <exe_run_elf+0x8b>
  106632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106638:	83 ec 0c             	sub    $0xc,%esp
  10663b:	68 bc c3 10 00       	push   $0x10c3bc
  106640:	e8 cb a5 ff ff       	call   100c10 <terminal_writestring>
  106645:	8d 85 d4 fe ff ff    	lea    -0x12c(%ebp),%eax
  10664b:	89 04 24             	mov    %eax,(%esp)
  10664e:	e8 bd a5 ff ff       	call   100c10 <terminal_writestring>
  106653:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  10665a:	e8 b1 a5 ff ff       	call   100c10 <terminal_writestring>
  10665f:	83 c4 10             	add    $0x10,%esp
  106662:	be ff ff ff ff       	mov    $0xffffffff,%esi
  106667:	e9 6c fc ff ff       	jmp    1062d8 <exe_run_elf+0x118>
  10666c:	83 ec 0c             	sub    $0xc,%esp
  10666f:	68 da c3 10 00       	push   $0x10c3da
  106674:	e8 97 a5 ff ff       	call   100c10 <terminal_writestring>
  106679:	83 c4 10             	add    $0x10,%esp
  10667c:	eb e4                	jmp    106662 <exe_run_elf+0x4a2>
  10667e:	8b 85 88 fe ff ff    	mov    -0x178(%ebp),%eax
  106684:	2b 85 8c fe ff ff    	sub    -0x174(%ebp),%eax
  10668a:	83 ec 0c             	sub    $0xc,%esp
  10668d:	89 95 7c fe ff ff    	mov    %edx,-0x184(%ebp)
  106693:	03 47 08             	add    0x8(%edi),%eax
  106696:	89 85 74 fe ff ff    	mov    %eax,-0x18c(%ebp)
  10669c:	8b 47 10             	mov    0x10(%edi),%eax
  10669f:	89 85 84 fe ff ff    	mov    %eax,-0x17c(%ebp)
  1066a5:	8b 47 14             	mov    0x14(%edi),%eax
  1066a8:	89 85 80 fe ff ff    	mov    %eax,-0x180(%ebp)
  1066ae:	68 7d c3 10 00       	push   $0x10c37d
  1066b3:	e8 58 a5 ff ff       	call   100c10 <terminal_writestring>
  1066b8:	8b 47 08             	mov    0x8(%edi),%eax
  1066bb:	83 c4 10             	add    $0x10,%esp
  1066be:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  1066c3:	89 bd 78 fe ff ff    	mov    %edi,-0x188(%ebp)
  1066c9:	8b b5 94 fe ff ff    	mov    -0x16c(%ebp),%esi
  1066cf:	89 85 90 fe ff ff    	mov    %eax,-0x170(%ebp)
  1066d5:	eb 29                	jmp    106700 <exe_run_elf+0x540>
  1066d7:	90                   	nop
  1066d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066df:	00 
  1066e0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066e7:	00 
  1066e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066ef:	00 
  1066f0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066f7:	00 
  1066f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066ff:	00 
  106700:	8b 85 90 fe ff ff    	mov    -0x170(%ebp),%eax
  106706:	d3 e8                	shr    %cl,%eax
  106708:	83 e0 0f             	and    $0xf,%eax
  10670b:	3c 09                	cmp    $0x9,%al
  10670d:	8d 78 30             	lea    0x30(%eax),%edi
  106710:	8d 50 57             	lea    0x57(%eax),%edx
  106713:	0f 46 d7             	cmovbe %edi,%edx
  106716:	83 e9 04             	sub    $0x4,%ecx
  106719:	83 c6 01             	add    $0x1,%esi
  10671c:	88 56 ff             	mov    %dl,-0x1(%esi)
  10671f:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  106722:	75 dc                	jne    106700 <exe_run_elf+0x540>
  106724:	0f b7 95 7c fe ff ff 	movzwl -0x184(%ebp),%edx
  10672b:	83 ec 0c             	sub    $0xc,%esp
  10672e:	c6 85 c8 fe ff ff 00 	movb   $0x0,-0x138(%ebp)
  106735:	8b bd 78 fe ff ff    	mov    -0x188(%ebp),%edi
  10673b:	89 95 90 fe ff ff    	mov    %edx,-0x170(%ebp)
  106741:	ff b5 94 fe ff ff    	push   -0x16c(%ebp)
  106747:	e8 c4 a4 ff ff       	call   100c10 <terminal_writestring>
  10674c:	c7 04 24 91 c3 10 00 	movl   $0x10c391,(%esp)
  106753:	e8 b8 a4 ff ff       	call   100c10 <terminal_writestring>
  106758:	8b b5 84 fe ff ff    	mov    -0x17c(%ebp),%esi
  10675e:	83 c4 0c             	add    $0xc,%esp
  106761:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106767:	6a 0a                	push   $0xa
  106769:	50                   	push   %eax
  10676a:	56                   	push   %esi
  10676b:	e8 c0 a1 ff ff       	call   100930 <itoa>
  106770:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106776:	89 04 24             	mov    %eax,(%esp)
  106779:	e8 92 a4 ff ff       	call   100c10 <terminal_writestring>
  10677e:	c7 04 24 9a c3 10 00 	movl   $0x10c39a,(%esp)
  106785:	e8 86 a4 ff ff       	call   100c10 <terminal_writestring>
  10678a:	83 c4 0c             	add    $0xc,%esp
  10678d:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106793:	6a 0a                	push   $0xa
  106795:	50                   	push   %eax
  106796:	ff b5 80 fe ff ff    	push   -0x180(%ebp)
  10679c:	e8 8f a1 ff ff       	call   100930 <itoa>
  1067a1:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  1067a7:	89 04 24             	mov    %eax,(%esp)
  1067aa:	e8 61 a4 ff ff       	call   100c10 <terminal_writestring>
  1067af:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1067b6:	e8 55 a4 ff ff       	call   100c10 <terminal_writestring>
  1067bb:	83 c4 10             	add    $0x10,%esp
  1067be:	85 f6                	test   %esi,%esi
  1067c0:	8b 95 90 fe ff ff    	mov    -0x170(%ebp),%edx
  1067c6:	74 0b                	je     1067d3 <exe_run_elf+0x613>
  1067c8:	8b 47 04             	mov    0x4(%edi),%eax
  1067cb:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
  1067ce:	39 4d 10             	cmp    %ecx,0x10(%ebp)
  1067d1:	73 74                	jae    106847 <exe_run_elf+0x687>
  1067d3:	8b 8d 80 fe ff ff    	mov    -0x180(%ebp),%ecx
  1067d9:	39 8d 84 fe ff ff    	cmp    %ecx,-0x17c(%ebp)
  1067df:	0f 83 44 fd ff ff    	jae    106529 <exe_run_elf+0x369>
  1067e5:	89 95 90 fe ff ff    	mov    %edx,-0x170(%ebp)
  1067eb:	8b 95 84 fe ff ff    	mov    -0x17c(%ebp),%edx
  1067f1:	89 c8                	mov    %ecx,%eax
  1067f3:	83 ec 04             	sub    $0x4,%esp
  1067f6:	29 d0                	sub    %edx,%eax
  1067f8:	50                   	push   %eax
  1067f9:	8b 85 74 fe ff ff    	mov    -0x18c(%ebp),%eax
  1067ff:	6a 00                	push   $0x0
  106801:	01 d0                	add    %edx,%eax
  106803:	50                   	push   %eax
  106804:	e8 97 9c ff ff       	call   1004a0 <memset>
  106809:	8b 95 90 fe ff ff    	mov    -0x170(%ebp),%edx
  10680f:	83 c4 10             	add    $0x10,%esp
  106812:	e9 12 fd ff ff       	jmp    106529 <exe_run_elf+0x369>
  106817:	83 ec 04             	sub    $0x4,%esp
  10681a:	68 80 00 00 00       	push   $0x80
  10681f:	68 36 c3 10 00       	push   $0x10c336
  106824:	e9 22 fa ff ff       	jmp    10624b <exe_run_elf+0x8b>
  106829:	c7 85 90 fe ff ff 00 	movl   $0x1000,-0x170(%ebp)
  106830:	10 00 00 
  106833:	b8 00 10 00 00       	mov    $0x1000,%eax
  106838:	c7 85 8c fe ff ff ff 	movl   $0xffffffff,-0x174(%ebp)
  10683f:	ff ff ff 
  106842:	e9 9a fb ff ff       	jmp    1063e1 <exe_run_elf+0x221>
  106847:	83 ec 04             	sub    $0x4,%esp
  10684a:	03 45 0c             	add    0xc(%ebp),%eax
  10684d:	ff b5 84 fe ff ff    	push   -0x17c(%ebp)
  106853:	50                   	push   %eax
  106854:	ff b5 74 fe ff ff    	push   -0x18c(%ebp)
  10685a:	e8 01 9c ff ff       	call   100460 <memcpy>
  10685f:	8b 95 90 fe ff ff    	mov    -0x170(%ebp),%edx
  106865:	83 c4 10             	add    $0x10,%esp
  106868:	e9 66 ff ff ff       	jmp    1067d3 <exe_run_elf+0x613>
  10686d:	8d 76 00             	lea    0x0(%esi),%esi

00106870 <exe_run_pe>:
  106870:	55                   	push   %ebp
  106871:	89 e5                	mov    %esp,%ebp
  106873:	57                   	push   %edi
  106874:	56                   	push   %esi
  106875:	53                   	push   %ebx
  106876:	81 ec 78 01 00 00    	sub    $0x178,%esp
  10687c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10687f:	68 0f c4 10 00       	push   $0x10c40f
  106884:	e8 87 a3 ff ff       	call   100c10 <terminal_writestring>
  106889:	85 db                	test   %ebx,%ebx
  10688b:	b8 93 c2 10 00       	mov    $0x10c293,%eax
  106890:	0f 44 d8             	cmove  %eax,%ebx
  106893:	89 1c 24             	mov    %ebx,(%esp)
  106896:	e8 75 a3 ff ff       	call   100c10 <terminal_writestring>
  10689b:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1068a2:	e8 69 a3 ff ff       	call   100c10 <terminal_writestring>
  1068a7:	83 c4 0c             	add    $0xc,%esp
  1068aa:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
  1068b0:	68 94 00 00 00       	push   $0x94
  1068b5:	6a 00                	push   $0x0
  1068b7:	50                   	push   %eax
  1068b8:	e8 e3 9b ff ff       	call   1004a0 <memset>
  1068bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1068c0:	83 c4 10             	add    $0x10,%esp
  1068c3:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
  1068ca:	00 00 00 
  1068cd:	85 db                	test   %ebx,%ebx
  1068cf:	0f 84 5b 04 00 00    	je     106d30 <exe_run_pe+0x4c0>
  1068d5:	83 7d 10 3f          	cmpl   $0x3f,0x10(%ebp)
  1068d9:	0f 86 51 04 00 00    	jbe    106d30 <exe_run_pe+0x4c0>
  1068df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1068e2:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%eax)
  1068e7:	0f 85 8b 03 00 00    	jne    106c78 <exe_run_pe+0x408>
  1068ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1068f0:	8b 40 3c             	mov    0x3c(%eax),%eax
  1068f3:	8d 50 18             	lea    0x18(%eax),%edx
  1068f6:	39 55 10             	cmp    %edx,0x10(%ebp)
  1068f9:	0f 82 61 04 00 00    	jb     106d60 <exe_run_pe+0x4f0>
  1068ff:	03 45 0c             	add    0xc(%ebp),%eax
  106902:	89 85 98 fe ff ff    	mov    %eax,-0x168(%ebp)
  106908:	81 38 50 45 00 00    	cmpl   $0x4550,(%eax)
  10690e:	0f 85 9c 04 00 00    	jne    106db0 <exe_run_pe+0x540>
  106914:	8b 85 98 fe ff ff    	mov    -0x168(%ebp),%eax
  10691a:	66 81 78 18 0b 01    	cmpw   $0x10b,0x18(%eax)
  106920:	0f 85 22 04 00 00    	jne    106d48 <exe_run_pe+0x4d8>
  106926:	83 ec 0c             	sub    $0xc,%esp
  106929:	68 7f c4 10 00       	push   $0x10c47f
  10692e:	e8 dd a2 ff ff       	call   100c10 <terminal_writestring>
  106933:	8b 85 98 fe ff ff    	mov    -0x168(%ebp),%eax
  106939:	8b 3d 28 e0 10 00    	mov    0x10e028,%edi
  10693f:	83 c4 0c             	add    $0xc,%esp
  106942:	0f b7 70 14          	movzwl 0x14(%eax),%esi
  106946:	8b 40 50             	mov    0x50(%eax),%eax
  106949:	89 bd 90 fe ff ff    	mov    %edi,-0x170(%ebp)
  10694f:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
  106955:	89 85 a4 fe ff ff    	mov    %eax,-0x15c(%ebp)
  10695b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  106961:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
  106964:	89 15 28 e0 10 00    	mov    %edx,0x10e028
  10696a:	53                   	push   %ebx
  10696b:	6a 00                	push   $0x0
  10696d:	57                   	push   %edi
  10696e:	e8 2d 9b ff ff       	call   1004a0 <memset>
  106973:	83 c4 10             	add    $0x10,%esp
  106976:	85 ff                	test   %edi,%edi
  106978:	0f 84 77 05 00 00    	je     106ef5 <exe_run_pe+0x685>
  10697e:	83 ec 04             	sub    $0x4,%esp
  106981:	8d bd b0 fe ff ff    	lea    -0x150(%ebp),%edi
  106987:	53                   	push   %ebx
  106988:	89 fb                	mov    %edi,%ebx
  10698a:	6a 00                	push   $0x0
  10698c:	ff b5 90 fe ff ff    	push   -0x170(%ebp)
  106992:	e8 09 9b ff ff       	call   1004a0 <memset>
  106997:	c7 04 24 4b c3 10 00 	movl   $0x10c34b,(%esp)
  10699e:	e8 6d a2 ff ff       	call   100c10 <terminal_writestring>
  1069a3:	83 c4 10             	add    $0x10,%esp
  1069a6:	66 89 b5 a4 fe ff ff 	mov    %si,-0x15c(%ebp)
  1069ad:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  1069b2:	89 bd a0 fe ff ff    	mov    %edi,-0x160(%ebp)
  1069b8:	8b bd 90 fe ff ff    	mov    -0x170(%ebp),%edi
  1069be:	66 90                	xchg   %ax,%ax
  1069c0:	89 f8                	mov    %edi,%eax
  1069c2:	d3 e8                	shr    %cl,%eax
  1069c4:	83 e0 0f             	and    $0xf,%eax
  1069c7:	3c 09                	cmp    $0x9,%al
  1069c9:	8d 70 30             	lea    0x30(%eax),%esi
  1069cc:	8d 50 57             	lea    0x57(%eax),%edx
  1069cf:	0f 46 d6             	cmovbe %esi,%edx
  1069d2:	83 e9 04             	sub    $0x4,%ecx
  1069d5:	83 c3 01             	add    $0x1,%ebx
  1069d8:	88 53 ff             	mov    %dl,-0x1(%ebx)
  1069db:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  1069de:	75 e0                	jne    1069c0 <exe_run_pe+0x150>
  1069e0:	83 ec 0c             	sub    $0xc,%esp
  1069e3:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  1069e9:	c6 85 b8 fe ff ff 00 	movb   $0x0,-0x148(%ebp)
  1069f0:	0f b7 b5 a4 fe ff ff 	movzwl -0x15c(%ebp),%esi
  1069f7:	8b bd a0 fe ff ff    	mov    -0x160(%ebp),%edi
  1069fd:	50                   	push   %eax
  1069fe:	e8 0d a2 ff ff       	call   100c10 <terminal_writestring>
  106a03:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106a0a:	e8 01 a2 ff ff       	call   100c10 <terminal_writestring>
  106a0f:	8b 9d 98 fe ff ff    	mov    -0x168(%ebp),%ebx
  106a15:	83 c4 0c             	add    $0xc,%esp
  106a18:	8b 43 54             	mov    0x54(%ebx),%eax
  106a1b:	39 45 10             	cmp    %eax,0x10(%ebp)
  106a1e:	0f 46 45 10          	cmovbe 0x10(%ebp),%eax
  106a22:	50                   	push   %eax
  106a23:	ff 75 0c             	push   0xc(%ebp)
  106a26:	ff b5 90 fe ff ff    	push   -0x170(%ebp)
  106a2c:	e8 2f 9a ff ff       	call   100460 <memcpy>
  106a31:	83 c4 10             	add    $0x10,%esp
  106a34:	66 83 7b 06 00       	cmpw   $0x0,0x6(%ebx)
  106a39:	0f 84 c8 04 00 00    	je     106f07 <exe_run_pe+0x697>
  106a3f:	8b 85 98 fe ff ff    	mov    -0x168(%ebp),%eax
  106a45:	31 c9                	xor    %ecx,%ecx
  106a47:	89 bd 8c fe ff ff    	mov    %edi,-0x174(%ebp)
  106a4d:	66 89 8d a0 fe ff ff 	mov    %cx,-0x160(%ebp)
  106a54:	8d 54 30 18          	lea    0x18(%eax,%esi,1),%edx
  106a58:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
  106a5e:	89 85 9c fe ff ff    	mov    %eax,-0x164(%ebp)
  106a64:	89 d7                	mov    %edx,%edi
  106a66:	66 90                	xchg   %ax,%ax
  106a68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106a6f:	00 
  106a70:	8b 47 08             	mov    0x8(%edi),%eax
  106a73:	8b 5f 10             	mov    0x10(%edi),%ebx
  106a76:	8b b5 90 fe ff ff    	mov    -0x170(%ebp),%esi
  106a7c:	03 77 0c             	add    0xc(%edi),%esi
  106a7f:	89 85 a4 fe ff ff    	mov    %eax,-0x15c(%ebp)
  106a85:	85 db                	test   %ebx,%ebx
  106a87:	74 0f                	je     106a98 <exe_run_pe+0x228>
  106a89:	8b 47 14             	mov    0x14(%edi),%eax
  106a8c:	8d 14 18             	lea    (%eax,%ebx,1),%edx
  106a8f:	39 55 10             	cmp    %edx,0x10(%ebp)
  106a92:	0f 83 f8 02 00 00    	jae    106d90 <exe_run_pe+0x520>
  106a98:	8b 85 a4 fe ff ff    	mov    -0x15c(%ebp),%eax
  106a9e:	39 c3                	cmp    %eax,%ebx
  106aa0:	0f 82 d2 02 00 00    	jb     106d78 <exe_run_pe+0x508>
  106aa6:	8b b5 9c fe ff ff    	mov    -0x164(%ebp),%esi
  106aac:	83 ec 04             	sub    $0x4,%esp
  106aaf:	8d 9d b0 fe ff ff    	lea    -0x150(%ebp),%ebx
  106ab5:	6a 08                	push   $0x8
  106ab7:	57                   	push   %edi
  106ab8:	56                   	push   %esi
  106ab9:	e8 a2 99 ff ff       	call   100460 <memcpy>
  106abe:	c6 85 c8 fe ff ff 00 	movb   $0x0,-0x138(%ebp)
  106ac5:	c7 04 24 99 c4 10 00 	movl   $0x10c499,(%esp)
  106acc:	e8 3f a1 ff ff       	call   100c10 <terminal_writestring>
  106ad1:	89 34 24             	mov    %esi,(%esp)
  106ad4:	e8 37 a1 ff ff       	call   100c10 <terminal_writestring>
  106ad9:	c7 04 24 87 c3 10 00 	movl   $0x10c387,(%esp)
  106ae0:	e8 2b a1 ff ff       	call   100c10 <terminal_writestring>
  106ae5:	83 c4 10             	add    $0x10,%esp
  106ae8:	8b 77 0c             	mov    0xc(%edi),%esi
  106aeb:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  106af0:	89 bd 94 fe ff ff    	mov    %edi,-0x16c(%ebp)
  106af6:	66 90                	xchg   %ax,%ax
  106af8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106aff:	00 
  106b00:	89 f0                	mov    %esi,%eax
  106b02:	d3 e8                	shr    %cl,%eax
  106b04:	83 e0 0f             	and    $0xf,%eax
  106b07:	3c 09                	cmp    $0x9,%al
  106b09:	8d 78 30             	lea    0x30(%eax),%edi
  106b0c:	8d 50 57             	lea    0x57(%eax),%edx
  106b0f:	0f 46 d7             	cmovbe %edi,%edx
  106b12:	83 e9 04             	sub    $0x4,%ecx
  106b15:	83 c3 01             	add    $0x1,%ebx
  106b18:	88 53 ff             	mov    %dl,-0x1(%ebx)
  106b1b:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  106b1e:	75 e0                	jne    106b00 <exe_run_pe+0x290>
  106b20:	83 ec 0c             	sub    $0xc,%esp
  106b23:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106b29:	8b bd 94 fe ff ff    	mov    -0x16c(%ebp),%edi
  106b2f:	c6 85 b8 fe ff ff 00 	movb   $0x0,-0x148(%ebp)
  106b36:	50                   	push   %eax
  106b37:	83 c7 28             	add    $0x28,%edi
  106b3a:	e8 d1 a0 ff ff       	call   100c10 <terminal_writestring>
  106b3f:	c7 04 24 ba bf 10 00 	movl   $0x10bfba,(%esp)
  106b46:	e8 c5 a0 ff ff       	call   100c10 <terminal_writestring>
  106b4b:	83 c4 0c             	add    $0xc,%esp
  106b4e:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106b54:	6a 0a                	push   $0xa
  106b56:	50                   	push   %eax
  106b57:	ff b5 a4 fe ff ff    	push   -0x15c(%ebp)
  106b5d:	e8 ce 9d ff ff       	call   100930 <itoa>
  106b62:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106b68:	89 04 24             	mov    %eax,(%esp)
  106b6b:	e8 a0 a0 ff ff       	call   100c10 <terminal_writestring>
  106b70:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106b77:	e8 94 a0 ff ff       	call   100c10 <terminal_writestring>
  106b7c:	8b b5 98 fe ff ff    	mov    -0x168(%ebp),%esi
  106b82:	66 83 85 a0 fe ff ff 	addw   $0x1,-0x160(%ebp)
  106b89:	01 
  106b8a:	83 c4 10             	add    $0x10,%esp
  106b8d:	0f b7 85 a0 fe ff ff 	movzwl -0x160(%ebp),%eax
  106b94:	66 3b 46 06          	cmp    0x6(%esi),%ax
  106b98:	0f 82 d2 fe ff ff    	jb     106a70 <exe_run_pe+0x200>
  106b9e:	8b bd 8c fe ff ff    	mov    -0x174(%ebp),%edi
  106ba4:	8b b5 98 fe ff ff    	mov    -0x168(%ebp),%esi
  106baa:	8b 85 90 fe ff ff    	mov    -0x170(%ebp),%eax
  106bb0:	2b 46 34             	sub    0x34(%esi),%eax
  106bb3:	89 85 a4 fe ff ff    	mov    %eax,-0x15c(%ebp)
  106bb9:	0f 85 03 02 00 00    	jne    106dc2 <exe_run_pe+0x552>
  106bbf:	8b b5 98 fe ff ff    	mov    -0x168(%ebp),%esi
  106bc5:	8b 9d 90 fe ff ff    	mov    -0x170(%ebp),%ebx
  106bcb:	83 ec 0c             	sub    $0xc,%esp
  106bce:	c7 85 54 ff ff ff 01 	movl   $0x1,-0xac(%ebp)
  106bd5:	00 00 00 
  106bd8:	8b 46 28             	mov    0x28(%esi),%eax
  106bdb:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
  106be1:	01 d8                	add    %ebx,%eax
  106be3:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
  106be9:	8b 46 60             	mov    0x60(%esi),%eax
  106bec:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  106bf2:	8b 46 68             	mov    0x68(%esi),%eax
  106bf5:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
  106bfb:	68 6b c3 10 00       	push   $0x10c36b
  106c00:	e8 0b a0 ff ff       	call   100c10 <terminal_writestring>
  106c05:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
  106c0b:	83 c4 10             	add    $0x10,%esp
  106c0e:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  106c13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c1f:	00 
  106c20:	89 d8                	mov    %ebx,%eax
  106c22:	d3 e8                	shr    %cl,%eax
  106c24:	83 e0 0f             	and    $0xf,%eax
  106c27:	3c 09                	cmp    $0x9,%al
  106c29:	8d 70 30             	lea    0x30(%eax),%esi
  106c2c:	8d 50 57             	lea    0x57(%eax),%edx
  106c2f:	0f 46 d6             	cmovbe %esi,%edx
  106c32:	83 e9 04             	sub    $0x4,%ecx
  106c35:	83 c7 01             	add    $0x1,%edi
  106c38:	88 57 ff             	mov    %dl,-0x1(%edi)
  106c3b:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  106c3e:	75 e0                	jne    106c20 <exe_run_pe+0x3b0>
  106c40:	83 ec 0c             	sub    $0xc,%esp
  106c43:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106c49:	c6 85 b8 fe ff ff 00 	movb   $0x0,-0x148(%ebp)
  106c50:	50                   	push   %eax
  106c51:	e8 ba 9f ff ff       	call   100c10 <terminal_writestring>
  106c56:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106c5d:	e8 ae 9f ff ff       	call   100c10 <terminal_writestring>
  106c62:	c7 04 24 ab c4 10 00 	movl   $0x10c4ab,(%esp)
  106c69:	e8 a2 9f ff ff       	call   100c10 <terminal_writestring>
  106c6e:	83 c4 10             	add    $0x10,%esp
  106c71:	eb 2d                	jmp    106ca0 <exe_run_pe+0x430>
  106c73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c78:	83 ec 04             	sub    $0x4,%esp
  106c7b:	68 80 00 00 00       	push   $0x80
  106c80:	68 38 c4 10 00       	push   $0x10c438
  106c85:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  106c8b:	50                   	push   %eax
  106c8c:	e8 6f 99 ff ff       	call   100600 <strncpy>
  106c91:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
  106c97:	83 c4 10             	add    $0x10,%esp
  106c9a:	89 85 9c fe ff ff    	mov    %eax,-0x164(%ebp)
  106ca0:	8b bd 9c fe ff ff    	mov    -0x164(%ebp),%edi
  106ca6:	b9 25 00 00 00       	mov    $0x25,%ecx
  106cab:	8d b5 54 ff ff ff    	lea    -0xac(%ebp),%esi
  106cb1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  106cb3:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  106cb9:	85 c0                	test   %eax,%eax
  106cbb:	0f 84 57 02 00 00    	je     106f18 <exe_run_pe+0x6a8>
  106cc1:	83 ec 04             	sub    $0x4,%esp
  106cc4:	68 80 00 00 00       	push   $0x80
  106cc9:	ff b5 c4 fe ff ff    	push   -0x13c(%ebp)
  106ccf:	68 d8 c4 10 00       	push   $0x10c4d8
  106cd4:	e8 77 e6 ff ff       	call   105350 <process_create>
  106cd9:	83 c4 10             	add    $0x10,%esp
  106cdc:	89 c3                	mov    %eax,%ebx
  106cde:	85 c0                	test   %eax,%eax
  106ce0:	0f 88 6a 02 00 00    	js     106f50 <exe_run_pe+0x6e0>
  106ce6:	83 ec 0c             	sub    $0xc,%esp
  106ce9:	68 f4 c3 10 00       	push   $0x10c3f4
  106cee:	e8 1d 9f ff ff       	call   100c10 <terminal_writestring>
  106cf3:	83 c4 0c             	add    $0xc,%esp
  106cf6:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
  106cfc:	6a 0a                	push   $0xa
  106cfe:	50                   	push   %eax
  106cff:	53                   	push   %ebx
  106d00:	e8 2b 9c ff ff       	call   100930 <itoa>
  106d05:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
  106d0b:	89 04 24             	mov    %eax,(%esp)
  106d0e:	e8 fd 9e ff ff       	call   100c10 <terminal_writestring>
  106d13:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106d1a:	e8 f1 9e ff ff       	call   100c10 <terminal_writestring>
  106d1f:	83 c4 10             	add    $0x10,%esp
  106d22:	8d 65 f4             	lea    -0xc(%ebp),%esp
  106d25:	89 d8                	mov    %ebx,%eax
  106d27:	5b                   	pop    %ebx
  106d28:	5e                   	pop    %esi
  106d29:	5f                   	pop    %edi
  106d2a:	5d                   	pop    %ebp
  106d2b:	c3                   	ret
  106d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106d30:	83 ec 04             	sub    $0x4,%esp
  106d33:	68 80 00 00 00       	push   $0x80
  106d38:	68 29 c4 10 00       	push   $0x10c429
  106d3d:	e9 43 ff ff ff       	jmp    106c85 <exe_run_pe+0x415>
  106d42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106d48:	83 ec 04             	sub    $0x4,%esp
  106d4b:	68 80 00 00 00       	push   $0x80
  106d50:	68 e0 d4 10 00       	push   $0x10d4e0
  106d55:	e9 2b ff ff ff       	jmp    106c85 <exe_run_pe+0x415>
  106d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106d60:	83 ec 04             	sub    $0x4,%esp
  106d63:	68 80 00 00 00       	push   $0x80
  106d68:	68 52 c4 10 00       	push   $0x10c452
  106d6d:	e9 13 ff ff ff       	jmp    106c85 <exe_run_pe+0x415>
  106d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106d78:	83 ec 04             	sub    $0x4,%esp
  106d7b:	29 d8                	sub    %ebx,%eax
  106d7d:	01 de                	add    %ebx,%esi
  106d7f:	50                   	push   %eax
  106d80:	6a 00                	push   $0x0
  106d82:	56                   	push   %esi
  106d83:	e8 18 97 ff ff       	call   1004a0 <memset>
  106d88:	83 c4 10             	add    $0x10,%esp
  106d8b:	e9 16 fd ff ff       	jmp    106aa6 <exe_run_pe+0x236>
  106d90:	83 ec 04             	sub    $0x4,%esp
  106d93:	03 45 0c             	add    0xc(%ebp),%eax
  106d96:	53                   	push   %ebx
  106d97:	50                   	push   %eax
  106d98:	56                   	push   %esi
  106d99:	e8 c2 96 ff ff       	call   100460 <memcpy>
  106d9e:	83 c4 10             	add    $0x10,%esp
  106da1:	e9 f2 fc ff ff       	jmp    106a98 <exe_run_pe+0x228>
  106da6:	66 90                	xchg   %ax,%ax
  106da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106daf:	00 
  106db0:	83 ec 04             	sub    $0x4,%esp
  106db3:	68 80 00 00 00       	push   $0x80
  106db8:	68 6a c4 10 00       	push   $0x10c46a
  106dbd:	e9 c3 fe ff ff       	jmp    106c85 <exe_run_pe+0x415>
  106dc2:	83 ec 0c             	sub    $0xc,%esp
  106dc5:	8d 9d b0 fe ff ff    	lea    -0x150(%ebp),%ebx
  106dcb:	68 2c d5 10 00       	push   $0x10d52c
  106dd0:	e8 3b 9e ff ff       	call   100c10 <terminal_writestring>
  106dd5:	83 c4 10             	add    $0x10,%esp
  106dd8:	89 bd a0 fe ff ff    	mov    %edi,-0x160(%ebp)
  106dde:	8b bd a4 fe ff ff    	mov    -0x15c(%ebp),%edi
  106de4:	b9 1c 00 00 00       	mov    $0x1c,%ecx
  106de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106df0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106df7:	00 
  106df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106dff:	00 
  106e00:	89 f8                	mov    %edi,%eax
  106e02:	d3 e8                	shr    %cl,%eax
  106e04:	83 e0 0f             	and    $0xf,%eax
  106e07:	3c 09                	cmp    $0x9,%al
  106e09:	8d 70 30             	lea    0x30(%eax),%esi
  106e0c:	8d 50 57             	lea    0x57(%eax),%edx
  106e0f:	0f 46 d6             	cmovbe %esi,%edx
  106e12:	83 e9 04             	sub    $0x4,%ecx
  106e15:	83 c3 01             	add    $0x1,%ebx
  106e18:	88 53 ff             	mov    %dl,-0x1(%ebx)
  106e1b:	83 f9 fc             	cmp    $0xfffffffc,%ecx
  106e1e:	75 e0                	jne    106e00 <exe_run_pe+0x590>
  106e20:	83 ec 0c             	sub    $0xc,%esp
  106e23:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
  106e29:	c6 85 b8 fe ff ff 00 	movb   $0x0,-0x148(%ebp)
  106e30:	8b bd a0 fe ff ff    	mov    -0x160(%ebp),%edi
  106e36:	50                   	push   %eax
  106e37:	e8 d4 9d ff ff       	call   100c10 <terminal_writestring>
  106e3c:	c7 04 24 a5 c4 10 00 	movl   $0x10c4a5,(%esp)
  106e43:	e8 c8 9d ff ff       	call   100c10 <terminal_writestring>
  106e48:	8b b5 98 fe ff ff    	mov    -0x168(%ebp),%esi
  106e4e:	83 c4 10             	add    $0x10,%esp
  106e51:	8b 86 a0 00 00 00    	mov    0xa0(%esi),%eax
  106e57:	85 c0                	test   %eax,%eax
  106e59:	0f 84 60 fd ff ff    	je     106bbf <exe_run_pe+0x34f>
  106e5f:	8b 96 a4 00 00 00    	mov    0xa4(%esi),%edx
  106e65:	85 d2                	test   %edx,%edx
  106e67:	0f 84 52 fd ff ff    	je     106bbf <exe_run_pe+0x34f>
  106e6d:	03 85 90 fe ff ff    	add    -0x170(%ebp),%eax
  106e73:	8d 34 02             	lea    (%edx,%eax,1),%esi
  106e76:	8d 50 08             	lea    0x8(%eax),%edx
  106e79:	89 b5 a0 fe ff ff    	mov    %esi,-0x160(%ebp)
  106e7f:	39 d6                	cmp    %edx,%esi
  106e81:	0f 82 38 fd ff ff    	jb     106bbf <exe_run_pe+0x34f>
  106e87:	89 bd 94 fe ff ff    	mov    %edi,-0x16c(%ebp)
  106e8d:	8b bd a4 fe ff ff    	mov    -0x15c(%ebp),%edi
  106e93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e9f:	00 
  106ea0:	8b 58 04             	mov    0x4(%eax),%ebx
  106ea3:	85 db                	test   %ebx,%ebx
  106ea5:	74 43                	je     106eea <exe_run_pe+0x67a>
  106ea7:	01 c3                	add    %eax,%ebx
  106ea9:	39 da                	cmp    %ebx,%edx
  106eab:	0f 83 9b 00 00 00    	jae    106f4c <exe_run_pe+0x6dc>
  106eb1:	8b 30                	mov    (%eax),%esi
  106eb3:	89 d0                	mov    %edx,%eax
  106eb5:	03 b5 90 fe ff ff    	add    -0x170(%ebp),%esi
  106ebb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  106ec0:	0f b7 10             	movzwl (%eax),%edx
  106ec3:	83 c0 02             	add    $0x2,%eax
  106ec6:	89 d1                	mov    %edx,%ecx
  106ec8:	66 c1 e9 0c          	shr    $0xc,%cx
  106ecc:	66 83 f9 03          	cmp    $0x3,%cx
  106ed0:	75 09                	jne    106edb <exe_run_pe+0x66b>
  106ed2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  106ed8:	01 3c 16             	add    %edi,(%esi,%edx,1)
  106edb:	39 d8                	cmp    %ebx,%eax
  106edd:	72 e1                	jb     106ec0 <exe_run_pe+0x650>
  106edf:	8d 50 08             	lea    0x8(%eax),%edx
  106ee2:	39 95 a0 fe ff ff    	cmp    %edx,-0x160(%ebp)
  106ee8:	73 b6                	jae    106ea0 <exe_run_pe+0x630>
  106eea:	8b bd 94 fe ff ff    	mov    -0x16c(%ebp),%edi
  106ef0:	e9 ca fc ff ff       	jmp    106bbf <exe_run_pe+0x34f>
  106ef5:	83 ec 04             	sub    $0x4,%esp
  106ef8:	68 80 00 00 00       	push   $0x80
  106efd:	68 08 d5 10 00       	push   $0x10d508
  106f02:	e9 7e fd ff ff       	jmp    106c85 <exe_run_pe+0x415>
  106f07:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
  106f0d:	89 85 9c fe ff ff    	mov    %eax,-0x164(%ebp)
  106f13:	e9 8c fc ff ff       	jmp    106ba4 <exe_run_pe+0x334>
  106f18:	83 ec 0c             	sub    $0xc,%esp
  106f1b:	68 c4 c4 10 00       	push   $0x10c4c4
  106f20:	e8 eb 9c ff ff       	call   100c10 <terminal_writestring>
  106f25:	8d 85 d4 fe ff ff    	lea    -0x12c(%ebp),%eax
  106f2b:	89 04 24             	mov    %eax,(%esp)
  106f2e:	e8 dd 9c ff ff       	call   100c10 <terminal_writestring>
  106f33:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  106f3a:	e8 d1 9c ff ff       	call   100c10 <terminal_writestring>
  106f3f:	83 c4 10             	add    $0x10,%esp
  106f42:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  106f47:	e9 d6 fd ff ff       	jmp    106d22 <exe_run_pe+0x4b2>
  106f4c:	89 d0                	mov    %edx,%eax
  106f4e:	eb 8f                	jmp    106edf <exe_run_pe+0x66f>
  106f50:	83 ec 0c             	sub    $0xc,%esp
  106f53:	68 da c3 10 00       	push   $0x10c3da
  106f58:	e8 b3 9c ff ff       	call   100c10 <terminal_writestring>
  106f5d:	83 c4 10             	add    $0x10,%esp
  106f60:	eb e0                	jmp    106f42 <exe_run_pe+0x6d2>
  106f62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106f68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106f6f:	00 

00106f70 <exe_run>:
  106f70:	55                   	push   %ebp
  106f71:	89 e5                	mov    %esp,%ebp
  106f73:	57                   	push   %edi
  106f74:	56                   	push   %esi
  106f75:	53                   	push   %ebx
  106f76:	83 ec 1c             	sub    $0x1c,%esp
  106f79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  106f7c:	8b 7d 08             	mov    0x8(%ebp),%edi
  106f7f:	8b 75 10             	mov    0x10(%ebp),%esi
  106f82:	85 db                	test   %ebx,%ebx
  106f84:	0f 84 0f 01 00 00    	je     107099 <exe_run+0x129>
  106f8a:	85 f6                	test   %esi,%esi
  106f8c:	0f 84 07 01 00 00    	je     107099 <exe_run+0x129>
  106f92:	0f b6 03             	movzbl (%ebx),%eax
  106f95:	3c 7f                	cmp    $0x7f,%al
  106f97:	74 37                	je     106fd0 <exe_run+0x60>
  106f99:	3c 4d                	cmp    $0x4d,%al
  106f9b:	75 3d                	jne    106fda <exe_run+0x6a>
  106f9d:	80 7b 01 5a          	cmpb   $0x5a,0x1(%ebx)
  106fa1:	75 37                	jne    106fda <exe_run+0x6a>
  106fa3:	83 ec 0c             	sub    $0xc,%esp
  106fa6:	68 0e c5 10 00       	push   $0x10c50e
  106fab:	e8 60 9c ff ff       	call   100c10 <terminal_writestring>
  106fb0:	83 c4 10             	add    $0x10,%esp
  106fb3:	89 75 10             	mov    %esi,0x10(%ebp)
  106fb6:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  106fb9:	89 7d 08             	mov    %edi,0x8(%ebp)
  106fbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  106fbf:	5b                   	pop    %ebx
  106fc0:	5e                   	pop    %esi
  106fc1:	5f                   	pop    %edi
  106fc2:	5d                   	pop    %ebp
  106fc3:	e9 a8 f8 ff ff       	jmp    106870 <exe_run_pe>
  106fc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106fcf:	00 
  106fd0:	80 7b 01 45          	cmpb   $0x45,0x1(%ebx)
  106fd4:	0f 84 86 00 00 00    	je     107060 <exe_run+0xf0>
  106fda:	83 ec 0c             	sub    $0xc,%esp
  106fdd:	68 50 d5 10 00       	push   $0x10d550
  106fe2:	e8 29 9c ff ff       	call   100c10 <terminal_writestring>
  106fe7:	0f b6 03             	movzbl (%ebx),%eax
  106fea:	c6 45 e2 20          	movb   $0x20,-0x1e(%ebp)
  106fee:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  106ff2:	89 c2                	mov    %eax,%edx
  106ff4:	83 e0 0f             	and    $0xf,%eax
  106ff7:	0f b6 80 6a ba 10 00 	movzbl 0x10ba6a(%eax),%eax
  106ffe:	c0 ea 04             	shr    $0x4,%dl
  107001:	0f b6 d2             	movzbl %dl,%edx
  107004:	88 45 e1             	mov    %al,-0x1f(%ebp)
  107007:	0f b6 92 6a ba 10 00 	movzbl 0x10ba6a(%edx),%edx
  10700e:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
  107012:	88 55 e0             	mov    %dl,-0x20(%ebp)
  107015:	89 c2                	mov    %eax,%edx
  107017:	83 e0 0f             	and    $0xf,%eax
  10701a:	c0 ea 04             	shr    $0x4,%dl
  10701d:	0f b6 80 6a ba 10 00 	movzbl 0x10ba6a(%eax),%eax
  107024:	0f b6 d2             	movzbl %dl,%edx
  107027:	0f b6 92 6a ba 10 00 	movzbl 0x10ba6a(%edx),%edx
  10702e:	88 45 e4             	mov    %al,-0x1c(%ebp)
  107031:	8d 45 e0             	lea    -0x20(%ebp),%eax
  107034:	88 55 e3             	mov    %dl,-0x1d(%ebp)
  107037:	89 04 24             	mov    %eax,(%esp)
  10703a:	e8 d1 9b ff ff       	call   100c10 <terminal_writestring>
  10703f:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  107046:	e8 c5 9b ff ff       	call   100c10 <terminal_writestring>
  10704b:	83 c4 10             	add    $0x10,%esp
  10704e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  107051:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  107056:	5b                   	pop    %ebx
  107057:	5e                   	pop    %esi
  107058:	5f                   	pop    %edi
  107059:	5d                   	pop    %ebp
  10705a:	c3                   	ret
  10705b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107060:	80 7b 02 4c          	cmpb   $0x4c,0x2(%ebx)
  107064:	0f 85 70 ff ff ff    	jne    106fda <exe_run+0x6a>
  10706a:	80 7b 03 46          	cmpb   $0x46,0x3(%ebx)
  10706e:	0f 85 66 ff ff ff    	jne    106fda <exe_run+0x6a>
  107074:	83 ec 0c             	sub    $0xc,%esp
  107077:	68 f9 c4 10 00       	push   $0x10c4f9
  10707c:	e8 8f 9b ff ff       	call   100c10 <terminal_writestring>
  107081:	83 c4 10             	add    $0x10,%esp
  107084:	89 75 10             	mov    %esi,0x10(%ebp)
  107087:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10708a:	89 7d 08             	mov    %edi,0x8(%ebp)
  10708d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  107090:	5b                   	pop    %ebx
  107091:	5e                   	pop    %esi
  107092:	5f                   	pop    %edi
  107093:	5d                   	pop    %ebp
  107094:	e9 27 f1 ff ff       	jmp    1061c0 <exe_run_elf>
  107099:	83 ec 0c             	sub    $0xc,%esp
  10709c:	68 e0 c4 10 00       	push   $0x10c4e0
  1070a1:	e8 6a 9b ff ff       	call   100c10 <terminal_writestring>
  1070a6:	83 c4 10             	add    $0x10,%esp
  1070a9:	eb a3                	jmp    10704e <exe_run+0xde>
  1070ab:	66 90                	xchg   %ax,%ax
  1070ad:	66 90                	xchg   %ax,%ax
  1070af:	90                   	nop

001070b0 <context_switch>:
  1070b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1070b4:	85 c0                	test   %eax,%eax
  1070b6:	74 52                	je     10710a <context_switch.restore_only>
  1070b8:	89 58 04             	mov    %ebx,0x4(%eax)
  1070bb:	89 48 08             	mov    %ecx,0x8(%eax)
  1070be:	89 50 0c             	mov    %edx,0xc(%eax)
  1070c1:	89 70 10             	mov    %esi,0x10(%eax)
  1070c4:	89 78 14             	mov    %edi,0x14(%eax)
  1070c7:	89 68 18             	mov    %ebp,0x18(%eax)
  1070ca:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  1070ce:	89 48 1c             	mov    %ecx,0x1c(%eax)
  1070d1:	8b 0c 24             	mov    (%esp),%ecx
  1070d4:	89 48 20             	mov    %ecx,0x20(%eax)
  1070d7:	9c                   	pushf
  1070d8:	59                   	pop    %ecx
  1070d9:	81 c9 00 02 00 00    	or     $0x200,%ecx
  1070df:	89 48 24             	mov    %ecx,0x24(%eax)
  1070e2:	31 c9                	xor    %ecx,%ecx
  1070e4:	66 8c c9             	mov    %cs,%cx
  1070e7:	89 48 28             	mov    %ecx,0x28(%eax)
  1070ea:	66 8c d1             	mov    %ss,%cx
  1070ed:	89 48 2c             	mov    %ecx,0x2c(%eax)
  1070f0:	66 8c d9             	mov    %ds,%cx
  1070f3:	89 48 30             	mov    %ecx,0x30(%eax)
  1070f6:	66 8c c1             	mov    %es,%cx
  1070f9:	89 48 34             	mov    %ecx,0x34(%eax)
  1070fc:	66 8c e1             	mov    %fs,%cx
  1070ff:	89 48 38             	mov    %ecx,0x38(%eax)
  107102:	66 8c e9             	mov    %gs,%cx
  107105:	89 48 3c             	mov    %ecx,0x3c(%eax)
  107108:	89 00                	mov    %eax,(%eax)

0010710a <context_switch.restore_only>:
  10710a:	8b 44 24 08          	mov    0x8(%esp),%eax
  10710e:	8b 48 30             	mov    0x30(%eax),%ecx
  107111:	8e d9                	mov    %ecx,%ds
  107113:	8b 48 34             	mov    0x34(%eax),%ecx
  107116:	8e c1                	mov    %ecx,%es
  107118:	8b 48 38             	mov    0x38(%eax),%ecx
  10711b:	8e e1                	mov    %ecx,%fs
  10711d:	8b 48 3c             	mov    0x3c(%eax),%ecx
  107120:	8e e9                	mov    %ecx,%gs
  107122:	8b 58 04             	mov    0x4(%eax),%ebx
  107125:	8b 48 08             	mov    0x8(%eax),%ecx
  107128:	8b 50 0c             	mov    0xc(%eax),%edx
  10712b:	8b 70 10             	mov    0x10(%eax),%esi
  10712e:	8b 78 14             	mov    0x14(%eax),%edi
  107131:	8b 68 18             	mov    0x18(%eax),%ebp
  107134:	8b 60 1c             	mov    0x1c(%eax),%esp
  107137:	ff 70 24             	push   0x24(%eax)
  10713a:	9d                   	popf
  10713b:	ff 70 20             	push   0x20(%eax)
  10713e:	8b 00                	mov    (%eax),%eax
  107140:	c3                   	ret

00107141 <syscall_handler>:
  107141:	1e                   	push   %ds
  107142:	06                   	push   %es
  107143:	0f a0                	push   %fs
  107145:	0f a8                	push   %gs
  107147:	60                   	pusha
  107148:	66 b8 10 00          	mov    $0x10,%ax
  10714c:	8e d8                	mov    %eax,%ds
  10714e:	8e c0                	mov    %eax,%es
  107150:	8e e0                	mov    %eax,%fs
  107152:	8e e8                	mov    %eax,%gs
  107154:	52                   	push   %edx
  107155:	51                   	push   %ecx
  107156:	53                   	push   %ebx
  107157:	50                   	push   %eax
  107158:	e8 d3 ee ff ff       	call   106030 <system_call_handler>
  10715d:	83 c4 10             	add    $0x10,%esp
  107160:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  107164:	61                   	popa
  107165:	0f a9                	pop    %gs
  107167:	0f a1                	pop    %fs
  107169:	07                   	pop    %es
  10716a:	1f                   	pop    %ds
  10716b:	cf                   	iret
  10716c:	66 90                	xchg   %ax,%ax
  10716e:	66 90                	xchg   %ax,%ax
  107170:	66 90                	xchg   %ax,%ax
  107172:	66 90                	xchg   %ax,%ax
  107174:	66 90                	xchg   %ax,%ax
  107176:	66 90                	xchg   %ax,%ax
  107178:	66 90                	xchg   %ax,%ax
  10717a:	66 90                	xchg   %ax,%ax
  10717c:	66 90                	xchg   %ax,%ax
  10717e:	66 90                	xchg   %ax,%ax

00107180 <is_in_interrupt>:
  107180:	9c                   	pushf
  107181:	58                   	pop    %eax
  107182:	c1 e8 09             	shr    $0x9,%eax
  107185:	83 e0 01             	and    $0x1,%eax
  107188:	83 f0 01             	xor    $0x1,%eax
  10718b:	c3                   	ret
  10718c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107190 <sem_init>:
  107190:	55                   	push   %ebp
  107191:	89 e5                	mov    %esp,%ebp
  107193:	53                   	push   %ebx
  107194:	83 ec 04             	sub    $0x4,%esp
  107197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10719a:	85 db                	test   %ebx,%ebx
  10719c:	74 44                	je     1071e2 <sem_init+0x52>
  10719e:	83 ec 04             	sub    $0x4,%esp
  1071a1:	6a 28                	push   $0x28
  1071a3:	6a 00                	push   $0x0
  1071a5:	53                   	push   %ebx
  1071a6:	e8 f5 92 ff ff       	call   1004a0 <memset>
  1071ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1071ae:	83 c4 10             	add    $0x10,%esp
  1071b1:	85 c0                	test   %eax,%eax
  1071b3:	74 15                	je     1071ca <sem_init+0x3a>
  1071b5:	83 ec 04             	sub    $0x4,%esp
  1071b8:	6a 17                	push   $0x17
  1071ba:	ff 75 0c             	push   0xc(%ebp)
  1071bd:	53                   	push   %ebx
  1071be:	e8 3d 94 ff ff       	call   100600 <strncpy>
  1071c3:	c6 43 17 00          	movb   $0x0,0x17(%ebx)
  1071c7:	83 c4 10             	add    $0x10,%esp
  1071ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1071cd:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  1071d4:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  1071db:	89 43 18             	mov    %eax,0x18(%ebx)
  1071de:	c6 43 24 01          	movb   $0x1,0x24(%ebx)
  1071e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1071e5:	c9                   	leave
  1071e6:	c3                   	ret
  1071e7:	90                   	nop
  1071e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1071ef:	00 

001071f0 <sem_wait>:
  1071f0:	55                   	push   %ebp
  1071f1:	89 e5                	mov    %esp,%ebp
  1071f3:	83 ec 08             	sub    $0x8,%esp
  1071f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1071f9:	85 d2                	test   %edx,%edx
  1071fb:	74 08                	je     107205 <sem_wait+0x15>
  1071fd:	fa                   	cli
  1071fe:	83 6a 18 01          	subl   $0x1,0x18(%edx)
  107202:	78 0c                	js     107210 <sem_wait+0x20>
  107204:	fb                   	sti
  107205:	c9                   	leave
  107206:	c3                   	ret
  107207:	90                   	nop
  107208:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10720f:	00 
  107210:	89 55 08             	mov    %edx,0x8(%ebp)
  107213:	e8 18 e5 ff ff       	call   105730 <get_current_thread>
  107218:	85 c0                	test   %eax,%eax
  10721a:	74 e8                	je     107204 <sem_wait+0x14>
  10721c:	8b 55 08             	mov    0x8(%ebp),%edx
  10721f:	c7 40 24 02 00 00 00 	movl   $0x2,0x24(%eax)
  107226:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  10722d:	00 00 00 
  107230:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107237:	00 00 00 
  10723a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
  10723d:	85 c9                	test   %ecx,%ecx
  10723f:	74 1f                	je     107260 <sem_wait+0x70>
  107241:	8b 4a 20             	mov    0x20(%edx),%ecx
  107244:	89 81 80 00 00 00    	mov    %eax,0x80(%ecx)
  10724a:	8b 4a 20             	mov    0x20(%edx),%ecx
  10724d:	89 88 84 00 00 00    	mov    %ecx,0x84(%eax)
  107253:	89 42 20             	mov    %eax,0x20(%edx)
  107256:	fb                   	sti
  107257:	e8 14 e1 ff ff       	call   105370 <schedule>
  10725c:	eb a6                	jmp    107204 <sem_wait+0x14>
  10725e:	66 90                	xchg   %ax,%ax
  107260:	89 42 1c             	mov    %eax,0x1c(%edx)
  107263:	eb ee                	jmp    107253 <sem_wait+0x63>
  107265:	8d 76 00             	lea    0x0(%esi),%esi
  107268:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10726f:	00 

00107270 <sem_signal>:
  107270:	55                   	push   %ebp
  107271:	89 e5                	mov    %esp,%ebp
  107273:	83 ec 08             	sub    $0x8,%esp
  107276:	8b 45 08             	mov    0x8(%ebp),%eax
  107279:	85 c0                	test   %eax,%eax
  10727b:	74 0f                	je     10728c <sem_signal+0x1c>
  10727d:	fa                   	cli
  10727e:	8b 48 18             	mov    0x18(%eax),%ecx
  107281:	8d 51 01             	lea    0x1(%ecx),%edx
  107284:	89 50 18             	mov    %edx,0x18(%eax)
  107287:	85 d2                	test   %edx,%edx
  107289:	7e 05                	jle    107290 <sem_signal+0x20>
  10728b:	fb                   	sti
  10728c:	c9                   	leave
  10728d:	c3                   	ret
  10728e:	66 90                	xchg   %ax,%ax
  107290:	8b 50 1c             	mov    0x1c(%eax),%edx
  107293:	85 d2                	test   %edx,%edx
  107295:	74 f4                	je     10728b <sem_signal+0x1b>
  107297:	8b 8a 80 00 00 00    	mov    0x80(%edx),%ecx
  10729d:	89 48 1c             	mov    %ecx,0x1c(%eax)
  1072a0:	85 c9                	test   %ecx,%ecx
  1072a2:	74 2c                	je     1072d0 <sem_signal+0x60>
  1072a4:	c7 81 84 00 00 00 00 	movl   $0x0,0x84(%ecx)
  1072ab:	00 00 00 
  1072ae:	c7 82 80 00 00 00 00 	movl   $0x0,0x80(%edx)
  1072b5:	00 00 00 
  1072b8:	83 ec 0c             	sub    $0xc,%esp
  1072bb:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  1072c2:	00 00 00 
  1072c5:	52                   	push   %edx
  1072c6:	e8 b5 e5 ff ff       	call   105880 <thread_unblock>
  1072cb:	83 c4 10             	add    $0x10,%esp
  1072ce:	eb bb                	jmp    10728b <sem_signal+0x1b>
  1072d0:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  1072d7:	eb d5                	jmp    1072ae <sem_signal+0x3e>
  1072d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001072e0 <sem_try_wait>:
  1072e0:	55                   	push   %ebp
  1072e1:	89 e5                	mov    %esp,%ebp
  1072e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1072e6:	85 c0                	test   %eax,%eax
  1072e8:	74 1e                	je     107308 <sem_try_wait+0x28>
  1072ea:	fa                   	cli
  1072eb:	8b 50 18             	mov    0x18(%eax),%edx
  1072ee:	31 c9                	xor    %ecx,%ecx
  1072f0:	85 d2                	test   %edx,%edx
  1072f2:	7e 0b                	jle    1072ff <sem_try_wait+0x1f>
  1072f4:	83 ea 01             	sub    $0x1,%edx
  1072f7:	b9 01 00 00 00       	mov    $0x1,%ecx
  1072fc:	89 50 18             	mov    %edx,0x18(%eax)
  1072ff:	fb                   	sti
  107300:	89 c8                	mov    %ecx,%eax
  107302:	5d                   	pop    %ebp
  107303:	c3                   	ret
  107304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107308:	31 c9                	xor    %ecx,%ecx
  10730a:	5d                   	pop    %ebp
  10730b:	89 c8                	mov    %ecx,%eax
  10730d:	c3                   	ret
  10730e:	66 90                	xchg   %ax,%ax

00107310 <sem_destroy>:
  107310:	55                   	push   %ebp
  107311:	89 e5                	mov    %esp,%ebp
  107313:	53                   	push   %ebx
  107314:	83 ec 04             	sub    $0x4,%esp
  107317:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10731a:	85 db                	test   %ebx,%ebx
  10731c:	74 73                	je     107391 <sem_destroy+0x81>
  10731e:	fa                   	cli
  10731f:	8b 43 1c             	mov    0x1c(%ebx),%eax
  107322:	85 c0                	test   %eax,%eax
  107324:	75 3b                	jne    107361 <sem_destroy+0x51>
  107326:	eb 58                	jmp    107380 <sem_destroy+0x70>
  107328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10732f:	00 
  107330:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  107337:	00 00 00 
  10733a:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  107341:	00 00 00 
  107344:	83 ec 0c             	sub    $0xc,%esp
  107347:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  10734e:	00 00 00 
  107351:	50                   	push   %eax
  107352:	e8 29 e5 ff ff       	call   105880 <thread_unblock>
  107357:	8b 43 1c             	mov    0x1c(%ebx),%eax
  10735a:	83 c4 10             	add    $0x10,%esp
  10735d:	85 c0                	test   %eax,%eax
  10735f:	74 1f                	je     107380 <sem_destroy+0x70>
  107361:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  107367:	89 53 1c             	mov    %edx,0x1c(%ebx)
  10736a:	85 d2                	test   %edx,%edx
  10736c:	75 c2                	jne    107330 <sem_destroy+0x20>
  10736e:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  107375:	eb c3                	jmp    10733a <sem_destroy+0x2a>
  107377:	90                   	nop
  107378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10737f:	00 
  107380:	83 ec 04             	sub    $0x4,%esp
  107383:	6a 28                	push   $0x28
  107385:	6a 00                	push   $0x0
  107387:	53                   	push   %ebx
  107388:	e8 13 91 ff ff       	call   1004a0 <memset>
  10738d:	fb                   	sti
  10738e:	83 c4 10             	add    $0x10,%esp
  107391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  107394:	c9                   	leave
  107395:	c3                   	ret
  107396:	66 90                	xchg   %ax,%ax
  107398:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10739f:	00 

001073a0 <mutex_init>:
  1073a0:	55                   	push   %ebp
  1073a1:	89 e5                	mov    %esp,%ebp
  1073a3:	53                   	push   %ebx
  1073a4:	83 ec 04             	sub    $0x4,%esp
  1073a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1073aa:	85 db                	test   %ebx,%ebx
  1073ac:	74 49                	je     1073f7 <mutex_init+0x57>
  1073ae:	83 ec 04             	sub    $0x4,%esp
  1073b1:	6a 2c                	push   $0x2c
  1073b3:	6a 00                	push   $0x0
  1073b5:	53                   	push   %ebx
  1073b6:	e8 e5 90 ff ff       	call   1004a0 <memset>
  1073bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1073be:	83 c4 10             	add    $0x10,%esp
  1073c1:	85 c0                	test   %eax,%eax
  1073c3:	74 15                	je     1073da <mutex_init+0x3a>
  1073c5:	83 ec 04             	sub    $0x4,%esp
  1073c8:	6a 17                	push   $0x17
  1073ca:	ff 75 0c             	push   0xc(%ebp)
  1073cd:	53                   	push   %ebx
  1073ce:	e8 2d 92 ff ff       	call   100600 <strncpy>
  1073d3:	c6 43 17 00          	movb   $0x0,0x17(%ebx)
  1073d7:	83 c4 10             	add    $0x10,%esp
  1073da:	c6 43 18 00          	movb   $0x0,0x18(%ebx)
  1073de:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  1073e5:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  1073ec:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
  1073f3:	c6 43 28 01          	movb   $0x1,0x28(%ebx)
  1073f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1073fa:	c9                   	leave
  1073fb:	c3                   	ret
  1073fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00107400 <mutex_lock>:
  107400:	55                   	push   %ebp
  107401:	89 e5                	mov    %esp,%ebp
  107403:	53                   	push   %ebx
  107404:	83 ec 04             	sub    $0x4,%esp
  107407:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10740a:	85 db                	test   %ebx,%ebx
  10740c:	74 62                	je     107470 <mutex_lock+0x70>
  10740e:	fa                   	cli
  10740f:	e8 1c e3 ff ff       	call   105730 <get_current_thread>
  107414:	80 7b 18 00          	cmpb   $0x0,0x18(%ebx)
  107418:	74 4e                	je     107468 <mutex_lock+0x68>
  10741a:	39 43 1c             	cmp    %eax,0x1c(%ebx)
  10741d:	74 59                	je     107478 <mutex_lock+0x78>
  10741f:	85 c0                	test   %eax,%eax
  107421:	74 55                	je     107478 <mutex_lock+0x78>
  107423:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  10742a:	00 00 00 
  10742d:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107434:	00 00 00 
  107437:	8b 53 20             	mov    0x20(%ebx),%edx
  10743a:	c7 40 24 02 00 00 00 	movl   $0x2,0x24(%eax)
  107441:	85 d2                	test   %edx,%edx
  107443:	74 3b                	je     107480 <mutex_lock+0x80>
  107445:	8b 53 24             	mov    0x24(%ebx),%edx
  107448:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
  10744e:	8b 53 24             	mov    0x24(%ebx),%edx
  107451:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  107457:	89 43 24             	mov    %eax,0x24(%ebx)
  10745a:	fb                   	sti
  10745b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10745e:	c9                   	leave
  10745f:	e9 0c df ff ff       	jmp    105370 <schedule>
  107464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107468:	c6 43 18 01          	movb   $0x1,0x18(%ebx)
  10746c:	89 43 1c             	mov    %eax,0x1c(%ebx)
  10746f:	fb                   	sti
  107470:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  107473:	c9                   	leave
  107474:	c3                   	ret
  107475:	8d 76 00             	lea    0x0(%esi),%esi
  107478:	fb                   	sti
  107479:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10747c:	c9                   	leave
  10747d:	c3                   	ret
  10747e:	66 90                	xchg   %ax,%ax
  107480:	89 43 20             	mov    %eax,0x20(%ebx)
  107483:	eb d2                	jmp    107457 <mutex_lock+0x57>
  107485:	8d 76 00             	lea    0x0(%esi),%esi
  107488:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10748f:	00 

00107490 <mutex_unlock>:
  107490:	55                   	push   %ebp
  107491:	89 e5                	mov    %esp,%ebp
  107493:	53                   	push   %ebx
  107494:	83 ec 04             	sub    $0x4,%esp
  107497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10749a:	85 db                	test   %ebx,%ebx
  10749c:	74 0c                	je     1074aa <mutex_unlock+0x1a>
  10749e:	fa                   	cli
  10749f:	e8 8c e2 ff ff       	call   105730 <get_current_thread>
  1074a4:	39 43 1c             	cmp    %eax,0x1c(%ebx)
  1074a7:	74 07                	je     1074b0 <mutex_unlock+0x20>
  1074a9:	fb                   	sti
  1074aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1074ad:	c9                   	leave
  1074ae:	c3                   	ret
  1074af:	90                   	nop
  1074b0:	8b 43 20             	mov    0x20(%ebx),%eax
  1074b3:	85 c0                	test   %eax,%eax
  1074b5:	74 51                	je     107508 <mutex_unlock+0x78>
  1074b7:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  1074bd:	89 53 20             	mov    %edx,0x20(%ebx)
  1074c0:	85 d2                	test   %edx,%edx
  1074c2:	74 34                	je     1074f8 <mutex_unlock+0x68>
  1074c4:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  1074cb:	00 00 00 
  1074ce:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1074d5:	00 00 00 
  1074d8:	83 ec 0c             	sub    $0xc,%esp
  1074db:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  1074e2:	00 00 00 
  1074e5:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1074e8:	50                   	push   %eax
  1074e9:	e8 92 e3 ff ff       	call   105880 <thread_unblock>
  1074ee:	83 c4 10             	add    $0x10,%esp
  1074f1:	eb b6                	jmp    1074a9 <mutex_unlock+0x19>
  1074f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074f8:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
  1074ff:	eb cd                	jmp    1074ce <mutex_unlock+0x3e>
  107501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107508:	c6 43 18 00          	movb   $0x0,0x18(%ebx)
  10750c:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  107513:	eb 94                	jmp    1074a9 <mutex_unlock+0x19>
  107515:	8d 76 00             	lea    0x0(%esi),%esi
  107518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10751f:	00 

00107520 <mutex_try_lock>:
  107520:	55                   	push   %ebp
  107521:	89 e5                	mov    %esp,%ebp
  107523:	83 ec 08             	sub    $0x8,%esp
  107526:	8b 55 08             	mov    0x8(%ebp),%edx
  107529:	85 d2                	test   %edx,%edx
  10752b:	74 33                	je     107560 <mutex_try_lock+0x40>
  10752d:	fa                   	cli
  10752e:	31 c0                	xor    %eax,%eax
  107530:	80 7a 18 00          	cmpb   $0x0,0x18(%edx)
  107534:	74 0a                	je     107540 <mutex_try_lock+0x20>
  107536:	fb                   	sti
  107537:	c9                   	leave
  107538:	c3                   	ret
  107539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107540:	c6 42 18 01          	movb   $0x1,0x18(%edx)
  107544:	89 55 08             	mov    %edx,0x8(%ebp)
  107547:	e8 e4 e1 ff ff       	call   105730 <get_current_thread>
  10754c:	8b 55 08             	mov    0x8(%ebp),%edx
  10754f:	89 42 1c             	mov    %eax,0x1c(%edx)
  107552:	b8 01 00 00 00       	mov    $0x1,%eax
  107557:	eb dd                	jmp    107536 <mutex_try_lock+0x16>
  107559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107560:	c9                   	leave
  107561:	31 c0                	xor    %eax,%eax
  107563:	c3                   	ret
  107564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107568:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10756f:	00 

00107570 <mutex_destroy>:
  107570:	55                   	push   %ebp
  107571:	89 e5                	mov    %esp,%ebp
  107573:	53                   	push   %ebx
  107574:	83 ec 04             	sub    $0x4,%esp
  107577:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10757a:	85 db                	test   %ebx,%ebx
  10757c:	74 73                	je     1075f1 <mutex_destroy+0x81>
  10757e:	fa                   	cli
  10757f:	8b 43 20             	mov    0x20(%ebx),%eax
  107582:	85 c0                	test   %eax,%eax
  107584:	75 3b                	jne    1075c1 <mutex_destroy+0x51>
  107586:	eb 58                	jmp    1075e0 <mutex_destroy+0x70>
  107588:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10758f:	00 
  107590:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  107597:	00 00 00 
  10759a:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1075a1:	00 00 00 
  1075a4:	83 ec 0c             	sub    $0xc,%esp
  1075a7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  1075ae:	00 00 00 
  1075b1:	50                   	push   %eax
  1075b2:	e8 c9 e2 ff ff       	call   105880 <thread_unblock>
  1075b7:	8b 43 20             	mov    0x20(%ebx),%eax
  1075ba:	83 c4 10             	add    $0x10,%esp
  1075bd:	85 c0                	test   %eax,%eax
  1075bf:	74 1f                	je     1075e0 <mutex_destroy+0x70>
  1075c1:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  1075c7:	89 53 20             	mov    %edx,0x20(%ebx)
  1075ca:	85 d2                	test   %edx,%edx
  1075cc:	75 c2                	jne    107590 <mutex_destroy+0x20>
  1075ce:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
  1075d5:	eb c3                	jmp    10759a <mutex_destroy+0x2a>
  1075d7:	90                   	nop
  1075d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1075df:	00 
  1075e0:	83 ec 04             	sub    $0x4,%esp
  1075e3:	6a 2c                	push   $0x2c
  1075e5:	6a 00                	push   $0x0
  1075e7:	53                   	push   %ebx
  1075e8:	e8 b3 8e ff ff       	call   1004a0 <memset>
  1075ed:	fb                   	sti
  1075ee:	83 c4 10             	add    $0x10,%esp
  1075f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1075f4:	c9                   	leave
  1075f5:	c3                   	ret
  1075f6:	66 90                	xchg   %ax,%ax
  1075f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1075ff:	00 

00107600 <msg_queue_init>:
  107600:	55                   	push   %ebp
  107601:	89 e5                	mov    %esp,%ebp
  107603:	53                   	push   %ebx
  107604:	83 ec 04             	sub    $0x4,%esp
  107607:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10760a:	85 db                	test   %ebx,%ebx
  10760c:	74 7c                	je     10768a <msg_queue_init+0x8a>
  10760e:	83 ec 04             	sub    $0x4,%esp
  107611:	68 f8 04 00 00       	push   $0x4f8
  107616:	6a 00                	push   $0x0
  107618:	53                   	push   %ebx
  107619:	e8 82 8e ff ff       	call   1004a0 <memset>
  10761e:	8b 45 0c             	mov    0xc(%ebp),%eax
  107621:	83 c4 10             	add    $0x10,%esp
  107624:	85 c0                	test   %eax,%eax
  107626:	74 15                	je     10763d <msg_queue_init+0x3d>
  107628:	83 ec 04             	sub    $0x4,%esp
  10762b:	6a 17                	push   $0x17
  10762d:	ff 75 0c             	push   0xc(%ebp)
  107630:	53                   	push   %ebx
  107631:	e8 ca 8f ff ff       	call   100600 <strncpy>
  107636:	c6 43 17 00          	movb   $0x0,0x17(%ebx)
  10763a:	83 c4 10             	add    $0x10,%esp
  10763d:	c7 83 d8 04 00 00 00 	movl   $0x0,0x4d8(%ebx)
  107644:	00 00 00 
  107647:	c7 83 dc 04 00 00 00 	movl   $0x0,0x4dc(%ebx)
  10764e:	00 00 00 
  107651:	c7 83 e0 04 00 00 00 	movl   $0x0,0x4e0(%ebx)
  107658:	00 00 00 
  10765b:	c6 83 e4 04 00 00 01 	movb   $0x1,0x4e4(%ebx)
  107662:	c7 83 e8 04 00 00 00 	movl   $0x0,0x4e8(%ebx)
  107669:	00 00 00 
  10766c:	c7 83 ec 04 00 00 00 	movl   $0x0,0x4ec(%ebx)
  107673:	00 00 00 
  107676:	c7 83 f0 04 00 00 00 	movl   $0x0,0x4f0(%ebx)
  10767d:	00 00 00 
  107680:	c7 83 f4 04 00 00 00 	movl   $0x0,0x4f4(%ebx)
  107687:	00 00 00 
  10768a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10768d:	c9                   	leave
  10768e:	c3                   	ret
  10768f:	90                   	nop

00107690 <msg_send>:
  107690:	55                   	push   %ebp
  107691:	89 e5                	mov    %esp,%ebp
  107693:	56                   	push   %esi
  107694:	53                   	push   %ebx
  107695:	83 ec 10             	sub    $0x10,%esp
  107698:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10769b:	85 db                	test   %ebx,%ebx
  10769d:	0f 84 49 01 00 00    	je     1077ec <msg_send+0x15c>
  1076a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1076a6:	85 c9                	test   %ecx,%ecx
  1076a8:	75 2a                	jne    1076d4 <msg_send+0x44>
  1076aa:	e9 3d 01 00 00       	jmp    1077ec <msg_send+0x15c>
  1076af:	90                   	nop
  1076b0:	8b 93 ec 04 00 00    	mov    0x4ec(%ebx),%edx
  1076b6:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
  1076bc:	8b 93 ec 04 00 00    	mov    0x4ec(%ebx),%edx
  1076c2:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  1076c8:	89 83 ec 04 00 00    	mov    %eax,0x4ec(%ebx)
  1076ce:	fb                   	sti
  1076cf:	e8 9c dc ff ff       	call   105370 <schedule>
  1076d4:	fa                   	cli
  1076d5:	83 bb e0 04 00 00 0f 	cmpl   $0xf,0x4e0(%ebx)
  1076dc:	76 42                	jbe    107720 <msg_send+0x90>
  1076de:	e8 4d e0 ff ff       	call   105730 <get_current_thread>
  1076e3:	85 c0                	test   %eax,%eax
  1076e5:	0f 84 e5 00 00 00    	je     1077d0 <msg_send+0x140>
  1076eb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1076f2:	00 00 00 
  1076f5:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  1076fc:	00 00 00 
  1076ff:	8b 93 e8 04 00 00    	mov    0x4e8(%ebx),%edx
  107705:	c7 40 24 02 00 00 00 	movl   $0x2,0x24(%eax)
  10770c:	85 d2                	test   %edx,%edx
  10770e:	75 a0                	jne    1076b0 <msg_send+0x20>
  107710:	89 83 e8 04 00 00    	mov    %eax,0x4e8(%ebx)
  107716:	eb b0                	jmp    1076c8 <msg_send+0x38>
  107718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10771f:	00 
  107720:	b8 40 00 00 00       	mov    $0x40,%eax
  107725:	39 45 14             	cmp    %eax,0x14(%ebp)
  107728:	0f 46 45 14          	cmovbe 0x14(%ebp),%eax
  10772c:	6b b3 dc 04 00 00 4c 	imul   $0x4c,0x4dc(%ebx),%esi
  107733:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107736:	8b 45 0c             	mov    0xc(%ebp),%eax
  107739:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
  10773c:	89 41 18             	mov    %eax,0x18(%ecx)
  10773f:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  107742:	e8 09 e0 ff ff       	call   105750 <get_current_pid>
  107747:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  10774a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10774d:	83 ec 04             	sub    $0x4,%esp
  107750:	89 41 1c             	mov    %eax,0x1c(%ecx)
  107753:	8d 44 33 24          	lea    0x24(%ebx,%esi,1),%eax
  107757:	89 51 20             	mov    %edx,0x20(%ecx)
  10775a:	52                   	push   %edx
  10775b:	ff 75 10             	push   0x10(%ebp)
  10775e:	50                   	push   %eax
  10775f:	e8 fc 8c ff ff       	call   100460 <memcpy>
  107764:	8b 83 dc 04 00 00    	mov    0x4dc(%ebx),%eax
  10776a:	83 83 e0 04 00 00 01 	addl   $0x1,0x4e0(%ebx)
  107771:	83 c4 10             	add    $0x10,%esp
  107774:	83 c0 01             	add    $0x1,%eax
  107777:	83 e0 0f             	and    $0xf,%eax
  10777a:	89 83 dc 04 00 00    	mov    %eax,0x4dc(%ebx)
  107780:	8b 83 f0 04 00 00    	mov    0x4f0(%ebx),%eax
  107786:	85 c0                	test   %eax,%eax
  107788:	74 3a                	je     1077c4 <msg_send+0x134>
  10778a:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  107790:	89 93 f0 04 00 00    	mov    %edx,0x4f0(%ebx)
  107796:	85 d2                	test   %edx,%edx
  107798:	74 46                	je     1077e0 <msg_send+0x150>
  10779a:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  1077a1:	00 00 00 
  1077a4:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1077ab:	00 00 00 
  1077ae:	83 ec 0c             	sub    $0xc,%esp
  1077b1:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  1077b8:	00 00 00 
  1077bb:	50                   	push   %eax
  1077bc:	e8 bf e0 ff ff       	call   105880 <thread_unblock>
  1077c1:	83 c4 10             	add    $0x10,%esp
  1077c4:	fb                   	sti
  1077c5:	31 c0                	xor    %eax,%eax
  1077c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1077ca:	5b                   	pop    %ebx
  1077cb:	5e                   	pop    %esi
  1077cc:	5d                   	pop    %ebp
  1077cd:	c3                   	ret
  1077ce:	66 90                	xchg   %ax,%ax
  1077d0:	fb                   	sti
  1077d1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1077d4:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  1077d9:	5b                   	pop    %ebx
  1077da:	5e                   	pop    %esi
  1077db:	5d                   	pop    %ebp
  1077dc:	c3                   	ret
  1077dd:	8d 76 00             	lea    0x0(%esi),%esi
  1077e0:	c7 83 f4 04 00 00 00 	movl   $0x0,0x4f4(%ebx)
  1077e7:	00 00 00 
  1077ea:	eb b8                	jmp    1077a4 <msg_send+0x114>
  1077ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1077f1:	eb d4                	jmp    1077c7 <msg_send+0x137>
  1077f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1077f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1077ff:	00 

00107800 <msg_recv>:
  107800:	55                   	push   %ebp
  107801:	89 e5                	mov    %esp,%ebp
  107803:	53                   	push   %ebx
  107804:	83 ec 14             	sub    $0x14,%esp
  107807:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10780a:	85 db                	test   %ebx,%ebx
  10780c:	75 2e                	jne    10783c <msg_recv+0x3c>
  10780e:	e9 84 01 00 00       	jmp    107997 <msg_recv+0x197>
  107813:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107818:	8b 93 f4 04 00 00    	mov    0x4f4(%ebx),%edx
  10781e:	89 82 80 00 00 00    	mov    %eax,0x80(%edx)
  107824:	8b 93 f4 04 00 00    	mov    0x4f4(%ebx),%edx
  10782a:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  107830:	89 83 f4 04 00 00    	mov    %eax,0x4f4(%ebx)
  107836:	fb                   	sti
  107837:	e8 34 db ff ff       	call   105370 <schedule>
  10783c:	fa                   	cli
  10783d:	8b 83 e0 04 00 00    	mov    0x4e0(%ebx),%eax
  107843:	85 c0                	test   %eax,%eax
  107845:	75 41                	jne    107888 <msg_recv+0x88>
  107847:	e8 e4 de ff ff       	call   105730 <get_current_thread>
  10784c:	85 c0                	test   %eax,%eax
  10784e:	0f 84 cc 00 00 00    	je     107920 <msg_recv+0x120>
  107854:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  10785b:	00 00 00 
  10785e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107865:	00 00 00 
  107868:	8b 93 f0 04 00 00    	mov    0x4f0(%ebx),%edx
  10786e:	c7 40 24 02 00 00 00 	movl   $0x2,0x24(%eax)
  107875:	85 d2                	test   %edx,%edx
  107877:	75 9f                	jne    107818 <msg_recv+0x18>
  107879:	89 83 f0 04 00 00    	mov    %eax,0x4f0(%ebx)
  10787f:	eb af                	jmp    107830 <msg_recv+0x30>
  107881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107888:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10788b:	8b 83 d8 04 00 00    	mov    0x4d8(%ebx),%eax
  107891:	85 c9                	test   %ecx,%ecx
  107893:	74 0c                	je     1078a1 <msg_recv+0xa1>
  107895:	6b d0 4c             	imul   $0x4c,%eax,%edx
  107898:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10789b:	8b 54 13 18          	mov    0x18(%ebx,%edx,1),%edx
  10789f:	89 11                	mov    %edx,(%ecx)
  1078a1:	8b 55 10             	mov    0x10(%ebp),%edx
  1078a4:	85 d2                	test   %edx,%edx
  1078a6:	0f 84 84 00 00 00    	je     107930 <msg_recv+0x130>
  1078ac:	8b 4d 14             	mov    0x14(%ebp),%ecx
  1078af:	85 c9                	test   %ecx,%ecx
  1078b1:	0f 85 99 00 00 00    	jne    107950 <msg_recv+0x150>
  1078b7:	8b 83 d8 04 00 00    	mov    0x4d8(%ebx),%eax
  1078bd:	83 ab e0 04 00 00 01 	subl   $0x1,0x4e0(%ebx)
  1078c4:	83 c0 01             	add    $0x1,%eax
  1078c7:	83 e0 0f             	and    $0xf,%eax
  1078ca:	89 83 d8 04 00 00    	mov    %eax,0x4d8(%ebx)
  1078d0:	8b 83 e8 04 00 00    	mov    0x4e8(%ebx),%eax
  1078d6:	85 c0                	test   %eax,%eax
  1078d8:	74 3e                	je     107918 <msg_recv+0x118>
  1078da:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  1078e0:	89 93 e8 04 00 00    	mov    %edx,0x4e8(%ebx)
  1078e6:	85 d2                	test   %edx,%edx
  1078e8:	0f 84 9a 00 00 00    	je     107988 <msg_recv+0x188>
  1078ee:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  1078f5:	00 00 00 
  1078f8:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  1078ff:	00 00 00 
  107902:	83 ec 0c             	sub    $0xc,%esp
  107905:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  10790c:	00 00 00 
  10790f:	50                   	push   %eax
  107910:	e8 6b df ff ff       	call   105880 <thread_unblock>
  107915:	83 c4 10             	add    $0x10,%esp
  107918:	fb                   	sti
  107919:	31 c0                	xor    %eax,%eax
  10791b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10791e:	c9                   	leave
  10791f:	c3                   	ret
  107920:	fb                   	sti
  107921:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  107926:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  107929:	c9                   	leave
  10792a:	c3                   	ret
  10792b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107930:	8b 55 14             	mov    0x14(%ebp),%edx
  107933:	85 d2                	test   %edx,%edx
  107935:	0f 84 7c ff ff ff    	je     1078b7 <msg_recv+0xb7>
  10793b:	6b c0 4c             	imul   $0x4c,%eax,%eax
  10793e:	8b 4d 14             	mov    0x14(%ebp),%ecx
  107941:	8b 44 03 20          	mov    0x20(%ebx,%eax,1),%eax
  107945:	89 01                	mov    %eax,(%ecx)
  107947:	e9 6b ff ff ff       	jmp    1078b7 <msg_recv+0xb7>
  10794c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107950:	6b c0 4c             	imul   $0x4c,%eax,%eax
  107953:	8b 4d 14             	mov    0x14(%ebp),%ecx
  107956:	8b 11                	mov    (%ecx),%edx
  107958:	8b 4c 03 20          	mov    0x20(%ebx,%eax,1),%ecx
  10795c:	8d 44 03 24          	lea    0x24(%ebx,%eax,1),%eax
  107960:	39 ca                	cmp    %ecx,%edx
  107962:	0f 47 d1             	cmova  %ecx,%edx
  107965:	83 ec 04             	sub    $0x4,%esp
  107968:	52                   	push   %edx
  107969:	50                   	push   %eax
  10796a:	ff 75 10             	push   0x10(%ebp)
  10796d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  107970:	e8 eb 8a ff ff       	call   100460 <memcpy>
  107975:	8b 45 14             	mov    0x14(%ebp),%eax
  107978:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10797b:	83 c4 10             	add    $0x10,%esp
  10797e:	89 10                	mov    %edx,(%eax)
  107980:	e9 32 ff ff ff       	jmp    1078b7 <msg_recv+0xb7>
  107985:	8d 76 00             	lea    0x0(%esi),%esi
  107988:	c7 83 ec 04 00 00 00 	movl   $0x0,0x4ec(%ebx)
  10798f:	00 00 00 
  107992:	e9 61 ff ff ff       	jmp    1078f8 <msg_recv+0xf8>
  107997:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10799c:	e9 7a ff ff ff       	jmp    10791b <msg_recv+0x11b>
  1079a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1079a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1079af:	00 

001079b0 <msg_try_send>:
  1079b0:	55                   	push   %ebp
  1079b1:	89 e5                	mov    %esp,%ebp
  1079b3:	57                   	push   %edi
  1079b4:	56                   	push   %esi
  1079b5:	53                   	push   %ebx
  1079b6:	83 ec 1c             	sub    $0x1c,%esp
  1079b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1079bc:	8b 45 14             	mov    0x14(%ebp),%eax
  1079bf:	85 db                	test   %ebx,%ebx
  1079c1:	0f 84 e9 00 00 00    	je     107ab0 <msg_try_send+0x100>
  1079c7:	8b 55 10             	mov    0x10(%ebp),%edx
  1079ca:	85 d2                	test   %edx,%edx
  1079cc:	0f 84 de 00 00 00    	je     107ab0 <msg_try_send+0x100>
  1079d2:	fa                   	cli
  1079d3:	83 bb e0 04 00 00 0f 	cmpl   $0xf,0x4e0(%ebx)
  1079da:	0f 87 c0 00 00 00    	ja     107aa0 <msg_try_send+0xf0>
  1079e0:	83 f8 40             	cmp    $0x40,%eax
  1079e3:	be 40 00 00 00       	mov    $0x40,%esi
  1079e8:	0f 46 f0             	cmovbe %eax,%esi
  1079eb:	6b 93 dc 04 00 00 4c 	imul   $0x4c,0x4dc(%ebx),%edx
  1079f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1079f5:	8d 3c 13             	lea    (%ebx,%edx,1),%edi
  1079f8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1079fb:	89 47 18             	mov    %eax,0x18(%edi)
  1079fe:	e8 4d dd ff ff       	call   105750 <get_current_pid>
  107a03:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  107a06:	83 ec 04             	sub    $0x4,%esp
  107a09:	89 77 20             	mov    %esi,0x20(%edi)
  107a0c:	89 47 1c             	mov    %eax,0x1c(%edi)
  107a0f:	8d 44 13 24          	lea    0x24(%ebx,%edx,1),%eax
  107a13:	56                   	push   %esi
  107a14:	ff 75 10             	push   0x10(%ebp)
  107a17:	50                   	push   %eax
  107a18:	e8 43 8a ff ff       	call   100460 <memcpy>
  107a1d:	8b 83 dc 04 00 00    	mov    0x4dc(%ebx),%eax
  107a23:	83 83 e0 04 00 00 01 	addl   $0x1,0x4e0(%ebx)
  107a2a:	83 c4 10             	add    $0x10,%esp
  107a2d:	83 c0 01             	add    $0x1,%eax
  107a30:	83 e0 0f             	and    $0xf,%eax
  107a33:	89 83 dc 04 00 00    	mov    %eax,0x4dc(%ebx)
  107a39:	8b 83 f0 04 00 00    	mov    0x4f0(%ebx),%eax
  107a3f:	85 c0                	test   %eax,%eax
  107a41:	74 3a                	je     107a7d <msg_try_send+0xcd>
  107a43:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  107a49:	89 93 f0 04 00 00    	mov    %edx,0x4f0(%ebx)
  107a4f:	85 d2                	test   %edx,%edx
  107a51:	74 3d                	je     107a90 <msg_try_send+0xe0>
  107a53:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  107a5a:	00 00 00 
  107a5d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  107a64:	00 00 00 
  107a67:	83 ec 0c             	sub    $0xc,%esp
  107a6a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107a71:	00 00 00 
  107a74:	50                   	push   %eax
  107a75:	e8 06 de ff ff       	call   105880 <thread_unblock>
  107a7a:	83 c4 10             	add    $0x10,%esp
  107a7d:	fb                   	sti
  107a7e:	31 c0                	xor    %eax,%eax
  107a80:	8d 65 f4             	lea    -0xc(%ebp),%esp
  107a83:	5b                   	pop    %ebx
  107a84:	5e                   	pop    %esi
  107a85:	5f                   	pop    %edi
  107a86:	5d                   	pop    %ebp
  107a87:	c3                   	ret
  107a88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107a8f:	00 
  107a90:	c7 83 f4 04 00 00 00 	movl   $0x0,0x4f4(%ebx)
  107a97:	00 00 00 
  107a9a:	eb c1                	jmp    107a5d <msg_try_send+0xad>
  107a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107aa0:	fb                   	sti
  107aa1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  107aa6:	eb d8                	jmp    107a80 <msg_try_send+0xd0>
  107aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107aaf:	00 
  107ab0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  107ab5:	eb c9                	jmp    107a80 <msg_try_send+0xd0>
  107ab7:	90                   	nop
  107ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107abf:	00 

00107ac0 <msg_try_recv>:
  107ac0:	55                   	push   %ebp
  107ac1:	89 e5                	mov    %esp,%ebp
  107ac3:	56                   	push   %esi
  107ac4:	53                   	push   %ebx
  107ac5:	8b 55 08             	mov    0x8(%ebp),%edx
  107ac8:	8b 4d 14             	mov    0x14(%ebp),%ecx
  107acb:	85 d2                	test   %edx,%edx
  107acd:	0f 84 15 01 00 00    	je     107be8 <msg_try_recv+0x128>
  107ad3:	fa                   	cli
  107ad4:	8b 82 e0 04 00 00    	mov    0x4e0(%edx),%eax
  107ada:	85 c0                	test   %eax,%eax
  107adc:	0f 84 fe 00 00 00    	je     107be0 <msg_try_recv+0x120>
  107ae2:	8b 75 0c             	mov    0xc(%ebp),%esi
  107ae5:	8b 82 d8 04 00 00    	mov    0x4d8(%edx),%eax
  107aeb:	85 f6                	test   %esi,%esi
  107aed:	74 0c                	je     107afb <msg_try_recv+0x3b>
  107aef:	6b d8 4c             	imul   $0x4c,%eax,%ebx
  107af2:	8b 75 0c             	mov    0xc(%ebp),%esi
  107af5:	8b 5c 1a 18          	mov    0x18(%edx,%ebx,1),%ebx
  107af9:	89 1e                	mov    %ebx,(%esi)
  107afb:	8b 5d 10             	mov    0x10(%ebp),%ebx
  107afe:	85 db                	test   %ebx,%ebx
  107b00:	0f 84 aa 00 00 00    	je     107bb0 <msg_try_recv+0xf0>
  107b06:	85 c9                	test   %ecx,%ecx
  107b08:	75 6e                	jne    107b78 <msg_try_recv+0xb8>
  107b0a:	8b 82 d8 04 00 00    	mov    0x4d8(%edx),%eax
  107b10:	83 aa e0 04 00 00 01 	subl   $0x1,0x4e0(%edx)
  107b17:	83 c0 01             	add    $0x1,%eax
  107b1a:	83 e0 0f             	and    $0xf,%eax
  107b1d:	89 82 d8 04 00 00    	mov    %eax,0x4d8(%edx)
  107b23:	8b 82 e8 04 00 00    	mov    0x4e8(%edx),%eax
  107b29:	85 c0                	test   %eax,%eax
  107b2b:	74 3e                	je     107b6b <msg_try_recv+0xab>
  107b2d:	8b 88 80 00 00 00    	mov    0x80(%eax),%ecx
  107b33:	89 8a e8 04 00 00    	mov    %ecx,0x4e8(%edx)
  107b39:	85 c9                	test   %ecx,%ecx
  107b3b:	0f 84 8f 00 00 00    	je     107bd0 <msg_try_recv+0x110>
  107b41:	c7 81 84 00 00 00 00 	movl   $0x0,0x84(%ecx)
  107b48:	00 00 00 
  107b4b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  107b52:	00 00 00 
  107b55:	83 ec 0c             	sub    $0xc,%esp
  107b58:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107b5f:	00 00 00 
  107b62:	50                   	push   %eax
  107b63:	e8 18 dd ff ff       	call   105880 <thread_unblock>
  107b68:	83 c4 10             	add    $0x10,%esp
  107b6b:	fb                   	sti
  107b6c:	31 c0                	xor    %eax,%eax
  107b6e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  107b71:	5b                   	pop    %ebx
  107b72:	5e                   	pop    %esi
  107b73:	5d                   	pop    %ebp
  107b74:	c3                   	ret
  107b75:	8d 76 00             	lea    0x0(%esi),%esi
  107b78:	6b c0 4c             	imul   $0x4c,%eax,%eax
  107b7b:	89 4d 14             	mov    %ecx,0x14(%ebp)
  107b7e:	8b 5c 02 20          	mov    0x20(%edx,%eax,1),%ebx
  107b82:	39 19                	cmp    %ebx,(%ecx)
  107b84:	8d 44 02 24          	lea    0x24(%edx,%eax,1),%eax
  107b88:	0f 46 19             	cmovbe (%ecx),%ebx
  107b8b:	83 ec 04             	sub    $0x4,%esp
  107b8e:	53                   	push   %ebx
  107b8f:	89 55 08             	mov    %edx,0x8(%ebp)
  107b92:	50                   	push   %eax
  107b93:	ff 75 10             	push   0x10(%ebp)
  107b96:	e8 c5 88 ff ff       	call   100460 <memcpy>
  107b9b:	8b 4d 14             	mov    0x14(%ebp),%ecx
  107b9e:	8b 55 08             	mov    0x8(%ebp),%edx
  107ba1:	83 c4 10             	add    $0x10,%esp
  107ba4:	89 19                	mov    %ebx,(%ecx)
  107ba6:	e9 5f ff ff ff       	jmp    107b0a <msg_try_recv+0x4a>
  107bab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107bb0:	85 c9                	test   %ecx,%ecx
  107bb2:	0f 84 52 ff ff ff    	je     107b0a <msg_try_recv+0x4a>
  107bb8:	6b c0 4c             	imul   $0x4c,%eax,%eax
  107bbb:	8b 44 02 20          	mov    0x20(%edx,%eax,1),%eax
  107bbf:	89 01                	mov    %eax,(%ecx)
  107bc1:	e9 44 ff ff ff       	jmp    107b0a <msg_try_recv+0x4a>
  107bc6:	66 90                	xchg   %ax,%ax
  107bc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107bcf:	00 
  107bd0:	c7 82 ec 04 00 00 00 	movl   $0x0,0x4ec(%edx)
  107bd7:	00 00 00 
  107bda:	e9 6c ff ff ff       	jmp    107b4b <msg_try_recv+0x8b>
  107bdf:	90                   	nop
  107be0:	fb                   	sti
  107be1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  107be6:	eb 86                	jmp    107b6e <msg_try_recv+0xae>
  107be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  107bed:	e9 7c ff ff ff       	jmp    107b6e <msg_try_recv+0xae>
  107bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107bf8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107bff:	00 

00107c00 <msg_queue_destroy>:
  107c00:	55                   	push   %ebp
  107c01:	89 e5                	mov    %esp,%ebp
  107c03:	53                   	push   %ebx
  107c04:	83 ec 04             	sub    $0x4,%esp
  107c07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  107c0a:	85 db                	test   %ebx,%ebx
  107c0c:	74 76                	je     107c84 <msg_queue_destroy+0x84>
  107c0e:	fa                   	cli
  107c0f:	8b 83 e8 04 00 00    	mov    0x4e8(%ebx),%eax
  107c15:	85 c0                	test   %eax,%eax
  107c17:	75 3b                	jne    107c54 <msg_queue_destroy+0x54>
  107c19:	eb 75                	jmp    107c90 <msg_queue_destroy+0x90>
  107c1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107c20:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  107c27:	00 00 00 
  107c2a:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  107c31:	00 00 00 
  107c34:	83 ec 0c             	sub    $0xc,%esp
  107c37:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107c3e:	00 00 00 
  107c41:	50                   	push   %eax
  107c42:	e8 39 dc ff ff       	call   105880 <thread_unblock>
  107c47:	8b 83 e8 04 00 00    	mov    0x4e8(%ebx),%eax
  107c4d:	83 c4 10             	add    $0x10,%esp
  107c50:	85 c0                	test   %eax,%eax
  107c52:	74 3c                	je     107c90 <msg_queue_destroy+0x90>
  107c54:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  107c5a:	89 93 e8 04 00 00    	mov    %edx,0x4e8(%ebx)
  107c60:	85 d2                	test   %edx,%edx
  107c62:	75 bc                	jne    107c20 <msg_queue_destroy+0x20>
  107c64:	c7 83 ec 04 00 00 00 	movl   $0x0,0x4ec(%ebx)
  107c6b:	00 00 00 
  107c6e:	eb ba                	jmp    107c2a <msg_queue_destroy+0x2a>
  107c70:	83 ec 04             	sub    $0x4,%esp
  107c73:	68 f8 04 00 00       	push   $0x4f8
  107c78:	6a 00                	push   $0x0
  107c7a:	53                   	push   %ebx
  107c7b:	e8 20 88 ff ff       	call   1004a0 <memset>
  107c80:	fb                   	sti
  107c81:	83 c4 10             	add    $0x10,%esp
  107c84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  107c87:	c9                   	leave
  107c88:	c3                   	ret
  107c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107c90:	8b 83 f0 04 00 00    	mov    0x4f0(%ebx),%eax
  107c96:	85 c0                	test   %eax,%eax
  107c98:	75 3a                	jne    107cd4 <msg_queue_destroy+0xd4>
  107c9a:	eb d4                	jmp    107c70 <msg_queue_destroy+0x70>
  107c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107ca0:	c7 82 84 00 00 00 00 	movl   $0x0,0x84(%edx)
  107ca7:	00 00 00 
  107caa:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  107cb1:	00 00 00 
  107cb4:	83 ec 0c             	sub    $0xc,%esp
  107cb7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  107cbe:	00 00 00 
  107cc1:	50                   	push   %eax
  107cc2:	e8 b9 db ff ff       	call   105880 <thread_unblock>
  107cc7:	8b 83 f0 04 00 00    	mov    0x4f0(%ebx),%eax
  107ccd:	83 c4 10             	add    $0x10,%esp
  107cd0:	85 c0                	test   %eax,%eax
  107cd2:	74 9c                	je     107c70 <msg_queue_destroy+0x70>
  107cd4:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
  107cda:	89 93 f0 04 00 00    	mov    %edx,0x4f0(%ebx)
  107ce0:	85 d2                	test   %edx,%edx
  107ce2:	75 bc                	jne    107ca0 <msg_queue_destroy+0xa0>
  107ce4:	c7 83 f4 04 00 00 00 	movl   $0x0,0x4f4(%ebx)
  107ceb:	00 00 00 
  107cee:	eb ba                	jmp    107caa <msg_queue_destroy+0xaa>

00107cf0 <sem_create>:
  107cf0:	55                   	push   %ebp
  107cf1:	b8 24 98 14 01       	mov    $0x1149824,%eax
  107cf6:	89 e5                	mov    %esp,%ebp
  107cf8:	57                   	push   %edi
  107cf9:	56                   	push   %esi
  107cfa:	53                   	push   %ebx
  107cfb:	31 db                	xor    %ebx,%ebx
  107cfd:	83 ec 0c             	sub    $0xc,%esp
  107d00:	eb 19                	jmp    107d1b <sem_create+0x2b>
  107d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107d08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107d0f:	00 
  107d10:	83 c3 01             	add    $0x1,%ebx
  107d13:	83 c0 28             	add    $0x28,%eax
  107d16:	83 fb 40             	cmp    $0x40,%ebx
  107d19:	74 7d                	je     107d98 <sem_create+0xa8>
  107d1b:	80 38 00             	cmpb   $0x0,(%eax)
  107d1e:	75 f0                	jne    107d10 <sem_create+0x20>
  107d20:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
  107d27:	83 ec 04             	sub    $0x4,%esp
  107d2a:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
  107d2d:	6a 28                	push   $0x28
  107d2f:	8d 3c c5 00 98 14 01 	lea    0x1149800(,%eax,8),%edi
  107d36:	6a 00                	push   $0x0
  107d38:	57                   	push   %edi
  107d39:	e8 62 87 ff ff       	call   1004a0 <memset>
  107d3e:	8b 45 08             	mov    0x8(%ebp),%eax
  107d41:	83 c4 10             	add    $0x10,%esp
  107d44:	85 c0                	test   %eax,%eax
  107d46:	74 15                	je     107d5d <sem_create+0x6d>
  107d48:	83 ec 04             	sub    $0x4,%esp
  107d4b:	6a 17                	push   $0x17
  107d4d:	ff 75 08             	push   0x8(%ebp)
  107d50:	57                   	push   %edi
  107d51:	e8 aa 88 ff ff       	call   100600 <strncpy>
  107d56:	c6 47 17 00          	movb   $0x0,0x17(%edi)
  107d5a:	83 c4 10             	add    $0x10,%esp
  107d5d:	8b 55 0c             	mov    0xc(%ebp),%edx
  107d60:	01 de                	add    %ebx,%esi
  107d62:	89 f8                	mov    %edi,%eax
  107d64:	c7 04 f5 1c 98 14 01 	movl   $0x0,0x114981c(,%esi,8)
  107d6b:	00 00 00 00 
  107d6f:	89 14 f5 18 98 14 01 	mov    %edx,0x1149818(,%esi,8)
  107d76:	c7 04 f5 20 98 14 01 	movl   $0x0,0x1149820(,%esi,8)
  107d7d:	00 00 00 00 
  107d81:	c6 04 f5 24 98 14 01 	movb   $0x1,0x1149824(,%esi,8)
  107d88:	01 
  107d89:	8d 65 f4             	lea    -0xc(%ebp),%esp
  107d8c:	5b                   	pop    %ebx
  107d8d:	5e                   	pop    %esi
  107d8e:	5f                   	pop    %edi
  107d8f:	5d                   	pop    %ebp
  107d90:	c3                   	ret
  107d91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107d98:	8d 65 f4             	lea    -0xc(%ebp),%esp
  107d9b:	31 ff                	xor    %edi,%edi
  107d9d:	5b                   	pop    %ebx
  107d9e:	89 f8                	mov    %edi,%eax
  107da0:	5e                   	pop    %esi
  107da1:	5f                   	pop    %edi
  107da2:	5d                   	pop    %ebp
  107da3:	c3                   	ret
  107da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107daf:	00 

00107db0 <mutex_create>:
  107db0:	55                   	push   %ebp
  107db1:	b8 28 8d 14 01       	mov    $0x1148d28,%eax
  107db6:	89 e5                	mov    %esp,%ebp
  107db8:	56                   	push   %esi
  107db9:	53                   	push   %ebx
  107dba:	31 db                	xor    %ebx,%ebx
  107dbc:	eb 0d                	jmp    107dcb <mutex_create+0x1b>
  107dbe:	66 90                	xchg   %ax,%ax
  107dc0:	83 c3 01             	add    $0x1,%ebx
  107dc3:	83 c0 2c             	add    $0x2c,%eax
  107dc6:	83 fb 40             	cmp    $0x40,%ebx
  107dc9:	74 75                	je     107e40 <mutex_create+0x90>
  107dcb:	80 38 00             	cmpb   $0x0,(%eax)
  107dce:	75 f0                	jne    107dc0 <mutex_create+0x10>
  107dd0:	6b f3 2c             	imul   $0x2c,%ebx,%esi
  107dd3:	83 ec 04             	sub    $0x4,%esp
  107dd6:	6a 2c                	push   $0x2c
  107dd8:	6a 00                	push   $0x0
  107dda:	81 c6 00 8d 14 01    	add    $0x1148d00,%esi
  107de0:	56                   	push   %esi
  107de1:	e8 ba 86 ff ff       	call   1004a0 <memset>
  107de6:	8b 45 08             	mov    0x8(%ebp),%eax
  107de9:	83 c4 10             	add    $0x10,%esp
  107dec:	85 c0                	test   %eax,%eax
  107dee:	74 15                	je     107e05 <mutex_create+0x55>
  107df0:	83 ec 04             	sub    $0x4,%esp
  107df3:	6a 17                	push   $0x17
  107df5:	ff 75 08             	push   0x8(%ebp)
  107df8:	56                   	push   %esi
  107df9:	e8 02 88 ff ff       	call   100600 <strncpy>
  107dfe:	c6 46 17 00          	movb   $0x0,0x17(%esi)
  107e02:	83 c4 10             	add    $0x10,%esp
  107e05:	6b db 2c             	imul   $0x2c,%ebx,%ebx
  107e08:	89 f0                	mov    %esi,%eax
  107e0a:	c6 83 18 8d 14 01 00 	movb   $0x0,0x1148d18(%ebx)
  107e11:	c7 83 1c 8d 14 01 00 	movl   $0x0,0x1148d1c(%ebx)
  107e18:	00 00 00 
  107e1b:	c7 83 20 8d 14 01 00 	movl   $0x0,0x1148d20(%ebx)
  107e22:	00 00 00 
  107e25:	c7 83 24 8d 14 01 00 	movl   $0x0,0x1148d24(%ebx)
  107e2c:	00 00 00 
  107e2f:	c6 83 28 8d 14 01 01 	movb   $0x1,0x1148d28(%ebx)
  107e36:	8d 65 f8             	lea    -0x8(%ebp),%esp
  107e39:	5b                   	pop    %ebx
  107e3a:	5e                   	pop    %esi
  107e3b:	5d                   	pop    %ebp
  107e3c:	c3                   	ret
  107e3d:	8d 76 00             	lea    0x0(%esi),%esi
  107e40:	8d 65 f8             	lea    -0x8(%ebp),%esp
  107e43:	31 f6                	xor    %esi,%esi
  107e45:	89 f0                	mov    %esi,%eax
  107e47:	5b                   	pop    %ebx
  107e48:	5e                   	pop    %esi
  107e49:	5d                   	pop    %ebp
  107e4a:	c3                   	ret
  107e4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107e50 <msg_queue_create>:
  107e50:	55                   	push   %ebp
  107e51:	b8 e4 f2 13 01       	mov    $0x113f2e4,%eax
  107e56:	89 e5                	mov    %esp,%ebp
  107e58:	56                   	push   %esi
  107e59:	53                   	push   %ebx
  107e5a:	31 db                	xor    %ebx,%ebx
  107e5c:	eb 13                	jmp    107e71 <msg_queue_create+0x21>
  107e5e:	66 90                	xchg   %ax,%ax
  107e60:	83 c3 01             	add    $0x1,%ebx
  107e63:	05 f8 04 00 00       	add    $0x4f8,%eax
  107e68:	83 fb 20             	cmp    $0x20,%ebx
  107e6b:	0f 84 9f 00 00 00    	je     107f10 <msg_queue_create+0xc0>
  107e71:	80 38 00             	cmpb   $0x0,(%eax)
  107e74:	75 ea                	jne    107e60 <msg_queue_create+0x10>
  107e76:	69 f3 f8 04 00 00    	imul   $0x4f8,%ebx,%esi
  107e7c:	83 ec 04             	sub    $0x4,%esp
  107e7f:	68 f8 04 00 00       	push   $0x4f8
  107e84:	6a 00                	push   $0x0
  107e86:	81 c6 00 ee 13 01    	add    $0x113ee00,%esi
  107e8c:	56                   	push   %esi
  107e8d:	e8 0e 86 ff ff       	call   1004a0 <memset>
  107e92:	8b 45 08             	mov    0x8(%ebp),%eax
  107e95:	83 c4 10             	add    $0x10,%esp
  107e98:	85 c0                	test   %eax,%eax
  107e9a:	74 15                	je     107eb1 <msg_queue_create+0x61>
  107e9c:	83 ec 04             	sub    $0x4,%esp
  107e9f:	6a 17                	push   $0x17
  107ea1:	ff 75 08             	push   0x8(%ebp)
  107ea4:	56                   	push   %esi
  107ea5:	e8 56 87 ff ff       	call   100600 <strncpy>
  107eaa:	c6 46 17 00          	movb   $0x0,0x17(%esi)
  107eae:	83 c4 10             	add    $0x10,%esp
  107eb1:	69 db f8 04 00 00    	imul   $0x4f8,%ebx,%ebx
  107eb7:	89 f0                	mov    %esi,%eax
  107eb9:	c7 83 d8 f2 13 01 00 	movl   $0x0,0x113f2d8(%ebx)
  107ec0:	00 00 00 
  107ec3:	c7 83 dc f2 13 01 00 	movl   $0x0,0x113f2dc(%ebx)
  107eca:	00 00 00 
  107ecd:	c7 83 e0 f2 13 01 00 	movl   $0x0,0x113f2e0(%ebx)
  107ed4:	00 00 00 
  107ed7:	c6 83 e4 f2 13 01 01 	movb   $0x1,0x113f2e4(%ebx)
  107ede:	c7 83 e8 f2 13 01 00 	movl   $0x0,0x113f2e8(%ebx)
  107ee5:	00 00 00 
  107ee8:	c7 83 ec f2 13 01 00 	movl   $0x0,0x113f2ec(%ebx)
  107eef:	00 00 00 
  107ef2:	c7 83 f0 f2 13 01 00 	movl   $0x0,0x113f2f0(%ebx)
  107ef9:	00 00 00 
  107efc:	c7 83 f4 f2 13 01 00 	movl   $0x0,0x113f2f4(%ebx)
  107f03:	00 00 00 
  107f06:	8d 65 f8             	lea    -0x8(%ebp),%esp
  107f09:	5b                   	pop    %ebx
  107f0a:	5e                   	pop    %esi
  107f0b:	5d                   	pop    %ebp
  107f0c:	c3                   	ret
  107f0d:	8d 76 00             	lea    0x0(%esi),%esi
  107f10:	8d 65 f8             	lea    -0x8(%ebp),%esp
  107f13:	31 f6                	xor    %esi,%esi
  107f15:	89 f0                	mov    %esi,%eax
  107f17:	5b                   	pop    %ebx
  107f18:	5e                   	pop    %esi
  107f19:	5d                   	pop    %ebp
  107f1a:	c3                   	ret
  107f1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107f20 <sync_init>:
  107f20:	80 3d e0 ed 13 01 00 	cmpb   $0x0,0x113ede0
  107f27:	74 07                	je     107f30 <sync_init+0x10>
  107f29:	c3                   	ret
  107f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107f30:	55                   	push   %ebp
  107f31:	89 e5                	mov    %esp,%ebp
  107f33:	83 ec 0c             	sub    $0xc,%esp
  107f36:	68 00 0a 00 00       	push   $0xa00
  107f3b:	6a 00                	push   $0x0
  107f3d:	68 00 98 14 01       	push   $0x1149800
  107f42:	e8 59 85 ff ff       	call   1004a0 <memset>
  107f47:	83 c4 0c             	add    $0xc,%esp
  107f4a:	68 00 0b 00 00       	push   $0xb00
  107f4f:	6a 00                	push   $0x0
  107f51:	68 00 8d 14 01       	push   $0x1148d00
  107f56:	e8 45 85 ff ff       	call   1004a0 <memset>
  107f5b:	83 c4 0c             	add    $0xc,%esp
  107f5e:	68 00 9f 00 00       	push   $0x9f00
  107f63:	6a 00                	push   $0x0
  107f65:	68 00 ee 13 01       	push   $0x113ee00
  107f6a:	e8 31 85 ff ff       	call   1004a0 <memset>
  107f6f:	c6 05 e0 ed 13 01 01 	movb   $0x1,0x113ede0
  107f76:	83 c4 10             	add    $0x10,%esp
  107f79:	c9                   	leave
  107f7a:	c3                   	ret
  107f7b:	66 90                	xchg   %ax,%ax
  107f7d:	66 90                	xchg   %ax,%ax
  107f7f:	90                   	nop

00107f80 <hex_to_u32>:
  107f80:	89 c1                	mov    %eax,%ecx
  107f82:	0f be 00             	movsbl (%eax),%eax
  107f85:	84 c0                	test   %al,%al
  107f87:	74 5c                	je     107fe5 <hex_to_u32+0x65>
  107f89:	55                   	push   %ebp
  107f8a:	31 d2                	xor    %edx,%edx
  107f8c:	89 e5                	mov    %esp,%ebp
  107f8e:	53                   	push   %ebx
  107f8f:	eb 29                	jmp    107fba <hex_to_u32+0x3a>
  107f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107f98:	8d 58 9f             	lea    -0x61(%eax),%ebx
  107f9b:	80 fb 05             	cmp    $0x5,%bl
  107f9e:	76 40                	jbe    107fe0 <hex_to_u32+0x60>
  107fa0:	8d 58 bf             	lea    -0x41(%eax),%ebx
  107fa3:	80 fb 05             	cmp    $0x5,%bl
  107fa6:	77 2c                	ja     107fd4 <hex_to_u32+0x54>
  107fa8:	83 e8 37             	sub    $0x37,%eax
  107fab:	c1 e2 04             	shl    $0x4,%edx
  107fae:	83 c1 01             	add    $0x1,%ecx
  107fb1:	09 c2                	or     %eax,%edx
  107fb3:	0f be 01             	movsbl (%ecx),%eax
  107fb6:	84 c0                	test   %al,%al
  107fb8:	74 1a                	je     107fd4 <hex_to_u32+0x54>
  107fba:	8d 58 d0             	lea    -0x30(%eax),%ebx
  107fbd:	80 fb 09             	cmp    $0x9,%bl
  107fc0:	77 d6                	ja     107f98 <hex_to_u32+0x18>
  107fc2:	83 e8 30             	sub    $0x30,%eax
  107fc5:	c1 e2 04             	shl    $0x4,%edx
  107fc8:	83 c1 01             	add    $0x1,%ecx
  107fcb:	09 c2                	or     %eax,%edx
  107fcd:	0f be 01             	movsbl (%ecx),%eax
  107fd0:	84 c0                	test   %al,%al
  107fd2:	75 e6                	jne    107fba <hex_to_u32+0x3a>
  107fd4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  107fd7:	89 d0                	mov    %edx,%eax
  107fd9:	c9                   	leave
  107fda:	c3                   	ret
  107fdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  107fe0:	83 e8 57             	sub    $0x57,%eax
  107fe3:	eb c6                	jmp    107fab <hex_to_u32+0x2b>
  107fe5:	31 c0                	xor    %eax,%eax
  107fe7:	c3                   	ret
  107fe8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107fef:	00 

00107ff0 <debugger_int3_handler>:
  107ff0:	55                   	push   %ebp
  107ff1:	89 e5                	mov    %esp,%ebp
  107ff3:	56                   	push   %esi
  107ff4:	53                   	push   %ebx
  107ff5:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  107ff8:	83 ec 1c             	sub    $0x1c,%esp
  107ffb:	8b 75 08             	mov    0x8(%ebp),%esi
  107ffe:	68 28 c5 10 00       	push   $0x10c528
  108003:	e8 08 8c ff ff       	call   100c10 <terminal_writestring>
  108008:	8b 46 2c             	mov    0x2c(%esi),%eax
  10800b:	83 c4 0c             	add    $0xc,%esp
  10800e:	6a 10                	push   $0x10
  108010:	83 e8 01             	sub    $0x1,%eax
  108013:	53                   	push   %ebx
  108014:	50                   	push   %eax
  108015:	e8 16 89 ff ff       	call   100930 <itoa>
  10801a:	89 1c 24             	mov    %ebx,(%esp)
  10801d:	e8 ee 8b ff ff       	call   100c10 <terminal_writestring>
  108022:	c7 04 24 90 ba 10 00 	movl   $0x10ba90,(%esp)
  108029:	e8 e2 8b ff ff       	call   100c10 <terminal_writestring>
  10802e:	b8 00 a2 14 01       	mov    $0x114a200,%eax
  108033:	83 c4 10             	add    $0x10,%esp
  108036:	31 d2                	xor    %edx,%edx
  108038:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10803f:	00 
  108040:	80 38 00             	cmpb   $0x0,(%eax)
  108043:	74 0d                	je     108052 <debugger_int3_handler+0x62>
  108045:	8b 4e 2c             	mov    0x2c(%esi),%ecx
  108048:	8b 58 04             	mov    0x4(%eax),%ebx
  10804b:	83 e9 01             	sub    $0x1,%ecx
  10804e:	39 cb                	cmp    %ecx,%ebx
  108050:	74 16                	je     108068 <debugger_int3_handler+0x78>
  108052:	83 c2 01             	add    $0x1,%edx
  108055:	83 c0 0c             	add    $0xc,%eax
  108058:	83 fa 10             	cmp    $0x10,%edx
  10805b:	75 e3                	jne    108040 <debugger_int3_handler+0x50>
  10805d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  108060:	5b                   	pop    %ebx
  108061:	5e                   	pop    %esi
  108062:	5d                   	pop    %ebp
  108063:	c3                   	ret
  108064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  108068:	8d 04 52             	lea    (%edx,%edx,2),%eax
  10806b:	0f b6 04 85 08 a2 14 	movzbl 0x114a208(,%eax,4),%eax
  108072:	01 
  108073:	88 03                	mov    %al,(%ebx)
  108075:	89 5e 2c             	mov    %ebx,0x2c(%esi)
  108078:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10807b:	5b                   	pop    %ebx
  10807c:	5e                   	pop    %esi
  10807d:	5d                   	pop    %ebp
  10807e:	c3                   	ret
  10807f:	90                   	nop

00108080 <debugger_int1_handler>:
  108080:	55                   	push   %ebp
  108081:	89 e5                	mov    %esp,%ebp
  108083:	53                   	push   %ebx
  108084:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  108087:	83 ec 20             	sub    $0x20,%esp
  10808a:	68 44 c5 10 00       	push   $0x10c544
  10808f:	e8 7c 8b ff ff       	call   100c10 <terminal_writestring>
  108094:	8b 45 08             	mov    0x8(%ebp),%eax
  108097:	83 c4 0c             	add    $0xc,%esp
  10809a:	6a 10                	push   $0x10
  10809c:	53                   	push   %ebx
  10809d:	ff 70 2c             	push   0x2c(%eax)
  1080a0:	e8 8b 88 ff ff       	call   100930 <itoa>
  1080a5:	89 1c 24             	mov    %ebx,(%esp)
  1080a8:	e8 63 8b ff ff       	call   100c10 <terminal_writestring>
  1080ad:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1080b4:	e8 57 8b ff ff       	call   100c10 <terminal_writestring>
  1080b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1080bc:	83 c4 10             	add    $0x10,%esp
  1080bf:	c9                   	leave
  1080c0:	c3                   	ret
  1080c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1080c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1080cf:	00 

001080d0 <debugger_readline>:
  1080d0:	55                   	push   %ebp
  1080d1:	89 e5                	mov    %esp,%ebp
  1080d3:	57                   	push   %edi
  1080d4:	56                   	push   %esi
  1080d5:	31 f6                	xor    %esi,%esi
  1080d7:	53                   	push   %ebx
  1080d8:	8d 5d e7             	lea    -0x19(%ebp),%ebx
  1080db:	83 ec 1c             	sub    $0x1c,%esp
  1080de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1080e1:	8d 78 ff             	lea    -0x1(%eax),%edi
  1080e4:	eb 0d                	jmp    1080f3 <debugger_readline+0x23>
  1080e6:	66 90                	xchg   %ax,%ax
  1080e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1080ef:	00 
  1080f0:	fb                   	sti
  1080f1:	f4                   	hlt
  1080f2:	fa                   	cli
  1080f3:	83 ec 0c             	sub    $0xc,%esp
  1080f6:	53                   	push   %ebx
  1080f7:	e8 d4 99 ff ff       	call   101ad0 <keyboard_buffer_read>
  1080fc:	83 c4 10             	add    $0x10,%esp
  1080ff:	85 c0                	test   %eax,%eax
  108101:	74 ed                	je     1080f0 <debugger_readline+0x20>
  108103:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  108107:	3c 0a                	cmp    $0xa,%al
  108109:	74 45                	je     108150 <debugger_readline+0x80>
  10810b:	3c 0d                	cmp    $0xd,%al
  10810d:	74 41                	je     108150 <debugger_readline+0x80>
  10810f:	3c 08                	cmp    $0x8,%al
  108111:	74 25                	je     108138 <debugger_readline+0x68>
  108113:	3c 1f                	cmp    $0x1f,%al
  108115:	7e dc                	jle    1080f3 <debugger_readline+0x23>
  108117:	39 f7                	cmp    %esi,%edi
  108119:	7e d8                	jle    1080f3 <debugger_readline+0x23>
  10811b:	8b 55 08             	mov    0x8(%ebp),%edx
  10811e:	83 ec 0c             	sub    $0xc,%esp
  108121:	88 04 32             	mov    %al,(%edx,%esi,1)
  108124:	83 c6 01             	add    $0x1,%esi
  108127:	50                   	push   %eax
  108128:	e8 83 89 ff ff       	call   100ab0 <terminal_putchar>
  10812d:	83 c4 10             	add    $0x10,%esp
  108130:	eb c1                	jmp    1080f3 <debugger_readline+0x23>
  108132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108138:	85 f6                	test   %esi,%esi
  10813a:	7e b7                	jle    1080f3 <debugger_readline+0x23>
  10813c:	83 ec 0c             	sub    $0xc,%esp
  10813f:	83 ee 01             	sub    $0x1,%esi
  108142:	6a 08                	push   $0x8
  108144:	e8 67 89 ff ff       	call   100ab0 <terminal_putchar>
  108149:	83 c4 10             	add    $0x10,%esp
  10814c:	eb a5                	jmp    1080f3 <debugger_readline+0x23>
  10814e:	66 90                	xchg   %ax,%ax
  108150:	83 ec 0c             	sub    $0xc,%esp
  108153:	6a 0a                	push   $0xa
  108155:	e8 56 89 ff ff       	call   100ab0 <terminal_putchar>
  10815a:	8b 45 08             	mov    0x8(%ebp),%eax
  10815d:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  108161:	8d 65 f4             	lea    -0xc(%ebp),%esp
  108164:	89 f0                	mov    %esi,%eax
  108166:	5b                   	pop    %ebx
  108167:	5e                   	pop    %esi
  108168:	5f                   	pop    %edi
  108169:	5d                   	pop    %ebp
  10816a:	c3                   	ret
  10816b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00108170 <debugger_run>:
  108170:	55                   	push   %ebp
  108171:	89 e5                	mov    %esp,%ebp
  108173:	57                   	push   %edi
  108174:	56                   	push   %esi
  108175:	53                   	push   %ebx
  108176:	8d 9d cf fe ff ff    	lea    -0x131(%ebp),%ebx
  10817c:	81 ec 58 01 00 00    	sub    $0x158,%esp
  108182:	68 74 d5 10 00       	push   $0x10d574
  108187:	e8 84 8a ff ff       	call   100c10 <terminal_writestring>
  10818c:	83 c4 10             	add    $0x10,%esp
  10818f:	83 ec 0c             	sub    $0xc,%esp
  108192:	53                   	push   %ebx
  108193:	e8 38 99 ff ff       	call   101ad0 <keyboard_buffer_read>
  108198:	83 c4 10             	add    $0x10,%esp
  10819b:	85 c0                	test   %eax,%eax
  10819d:	75 f0                	jne    10818f <debugger_run+0x1f>
  10819f:	90                   	nop
  1081a0:	83 ec 0c             	sub    $0xc,%esp
  1081a3:	68 a2 c6 10 00       	push   $0x10c6a2
  1081a8:	e8 63 8a ff ff       	call   100c10 <terminal_writestring>
  1081ad:	58                   	pop    %eax
  1081ae:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  1081b4:	5a                   	pop    %edx
  1081b5:	68 80 00 00 00       	push   $0x80
  1081ba:	50                   	push   %eax
  1081bb:	e8 10 ff ff ff       	call   1080d0 <debugger_readline>
  1081c0:	83 c4 10             	add    $0x10,%esp
  1081c3:	85 c0                	test   %eax,%eax
  1081c5:	74 d9                	je     1081a0 <debugger_run+0x30>
  1081c7:	0f b6 85 68 ff ff ff 	movzbl -0x98(%ebp),%eax
  1081ce:	84 c0                	test   %al,%al
  1081d0:	74 ce                	je     1081a0 <debugger_run+0x30>
  1081d2:	31 f6                	xor    %esi,%esi
  1081d4:	3c 20                	cmp    $0x20,%al
  1081d6:	74 08                	je     1081e0 <debugger_run+0x70>
  1081d8:	3c 09                	cmp    $0x9,%al
  1081da:	0f 85 62 12 00 00    	jne    109442 <debugger_run+0x12d2>
  1081e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  1081e6:	66 90                	xchg   %ax,%ax
  1081e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1081ef:	00 
  1081f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  1081f4:	83 c0 01             	add    $0x1,%eax
  1081f7:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
  1081fb:	80 fa 20             	cmp    $0x20,%dl
  1081fe:	74 f0                	je     1081f0 <debugger_run+0x80>
  108200:	80 fa 09             	cmp    $0x9,%dl
  108203:	74 eb                	je     1081f0 <debugger_run+0x80>
  108205:	84 d2                	test   %dl,%dl
  108207:	74 41                	je     10824a <debugger_run+0xda>
  108209:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
  10820f:	83 c6 01             	add    $0x1,%esi
  108212:	89 44 b7 fc          	mov    %eax,-0x4(%edi,%esi,4)
  108216:	0f b6 10             	movzbl (%eax),%edx
  108219:	f6 c2 df             	test   $0xdf,%dl
  10821c:	75 0e                	jne    10822c <debugger_run+0xbc>
  10821e:	eb 11                	jmp    108231 <debugger_run+0xc1>
  108220:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  108224:	83 c0 01             	add    $0x1,%eax
  108227:	f6 c2 df             	test   $0xdf,%dl
  10822a:	74 05                	je     108231 <debugger_run+0xc1>
  10822c:	80 fa 09             	cmp    $0x9,%dl
  10822f:	75 ef                	jne    108220 <debugger_run+0xb0>
  108231:	84 d2                	test   %dl,%dl
  108233:	74 1d                	je     108252 <debugger_run+0xe2>
  108235:	83 fe 10             	cmp    $0x10,%esi
  108238:	0f 84 7a 10 00 00    	je     1092b8 <debugger_run+0x1148>
  10823e:	80 fa 09             	cmp    $0x9,%dl
  108241:	74 ad                	je     1081f0 <debugger_run+0x80>
  108243:	80 fa 20             	cmp    $0x20,%dl
  108246:	74 a8                	je     1081f0 <debugger_run+0x80>
  108248:	eb c5                	jmp    10820f <debugger_run+0x9f>
  10824a:	85 f6                	test   %esi,%esi
  10824c:	0f 84 4e ff ff ff    	je     1081a0 <debugger_run+0x30>
  108252:	8b 9d e8 fe ff ff    	mov    -0x118(%ebp),%ebx
  108258:	0f b6 03             	movzbl (%ebx),%eax
  10825b:	83 e8 3f             	sub    $0x3f,%eax
  10825e:	3c 36                	cmp    $0x36,%al
  108260:	77 0a                	ja     10826c <debugger_run+0xfc>
  108262:	0f b6 c0             	movzbl %al,%eax
  108265:	ff 24 85 a0 b2 10 00 	jmp    *0x10b2a0(,%eax,4)
  10826c:	83 ec 08             	sub    $0x8,%esp
  10826f:	68 41 c8 10 00       	push   $0x10c841
  108274:	53                   	push   %ebx
  108275:	e8 f6 83 ff ff       	call   100670 <strcmp>
  10827a:	83 c4 10             	add    $0x10,%esp
  10827d:	85 c0                	test   %eax,%eax
  10827f:	0f 84 a6 12 00 00    	je     10952b <debugger_run+0x13bb>
  108285:	83 ec 08             	sub    $0x8,%esp
  108288:	68 45 c8 10 00       	push   $0x10c845
  10828d:	53                   	push   %ebx
  10828e:	e8 dd 83 ff ff       	call   100670 <strcmp>
  108293:	83 c4 10             	add    $0x10,%esp
  108296:	85 c0                	test   %eax,%eax
  108298:	0f 85 7a 15 00 00    	jne    109818 <debugger_run+0x16a8>
  10829e:	e8 ad c3 ff ff       	call   104650 <memory_heap_dump>
  1082a3:	e9 f8 fe ff ff       	jmp    1081a0 <debugger_run+0x30>
  1082a8:	83 ec 0c             	sub    $0xc,%esp
  1082ab:	68 01 c7 10 00       	push   $0x10c701
  1082b0:	e8 5b 89 ff ff       	call   100c10 <terminal_writestring>
  1082b5:	9c                   	pushf
  1082b6:	81 0c 24 00 01 00 00 	orl    $0x100,(%esp)
  1082bd:	9d                   	popf
  1082be:	c7 04 24 80 da 10 00 	movl   $0x10da80,(%esp)
  1082c5:	e8 46 89 ff ff       	call   100c10 <terminal_writestring>
  1082ca:	83 c4 10             	add    $0x10,%esp
  1082cd:	e9 ce fe ff ff       	jmp    1081a0 <debugger_run+0x30>
  1082d2:	89 c0                	mov    %eax,%eax
  1082d4:	89 85 b8 fe ff ff    	mov    %eax,-0x148(%ebp)
  1082da:	89 db                	mov    %ebx,%ebx
  1082dc:	89 c9                	mov    %ecx,%ecx
  1082de:	89 8d bc fe ff ff    	mov    %ecx,-0x144(%ebp)
  1082e4:	89 d2                	mov    %edx,%edx
  1082e6:	89 95 c0 fe ff ff    	mov    %edx,-0x140(%ebp)
  1082ec:	89 f6                	mov    %esi,%esi
  1082ee:	89 ff                	mov    %edi,%edi
  1082f0:	89 bd c4 fe ff ff    	mov    %edi,-0x13c(%ebp)
  1082f6:	89 ad d0 fe ff ff    	mov    %ebp,-0x130(%ebp)
  1082fc:	89 a5 d4 fe ff ff    	mov    %esp,-0x12c(%ebp)
  108302:	9c                   	pushf
  108303:	8f 85 d8 fe ff ff    	pop    -0x128(%ebp)
  108309:	83 ec 0c             	sub    $0xc,%esp
  10830c:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108312:	68 a9 bf 10 00       	push   $0x10bfa9
  108317:	e8 f4 88 ff ff       	call   100c10 <terminal_writestring>
  10831c:	c7 04 24 b9 c6 10 00 	movl   $0x10c6b9,(%esp)
  108323:	e8 e8 88 ff ff       	call   100c10 <terminal_writestring>
  108328:	8b 85 b8 fe ff ff    	mov    -0x148(%ebp),%eax
  10832e:	83 c4 0c             	add    $0xc,%esp
  108331:	6a 10                	push   $0x10
  108333:	57                   	push   %edi
  108334:	50                   	push   %eax
  108335:	e8 f6 85 ff ff       	call   100930 <itoa>
  10833a:	89 3c 24             	mov    %edi,(%esp)
  10833d:	e8 ce 88 ff ff       	call   100c10 <terminal_writestring>
  108342:	c7 04 24 bf c6 10 00 	movl   $0x10c6bf,(%esp)
  108349:	e8 c2 88 ff ff       	call   100c10 <terminal_writestring>
  10834e:	83 c4 0c             	add    $0xc,%esp
  108351:	6a 10                	push   $0x10
  108353:	57                   	push   %edi
  108354:	53                   	push   %ebx
  108355:	e8 d6 85 ff ff       	call   100930 <itoa>
  10835a:	89 3c 24             	mov    %edi,(%esp)
  10835d:	e8 ae 88 ff ff       	call   100c10 <terminal_writestring>
  108362:	c7 04 24 c5 c6 10 00 	movl   $0x10c6c5,(%esp)
  108369:	e8 a2 88 ff ff       	call   100c10 <terminal_writestring>
  10836e:	8b 8d bc fe ff ff    	mov    -0x144(%ebp),%ecx
  108374:	83 c4 0c             	add    $0xc,%esp
  108377:	6a 10                	push   $0x10
  108379:	57                   	push   %edi
  10837a:	51                   	push   %ecx
  10837b:	e8 b0 85 ff ff       	call   100930 <itoa>
  108380:	89 3c 24             	mov    %edi,(%esp)
  108383:	e8 88 88 ff ff       	call   100c10 <terminal_writestring>
  108388:	c7 04 24 cb c6 10 00 	movl   $0x10c6cb,(%esp)
  10838f:	e8 7c 88 ff ff       	call   100c10 <terminal_writestring>
  108394:	8b 95 c0 fe ff ff    	mov    -0x140(%ebp),%edx
  10839a:	83 c4 0c             	add    $0xc,%esp
  10839d:	6a 10                	push   $0x10
  10839f:	57                   	push   %edi
  1083a0:	52                   	push   %edx
  1083a1:	e8 8a 85 ff ff       	call   100930 <itoa>
  1083a6:	89 3c 24             	mov    %edi,(%esp)
  1083a9:	e8 62 88 ff ff       	call   100c10 <terminal_writestring>
  1083ae:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1083b5:	e8 56 88 ff ff       	call   100c10 <terminal_writestring>
  1083ba:	c7 04 24 d1 c6 10 00 	movl   $0x10c6d1,(%esp)
  1083c1:	e8 4a 88 ff ff       	call   100c10 <terminal_writestring>
  1083c6:	83 c4 0c             	add    $0xc,%esp
  1083c9:	6a 10                	push   $0x10
  1083cb:	57                   	push   %edi
  1083cc:	56                   	push   %esi
  1083cd:	e8 5e 85 ff ff       	call   100930 <itoa>
  1083d2:	89 3c 24             	mov    %edi,(%esp)
  1083d5:	e8 36 88 ff ff       	call   100c10 <terminal_writestring>
  1083da:	c7 04 24 d7 c6 10 00 	movl   $0x10c6d7,(%esp)
  1083e1:	e8 2a 88 ff ff       	call   100c10 <terminal_writestring>
  1083e6:	83 c4 0c             	add    $0xc,%esp
  1083e9:	6a 10                	push   $0x10
  1083eb:	57                   	push   %edi
  1083ec:	ff b5 c4 fe ff ff    	push   -0x13c(%ebp)
  1083f2:	e8 39 85 ff ff       	call   100930 <itoa>
  1083f7:	89 3c 24             	mov    %edi,(%esp)
  1083fa:	e8 11 88 ff ff       	call   100c10 <terminal_writestring>
  1083ff:	c7 04 24 dd c6 10 00 	movl   $0x10c6dd,(%esp)
  108406:	e8 05 88 ff ff       	call   100c10 <terminal_writestring>
  10840b:	83 c4 0c             	add    $0xc,%esp
  10840e:	6a 10                	push   $0x10
  108410:	57                   	push   %edi
  108411:	ff b5 d0 fe ff ff    	push   -0x130(%ebp)
  108417:	e8 14 85 ff ff       	call   100930 <itoa>
  10841c:	89 3c 24             	mov    %edi,(%esp)
  10841f:	e8 ec 87 ff ff       	call   100c10 <terminal_writestring>
  108424:	c7 04 24 e3 c6 10 00 	movl   $0x10c6e3,(%esp)
  10842b:	e8 e0 87 ff ff       	call   100c10 <terminal_writestring>
  108430:	83 c4 0c             	add    $0xc,%esp
  108433:	6a 10                	push   $0x10
  108435:	57                   	push   %edi
  108436:	ff b5 d4 fe ff ff    	push   -0x12c(%ebp)
  10843c:	e8 ef 84 ff ff       	call   100930 <itoa>
  108441:	89 3c 24             	mov    %edi,(%esp)
  108444:	e8 c7 87 ff ff       	call   100c10 <terminal_writestring>
  108449:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  108450:	e8 bb 87 ff ff       	call   100c10 <terminal_writestring>
  108455:	c7 04 24 e9 c6 10 00 	movl   $0x10c6e9,(%esp)
  10845c:	e8 af 87 ff ff       	call   100c10 <terminal_writestring>
  108461:	83 c4 0c             	add    $0xc,%esp
  108464:	6a 10                	push   $0x10
  108466:	57                   	push   %edi
  108467:	ff b5 d8 fe ff ff    	push   -0x128(%ebp)
  10846d:	e8 be 84 ff ff       	call   100930 <itoa>
  108472:	89 3c 24             	mov    %edi,(%esp)
  108475:	e8 96 87 ff ff       	call   100c10 <terminal_writestring>
  10847a:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  108481:	e8 8a 87 ff ff       	call   100c10 <terminal_writestring>
  108486:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  10848d:	e8 7e 87 ff ff       	call   100c10 <terminal_writestring>
  108492:	ba 5a c5 10 00       	mov    $0x10c55a,%edx
  108497:	b8 5e c5 10 00       	mov    $0x10c55e,%eax
  10849c:	f6 85 d8 fe ff ff 01 	testb  $0x1,-0x128(%ebp)
  1084a3:	0f 45 c2             	cmovne %edx,%eax
  1084a6:	89 04 24             	mov    %eax,(%esp)
  1084a9:	e8 62 87 ff ff       	call   100c10 <terminal_writestring>
  1084ae:	ba 62 c5 10 00       	mov    $0x10c562,%edx
  1084b3:	b8 66 c5 10 00       	mov    $0x10c566,%eax
  1084b8:	f6 85 d8 fe ff ff 04 	testb  $0x4,-0x128(%ebp)
  1084bf:	0f 45 c2             	cmovne %edx,%eax
  1084c2:	89 04 24             	mov    %eax,(%esp)
  1084c5:	e8 46 87 ff ff       	call   100c10 <terminal_writestring>
  1084ca:	ba 6a c5 10 00       	mov    $0x10c56a,%edx
  1084cf:	b8 6e c5 10 00       	mov    $0x10c56e,%eax
  1084d4:	f6 85 d8 fe ff ff 10 	testb  $0x10,-0x128(%ebp)
  1084db:	0f 45 c2             	cmovne %edx,%eax
  1084de:	89 04 24             	mov    %eax,(%esp)
  1084e1:	e8 2a 87 ff ff       	call   100c10 <terminal_writestring>
  1084e6:	ba 72 c5 10 00       	mov    $0x10c572,%edx
  1084eb:	b8 76 c5 10 00       	mov    $0x10c576,%eax
  1084f0:	f6 85 d8 fe ff ff 40 	testb  $0x40,-0x128(%ebp)
  1084f7:	0f 45 c2             	cmovne %edx,%eax
  1084fa:	89 04 24             	mov    %eax,(%esp)
  1084fd:	e8 0e 87 ff ff       	call   100c10 <terminal_writestring>
  108502:	ba 7a c5 10 00       	mov    $0x10c57a,%edx
  108507:	b8 7e c5 10 00       	mov    $0x10c57e,%eax
  10850c:	f6 85 d8 fe ff ff 80 	testb  $0x80,-0x128(%ebp)
  108513:	0f 45 c2             	cmovne %edx,%eax
  108516:	89 04 24             	mov    %eax,(%esp)
  108519:	e8 f2 86 ff ff       	call   100c10 <terminal_writestring>
  10851e:	ba 82 c5 10 00       	mov    $0x10c582,%edx
  108523:	b8 86 c5 10 00       	mov    $0x10c586,%eax
  108528:	f6 85 d9 fe ff ff 01 	testb  $0x1,-0x127(%ebp)
  10852f:	0f 45 c2             	cmovne %edx,%eax
  108532:	89 04 24             	mov    %eax,(%esp)
  108535:	e8 d6 86 ff ff       	call   100c10 <terminal_writestring>
  10853a:	ba 8a c5 10 00       	mov    $0x10c58a,%edx
  10853f:	b8 8e c5 10 00       	mov    $0x10c58e,%eax
  108544:	f6 85 d9 fe ff ff 02 	testb  $0x2,-0x127(%ebp)
  10854b:	0f 45 c2             	cmovne %edx,%eax
  10854e:	89 04 24             	mov    %eax,(%esp)
  108551:	e8 ba 86 ff ff       	call   100c10 <terminal_writestring>
  108556:	ba 92 c5 10 00       	mov    $0x10c592,%edx
  10855b:	b8 96 c5 10 00       	mov    $0x10c596,%eax
  108560:	f6 85 d9 fe ff ff 04 	testb  $0x4,-0x127(%ebp)
  108567:	0f 45 c2             	cmovne %edx,%eax
  10856a:	89 04 24             	mov    %eax,(%esp)
  10856d:	e8 9e 86 ff ff       	call   100c10 <terminal_writestring>
  108572:	ba 9a c5 10 00       	mov    $0x10c59a,%edx
  108577:	b8 9e c5 10 00       	mov    $0x10c59e,%eax
  10857c:	f6 85 d9 fe ff ff 08 	testb  $0x8,-0x127(%ebp)
  108583:	0f 45 c2             	cmovne %edx,%eax
  108586:	89 04 24             	mov    %eax,(%esp)
  108589:	e8 82 86 ff ff       	call   100c10 <terminal_writestring>
  10858e:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  108595:	e8 76 86 ff ff       	call   100c10 <terminal_writestring>
  10859a:	83 c4 10             	add    $0x10,%esp
  10859d:	e9 fe fb ff ff       	jmp    1081a0 <debugger_run+0x30>
  1085a2:	83 ec 0c             	sub    $0xc,%esp
  1085a5:	68 a4 c6 10 00       	push   $0x10c6a4
  1085aa:	e8 61 86 ff ff       	call   100c10 <terminal_writestring>
  1085af:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1085b2:	5b                   	pop    %ebx
  1085b3:	5e                   	pop    %esi
  1085b4:	5f                   	pop    %edi
  1085b5:	5d                   	pop    %ebp
  1085b6:	c3                   	ret
  1085b7:	b8 00 a2 14 01       	mov    $0x114a200,%eax
  1085bc:	ba c0 a2 14 01       	mov    $0x114a2c0,%edx
  1085c1:	80 38 00             	cmpb   $0x0,(%eax)
  1085c4:	74 06                	je     1085cc <debugger_run+0x45c>
  1085c6:	8b 48 04             	mov    0x4(%eax),%ecx
  1085c9:	c6 01 cc             	movb   $0xcc,(%ecx)
  1085cc:	83 c0 0c             	add    $0xc,%eax
  1085cf:	39 c2                	cmp    %eax,%edx
  1085d1:	75 ee                	jne    1085c1 <debugger_run+0x451>
  1085d3:	83 ec 0c             	sub    $0xc,%esp
  1085d6:	68 20 da 10 00       	push   $0x10da20
  1085db:	e8 30 86 ff ff       	call   100c10 <terminal_writestring>
  1085e0:	c7 04 24 58 da 10 00 	movl   $0x10da58,(%esp)
  1085e7:	e8 24 86 ff ff       	call   100c10 <terminal_writestring>
  1085ec:	83 c4 10             	add    $0x10,%esp
  1085ef:	e9 ac fb ff ff       	jmp    1081a0 <debugger_run+0x30>
  1085f4:	83 fe 03             	cmp    $0x3,%esi
  1085f7:	0f 8e 6c 11 00 00    	jle    109769 <debugger_run+0x15f9>
  1085fd:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108603:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108609:	e8 72 f9 ff ff       	call   107f80 <hex_to_u32>
  10860e:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108614:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  10861a:	e8 61 f9 ff ff       	call   107f80 <hex_to_u32>
  10861f:	89 c6                	mov    %eax,%esi
  108621:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  108627:	e8 54 f9 ff ff       	call   107f80 <hex_to_u32>
  10862c:	89 c3                	mov    %eax,%ebx
  10862e:	b8 00 00 01 00       	mov    $0x10000,%eax
  108633:	39 c3                	cmp    %eax,%ebx
  108635:	0f 47 d8             	cmova  %eax,%ebx
  108638:	83 ec 0c             	sub    $0xc,%esp
  10863b:	68 05 c8 10 00       	push   $0x10c805
  108640:	e8 cb 85 ff ff       	call   100c10 <terminal_writestring>
  108645:	83 c4 0c             	add    $0xc,%esp
  108648:	6a 0a                	push   $0xa
  10864a:	57                   	push   %edi
  10864b:	53                   	push   %ebx
  10864c:	e8 df 82 ff ff       	call   100930 <itoa>
  108651:	89 3c 24             	mov    %edi,(%esp)
  108654:	e8 b7 85 ff ff       	call   100c10 <terminal_writestring>
  108659:	c7 04 24 83 bd 10 00 	movl   $0x10bd83,(%esp)
  108660:	e8 ab 85 ff ff       	call   100c10 <terminal_writestring>
  108665:	8b 95 c4 fe ff ff    	mov    -0x13c(%ebp),%edx
  10866b:	83 c4 0c             	add    $0xc,%esp
  10866e:	53                   	push   %ebx
  10866f:	52                   	push   %edx
  108670:	56                   	push   %esi
  108671:	e8 7a 7e ff ff       	call   1004f0 <memmove>
  108676:	83 c4 10             	add    $0x10,%esp
  108679:	e9 22 fb ff ff       	jmp    1081a0 <debugger_run+0x30>
  10867e:	83 fe 02             	cmp    $0x2,%esi
  108681:	0f 8e cd 10 00 00    	jle    109754 <debugger_run+0x15e4>
  108687:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  10868d:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108693:	e8 e8 f8 ff ff       	call   107f80 <hex_to_u32>
  108698:	89 c3                	mov    %eax,%ebx
  10869a:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  1086a0:	e8 db f8 ff ff       	call   107f80 <hex_to_u32>
  1086a5:	83 ec 0c             	sub    $0xc,%esp
  1086a8:	68 a9 bf 10 00       	push   $0x10bfa9
  1086ad:	89 c6                	mov    %eax,%esi
  1086af:	e8 5c 85 ff ff       	call   100c10 <terminal_writestring>
  1086b4:	83 c4 0c             	add    $0xc,%esp
  1086b7:	6a 10                	push   $0x10
  1086b9:	57                   	push   %edi
  1086ba:	53                   	push   %ebx
  1086bb:	e8 70 82 ff ff       	call   100930 <itoa>
  1086c0:	89 3c 24             	mov    %edi,(%esp)
  1086c3:	e8 48 85 ff ff       	call   100c10 <terminal_writestring>
  1086c8:	c7 04 24 29 c8 10 00 	movl   $0x10c829,(%esp)
  1086cf:	e8 3c 85 ff ff       	call   100c10 <terminal_writestring>
  1086d4:	83 c4 0c             	add    $0xc,%esp
  1086d7:	6a 10                	push   $0x10
  1086d9:	57                   	push   %edi
  1086da:	56                   	push   %esi
  1086db:	e8 50 82 ff ff       	call   100930 <itoa>
  1086e0:	89 3c 24             	mov    %edi,(%esp)
  1086e3:	e8 28 85 ff ff       	call   100c10 <terminal_writestring>
  1086e8:	c7 04 24 2d c8 10 00 	movl   $0x10c82d,(%esp)
  1086ef:	e8 1c 85 ff ff       	call   100c10 <terminal_writestring>
  1086f4:	83 c4 0c             	add    $0xc,%esp
  1086f7:	8d 04 33             	lea    (%ebx,%esi,1),%eax
  1086fa:	6a 10                	push   $0x10
  1086fc:	57                   	push   %edi
  1086fd:	50                   	push   %eax
  1086fe:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108704:	e8 27 82 ff ff       	call   100930 <itoa>
  108709:	89 3c 24             	mov    %edi,(%esp)
  10870c:	e8 ff 84 ff ff       	call   100c10 <terminal_writestring>
  108711:	c7 04 24 31 c8 10 00 	movl   $0x10c831,(%esp)
  108718:	e8 f3 84 ff ff       	call   100c10 <terminal_writestring>
  10871d:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  108723:	83 c4 0c             	add    $0xc,%esp
  108726:	6a 0a                	push   $0xa
  108728:	57                   	push   %edi
  108729:	50                   	push   %eax
  10872a:	e8 01 82 ff ff       	call   100930 <itoa>
  10872f:	89 3c 24             	mov    %edi,(%esp)
  108732:	e8 d9 84 ff ff       	call   100c10 <terminal_writestring>
  108737:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  10873e:	e8 cd 84 ff ff       	call   100c10 <terminal_writestring>
  108743:	83 c4 0c             	add    $0xc,%esp
  108746:	6a 10                	push   $0x10
  108748:	57                   	push   %edi
  108749:	53                   	push   %ebx
  10874a:	e8 e1 81 ff ff       	call   100930 <itoa>
  10874f:	89 3c 24             	mov    %edi,(%esp)
  108752:	e8 b9 84 ff ff       	call   100c10 <terminal_writestring>
  108757:	c7 04 24 35 c8 10 00 	movl   $0x10c835,(%esp)
  10875e:	e8 ad 84 ff ff       	call   100c10 <terminal_writestring>
  108763:	83 c4 0c             	add    $0xc,%esp
  108766:	6a 10                	push   $0x10
  108768:	57                   	push   %edi
  108769:	56                   	push   %esi
  10876a:	e8 c1 81 ff ff       	call   100930 <itoa>
  10876f:	89 3c 24             	mov    %edi,(%esp)
  108772:	e8 99 84 ff ff       	call   100c10 <terminal_writestring>
  108777:	c7 04 24 2d c8 10 00 	movl   $0x10c82d,(%esp)
  10877e:	e8 8d 84 ff ff       	call   100c10 <terminal_writestring>
  108783:	89 d8                	mov    %ebx,%eax
  108785:	83 c4 0c             	add    $0xc,%esp
  108788:	29 f0                	sub    %esi,%eax
  10878a:	6a 10                	push   $0x10
  10878c:	57                   	push   %edi
  10878d:	50                   	push   %eax
  10878e:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108794:	e8 97 81 ff ff       	call   100930 <itoa>
  108799:	89 3c 24             	mov    %edi,(%esp)
  10879c:	e8 6f 84 ff ff       	call   100c10 <terminal_writestring>
  1087a1:	c7 04 24 31 c8 10 00 	movl   $0x10c831,(%esp)
  1087a8:	e8 63 84 ff ff       	call   100c10 <terminal_writestring>
  1087ad:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  1087b3:	83 c4 0c             	add    $0xc,%esp
  1087b6:	6a 0a                	push   $0xa
  1087b8:	57                   	push   %edi
  1087b9:	50                   	push   %eax
  1087ba:	e8 71 81 ff ff       	call   100930 <itoa>
  1087bf:	89 3c 24             	mov    %edi,(%esp)
  1087c2:	e8 49 84 ff ff       	call   100c10 <terminal_writestring>
  1087c7:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  1087ce:	e8 3d 84 ff ff       	call   100c10 <terminal_writestring>
  1087d3:	83 c4 10             	add    $0x10,%esp
  1087d6:	85 f6                	test   %esi,%esi
  1087d8:	0f 84 c2 f9 ff ff    	je     1081a0 <debugger_run+0x30>
  1087de:	83 ec 04             	sub    $0x4,%esp
  1087e1:	6a 10                	push   $0x10
  1087e3:	57                   	push   %edi
  1087e4:	53                   	push   %ebx
  1087e5:	e8 46 81 ff ff       	call   100930 <itoa>
  1087ea:	89 3c 24             	mov    %edi,(%esp)
  1087ed:	e8 1e 84 ff ff       	call   100c10 <terminal_writestring>
  1087f2:	c7 04 24 39 c8 10 00 	movl   $0x10c839,(%esp)
  1087f9:	e8 12 84 ff ff       	call   100c10 <terminal_writestring>
  1087fe:	83 c4 0c             	add    $0xc,%esp
  108801:	6a 10                	push   $0x10
  108803:	57                   	push   %edi
  108804:	56                   	push   %esi
  108805:	e8 26 81 ff ff       	call   100930 <itoa>
  10880a:	89 3c 24             	mov    %edi,(%esp)
  10880d:	e8 fe 83 ff ff       	call   100c10 <terminal_writestring>
  108812:	c7 04 24 2d c8 10 00 	movl   $0x10c82d,(%esp)
  108819:	e8 f2 83 ff ff       	call   100c10 <terminal_writestring>
  10881e:	89 d8                	mov    %ebx,%eax
  108820:	83 c4 0c             	add    $0xc,%esp
  108823:	0f af c6             	imul   %esi,%eax
  108826:	6a 10                	push   $0x10
  108828:	57                   	push   %edi
  108829:	50                   	push   %eax
  10882a:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108830:	e8 fb 80 ff ff       	call   100930 <itoa>
  108835:	89 3c 24             	mov    %edi,(%esp)
  108838:	e8 d3 83 ff ff       	call   100c10 <terminal_writestring>
  10883d:	c7 04 24 31 c8 10 00 	movl   $0x10c831,(%esp)
  108844:	e8 c7 83 ff ff       	call   100c10 <terminal_writestring>
  108849:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  10884f:	83 c4 0c             	add    $0xc,%esp
  108852:	6a 0a                	push   $0xa
  108854:	57                   	push   %edi
  108855:	50                   	push   %eax
  108856:	e8 d5 80 ff ff       	call   100930 <itoa>
  10885b:	89 3c 24             	mov    %edi,(%esp)
  10885e:	e8 ad 83 ff ff       	call   100c10 <terminal_writestring>
  108863:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  10886a:	e8 a1 83 ff ff       	call   100c10 <terminal_writestring>
  10886f:	83 c4 0c             	add    $0xc,%esp
  108872:	6a 10                	push   $0x10
  108874:	57                   	push   %edi
  108875:	53                   	push   %ebx
  108876:	e8 b5 80 ff ff       	call   100930 <itoa>
  10887b:	89 3c 24             	mov    %edi,(%esp)
  10887e:	e8 8d 83 ff ff       	call   100c10 <terminal_writestring>
  108883:	c7 04 24 3d c8 10 00 	movl   $0x10c83d,(%esp)
  10888a:	e8 81 83 ff ff       	call   100c10 <terminal_writestring>
  10888f:	83 c4 0c             	add    $0xc,%esp
  108892:	6a 10                	push   $0x10
  108894:	57                   	push   %edi
  108895:	56                   	push   %esi
  108896:	e8 95 80 ff ff       	call   100930 <itoa>
  10889b:	89 3c 24             	mov    %edi,(%esp)
  10889e:	e8 6d 83 ff ff       	call   100c10 <terminal_writestring>
  1088a3:	c7 04 24 2d c8 10 00 	movl   $0x10c82d,(%esp)
  1088aa:	e8 61 83 ff ff       	call   100c10 <terminal_writestring>
  1088af:	89 d8                	mov    %ebx,%eax
  1088b1:	31 d2                	xor    %edx,%edx
  1088b3:	83 c4 0c             	add    $0xc,%esp
  1088b6:	f7 f6                	div    %esi
  1088b8:	6a 10                	push   $0x10
  1088ba:	57                   	push   %edi
  1088bb:	50                   	push   %eax
  1088bc:	89 c3                	mov    %eax,%ebx
  1088be:	e8 6d 80 ff ff       	call   100930 <itoa>
  1088c3:	89 3c 24             	mov    %edi,(%esp)
  1088c6:	e8 45 83 ff ff       	call   100c10 <terminal_writestring>
  1088cb:	c7 04 24 31 c8 10 00 	movl   $0x10c831,(%esp)
  1088d2:	e8 39 83 ff ff       	call   100c10 <terminal_writestring>
  1088d7:	83 c4 0c             	add    $0xc,%esp
  1088da:	6a 0a                	push   $0xa
  1088dc:	57                   	push   %edi
  1088dd:	53                   	push   %ebx
  1088de:	e8 4d 80 ff ff       	call   100930 <itoa>
  1088e3:	89 3c 24             	mov    %edi,(%esp)
  1088e6:	e8 25 83 ff ff       	call   100c10 <terminal_writestring>
  1088eb:	c7 04 24 30 ca 10 00 	movl   $0x10ca30,(%esp)
  1088f2:	e8 19 83 ff ff       	call   100c10 <terminal_writestring>
  1088f7:	83 c4 10             	add    $0x10,%esp
  1088fa:	e9 a1 f8 ff ff       	jmp    1081a0 <debugger_run+0x30>
  1088ff:	83 fe 01             	cmp    $0x1,%esi
  108902:	0f 85 28 0e 00 00    	jne    109730 <debugger_run+0x15c0>
  108908:	83 ec 0c             	sub    $0xc,%esp
  10890b:	68 a9 bf 10 00       	push   $0x10bfa9
  108910:	e8 fb 82 ff ff       	call   100c10 <terminal_writestring>
  108915:	83 c4 10             	add    $0x10,%esp
  108918:	c7 85 c0 fe ff ff 20 	movl   $0x7c20,-0x140(%ebp)
  10891f:	7c 00 00 
  108922:	c7 85 c4 fe ff ff 00 	movl   $0x7c00,-0x13c(%ebp)
  108929:	7c 00 00 
  10892c:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108932:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  108938:	83 ec 04             	sub    $0x4,%esp
  10893b:	0f b6 10             	movzbl (%eax),%edx
  10893e:	88 95 bc fe ff ff    	mov    %dl,-0x144(%ebp)
  108944:	6a 10                	push   $0x10
  108946:	57                   	push   %edi
  108947:	50                   	push   %eax
  108948:	e8 e3 7f ff ff       	call   100930 <itoa>
  10894d:	89 3c 24             	mov    %edi,(%esp)
  108950:	e8 5b 7c ff ff       	call   1005b0 <strlen>
  108955:	83 c4 10             	add    $0x10,%esp
  108958:	0f b6 95 bc fe ff ff 	movzbl -0x144(%ebp),%edx
  10895f:	83 f8 07             	cmp    $0x7,%eax
  108962:	89 c3                	mov    %eax,%ebx
  108964:	7f 21                	jg     108987 <debugger_run+0x817>
  108966:	89 d6                	mov    %edx,%esi
  108968:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10896f:	00 
  108970:	83 ec 0c             	sub    $0xc,%esp
  108973:	83 c3 01             	add    $0x1,%ebx
  108976:	6a 30                	push   $0x30
  108978:	e8 33 81 ff ff       	call   100ab0 <terminal_putchar>
  10897d:	83 c4 10             	add    $0x10,%esp
  108980:	83 fb 08             	cmp    $0x8,%ebx
  108983:	75 eb                	jne    108970 <debugger_run+0x800>
  108985:	89 f2                	mov    %esi,%edx
  108987:	83 ec 0c             	sub    $0xc,%esp
  10898a:	88 95 bc fe ff ff    	mov    %dl,-0x144(%ebp)
  108990:	57                   	push   %edi
  108991:	e8 7a 82 ff ff       	call   100c10 <terminal_writestring>
  108996:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  10899d:	e8 6e 82 ff ff       	call   100c10 <terminal_writestring>
  1089a2:	0f b6 95 bc fe ff ff 	movzbl -0x144(%ebp),%edx
  1089a9:	83 c4 10             	add    $0x10,%esp
  1089ac:	31 c0                	xor    %eax,%eax
  1089ae:	66 90                	xchg   %ax,%ax
  1089b0:	3a 90 80 b6 10 00    	cmp    0x10b680(%eax),%dl
  1089b6:	0f 84 ac 09 00 00    	je     109368 <debugger_run+0x11f8>
  1089bc:	83 c0 01             	add    $0x1,%eax
  1089bf:	83 f8 21             	cmp    $0x21,%eax
  1089c2:	75 ec                	jne    1089b0 <debugger_run+0x840>
  1089c4:	31 c0                	xor    %eax,%eax
  1089c6:	66 90                	xchg   %ax,%ax
  1089c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1089cf:	00 
  1089d0:	3a 90 b4 b5 10 00    	cmp    0x10b5b4(%eax),%dl
  1089d6:	0f 84 82 0a 00 00    	je     10945e <debugger_run+0x12ee>
  1089dc:	83 c0 01             	add    $0x1,%eax
  1089df:	83 f8 15             	cmp    $0x15,%eax
  1089e2:	75 ec                	jne    1089d0 <debugger_run+0x860>
  1089e4:	80 fa e8             	cmp    $0xe8,%dl
  1089e7:	0f 84 aa 0a 00 00    	je     109497 <debugger_run+0x1327>
  1089ed:	0f 87 8c 0a 00 00    	ja     10947f <debugger_run+0x130f>
  1089f3:	80 fa cd             	cmp    $0xcd,%dl
  1089f6:	0f 84 fc 0a 00 00    	je     1094f8 <debugger_run+0x1388>
  1089fc:	0f 87 82 09 00 00    	ja     109384 <debugger_run+0x1214>
  108a02:	89 d0                	mov    %edx,%eax
  108a04:	83 e0 fd             	and    $0xfffffffd,%eax
  108a07:	3c 68                	cmp    $0x68,%al
  108a09:	0f 84 9d 07 00 00    	je     1091ac <debugger_run+0x103c>
  108a0f:	89 d1                	mov    %edx,%ecx
  108a11:	83 e1 fc             	and    $0xfffffffc,%ecx
  108a14:	80 f9 80             	cmp    $0x80,%cl
  108a17:	0f 84 73 0f 00 00    	je     109990 <debugger_run+0x1820>
  108a1d:	80 fa c7             	cmp    $0xc7,%dl
  108a20:	0f 87 5e 09 00 00    	ja     109384 <debugger_run+0x1214>
  108a26:	80 fa 87             	cmp    $0x87,%dl
  108a29:	0f 86 33 0f 00 00    	jbe    109962 <debugger_run+0x17f2>
  108a2f:	8d 42 78             	lea    0x78(%edx),%eax
  108a32:	3c 3f                	cmp    $0x3f,%al
  108a34:	0f 87 4a 09 00 00    	ja     109384 <debugger_run+0x1214>
  108a3a:	0f b6 c0             	movzbl %al,%eax
  108a3d:	ff 24 85 7c b3 10 00 	jmp    *0x10b37c(,%eax,4)
  108a44:	83 fe 03             	cmp    $0x3,%esi
  108a47:	0f 8e ce 0c 00 00    	jle    10971b <debugger_run+0x15ab>
  108a4d:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108a53:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108a59:	e8 22 f5 ff ff       	call   107f80 <hex_to_u32>
  108a5e:	89 c6                	mov    %eax,%esi
  108a60:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  108a66:	e8 15 f5 ff ff       	call   107f80 <hex_to_u32>
  108a6b:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108a71:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  108a77:	e8 04 f5 ff ff       	call   107f80 <hex_to_u32>
  108a7c:	83 ec 0c             	sub    $0xc,%esp
  108a7f:	68 ce c7 10 00       	push   $0x10c7ce
  108a84:	89 c3                	mov    %eax,%ebx
  108a86:	e8 85 81 ff ff       	call   100c10 <terminal_writestring>
  108a8b:	83 c4 0c             	add    $0xc,%esp
  108a8e:	0f b6 c3             	movzbl %bl,%eax
  108a91:	6a 10                	push   $0x10
  108a93:	57                   	push   %edi
  108a94:	50                   	push   %eax
  108a95:	e8 96 7e ff ff       	call   100930 <itoa>
  108a9a:	83 c4 10             	add    $0x10,%esp
  108a9d:	80 fb 0f             	cmp    $0xf,%bl
  108aa0:	0f 86 ed 0c 00 00    	jbe    109793 <debugger_run+0x1623>
  108aa6:	83 ec 0c             	sub    $0xc,%esp
  108aa9:	57                   	push   %edi
  108aaa:	e8 61 81 ff ff       	call   100c10 <terminal_writestring>
  108aaf:	c7 04 24 2f bb 10 00 	movl   $0x10bb2f,(%esp)
  108ab6:	e8 55 81 ff ff       	call   100c10 <terminal_writestring>
  108abb:	83 c4 10             	add    $0x10,%esp
  108abe:	3b b5 c4 fe ff ff    	cmp    -0x13c(%ebp),%esi
  108ac4:	0f 83 18 0f 00 00    	jae    1099e2 <debugger_run+0x1872>
  108aca:	89 d8                	mov    %ebx,%eax
  108acc:	31 db                	xor    %ebx,%ebx
  108ace:	eb 0b                	jmp    108adb <debugger_run+0x96b>
  108ad0:	83 c6 01             	add    $0x1,%esi
  108ad3:	39 b5 c4 fe ff ff    	cmp    %esi,-0x13c(%ebp)
  108ad9:	74 1e                	je     108af9 <debugger_run+0x989>
  108adb:	0f b6 16             	movzbl (%esi),%edx
  108ade:	38 d0                	cmp    %dl,%al
  108ae0:	75 ee                	jne    108ad0 <debugger_run+0x960>
  108ae2:	83 fb 13             	cmp    $0x13,%ebx
  108ae5:	0f 86 bb 09 00 00    	jbe    1094a6 <debugger_run+0x1336>
  108aeb:	83 c3 01             	add    $0x1,%ebx
  108aee:	83 c6 01             	add    $0x1,%esi
  108af1:	39 b5 c4 fe ff ff    	cmp    %esi,-0x13c(%ebp)
  108af7:	75 e2                	jne    108adb <debugger_run+0x96b>
  108af9:	89 d8                	mov    %ebx,%eax
  108afb:	83 ec 04             	sub    $0x4,%esp
  108afe:	6a 0a                	push   $0xa
  108b00:	57                   	push   %edi
  108b01:	50                   	push   %eax
  108b02:	e8 29 7e ff ff       	call   100930 <itoa>
  108b07:	c7 04 24 e2 c7 10 00 	movl   $0x10c7e2,(%esp)
  108b0e:	e8 fd 80 ff ff       	call   100c10 <terminal_writestring>
  108b13:	89 3c 24             	mov    %edi,(%esp)
  108b16:	e8 f5 80 ff ff       	call   100c10 <terminal_writestring>
  108b1b:	c7 04 24 eb c7 10 00 	movl   $0x10c7eb,(%esp)
  108b22:	e8 e9 80 ff ff       	call   100c10 <terminal_writestring>
  108b27:	83 c4 10             	add    $0x10,%esp
  108b2a:	e9 71 f6 ff ff       	jmp    1081a0 <debugger_run+0x30>
  108b2f:	83 fe 03             	cmp    $0x3,%esi
  108b32:	0f 8e ce 0b 00 00    	jle    109706 <debugger_run+0x1596>
  108b38:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108b3e:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108b44:	e8 37 f4 ff ff       	call   107f80 <hex_to_u32>
  108b49:	89 c3                	mov    %eax,%ebx
  108b4b:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  108b51:	e8 2a f4 ff ff       	call   107f80 <hex_to_u32>
  108b56:	89 85 b8 fe ff ff    	mov    %eax,-0x148(%ebp)
  108b5c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  108b62:	e8 19 f4 ff ff       	call   107f80 <hex_to_u32>
  108b67:	83 ec 0c             	sub    $0xc,%esp
  108b6a:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108b70:	68 a9 bf 10 00       	push   $0x10bfa9
  108b75:	e8 96 80 ff ff       	call   100c10 <terminal_writestring>
  108b7a:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
  108b80:	b8 00 10 00 00       	mov    $0x1000,%eax
  108b85:	83 c4 10             	add    $0x10,%esp
  108b88:	39 c1                	cmp    %eax,%ecx
  108b8a:	0f 46 c1             	cmovbe %ecx,%eax
  108b8d:	31 f6                	xor    %esi,%esi
  108b8f:	89 85 bc fe ff ff    	mov    %eax,-0x144(%ebp)
  108b95:	85 c9                	test   %ecx,%ecx
  108b97:	0f 84 01 01 00 00    	je     108c9e <debugger_run+0xb2e>
  108b9d:	c7 85 c0 fe ff ff 00 	movl   $0x0,-0x140(%ebp)
  108ba4:	00 00 00 
  108ba7:	8b 8d b8 fe ff ff    	mov    -0x148(%ebp),%ecx
  108bad:	0f b6 03             	movzbl (%ebx),%eax
  108bb0:	8d 14 31             	lea    (%ecx,%esi,1),%edx
  108bb3:	0f b6 0a             	movzbl (%edx),%ecx
  108bb6:	88 8d c4 fe ff ff    	mov    %cl,-0x13c(%ebp)
  108bbc:	38 c8                	cmp    %cl,%al
  108bbe:	0f 84 ba 00 00 00    	je     108c7e <debugger_run+0xb0e>
  108bc4:	83 bd c0 fe ff ff 0f 	cmpl   $0xf,-0x140(%ebp)
  108bcb:	0f 87 ad 00 00 00    	ja     108c7e <debugger_run+0xb0e>
  108bd1:	83 ec 0c             	sub    $0xc,%esp
  108bd4:	68 dc be 10 00       	push   $0x10bedc
  108bd9:	88 85 b4 fe ff ff    	mov    %al,-0x14c(%ebp)
  108bdf:	e8 2c 80 ff ff       	call   100c10 <terminal_writestring>
  108be4:	83 c4 0c             	add    $0xc,%esp
  108be7:	6a 10                	push   $0x10
  108be9:	57                   	push   %edi
  108bea:	53                   	push   %ebx
  108beb:	e8 40 7d ff ff       	call   100930 <itoa>
  108bf0:	89 3c 24             	mov    %edi,(%esp)
  108bf3:	e8 18 80 ff ff       	call   100c10 <terminal_writestring>
  108bf8:	c7 04 24 1d bb 10 00 	movl   $0x10bb1d,(%esp)
  108bff:	e8 0c 80 ff ff       	call   100c10 <terminal_writestring>
  108c04:	0f b6 95 b4 fe ff ff 	movzbl -0x14c(%ebp),%edx
  108c0b:	83 c4 0c             	add    $0xc,%esp
  108c0e:	6a 10                	push   $0x10
  108c10:	57                   	push   %edi
  108c11:	52                   	push   %edx
  108c12:	e8 19 7d ff ff       	call   100930 <itoa>
  108c17:	83 c4 10             	add    $0x10,%esp
  108c1a:	80 bd b4 fe ff ff 0f 	cmpb   $0xf,-0x14c(%ebp)
  108c21:	0f 86 f2 08 00 00    	jbe    109519 <debugger_run+0x13a9>
  108c27:	83 ec 0c             	sub    $0xc,%esp
  108c2a:	57                   	push   %edi
  108c2b:	e8 e0 7f ff ff       	call   100c10 <terminal_writestring>
  108c30:	c7 04 24 aa be 10 00 	movl   $0x10beaa,(%esp)
  108c37:	e8 d4 7f ff ff       	call   100c10 <terminal_writestring>
  108c3c:	0f b6 85 c4 fe ff ff 	movzbl -0x13c(%ebp),%eax
  108c43:	83 c4 0c             	add    $0xc,%esp
  108c46:	6a 10                	push   $0x10
  108c48:	57                   	push   %edi
  108c49:	50                   	push   %eax
  108c4a:	e8 e1 7c ff ff       	call   100930 <itoa>
  108c4f:	83 c4 10             	add    $0x10,%esp
  108c52:	80 bd c4 fe ff ff 0f 	cmpb   $0xf,-0x13c(%ebp)
  108c59:	0f 86 a8 08 00 00    	jbe    109507 <debugger_run+0x1397>
  108c5f:	83 ec 0c             	sub    $0xc,%esp
  108c62:	57                   	push   %edi
  108c63:	e8 a8 7f ff ff       	call   100c10 <terminal_writestring>
  108c68:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  108c6f:	e8 9c 7f ff ff       	call   100c10 <terminal_writestring>
  108c74:	83 85 c0 fe ff ff 01 	addl   $0x1,-0x140(%ebp)
  108c7b:	83 c4 10             	add    $0x10,%esp
  108c7e:	83 c6 01             	add    $0x1,%esi
  108c81:	83 c3 01             	add    $0x1,%ebx
  108c84:	3b b5 bc fe ff ff    	cmp    -0x144(%ebp),%esi
  108c8a:	0f 82 17 ff ff ff    	jb     108ba7 <debugger_run+0xa37>
  108c90:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  108c96:	85 c0                	test   %eax,%eax
  108c98:	0f 85 02 f5 ff ff    	jne    1081a0 <debugger_run+0x30>
  108c9e:	83 ec 0c             	sub    $0xc,%esp
  108ca1:	68 f7 c7 10 00       	push   $0x10c7f7
  108ca6:	e8 65 7f ff ff       	call   100c10 <terminal_writestring>
  108cab:	83 c4 10             	add    $0x10,%esp
  108cae:	e9 ed f4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  108cb3:	83 fe 01             	cmp    $0x1,%esi
  108cb6:	0f 84 94 0b 00 00    	je     109850 <debugger_run+0x16e0>
  108cbc:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108cc2:	e8 b9 f2 ff ff       	call   107f80 <hex_to_u32>
  108cc7:	89 c3                	mov    %eax,%ebx
  108cc9:	83 fe 02             	cmp    $0x2,%esi
  108ccc:	0f 84 9d 0b 00 00    	je     10986f <debugger_run+0x16ff>
  108cd2:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
  108cd8:	83 eb 02             	sub    $0x2,%ebx
  108cdb:	89 9d c4 fe ff ff    	mov    %ebx,-0x13c(%ebp)
  108ce1:	bb 02 00 00 00       	mov    $0x2,%ebx
  108ce6:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  108ce9:	e8 92 f2 ff ff       	call   107f80 <hex_to_u32>
  108cee:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
  108cf4:	01 d9                	add    %ebx,%ecx
  108cf6:	83 c3 01             	add    $0x1,%ebx
  108cf9:	88 01                	mov    %al,(%ecx)
  108cfb:	39 f3                	cmp    %esi,%ebx
  108cfd:	7c e7                	jl     108ce6 <debugger_run+0xb76>
  108cff:	83 ec 0c             	sub    $0xc,%esp
  108d02:	68 f5 c6 10 00       	push   $0x10c6f5
  108d07:	e8 04 7f ff ff       	call   100c10 <terminal_writestring>
  108d0c:	83 c4 10             	add    $0x10,%esp
  108d0f:	e9 8c f4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  108d14:	83 fe 01             	cmp    $0x1,%esi
  108d17:	0f 84 b2 0a 00 00    	je     1097cf <debugger_run+0x165f>
  108d1d:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108d23:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108d29:	e8 52 f2 ff ff       	call   107f80 <hex_to_u32>
  108d2e:	83 ec 0c             	sub    $0xc,%esp
  108d31:	68 a8 da 10 00       	push   $0x10daa8
  108d36:	89 c3                	mov    %eax,%ebx
  108d38:	e8 d3 7e ff ff       	call   100c10 <terminal_writestring>
  108d3d:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
  108d43:	83 c4 10             	add    $0x10,%esp
  108d46:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%ebp)
  108d4c:	8b b5 c0 fe ff ff    	mov    -0x140(%ebp),%esi
  108d52:	83 ec 04             	sub    $0x4,%esp
  108d55:	6a 10                	push   $0x10
  108d57:	56                   	push   %esi
  108d58:	53                   	push   %ebx
  108d59:	e8 d2 7b ff ff       	call   100930 <itoa>
  108d5e:	89 34 24             	mov    %esi,(%esp)
  108d61:	e8 4a 78 ff ff       	call   1005b0 <strlen>
  108d66:	83 c4 10             	add    $0x10,%esp
  108d69:	89 c6                	mov    %eax,%esi
  108d6b:	83 f8 07             	cmp    $0x7,%eax
  108d6e:	7f 15                	jg     108d85 <debugger_run+0xc15>
  108d70:	83 ec 0c             	sub    $0xc,%esp
  108d73:	83 c6 01             	add    $0x1,%esi
  108d76:	6a 30                	push   $0x30
  108d78:	e8 33 7d ff ff       	call   100ab0 <terminal_putchar>
  108d7d:	83 c4 10             	add    $0x10,%esp
  108d80:	83 fe 08             	cmp    $0x8,%esi
  108d83:	75 eb                	jne    108d70 <debugger_run+0xc00>
  108d85:	83 ec 0c             	sub    $0xc,%esp
  108d88:	ff b5 c0 fe ff ff    	push   -0x140(%ebp)
  108d8e:	e8 7d 7e ff ff       	call   100c10 <terminal_writestring>
  108d93:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  108d9a:	e8 71 7e ff ff       	call   100c10 <terminal_writestring>
  108d9f:	5a                   	pop    %edx
  108da0:	59                   	pop    %ecx
  108da1:	6a 40                	push   $0x40
  108da3:	57                   	push   %edi
  108da4:	e8 27 f3 ff ff       	call   1080d0 <debugger_readline>
  108da9:	83 c4 10             	add    $0x10,%esp
  108dac:	85 c0                	test   %eax,%eax
  108dae:	0f 84 ec f3 ff ff    	je     1081a0 <debugger_run+0x30>
  108db4:	0f be 85 28 ff ff ff 	movsbl -0xd8(%ebp),%eax
  108dbb:	89 fa                	mov    %edi,%edx
  108dbd:	84 c0                	test   %al,%al
  108dbf:	74 8b                	je     108d4c <debugger_run+0xbdc>
  108dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  108dc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108dcf:	00 
  108dd0:	3c 20                	cmp    $0x20,%al
  108dd2:	75 1f                	jne    108df3 <debugger_run+0xc83>
  108dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  108dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108ddf:	00 
  108de0:	0f be 42 01          	movsbl 0x1(%edx),%eax
  108de4:	83 c2 01             	add    $0x1,%edx
  108de7:	3c 20                	cmp    $0x20,%al
  108de9:	74 f5                	je     108de0 <debugger_run+0xc70>
  108deb:	84 c0                	test   %al,%al
  108ded:	0f 84 59 ff ff ff    	je     108d4c <debugger_run+0xbdc>
  108df3:	8d 48 d0             	lea    -0x30(%eax),%ecx
  108df6:	89 de                	mov    %ebx,%esi
  108df8:	80 f9 09             	cmp    $0x9,%cl
  108dfb:	0f 86 71 04 00 00    	jbe    109272 <debugger_run+0x1102>
  108e01:	8d 48 9f             	lea    -0x61(%eax),%ecx
  108e04:	80 f9 05             	cmp    $0x5,%cl
  108e07:	0f 86 95 04 00 00    	jbe    1092a2 <debugger_run+0x1132>
  108e0d:	8d 48 bf             	lea    -0x41(%eax),%ecx
  108e10:	80 f9 05             	cmp    $0x5,%cl
  108e13:	0f 87 33 ff ff ff    	ja     108d4c <debugger_run+0xbdc>
  108e19:	83 e8 37             	sub    $0x37,%eax
  108e1c:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108e22:	0f be 42 01          	movsbl 0x1(%edx),%eax
  108e26:	8d 48 d0             	lea    -0x30(%eax),%ecx
  108e29:	80 f9 09             	cmp    $0x9,%cl
  108e2c:	0f 86 59 04 00 00    	jbe    10928b <debugger_run+0x111b>
  108e32:	8d 48 9f             	lea    -0x61(%eax),%ecx
  108e35:	80 f9 05             	cmp    $0x5,%cl
  108e38:	0f 86 72 04 00 00    	jbe    1092b0 <debugger_run+0x1140>
  108e3e:	8d 48 bf             	lea    -0x41(%eax),%ecx
  108e41:	80 f9 05             	cmp    $0x5,%cl
  108e44:	0f 87 49 04 00 00    	ja     109293 <debugger_run+0x1123>
  108e4a:	83 e8 37             	sub    $0x37,%eax
  108e4d:	0f b6 8d c4 fe ff ff 	movzbl -0x13c(%ebp),%ecx
  108e54:	83 c2 02             	add    $0x2,%edx
  108e57:	c1 e1 04             	shl    $0x4,%ecx
  108e5a:	09 c8                	or     %ecx,%eax
  108e5c:	88 06                	mov    %al,(%esi)
  108e5e:	0f be 02             	movsbl (%edx),%eax
  108e61:	83 c3 01             	add    $0x1,%ebx
  108e64:	84 c0                	test   %al,%al
  108e66:	0f 85 64 ff ff ff    	jne    108dd0 <debugger_run+0xc60>
  108e6c:	e9 db fe ff ff       	jmp    108d4c <debugger_run+0xbdc>
  108e71:	83 ec 08             	sub    $0x8,%esp
  108e74:	68 14 c7 10 00       	push   $0x10c714
  108e79:	53                   	push   %ebx
  108e7a:	e8 f1 77 ff ff       	call   100670 <strcmp>
  108e7f:	83 c4 10             	add    $0x10,%esp
  108e82:	85 c0                	test   %eax,%eax
  108e84:	0f 85 c4 06 00 00    	jne    10954e <debugger_run+0x13de>
  108e8a:	83 fe 01             	cmp    $0x1,%esi
  108e8d:	0f 84 27 09 00 00    	je     1097ba <debugger_run+0x164a>
  108e93:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108e99:	e8 e2 f0 ff ff       	call   107f80 <hex_to_u32>
  108e9e:	89 c3                	mov    %eax,%ebx
  108ea0:	83 f8 0f             	cmp    $0xf,%eax
  108ea3:	0f 87 d5 08 00 00    	ja     10977e <debugger_run+0x160e>
  108ea9:	8d 04 40             	lea    (%eax,%eax,2),%eax
  108eac:	80 3c 85 00 a2 14 01 	cmpb   $0x0,0x114a200(,%eax,4)
  108eb3:	00 
  108eb4:	0f 84 c4 08 00 00    	je     10977e <debugger_run+0x160e>
  108eba:	8b 0c 85 04 a2 14 01 	mov    0x114a204(,%eax,4),%ecx
  108ec1:	83 ec 0c             	sub    $0xc,%esp
  108ec4:	0f b6 14 85 08 a2 14 	movzbl 0x114a208(,%eax,4),%edx
  108ecb:	01 
  108ecc:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108ed2:	88 11                	mov    %dl,(%ecx)
  108ed4:	c6 04 85 00 a2 14 01 	movb   $0x0,0x114a200(,%eax,4)
  108edb:	00 
  108edc:	68 46 c7 10 00       	push   $0x10c746
  108ee1:	e8 2a 7d ff ff       	call   100c10 <terminal_writestring>
  108ee6:	83 c4 0c             	add    $0xc,%esp
  108ee9:	6a 0a                	push   $0xa
  108eeb:	57                   	push   %edi
  108eec:	53                   	push   %ebx
  108eed:	e8 3e 7a ff ff       	call   100930 <itoa>
  108ef2:	89 3c 24             	mov    %edi,(%esp)
  108ef5:	e8 16 7d ff ff       	call   100c10 <terminal_writestring>
  108efa:	c7 04 24 54 c7 10 00 	movl   $0x10c754,(%esp)
  108f01:	e8 0a 7d ff ff       	call   100c10 <terminal_writestring>
  108f06:	83 c4 10             	add    $0x10,%esp
  108f09:	e9 92 f2 ff ff       	jmp    1081a0 <debugger_run+0x30>
  108f0e:	83 fe 03             	cmp    $0x3,%esi
  108f11:	0f 8e 76 07 00 00    	jle    10968d <debugger_run+0x151d>
  108f17:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  108f1d:	e8 5e f0 ff ff       	call   107f80 <hex_to_u32>
  108f22:	89 c3                	mov    %eax,%ebx
  108f24:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  108f2a:	e8 51 f0 ff ff       	call   107f80 <hex_to_u32>
  108f2f:	89 c6                	mov    %eax,%esi
  108f31:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  108f37:	e8 44 f0 ff ff       	call   107f80 <hex_to_u32>
  108f3c:	39 f3                	cmp    %esi,%ebx
  108f3e:	0f 83 61 08 00 00    	jae    1097a5 <debugger_run+0x1635>
  108f44:	83 ec 0c             	sub    $0xc,%esp
  108f47:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  108f4d:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108f53:	29 de                	sub    %ebx,%esi
  108f55:	68 c2 c7 10 00       	push   $0x10c7c2
  108f5a:	e8 b1 7c ff ff       	call   100c10 <terminal_writestring>
  108f5f:	83 c4 0c             	add    $0xc,%esp
  108f62:	6a 0a                	push   $0xa
  108f64:	57                   	push   %edi
  108f65:	56                   	push   %esi
  108f66:	e8 c5 79 ff ff       	call   100930 <itoa>
  108f6b:	89 3c 24             	mov    %edi,(%esp)
  108f6e:	e8 9d 7c ff ff       	call   100c10 <terminal_writestring>
  108f73:	c7 04 24 83 bd 10 00 	movl   $0x10bd83,(%esp)
  108f7a:	e8 91 7c ff ff       	call   100c10 <terminal_writestring>
  108f7f:	0f b6 bd c4 fe ff ff 	movzbl -0x13c(%ebp),%edi
  108f86:	83 c4 0c             	add    $0xc,%esp
  108f89:	56                   	push   %esi
  108f8a:	57                   	push   %edi
  108f8b:	53                   	push   %ebx
  108f8c:	e8 0f 75 ff ff       	call   1004a0 <memset>
  108f91:	83 c4 10             	add    $0x10,%esp
  108f94:	e9 07 f2 ff ff       	jmp    1081a0 <debugger_run+0x30>
  108f99:	83 fe 01             	cmp    $0x1,%esi
  108f9c:	0f 85 b7 06 00 00    	jne    109659 <debugger_run+0x14e9>
  108fa2:	83 ec 0c             	sub    $0xc,%esp
  108fa5:	68 a9 bf 10 00       	push   $0x10bfa9
  108faa:	e8 61 7c ff ff       	call   100c10 <terminal_writestring>
  108faf:	83 c4 10             	add    $0x10,%esp
  108fb2:	b8 80 00 00 00       	mov    $0x80,%eax
  108fb7:	c7 85 b8 fe ff ff 00 	movl   $0x7c00,-0x148(%ebp)
  108fbe:	7c 00 00 
  108fc1:	c7 85 bc fe ff ff 10 	movl   $0x10,-0x144(%ebp)
  108fc8:	00 00 00 
  108fcb:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  108fd1:	89 c6                	mov    %eax,%esi
  108fd3:	8b 85 bc fe ff ff    	mov    -0x144(%ebp),%eax
  108fd9:	83 ec 0c             	sub    $0xc,%esp
  108fdc:	83 e8 10             	sub    $0x10,%eax
  108fdf:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%ebp)
  108fe5:	68 a4 b9 10 00       	push   $0x10b9a4
  108fea:	e8 21 7c ff ff       	call   100c10 <terminal_writestring>
  108fef:	83 c4 0c             	add    $0xc,%esp
  108ff2:	6a 10                	push   $0x10
  108ff4:	57                   	push   %edi
  108ff5:	ff b5 b8 fe ff ff    	push   -0x148(%ebp)
  108ffb:	e8 30 79 ff ff       	call   100930 <itoa>
  109000:	89 3c 24             	mov    %edi,(%esp)
  109003:	e8 a8 75 ff ff       	call   1005b0 <strlen>
  109008:	83 c4 10             	add    $0x10,%esp
  10900b:	89 c3                	mov    %eax,%ebx
  10900d:	83 f8 07             	cmp    $0x7,%eax
  109010:	7f 23                	jg     109035 <debugger_run+0xec5>
  109012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  109018:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10901f:	00 
  109020:	83 ec 0c             	sub    $0xc,%esp
  109023:	83 c3 01             	add    $0x1,%ebx
  109026:	6a 30                	push   $0x30
  109028:	e8 83 7a ff ff       	call   100ab0 <terminal_putchar>
  10902d:	83 c4 10             	add    $0x10,%esp
  109030:	83 fb 08             	cmp    $0x8,%ebx
  109033:	75 eb                	jne    109020 <debugger_run+0xeb0>
  109035:	83 ec 0c             	sub    $0xc,%esp
  109038:	31 db                	xor    %ebx,%ebx
  10903a:	57                   	push   %edi
  10903b:	e8 d0 7b ff ff       	call   100c10 <terminal_writestring>
  109040:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  109047:	e8 c4 7b ff ff       	call   100c10 <terminal_writestring>
  10904c:	8b 85 bc fe ff ff    	mov    -0x144(%ebp),%eax
  109052:	83 c4 10             	add    $0x10,%esp
  109055:	83 e8 08             	sub    $0x8,%eax
  109058:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%ebp)
  10905e:	eb 21                	jmp    109081 <debugger_run+0xf11>
  109060:	83 ec 0c             	sub    $0xc,%esp
  109063:	68 a3 b9 10 00       	push   $0x10b9a3
  109068:	e8 a3 7b ff ff       	call   100c10 <terminal_writestring>
  10906d:	83 c4 10             	add    $0x10,%esp
  109070:	83 fb 07             	cmp    $0x7,%ebx
  109073:	74 63                	je     1090d8 <debugger_run+0xf68>
  109075:	83 c3 01             	add    $0x1,%ebx
  109078:	83 fb 10             	cmp    $0x10,%ebx
  10907b:	0f 84 92 00 00 00    	je     109113 <debugger_run+0xfa3>
  109081:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  109087:	89 da                	mov    %ebx,%edx
  109089:	8d 0c 03             	lea    (%ebx,%eax,1),%ecx
  10908c:	39 f1                	cmp    %esi,%ecx
  10908e:	73 d0                	jae    109060 <debugger_run+0xef0>
  109090:	03 95 b8 fe ff ff    	add    -0x148(%ebp),%edx
  109096:	83 ec 04             	sub    $0x4,%esp
  109099:	0f b6 0a             	movzbl (%edx),%ecx
  10909c:	6a 10                	push   $0x10
  10909e:	57                   	push   %edi
  10909f:	88 8d c4 fe ff ff    	mov    %cl,-0x13c(%ebp)
  1090a5:	51                   	push   %ecx
  1090a6:	e8 85 78 ff ff       	call   100930 <itoa>
  1090ab:	83 c4 10             	add    $0x10,%esp
  1090ae:	80 bd c4 fe ff ff 0f 	cmpb   $0xf,-0x13c(%ebp)
  1090b5:	0f 86 a5 01 00 00    	jbe    109260 <debugger_run+0x10f0>
  1090bb:	83 ec 0c             	sub    $0xc,%esp
  1090be:	57                   	push   %edi
  1090bf:	e8 4c 7b ff ff       	call   100c10 <terminal_writestring>
  1090c4:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1090cb:	e8 e0 79 ff ff       	call   100ab0 <terminal_putchar>
  1090d0:	83 c4 10             	add    $0x10,%esp
  1090d3:	83 fb 07             	cmp    $0x7,%ebx
  1090d6:	75 9d                	jne    109075 <debugger_run+0xf05>
  1090d8:	83 ec 0c             	sub    $0xc,%esp
  1090db:	bb 08 00 00 00       	mov    $0x8,%ebx
  1090e0:	6a 20                	push   $0x20
  1090e2:	e8 c9 79 ff ff       	call   100ab0 <terminal_putchar>
  1090e7:	ba 08 00 00 00       	mov    $0x8,%edx
  1090ec:	83 c4 10             	add    $0x10,%esp
  1090ef:	39 b5 b4 fe ff ff    	cmp    %esi,-0x14c(%ebp)
  1090f5:	72 99                	jb     109090 <debugger_run+0xf20>
  1090f7:	83 ec 0c             	sub    $0xc,%esp
  1090fa:	83 c3 01             	add    $0x1,%ebx
  1090fd:	68 a3 b9 10 00       	push   $0x10b9a3
  109102:	e8 09 7b ff ff       	call   100c10 <terminal_writestring>
  109107:	83 c4 10             	add    $0x10,%esp
  10910a:	83 fb 10             	cmp    $0x10,%ebx
  10910d:	0f 85 6e ff ff ff    	jne    109081 <debugger_run+0xf11>
  109113:	83 ec 0c             	sub    $0xc,%esp
  109116:	68 ef c6 10 00       	push   $0x10c6ef
  10911b:	e8 f0 7a ff ff       	call   100c10 <terminal_writestring>
  109120:	8b 9d c0 fe ff ff    	mov    -0x140(%ebp),%ebx
  109126:	8b 85 b8 fe ff ff    	mov    -0x148(%ebp),%eax
  10912c:	83 c4 10             	add    $0x10,%esp
  10912f:	89 bd c4 fe ff ff    	mov    %edi,-0x13c(%ebp)
  109135:	29 d8                	sub    %ebx,%eax
  109137:	89 df                	mov    %ebx,%edi
  109139:	89 c3                	mov    %eax,%ebx
  10913b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  109140:	39 f7                	cmp    %esi,%edi
  109142:	73 2b                	jae    10916f <debugger_run+0xfff>
  109144:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
  109147:	0f b6 00             	movzbl (%eax),%eax
  10914a:	8d 48 e0             	lea    -0x20(%eax),%ecx
  10914d:	80 f9 5f             	cmp    $0x5f,%cl
  109150:	b9 2e 00 00 00       	mov    $0x2e,%ecx
  109155:	0f 43 c1             	cmovae %ecx,%eax
  109158:	83 ec 0c             	sub    $0xc,%esp
  10915b:	83 c7 01             	add    $0x1,%edi
  10915e:	50                   	push   %eax
  10915f:	e8 4c 79 ff ff       	call   100ab0 <terminal_putchar>
  109164:	83 c4 10             	add    $0x10,%esp
  109167:	3b bd bc fe ff ff    	cmp    -0x144(%ebp),%edi
  10916d:	75 d1                	jne    109140 <debugger_run+0xfd0>
  10916f:	83 ec 0c             	sub    $0xc,%esp
  109172:	8b bd c4 fe ff ff    	mov    -0x13c(%ebp),%edi
  109178:	68 f2 c6 10 00       	push   $0x10c6f2
  10917d:	e8 8e 7a ff ff       	call   100c10 <terminal_writestring>
  109182:	83 85 b8 fe ff ff 10 	addl   $0x10,-0x148(%ebp)
  109189:	83 c4 10             	add    $0x10,%esp
  10918c:	39 b5 bc fe ff ff    	cmp    %esi,-0x144(%ebp)
  109192:	0f 83 08 f0 ff ff    	jae    1081a0 <debugger_run+0x30>
  109198:	8b 85 bc fe ff ff    	mov    -0x144(%ebp),%eax
  10919e:	83 c0 10             	add    $0x10,%eax
  1091a1:	89 85 bc fe ff ff    	mov    %eax,-0x144(%ebp)
  1091a7:	e9 27 fe ff ff       	jmp    108fd3 <debugger_run+0xe63>
  1091ac:	80 fa 68             	cmp    $0x68,%dl
  1091af:	bb b0 c5 10 00       	mov    $0x10c5b0,%ebx
  1091b4:	b9 bb c5 10 00       	mov    $0x10c5bb,%ecx
  1091b9:	b8 02 00 00 00       	mov    $0x2,%eax
  1091be:	0f 44 cb             	cmove  %ebx,%ecx
  1091c1:	bb 05 00 00 00       	mov    $0x5,%ebx
  1091c6:	0f 44 c3             	cmove  %ebx,%eax
  1091c9:	8b b5 c4 fe ff ff    	mov    -0x13c(%ebp),%esi
  1091cf:	8b 9d c0 fe ff ff    	mov    -0x140(%ebp),%ebx
  1091d5:	88 95 b8 fe ff ff    	mov    %dl,-0x148(%ebp)
  1091db:	89 8d b4 fe ff ff    	mov    %ecx,-0x14c(%ebp)
  1091e1:	29 f3                	sub    %esi,%ebx
  1091e3:	39 c3                	cmp    %eax,%ebx
  1091e5:	0f 46 c3             	cmovbe %ebx,%eax
  1091e8:	89 f3                	mov    %esi,%ebx
  1091ea:	89 85 bc fe ff ff    	mov    %eax,-0x144(%ebp)
  1091f0:	8d 34 30             	lea    (%eax,%esi,1),%esi
  1091f3:	eb 26                	jmp    10921b <debugger_run+0x10ab>
  1091f5:	8d 76 00             	lea    0x0(%esi),%esi
  1091f8:	83 ec 0c             	sub    $0xc,%esp
  1091fb:	83 c3 01             	add    $0x1,%ebx
  1091fe:	57                   	push   %edi
  1091ff:	e8 0c 7a ff ff       	call   100c10 <terminal_writestring>
  109204:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10920b:	e8 a0 78 ff ff       	call   100ab0 <terminal_putchar>
  109210:	83 c4 10             	add    $0x10,%esp
  109213:	39 f3                	cmp    %esi,%ebx
  109215:	0f 84 bb 00 00 00    	je     1092d6 <debugger_run+0x1166>
  10921b:	0f b6 13             	movzbl (%ebx),%edx
  10921e:	83 ec 04             	sub    $0x4,%esp
  109221:	6a 10                	push   $0x10
  109223:	57                   	push   %edi
  109224:	52                   	push   %edx
  109225:	e8 06 77 ff ff       	call   100930 <itoa>
  10922a:	0f b6 13             	movzbl (%ebx),%edx
  10922d:	83 c4 10             	add    $0x10,%esp
  109230:	80 fa 0f             	cmp    $0xf,%dl
  109233:	77 c3                	ja     1091f8 <debugger_run+0x1088>
  109235:	83 ec 0c             	sub    $0xc,%esp
  109238:	6a 30                	push   $0x30
  10923a:	e8 71 78 ff ff       	call   100ab0 <terminal_putchar>
  10923f:	83 c4 10             	add    $0x10,%esp
  109242:	eb b4                	jmp    1091f8 <debugger_run+0x1088>
  109244:	83 ec 0c             	sub    $0xc,%esp
  109247:	68 a8 d5 10 00       	push   $0x10d5a8
  10924c:	e8 bf 79 ff ff       	call   100c10 <terminal_writestring>
  109251:	83 c4 10             	add    $0x10,%esp
  109254:	e9 47 ef ff ff       	jmp    1081a0 <debugger_run+0x30>
  109259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  109260:	83 ec 0c             	sub    $0xc,%esp
  109263:	6a 30                	push   $0x30
  109265:	e8 46 78 ff ff       	call   100ab0 <terminal_putchar>
  10926a:	83 c4 10             	add    $0x10,%esp
  10926d:	e9 49 fe ff ff       	jmp    1090bb <debugger_run+0xf4b>
  109272:	83 e8 30             	sub    $0x30,%eax
  109275:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  10927b:	0f be 42 01          	movsbl 0x1(%edx),%eax
  10927f:	8d 48 d0             	lea    -0x30(%eax),%ecx
  109282:	80 f9 09             	cmp    $0x9,%cl
  109285:	0f 87 a7 fb ff ff    	ja     108e32 <debugger_run+0xcc2>
  10928b:	83 e8 30             	sub    $0x30,%eax
  10928e:	e9 ba fb ff ff       	jmp    108e4d <debugger_run+0xcdd>
  109293:	0f b6 85 c4 fe ff ff 	movzbl -0x13c(%ebp),%eax
  10929a:	83 c2 01             	add    $0x1,%edx
  10929d:	e9 ba fb ff ff       	jmp    108e5c <debugger_run+0xcec>
  1092a2:	83 e8 57             	sub    $0x57,%eax
  1092a5:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  1092ab:	e9 72 fb ff ff       	jmp    108e22 <debugger_run+0xcb2>
  1092b0:	83 e8 57             	sub    $0x57,%eax
  1092b3:	e9 95 fb ff ff       	jmp    108e4d <debugger_run+0xcdd>
  1092b8:	8b 9d e8 fe ff ff    	mov    -0x118(%ebp),%ebx
  1092be:	0f b6 03             	movzbl (%ebx),%eax
  1092c1:	83 e8 3f             	sub    $0x3f,%eax
  1092c4:	3c 36                	cmp    $0x36,%al
  1092c6:	0f 87 a0 ef ff ff    	ja     10826c <debugger_run+0xfc>
  1092cc:	0f b6 c0             	movzbl %al,%eax
  1092cf:	ff 24 85 7c b4 10 00 	jmp    *0x10b47c(,%eax,4)
  1092d6:	8b 9d bc fe ff ff    	mov    -0x144(%ebp),%ebx
  1092dc:	0f b6 95 b8 fe ff ff 	movzbl -0x148(%ebp),%edx
  1092e3:	89 b5 b0 fe ff ff    	mov    %esi,-0x150(%ebp)
  1092e9:	89 de                	mov    %ebx,%esi
  1092eb:	89 d3                	mov    %edx,%ebx
  1092ed:	8d 76 00             	lea    0x0(%esi),%esi
  1092f0:	83 ec 0c             	sub    $0xc,%esp
  1092f3:	83 c6 01             	add    $0x1,%esi
  1092f6:	68 a3 b9 10 00       	push   $0x10b9a3
  1092fb:	e8 10 79 ff ff       	call   100c10 <terminal_writestring>
  109300:	83 c4 10             	add    $0x10,%esp
  109303:	83 fe 0a             	cmp    $0xa,%esi
  109306:	75 e8                	jne    1092f0 <debugger_run+0x1180>
  109308:	8b 8d b4 fe ff ff    	mov    -0x14c(%ebp),%ecx
  10930e:	83 ec 0c             	sub    $0xc,%esp
  109311:	88 9d b8 fe ff ff    	mov    %bl,-0x148(%ebp)
  109317:	8b b5 b0 fe ff ff    	mov    -0x150(%ebp),%esi
  10931d:	51                   	push   %ecx
  10931e:	e8 ed 78 ff ff       	call   100c10 <terminal_writestring>
  109323:	0f b6 95 b8 fe ff ff 	movzbl -0x148(%ebp),%edx
  10932a:	83 c4 10             	add    $0x10,%esp
  10932d:	8d 42 90             	lea    -0x70(%edx),%eax
  109330:	3c 0f                	cmp    $0xf,%al
  109332:	77 5f                	ja     109393 <debugger_run+0x1223>
  109334:	83 bd bc fe ff ff 02 	cmpl   $0x2,-0x144(%ebp)
  10933b:	0f 84 c3 00 00 00    	je     109404 <debugger_run+0x1294>
  109341:	83 ec 0c             	sub    $0xc,%esp
  109344:	68 a9 bf 10 00       	push   $0x10bfa9
  109349:	e8 c2 78 ff ff       	call   100c10 <terminal_writestring>
  10934e:	83 c4 10             	add    $0x10,%esp
  109351:	3b b5 c0 fe ff ff    	cmp    -0x140(%ebp),%esi
  109357:	0f 83 43 ee ff ff    	jae    1081a0 <debugger_run+0x30>
  10935d:	89 b5 c4 fe ff ff    	mov    %esi,-0x13c(%ebp)
  109363:	e9 ca f5 ff ff       	jmp    108932 <debugger_run+0x7c2>
  109368:	31 c0                	xor    %eax,%eax
  10936a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  109370:	3a 90 80 b6 10 00    	cmp    0x10b680(%eax),%dl
  109376:	0f 84 d1 00 00 00    	je     10944d <debugger_run+0x12dd>
  10937c:	83 c0 01             	add    $0x1,%eax
  10937f:	83 f8 21             	cmp    $0x21,%eax
  109382:	75 ec                	jne    109370 <debugger_run+0x1200>
  109384:	b9 a2 c5 10 00       	mov    $0x10c5a2,%ecx
  109389:	b8 01 00 00 00       	mov    $0x1,%eax
  10938e:	e9 36 fe ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109393:	80 fa eb             	cmp    $0xeb,%dl
  109396:	74 6c                	je     109404 <debugger_run+0x1294>
  109398:	83 bd bc fe ff ff 05 	cmpl   $0x5,-0x144(%ebp)
  10939f:	0f 94 c0             	sete   %al
  1093a2:	80 fa e8             	cmp    $0xe8,%dl
  1093a5:	0f 85 a2 06 00 00    	jne    109a4d <debugger_run+0x18dd>
  1093ab:	84 c0                	test   %al,%al
  1093ad:	0f 84 9a 06 00 00    	je     109a4d <debugger_run+0x18dd>
  1093b3:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  1093b9:	83 c0 01             	add    $0x1,%eax
  1093bc:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  1093c2:	0f 83 79 ff ff ff    	jae    109341 <debugger_run+0x11d1>
  1093c8:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  1093ce:	83 ec 0c             	sub    $0xc,%esp
  1093d1:	8b 58 01             	mov    0x1(%eax),%ebx
  1093d4:	68 dd be 10 00       	push   $0x10bedd
  1093d9:	e8 32 78 ff ff       	call   100c10 <terminal_writestring>
  1093de:	83 c4 0c             	add    $0xc,%esp
  1093e1:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  1093e7:	6a 10                	push   $0x10
  1093e9:	57                   	push   %edi
  1093ea:	8d 44 18 05          	lea    0x5(%eax,%ebx,1),%eax
  1093ee:	50                   	push   %eax
  1093ef:	e8 3c 75 ff ff       	call   100930 <itoa>
  1093f4:	89 3c 24             	mov    %edi,(%esp)
  1093f7:	e8 14 78 ff ff       	call   100c10 <terminal_writestring>
  1093fc:	83 c4 10             	add    $0x10,%esp
  1093ff:	e9 3d ff ff ff       	jmp    109341 <debugger_run+0x11d1>
  109404:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  10940a:	83 c0 01             	add    $0x1,%eax
  10940d:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  109413:	0f 83 28 ff ff ff    	jae    109341 <debugger_run+0x11d1>
  109419:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  10941f:	83 ec 0c             	sub    $0xc,%esp
  109422:	0f be 58 01          	movsbl 0x1(%eax),%ebx
  109426:	68 dd be 10 00       	push   $0x10bedd
  10942b:	e8 e0 77 ff ff       	call   100c10 <terminal_writestring>
  109430:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  109436:	83 c4 0c             	add    $0xc,%esp
  109439:	6a 10                	push   $0x10
  10943b:	8d 44 18 02          	lea    0x2(%eax,%ebx,1),%eax
  10943f:	57                   	push   %edi
  109440:	eb ac                	jmp    1093ee <debugger_run+0x127e>
  109442:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  109448:	e9 bc ed ff ff       	jmp    108209 <debugger_run+0x99>
  10944d:	8b 0c 85 e0 b5 10 00 	mov    0x10b5e0(,%eax,4),%ecx
  109454:	b8 01 00 00 00       	mov    $0x1,%eax
  109459:	e9 6b fd ff ff       	jmp    1091c9 <debugger_run+0x1059>
  10945e:	31 c0                	xor    %eax,%eax
  109460:	3a 90 b4 b5 10 00    	cmp    0x10b5b4(%eax),%dl
  109466:	74 7f                	je     1094e7 <debugger_run+0x1377>
  109468:	83 c0 01             	add    $0x1,%eax
  10946b:	83 f8 15             	cmp    $0x15,%eax
  10946e:	75 f0                	jne    109460 <debugger_run+0x12f0>
  109470:	b9 a2 c5 10 00       	mov    $0x10c5a2,%ecx
  109475:	b8 02 00 00 00       	mov    $0x2,%eax
  10947a:	e9 4a fd ff ff       	jmp    1091c9 <debugger_run+0x1059>
  10947f:	80 fa e9             	cmp    $0xe9,%dl
  109482:	0f 85 fc fe ff ff    	jne    109384 <debugger_run+0x1214>
  109488:	b9 c5 c5 10 00       	mov    $0x10c5c5,%ecx
  10948d:	b8 05 00 00 00       	mov    $0x5,%eax
  109492:	e9 32 fd ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109497:	b9 a5 c5 10 00       	mov    $0x10c5a5,%ecx
  10949c:	b8 05 00 00 00       	mov    $0x5,%eax
  1094a1:	e9 23 fd ff ff       	jmp    1091c9 <debugger_run+0x1059>
  1094a6:	83 ec 0c             	sub    $0xc,%esp
  1094a9:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%ebp)
  1094af:	68 dc be 10 00       	push   $0x10bedc
  1094b4:	e8 57 77 ff ff       	call   100c10 <terminal_writestring>
  1094b9:	83 c4 0c             	add    $0xc,%esp
  1094bc:	6a 10                	push   $0x10
  1094be:	57                   	push   %edi
  1094bf:	56                   	push   %esi
  1094c0:	e8 6b 74 ff ff       	call   100930 <itoa>
  1094c5:	89 3c 24             	mov    %edi,(%esp)
  1094c8:	e8 43 77 ff ff       	call   100c10 <terminal_writestring>
  1094cd:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  1094d4:	e8 37 77 ff ff       	call   100c10 <terminal_writestring>
  1094d9:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  1094df:	83 c4 10             	add    $0x10,%esp
  1094e2:	e9 04 f6 ff ff       	jmp    108aeb <debugger_run+0x97b>
  1094e7:	8b 0c 85 60 b5 10 00 	mov    0x10b560(,%eax,4),%ecx
  1094ee:	b8 02 00 00 00       	mov    $0x2,%eax
  1094f3:	e9 d1 fc ff ff       	jmp    1091c9 <debugger_run+0x1059>
  1094f8:	b9 ef bb 10 00       	mov    $0x10bbef,%ecx
  1094fd:	b8 02 00 00 00       	mov    $0x2,%eax
  109502:	e9 c2 fc ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109507:	83 ec 0c             	sub    $0xc,%esp
  10950a:	6a 30                	push   $0x30
  10950c:	e8 9f 75 ff ff       	call   100ab0 <terminal_putchar>
  109511:	83 c4 10             	add    $0x10,%esp
  109514:	e9 46 f7 ff ff       	jmp    108c5f <debugger_run+0xaef>
  109519:	83 ec 0c             	sub    $0xc,%esp
  10951c:	6a 30                	push   $0x30
  10951e:	e8 8d 75 ff ff       	call   100ab0 <terminal_putchar>
  109523:	83 c4 10             	add    $0x10,%esp
  109526:	e9 fc f6 ff ff       	jmp    108c27 <debugger_run+0xab7>
  10952b:	e8 40 b4 ff ff       	call   104970 <memory_map_dump>
  109530:	e9 6b ec ff ff       	jmp    1081a0 <debugger_run+0x30>
  109535:	83 ec 08             	sub    $0x8,%esp
  109538:	68 14 c7 10 00       	push   $0x10c714
  10953d:	53                   	push   %ebx
  10953e:	e8 2d 71 ff ff       	call   100670 <strcmp>
  109543:	83 c4 10             	add    $0x10,%esp
  109546:	85 c0                	test   %eax,%eax
  109548:	0f 84 45 f9 ff ff    	je     108e93 <debugger_run+0xd23>
  10954e:	83 ec 08             	sub    $0x8,%esp
  109551:	68 17 c7 10 00       	push   $0x10c717
  109556:	53                   	push   %ebx
  109557:	e8 14 71 ff ff       	call   100670 <strcmp>
  10955c:	83 c4 10             	add    $0x10,%esp
  10955f:	85 c0                	test   %eax,%eax
  109561:	0f 84 23 f9 ff ff    	je     108e8a <debugger_run+0xd1a>
  109567:	83 ec 08             	sub    $0x8,%esp
  10956a:	68 5f c7 10 00       	push   $0x10c75f
  10956f:	53                   	push   %ebx
  109570:	e8 fb 70 ff ff       	call   100670 <strcmp>
  109575:	83 c4 10             	add    $0x10,%esp
  109578:	85 c0                	test   %eax,%eax
  10957a:	74 19                	je     109595 <debugger_run+0x1425>
  10957c:	83 ec 08             	sub    $0x8,%esp
  10957f:	68 73 c7 10 00       	push   $0x10c773
  109584:	53                   	push   %ebx
  109585:	e8 e6 70 ff ff       	call   100670 <strcmp>
  10958a:	83 c4 10             	add    $0x10,%esp
  10958d:	85 c0                	test   %eax,%eax
  10958f:	0f 85 02 06 00 00    	jne    109b97 <debugger_run+0x1a27>
  109595:	83 ec 0c             	sub    $0xc,%esp
  109598:	bf 00 a2 14 01       	mov    $0x114a200,%edi
  10959d:	8d 9d 28 ff ff ff    	lea    -0xd8(%ebp),%ebx
  1095a3:	31 f6                	xor    %esi,%esi
  1095a5:	68 62 c7 10 00       	push   $0x10c762
  1095aa:	e8 61 76 ff ff       	call   100c10 <terminal_writestring>
  1095af:	83 c4 10             	add    $0x10,%esp
  1095b2:	31 c0                	xor    %eax,%eax
  1095b4:	eb 15                	jmp    1095cb <debugger_run+0x145b>
  1095b6:	66 90                	xchg   %ax,%ax
  1095b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1095bf:	00 
  1095c0:	83 c6 01             	add    $0x1,%esi
  1095c3:	83 c7 0c             	add    $0xc,%edi
  1095c6:	83 fe 10             	cmp    $0x10,%esi
  1095c9:	74 71                	je     10963c <debugger_run+0x14cc>
  1095cb:	80 3f 00             	cmpb   $0x0,(%edi)
  1095ce:	74 f0                	je     1095c0 <debugger_run+0x1450>
  1095d0:	83 ec 0c             	sub    $0xc,%esp
  1095d3:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  1095d9:	83 c7 0c             	add    $0xc,%edi
  1095dc:	68 2b c0 10 00       	push   $0x10c02b
  1095e1:	e8 2a 76 ff ff       	call   100c10 <terminal_writestring>
  1095e6:	83 c4 0c             	add    $0xc,%esp
  1095e9:	6a 0a                	push   $0xa
  1095eb:	53                   	push   %ebx
  1095ec:	56                   	push   %esi
  1095ed:	83 c6 01             	add    $0x1,%esi
  1095f0:	e8 3b 73 ff ff       	call   100930 <itoa>
  1095f5:	89 1c 24             	mov    %ebx,(%esp)
  1095f8:	e8 13 76 ff ff       	call   100c10 <terminal_writestring>
  1095fd:	c7 04 24 76 c7 10 00 	movl   $0x10c776,(%esp)
  109604:	e8 07 76 ff ff       	call   100c10 <terminal_writestring>
  109609:	83 c4 0c             	add    $0xc,%esp
  10960c:	6a 10                	push   $0x10
  10960e:	53                   	push   %ebx
  10960f:	ff 77 f8             	push   -0x8(%edi)
  109612:	e8 19 73 ff ff       	call   100930 <itoa>
  109617:	89 1c 24             	mov    %ebx,(%esp)
  10961a:	e8 f1 75 ff ff       	call   100c10 <terminal_writestring>
  10961f:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  109626:	e8 e5 75 ff ff       	call   100c10 <terminal_writestring>
  10962b:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  109631:	83 c4 10             	add    $0x10,%esp
  109634:	83 c0 01             	add    $0x1,%eax
  109637:	83 fe 10             	cmp    $0x10,%esi
  10963a:	75 8f                	jne    1095cb <debugger_run+0x145b>
  10963c:	85 c0                	test   %eax,%eax
  10963e:	0f 85 5c eb ff ff    	jne    1081a0 <debugger_run+0x30>
  109644:	83 ec 0c             	sub    $0xc,%esp
  109647:	68 7b c7 10 00       	push   $0x10c77b
  10964c:	e8 bf 75 ff ff       	call   100c10 <terminal_writestring>
  109651:	83 c4 10             	add    $0x10,%esp
  109654:	e9 47 eb ff ff       	jmp    1081a0 <debugger_run+0x30>
  109659:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  10965f:	e8 1c e9 ff ff       	call   107f80 <hex_to_u32>
  109664:	89 85 b8 fe ff ff    	mov    %eax,-0x148(%ebp)
  10966a:	83 fe 02             	cmp    $0x2,%esi
  10966d:	0f 85 71 01 00 00    	jne    1097e4 <debugger_run+0x1674>
  109673:	83 ec 0c             	sub    $0xc,%esp
  109676:	68 a9 bf 10 00       	push   $0x10bfa9
  10967b:	e8 90 75 ff ff       	call   100c10 <terminal_writestring>
  109680:	83 c4 10             	add    $0x10,%esp
  109683:	b8 80 00 00 00       	mov    $0x80,%eax
  109688:	e9 34 f9 ff ff       	jmp    108fc1 <debugger_run+0xe51>
  10968d:	83 ec 0c             	sub    $0xc,%esp
  109690:	68 d0 da 10 00       	push   $0x10dad0
  109695:	e8 76 75 ff ff       	call   100c10 <terminal_writestring>
  10969a:	83 c4 10             	add    $0x10,%esp
  10969d:	e9 fe ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  1096a2:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  1096a8:	e8 d3 e8 ff ff       	call   107f80 <hex_to_u32>
  1096ad:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  1096b3:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  1096b9:	e8 c2 e8 ff ff       	call   107f80 <hex_to_u32>
  1096be:	ba 00 01 00 00       	mov    $0x100,%edx
  1096c3:	39 d0                	cmp    %edx,%eax
  1096c5:	0f 47 c2             	cmova  %edx,%eax
  1096c8:	8b bd c4 fe ff ff    	mov    -0x13c(%ebp),%edi
  1096ce:	83 ec 0c             	sub    $0xc,%esp
  1096d1:	8d 1c 38             	lea    (%eax,%edi,1),%ebx
  1096d4:	89 9d c0 fe ff ff    	mov    %ebx,-0x140(%ebp)
  1096da:	68 a9 bf 10 00       	push   $0x10bfa9
  1096df:	e8 2c 75 ff ff       	call   100c10 <terminal_writestring>
  1096e4:	83 c4 10             	add    $0x10,%esp
  1096e7:	39 df                	cmp    %ebx,%edi
  1096e9:	0f 82 3d f2 ff ff    	jb     10892c <debugger_run+0x7bc>
  1096ef:	e9 ac ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  1096f4:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  1096fa:	e8 81 e8 ff ff       	call   107f80 <hex_to_u32>
  1096ff:	89 c3                	mov    %eax,%ebx
  109701:	e9 d2 f5 ff ff       	jmp    108cd8 <debugger_run+0xb68>
  109706:	83 ec 0c             	sub    $0xc,%esp
  109709:	68 18 db 10 00       	push   $0x10db18
  10970e:	e8 fd 74 ff ff       	call   100c10 <terminal_writestring>
  109713:	83 c4 10             	add    $0x10,%esp
  109716:	e9 85 ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  10971b:	83 ec 0c             	sub    $0xc,%esp
  10971e:	68 f4 da 10 00       	push   $0x10daf4
  109723:	e8 e8 74 ff ff       	call   100c10 <terminal_writestring>
  109728:	83 c4 10             	add    $0x10,%esp
  10972b:	e9 70 ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  109730:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  109736:	e8 45 e8 ff ff       	call   107f80 <hex_to_u32>
  10973b:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
  109741:	b8 20 00 00 00       	mov    $0x20,%eax
  109746:	83 fe 02             	cmp    $0x2,%esi
  109749:	0f 84 79 ff ff ff    	je     1096c8 <debugger_run+0x1558>
  10974f:	e9 5f ff ff ff       	jmp    1096b3 <debugger_run+0x1543>
  109754:	83 ec 0c             	sub    $0xc,%esp
  109757:	68 0f c8 10 00       	push   $0x10c80f
  10975c:	e8 af 74 ff ff       	call   100c10 <terminal_writestring>
  109761:	83 c4 10             	add    $0x10,%esp
  109764:	e9 37 ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  109769:	83 ec 0c             	sub    $0xc,%esp
  10976c:	68 3c db 10 00       	push   $0x10db3c
  109771:	e8 9a 74 ff ff       	call   100c10 <terminal_writestring>
  109776:	83 c4 10             	add    $0x10,%esp
  109779:	e9 22 ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  10977e:	83 ec 0c             	sub    $0xc,%esp
  109781:	68 2f c7 10 00       	push   $0x10c72f
  109786:	e8 85 74 ff ff       	call   100c10 <terminal_writestring>
  10978b:	83 c4 10             	add    $0x10,%esp
  10978e:	e9 0d ea ff ff       	jmp    1081a0 <debugger_run+0x30>
  109793:	83 ec 0c             	sub    $0xc,%esp
  109796:	6a 30                	push   $0x30
  109798:	e8 13 73 ff ff       	call   100ab0 <terminal_putchar>
  10979d:	83 c4 10             	add    $0x10,%esp
  1097a0:	e9 01 f3 ff ff       	jmp    108aa6 <debugger_run+0x936>
  1097a5:	83 ec 0c             	sub    $0xc,%esp
  1097a8:	68 ab c7 10 00       	push   $0x10c7ab
  1097ad:	e8 5e 74 ff ff       	call   100c10 <terminal_writestring>
  1097b2:	83 c4 10             	add    $0x10,%esp
  1097b5:	e9 e6 e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  1097ba:	83 ec 0c             	sub    $0xc,%esp
  1097bd:	68 1a c7 10 00       	push   $0x10c71a
  1097c2:	e8 49 74 ff ff       	call   100c10 <terminal_writestring>
  1097c7:	83 c4 10             	add    $0x10,%esp
  1097ca:	e9 d1 e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  1097cf:	83 ec 0c             	sub    $0xc,%esp
  1097d2:	68 98 c7 10 00       	push   $0x10c798
  1097d7:	e8 34 74 ff ff       	call   100c10 <terminal_writestring>
  1097dc:	83 c4 10             	add    $0x10,%esp
  1097df:	e9 bc e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  1097e4:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  1097ea:	e8 91 e7 ff ff       	call   107f80 <hex_to_u32>
  1097ef:	83 ec 0c             	sub    $0xc,%esp
  1097f2:	68 a9 bf 10 00       	push   $0x10bfa9
  1097f7:	89 c3                	mov    %eax,%ebx
  1097f9:	e8 12 74 ff ff       	call   100c10 <terminal_writestring>
  1097fe:	83 c4 10             	add    $0x10,%esp
  109801:	85 db                	test   %ebx,%ebx
  109803:	0f 84 97 e9 ff ff    	je     1081a0 <debugger_run+0x30>
  109809:	b8 00 04 00 00       	mov    $0x400,%eax
  10980e:	39 c3                	cmp    %eax,%ebx
  109810:	0f 46 c3             	cmovbe %ebx,%eax
  109813:	e9 a9 f7 ff ff       	jmp    108fc1 <debugger_run+0xe51>
  109818:	83 ec 08             	sub    $0x8,%esp
  10981b:	68 4a c8 10 00       	push   $0x10c84a
  109820:	53                   	push   %ebx
  109821:	e8 4a 6e ff ff       	call   100670 <strcmp>
  109826:	83 c4 10             	add    $0x10,%esp
  109829:	85 c0                	test   %eax,%eax
  10982b:	74 38                	je     109865 <debugger_run+0x16f5>
  10982d:	83 ec 08             	sub    $0x8,%esp
  109830:	68 4f c8 10 00       	push   $0x10c84f
  109835:	53                   	push   %ebx
  109836:	e8 35 6e ff ff       	call   100670 <strcmp>
  10983b:	83 c4 10             	add    $0x10,%esp
  10983e:	85 c0                	test   %eax,%eax
  109840:	0f 85 60 01 00 00    	jne    1099a6 <debugger_run+0x1836>
  109846:	e8 a5 c0 ff ff       	call   1058f0 <process_list>
  10984b:	e9 50 e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109850:	83 ec 0c             	sub    $0xc,%esp
  109853:	68 f8 d9 10 00       	push   $0x10d9f8
  109858:	e8 b3 73 ff ff       	call   100c10 <terminal_writestring>
  10985d:	83 c4 10             	add    $0x10,%esp
  109860:	e9 3b e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109865:	e8 66 af ff ff       	call   1047d0 <memory_slab_dump>
  10986a:	e9 31 e9 ff ff       	jmp    1081a0 <debugger_run+0x30>
  10986f:	83 ec 0c             	sub    $0xc,%esp
  109872:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  109878:	68 a9 bf 10 00       	push   $0x10bfa9
  10987d:	e8 8e 73 ff ff       	call   100c10 <terminal_writestring>
  109882:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
  109888:	83 c4 10             	add    $0x10,%esp
  10988b:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%ebp)
  109891:	8b b5 c0 fe ff ff    	mov    -0x140(%ebp),%esi
  109897:	83 ec 04             	sub    $0x4,%esp
  10989a:	6a 10                	push   $0x10
  10989c:	56                   	push   %esi
  10989d:	53                   	push   %ebx
  10989e:	e8 8d 70 ff ff       	call   100930 <itoa>
  1098a3:	89 34 24             	mov    %esi,(%esp)
  1098a6:	e8 05 6d ff ff       	call   1005b0 <strlen>
  1098ab:	83 c4 10             	add    $0x10,%esp
  1098ae:	89 c6                	mov    %eax,%esi
  1098b0:	83 f8 07             	cmp    $0x7,%eax
  1098b3:	7f 15                	jg     1098ca <debugger_run+0x175a>
  1098b5:	83 ec 0c             	sub    $0xc,%esp
  1098b8:	83 c6 01             	add    $0x1,%esi
  1098bb:	6a 30                	push   $0x30
  1098bd:	e8 ee 71 ff ff       	call   100ab0 <terminal_putchar>
  1098c2:	83 c4 10             	add    $0x10,%esp
  1098c5:	83 fe 08             	cmp    $0x8,%esi
  1098c8:	75 eb                	jne    1098b5 <debugger_run+0x1745>
  1098ca:	8b b5 c0 fe ff ff    	mov    -0x140(%ebp),%esi
  1098d0:	83 ec 0c             	sub    $0xc,%esp
  1098d3:	56                   	push   %esi
  1098d4:	e8 37 73 ff ff       	call   100c10 <terminal_writestring>
  1098d9:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  1098e0:	e8 2b 73 ff ff       	call   100c10 <terminal_writestring>
  1098e5:	0f b6 13             	movzbl (%ebx),%edx
  1098e8:	83 c4 0c             	add    $0xc,%esp
  1098eb:	6a 10                	push   $0x10
  1098ed:	56                   	push   %esi
  1098ee:	88 95 c4 fe ff ff    	mov    %dl,-0x13c(%ebp)
  1098f4:	52                   	push   %edx
  1098f5:	e8 36 70 ff ff       	call   100930 <itoa>
  1098fa:	83 c4 10             	add    $0x10,%esp
  1098fd:	80 bd c4 fe ff ff 0f 	cmpb   $0xf,-0x13c(%ebp)
  109904:	76 4d                	jbe    109953 <debugger_run+0x17e3>
  109906:	83 ec 0c             	sub    $0xc,%esp
  109909:	ff b5 c0 fe ff ff    	push   -0x140(%ebp)
  10990f:	e8 fc 72 ff ff       	call   100c10 <terminal_writestring>
  109914:	c7 04 24 a4 b9 10 00 	movl   $0x10b9a4,(%esp)
  10991b:	e8 f0 72 ff ff       	call   100c10 <terminal_writestring>
  109920:	5e                   	pop    %esi
  109921:	58                   	pop    %eax
  109922:	6a 10                	push   $0x10
  109924:	57                   	push   %edi
  109925:	e8 a6 e7 ff ff       	call   1080d0 <debugger_readline>
  10992a:	83 c4 10             	add    $0x10,%esp
  10992d:	85 c0                	test   %eax,%eax
  10992f:	0f 84 6b e8 ff ff    	je     1081a0 <debugger_run+0x30>
  109935:	89 f8                	mov    %edi,%eax
  109937:	e8 44 e6 ff ff       	call   107f80 <hex_to_u32>
  10993c:	80 bd 28 ff ff ff 00 	cmpb   $0x0,-0xd8(%ebp)
  109943:	0f 84 48 ff ff ff    	je     109891 <debugger_run+0x1721>
  109949:	88 03                	mov    %al,(%ebx)
  10994b:	83 c3 01             	add    $0x1,%ebx
  10994e:	e9 3e ff ff ff       	jmp    109891 <debugger_run+0x1721>
  109953:	83 ec 0c             	sub    $0xc,%esp
  109956:	6a 30                	push   $0x30
  109958:	e8 53 71 ff ff       	call   100ab0 <terminal_putchar>
  10995d:	83 c4 10             	add    $0x10,%esp
  109960:	eb a4                	jmp    109906 <debugger_run+0x1796>
  109962:	80 fa 0f             	cmp    $0xf,%dl
  109965:	0f 84 5c 01 00 00    	je     109ac7 <debugger_run+0x1957>
  10996b:	8d 42 c0             	lea    -0x40(%edx),%eax
  10996e:	3c 0f                	cmp    $0xf,%al
  109970:	0f 87 0e fa ff ff    	ja     109384 <debugger_run+0x1214>
  109976:	b8 e4 c5 10 00       	mov    $0x10c5e4,%eax
  10997b:	80 fa 47             	cmp    $0x47,%dl
  10997e:	b9 ec c5 10 00       	mov    $0x10c5ec,%ecx
  109983:	0f 46 c8             	cmovbe %eax,%ecx
  109986:	b8 01 00 00 00       	mov    $0x1,%eax
  10998b:	e9 39 f8 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109990:	3c 80                	cmp    $0x80,%al
  109992:	b9 cf c5 10 00       	mov    $0x10c5cf,%ecx
  109997:	0f 95 c0             	setne  %al
  10999a:	0f b6 c0             	movzbl %al,%eax
  10999d:	8d 44 40 03          	lea    0x3(%eax,%eax,2),%eax
  1099a1:	e9 23 f8 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  1099a6:	83 ec 08             	sub    $0x8,%esp
  1099a9:	68 52 c8 10 00       	push   $0x10c852
  1099ae:	53                   	push   %ebx
  1099af:	e8 bc 6c ff ff       	call   100670 <strcmp>
  1099b4:	83 c4 10             	add    $0x10,%esp
  1099b7:	85 c0                	test   %eax,%eax
  1099b9:	0f 84 db 00 00 00    	je     109a9a <debugger_run+0x192a>
  1099bf:	83 ec 08             	sub    $0x8,%esp
  1099c2:	68 56 c8 10 00       	push   $0x10c856
  1099c7:	53                   	push   %ebx
  1099c8:	e8 a3 6c ff ff       	call   100670 <strcmp>
  1099cd:	83 c4 10             	add    $0x10,%esp
  1099d0:	85 c0                	test   %eax,%eax
  1099d2:	0f 85 cc 00 00 00    	jne    109aa4 <debugger_run+0x1934>
  1099d8:	e8 13 95 ff ff       	call   102ef0 <dma_dump_status>
  1099dd:	e9 be e7 ff ff       	jmp    1081a0 <debugger_run+0x30>
  1099e2:	31 c0                	xor    %eax,%eax
  1099e4:	e9 12 f1 ff ff       	jmp    108afb <debugger_run+0x98b>
  1099e9:	8b 9d c4 fe ff ff    	mov    -0x13c(%ebp),%ebx
  1099ef:	b8 02 00 00 00       	mov    $0x2,%eax
  1099f4:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1099f7:	3b 8d c0 fe ff ff    	cmp    -0x140(%ebp),%ecx
  1099fd:	73 1d                	jae    109a1c <debugger_run+0x18ac>
  1099ff:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  109a03:	b8 03 00 00 00       	mov    $0x3,%eax
  109a08:	c0 e9 06             	shr    $0x6,%cl
  109a0b:	80 f9 01             	cmp    $0x1,%cl
  109a0e:	74 0c                	je     109a1c <debugger_run+0x18ac>
  109a10:	31 c0                	xor    %eax,%eax
  109a12:	80 f9 02             	cmp    $0x2,%cl
  109a15:	0f 94 c0             	sete   %al
  109a18:	8d 44 00 02          	lea    0x2(%eax,%eax,1),%eax
  109a1c:	b9 20 c6 10 00       	mov    $0x10c620,%ecx
  109a21:	80 fa 89             	cmp    $0x89,%dl
  109a24:	0f 84 9f f7 ff ff    	je     1091c9 <debugger_run+0x1059>
  109a2a:	b9 2c c6 10 00       	mov    $0x10c62c,%ecx
  109a2f:	80 fa 8b             	cmp    $0x8b,%dl
  109a32:	0f 84 91 f7 ff ff    	je     1091c9 <debugger_run+0x1059>
  109a38:	80 fa 88             	cmp    $0x88,%dl
  109a3b:	b9 38 c6 10 00       	mov    $0x10c638,%ecx
  109a40:	bb 12 c6 10 00       	mov    $0x10c612,%ebx
  109a45:	0f 45 cb             	cmovne %ebx,%ecx
  109a48:	e9 7c f7 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109a4d:	80 fa e9             	cmp    $0xe9,%dl
  109a50:	75 08                	jne    109a5a <debugger_run+0x18ea>
  109a52:	84 c0                	test   %al,%al
  109a54:	0f 85 59 f9 ff ff    	jne    1093b3 <debugger_run+0x1243>
  109a5a:	80 fa cd             	cmp    $0xcd,%dl
  109a5d:	0f 85 de f8 ff ff    	jne    109341 <debugger_run+0x11d1>
  109a63:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  109a69:	83 c0 01             	add    $0x1,%eax
  109a6c:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  109a72:	0f 83 c9 f8 ff ff    	jae    109341 <debugger_run+0x11d1>
  109a78:	83 ec 0c             	sub    $0xc,%esp
  109a7b:	68 dd be 10 00       	push   $0x10bedd
  109a80:	e8 8b 71 ff ff       	call   100c10 <terminal_writestring>
  109a85:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  109a8b:	83 c4 0c             	add    $0xc,%esp
  109a8e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  109a92:	6a 10                	push   $0x10
  109a94:	57                   	push   %edi
  109a95:	e9 54 f9 ff ff       	jmp    1093ee <debugger_run+0x127e>
  109a9a:	e8 b1 71 ff ff       	call   100c50 <terminal_clear>
  109a9f:	e9 fc e6 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109aa4:	83 ec 08             	sub    $0x8,%esp
  109aa7:	68 5a c8 10 00       	push   $0x10c85a
  109aac:	53                   	push   %ebx
  109aad:	e8 be 6b ff ff       	call   100670 <strcmp>
  109ab2:	83 c4 10             	add    $0x10,%esp
  109ab5:	85 c0                	test   %eax,%eax
  109ab7:	0f 85 15 02 00 00    	jne    109cd2 <debugger_run+0x1b62>
  109abd:	e8 be 95 ff ff       	call   103080 <dma_dump_channels>
  109ac2:	e9 d9 e6 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109ac7:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
  109acd:	8d 41 01             	lea    0x1(%ecx),%eax
  109ad0:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  109ad6:	73 45                	jae    109b1d <debugger_run+0x19ad>
  109ad8:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
  109adc:	8d 48 80             	lea    -0x80(%eax),%ecx
  109adf:	80 f9 0f             	cmp    $0xf,%cl
  109ae2:	76 07                	jbe    109aeb <debugger_run+0x197b>
  109ae4:	83 c0 5c             	add    $0x5c,%eax
  109ae7:	3c 01                	cmp    $0x1,%al
  109ae9:	77 32                	ja     109b1d <debugger_run+0x19ad>
  109aeb:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
  109af1:	8d 41 02             	lea    0x2(%ecx),%eax
  109af4:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  109afa:	73 3a                	jae    109b36 <debugger_run+0x19c6>
  109afc:	0f b6 41 02          	movzbl 0x2(%ecx),%eax
  109b00:	b9 db c5 10 00       	mov    $0x10c5db,%ecx
  109b05:	c0 e8 06             	shr    $0x6,%al
  109b08:	3c 01                	cmp    $0x1,%al
  109b0a:	74 20                	je     109b2c <debugger_run+0x19bc>
  109b0c:	3c 02                	cmp    $0x2,%al
  109b0e:	0f 94 c0             	sete   %al
  109b11:	0f b6 c0             	movzbl %al,%eax
  109b14:	8d 44 00 03          	lea    0x3(%eax,%eax,1),%eax
  109b18:	e9 ac f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b1d:	b9 db c5 10 00       	mov    $0x10c5db,%ecx
  109b22:	b8 02 00 00 00       	mov    $0x2,%eax
  109b27:	e9 9d f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b2c:	b8 04 00 00 00       	mov    $0x4,%eax
  109b31:	e9 93 f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b36:	b9 db c5 10 00       	mov    $0x10c5db,%ecx
  109b3b:	b8 03 00 00 00       	mov    $0x3,%eax
  109b40:	e9 84 f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b45:	b9 04 c6 10 00       	mov    $0x10c604,%ecx
  109b4a:	b8 05 00 00 00       	mov    $0x5,%eax
  109b4f:	e9 75 f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b54:	b9 96 c6 10 00       	mov    $0x10c696,%ecx
  109b59:	b8 02 00 00 00       	mov    $0x2,%eax
  109b5e:	e9 66 f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b63:	b8 64 c6 10 00       	mov    $0x10c664,%eax
  109b68:	80 fa a1             	cmp    $0xa1,%dl
  109b6b:	b9 74 c6 10 00       	mov    $0x10c674,%ecx
  109b70:	0f 44 c8             	cmove  %eax,%ecx
  109b73:	b8 05 00 00 00       	mov    $0x5,%eax
  109b78:	e9 4c f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b7d:	b8 46 c6 10 00       	mov    $0x10c646,%eax
  109b82:	80 fa a0             	cmp    $0xa0,%dl
  109b85:	b9 55 c6 10 00       	mov    $0x10c655,%ecx
  109b8a:	0f 44 c8             	cmove  %eax,%ecx
  109b8d:	b8 02 00 00 00       	mov    $0x2,%eax
  109b92:	e9 32 f6 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109b97:	83 fe 01             	cmp    $0x1,%esi
  109b9a:	0f 84 1d 01 00 00    	je     109cbd <debugger_run+0x1b4d>
  109ba0:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  109ba6:	31 f6                	xor    %esi,%esi
  109ba8:	e8 d3 e3 ff ff       	call   107f80 <hex_to_u32>
  109bad:	89 c3                	mov    %eax,%ebx
  109baf:	b8 00 a2 14 01       	mov    $0x114a200,%eax
  109bb4:	80 38 00             	cmpb   $0x0,(%eax)
  109bb7:	0f 84 86 00 00 00    	je     109c43 <debugger_run+0x1ad3>
  109bbd:	83 c6 01             	add    $0x1,%esi
  109bc0:	83 c0 0c             	add    $0xc,%eax
  109bc3:	83 fe 10             	cmp    $0x10,%esi
  109bc6:	75 ec                	jne    109bb4 <debugger_run+0x1a44>
  109bc8:	83 ec 0c             	sub    $0xc,%esp
  109bcb:	68 68 c8 10 00       	push   $0x10c868
  109bd0:	e8 3b 70 ff ff       	call   100c10 <terminal_writestring>
  109bd5:	83 c4 10             	add    $0x10,%esp
  109bd8:	e9 c3 e5 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109bdd:	8d 76 00             	lea    0x0(%esi),%esi
  109be0:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
  109be6:	8d 41 01             	lea    0x1(%ecx),%eax
  109be9:	3b 85 c0 fe ff ff    	cmp    -0x140(%ebp),%eax
  109bef:	73 38                	jae    109c29 <debugger_run+0x1ab9>
  109bf1:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  109bf5:	b8 04 00 00 00       	mov    $0x4,%eax
  109bfa:	c0 e9 06             	shr    $0x6,%cl
  109bfd:	80 f9 01             	cmp    $0x1,%cl
  109c00:	74 0c                	je     109c0e <debugger_run+0x1a9e>
  109c02:	31 c0                	xor    %eax,%eax
  109c04:	80 f9 02             	cmp    $0x2,%cl
  109c07:	0f 94 c0             	sete   %al
  109c0a:	8d 44 00 03          	lea    0x3(%eax,%eax,1),%eax
  109c0e:	8d 58 04             	lea    0x4(%eax),%ebx
  109c11:	80 fa c7             	cmp    $0xc7,%dl
  109c14:	b9 f4 c5 10 00       	mov    $0x10c5f4,%ecx
  109c19:	0f 44 c3             	cmove  %ebx,%eax
  109c1c:	bb 84 c6 10 00       	mov    $0x10c684,%ebx
  109c21:	0f 44 cb             	cmove  %ebx,%ecx
  109c24:	e9 a0 f5 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109c29:	b8 f4 c5 10 00       	mov    $0x10c5f4,%eax
  109c2e:	80 fa c6             	cmp    $0xc6,%dl
  109c31:	b9 84 c6 10 00       	mov    $0x10c684,%ecx
  109c36:	0f 44 c8             	cmove  %eax,%ecx
  109c39:	b8 03 00 00 00       	mov    $0x3,%eax
  109c3e:	e9 86 f5 ff ff       	jmp    1091c9 <debugger_run+0x1059>
  109c43:	0f b6 0b             	movzbl (%ebx),%ecx
  109c46:	8d 04 76             	lea    (%esi,%esi,2),%eax
  109c49:	83 ec 0c             	sub    $0xc,%esp
  109c4c:	8d bd 28 ff ff ff    	lea    -0xd8(%ebp),%edi
  109c52:	89 1c 85 04 a2 14 01 	mov    %ebx,0x114a204(,%eax,4)
  109c59:	88 0c 85 08 a2 14 01 	mov    %cl,0x114a208(,%eax,4)
  109c60:	c6 03 cc             	movb   $0xcc,(%ebx)
  109c63:	c6 04 85 00 a2 14 01 	movb   $0x1,0x114a200(,%eax,4)
  109c6a:	01 
  109c6b:	68 46 c7 10 00       	push   $0x10c746
  109c70:	e8 9b 6f ff ff       	call   100c10 <terminal_writestring>
  109c75:	83 c4 0c             	add    $0xc,%esp
  109c78:	6a 0a                	push   $0xa
  109c7a:	57                   	push   %edi
  109c7b:	56                   	push   %esi
  109c7c:	e8 af 6c ff ff       	call   100930 <itoa>
  109c81:	89 3c 24             	mov    %edi,(%esp)
  109c84:	e8 87 6f ff ff       	call   100c10 <terminal_writestring>
  109c89:	c7 04 24 b2 bf 10 00 	movl   $0x10bfb2,(%esp)
  109c90:	e8 7b 6f ff ff       	call   100c10 <terminal_writestring>
  109c95:	83 c4 0c             	add    $0xc,%esp
  109c98:	6a 10                	push   $0x10
  109c9a:	57                   	push   %edi
  109c9b:	53                   	push   %ebx
  109c9c:	e8 8f 6c ff ff       	call   100930 <itoa>
  109ca1:	89 3c 24             	mov    %edi,(%esp)
  109ca4:	e8 67 6f ff ff       	call   100c10 <terminal_writestring>
  109ca9:	c7 04 24 a9 bf 10 00 	movl   $0x10bfa9,(%esp)
  109cb0:	e8 5b 6f ff ff       	call   100c10 <terminal_writestring>
  109cb5:	83 c4 10             	add    $0x10,%esp
  109cb8:	e9 e3 e4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109cbd:	83 ec 0c             	sub    $0xc,%esp
  109cc0:	68 85 c7 10 00       	push   $0x10c785
  109cc5:	e8 46 6f ff ff       	call   100c10 <terminal_writestring>
  109cca:	83 c4 10             	add    $0x10,%esp
  109ccd:	e9 ce e4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109cd2:	83 ec 08             	sub    $0x8,%esp
  109cd5:	68 60 c8 10 00       	push   $0x10c860
  109cda:	53                   	push   %ebx
  109cdb:	e8 90 69 ff ff       	call   100670 <strcmp>
  109ce0:	83 c4 10             	add    $0x10,%esp
  109ce3:	85 c0                	test   %eax,%eax
  109ce5:	75 0a                	jne    109cf1 <debugger_run+0x1b81>
  109ce7:	e8 b4 95 ff ff       	call   1032a0 <dma_demo>
  109cec:	e9 af e4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109cf1:	83 ec 0c             	sub    $0xc,%esp
  109cf4:	68 5c db 10 00       	push   $0x10db5c
  109cf9:	e8 12 6f ff ff       	call   100c10 <terminal_writestring>
  109cfe:	83 c4 10             	add    $0x10,%esp
  109d01:	e9 9a e4 ff ff       	jmp    1081a0 <debugger_run+0x30>
  109d06:	66 90                	xchg   %ax,%ax
  109d08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109d0f:	00 

00109d10 <debugger_init>:
  109d10:	55                   	push   %ebp
  109d11:	89 e5                	mov    %esp,%ebp
  109d13:	83 ec 10             	sub    $0x10,%esp
  109d16:	68 80 80 10 00       	push   $0x108080
  109d1b:	6a 01                	push   $0x1
  109d1d:	e8 ce 78 ff ff       	call   1015f0 <register_interrupt_handler>
  109d22:	58                   	pop    %eax
  109d23:	5a                   	pop    %edx
  109d24:	68 f0 7f 10 00       	push   $0x107ff0
  109d29:	6a 03                	push   $0x3
  109d2b:	e8 c0 78 ff ff       	call   1015f0 <register_interrupt_handler>
  109d30:	b8 00 a2 14 01       	mov    $0x114a200,%eax
  109d35:	83 c4 10             	add    $0x10,%esp
  109d38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109d3f:	00 
  109d40:	c6 00 00             	movb   $0x0,(%eax)
  109d43:	83 c0 18             	add    $0x18,%eax
  109d46:	c6 40 f4 00          	movb   $0x0,-0xc(%eax)
  109d4a:	3d c0 a2 14 01       	cmp    $0x114a2c0,%eax
  109d4f:	75 ef                	jne    109d40 <debugger_init+0x30>
  109d51:	83 ec 0c             	sub    $0xc,%esp
  109d54:	68 84 db 10 00       	push   $0x10db84
  109d59:	e8 b2 6e ff ff       	call   100c10 <terminal_writestring>
  109d5e:	c7 04 24 c0 db 10 00 	movl   $0x10dbc0,(%esp)
  109d65:	e8 a6 6e ff ff       	call   100c10 <terminal_writestring>
  109d6a:	83 c4 10             	add    $0x10,%esp
  109d6d:	c9                   	leave
  109d6e:	c3                   	ret
  109d6f:	66 90                	xchg   %ax,%ax
  109d71:	66 90                	xchg   %ax,%ax
  109d73:	66 90                	xchg   %ax,%ax
  109d75:	66 90                	xchg   %ax,%ax
  109d77:	66 90                	xchg   %ax,%ax
  109d79:	66 90                	xchg   %ax,%ax
  109d7b:	66 90                	xchg   %ax,%ax
  109d7d:	66 90                	xchg   %ax,%ax
  109d7f:	90                   	nop

00109d80 <sound_tick>:
  109d80:	0f b6 05 d1 a2 14 01 	movzbl 0x114a2d1,%eax
  109d87:	84 c0                	test   %al,%al
  109d89:	74 55                	je     109de0 <sound_tick+0x60>
  109d8b:	a1 cc a2 14 01       	mov    0x114a2cc,%eax
  109d90:	85 c0                	test   %eax,%eax
  109d92:	74 4c                	je     109de0 <sound_tick+0x60>
  109d94:	8b 15 c8 a2 14 01    	mov    0x114a2c8,%edx
  109d9a:	8d 04 90             	lea    (%eax,%edx,4),%eax
  109d9d:	0f b7 10             	movzwl (%eax),%edx
  109da0:	66 85 d2             	test   %dx,%dx
  109da3:	75 43                	jne    109de8 <sound_tick+0x68>
  109da5:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  109da9:	66 85 c0             	test   %ax,%ax
  109dac:	0f 85 9e 00 00 00    	jne    109e50 <sound_tick+0xd0>
  109db2:	0f b6 05 d0 a2 14 01 	movzbl 0x114a2d0,%eax
  109db9:	84 c0                	test   %al,%al
  109dbb:	0f 84 e7 00 00 00    	je     109ea8 <sound_tick+0x128>
  109dc1:	c7 05 c8 a2 14 01 00 	movl   $0x0,0x114a2c8
  109dc8:	00 00 00 
  109dcb:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  109dd2:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109dd9:	00 00 00 
  109ddc:	c3                   	ret
  109ddd:	8d 76 00             	lea    0x0(%esi),%esi
  109de0:	c3                   	ret
  109de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  109de8:	0f b6 0d c0 a2 14 01 	movzbl 0x114a2c0,%ecx
  109def:	84 c9                	test   %cl,%cl
  109df1:	0f 84 89 00 00 00    	je     109e80 <sound_tick+0x100>
  109df7:	8b 15 c4 a2 14 01    	mov    0x114a2c4,%edx
  109dfd:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
  109e02:	83 c2 01             	add    $0x1,%edx
  109e05:	89 15 c4 a2 14 01    	mov    %edx,0x114a2c4
  109e0b:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  109e0f:	8d 42 09             	lea    0x9(%edx),%eax
  109e12:	f7 e1                	mul    %ecx
  109e14:	b8 01 00 00 00       	mov    $0x1,%eax
  109e19:	c1 ea 03             	shr    $0x3,%edx
  109e1c:	75 5c                	jne    109e7a <sound_tick+0xfa>
  109e1e:	8b 15 c4 a2 14 01    	mov    0x114a2c4,%edx
  109e24:	39 c2                	cmp    %eax,%edx
  109e26:	72 b8                	jb     109de0 <sound_tick+0x60>
  109e28:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  109e2f:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109e36:	00 00 00 
  109e39:	a1 c8 a2 14 01       	mov    0x114a2c8,%eax
  109e3e:	83 c0 01             	add    $0x1,%eax
  109e41:	a3 c8 a2 14 01       	mov    %eax,0x114a2c8
  109e46:	c3                   	ret
  109e47:	90                   	nop
  109e48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109e4f:	00 
  109e50:	0f b6 15 c0 a2 14 01 	movzbl 0x114a2c0,%edx
  109e57:	84 d2                	test   %dl,%dl
  109e59:	74 75                	je     109ed0 <sound_tick+0x150>
  109e5b:	8b 15 c4 a2 14 01    	mov    0x114a2c4,%edx
  109e61:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
  109e66:	83 c2 01             	add    $0x1,%edx
  109e69:	89 15 c4 a2 14 01    	mov    %edx,0x114a2c4
  109e6f:	0f b7 d0             	movzwl %ax,%edx
  109e72:	8d 42 09             	lea    0x9(%edx),%eax
  109e75:	f7 e1                	mul    %ecx
  109e77:	c1 ea 03             	shr    $0x3,%edx
  109e7a:	89 d0                	mov    %edx,%eax
  109e7c:	eb a0                	jmp    109e1e <sound_tick+0x9e>
  109e7e:	66 90                	xchg   %ax,%ax
  109e80:	c6 05 c0 a2 14 01 01 	movb   $0x1,0x114a2c0
  109e87:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109e8e:	00 00 00 
  109e91:	0f b6 05 d2 a2 14 01 	movzbl 0x114a2d2,%eax
  109e98:	84 c0                	test   %al,%al
  109e9a:	74 4c                	je     109ee8 <sound_tick+0x168>
  109e9c:	e4 61                	in     $0x61,%al
  109e9e:	83 e0 fc             	and    $0xfffffffc,%eax
  109ea1:	e6 61                	out    %al,$0x61
  109ea3:	c3                   	ret
  109ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  109ea8:	c6 05 d1 a2 14 01 00 	movb   $0x0,0x114a2d1
  109eaf:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  109eb6:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  109ebd:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109ec4:	00 00 00 
  109ec7:	e4 61                	in     $0x61,%al
  109ec9:	83 e0 fc             	and    $0xfffffffc,%eax
  109ecc:	e6 61                	out    %al,$0x61
  109ece:	c3                   	ret
  109ecf:	90                   	nop
  109ed0:	c6 05 c0 a2 14 01 01 	movb   $0x1,0x114a2c0
  109ed7:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109ede:	00 00 00 
  109ee1:	eb b9                	jmp    109e9c <sound_tick+0x11c>
  109ee3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  109ee8:	0f b7 ca             	movzwl %dx,%ecx
  109eeb:	b8 de 34 12 00       	mov    $0x1234de,%eax
  109ef0:	31 d2                	xor    %edx,%edx
  109ef2:	f7 f9                	idiv   %ecx
  109ef4:	89 c1                	mov    %eax,%ecx
  109ef6:	b8 b6 ff ff ff       	mov    $0xffffffb6,%eax
  109efb:	e6 43                	out    %al,$0x43
  109efd:	89 c8                	mov    %ecx,%eax
  109eff:	e6 42                	out    %al,$0x42
  109f01:	89 c8                	mov    %ecx,%eax
  109f03:	66 c1 e8 08          	shr    $0x8,%ax
  109f07:	e6 42                	out    %al,$0x42
  109f09:	e4 61                	in     $0x61,%al
  109f0b:	a8 03                	test   $0x3,%al
  109f0d:	0f 85 cd fe ff ff    	jne    109de0 <sound_tick+0x60>
  109f13:	83 c8 03             	or     $0x3,%eax
  109f16:	e6 61                	out    %al,$0x61
  109f18:	c3                   	ret
  109f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00109f20 <sound_init>:
  109f20:	55                   	push   %ebp
  109f21:	89 e5                	mov    %esp,%ebp
  109f23:	83 ec 14             	sub    $0x14,%esp
  109f26:	68 e0 c9 10 00       	push   $0x10c9e0
  109f2b:	e8 e0 6c ff ff       	call   100c10 <terminal_writestring>
  109f30:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  109f37:	c7 05 cc a2 14 01 00 	movl   $0x0,0x114a2cc
  109f3e:	00 00 00 
  109f41:	c6 05 d2 a2 14 01 00 	movb   $0x0,0x114a2d2
  109f48:	c6 05 2c e0 10 00 64 	movb   $0x64,0x10e02c
  109f4f:	c6 05 d1 a2 14 01 00 	movb   $0x0,0x114a2d1
  109f56:	c6 05 d0 a2 14 01 00 	movb   $0x0,0x114a2d0
  109f5d:	c7 05 c8 a2 14 01 00 	movl   $0x0,0x114a2c8
  109f64:	00 00 00 
  109f67:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  109f6e:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  109f75:	00 00 00 
  109f78:	e4 61                	in     $0x61,%al
  109f7a:	83 e0 fc             	and    $0xfffffffc,%eax
  109f7d:	e6 61                	out    %al,$0x61
  109f7f:	c7 04 24 fc c9 10 00 	movl   $0x10c9fc,(%esp)
  109f86:	e8 85 6c ff ff       	call   100c10 <terminal_writestring>
  109f8b:	c7 04 24 f0 db 10 00 	movl   $0x10dbf0,(%esp)
  109f92:	e8 79 6c ff ff       	call   100c10 <terminal_writestring>
  109f97:	c7 04 24 15 ca 10 00 	movl   $0x10ca15,(%esp)
  109f9e:	e8 6d 6c ff ff       	call   100c10 <terminal_writestring>
  109fa3:	83 c4 10             	add    $0x10,%esp
  109fa6:	c9                   	leave
  109fa7:	c3                   	ret
  109fa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109faf:	00 

00109fb0 <sound_beep_on>:
  109fb0:	55                   	push   %ebp
  109fb1:	89 e5                	mov    %esp,%ebp
  109fb3:	8b 45 08             	mov    0x8(%ebp),%eax
  109fb6:	66 85 c0             	test   %ax,%ax
  109fb9:	74 0b                	je     109fc6 <sound_beep_on+0x16>
  109fbb:	0f b6 15 d2 a2 14 01 	movzbl 0x114a2d2,%edx
  109fc2:	84 d2                	test   %dl,%dl
  109fc4:	74 1a                	je     109fe0 <sound_beep_on+0x30>
  109fc6:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  109fcd:	e4 61                	in     $0x61,%al
  109fcf:	83 e0 fc             	and    $0xfffffffc,%eax
  109fd2:	e6 61                	out    %al,$0x61
  109fd4:	5d                   	pop    %ebp
  109fd5:	c3                   	ret
  109fd6:	66 90                	xchg   %ax,%ax
  109fd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109fdf:	00 
  109fe0:	0f b7 c8             	movzwl %ax,%ecx
  109fe3:	31 d2                	xor    %edx,%edx
  109fe5:	b8 de 34 12 00       	mov    $0x1234de,%eax
  109fea:	c6 05 d3 a2 14 01 01 	movb   $0x1,0x114a2d3
  109ff1:	f7 f9                	idiv   %ecx
  109ff3:	89 c1                	mov    %eax,%ecx
  109ff5:	b8 b6 ff ff ff       	mov    $0xffffffb6,%eax
  109ffa:	e6 43                	out    %al,$0x43
  109ffc:	89 c8                	mov    %ecx,%eax
  109ffe:	e6 42                	out    %al,$0x42
  10a000:	89 c8                	mov    %ecx,%eax
  10a002:	66 c1 e8 08          	shr    $0x8,%ax
  10a006:	e6 42                	out    %al,$0x42
  10a008:	e4 61                	in     $0x61,%al
  10a00a:	a8 03                	test   $0x3,%al
  10a00c:	75 c6                	jne    109fd4 <sound_beep_on+0x24>
  10a00e:	83 c8 03             	or     $0x3,%eax
  10a011:	e6 61                	out    %al,$0x61
  10a013:	5d                   	pop    %ebp
  10a014:	c3                   	ret
  10a015:	8d 76 00             	lea    0x0(%esi),%esi
  10a018:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a01f:	00 

0010a020 <sound_beep_off>:
  10a020:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  10a027:	e4 61                	in     $0x61,%al
  10a029:	83 e0 fc             	and    $0xfffffffc,%eax
  10a02c:	e6 61                	out    %al,$0x61
  10a02e:	c3                   	ret
  10a02f:	90                   	nop

0010a030 <sound_play_tone>:
  10a030:	55                   	push   %ebp
  10a031:	89 e5                	mov    %esp,%ebp
  10a033:	56                   	push   %esi
  10a034:	be cd cc cc cc       	mov    $0xcccccccd,%esi
  10a039:	53                   	push   %ebx
  10a03a:	83 ec 10             	sub    $0x10,%esp
  10a03d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10a040:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10a043:	0f b7 d3             	movzwl %bx,%edx
  10a046:	8d 42 09             	lea    0x9(%edx),%eax
  10a049:	f7 e6                	mul    %esi
  10a04b:	c1 ea 03             	shr    $0x3,%edx
  10a04e:	89 d6                	mov    %edx,%esi
  10a050:	66 85 c9             	test   %cx,%cx
  10a053:	74 0b                	je     10a060 <sound_play_tone+0x30>
  10a055:	0f b6 05 d2 a2 14 01 	movzbl 0x114a2d2,%eax
  10a05c:	84 c0                	test   %al,%al
  10a05e:	74 61                	je     10a0c1 <sound_play_tone+0x91>
  10a060:	31 c9                	xor    %ecx,%ecx
  10a062:	85 f6                	test   %esi,%esi
  10a064:	74 54                	je     10a0ba <sound_play_tone+0x8a>
  10a066:	66 90                	xchg   %ax,%ax
  10a068:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a06f:	00 
  10a070:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10a077:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10a07a:	3d 9f 86 01 00       	cmp    $0x1869f,%eax
  10a07f:	77 32                	ja     10a0b3 <sound_play_tone+0x83>
  10a081:	eb 1d                	jmp    10a0a0 <sound_play_tone+0x70>
  10a083:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a088:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a08f:	00 
  10a090:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a097:	00 
  10a098:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a09f:	00 
  10a0a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10a0a3:	83 c0 01             	add    $0x1,%eax
  10a0a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10a0a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10a0ac:	3d 9f 86 01 00       	cmp    $0x1869f,%eax
  10a0b1:	76 ed                	jbe    10a0a0 <sound_play_tone+0x70>
  10a0b3:	83 c1 01             	add    $0x1,%ecx
  10a0b6:	39 f1                	cmp    %esi,%ecx
  10a0b8:	75 b6                	jne    10a070 <sound_play_tone+0x40>
  10a0ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10a0bd:	5b                   	pop    %ebx
  10a0be:	5e                   	pop    %esi
  10a0bf:	5d                   	pop    %ebp
  10a0c0:	c3                   	ret
  10a0c1:	83 ec 0c             	sub    $0xc,%esp
  10a0c4:	0f b7 c9             	movzwl %cx,%ecx
  10a0c7:	51                   	push   %ecx
  10a0c8:	e8 e3 fe ff ff       	call   109fb0 <sound_beep_on>
  10a0cd:	83 c4 10             	add    $0x10,%esp
  10a0d0:	31 c9                	xor    %ecx,%ecx
  10a0d2:	66 85 db             	test   %bx,%bx
  10a0d5:	74 43                	je     10a11a <sound_play_tone+0xea>
  10a0d7:	90                   	nop
  10a0d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a0df:	00 
  10a0e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10a0e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10a0ea:	3d 9f 86 01 00       	cmp    $0x1869f,%eax
  10a0ef:	77 22                	ja     10a113 <sound_play_tone+0xe3>
  10a0f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10a0f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a0ff:	00 
  10a100:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10a103:	83 c0 01             	add    $0x1,%eax
  10a106:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10a109:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10a10c:	3d 9f 86 01 00       	cmp    $0x1869f,%eax
  10a111:	76 ed                	jbe    10a100 <sound_play_tone+0xd0>
  10a113:	83 c1 01             	add    $0x1,%ecx
  10a116:	39 f1                	cmp    %esi,%ecx
  10a118:	72 c6                	jb     10a0e0 <sound_play_tone+0xb0>
  10a11a:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  10a121:	e4 61                	in     $0x61,%al
  10a123:	83 e0 fc             	and    $0xfffffffc,%eax
  10a126:	e6 61                	out    %al,$0x61
  10a128:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10a12b:	5b                   	pop    %ebx
  10a12c:	5e                   	pop    %esi
  10a12d:	5d                   	pop    %ebp
  10a12e:	c3                   	ret
  10a12f:	90                   	nop

0010a130 <sound_play_melody>:
  10a130:	55                   	push   %ebp
  10a131:	89 e5                	mov    %esp,%ebp
  10a133:	8b 55 08             	mov    0x8(%ebp),%edx
  10a136:	85 d2                	test   %edx,%edx
  10a138:	74 4f                	je     10a189 <sound_play_melody+0x59>
  10a13a:	0f b6 05 d1 a2 14 01 	movzbl 0x114a2d1,%eax
  10a141:	84 c0                	test   %al,%al
  10a143:	74 0e                	je     10a153 <sound_play_melody+0x23>
  10a145:	c6 05 d1 a2 14 01 00 	movb   $0x0,0x114a2d1
  10a14c:	e4 61                	in     $0x61,%al
  10a14e:	83 e0 fc             	and    $0xfffffffc,%eax
  10a151:	e6 61                	out    %al,$0x61
  10a153:	c7 05 c8 a2 14 01 00 	movl   $0x0,0x114a2c8
  10a15a:	00 00 00 
  10a15d:	89 15 cc a2 14 01    	mov    %edx,0x114a2cc
  10a163:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  10a16a:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  10a171:	00 00 00 
  10a174:	c6 05 d0 a2 14 01 00 	movb   $0x0,0x114a2d0
  10a17b:	c6 05 d1 a2 14 01 01 	movb   $0x1,0x114a2d1
  10a182:	c6 05 d3 a2 14 01 01 	movb   $0x1,0x114a2d3
  10a189:	5d                   	pop    %ebp
  10a18a:	c3                   	ret
  10a18b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

0010a190 <sound_stop_melody>:
  10a190:	c6 05 d1 a2 14 01 00 	movb   $0x0,0x114a2d1
  10a197:	c7 05 cc a2 14 01 00 	movl   $0x0,0x114a2cc
  10a19e:	00 00 00 
  10a1a1:	c6 05 d3 a2 14 01 00 	movb   $0x0,0x114a2d3
  10a1a8:	c6 05 d0 a2 14 01 00 	movb   $0x0,0x114a2d0
  10a1af:	c7 05 c8 a2 14 01 00 	movl   $0x0,0x114a2c8
  10a1b6:	00 00 00 
  10a1b9:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  10a1c0:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  10a1c7:	00 00 00 
  10a1ca:	e4 61                	in     $0x61,%al
  10a1cc:	83 e0 fc             	and    $0xfffffffc,%eax
  10a1cf:	e6 61                	out    %al,$0x61
  10a1d1:	c3                   	ret
  10a1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10a1d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a1df:	00 

0010a1e0 <sound_loop_melody>:
  10a1e0:	55                   	push   %ebp
  10a1e1:	89 e5                	mov    %esp,%ebp
  10a1e3:	8b 55 08             	mov    0x8(%ebp),%edx
  10a1e6:	85 d2                	test   %edx,%edx
  10a1e8:	74 4f                	je     10a239 <sound_loop_melody+0x59>
  10a1ea:	0f b6 05 d1 a2 14 01 	movzbl 0x114a2d1,%eax
  10a1f1:	84 c0                	test   %al,%al
  10a1f3:	74 0e                	je     10a203 <sound_loop_melody+0x23>
  10a1f5:	c6 05 d1 a2 14 01 00 	movb   $0x0,0x114a2d1
  10a1fc:	e4 61                	in     $0x61,%al
  10a1fe:	83 e0 fc             	and    $0xfffffffc,%eax
  10a201:	e6 61                	out    %al,$0x61
  10a203:	c7 05 c8 a2 14 01 00 	movl   $0x0,0x114a2c8
  10a20a:	00 00 00 
  10a20d:	89 15 cc a2 14 01    	mov    %edx,0x114a2cc
  10a213:	c6 05 c0 a2 14 01 00 	movb   $0x0,0x114a2c0
  10a21a:	c7 05 c4 a2 14 01 00 	movl   $0x0,0x114a2c4
  10a221:	00 00 00 
  10a224:	c6 05 d0 a2 14 01 01 	movb   $0x1,0x114a2d0
  10a22b:	c6 05 d1 a2 14 01 01 	movb   $0x1,0x114a2d1
  10a232:	c6 05 d3 a2 14 01 01 	movb   $0x1,0x114a2d3
  10a239:	5d                   	pop    %ebp
  10a23a:	c3                   	ret
  10a23b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

0010a240 <sound_set_volume>:
  10a240:	55                   	push   %ebp
  10a241:	89 e5                	mov    %esp,%ebp
  10a243:	8b 45 08             	mov    0x8(%ebp),%eax
  10a246:	3c 64                	cmp    $0x64,%al
  10a248:	76 16                	jbe    10a260 <sound_set_volume+0x20>
  10a24a:	c6 05 2c e0 10 00 64 	movb   $0x64,0x10e02c
  10a251:	c6 05 d2 a2 14 01 00 	movb   $0x0,0x114a2d2
  10a258:	5d                   	pop    %ebp
  10a259:	c3                   	ret
  10a25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10a260:	a2 2c e0 10 00       	mov    %al,0x10e02c
  10a265:	84 c0                	test   %al,%al
  10a267:	75 e8                	jne    10a251 <sound_set_volume+0x11>
  10a269:	c6 05 d2 a2 14 01 01 	movb   $0x1,0x114a2d2
  10a270:	e4 61                	in     $0x61,%al
  10a272:	83 e0 fc             	and    $0xfffffffc,%eax
  10a275:	e6 61                	out    %al,$0x61
  10a277:	5d                   	pop    %ebp
  10a278:	c3                   	ret
  10a279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0010a280 <sound_get_volume>:
  10a280:	0f b6 05 2c e0 10 00 	movzbl 0x10e02c,%eax
  10a287:	c3                   	ret
  10a288:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a28f:	00 

0010a290 <sound_is_playing>:
  10a290:	0f b6 05 d3 a2 14 01 	movzbl 0x114a2d3,%eax
  10a297:	c3                   	ret
  10a298:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a29f:	00 

0010a2a0 <sound_set_mute>:
  10a2a0:	55                   	push   %ebp
  10a2a1:	89 e5                	mov    %esp,%ebp
  10a2a3:	8b 45 08             	mov    0x8(%ebp),%eax
  10a2a6:	a2 d2 a2 14 01       	mov    %al,0x114a2d2
  10a2ab:	84 c0                	test   %al,%al
  10a2ad:	74 07                	je     10a2b6 <sound_set_mute+0x16>
  10a2af:	e4 61                	in     $0x61,%al
  10a2b1:	83 e0 fc             	and    $0xfffffffc,%eax
  10a2b4:	e6 61                	out    %al,$0x61
  10a2b6:	5d                   	pop    %ebp
  10a2b7:	c3                   	ret
  10a2b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a2bf:	00 

0010a2c0 <sound_get_mute>:
  10a2c0:	0f b6 05 d2 a2 14 01 	movzbl 0x114a2d2,%eax
  10a2c7:	c3                   	ret
  10a2c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a2cf:	00 

0010a2d0 <sound_get_current_note>:
  10a2d0:	a1 c8 a2 14 01       	mov    0x114a2c8,%eax
  10a2d5:	c3                   	ret
