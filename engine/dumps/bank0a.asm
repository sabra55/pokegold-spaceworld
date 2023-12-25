; someone should document this
; split it if necessary
; this is what mgbdis spat out
; with the sym file from this repo
; and the debug-enabled gold rom

Function28000::
    ld a, [wLinkMode]
    cp $01
    jr z, jr_00a_400c

    call Call_00a_4154
    jr jr_00a_400f

Jump_00a_400c:
jr_00a_400c:
    call Call_00a_4028

jr_00a_400f:
    xor a
    ld hl, wWildMons
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    call ReloadFontAndTileset
    xor a
    ld [wLinkMode], a
    ldh [hVBlank], a
    ld hl, $5cb7
    ld a, $0a
    call FarCall_hl
    ret


Call_00a_4028:
    ld c, $50
    call DelayFrames
    call ClearTileMap
    call UpdateSprites
    call LoadFont
    call LoadFontsBattleExtra
    call Call_00a_4ccb
    ld hl, $c343
    ld b, $02
    ld c, $0c
    call LinkTextboxAtHL
    ld hl, $c36c
    ld de, $42fd
    call PlaceString
    ld hl, wcb58
    xor a
    ld [hl+], a
    ld [hl], $50

Jump_00a_4056:
    call Call_00a_430a
    call Call_00a_4382
    call Call_00a_4318
    xor a
    ld [wPlayerLinkAction], a
    call WaitLinkTransfer
    ldh a, [hLinkPlayerNumber]
    cp $02
    jr nz, jr_00a_4082

    ld c, $03
    call DelayFrames
    xor a
    ldh [hSerialSend], a
    ld a, $81
    ldh [rSC], a
    call DelayFrame
    xor a
    ldh [hSerialSend], a
    ld a, $81
    ldh [rSC], a

jr_00a_4082:
    ld c, $03
    call DelayFrames
    ld a, $08
    ldh [rIE], a
    ld hl, wcdc7
    ld de, wcdd9
    ld bc, $0011
    call Serial_ExchangeBytes
    ld a, $fe
    ld [de], a
    ld hl, wPicrossCursorSpritePointer
    ld de, wd8fe
    ld bc, $0161
    call Serial_ExchangeBytes
    ld a, $fe
    ld [de], a
    ld hl, wSpriteAnimDict
    ld de, wNamingScreenDestinationPointer
    ld bc, $00c8
    call Serial_ExchangeBytes
    ld a, $1d
    ldh [rIE], a
    ld de, $0000
    call PlayMusic
    call Call_00a_45d5
    ld hl, wd8fe
    call Call_00a_45f4
    ld de, wPicrossCursorSpritePointer
    ld bc, $0161
    call Call_00a_45c8
    ld de, wNamingScreenDestinationPointer
    ld hl, wPikachuMinigameSpawnDataIndex
    ld c, $02

jr_00a_40d9:
    ld a, [de]
    inc de
    and a
    jr z, jr_00a_40d9

    cp $fd
    jr z, jr_00a_40d9

    cp $fe
    jr z, jr_00a_40d9

    cp $ff
    jr z, jr_00a_40f8

    push hl
    push bc
    ld b, $00
    dec a
    ld c, a
    add hl, bc
    ld a, $fe
    ld [hl], a
    pop bc
    pop hl
    jr jr_00a_40d9

jr_00a_40f8:
    ld hl, $c70a
    dec c
    jr nz, jr_00a_40d9

    ld hl, wPicrossCursorSpritePointer
    ld de, wd8fe
    ld bc, $0006
    call CopyBytes
    ld de, wd913
    ld a, [hl+]
    ld [de], a
    inc de

jr_00a_4110:
    ld a, [hl+]
    cp $ff
    jr z, jr_00a_412b

    ld [wNamedObjectIndexBuffer], a
    push hl
    push de
    ld hl, $4b5c
    ld a, $10
    call FarCall_hl
    pop de
    pop hl
    ld a, [wNamedObjectIndexBuffer]
    ld [de], a
    inc de
    jr jr_00a_4110

jr_00a_412b:
    ld [de], a
    ld hl, wPikachuMinigameSpawnDataIndex
    call Call_00a_44e8
    ld a, $3b
    ld [wcd72], a
    ld a, $da
    ld [$cd73], a
    ld de, $0000
    call PlayMusic
    ldh a, [hLinkPlayerNumber]
    cp $02
    ld c, $42
    call z, DelayFrames
    ld de, $0003
    call PlayMusic
    jp Jump_00a_460d


Call_00a_4154:
    ld c, $50
    call DelayFrames
    call ClearTileMap
    call UpdateSprites
    call LoadFont
    call LoadFontsBattleExtra
    call Call_00a_4ccb
    ld hl, $c343
    ld b, $02
    ld c, $0c
    call LinkTextboxAtHL
    ld hl, $c36c
    ld de, $42fd
    call PlaceString
    ld hl, wcb58
    xor a
    ld [hl+], a
    ld [hl], $50
    call Call_00a_430a
    call Call_00a_4472
    call Call_00a_4318
    xor a
    ld [wPlayerLinkAction], a
    call WaitLinkTransfer
    ldh a, [hLinkPlayerNumber]
    cp $02
    jr nz, jr_00a_41ae

    ld c, $03
    call DelayFrames
    xor a
    ldh [hSerialSend], a
    ld a, $81
    ldh [rSC], a
    call DelayFrame
    xor a
    ldh [hSerialSend], a
    ld a, $81
    ldh [rSC], a

jr_00a_41ae:
    ld c, $03
    call DelayFrames
    ld a, $08
    ldh [rIE], a
    ld hl, wcdc7
    ld de, wcdd9
    ld bc, $0011
    call Serial_ExchangeBytes
    ld a, $fe
    ld [de], a
    ld hl, wPicrossCursorSpritePointer
    ld de, wd8fe
    ld bc, $0183
    call Serial_ExchangeBytes
    ld a, $fe
    ld [de], a
    ld hl, wSpriteAnimDict
    ld de, wNamingScreenDestinationPointer
    ld bc, $00c8
    call Serial_ExchangeBytes
    ld a, [wLinkMode]
    cp $02
    jr nz, jr_00a_41f4

    ld hl, $c8bc
    ld de, wc9e8
    ld bc, $0118
    call Call_00a_42d6

jr_00a_41f4:
    ld a, $1d
    ldh [rIE], a
    ld de, $0000
    call PlayMusic
    call Call_00a_45d5
    ld hl, wd8fe
    call Call_00a_45f4
    ld de, wPicrossCursorSpritePointer
    ld bc, $0176
    call Call_00a_45c8
    ld de, wNamingScreenDestinationPointer
    ld hl, wPikachuMinigameSpawnDataIndex
    ld c, $02

jr_00a_4218:
    ld a, [de]
    inc de
    and a
    jr z, jr_00a_4218

    cp $fd
    jr z, jr_00a_4218

    cp $fe
    jr z, jr_00a_4218

    cp $ff
    jr z, jr_00a_4237

    push hl
    push bc
    ld b, $00
    dec a
    ld c, a
    add hl, bc
    ld a, $fe
    ld [hl], a
    pop bc
    pop hl
    jr jr_00a_4218

jr_00a_4237:
    ld hl, $c70a
    dec c
    jr nz, jr_00a_4218

    ld a, [wLinkMode]
    cp $02
    jr nz, jr_00a_427b

    ld hl, wc9e8

jr_00a_4247:
    ld a, [hl+]
    cp $20
    jr nz, jr_00a_4247

jr_00a_424c:
    ld a, [hl+]
    cp $fe
    jr z, jr_00a_424c

    cp $20
    jr z, jr_00a_424c

    dec hl
    ld de, $c8bc

jr_00a_4259:
    ld a, [hl+]
    cp $fe
    jr z, jr_00a_4259

    ld [de], a
    inc de
    cp $21
    jr nz, jr_00a_4259

    ld de, $c8bc

jr_00a_4267:
    ld a, [de]
    inc de
    cp $21
    jr z, jr_00a_4278

    cp $22
    jr nz, jr_00a_4267

    dec de
    ld a, $fe
    ld [de], a
    inc de
    jr jr_00a_4267

jr_00a_4278:
    dec de
    xor a
    ld [de], a

