function Set-SSHagent {
  foreach ($item in (ssh-agent -c)) {
    $result = $item.Replace(';', '').Split(' ')
    if ($result[0] -eq "setenv") { 
      [System.Environment]::SetEnvironmentVariable($result[1], $result[2])
    }
    elseif ($result[0] -eq "echo") {
      Write-Output ($result[1..($result.Length - 1)] -join " ")
    }
    else { Write-Output "Something wrong!" }
  }
}
