# PowerShell XOR Obfuscation Tool

A PowerShell script for performing XOR obfuscation on files using password-based key derivation.

## Features

- File-based XOR obfuscation/deobfuscation
- Password-based key generation using SHA-512
- Binary file handling

## Prerequisites

- PowerShell 5.1 or PowerShell Core 7.x
- Read/Write permissions in the working directory

## Usage

### File Obfuscation/Deobfuscation

```powershell
# Obfuscate or deobfuscate a file
./frox.ps1 -infile "secretfile.txt" -outfile "processed.bin"
```

## Parameters

- `-infile`: Path to the input file for obfuscation/deobfuscation
- `-outfile`: Path where the processed file will be saved

## Examples

```powershell
# Example 1: Obfuscate a text file
./frox.ps1 -infile "sensitive.txt" -outfile "secure.bin"

# Example 2: Deobfuscate an obfuscated file
./frox.ps1 -infile "secure.bin" -outfile "recovered.txt"
```

## Security Considerations

- XOR obfuscation is not cryptographically secure
- Suitable for basic data obfuscation only
- Not recommended for sensitive data protection
- Password management is crucial - same password needed for obfuscation/deobfuscation

## Notes

- The script automatically handles binary and text files
- Obfuscated files are saved in binary format
- The same password must be used for both obfuscation and deobfuscation
- Uses SHA-512 for password-based key derivation