jr_00a_427b:
    ld hl, wPicrossCursorSpritePointer
    ld de, wd8fe
    ld bc, $0006
    call CopyBytes
    ld de, wd913
    ld bc, $0170
    call CopyBytes
    ld a, $3b
    ld [wcd72], a
    ld a, $da
    ld [$cd73], a
    ld de, $0000
    call PlayMusic
    ldh a, [hLinkPlayerNumber]
    cp $02
    ld c, $42
    call z, DelayFrames
    ld a, [wLinkMode]
    cp $03
    jr nz, jr_00a_42cd

    ld a, $0c
    ld [wce02], a
    call ClearTileMap
    call WaitBGMap
    ld hl, wce5f
    res 7, [hl]
    ld a, $25
    call Predef
    ld a, $06
    call Predef
    jp Jump_00a_48d3


jr_00a_42cd:
    ld de, $0003
    call PlayMusic
    jp Jump_00a_460d


Call_00a_42d6:
    ld a, $01
    ldh [hSerialIgnoringInitialData], a

jr_00a_42da:
    ld a, [hl]
    ldh [hSerialSend], a
    call Serial_ExchangeByte.loop
    push bc
    ld b, a
    inc hl
    ld a, $30

jr_00a_42e5:
    dec a
    jr nz, jr_00a_42e5

    ldh a, [hSerialIgnoringInitialData]
    and a
    ld a, b
    pop bc
    jr z, jr_00a_42f5

    dec hl
    xor a
    ldh [hSerialIgnoringInitialData], a
    jr jr_00a_42da

jr_00a_42f5:
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_00a_42da

    ret


    jp nz, $bcb3

    sbc $2c
    pop hl
    sbc $3b
    pop bc
    pop hl
    or e
    rst $20
    ld d, b

Call_00a_430a:
    ld hl, wPicrossCursorSpritePointer
    ld bc, $0514

jr_00a_4310:
    xor a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_00a_4310

    ret


Call_00a_4318:
    ld hl, wcdc7
    ld a, $fd
    ld b, $07

jr_00a_431f:
    ld [hl+], a
    dec b
    jr nz, jr_00a_431f

    ld b, $0a
    ld de, wLinkBattleRNs

jr_00a_4328:
    call Random
    cp $fd
    jr nc, jr_00a_4328

    ld [hl+], a
    ld [de], a
    inc de
    dec b
    jr nz, jr_00a_4328

    ld hl, wSpriteAnimDict
    ld a, $fd
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld b, $c8
    xor a

jr_00a_4340:
    ld [hl+], a
    dec b
    jr nz, jr_00a_4340

    ld hl, wc613
    ld de, wDayOfWeekBuffer
    ld bc, $0000

jr_00a_434d:
    inc c
    ld a, c
    cp $fd
    jr z, jr_00a_4375

    ld a, b
    dec a
    jr nz, jr_00a_4368

    push bc
    ld a, [wLinkMode]
    cp $01
    ld b, $0d
    jr z, jr_00a_4363

    ld b, $25

jr_00a_4363:
    ld a, c
    cp b
    pop bc
    jr z, jr_00a_437e

jr_00a_4368:
    inc hl
    ld a, [hl]
    cp $fe
    jr nz, jr_00a_434d

    ld a, c
    ld [de], a
    inc de
    ld [hl], $ff
    jr jr_00a_434d

jr_00a_4375:
    ld a, $ff
    ld [de], a
    inc de
    ld bc, $0100
    jr jr_00a_434d

jr_00a_437e:
    ld a, $ff
    ld [de], a
    ret


Call_00a_4382:
    ld de, wPicrossCursorSpritePointer
    ld a, $fd
    ld b, $06

jr_00a_4389:
    ld [de], a
    inc de
    dec b
    jr nz, jr_00a_4389

    ld hl, wPlayerName
    ld bc, $0006
    call CopyBytes
    push de
    ld hl, wPartyCount
    ld a, [hl+]
    ld [de], a
    inc de

jr_00a_439e:
    ld a, [hl+]
    cp $ff
    jr z, jr_00a_43b9

    ld [wNamedObjectIndexBuffer], a
    push hl
    push de
    ld hl, $4b45
    ld a, $10
    call FarCall_hl
    pop de
    pop hl
    ld a, [wNamedObjectIndexBuffer]
    ld [de], a
    inc de
    jr jr_00a_439e

jr_00a_43b9:
    ld [de], a
    pop de
    ld hl, $0008
    add hl, de
    ld d, h
    ld e, l
    ld hl, wPartyMon1
    ld c, $06

jr_00a_43c6:
    push bc
    call Call_00a_43e5
    ld bc, $0030
    add hl, bc
    pop bc
    dec c
    jr nz, jr_00a_43c6

    ld hl, wPartyMon6StatsEnd
    ld bc, $0024
    call CopyBytes
    ld hl, wPartyMonOTEnd
    ld bc, $0024
    call CopyBytes
    ret


Call_00a_43e5:
    ld b, h
    ld c, l
    push de
    push bc
    ld a, [hl]
    ld [wNamedObjectIndexBuffer], a
    ld hl, $4b45
    ld a, $10
    call FarCall_hl
    pop bc
    pop de
    ld a, [wNamedObjectIndexBuffer]
    ld [de], a
    inc de
    ld hl, $0022
    add hl, bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc de
    xor a
    ld [de], a
    inc de
    ld hl, $0020
    add hl, bc
    ld a, [hl]
    ld [de], a
    inc de

Jump_00a_4410:
    push bc
    ld a, [bc]
    dec a
    ld hl, $4f17
    ld bc, $001f
    call AddNTimes
    ld bc, $0002
    ld a, $14
    call FarCopyBytes
    pop bc
    push bc
    ld hl, $0001
    add hl, bc
    ld bc, $001a
    call CopyBytes
    pop bc
    ld hl, $001f
    add hl, bc
    ld a, [hl]
    ld [de], a
    ld [wCurPartyLevel], a
    inc de
    push bc
    ld hl, $0024
    add hl, bc
    ld bc, $0008
    call CopyBytes
    pop bc
    push de
    push bc
    ld a, [bc]
    dec a
    push bc
    ld b, $00
    ld c, a
    ld hl, $4cd7
    add hl, bc
    ld a, [hl]
    ld [wMonHBaseSpecialAtt], a
    pop bc
    ld hl, $000a
    add hl, bc
    ld c, $05
    ld b, $01
    ld a, $19
    call Predef
    pop bc
    pop de
    ldh a, [$b5]
    ld [de], a
    inc de
    ldh a, [$b6]
    ld [de], a
    inc de
    ld h, b
    ld l, c
    ret


Call_00a_4472:
    ld de, wPicrossCursorSpritePointer
    ld a, $fd
    ld b, $06

jr_00a_4479:
    ld [de], a
    inc de
    dec b
    jr nz, jr_00a_4479

    ld hl, wPlayerName
    ld bc, $0006
    call CopyBytes
    ld hl, wPartyCount
    ld bc, $0008
    call CopyBytes
    ld hl, wPartyMon1
    ld bc, $0120
    call CopyBytes
    ld hl, wPartyMon6StatsEnd
    ld bc, $0024
    call CopyBytes
    ld hl, wPartyMonOTEnd
    ld bc, $0024
    call CopyBytes
    ld a, [wLinkMode]
    cp $02
    ret nz

    ld de, $c8bc
    ld a, $20
    call Call_00a_44e0
    ld hl, $ba68
    ld bc, $00f0
    ld a, $02
    call OpenSRAM
    call CopyBytes
    call CloseSRAM
    ld a, $21
    ld [de], a
    ld hl, $c8c1

jr_00a_44d0:
    ld a, [hl+]
    cp $21
    jr z, jr_00a_44df

    cp $fe
    jr nz, jr_00a_44d0

    dec hl
    ld [hl], $22
    inc hl
    jr jr_00a_44d0

jr_00a_44df:
    ret


Call_00a_44e0:
    ld c, $05

jr_00a_44e2:
    ld [de], a
    inc de
    dec c
    jr nz, jr_00a_44e2

    ret


Call_00a_44e8:
    push hl
    ld d, h
    ld e, l
    ld bc, wc9ea
    ld hl, wc9e8
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, wWildMons
    ld c, $06

jr_00a_44f9:
    push bc
    call Call_00a_4519
    pop bc
    dec c
    jr nz, jr_00a_44f9

    pop hl
    ld bc, $0108
    add hl, bc
    ld de, wOTPartyMonOT
    ld bc, $0024
    call CopyBytes
    ld de, wda5f
    ld bc, $0024
    call CopyBytes
    ret


