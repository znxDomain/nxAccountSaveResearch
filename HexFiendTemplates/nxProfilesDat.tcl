big_endian
section "Header" {
    bytes 8 "header"
    bytes 8 "unused"
}
for {set i 0} {$i < 8} {incr i} {
	section "User $i" {
		uuid  "user_id_1"
		uuid  "user_id_2"
		uint64 "last_edit_time"
		ascii 32 "account_name"
		hex 1 "unknown"
		hex 1 "unknown"
		hex 2 "unused"
		hex 1 "icon_id (0 = Mii)"
		hex 3 "unused"
		hex 1 "background_color_id"
		hex 3 "unknown (0x000010)"
		hex 4 "unused"
		bytes 44 "mii id?"
		hex 20 "previous_account_name?"
		hex 1 "unknown"
		hex 3 "unused"
		hex 1 "unknown"
		bytes 43 "unused"
	}
}
