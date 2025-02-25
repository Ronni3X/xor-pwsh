param(
    $infile,$outfile
)
$in = (resolve-path $infile).Path
$out = (pwd).Path + "\" + $outfile
$p = Read-Host "Password to (de)obf" -AsSecureString

$t = [System.IO.File]::ReadAllBytes($in);
$fstr = New-Object IO.FileStream($out,'Create');
$sha512 = [System.Security.Cryptography.SHA512]::Create()
$hashBytes = $sha512.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($p))
for($i=0;$i -lt $t.length; $i++){
    [byte]$tbyte = 0
    $ind = $i % $hashBytes.length
    if (($ind -eq 0) -and ($i -ne 0)){
        $hashBytes = $sha512.ComputeHash($hashBytes)
        $tbyte = $t[$i] -bxor $hashBytes[$ind]
    } else {
        $tbyte = $t[$i] -bxor $hashBytes[$ind]
    }
    $fstr.WriteByte($tbyte);
}
$fstr.Close();