Call_00a_4519:
    ld b, h
    ld c, l
    ld a, [de]
    inc de
    push bc
    push de
    ld [wNamedObjectIndexBuffer], a
    ld hl, $4b5c
    ld a, $10
    call FarCall_hl
    pop de
    pop bc
    ld a, [wNamedObjectIndexBuffer]
    ld [bc], a
    ld [wSelectedItem], a
    ld hl, $0022
    add hl, bc
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    inc de
    ld hl, $0020
    add hl, bc
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, wc9e8
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, l
    ld [wc9e8], a
    ld a, h
    ld [wc9e9], a
    push bc
    ld hl, $0001
    add hl, bc
    push hl
    ld h, d
    ld l, e
    pop de
    ld bc, $001a
    call CopyBytes
    pop bc
    ld d, h
    ld e, l
    ld hl, $001f
    add hl, bc
    ld a, [de]
    inc de
    ld [hl], a
    ld [wCurPartyLevel], a
    push bc
    ld hl, $0024
    add hl, bc
    push hl
    ld h, d
    ld l, e
    pop de
    ld bc, $0008
    call CopyBytes
    pop bc
    call GetMonHeader
    push de
    push bc
    ld d, h
    ld e, l
    ld hl, $000a
    add hl, bc
    ld c, $05
    ld b, $01
    ld a, $19
    call Predef
    pop bc
    pop hl
    ldh a, [$b5]
    ld [hl+], a
    ldh a, [$b6]
    ld [hl+], a
    push hl
    push bc
    ld hl, $000a
    add hl, bc
    ld c, $06
    ld b, $01
    ld a, $19
    call Predef
    pop bc
    pop hl
    ldh a, [$b5]
    ld [hl+], a
    ldh a, [$b6]
    ld [hl+], a
    push hl
    ld hl, $001b
    add hl, bc
    ld a, $46
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    pop hl
    inc de
    inc de
    ret


Call_00a_45c8:
jr_00a_45c8:
    ld a, [hl+]
    cp $fe
    jr z, jr_00a_45c8

    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_00a_45c8

    ret


Call_00a_45d5:
    ldh a, [hLinkPlayerNumber]
    cp $02
    ret z

    ld hl, wcdd9
    call Call_00a_4602
    ld de, wLinkBattleRNs
    ld c, $0a

jr_00a_45e5:
    ld a, [hl+]
    cp $fe
    jr z, jr_00a_45e5

    cp $fd
    jr z, jr_00a_45e5

    ld [de], a
    inc de
    dec c
    jr nz, jr_00a_45e5

    ret


Call_00a_45f4:
jr_00a_45f4:
    ld a, [hl+]
    and a
    jr z, jr_00a_45f4

    cp $fd
    jr z, jr_00a_45f4

    cp $fe
    jr z, jr_00a_45f4

Call_00a_4600:
    dec hl
    ret


Call_00a_4602:
jr_00a_4602:
    ld a, [hl+]
    cp $fd
    jr z, jr_00a_4602

    cp $fe
    jr z, jr_00a_4602

    dec hl
    ret


Jump_00a_460d:
    call ClearTileMap
    call Call_00a_4ccb
    call Call_00a_4992
    call Call_00a_48e5
    xor a
    ld hl, wOtherPlayerLinkMode
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $01
    ld [w2DMenuDataEnd], a
    inc a
    ld [wPlayerLinkAction], a
    jp Jump_00a_46a2


Jump_00a_462d:
    ld a, $01
    ld [wMonType], a
    ld a, $a1
    ld [wMenuJoypadFilter], a
    ld a, [wd913]
    ld [w2DMenuNumRows], a
    ld a, $01
    ld [w2DMenuNumCols], a
    ld a, $03
    ld [wMenuData3], a
    ld a, $0c
    ld [w2DMenuCursorInitX], a
    ld a, $01
    ld [wMenuCursorX], a
    ld a, $20
    ld [w2DMenuCursorOffsets], a
    ld a, $20
    ld [w2DMenuFlags], a
    xor a
    ld [$cc27], a

Jump_00a_465f:
    call Get2DMenuJoypad_NoPlaceCursor
    and a
    jp z, Jump_00a_4719

    bit 0, a
    jr z, jr_00a_4680

    ld a, $01
    ld [wce34], a
    ld hl, $4c48
    ld a, $14
    call FarCall_hl
    ld hl, wWildMons
    call Call_00a_491b
    jp Jump_00a_4719


jr_00a_4680:
    bit 5, a
    jr z, jr_00a_469a

    xor a
    ld [wMonType], a
    call HideCursor
    ld a, [w2DMenuDataEnd]
    ld b, a
    ld a, [wPartyCount]
    cp b
    jr nc, jr_00a_46a2

    ld [w2DMenuDataEnd], a
    jr jr_00a_46a2

jr_00a_469a:
    bit 7, a
    jp z, Jump_00a_4719

    jp Jump_00a_4891


Jump_00a_46a2:
jr_00a_46a2:
    xor a
    ld [wMonType], a
    ld a, $91
    ld [wMenuJoypadFilter], a
    ld a, [wPartyCount]
    ld [w2DMenuNumRows], a
    ld a, $01
    ld [w2DMenuNumCols], a
    ld a, $03
    ld [wMenuData3], a
    ld a, $02
    ld [w2DMenuCursorInitX], a
    ld a, $01
    ld [wMenuCursorX], a
    ld a, $20
    ld [w2DMenuCursorOffsets], a
    ld a, $20
    ld [w2DMenuFlags], a
    xor a
    ld [$cc27], a

Jump_00a_46d3:
    call Get2DMenuJoypad_NoPlaceCursor
    and a
    jr nz, jr_00a_46dc

    jp Jump_00a_4719


jr_00a_46dc:
    bit 0, a
    jr z, jr_00a_46f6

    jp Jump_00a_4723


    ld a, $04
    ld [wce34], a
    ld hl, $4c48
    ld a, $14
    call FarCall_hl
    call Call_00a_491b
    jp Jump_00a_4719


jr_00a_46f6:
    bit 4, a
    jr z, jr_00a_4712

    ld a, $01
    ld [wMonType], a
    call HideCursor
    ld a, [w2DMenuDataEnd]
    ld b, a
    ld a, [wd913]
    cp b
    jr nc, jr_00a_470f

    ld [w2DMenuDataEnd], a

jr_00a_470f:
    jp Jump_00a_462d


jr_00a_4712:
    bit 7, a
    jr z, jr_00a_4719

    jp Jump_00a_4891


Jump_00a_4719:
jr_00a_4719:
    ld a, [wMonType]
    and a
    jp z, Jump_00a_46d3

    jp Jump_00a_465f


Jump_00a_4723:
    call BackUpTilesToBuffer
    call PlaceHollowCursor
    ld a, [w2DMenuDataEnd]
    push af
    ld hl, $c3b8
    ld b, $02
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $c3e2
    ld de, $4859
    call PlaceString

Jump_00a_4740:
    ld a, $7f
    ld [$c3eb], a
    ld a, $13
    ld [wMenuJoypadFilter], a
    ld a, $01
    ld [w2DMenuNumRows], a
    ld a, $01
    ld [w2DMenuNumCols], a
    ld a, $10
    ld [wMenuData3], a
    ld a, $01
    ld [w2DMenuCursorInitX], a
    ld a, $01
    ld [w2DMenuDataEnd], a
    ld [wMenuCursorX], a
    ld a, $20
    ld [w2DMenuCursorOffsets], a
    xor a
    ld [w2DMenuFlags], a
    ld [$cc27], a
    call Get2DMenuJoypad_NoPlaceCursor
    bit 4, a
    jr nz, jr_00a_4787

    bit 1, a
    jr z, jr_00a_47c7

jr_00a_477d:
    pop af
    ld [w2DMenuDataEnd], a
    call ReloadTilesFromBuffer
    jp Jump_00a_46a2


jr_00a_4787:
    ld a, $7f
    ld [$c3e1], a
    ld a, $23
    ld [wMenuJoypadFilter], a
    ld a, $01
    ld [w2DMenuNumRows], a
    ld a, $01
    ld [w2DMenuNumCols], a
    ld a, $10
    ld [wMenuData3], a
    ld a, $0b
    ld [w2DMenuCursorInitX], a
    ld a, $01
    ld [w2DMenuDataEnd], a
    ld [wMenuCursorX], a
    ld a, $20
    ld [w2DMenuCursorOffsets], a
    xor a
    ld [w2DMenuFlags], a
    ld [$cc27], a
    call Get2DMenuJoypad_NoPlaceCursor
    bit 5, a
    jp nz, Jump_00a_4740

    bit 1, a
    jr nz, jr_00a_477d

    jr jr_00a_47e1

