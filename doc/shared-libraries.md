Shared Libraries
================

## mochaconsensus

The purpose of this library is to make the verification functionality that is critical to Mocha's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `mochaconsensus.h` located in  `src/script/mochaconsensus.h`.

#### Version

`mochaconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`mochaconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `mochaconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/mocha/bips/blob/master/bip-0016.mediawiki)) subscripts
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/mocha/bips/blob/master/bip-0066.mediawiki)) compliance
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/mocha/bips/blob/master/bip-0147.mediawiki))
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/mocha/bips/blob/master/bip-0065.mediawiki))
- `mochaconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/mocha/bips/blob/master/bip-0112.mediawiki))

##### Errors
- `mochaconsensus_ERR_OK` - No errors with input parameters *(see the return value of `mochaconsensus_verify_script` for the verification status)*
- `mochaconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `mochaconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `mochaconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`

### Example Implementations
- [NBitcoin](https://github.com/NicolasDorier/NBitcoin/blob/master/NBitcoin/Script.cs#L814) (.NET Bindings)
- [node-libmochaconsensus](https://github.com/bitpay/node-libmochaconsensus) (Node.js Bindings)
- [java-libmochaconsensus](https://github.com/dexX7/java-libmochaconsensus) (Java Bindings)
- [mochaconsensus-php](https://github.com/Bit-Wasp/mochaconsensus-php) (PHP Bindings)
