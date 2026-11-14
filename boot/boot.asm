;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         Main Entrance Point for the Operating System         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


[BITS 16]
[ORG 0x7C00]

    xor ax, ax
    mov ds, ax
    mov es, ax

    mov si, msg
    call print_string

    mov ax, 0x0000
    mov es, ax          ; Destination Segment ES=0x0000
    mov bx, 0x0500      ; Destination Offset BX=0x0500
    mov dl, 0x00        ; Drive 0 (Floppy)
    mov ch, 0x00        ; Cylinder 0
    mov cl, 0x02        ; Sector 2
    mov dh, 0x00        ; Head 0
    call read_sector    ; calls the read-sector function from 
                        ; read_disk.asm

    mov si, 0x0500
    call print_string   ; calls the print-string function from
                        ; print_char.asm

    jmp $               ; halt

%include "boot/print_char.asm"
%include "boot/read_disk.asm"

msg db "Welcome", 0

times 510 - ($ - $$) db 0
dw 0xAA55               ; Magic Number (55AA)