jr_00a_47c7:
    pop af
    ld [w2DMenuDataEnd], a
    ld a, $04
    ld [wce34], a
    ld hl, $4c48
    ld a, $14
    call FarCall_hl
    call Call_00a_491b
    call ReloadTilesFromBuffer
    jp Jump_00a_46a2


jr_00a_47e1:
    call PlaceHollowCursor
    pop af
    ld [w2DMenuDataEnd], a
    dec a
    ld [wcc40], a
    ld [wPlayerLinkAction], a
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    ld a, [wOtherPlayerLinkMode]
    cp $0f
    jp z, Jump_00a_460d

    ld [wcc41], a
    call Call_00a_490c
    ld c, $64
    call DelayFrames
    call Call_00a_493c
    jp c, Jump_00a_49e9

    xor a
    ld [$cb52], a
    ld [wOtherPlayerLinkAction], a
    ld a, [wcc41]
    ld hl, $d914
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [wNamedObjectIndexBuffer], a
    call GetPokemonName
    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $486b
    ld bc, $c3b9
    call TextCommandProcessor
    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $c3b9
    ld de, $4c7f
    call PlaceString
    ld a, $01
    ld [wPlayerLinkAction], a
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    ld c, $64
    call DelayFrames
    jp Jump_00a_460d


    adc h
    sub d
    add c
    adc a
    adc h
    db $dd
    ret nc

    reti


    ld a, a
    ld a, a
    cp d
    or e
    or [hl]
    sbc $c6
    jr nc, @-$41

    ld d, b
    nop
    or c
    or d
    jp $dc26


    ld h, $7f
    or h
    rst $10
    sbc $30
    ld a, a
    ld d, b
    ld bc, wStringBuffer1
    nop
    ret


    ld c, a
    ld [de], a
    db $e3
    adc a
    ld h, $7f
    cp d
    call c, $c3da
    or d
    reti


    sub $b3
    inc sp
    cp l
    rst $20
    rst $20
    ld e, b

Jump_00a_4891:
    ld a, [w2DMenuDataEnd]
    cp $01
    jp nz, Jump_00a_4719

    call HideCursor

jr_00a_489c:
    ld a, $ed
    ld [$c3e1], a

jr_00a_48a1:
    call GetJoypadDebounced
    ldh a, [hJoySum]
    and a
    jr z, jr_00a_48a1

    bit 0, a
    jr nz, jr_00a_48bf

    bit 6, a
    jr z, jr_00a_48a1

    ld a, $7f
    ld [$c3e1], a
    ld a, [wPartyCount]
    ld [w2DMenuDataEnd], a
    jp Jump_00a_46a2


jr_00a_48bf:
    ld a, $ec
    ld [$c3e1], a
    ld a, $0f
    ld [wPlayerLinkAction], a
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    ld a, [wOtherPlayerLinkMode]
    cp $0f
    jr nz, jr_00a_489c

Jump_00a_48d3:
    call ClearBGPalettes
    xor a
    ld [$d4a8], a
    ld a, $f8
    ldh [hMapEntryMethod], a
    call LoadMap
    call GBFadeInFromWhite
    ret


Call_00a_48e5:
Jump_00a_48e5:
    ld hl, $c3d7
    ld a, $7e
    ld bc, $0031
    call ByteFill
    ld hl, $c3cc
    ld b, $01
    ld c, $09
    call LinkTextboxAtHL
    ld hl, $c3e2
    ld de, $4903
    jp PlaceString


    cp d
    or e
    or [hl]
    sbc $c1
    pop hl
    or e
    cp h
    ld d, b

Call_00a_490c:
    ld a, [wOtherPlayerLinkMode]
    ld hl, $c2e8
    ld bc, $0028
    call AddNTimes
    ld [hl], $ec
    ret


Call_00a_491b:
    ld a, [w2DMenuDataEnd]
    dec a
    ld [wWhichPokemon], a
    call LowVolume
    ld a, $3b
    call Predef
    call ClearTileMap
    call MaxVolume
    call SetPalettes
    call Call_00a_4ccb
    call Call_00a_4992
    jp Jump_00a_48e5


Call_00a_493c:
    ld a, [wcc41]
    ld hl, wWildMons
    ld bc, $0030
    call AddNTimes
    push hl
    ld a, [wcc41]
    inc a
    ld c, a
    ld b, $00
    ld hl, wd913
    add hl, bc
    ld a, [hl]
    pop hl
    cp [hl]
    jr nz, jr_00a_4990

    ld b, h
    ld c, l
    ld hl, $001f
    add hl, bc
    ld a, [hl]
    cp $65
    jr nc, jr_00a_4990

    ld a, [wLinkMode]
    cp $01
    jr nz, jr_00a_498e

    ld hl, $d914
    ld a, [wcc41]
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [wSelectedItem], a
    call GetMonHeader
    ld hl, wc9ea
    add hl, bc
    add hl, bc
    ld a, [wMonHTypes]
    cp [hl]
    jr nz, jr_00a_4990

    inc hl
    ld a, [wMonHType2]
    cp [hl]
    jr nz, jr_00a_4990

jr_00a_498e:
    scf
    ret


jr_00a_4990:
    and a
    ret


Call_00a_4992:
    ld hl, $c2b4
    ld b, $0c
    ld c, $08
    call LinkTextboxAtHL
    ld hl, $c2be
    ld b, $0c
    ld c, $08
    call LinkTextboxAtHL
    ld hl, $c2b7
    ld de, wPlayerName
    call PlaceString
    ld hl, $c2c1
    ld de, wd8fe
    call PlaceString
    ld hl, $c2df
    ld de, wPartySpecies
    call Call_00a_49c7
    ld hl, $c2e9
    ld de, $d914

Call_00a_49c7:
    ld c, $00

jr_00a_49c9:
    ld a, [de]
    cp $ff
    ret z

    ld [wNamedObjectIndexBuffer], a
    push bc
    push hl
    push de
    push hl
    ld a, c
    ldh [hPrintNumLeadingDigit], a
    call GetPokemonName
    pop hl
    call PlaceString
    pop de
    inc de
    pop hl
    ld bc, $0028
    add hl, bc
    pop bc
    inc c
    jr jr_00a_49c9

Jump_00a_49e9:
    xor a
    ld [$cb52], a
    ld [wOtherPlayerLinkAction], a
    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld a, [wcc40]
    ld hl, wPartySpecies
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [wNamedObjectIndexBuffer], a
    call GetPokemonName
    ld hl, wStringBuffer1
    ld de, wMovementBufferPointerBank
    ld bc, $0006
    call CopyBytes
    ld a, [wcc41]
    ld hl, $d914
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [wNamedObjectIndexBuffer], a
    call GetPokemonName
    ld hl, $4c5c
    ld bc, $c3b9
    call TextCommandProcessor
    call BackUpTilesToBuffer
    ld hl, $c336
    ld b, $03
    ld c, $05
    call LinkTextboxAtHL
    ld de, $4c53
    ld hl, $c34c
    call PlaceString
    ld a, $08
    ld [wMenuData3], a
    ld a, $0b
    ld [w2DMenuCursorInitX], a
    ld a, $01
    ld [w2DMenuNumCols], a
    ld a, $02
    ld [w2DMenuNumRows], a
    xor a
    ld [w2DMenuFlags], a
    ld [$cc27], a
    ld a, $20
    ld [w2DMenuCursorOffsets], a
    ld a, $03
    ld [wMenuJoypadFilter], a
    ld a, $01
    ld [w2DMenuDataEnd], a
    ld [wMenuCursorX], a
    call Get2DMenuJoypad_NoPlaceCursor
    push af
    call ReloadTilesFromBuffer
    pop af
    bit 1, a
    jr nz, jr_00a_4a86

    ld a, [w2DMenuDataEnd]
    dec a
    jr z, jr_00a_4aa4

jr_00a_4a86:
    ld a, $01
    ld [wPlayerLinkAction], a
    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $c3b9
    ld de, $4c7f
    call PlaceString
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    jp Jump_00a_4c4b


jr_00a_4aa4:
    ld a, $02
    ld [wPlayerLinkAction], a
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    ld a, [wOtherPlayerLinkMode]
    dec a
    jr nz, jr_00a_4ac8

    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $c3b9
    ld de, $4c7f
    call PlaceString
    jp Jump_00a_4c4b


jr_00a_4ac8:
    ld hl, $ba68
    ld a, [wcc40]
    ld bc, $0028
    call AddNTimes
    ld a, $02
    call OpenSRAM
    ld d, h
    ld e, l
    ld bc, $0028
    add hl, bc
    ld a, [wcc40]
    ld c, a

