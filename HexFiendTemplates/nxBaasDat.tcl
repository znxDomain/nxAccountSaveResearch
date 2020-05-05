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
    hex 8 "unknown"
    hex 8 "unknown"
	set nas_id [hex 8 "nas_id_raw"]
	set nas_id_corrected [string'reversebytes $nas_id]
	entry "nas_id_corrected" [string range $nas_id_corrected 0 [string length $nas_id_corrected]-3]
    hex 8 "unknown"
    hex 8 "unknown"
    ascii 40 "unknown"
}
