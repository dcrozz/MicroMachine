#########################################################
#			$1 显存										#
#			$2 颜色										#
#			$3 按键值									#
#			$4 按键地址 								#
#			$5 比较用									#
#			$6 计算用									#
#			$7 data地址与$1同步							#
#			$8 计时										#
#			$9 count									#
#			$10 数字第1行								#
#			$11 数字第2行 								#
#			$12 数字第3行								#
#			$13 数字第4行								#
#			$14 数字第5行								#
#			$15 数字第6行								#
#			$16 Num1									#
#			$17 Num2									#
#			$18 Num3 									#
#			$19 Num4 									#
#			$20 Num5 								    #
#			$21 Num6									#
#########################################################

sll $0,$0,0

Start:

Comma:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12 
addi $2,$2,0x0F00
    sw $2,328($1)
    sw $2,424($1)
    sw $2,340($1)
    sw $2,436($1)
    sw $2,328($7)
    sw $2,424($7)
    sw $2,340($7)
    sw $2,436($7)
#########################################################
addi $16,$0,0
addi $17,$0,0
addi $18,$0,0
addi $19,$0,0

#初始全0
#Led 全暗
addi $5,$0,4100
addi $4,$0,0x0000
sw $4,0($5)

addi $1,$0,0x1400
addi $5,$0,768
addi $8,$0,0
addi $2,$0,0x0000
Pic0:
addi $8,$8,4
addi $1,$1,4
    sw $2,0($1)
bne $5,$8,Pic0