jr_00a_4ae3:
    inc c
    ld a, c
    cp $06
    jr z, jr_00a_4af3

    push bc
    ld bc, $0028
    call CopyBytes
    pop bc
    jr jr_00a_4ae3

jr_00a_4af3:
    ld hl, $ba68
    ld a, [wPartyCount]
    dec a
    ld bc, $0028
    call AddNTimes
    push hl
    ld hl, $c8bc
    ld a, [wcc41]
    ld bc, $0028
    call AddNTimes
    pop de
    ld bc, $0028
    call CopyBytes
    call CloseSRAM
    ld hl, wPlayerName
    ld de, wReel1Field0d
    ld bc, $0006
    call CopyBytes
    ld a, [wcc40]
    ld hl, wPartySpecies
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld [wNamingScreenDestinationPointer], a
    ld a, [wcc40]
    ld hl, wPartyMon6StatsEnd
    call SkipNames
    ld de, wReel2Position
    ld bc, $0006
    call CopyBytes
    ld hl, wPartyMon1ID
    ld a, [wcc40]
    ld bc, $0030
    call AddNTimes
    ld a, [hl+]
    ld [wReel2ManipCounter], a
    ld a, [hl]
    ld [wReel2ManipDelay], a
    ld hl, wd8fe
    ld de, wReel3XCoord
    ld bc, $0006
    call CopyBytes
    ld a, [wcc41]
    ld hl, $d914
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld [wReel2Field0b], a
    ld a, [wcc41]
    ld hl, wOTPartyMonOT
    call SkipNames
    ld de, wReel3Field0e
    ld bc, $0006
    call CopyBytes
    ld hl, $d921
    ld a, [wcc41]
    ld bc, $0030
    call AddNTimes
    ld a, [hl+]
    ld [$c504], a
    ld a, [hl]
    ld [$c505], a
    ld a, [wcc40]
    ld [wWhichPokemon], a
    ld hl, wPartySpecies
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld [wcc40], a
    xor a
    ld [wcd7c], a
    ld hl, $5ecd
    ld a, $03
    call FarCall_hl
    ld a, [wcc41]
    ld c, a
    ld [wWhichPokemon], a
    ld hl, $d914
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [wMonDexIndex], a
    ld hl, wWildMons
    ld a, c
    ld bc, $0030
    call AddNTimes
    ld de, wcd7f
    ld bc, $0030
    call CopyBytes
    ld a, $11
    call Predef
    ld a, [wPartyCount]
    dec a
    ld [wWhichPokemon], a
    ld a, $01
    ld [wcab9], a
    ld a, [wcc41]
    ld hl, $d914
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld [wcc41], a
    ld c, $64
    call DelayFrames
    call ClearTileMap
    call LoadFontsBattleExtra
    ldh a, [hLinkPlayerNumber]
    cp $01
    jr z, jr_00a_4c10

    ld a, $2d
    call Predef
    jr jr_00a_4c15

jr_00a_4c10:
    ld a, $2c
    call Predef

jr_00a_4c15:
    ld hl, $5f93
    ld a, $10
    call FarCall_hl
    call ClearTileMap
    call Call_00a_4ccb
    call Serial_PrintWaitingTextAndSyncAndExchangeNybble
    ld c, $28
    call DelayFrames
    ld hl, $c390
    ld b, $04
    ld c, $12
    call LinkTextboxAtHL
    ld hl, $c3b9
    ld de, $4c73
    call PlaceString
    ld a, $45
    call Predef
    ld c, $32
    call DelayFrames
    jp Jump_00a_4056


Jump_00a_4c4b:
    ld c, $64
    call DelayFrames
    jp Jump_00a_460d


    cp d
    or e
    or [hl]
    sbc $4e
    call nc, $d9d2
    ld d, b
    ld bc, wMovementBufferPointerBank
    nop
    ld a, a
    call nz, Call_00a_507f
    ld bc, wStringBuffer1
    nop
    ld a, a
    db $dd
    ld c, a
    cp d
    or e
    or [hl]
    sbc $bc
    rst $08
    cp l
    ld d, a
    cp d
    or e
    or [hl]
    sbc $bc
    pop hl
    or e
    ret c

    ld [c], a
    or e
    rst $20
    ld d, b
    dec hl
    sbc $c8
    sbc $c5
    ld h, $d7
    ld c, [hl]
    cp d
    or e
    or [hl]
    sbc $ca
    ld a, a
    add [hl]
    xor l
    xor e
    adc l
    and [hl]
    cp e
    jp c, $bccf

    ret nz

    ld d, b

LinkTextboxAtHL::
    push hl
    ld a, $78
    ld [hl+], a
    inc a
    call Call_00a_4cc5
    inc a
    ld [hl], a
    pop hl
    ld de, $0014
    add hl, de

jr_00a_4ca7:
    push hl
    ld a, $7b
    ld [hl+], a
    ld a, $7f
    call Call_00a_4cc5
    ld [hl], $77
    pop hl
    ld de, $0014
    add hl, de
    dec b
    jr nz, jr_00a_4ca7

    ld a, $7c
    ld [hl+], a
    ld a, $76
    call Call_00a_4cc5
    ld [hl], $7d
    ret


Call_00a_4cc5:
    ld d, c

jr_00a_4cc6:
    ld [hl+], a
    dec d
    jr nz, jr_00a_4cc6

    ret


Call_00a_4ccb:
    ld de, $5ccc
    ld hl, $9760
    ld bc, $0a09
    jp Request2bpp


    ld b, c
    ld d, b
    ld h, h
    ld [hl-], a
    ld b, c
    ld d, l
    ld [hl-], a
    ld b, c
    ld d, l
    inc d
    add hl, de
    ld d, b
    inc d
    add hl, de
    dec l
    inc hl
    ld [hl-], a
    ld b, [hl]
    add hl, de
    ld [hl-], a
    rra
    dec a
    jr z, jr_00a_4d30

    ld [hl-], a
    ld e, d
    ld e, $37
    jr z, jr_00a_4d2c

    ld c, e
    jr z, @+$39

    ld c, e
    inc a
    ld d, l
    ld b, c
    ld h, h
    add hl, de
    ld [hl-], a
    jr z, jr_00a_4d4c

    ld c, e
    ld d, l
    ld h, h
    scf
    ld d, b
    jr z, jr_00a_4d62

    dec l
    ld b, [hl]
    jr z, jr_00a_4d4d

    ld [hl-], a
    ld d, b
    inc hl
    inc a
    ld [hl-], a
    ld d, b
    jr z, @+$34

    ld b, [hl]
    ld l, c
    ld a, b
    add a
    inc hl
    ld [hl-], a
    ld b, c
    ld b, [hl]
    ld d, l
    ld h, h
    ld h, h
    ld a, b
    ld e, $2d
    scf
    ld b, c
    ld d, b
    jr z, jr_00a_4d77

    ld e, a
    ld a, b
    ld a, [hl-]
    inc hl
    inc a

jr_00a_4d2c:
    ld b, [hl]
    ld e, a
    jr z, jr_00a_4d71

jr_00a_4d30:
    dec l
    ld d, l
    ld h, h
    ld [hl], e
    add d
    ld e, $5a
    ld [hl], e
    add hl, de
    ld [hl-], a
    scf
    ld d, b
    inc a
    ld a, l
    jr z, @+$34

    inc hl
    inc hl
    inc a
    inc a
    ld d, l
    ld e, $2d
    ld l, c
    ld h, h
    jr z, jr_00a_4d91

    ld e, a

jr_00a_4d4c:
    ld [hl-], a

jr_00a_4d4d:
    ld d, b
    ld b, [hl]
    ld h, h
    ld h, h
    scf
    ld e, a
    ld d, l
    ld d, l
    scf
    ld b, [hl]
    inc d
    ld h, h
    ld e, a
    jr nc, jr_00a_4d9d

    ld l, [hl]
    ld l, [hl]
    ld l, [hl]
    ld c, e
    ld e, d
    ld [hl], e

jr_00a_4d62:
    dec l
    ld b, [hl]
    inc a
    ld b, c
    ld a, l
    ld a, l
    ld a, l
    ld [hl-], a
    ld b, [hl]
    ld h, h
    sbc d
    ld h, h

Function28d6e::
    ld hl, wReel1Field0d

jr_00a_4d71:
    ld de, wReel3XCoord
    call Call_00a_5535

jr_00a_4d77:
    ld hl, wNamingScreenDestinationPointer
    ld de, wReel2Field0b
    call Call_00a_554a
    ld de, $4d85
    jr jr_00a_4dda

    dec de
    ld bc, $211c
    dec h
    ld [hl+], a
    inc bc
    inc h
    ld h, $24
    ld e, $06

