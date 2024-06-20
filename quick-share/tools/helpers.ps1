function Get-NearbyShareVersion() {
  $root   = 'HKLM:\SOFTWARE\Google\Update\Clients'
  $root64 = 'HKLM:\SOFTWARE\Wow6432Node\Google\Update\Clients'
  foreach ($r in $root,$root64) {
    # This is still not Quick Share on my PC
    $gcb = Get-ChildItem $r -ea 0 | Where-Object { (Get-ItemProperty $_.PSPath).name -eq 'Nearby Share' }
    if ($gcb) { return $gcb.GetValue('pv') }
  }
}