proc string'reversebytes str {
   set res {}
   set i [string length $str]
   while {$i > 0} {
   	 append res [string index $str $i-2]
   	 append res [string index $str [incr i -1]]
   	 incr i -1
   	}
   set res
}

big_endian
section "Header" {
	# 0x00
    hex 8 "unknown"
    hex 8 "unknown"
	# 0x10
	set nas_id [hex 8 "nas_id_raw"]
	set nas_id_corrected [string'reversebytes $nas_id]
	entry "nas_id" [string range $nas_id_corrected 0 [string length $nas_id_corrected]-3]
    hex 8 "unknown"
	# 0x20
	set user_id [hex 8 "baas_user_id_raw"]
	set user_id_corrected [string'reversebytes $user_id]
	entry "baas_user_id" [string range $user_id_corrected 0 [string length $user_id_corrected]-3]
    ascii 40 "baas_password"
}