jr_00a_4d91:
    ld d, $1f
    add hl, de
    rla
    rra
    ld c, $03
    inc hl
    dec b
    inc h
    ld [bc], a
    dec h

jr_00a_4d9d:
    inc h
    dec e
    ld hl, $181e
    rra
    daa

Function28da4::
    ld hl, wReel3XCoord
    ld de, wReel1Field0d
    call Call_00a_5535
    ld hl, wReel2Field0b
    ld de, wNamingScreenDestinationPointer
    call Call_00a_554a
    ld de, $4dbb
    jr jr_00a_4dda

    ld a, [de]
    rla
    rra
    ld b, $03
    inc hl
    dec b
    inc h
    ld [bc], a
    dec h
    inc h
    dec e
    ld hl, $181e
    rra
    dec de
    ld bc, $211c
    dec h
    ld [hl+], a
    inc bc
    inc h
    ld h, $24
    ld e, $0e
    ld d, $1f
    daa

jr_00a_4dda:
    ld hl, wReel3Stopped
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, wVramState
    ld a, [hl]
    push af
    res 0, [hl]
    ld hl, wce5f
    ld a, [hl]
    push af
    set 4, [hl]
    call Call_00a_4dff

jr_00a_4df1:
    call Call_00a_4e87
    jr nc, jr_00a_4df1

    pop af
    ld [wce5f], a
    pop af
    ld [wVramState], a
    ret


Call_00a_4dff:
    xor a
    ld [wJumptableIndex], a
    call ClearBGPalettes
    call ClearSprites
    call ClearTileMap
    call DisableLCD
    ld hl, $4cfd
    ld a, $23
    call FarCall_hl
    ld hl, vBGMap0
    ld bc, $0800
    ld a, $7f
    call ByteFill
    ld hl, $5661
    ld de, vTitleLogo2
    ld bc, $0310
    ld a, $0a
    call FarCopyData
    ld hl, TradeGameBoyGFX
    ld de, $8ed0
    ld bc, $0010
    ld a, $0a
    call FarCopyData
    ld hl, $5651
    ld de, $8ee0
    ld bc, $0010
    ld a, $0a
    call FarCopyData
    xor a
    ldh [hSCX], a
    ldh [hSCY], a
    ld a, $07
    ldh [hWX], a
    ld a, $90
    ldh [hWY], a
    call EnableLCD
    call Call_00a_5560
    ld a, [wNamingScreenDestinationPointer]
    ld de, vChars0
    call Call_00a_51fd
    ld a, [wReel2Field0b]
    ld de, $8310
    call Call_00a_51fd
    ld a, [wNamingScreenDestinationPointer]
    ld de, wReel1TilemapAddr
    call Call_00a_520c
    ld a, [wReel2Field0b]
    ld de, wReel2Field0c
    call Call_00a_520c
    call Call_00a_5524
    ret


Call_00a_4e87:
    ld a, [wJumptableIndex]
    bit 7, a
    jr nz, jr_00a_4ea2

    call Call_00a_4ea7
    ld hl, $4d13
    ld a, $23
    call FarCall_hl
    ld hl, wIntroSceneTimer
    inc [hl]
    call DelayFrame
    and a
    ret


jr_00a_4ea2:
    call LoadFont
    scf
    ret


Call_00a_4ea7:
    ld a, [wJumptableIndex]
    ld e, a
    ld d, $00
    ld hl, $4eb6
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    dec bc
    ld c, a
    jp hl


    ld d, c
    di
    ld d, c
    add hl, de
    ld d, c
    add hl, sp
    ld d, c
    ld c, h
    ld d, c
    jr nz, @+$51

    and c
    ld c, a
    or [hl]
    ld c, a
    bit 1, a
    ld d, c
    ld d, b
    ld [de], a
    ld d, b
    ld d, c
    ld d, b
    dec de
    ld d, b
    inc sp
    ld c, a
    ld d, c
    ld d, b
    jp c, $ef4f

    ld c, a
    inc bc
    ld d, b
    ld [de], a
    ld d, b
    ld d, c
    ld d, b
    dec de
    ld d, b
    add $53
    ld [de], a
    ld d, h
    ld c, b
    ld d, h
    ld a, d
    ld d, h
    cp l
    ld d, h
    ld h, c
    ld d, c
    ld [hl], c
    ld d, c
    adc l
    ld d, c
    sbc c

Call_00a_4ef3:
    ld d, c
    and l
    ld d, c
    rst $00
    ld d, c
    ld b, a
    ld d, d
    rst $20
    ld d, d
    ld hl, sp+$52
    xor h
    ld d, l
    dec d
    ld d, e
    ld h, $53
    ld a, [de]
    ld c, a

Call_00a_4f06:
    ld hl, wJumptableIndex
    inc [hl]
    ret


Call_00a_4f0b:
    ld hl, wReel3Stopped
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld [wJumptableIndex], a
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    ret


    ld hl, wJumptableIndex
    set 7, [hl]
    ret


    ld a, $ed
    call Call_00a_50d6
    ld a, [wCurReelYCoord]
    ld [wNamedObjectIndexBuffer], a
    xor a
    ld de, $2c58
    ld b, $00
    jr jr_00a_4f45

    ld a, $ee
    call Call_00a_50d6
    ld a, [$c515]
    ld [wNamedObjectIndexBuffer], a
    ld a, $02
    ld de, $4c94
    ld b, $04

jr_00a_4f45:
    push bc
    push de
    push bc
    push de
    push af
    call DisableLCD
    ld hl, $4cfd
    ld a, $23
    call FarCall_hl
    ld hl, $9874
    ld bc, $000c
    ld a, $60
    call ByteFill
    pop af
    call Call_00a_5061
    xor a
    ldh [hSCX], a
    ld a, $07
    ldh [hWX], a
    ld a, $70
    ldh [hWY], a
    call EnableLCD
    call Call_00a_558d
    pop de
    ld a, $48
    call InitSpriteAnimStruct
    ld hl, $000b
    add hl, bc
    pop bc
    ld [hl], b
    pop de
    ld a, $49
    call InitSpriteAnimStruct
    ld hl, $000b
    add hl, bc
    pop bc
    ld [hl], b
    call WaitBGMap
    ld a, $e4
    ldh [rBGP], a
    ld a, $d0
    ldh [rOBP0], a
    call Call_00a_4f06
    ld a, $5c
    ld [wMemoryGameCardChoice], a
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    add $02
    ldh [hSCX], a
    cp $50
    ret nz

    ld a, $01
    call Call_00a_5061
    call Call_00a_4f06
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    add $02
    ldh [hSCX], a
    cp $a0
    ret nz

    ld a, $02
    call Call_00a_5061
    call Call_00a_4f06
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    add $02
    ldh [hSCX], a
    and a
    ret nz

    call Call_00a_4f06
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    sub $02
    ldh [hSCX], a
    cp $b0
    ret nz

    ld a, $01
    call Call_00a_5061
    call Call_00a_4f06
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    sub $02
    ldh [hSCX], a
    cp $60
    ret nz

    xor a
    call Call_00a_5061
    call Call_00a_4f06
    ret


    call Call_00a_5553
    ldh a, [hSCX]
    sub $02
    ldh [hSCX], a
    and a
    ret nz

    call Call_00a_4f06
    ret


    ld a, $80
    ld [wMemoryGameCardChoice], a
    call Call_00a_4f06
    ret


    call ClearBGPalettes
    call ClearTileMap
    call ClearSprites
    call DisableLCD
    ld hl, $4cfd
    ld a, $23
    call FarCall_hl
    ld hl, vBGMap0
    ld bc, $0800
    ld a, $7f
    call ByteFill
    xor a
    ldh [hSCX], a
    ld a, $90
    ldh [hWY], a
    call EnableLCD
    call Call_00a_5560
    call WaitBGMap
    call Call_00a_5524
    call Call_00a_4f0b
    ret


    call Call_00a_5553
    ld hl, wMemoryGameCardChoice
    ld a, [hl]
    and a
    jr z, jr_00a_505d

    dec [hl]
    ret


jr_00a_505d:
    call Call_00a_4f06
    ret


Call_00a_5061:
    and $03
    ld e, a
    ld d, $00
    ld hl, $506f
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld [hl], a
    ld d, b
    adc a
    ld d, b
    sbc [hl]
    ld d, b
    ld [hl], a
    ld d, b
    call Call_00a_5506
    ld hl, $c2e5
    ld [hl], $5b

