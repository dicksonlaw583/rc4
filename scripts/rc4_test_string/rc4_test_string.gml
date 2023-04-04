///@func rc4_test_string()
function rc4_test_string() {

	// Generate new buffer
	var expectedString = "";
	for (var i = 0; i < 128; ++i) {
		expectedString += chr(irandom_range(33, 127));
	}

	// Generate new key
	var key = "";
	repeat (16) key += chr(irandom_range(33, 127));

	// RC4 encode-decode cycle
	var encryptedString, decryptedString;
	encryptedString = rc4_encode_string(expectedString, key);
	decryptedString = rc4_decode_string(encryptedString, key);

	// Assert equivalence
	assert_not_equal(encryptedString, expectedString);
	assert_equal(decryptedString, expectedString);



}
