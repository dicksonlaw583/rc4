#define rc4
///@func rc4(@buffer, key, offset, length)
///@param buffer
///@param key
///@param offset
///@param length

var i, j, s, temp, keyLength, pos;
s = array_create(256);
keyLength = string_byte_length(argument1);
for (var i = 255; i >= 0; --i) {
	s[i] = i;
}
j = 0;
for (var i = 0; i <= 255; ++i) {
	j = (j + s[i] + string_byte_at(argument1, i mod keyLength)) mod 256;
	temp = s[i];
	s[i] = s[j];
	s[j] = temp;
}
i = 0;
j = 0;
pos = 0;
buffer_seek(argument0, buffer_seek_start, argument2);
repeat (argument3) {
	i = (i+1) mod 256;
	j = (j+s[i]) mod 256;
	temp = s[i];
	s[i] = s[j];
	s[j] = temp;
	var currentByte = buffer_peek(argument0, pos++, buffer_u8);
	buffer_write(argument0, buffer_u8, s[(s[i]+s[j]) mod 256] ^ currentByte);
}
return argument0;

#define rc4_decode_string
///@func rc4_decode_string(str, key)
///@param str
///@param key
var buffer = buffer_base64_decode(argument0);
rc4(buffer, argument1, 0, buffer_get_size(buffer));
buffer_seek(buffer, buffer_seek_start, 0);
var decoded = buffer_read(buffer, buffer_string);
buffer_delete(buffer);
return decoded;

#define rc4_encode_string
///@func rc4_encode_string(str, key)
///@param str
///@param key
var length = string_byte_length(argument0);
var buffer = buffer_create(length+1, buffer_fixed, 1);
buffer_write(buffer, buffer_string, argument0);
rc4(buffer, argument1, 0, buffer_tell(buffer));
var encoded = buffer_base64_encode(buffer, 0, length);
buffer_delete(buffer);
return encoded;