Call_00a_507f:
    inc hl
    ld bc, $000a
    ld a, $60
    call ByteFill
    ld hl, $c2cb
    call Call_00a_50cc
    ret


    call Call_00a_5506
    ld hl, $c2dc
    ld bc, $0014
    ld a, $60
    call ByteFill
    ret


    call Call_00a_5506
    ld hl, $c2dc
    ld bc, $0011
    ld a, $60
    call ByteFill
    ld hl, $c2ed
    ld a, $5d
    ld [hl], a
    ld a, $61
    ld de, $0014
    ld c, $03

jr_00a_50b9:
    add hl, de
    ld [hl], a
    dec c
    jr nz, jr_00a_50b9

    add hl, de
    ld a, $5f
    ld [hl-], a
    ld a, $5b
    ld [hl], a
    ld hl, $c322
    call Call_00a_50cc
    ret


Call_00a_50cc:
    ld de, $55ed
    ld bc, $0806
    call Call_00a_5512
    ret


Call_00a_50d6:
    push af
    call ClearBGPalettes
    call WaitForAutoBgMapTransfer
    ld a, $9c
    ldh [$e1], a
    call ClearTileMap
    ld hl, wShadowOAMEnd
    ld bc, $0014
    ld a, $7a
    call ByteFill
    ld hl, $c2c9
    ld de, wMemoryGameCounter
    call PlaceString
    ld hl, $c2d6
    ld de, wCurReelStopped
    call PlaceString
    ld hl, $c2cf
    ld bc, $0006
    pop af
    call ByteFill
    call WaitBGMap
    call WaitForAutoBgMapTransfer
    ld a, $98
    ldh [$e1], a
    call ClearTileMap
    ret


    call ClearTileMap
    call WaitForAutoBgMapTransfer
    ld a, $a0
    ldh [hSCX], a
    call DelayFrame
    ld hl, $c2d0
    ld de, $561d
    ld bc, $030c
    call Call_00a_5512
    call WaitBGMap
    call Call_00a_4f06
    ret


    ldh a, [hSCX]
    and a
    jr z, jr_00a_5143

    add $04
    ldh [hSCX], a
    ret


jr_00a_5143:
    ld c, $50
    call DelayFrames
    call Call_00a_4f0b
    ret


    ldh a, [hSCX]
    cp $a0
    jr z, jr_00a_5157

    sub $04
    ldh [hSCX], a
    ret


jr_00a_5157:
    call ClearTileMap
    xor a
    ldh [hSCX], a
    call Call_00a_4f0b
    ret


    ld a, $87
    ldh [hWX], a
    ld a, $80
    ldh [hSCX], a
    ld a, $50
    ldh [hWY], a
    call Call_00a_4f0b
    ret


    ldh a, [hWX]
    cp $07
    jr z, jr_00a_5182

    sub $04
    ldh [hWX], a
    ldh a, [hSCX]
    sub $04
    ldh [hSCX], a
    ret


jr_00a_5182:
    ld a, $07
    ldh [hWX], a
    xor a
    ldh [hSCX], a
    call Call_00a_4f0b
    ret


    ld a, $07
    ldh [hWX], a
    ld a, $50
    ldh [hWY], a
    call Call_00a_4f0b
    ret


    ld a, $07
    ldh [hWX], a
    ld a, $90
    ldh [hWY], a
    call Call_00a_4f0b
    ret


    call WaitForAutoBgMapTransfer
    ld a, $9c
    ldh [$e1], a
    call WaitBGMap
    ld a, $07
    ldh [hWX], a
    xor a
    ldh [hWY], a
    call DelayFrame
    call WaitForAutoBgMapTransfer
    ld a, $98
    ldh [$e1], a
    call ClearTileMap
    call Call_00a_4f06
    ret


    ldh a, [hWX]
    cp $a1
    jr nc, jr_00a_51d2

    inc a
    inc a
    ldh [hWX], a
    ret


jr_00a_51d2:
    ld a, $9c
    ldh [$e1], a
    call WaitBGMap
    ld a, $07
    ldh [hWX], a
    ld a, $90
    ldh [hWY], a
    ld a, $98
    ldh [$e1], a
    call Call_00a_4f0b
    ret


    call Call_00a_5250
    call Call_00a_521e
    call Call_00a_4f0b
    ret


    call Call_00a_526f
    call Call_00a_5223
    call Call_00a_4f0b
    ret


Call_00a_51fd:
    push de
    ld [wMonDexIndex], a
    ld [wSelectedItem], a
    call GetMonHeader
    pop de
    call LoadMonFrontSprite
    ret


Call_00a_520c:
    push de
    ld [wNamedObjectIndexBuffer], a
    call GetPokemonName
    ld hl, wStringBuffer1
    pop de
    ld bc, $0006
    call CopyBytes
    ret


Call_00a_521e:
    ld de, vChars0
    jr jr_00a_5226

Call_00a_5223:
    ld de, $8310

jr_00a_5226:
    ld hl, vChars2
    ld bc, $0a31
    call Request2bpp
    call WaitForAutoBgMapTransfer
    call Call_00a_5506
    ld hl, $c2cf
    xor a
    ldh [hGraphicStartTile], a
    ld bc, $0707
    ld a, $1f
    call Predef
    call WaitBGMap
    ret


    ld c, $50
    call DelayFrames
    call Call_00a_4f0b
    ret


Call_00a_5250:
    call Call_00a_528e
    ld de, wNamingScreenDestinationPointer
    call Call_00a_52c5
    ld de, wReel1TilemapAddr
    call Call_00a_52cf
    ld de, wReel2Position
    call Call_00a_52d6
    ld de, wReel2ManipCounter
    call Call_00a_52dd
    call Call_00a_52ba
    ret


Call_00a_526f:
    call Call_00a_528e
    ld de, wReel2Field0b
    call Call_00a_52c5
    ld de, wReel2Field0c
    call Call_00a_52cf
    ld de, wReel3Field0e
    call Call_00a_52d6
    ld de, $c504
    call Call_00a_52dd
    call Call_00a_52ba
    ret


Call_00a_528e:
    call WaitForAutoBgMapTransfer
    call Call_00a_5506
    ld a, $9c
    ldh [$e1], a
    ld hl, $c2a5
    ld b, $06
    ld c, $09
    call DrawTextBox
    ld hl, $c2a6
    ld de, $52ac
    call PlaceString
    ret


    ld a, d
    ld a, d
    ld [hl], h
    ld a, [c]
    ld c, [hl]
    ld c, [hl]
    or l
    call nc, Call_00a_4ef3
    ld [hl], e
    ld [hl], h
    ld a, [c]
    ld d, b

Call_00a_52ba:
    call WaitBGMap
    call WaitForAutoBgMapTransfer
    ld a, $98
    ldh [$e1], a
    ret


Call_00a_52c5:
    ld hl, $c2aa
    ld bc, $8103
    call PrintNumber
    ret


Call_00a_52cf:
    ld hl, $c2ce
    call PlaceString
    ret


Call_00a_52d6:
    ld hl, $c2f9
    call PlaceString
    ret


Call_00a_52dd:
    ld hl, $c321
    ld bc, $8205
    call PrintNumber
    ret


    ld de, $5458
    ld a, $45
    call InitSpriteAnimStruct
    call Call_00a_4f0b
    ld a, $40
    ld [wMemoryGameCardChoice], a
    ret


    ld de, $5458
    ld a, $45
    call InitSpriteAnimStruct
    ld hl, $000b
    add hl, bc
    ld [hl], $01
    ld hl, $0007
    add hl, bc
    ld [hl], $dc
    call Call_00a_4f0b
    ld a, $38
    ld [wMemoryGameCardChoice], a
    ret


    ld de, $5458
    ld a, $46
    call InitSpriteAnimStruct
    call Call_00a_4f0b
    ld a, $10
    ld [wMemoryGameCardChoice], a
    ret


    ld a, $e4
    ldh [rOBP0], a
    ld de, $2858
    ld a, $47
    call InitSpriteAnimStruct
    call Call_00a_4f0b
    ld a, $80
    ld [wMemoryGameCardChoice], a
    ret


    ld hl, $000b
    add hl, bc
    ld e, [hl]
    ld d, $00
    ld hl, $534b
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld e, a
    ld d, e
    ld l, c
    ld d, e
    ld [hl], h
    ld d, e
    add d
    ld d, e
    sub h
    ld d, e
    and d
    ld d, e
    or a
    ld d, e

