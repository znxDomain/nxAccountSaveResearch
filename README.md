# nxAccountSaveResearch
Research into the Nintendo Switch Account System Save

## SaveID
8000000000000010

## Files
Files in the Account save:
```
save:/su/avators/
save:/su/baas/
save:/su/cache/
save:/su/nas/
save:/su/registry.dat
save:/su/avators/profiles.dat
save:/su/avators/[uuid].jpg
save:/su/baas/[uuid].dat
save:/su/nas/[nasid]_id.token
save:/su/nas/[nasid]_refresh.token
save:/su/nas/[nasid]_user.json
save:/su/nas/[nasid].dat
```

## File Format

See the Hex Fiend templates in this repo.

### profiles.dat

Offset | Length | What
-----  | -----  | -----
0x0  | 0x8  | header
0x8  | 0x8  | unused?

User Blocks repeat following the intro:

User Block is 200 (0xC8) byte

Offset | Length | What
----- | ------ | -----
0x10 | 0x10 | user_id_1
0x20 | 0x10 | user_id_2
0x30 | 0x8  | last_edit_time
0x38 | 0x20 | account_name
0x58 | 0x4  | unknown
0x5C | 0x4  | icon_id (0 = Mii, other = Characters)
0x60 | 0x1  | background_color_id
0x61 | 0x7  | unknown
0x68 | 0x2C | mii_generation_specs?
0x72 | 0x20 | previous_account_name? (null separated)
0x94 | 0x30 | unknown

8 users at the following offsets:
- 0x10, 0xD8, 0x1A0, 0x268,
  0x330, 0x3F8, 0x4C0, 0x58F

### registry.dat

Offset | Length | What
-----  | -----  | -----
0x0  | 0x10  | header
0x10  | 0x10  | SU UUID?
0x20  | 0x10  | user UUID 1
0x30  | 0x10  | user UUID 2
0x40  | 0x10  | user UUID 3
0x50  | 0x10  | user UUID 4
0x60  | 0x10  | user UUID 5
0x70  | 0x10  | user UUID 6
0x80  | 0x10  | user UUID 7
0x90  | 0x10  | user UUID 8
0xA0  | 0x10  | user UUID 9

### baas/[uuid].dat
This file is what links a UUID to a NAS ID.
I don't know much about it, except that the NAS ID is in a file that is named with the accounts UUID.

The NASID is 8 bytes at 0x10.  Each byte is big-endian and the whole thing needs reversed.
