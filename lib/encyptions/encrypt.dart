import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

class Encryter {
  static const String ENCRYPT_KEY = "qusasafo12345&!#";

  static Uint8List _processBlocks(BlockCipher cipher, Uint8List inp) {
    var out = Uint8List(inp.lengthInBytes);

    for (var offset = 0; offset < inp.lengthInBytes;) {
      var len = cipher.processBlock(inp, offset, out, offset);
      offset += len;
    }

    return out;
  }

  static String encypt(String text) {
    final key = Key.fromUtf8(ENCRYPT_KEY);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final bytes = encrypter.encrypt(text, iv: iv).bytes;
    // // var b = BytesBuilder();
    // // b.add(encrypter.encrypt(text, iv: iv).bytes);
    // // b.add(iv.bytes);
    // // final encrypted = encrypter.encrypt(text, iv: iv);

    //return iv.toString() + encrypter.encrypt(text, iv: iv).base64;
    Uint8List cipherIvBytes = Uint8List(bytes.length + iv.bytes.length)
      ..setAll(0, iv.bytes)
      ..setAll(iv.bytes.length, bytes);
    return base64.encode(cipherIvBytes);

    //   Uint8List cipherBytes = _processBlocks(cipher, paddedText);

    //   ..setAll(0, iv)
    //   ..setAll(iv.length, cipherBytes);

    // return base64.encode(cipherIvBytes);
  }

  static String encrypt2(String text) {
    var key = Uint8List.fromList(utf8.encode(
        ENCRYPT_KEY)); // ENCRYPT_KEY.by  Uint8List(32); // the 256 bit key
    var random = Random.secure();
    var params = Uint8List(18)
      ..[0] = 4
      ..[1] = 16;
    for (int i = 2; i < 18; i++) {
      params[i] = random.nextInt(256);
    }
    var iv = params.sublist(2);

    print("iv list ${iv.length} bytes");

    var cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESFastEngine()),
    )..init(
        true /*encrypt*/,
        PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
          ParametersWithIV<KeyParameter>(KeyParameter(key), iv),
          null,
        ),
      );
    // var plainBytes = utf8.encode(base64.encode(utf8.encode(text)));
    // var cipherText = cipher.process(Uint8List.fromList(utf8.encode(text)));
    //  return base64.encode(cipherText);
    // var b = BytesBuilder();
    // b.add(cipherText);
    // b.add(iv);
    // return base64.encode(b.toBytes());
    var plainBytes = utf8.encode(base64.encode(utf8.encode(text)));
    var cipherText = cipher.process(Uint8List.fromList(utf8.encode(text)));
    return base64.encode(cipherText);
  }

  static String? encrypt3(String text) {
    // if (encryptList(Uint8List.fromList(utf8.encode(text)) != null)) {
    //   return base64.encode(encryptList(Uint8List.fromList(utf8.encode(text)).));
    // }
    return null;
  }

  static final Uint8List _iv = Uint8List.fromList(
    <int>[
      0xda,
      0x39,
      0xa3,
      0xee,
      0x5e,
      0x6b,
      0x4b,
      0x0d,
      0x32,
      0x55,
      0xbf,
      0xef,
      0x95,
      0x60,
      0x18,
      0x90
    ],
  );
  static Uint8List? encryptList(Uint8List data) {
    final CBCBlockCipher cbcCipher = CBCBlockCipher(AESFastEngine());
    final ParametersWithIV<KeyParameter> ivParams =
        ParametersWithIV<KeyParameter>(
            KeyParameter(Uint8List.fromList(utf8.encode(ENCRYPT_KEY))), _iv);
    final PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>
        paddingParams =
        PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
            ivParams, null);

    final PaddedBlockCipherImpl paddedCipher =
        PaddedBlockCipherImpl(PKCS7Padding(), cbcCipher);
    paddedCipher.init(true, paddingParams);

    try {
      return paddedCipher.process(data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