Call_00a_5359:
    ld hl, $000b
    add hl, bc
    inc [hl]
    ret


    call Call_00a_5359
    ld hl, $000c
    add hl, bc
    ld [hl], $80
    ret


    ld hl, $000c
    add hl, bc
    ld a, [hl]
    dec [hl]
    and a
    ret nz

    call Call_00a_5359
    ld hl, $0004
    add hl, bc
    ld a, [hl]
    cp $94
    jr nc, jr_00a_537f

    inc [hl]
    ret


jr_00a_537f:
    call Call_00a_5359
    ld hl, $0005
    add hl, bc
    ld a, [hl]
    cp $4c
    jr nc, jr_00a_538d

    inc [hl]
    ret


jr_00a_538d:
    ld hl, $0000
    add hl, bc
    ld [hl], $00
    ret


    ld hl, $0005
    add hl, bc
    ld a, [hl]
    cp $2c
    jr z, jr_00a_539f

    dec [hl]
    ret


jr_00a_539f:
    call Call_00a_5359
    ld hl, $0004
    add hl, bc
    ld a, [hl]
    cp $58
    jr z, jr_00a_53ad

    dec [hl]
    ret


jr_00a_53ad:
    call Call_00a_5359
    ld hl, $000c
    add hl, bc
    ld [hl], $80
    ret


    ld hl, $000c
    add hl, bc
    ld a, [hl]
    dec [hl]
    and a
    ret nz

    ld hl, $0000
    add hl, bc
    ld [hl], $00
    ret


    ld a, [wLinkMode]
    cp $01
    jr z, jr_00a_53ea

    ld hl, $5410
    call PrintText
    ld c, $bd
    call DelayFrames
    ld hl, $53f7
    call PrintText
    call Call_00a_5500
    ld c, $80
    call DelayFrames
    call Call_00a_4f0b
    ret


jr_00a_53ea:
    ld hl, $53f7
    call PrintText
    call Call_00a_5500
    call Call_00a_4f0b
    ret


    ld bc, wReel1TilemapAddr
    nop
    jp z, $3c7f

    inc l
    ld c, a
    ld d, b
    ld bc, wReel3XCoord
    nop
    add $7f
    res 6, a
    call nz, $dad7
    rst $08
    cp h
    ret nz

    ld d, a
    nop
    ld d, a
    ld hl, $5428
    call PrintText
    call Call_00a_5500
    ld hl, $543a
    call PrintText
    call Call_00a_5500
    call Call_00a_4f0b
    ret


    ld bc, wReel3XCoord
    nop
    ld h, $4f
    push bc
    ld a, [hl+]
    ret c

    db $dd
    ld a, a
    or l
    cp h
    ret nc

    push bc
    ld h, $d7
    ld d, a
    ld bc, wReel2Field0c
    nop
    db $dd
    ld c, a
    or l
    cp b
    rst $18
    jp $cfb7


    cp l
    ld d, a
    call WaitForAutoBgMapTransfer
    ld hl, $c368
    ld bc, $00a0
    ld a, $7f
    call ByteFill
    call WaitBGMap
    ld hl, $5466
    call PrintText
    call Call_00a_5500
    call Call_00a_4f0b
    ret


    ld bc, wReel2Field0c
    nop
    db $dd
    ld c, a
    or [hl]
    call c, Call_000_26b2
    rst $18
    jp $dfd4


    jp $30b8


    cp e
    or d
    ld d, a
    ld hl, $5495
    call PrintText
    call Call_00a_5500
    ld hl, $54ab
    call PrintText
    call Call_00a_5500
    ld c, $0e
    call DelayFrames
    call Call_00a_4f0b
    ret


    ld bc, wReel1Field0d
    nop
    ld h, $4f
    ld d, b
    ld bc, wReel1TilemapAddr
    nop
    db $dd
    ld a, a
    or l
    cp b
    rst $18
    ret nz

    or [hl]
    call c, $c6d8
    ld d, a
    ld bc, wReel3XCoord
    nop
    jp z, $504f

    ld bc, wReel2Field0c
    nop
    db $dd
    ld a, a
    cp b
    jp c, $bdcf

    ld d, a
    ld hl, $54d8
    call PrintText
    call Call_00a_5500
    ld hl, $54eb
    call PrintText
    call Call_00a_5500
    ld c, $0e
    call DelayFrames
    call Call_00a_4f0b
    ret


    nop
    cp d
    jp c, $d7b6

    ld c, a
    ld d, b
    ld bc, wReel3XCoord
    nop
    ret


    ld d, b
    ld bc, wReel2Field0c
    nop
    call nz, $0157
    db $dd
    call nz, $c900
    ld d, b
    ld bc, wReel1TilemapAddr
    nop
    db $dd
    ld c, a
    cp d
    or e
    or [hl]
    sbc $bc
    rst $08
    cp l
    rst $20
    ld d, a

Call_00a_5500:
    ld c, $50
    call DelayFrames
    ret


Call_00a_5506:
    ld hl, wShadowOAMEnd
    ld bc, VBlank.return
    ld a, $7f
    call ByteFill
    ret


Call_00a_5512:
jr_00a_5512:
    push bc
    push hl

jr_00a_5514:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_00a_5514

    pop hl
    ld bc, $0014
    add hl, bc
    pop bc
    dec b
    jr nz, jr_00a_5512

    ret


Call_00a_5524:
    ld a, [wSGB]
    and a
    ld a, $e4
    jr z, jr_00a_552e

    ld a, $f0

jr_00a_552e:
    ldh [rOBP0], a
    ld a, $e4
    ldh [rBGP], a
    ret


Call_00a_5535:
    push de
    ld de, wMemoryGameCounter
    ld bc, $0006
    call CopyBytes
    pop hl
    ld de, wCurReelStopped
    ld bc, $0006
    call CopyBytes
    ret


Call_00a_554a:
    ld a, [hl]
    ld [wCurReelYCoord], a
    ld a, [de]
    ld [$c515], a
    ret


Call_00a_5553:
    ld a, [wIntroSceneTimer]
    and $07
    ret nz

    ldh a, [rBGP]
    xor $3c
    ldh [rBGP], a
    ret


Call_00a_5560:
    ld de, $49a0
    ld hl, $8620
    ld bc, $2106
    call Request2bpp
    ld de, $4530
    ld hl, $8680
    ld bc, $210c
    call Request2bpp
    ld de, $5971
    ld hl, $8740
    ld bc, $0a04
    call Request2bpp
    ld a, $08
    ld hl, wSpriteAnimDict
    ld [hl+], a
    ld [hl], $62
    ret


Call_00a_558d:
    ld e, $03
    ld hl, $70e3
    ld a, $23
    call FarCall_hl
    ld de, $5991
    ld hl, $8720
    ld bc, $0a04
    call Request2bpp
    ld a, $08
    ld hl, wSpriteAnimDict
    ld [hl+], a
    ld [hl], $62
    ret


    ld hl, wMemoryGameCardChoice
    ld a, [hl]
    and a
    jr z, jr_00a_55b5

    dec [hl]
    ret


jr_00a_55b5:
    call Call_00a_4f0b
    ret


    ld hl, $55db
    ld a, [hl+]
    ld [wNamingScreenDestinationPointer], a
    ld de, wReel1Field0d
    ld c, $08

jr_00a_55c5:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_00a_55c5

    ld a, [hl+]
    ld [wReel2Field0b], a
    ld de, wReel3XCoord
    ld c, $08

jr_00a_55d4:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_00a_55d4

    ret


    inc bc
    ld [$9be3], sp
    ret c

    ld d, b
    ld d, b
    inc hl
    ld bc, $8706
    ret c

    db $e3
    sub b
    xor l
    ld d, b
    ld d, [hl]
    inc b
    ld sp, $3232
    ld [hl-], a
    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $36
    scf
    jr c, jr_00a_562e

    add hl, sp
    ld a, [hl-]
    ld a, [hl-]
    dec sp
    jr c, jr_00a_563c

    dec a
    ld a, $3e
    ccf
    ld b, b
    ld b, c
    ld b, d
    ld b, e
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld b, e
    ld c, b
    ld c, c
    ld c, d
    ld b, c
    ld b, e
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, b
    ld d, b
    ld d, c
    ld d, d
    ld b, e
    ld d, l
    ld d, [hl]
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld d, e
    ld b, e
    ld d, a
    ld e, b
    ld d, h
    ld d, h

jr_00a_562e:
    ld d, h
    ld d, h
    ld d, h
    ld d, h
    ld d, h
    ld d, h
    ld d, h
    ld b, e
    ld e, c
    ld e, d
    ld b, e
    ld b, e
    ld b, e
    ld b, e

jr_00a_563c:
    ld b, e
    ld b, e
    ld b, e
    ld b, e
    ld b, e
