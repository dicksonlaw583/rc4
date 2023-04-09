# RC4 for GameMaker Studio 2

## Overview
This is a GML implementation of the RC4 encryption algorithm. 

## Requirements
GameMaker Studio 2022 or above / 2.3.7 or above

If you use 2.3.6 or below, please use [v1.0.0](https://github.com/dicksonlaw583/rc4/releases/tag/v1.0.0).

## Installation Instructions
Download the .yymps file from the [releases page](https://github.com/dicksonlaw583/rc4/releases).

## License
RC4 for GameMaker Studio 2 is licensed under the MIT License. You may freely use it in personal and commercial projects.

(C) Dickson Law 2020

## Examples

### Encrypting/Decrypting a Buffer
```
rc4(buffer, "mysecretkey", 0, buffer_get_size(buffer));
```

### Encrypting/Decrypting a String
```
ciphertext = rc4_encode_string(plaintext, "mysecretkey");
```
```
plaintext = rc4_decode_string(ciphertext, "mysecretkey")
```