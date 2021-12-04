volumeSphere:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, eax
        movsd   xmm0, QWORD PTR .LC0[rip]
        mulsd   xmm1, xmm0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, eax
        mulsd   xmm1, xmm0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, eax
        mulsd   xmm0, xmm1
        movq    rax, xmm0
        movq    xmm0, rax
        pop     rbp
        ret
volumeParallelepiped:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+4]
        imul    edx, eax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
        imul    eax, edx
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, eax
        movq    rax, xmm0
        movq    xmm0, rax
        pop     rbp
        ret
volumeTetrahedron:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm1, xmm1
        cvtsi2sd        xmm1, eax
        movsd   xmm0, QWORD PTR .LC1[rip]
        mulsd   xmm1, xmm0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, eax
        mulsd   xmm1, xmm0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, eax
        mulsd   xmm0, xmm1
        movq    rax, xmm0
        movq    xmm0, rax
        pop     rbp
        ret
volumeShape:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 1
        jne     .L8
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    volumeSphere
        movq    rax, xmm0
        jmp     .L7
.L8:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 2
        jne     .L10
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    volumeParallelepiped
        movq    rax, xmm0
        jmp     .L7
.L10:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 3
        jne     .L11
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    volumeTetrahedron
        movq    rax, xmm0
        jmp     .L7
.L11:
.L7:
        movq    xmm0, rax
        leave
        ret
sortContainer:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-56], rdi
        mov     DWORD PTR [rbp-20], 1
        jmp     .L13
.L17:
        mov     eax, DWORD PTR [rbp-20]
        mov     DWORD PTR [rbp-24], eax
        jmp     .L14
.L16:
        mov     eax, DWORD PTR [rbp-24]
        sub     eax, 1
        mov     rdx, QWORD PTR [rbp-56]
        cdqe
        sal     rax, 4
        add     rax, rdx
        mov     rdx, QWORD PTR [rax+12]
        mov     rax, QWORD PTR [rax+4]
        mov     QWORD PTR [rbp-48], rax
        mov     QWORD PTR [rbp-40], rdx
        mov     eax, DWORD PTR [rbp-24]
        sub     eax, 1
        mov     rdx, QWORD PTR [rbp-56]
        cdqe
        sal     rax, 4
        lea     rcx, [rdx+rax]
        mov     rdx, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 4
        add     rax, rdx
        mov     rdx, QWORD PTR [rax+12]
        mov     rax, QWORD PTR [rax+4]
        mov     QWORD PTR [rcx+4], rax
        mov     QWORD PTR [rcx+12], rdx
        mov     rdx, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 4
        lea     rcx, [rdx+rax]
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rcx+4], rax
        mov     QWORD PTR [rcx+12], rdx
        sub     DWORD PTR [rbp-24], 1
.L14:
        cmp     DWORD PTR [rbp-24], 0
        jle     .L15
        mov     eax, DWORD PTR [rbp-24]
        sub     eax, 1
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        add     rax, 4
        mov     rdi, rax
        call    volumeShape
        movq    rbx, xmm0
        mov     eax, DWORD PTR [rbp-24]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        add     rax, 4
        mov     rdi, rax
        call    volumeShape
        movq    xmm1, rbx
        comisd  xmm1, xmm0
        ja      .L16
.L15:
        add     DWORD PTR [rbp-20], 1
