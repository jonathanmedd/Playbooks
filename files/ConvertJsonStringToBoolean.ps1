$data = @'
{
    "Network": {
        "UpdateDNS": 'true',
        "UpdateGateway": 'false'
    }
}
'@

$config = $data | ConvertFrom-Json


$UpdateDNS = [System.Convert]::ToBoolean($config.Network.UpdateDNS)

$UpdateDNS.GetType()