Default1to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,448($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,320($7)
	sw $2,352($7)
	sw $2,384($7)
	sw $2,416($7)

Default2to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,292($1)
    sw $2,452($1)
    sw $2,292($7)
    sw $2,452($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,324($1)
	sw $2,356($1)
	sw $2,388($1)
	sw $2,420($1)
	sw $2,324($7)
	sw $2,356($7)
	sw $2,388($7)
	sw $2,420($7)

Default3to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,300($1)
    sw $2,460($1)
    sw $2,300($7)
    sw $2,460($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,332($1)
	sw $2,364($1)
	sw $2,396($1)
	sw $2,428($1)
	sw $2,332($7)
	sw $2,364($7)
	sw $2,396($7)
	sw $2,428($7)

Default4to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,304($1)
    sw $2,464($1)
    sw $2,304($7)
    sw $2,464($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,336($1)
	sw $2,368($1)
	sw $2,400($1)
	sw $2,432($1)
	sw $2,336($7)
	sw $2,368($7)
	sw $2,400($7)
	sw $2,432($7)

Default5to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,312($1)
    sw $2,472($1)
    sw $2,312($7)
    sw $2,472($7)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,344($1)
	sw $2,376($1)
	sw $2,408($1)
	sw $2,440($1)
	sw $2,344($7)
	sw $2,376($7)
	sw $2,408($7)
	sw $2,440($7)

Default6to0:
addi $1,$0,0x1400
addi $7,$0,0x0300
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,316($1)
    sw $2,476($1)
    sw $2,316($7)
    sw $2,476($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,348($1)
	sw $2,380($1)
	sw $2,412($1)
	sw $2,444($1)
	sw $2,348($7)
	sw $2,380($7)
	sw $2,412($7)
	sw $2,444($7)


###############################################################################

#SetClock


addi $1,$0,0x1400
addi $7,$0,0x0300
ButtonStart:
#save the current
    lw $10,288($7)
    lw $11,320($7)
    lw $12,352($7)
    lw $13,384($7)
    lw $14,416($7)
    lw $15,448($7)

ShineStart:
#disappear
addi $2,$0,0x0000
    sw $2,288($1)
    sw $2,320($1)
    sw $2,352($1)
    sw $2,384($1)
    sw $2,416($1)
    sw $2,448($1)

#0.4s
addi $8,$0,0x0001
sll	 $8,$8,21
addi	$9,$0,0x0000
	Shine1:
	addi	$9,$9,0x0001
	bne		$9,$8,Shine1

#appear
    sw $10,288($1)
    sw $11,320($1)
    sw $12,352($1)
    sw $13,384($1)
    sw $14,416($1)
    sw $15,448($1)

#0.4s
addi $8,$0,0x0001
sll	 $8,$8,21
addi	$9,$0,0x0000
	Shine2:
	addi	$9,$9,0x0001
	bne		$9,$8,Shine2

#Switch1 to start
addi $4,$0,4104
lw $3,0($4)
bne $3,$0,TimeStart

Button:
addi $4,$0,4108
lw $3,0($4)
beq $3,$0,ShineStart
addi $8,$0,0x0001
sll	 $8,$8,20
	addi	$9,$0,0x0000
	MS200:
	addi	$9,$9,0x0001
	bne		$9,$8,MS200
lw $3,0($4)
beq $3,$0,ShineStart

addi $5,$0,1
beq  $3,$5,Right
addi $5,$0,2
beq  $3,$5,Down
addi $5,$0,4
beq  $3,$5,Left
addi $5,$0,8
beq	 $3,$5,Up





J	ShineStart

Right:
addi $1,$1,4
addi $7,$7,4
#Egde
addi $5,$0,0x1420
beq  $1,$5,Left
J	 ButtonStart

Left:
addi $1,$1,-4
addi $7,$7,-4
#Egde
addi $5,$0,0x13FC
beq  $1,$5,Right
J	 ButtonStart


Up:
addi $5,$0,0x1400
beq	 $1,$5,Num1up
addi $5,$0,0x1404
beq	 $1,$5,Num2up
addi $5,$0,0x140C
beq	 $1,$5,Num3up
addi $5,$0,0x1410
beq	 $1,$5,Num4up
J	 ButtonStart



Down:
addi $5,$0,0x1400
beq	 $1,$5,Num1down
addi $5,$0,0x1404
beq	 $1,$5,Num2down
addi $5,$0,0x140C
beq	 $1,$5,Num3down
addi $5,$0,0x1410
beq	 $1,$5,Num4down
J	 ButtonStart

Num1up:
addi $16,$16,1
j ShowNum1

Num2up:
addi $17,$17,1
j ShowNum2

Num3up:
addi $18,$18,1
j ShowNum3

Num4up:
addi $19,$19,1
j ShowNum4


Num1down:
addi $16,$16,-1
j ShowNum1

Num2down:
addi $17,$17,-1
j ShowNum2

Num3down:
addi $18,$18,-1
j ShowNum3

Num4down:
addi $19,$19,-1
j ShowNum4

ShowNum1:
addi $5,$0,0
beq	 $16,$5,Numto0
addi $5,$0,1
beq	 $16,$5,Numto1
addi $5,$0,2
beq	 $16,$5,Numto2
addi $5,$0,3
beq	 $16,$5,Numto3
addi $5,$0,4
beq	 $16,$5,Numto4
addi $5,$0,5
beq	 $16,$5,Numto5

j ButtonStart

ShowNum2:
addi $5,$0,0
beq	 $17,$5,Numto0
addi $5,$0,1
beq	 $17,$5,Numto1
addi $5,$0,2
beq	 $17,$5,Numto2
addi $5,$0,3
beq	 $17,$5,Numto3
addi $5,$0,4
beq	 $17,$5,Numto4
addi $5,$0,5
beq	 $17,$5,Numto5
addi $5,$0,6
beq	 $17,$5,Numto6
addi $5,$0,7
beq	 $17,$5,Numto7
addi $5,$0,8
beq	 $17,$5,Numto8
addi $5,$0,9
beq	 $17,$5,Numto9
j ButtonStart

ShowNum3:
addi $5,$0,0
beq	 $18,$5,Numto0
addi $5,$0,1
beq	 $18,$5,Numto1
addi $5,$0,2
beq	 $18,$5,Numto2
addi $5,$0,3
beq	 $18,$5,Numto3
addi $5,$0,4
beq	 $18,$5,Numto4
addi $5,$0,5
beq	 $18,$5,Numto5
j ButtonStart

ShowNum4:
addi $5,$0,0
beq	 $19,$5,Numto0
addi $5,$0,1
beq	 $19,$5,Numto1
addi $5,$0,2
beq	 $19,$5,Numto2
addi $5,$0,3
beq	 $19,$5,Numto3
addi $5,$0,4
beq	 $19,$5,Numto4
addi $5,$0,5
beq	 $19,$5,Numto5
addi $5,$0,6
beq	 $19,$5,Numto6
addi $5,$0,7
beq	 $19,$5,Numto7
addi $5,$0,8
beq	 $19,$5,Numto8
addi $5,$0,9
beq	 $19,$5,Numto9
j ButtonStart



#############################################################

Numto0:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,448($7)
    

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,320($7)
	sw $2,352($7)
	sw $2,384($7)
	sw $2,416($7)
J	ButtonStart

Numto1:
addi $2,$0,0x00FF
sll	 $2,$2,8
addi $2,$2,0x00
	sw $2,288($1)
    sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
	sw $2,288($7)
    sw $2,320($7)
	sw $2,352($7)
	sw $2,384($7)
	sw $2,416($7)
	sw $2,448($7)
J	ButtonStart

Numto2:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,352($7)
    sw $2,448($7)
addi $2,$0,0x00FF
	sw $2,320($1)
	sw $2,320($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
	sw $2,384($1)
	sw $2,416($1)
	sw $2,384($7)
	sw $2,416($7)
j 	ButtonStart

Numto3:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,352($7)
    sw $2,448($7)
addi $2,$0,0x00FF
	sw $2,320($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,320($7)
	sw $2,384($7)
	sw $2,416($7)
j 	ButtonStart



Numto4:
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
    sw $2,288($1)
    sw $2,320($1)
    sw $2,288($7)
    sw $2,320($7)
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,352($1)
    sw $2,352($7)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
	sw $2,384($7)
	sw $2,416($7)
	sw $2,448($7)
j 	ButtonStart




Numto5:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,352($7)
    sw $2,448($7)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x0000
	sw $2,320($1)
	sw $2,320($7)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
	sw $2,384($7)
	sw $2,416($7)
j 	ButtonStart




Numto6:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,352($7)
    sw $2,448($7)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x0000
	sw $2,320($1)
	sw $2,320($7)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,384($1)
	sw $2,416($1)
	sw $2,384($7)
	sw $2,416($7)
j 	ButtonStart


Numto7:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
	sw $2,288($1)
	sw $2,288($7)

addi $2,$0,0x00FF
    sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
	sw $2,320($7)
	sw $2,352($7)
	sw $2,384($7)
	sw $2,416($7)
	sw $2,448($7)
j 	ButtonStart



Numto8:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,448($1)
    sw $2,352($1)
    sw $2,288($7)
    sw $2,448($7)
    sw $2,352($7)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,320($7)
	sw $2,384($7)
	sw $2,416($7)
j 	ButtonStart


Numto9:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
    sw $2,288($7)
    sw $2,352($7)
    sw $2,448($7)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
	sw $2,384($7)
	sw $2,416($7)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,320($7) 
j 	ButtonStart

##########################################



#Setover
###########################################################
addi $20,$0,9
addi $21,$0,10
##########################################################

#Set Label
addi $29,$0,0x0000

###############################################

TimeStart:

Pause:
addi $4,$0,4104
lw $3,0($4)
addi $5,$0,3
beq  $3,$5,Pause



andi $5 ,$29,0x0002
andi $29,$29,0xFFFD
addi $1,$0,0x1418
bne  $5,$0,StartShowNum5

andi $5 ,$29,0x0004
andi $29,$29,0xFFFB
addi $1,$0,0x1410
bne  $5,$0,StartShowNum4

andi $5 ,$29,0x0008
andi $29,$29,0xFFF7
addi $1,$0,0x140C
bne  $5,$0,StartShowNum3

andi $5 ,$29,0x0010
andi $29,$29,0xFFEF
addi $1,$0,0x1404
bne  $5,$0,StartShowNum2


#################################################


#Num6show
Num6Ctl:
addi $1,$0,0x141C

addi $9,$0,1
sll  $9,$9,15
addi $9,$9,13232
addi $5,$0,0
Loop60s:
addi $5,$5,1
bne  $5,$9,Loop60s

addi $21,$21,-1
addi $5,$0,-1
beq  $21,$5,Num5Ctl
j 	 StartShowNum6

#Num5show
Num5Ctl:
addi $1,$0,0x1418

addi $20,$20,-1
addi $5,$0,-1
beq  $20,$5,Num4Ctl
addi $21,$0,10
j 	 StartShowNum5

#Num4show
Num4Ctl:
addi $1,$0,0x1410

addi $19,$19,-1
addi $5,$0,-1
beq  $19,$5,Num3Ctl
addi $20,$0,9
addi $21,$0,10
addi $29,$0,0x0002
j 	 StartShowNum4

#Num3show
Num3Ctl:
addi $1,$0,0x140C

addi $18,$18,-1
addi $5,$0,-1
beq  $18,$5,Num2Ctl
addi $19,$0,9
addi $20,$0,9
addi $21,$0,10
addi $29,$0,0x0006
j 	 StartShowNum3

#Num2show
Num2Ctl:
addi $1,$0,0x1404

addi $17,$17,-1
addi $5,$0,-1
beq  $17,$5,Num1Ctl
addi $18,$0,5
addi $19,$0,9
addi $20,$0,9
addi $21,$0,10
addi $29,$0,0x000E
j 	 StartShowNum2

#Num1show
Num1Ctl:
addi $1,$0,0x1400

addi $16,$16,-1
addi $5,$0,-1
beq  $16,$5,end
addi $17,$0,9
addi $18,$0,5
addi $19,$0,9
addi $20,$0,9
addi $21,$0,10
addi $29,$0,0x001E
j 	 StartShowNum1


StartShowNum1:
addi $5,$0,0
beq	 $16,$5,StartNumto0
addi $5,$0,1
beq	 $16,$5,StartNumto1
addi $5,$0,2
beq	 $16,$5,StartNumto2
addi $5,$0,3
beq	 $16,$5,StartNumto3
addi $5,$0,4
beq	 $16,$5,StartNumto4
addi $5,$0,5
beq	 $16,$5,StartNumto5

j TimeStart

StartShowNum2:
addi $5,$0,0
beq	 $17,$5,StartNumto0
addi $5,$0,1
beq	 $17,$5,StartNumto1
addi $5,$0,2
beq	 $17,$5,StartNumto2
addi $5,$0,3
beq	 $17,$5,StartNumto3
addi $5,$0,4
beq	 $17,$5,StartNumto4
addi $5,$0,5
beq	 $17,$5,StartNumto5
addi $5,$0,6
beq	 $17,$5,StartNumto6
addi $5,$0,7
beq	 $17,$5,StartNumto7
addi $5,$0,8
beq	 $17,$5,StartNumto8
addi $5,$0,9
beq	 $17,$5,StartNumto9
j TimeStart

StartShowNum3:
addi $5,$0,0
beq	 $18,$5,StartNumto0
addi $5,$0,1
beq	 $18,$5,StartNumto1
addi $5,$0,2
beq	 $18,$5,StartNumto2
addi $5,$0,3
beq	 $18,$5,StartNumto3
addi $5,$0,4
beq	 $18,$5,StartNumto4
addi $5,$0,5
beq	 $18,$5,StartNumto5
j TimeStart

StartShowNum4:
addi $5,$0,0
beq	 $19,$5,StartNumto0
addi $5,$0,1
beq	 $19,$5,StartNumto1
addi $5,$0,2
beq	 $19,$5,StartNumto2
addi $5,$0,3
beq	 $19,$5,StartNumto3
addi $5,$0,4
beq	 $19,$5,StartNumto4
addi $5,$0,5
beq	 $19,$5,StartNumto5
addi $5,$0,6
beq	 $19,$5,StartNumto6
addi $5,$0,7
beq	 $19,$5,StartNumto7
addi $5,$0,8
beq	 $19,$5,StartNumto8
addi $5,$0,9
beq	 $19,$5,StartNumto9
j TimeStart

StartShowNum5:
addi $5,$0,0
beq	 $20,$5,StartNumto0
addi $5,$0,1
beq	 $20,$5,StartNumto1
addi $5,$0,2
beq	 $20,$5,StartNumto2
addi $5,$0,3
beq	 $20,$5,StartNumto3
addi $5,$0,4
beq	 $20,$5,StartNumto4
addi $5,$0,5
beq	 $20,$5,StartNumto5
addi $5,$0,6
beq	 $20,$5,StartNumto6
addi $5,$0,7
beq	 $20,$5,StartNumto7
addi $5,$0,8
beq	 $20,$5,StartNumto8
addi $5,$0,9
beq	 $20,$5,StartNumto9
j TimeStart

StartShowNum6:
addi $5,$0,0
beq	 $21,$5,StartNumto0
addi $5,$0,1
beq	 $21,$5,StartNumto1
addi $5,$0,2
beq	 $21,$5,StartNumto2
addi $5,$0,3
beq	 $21,$5,StartNumto3
addi $5,$0,4
beq	 $21,$5,StartNumto4
addi $5,$0,5
beq	 $21,$5,StartNumto5
addi $5,$0,6
beq	 $21,$5,StartNumto6
addi $5,$0,7
beq	 $21,$5,StartNumto7
addi $5,$0,8
beq	 $21,$5,StartNumto8
addi $5,$0,9
beq	 $21,$5,StartNumto9
j TimeStart

StartNumto0:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,448($1)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
J	TimeStart

StartNumto1:
addi $2,$0,0x00FF
sll	 $2,$2,8
addi $2,$2,0x00
	sw $2,288($1)
    sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
J	TimeStart

StartNumto2:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
addi $2,$0,0x00FF
	sw $2,320($1)

addi $2,$0,0x00FF
sll	 $2,$2,16
	sw $2,384($1)
	sw $2,416($1)
j 	TimeStart

StartNumto3:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
addi $2,$0,0x00FF
	sw $2,320($1)
	sw $2,384($1)
	sw $2,416($1)
j 	TimeStart



StartNumto4:
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
    sw $2,288($1)
    sw $2,320($1)
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,352($1)
    sw $2,352($7)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
j 	TimeStart




StartNumto5:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x0000
	sw $2,320($1)
	sw $2,320($7)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
j 	TimeStart




StartNumto6:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x0000
	sw $2,320($1)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,384($1)
	sw $2,416($1)
j 	TimeStart


StartNumto7:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
	sw $2,288($1)

addi $2,$0,0x00FF
    sw $2,320($1)
	sw $2,352($1)
	sw $2,384($1)
	sw $2,416($1)
	sw $2,448($1)
j 	TimeStart



StartNumto8:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,448($1)
    sw $2,352($1)

addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)
	sw $2,384($1)
	sw $2,416($1)
j 	TimeStart


StartNumto9:
addi $2,$0,0x0FFF
sll	 $2,$2,12
addi $2,$2,0x0FFF
    sw $2,288($1)
    sw $2,352($1)
    sw $2,448($1)
addi $2,$0,0x00FF
	sw $2,384($1)
	sw $2,416($1)
addi $2,$0,0x00FF
sll	 $2,$2,16
addi $2,$2,0x00FF
	sw $2,320($1)

j 	TimeStart


end:
#led
addi $5,$0,4100
addi $4,$0,0xFFFF
sw   $4,0($5)



addi $1,$0,0x1400
addi $5,$0,768
addi $8,$0,0
addi $2,$0,0x0000
Pic1:
addi $8,$8,4
addi $1,$1,4
    sw $2,0($1)
bne $5,$8,Pic1



addi $1,$0,0x1400
addi $2,$0,0xE000
sll $2,$2,16
	sw $2,228($1)
	sw $2,484($1)
	sw $2,268($1)
	sw $2,460($1)
	sw $2,468($1)
	sw $2,500($1)
	sw $2,316($1)
	sw $2,348($1)

addi $2,$0,0xE0E0
sll $2,$2,16
addi $2,$2,0xE0E0
	sw $2,260($1)
	sw $2,452($1)

addi $2,$0,0x00E0
sll $2,$2,16
	sw $2,292($1)
	sw $2,388($1)
	sw $2,420($1)
	sw $2,344($1)
	sw $2,476($1)
	sw $2,508($1)

addi $2,$0,0x00E0
sll $2,$2,16
addi $2,$2,0xE0E0
	sw $2,356($1)
	sw $2,332($1)
	sw $2,364($1)
	sw $2,396($1)

addi $2,$0,0xE0E0
sll $2,$2,16
addi $2,$2,0xE000
	sw $2,328($1)
	sw $2,272($1)
	sw $2,464($1)
	sw $2,372($1)
	sw $2,404($1)
	sw $2,436($1)

addi $2,$0,0x00E0
	sw $2,276($1)
	sw $2,280($1)
	sw $2,304($1)
	sw $2,336($1)
	sw $2,368($1)
	sw $2,400($1)
	sw $2,432($1)


addi $2,$0,0xE0E0
sll $2,$2,16
	sw $2,380($1)
	sw $2,412($1)
	sw $2,444($1)

addi $2,$0,0x0E0E
sll $2,$2,12
	sw $2,360($1)
	sw $2,392($1)
	sw $2,340($1)

addi $2,$0,0xE000
sll $2,$2,16
addi $2,$2,0xE000
	sw $2,300($1)
	sw $2,428($1)

addi $2,$0,0x00E0
sll $2,$2,16
addi $2,$2,0x00E0
	sw $2,324($1)

addi $2,$0,0xE000
sll $2,$2,16
addi $2,$2,0x00E0
	sw $2,264($1)


addi $2,$0,0x000E
	sw $2,456($1)

addi $2,$0,0x0E0E
sll $2,$2,4
	sw $2,308($1)

EndPic:
j EndPic