.L13:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax]
        cmp     DWORD PTR [rbp-20], eax
        jl      .L17
        nop
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
randomSphere:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        call    rand
        mov     edx, eax
        movsx   rax, edx
        imul    rax, rax, 1717986919
        shr     rax, 32
        sar     eax, 3
        mov     esi, edx
        sar     esi, 31
        sub     eax, esi
        mov     ecx, eax
        mov     eax, ecx
        sal     eax, 2
        add     eax, ecx
        sal     eax, 2
        mov     ecx, edx
        sub     ecx, eax
        lea     edx, [rcx+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
        nop
        leave
        ret
randomParallelepiped:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        call    rand
        mov     edx, eax
        movsx   rax, edx
        imul    rax, rax, 1717986919
        shr     rax, 32
        sar     eax, 3
        mov     esi, edx
        sar     esi, 31
        sub     eax, esi
        mov     ecx, eax
        mov     eax, ecx
        sal     eax, 2
        add     eax, ecx
        sal     eax, 2
        mov     ecx, edx
        sub     ecx, eax
        lea     edx, [rcx+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
        call    rand
        mov     edx, eax
        movsx   rax, edx
        imul    rax, rax, 1717986919
        shr     rax, 32
        sar     eax, 3
        mov     esi, edx
        sar     esi, 31
        sub     eax, esi
        mov     ecx, eax
        mov     eax, ecx
        sal     eax, 2
        add     eax, ecx
        sal     eax, 2
        sub     edx, eax
        mov     ecx, edx
        lea     edx, [rcx+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax+4], edx
        call    rand
        mov     edx, eax
        movsx   rax, edx
        imul    rax, rax, 1717986919
        shr     rax, 32
        sar     eax, 3
        mov     esi, edx
        sar     esi, 31
        sub     eax, esi
        mov     ecx, eax
        mov     eax, ecx
        sal     eax, 2
        add     eax, ecx
        sal     eax, 2
        mov     ecx, edx
        sub     ecx, eax
        lea     edx, [rcx+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax+8], edx
        nop
        leave
        ret
randomTetrahedron:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        call    rand
        mov     edx, eax
        movsx   rax, edx
        imul    rax, rax, 1717986919
        shr     rax, 32
        sar     eax, 3
        mov     esi, edx
        sar     esi, 31
        sub     eax, esi
        mov     ecx, eax
        mov     eax, ecx
        sal     eax, 2
        add     eax, ecx
        sal     eax, 2
        mov     ecx, edx
        sub     ecx, eax
        lea     edx, [rcx+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
        nop
        leave
        ret
randomShape:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        call    rand
        movsx   rdx, eax
        imul    rdx, rdx, 1431655766
        shr     rdx, 32
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     ecx, edx
        add     ecx, ecx
        add     ecx, edx
        sub     eax, ecx
        mov     edx, eax
        add     edx, 1
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 1
        jne     .L22
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    randomSphere
.L22:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 2
        jne     .L23
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    randomParallelepiped
.L23:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 3
        jne     .L25
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rdi, rax
        call    randomTetrahedron
.L25:
        nop
        leave
        ret
randomContainer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, DWORD PTR [rbp-28]
        mov     DWORD PTR [rax], edx
        mov     DWORD PTR [rbp-4], 0
        jmp     .L27
.L28:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        add     rax, 4
        mov     rdi, rax
        call    randomShape
        add     DWORD PTR [rbp-4], 1
.L27:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L28
        nop
        nop
        leave
        ret
readInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-4], 0
.L33:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    fgetc
        mov     BYTE PTR [rbp-5], al
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    feof
        test    eax, eax
        jne     .L30
        cmp     BYTE PTR [rbp-5], 32
        je      .L30
        cmp     BYTE PTR [rbp-5], 10
        jne     .L31
.L30:
        mov     eax, DWORD PTR [rbp-4]
        jmp     .L34
.L31:
        mov     edx, DWORD PTR [rbp-4]
        mov     eax, edx
        sal     eax, 2
        add     eax, edx
        add     eax, eax
        mov     DWORD PTR [rbp-4], eax
        movsx   eax, BYTE PTR [rbp-5]
        sub     eax, 48
        add     DWORD PTR [rbp-4], eax
        jmp     .L33
.L34:
        leave
        ret
readSphere:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx], eax
        nop
        leave
        ret
readParallelepiped:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx], eax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx+4], eax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx+8], eax
        nop
        leave
        ret
readTetrahedron:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx], eax
        nop
        leave
        ret
readShape:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    readInt
        mov     rdx, QWORD PTR [rbp-8]
        mov     DWORD PTR [rdx], eax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 1
        jne     .L39
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    readSphere
.L39:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 2
        jne     .L40
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    readParallelepiped
.L40:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 3
        jne     .L42
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    readTetrahedron
.L42:
        nop
        leave
        ret
readContainer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        jmp     .L44
.L45:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    readShape
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        lea     edx, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
.L44:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    feof
        test    eax, eax
        je      .L45
        nop
        nop
        leave
        ret
.LC2:
        .string "It is Sphere: r = %i. Volume = %f\n"
