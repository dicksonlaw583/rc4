///@func rc4(buffer, key, offset, length)
///@param {Id.Buffer} buffer The buffer to apply RC4 on.
///@param {String} key The key string to use.
///@param {Real} offset (Optional) The offset from the start to work from. Default: 0
///@param {Real} length (Optional) The number of bytes to encrypt from the starting offset. Default: Whole buffer
///@return {Id.Buffer}
///@desc Apply RC4 encryption or decryption with the given key on the buffer, then return the buffer.
function rc4(buffer, key, offset=0, length=buffer_get_size(buffer)-offset+1) {
	var i, j, s, temp, keyLength, pos;
	s = array_create(256);
	keyLength = string_byte_length(key);
	for (i = 255; i >= 0; --i) {
		s[i] = i;
	}
	j = 0;
	for (i = 0; i <= 255; ++i) {
		j = (j + s[i] + string_byte_at(key, i mod keyLength)) mod 256;
		temp = s[i];
		s[i] = s[j];
		s[j] = temp;
	}
	i = 0;
	j = 0;
	pos = 0;
	buffer_seek(buffer, buffer_seek_start, offset);
	repeat (length) {
		i = (i+1) mod 256;
		j = (j+s[i]) mod 256;
		temp = s[i];
		s[i] = s[j];
		s[j] = temp;
		var currentByte = buffer_peek(buffer, pos++, buffer_u8);
		buffer_write(buffer, buffer_u8, s[(s[i]+s[j]) mod 256] ^ currentByte);
	}
	return buffer;
}

///@func rc4_decode_string(str, key)
///@param {String} str The plaintext string to encrypt.
///@param {String} key The key string to use.
///@return {String}
///@desc Apply RC4 encryption with the given key on the plaintext, then return a ciphertext in base64 form.
function rc4_decode_string(str, key) {
	var buffer = buffer_base64_decode(str);
	rc4(buffer, key, 0, buffer_get_size(buffer));
	buffer_seek(buffer, buffer_seek_start, 0);
	var decoded = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	///Feather disable GM1045
	return decoded;
	///Feather enable GM1045
	
}

///@func rc4_encode_string(str, key)
///@param {String} str The base64 ciphertext to decrypt.
///@param {String} key The key string to use.
///@return {String}
///@desc Apply RC4 decryption with the given ke on the ciphertext, then return a plaintext in string form.
function rc4_encode_string(str, key) {
	var length = string_byte_length(str);
	var buffer = buffer_create(length+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, str);
	rc4(buffer, key, 0, buffer_tell(buffer));
	var encoded = buffer_base64_encode(buffer, 0, length);
	buffer_delete(buffer);
	return encoded;
}
