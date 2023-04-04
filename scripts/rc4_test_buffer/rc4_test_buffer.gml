///@func rc4_test_buffer()
function rc4_test_buffer() {

	// Generate new buffer
	var contents = array_create(128);
	var testBuffer = buffer_create(128, buffer_fixed, 1);
	for (var i = 0; i < 128; ++i) {
		var byte = irandom(255);
		contents[i] = byte;
		buffer_write(testBuffer, buffer_u8, byte);
	}

	// Generate new key
	var key = "";
	repeat (16) key += chr(irandom_range(33, 127));

	// RC4 encode-decode cycle
	rc4(testBuffer, key, 0, 128);
	rc4(testBuffer, key, 0, 128);

	// Assert equivalence
	buffer_seek(testBuffer, buffer_seek_start, 0);
	for (var i = 0; i < 128; ++i) {
		assert_equal(real(buffer_read(testBuffer, buffer_u8)), contents[i]);
	}

	// Cleanup
	buffer_delete(testBuffer);


}