printSphere:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    volumeSphere
        movq    rax, xmm0
        mov     rdx, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rdx]
        mov     rcx, QWORD PTR [rbp-16]
        movq    xmm0, rax
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rcx
        mov     eax, 1
        call    fprintf
        nop
        leave
        ret
.LC3:
        .string "It is Parallelepiped: a = %i, b = %i, c = %i. Volume = %f\n"
printParallelepiped:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    volumeParallelepiped
        movq    rax, xmm0
        mov     rdx, QWORD PTR [rbp-8]
        mov     esi, DWORD PTR [rdx+8]
        mov     rdx, QWORD PTR [rbp-8]
        mov     ecx, DWORD PTR [rdx+4]
        mov     rdx, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rdx]
        mov     rdi, QWORD PTR [rbp-16]
        movq    xmm0, rax
        mov     r8d, esi
        mov     esi, OFFSET FLAT:.LC3
        mov     eax, 1
        call    fprintf
        nop
        leave
        ret
.LC4:
        .string "Is is Tetrahedron: a = %i. Volume = %f\n"
printTetrahedron:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    volumeTetrahedron
        movq    rax, xmm0
        mov     rdx, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rdx]
        mov     rcx, QWORD PTR [rbp-16]
        movq    xmm0, rax
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rcx
        mov     eax, 1
        call    fprintf
        nop
        leave
        ret
printShape:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 1
        jne     .L50
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    printSphere
.L50:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 2
        jne     .L51
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    printParallelepiped
.L51:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        cmp     eax, 3
        jne     .L53
        mov     rax, QWORD PTR [rbp-8]
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    printTetrahedron
.L53:
        nop
        leave
        ret
printContainer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L55
.L56:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        sal     rax, 4
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        lea     rdx, [rax+4]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     rdi, rdx
        call    printShape
        add     DWORD PTR [rbp-4], 1
.L55:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L56
        nop
        nop
        leave
        ret
.LC5:
        .string "incorrect command line!\n  Waited:\n     command -f infile outfile01 outfile02\n  Or:\n     command -n number outfile01 outfile02"
printHelp:
        push    rbp
        mov     rbp, rsp
        mov     edi, OFFSET FLAT:.LC5
        call    puts
        nop
        pop     rbp
        ret
.LC6:
        .string "-f"
.LC7:
        .string "r"
.LC8:
        .string "-n"
.LC9:
        .string "Incorrect size. Size must be 0 < size <= 10000"
.LC10:
        .string "w"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 160032
        mov     DWORD PTR [rbp-160020], edi
        mov     QWORD PTR [rbp-160032], rsi
        cmp     DWORD PTR [rbp-160020], 5
        je      .L59
        mov     eax, 0
        call    printHelp
        mov     edi, 1
        call    exit
.L59:
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L60
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 16
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    fopen
        mov     rdx, rax
        lea     rax, [rbp-160016]
        mov     rsi, rdx
        mov     rdi, rax
        call    readContainer
        jmp     .L61
.L60:
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC8
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L61
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 16
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    atoi
        mov     DWORD PTR [rbp-4], eax
        cmp     DWORD PTR [rbp-4], 0
        jle     .L62
        cmp     DWORD PTR [rbp-4], 10000
        jle     .L63
.L62:
        mov     edi, OFFSET FLAT:.LC9
        call    puts
        mov     edi, 1
        call    exit
.L63:
        mov     edi, 0
        call    time
        mov     edi, eax
        call    srand
        mov     edx, DWORD PTR [rbp-4]
        lea     rax, [rbp-160016]
        mov     esi, edx
        mov     rdi, rax
        call    randomContainer
.L61:
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 24
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        call    fopen
        mov     rdx, rax
        lea     rax, [rbp-160016]
        mov     rsi, rdx
        mov     rdi, rax
        call    printContainer
        lea     rax, [rbp-160016]
        mov     rdi, rax
        call    sortContainer
        mov     rax, QWORD PTR [rbp-160032]
        add     rax, 32
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        call    fopen
        mov     rdx, rax
        lea     rax, [rbp-160016]
        mov     rsi, rdx
        mov     rdi, rax
        call    printContainer
        mov     edi, 0
        call    exit
.LC0:
        .long   941617360
        .long   1074839890
.LC1:
        .long   -584742274
        .long   1069427581